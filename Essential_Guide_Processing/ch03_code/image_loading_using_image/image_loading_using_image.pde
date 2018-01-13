/**
 * Image loading using image()
 * Requires: trinity.jpg image
 * in data directory.
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */
size(610, 450);
PImage img = loadImage("trinity.jpg");
image(img, 0, 0);
