String inputTextFile = "Obama.txt";
WordFreq table;
void setup() {
// Input and parse text file
String [] fileContents = loadStrings(inputTextFile);
String rawText = join(fileContents, " ").toLowerCase();
String [] tokens;
String delimiters = " ,./?<>;:'\"[{]}\\|=+-_()*&^%$#@!~";
tokens = splitTokens(rawText, delimiters);
println(tokens.length+" tokens found in file: "+inputTextFile);
// Create the word frequency table
table = new WordFreq(tokens);
table.tabulate();
println("Max frequency:"+table.maxFreq());
} // setup()