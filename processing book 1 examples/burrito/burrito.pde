/*
title: BurritoRecipe class example
description: create some tasty burritos
created: August 9, 2005
revised: March 10, 2006
October 23, 2006
by: Ira Greenberg
note: Enjoy and use plenty of guac.
*/
void setup(){
// create some burrito recipes
//use constructor 1
BurritoRecipe b1 = new BurritoRecipe();
b1.printRecipe();
//use constructor 2
BurritoRecipe b2 = new BurritoRecipe("spinach", "black", "chicken");
b2.printRecipe();
//use constructor 3
String[]tpgs = {"tomato", "lettuce", "corn"};
BurritoRecipe b3 = new BurritoRecipe("whole wheat", "pinto", 
"beef", tpgs , 8);
b3.printRecipe();
}
class BurritoRecipe {
// properties
int size;
String tortillaFlavor;
String meatType;
String beanType;
String[]toppings;
int salsaTemperature;
//3 constructors--default, basic, monster
//default burrito recipe constructor
BurritoRecipe (){
}
//regular burrito recipe constructor
BurritoRecipe (String tortillaFlavor, String beanType, 
String meatType){
//initialize properties
this.tortillaFlavor = tortillaFlavor;
this.beanType = beanType;
this.meatType = meatType;
}
//monster burrito recipe constructor(uuummmm)
BurritoRecipe (String tortillaFlavor, String beanType, 
String meatType, String[]toppings, int salsaTemperature){
//initialize properties
this.tortillaFlavor = tortillaFlavor;
this.beanType = beanType;
this.meatType = meatType;
this.toppings = toppings;
this.salsaTemperature = salsaTemperature;
}
//get/set methods
int getSize() {
return this.size;
}
void setSize(int size) {
this.size = size;
}
String getTortillaFlavor(){
return this.tortillaFlavor;
}
void setTortillaFlavor(String tortillaFlavor){
this.tortillaFlavor = tortillaFlavor;
}
String getMeatType(){
return this.meatType;
}
void setMeatType(String meatType){
this.meatType = meatType;
}
String getBeanType(){
return this.beanType;
}
void setBeanType(String beanType){
this.beanType = beanType;
}
String[] getToppings(){
return this.toppings;
}
void setToppings(String[] toppings){
this.toppings = toppings;
}
int getSalsa(int salsaTemperature){
return this.salsaTemperature;
}
void setSalsa(int salsaTemperature){
this.salsaTemperature = salsaTemperature;
}
void printRecipe(){
println("Burrito Recipe:");
println("---------------");
if (this.tortillaFlavor!=null){
println("Steam or lightly pan heat a " + this.tortillaFlavor + 
" tortilla.");
if (this.beanType!=null){
println("Sauté fresh onions, garlic, cilantro, slowly mixing in " + this.beanType + " beans and white wine.");
}
if (this.meatType!=null){
println("Grill " + this.meatType+" along with fresh green pepper, jalapeno pepper, chile pepper, onions and garlic.");
}
if (this.toppings!=null){
for (int i =0; i< toppings.length; i++){
println("Add " + toppings[i]+".");
}
}
if (this.salsaTemperature>0){
println("Finish off with a generous spritz of " + 
this.salsaTemperature+" alarm salsa.");
}
}
else {
println("Uh, you'll need to give me some ingredients\n" + 
"if you actually want me to produce a recipe.");
}
// go to next line after printing
// cooking instructions to the screen
println();
}
}