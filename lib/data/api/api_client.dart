import 'package:http/http.dart' as http;

class APIClient {
  Future<http.Response> getData(URL) async {
    final response = await http.get(URL);
    return response;
  }

  Future<http.Response> PostData(URL, data) async {
    final response = await http.post(URL, body: data);
    return response;
  }
}
