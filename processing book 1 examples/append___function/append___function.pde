// type casting required
void setup(){
SimpleClass[] sc = {new SimpleClass(), new SimpleClass(), 
new SimpleClass()};
println("sc length before append = " + sc.length);
// I need to explicitely cast the returned Object array to a SimpleClass array
sc = ((SimpleClass[])append(sc, new SimpleClass()));
print("sc length after append = " + sc.length);
}
class SimpleClass{}