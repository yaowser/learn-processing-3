// forum.Processing.org/two/discussion/16175/
// how-to-get-data-from-an-url-and-put-it-into-a-variable
 
// GoToLoop (2016-Apr-21)
 
static final String URL =
  "http://" + "WebRates.TrueFX.com" + "/rates/connect.html" + "?f=csv";
 
Table t;
 
void setup() {
  t = loadTable(URL, "csv");
  final int cols = t.getColumnCount();
 
  for (final TableRow r : t.rows()) {
    for (int i = 0; i < cols; ++i)  print(r.getString(i), TAB);
    println();
  }
 
  exit();
}