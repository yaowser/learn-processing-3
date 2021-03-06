public class Matrix4 {

	public enum Projection {
		ORTHOGONAL, PERSPECTIVE
	}

	public float[] data = new float[16];

	// cstr
	public Matrix4() {
	}
	
	public Matrix4(int flag) {
		if (flag==1){
			data  = new float[]{1,0,0,0,  0,1,0,0,  0,0,1,0,  0,0,0,1};
		}
	}

	// cstr
	public Matrix4(float[] data) {
		// assign reference
		this.data = data;
	}

	// cstr
	public Matrix4(float[] r1, float[] r2, float[] r3, float[] r4) {
		data[0] = r1[0];
		data[1] = r1[1];
		data[2] = r1[2];
		data[3] = r1[3];

		data[4] = r2[0];
		data[5] = r2[1];
		data[6] = r2[2];
		data[7] = r2[3];

		data[8] = r3[0];
		data[9] = r3[1];
		data[2] = r3[2];
		data[10] = r3[3];

		data[11] = r4[0];
		data[12] = r4[1];
		data[13] = r4[2];
		data[14] = r4[3];
	}

	public Matrix4 add(Matrix4 m) {
		Matrix4 t = new Matrix4();
		for (int i = 0; i < data.length; ++i) {
			t.data[i] = data[i] + m.data[i];
		}
		return t;
	}

	// this*m
	public Matrix4 mult(Matrix4 m) {
		Matrix4 t = new Matrix4();
		int a = 0;
		for(int i=0; i<4; ++i){
			a = 4*i;
			for(int j=0; j<4; ++j){
				t.data[a+j] = data[a]*m.data[j] + data[a+1]*m.data[4+j] + data[a+2]*m.data[8+j] + data[a+3]*m.data[12+j];
			}
		}
		return t;
	}

	// assume column major vector
	public Vector4 mult(Vector4 v) {
		// post mult
		float x = data[0] * v.x + data[1] * v.y + data[2] * v.z + data[3] * v.w;
		float y = data[4] * v.x + data[5] * v.y + data[6] * v.z + data[7] * v.w;
		float z = data[8] * v.x + data[9] * v.y + data[10] * v.z + data[11] * v.w;
		float w = data[12] * v.x + data[13] * v.y + data[14] * v.z + data[15] * v.w;
		
		return new Vector4(x, y, z, w);
	}

	public void mult(float s) {
		for (int i = 0; i < data.length; ++i) {
			data[i] *= s;
		}
	}

	public void invert() {
		mult(-1);
	}

	public void transpose() {
		Matrix4 mt = new Matrix4();
		for (int i = 0; i < 4; ++i) {
			for (int j = 0; j < 4; ++j) {
				mt.data[i + j * 4] = data[4 * i + j];
			}
		}
		data = mt.data;
	}

	//http://www.opengl.org/sdk/docs/man2/xhtml/gluPerspective.xml
	public static Matrix4 getPerspective(float fov, float aspect, float near, float far){
	    // f = cotangent (fov/2)
		float f = (float)(1.0/Math.tan((fov*Math.PI/180)/2));

		float[] data = { 
				f/aspect, 0, 0, 0,
				0, f, 0, 0,
				0, 0, (far+near)/(near-far), (2*far*near)/(near-far),
				0, 0, -1, 0
		};

		return new Matrix4(data);
	}
	
	public static Matrix4 getLookAt(Vector3 eye, Vector3 center, Vector3 up) {
		/*
		 * Originally from:
		 * http://publib.boulder.ibm.com/infocenter/pseries/v5r3
		 * /index.jsp?topic=/com.ibm.aix.opengl/doc/openglrf/gluLookAt.htm The
		 * matrix M generated by the OpenGL could be computed as follows:
		 * 
		 * eye = 3d column vector (eyeX, eyeY, eyeZ)
		 * center = 3d column vector (centerX, centerY, centerZ)
		 * up = 3d column vector (upX, upY, upZ) 
		 * Compute f = center - eye 
		 * Normalize f 
		 * Compute s = f x up
		 * Normalize s
		 * Compute u = s x f
		 * (s, 0), (u, 0), (-f, 0), (-eye,1) (all column vectors)
		 */

		Vector3 f = new Vector3();
		f.setTo(center);
		f.sub(eye);
		f.normalize();
		
		Vector3 s = f.cross(up);
		s.normalize();
		
		Vector3 u = s.cross(f);

// GLM implementation
		
	float[] data = { 
			s.x, u.x, -f.x, 0,
			s.y, u.y, -f.y, 0,
			s.z, u.z, -f.z, 0,
			-s.dot(eye), -u.dot(eye), f.dot(eye), 1 };
		
		return new Matrix4(data);
	}

	// refer to: http://www.songho.ca/opengl/gl_projectionmatrix.html
	// In GL this handles frustum culling and conversion to normalized device
	// coordinate
	// we're not doing any actual culling
	// l-r, bot-top,near-far all in range -1 to 1
	// BUT near and far only accept pos value.
	public static Matrix4 getFrustum(float left, float right, float bottom,
			float top, float near, float far, Projection p) {
		Matrix4 m;
		if (p == Projection.ORTHOGONAL) {
			float[] data = { 
					2 / (right - left), 0, 0, -(right + left) / (right - left), 
					0, 2 / (top - bottom), 0, -(top + bottom) / (top - bottom), 
					0, 0, -2 / (far - near), -(far + near) / (far - near), 
					0, 0, 0, 1 };
			return new Matrix4(data);
		}
		// perspective
		float[] data = { 
				2 * near / (right - left), 0, (right + left) / (right - left), 0, 
				0, 2 * near / (top - bottom), (top + bottom) / (top - bottom), 0,
				0, 0, -(far + near) / (far - near), -1, 
				0, 0, -2 * far * near / (far - near), 0 };
		return new Matrix4(data);

	}

	public static Matrix4 getIdentity() {
		return new Matrix4(new float[] { 
				1, 0, 0, 0, 
				0, 1, 0, 0, 
				0, 0, 1, 0, 
				0, 0, 0, 1 });
	}

	public static Matrix4 getScale(Vector3 v) {
		return new Matrix4(new float[] { 
				v.x, 0, 0, 0, 
				0, v.y, 0, 0, 
				0, 0, v.z, 0, 
				0, 0, 0, 1 });
	}

	// inefficient since it always assumes rot around all 3 axes
	public static Matrix4 getRotate(Vector3 v) {
		// column major
		Matrix4 mx = new Matrix4(new float[] { 
				1, 0, 0, 0, 
				0, (float) Math.cos(v.x), (float) -Math.sin(v.x), 0, 
				0, (float) Math.sin(v.x), (float) Math.cos(v.x), 0, 
				0, 0, 0, 1 });
		//mx.printMatrix("MX");

		Matrix4 my = new Matrix4(new float[] { 
				(float) Math.cos(v.y), 0, (float) Math.sin(v.y), 0, 
				0, 1, 0, 0, 
				(float) -Math.sin(v.y), 0, (float) Math.cos(v.y), 0, 
				0, 0, 0, 1 });
		//my.printMatrix("MY");

		Matrix4 mz = new Matrix4(new float[] { 
				(float) Math.cos(v.z), (float) -Math.sin(v.z), 0, 0, 
				(float) Math.sin(v.z), (float) Math.cos(v.z), 0, 0, 
				0, 0, 1, 0, 
				0, 0, 0, 1 });
		//mz.printMatrix("MZ");

		Matrix4 rotXYZ = new Matrix4();
		rotXYZ = mx.mult(my);
		rotXYZ = rotXYZ.mult(mz);
		return rotXYZ;
	}

	public static Matrix4 getTranslate(Vector3 v) {
		return new Matrix4(new float[] { 
				1, 0, 0, v.x, 
				0, 1, 0, v.y, 
				0, 0, 1, v.z, 
				0, 0, 0, 1 });
	}
	
	public Matrix4 getTranslate() {
		return new Matrix4(new float[] { 
				1, 0, 0, data[3], 
				0, 1, 0, data[7], 
				0, 0, 1, data[11], 
				0, 0, 0, 1 });
	}
	

	public void printMatrix(String name) {
		System.out.println(name + " Matrix");
		System.out.print("===========================");
		for (int i = 0; i < data.length; ++i) {
			if (i % 4 == 0) {
				System.out.println("");
			}
			System.out.print(data[i] + "   ");
		}
		System.out.println("\n===========================");
	}
	
	public void printMatrix() {
		for (int i = 0; i < data.length; ++i) {
			if (i % 4 == 0) {
				System.out.println("");
			}
			System.out.print(data[i] + "   ");
		}
	}
	
	// clone matrix
	public void setTo(Matrix4 m){
		for (int i=0; i<data.length; ++i) {
			data[i] = m.data[i];
		}
	}
	
	public Matrix4 getCopy(Matrix4 m){
		Matrix4 n = new Matrix4();
		for (int i=0; i<data.length; ++i) {
			n.data[i] = m.data[i];
		}
		return n;
	}
	
	// return top 3x3 matrix (no tranlation vlues)
	public Matrix4 getMat3(){
		return new Matrix4(new float[]{data[0], data[1], data[2], 0, data[4], data[5], data[6], 0, data[8], data[9], data[10], 0,data[12], data[13], data[14], 1});
	}
	
	public void project(){
		
	}
	

}
