// Sketch: 7-9: Computing word frequencies using WordFreq & Word
String inputTextFile = "Obama.txt";
WordFreq table;
int N = 150; // The number of words to be displayed
void setup() {
// Input and parse text file
String [] fileContents = loadStrings(inputTextFile);
String rawText = join(fileContents, " ");
rawText = rawText.toLowerCase();
String [] tokens;
String delimiters = " ,./?<>;:'\"[{]}\\|=+-_()*&^%$#@!~";
tokens = splitTokens(rawText, delimiters);
println(tokens.length+" tokens found in file: "+inputTextFile);
// Create the word frequency table
table = new WordFreq(tokens);
table.tabulate(N);
println("Max frequency:"+table.maxFreq());
} // setup()