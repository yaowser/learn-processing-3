// Sketch 7-1: Parsing an input text file
String inputTextFile = "Obama.txt";
String [] fileContents;
String rawText;
String tokens[];
String delimiters = " ,./?<>;:'\"[{]}\\|=+-_()*&^%$#@!~";
// Input and parse text file
fileContents = loadStrings(inputTextFile);
rawText = join(fileContents, " ");
rawText = rawText.toLowerCase();
tokens = splitTokens(rawText, delimiters);
// print out the list of tokens
println(tokens.length+" tokens found in file: "+inputTextFile);
for (int i=0; i < tokens.length ; i++) {
println(tokens[i]);
}