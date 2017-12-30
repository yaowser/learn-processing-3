int[][][] vals3D = new int[20][20][20];

  for(int i=0;i<vals3D.length;i++){
    for(int j=0;j<vals3D[i].length;j++){
      for(int k=0;k<vals3D[i].length;k++){
      vals3D[i][j][k]=int(random(100));
      println(vals3D[i][j][k]);
    }
  }
  }