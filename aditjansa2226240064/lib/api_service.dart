import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      "https://data.bmkg.go.id/DataMKG/TEWS/autogempa.json";
  static const apiKey = "";

  Future<List<Map<String, dynamic>>> getAllBmkgs() async {
    final response = await http.get(Uri.parse("$baseUrl"));
    final data = json.decode(response.body);

    return List<Map<String, dynamic>>.from(data['results']);
  }
}
