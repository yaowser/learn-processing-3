
Engine e;


void setup () {
  size(400,400);
  Character[] cs = new Character[100];
  for(int i =0;i<100;i++){
    if(i%2==0){
      cs[i] = new Elf();
    }else{
      cs[i] = new Giant();
    }
  }
  
  e = new Engine(cs);
  Playable p1= new Elf();
  
  
  
}