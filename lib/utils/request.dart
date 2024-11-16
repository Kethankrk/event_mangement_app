import "package:http/http.dart" as http;

Future<http.Response?> getHelper(String url) async {
  try {
    const token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MX0.u2tVDnt_IxA1C3De2peypdja96HtAGzwwNT7AkvhgrU";
    return await http.get(Uri.parse("http://192.168.29.20:8000$url"),
        headers: {'Authorization': 'Bearer $token'});
  } catch (e) {
    print(e);
    return null;
  }
}
