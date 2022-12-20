import 'package:http/http.dart' as http;

class IpInfoPage {
  static Future<String?> getIPAdress() async {
    final url = Uri.parse('https://api.ipify.org');
    final response = await http.get(url);

    return response.statusCode == 200 ? response.body : null;
  }
}
