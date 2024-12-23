import "dart:convert";

import "package:http/http.dart" as http;

Future<http.Response?> secureGetHelper(String url) async {
  try {
    const token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MX0.u2tVDnt_IxA1C3De2peypdja96HtAGzwwNT7AkvhgrU";
    return await http.get(Uri.parse("https://plan-it-backend.vercel.app$url"),
        headers: {'Authorization': 'Bearer $token'});
  } catch (e) {
    print(e);
    return null;
  }
}

Future<http.Response> getHelper(String url) async {
  return await http.get(Uri.parse("http://192.168.29.214:8000$url"));
}

Future<http.Response> postHelper(String url, Map<String, dynamic> body) async {
  return await http.post(Uri.parse("http://192.168.29.214:8000$url"),
      body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
}
