class Octopus {
  int[] octopi = new int[100];
  Octopus(){
  }
  
  Octopus(int[] octopi){
    this.octopi = octopi;
    for(int i=0;i<octopi.length-1;i++){
      octopi[i]=i;
    }
    
  }
}