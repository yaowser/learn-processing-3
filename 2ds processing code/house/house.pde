void setup(){
   size(800,600);
   background(255);
   
   //house dimensions
   float housewidth = width *.8;
   float househeight = height *.6;
   float deltawidth = width -housewidth;
   float deltaheight = height -househeight;
   
   //triangle
   float x0=deltawidth/2, y0=deltaheight;
   float x1=width/2, y1=0;
   float x2=deltawidth/2+housewidth, y2=deltaheight;
   
   float doorwidth = housewidth * .1;
   float doorheight = househeight * .4;
   
     
   //draw base
   strokeWeight(5);
   noStroke();
   fill(100,50,10);
   rect(deltawidth/2,deltaheight,housewidth,househeight);
   
   //draw roof
   fill(40,10,40);
   triangle(x0,y0,x1,y1,x2,y2);
   
   //draw door
   fill(200, 5, 7);
   rect(width/2-doorwidth/2,height - doorheight,doorwidth,doorheight);
   
   
}