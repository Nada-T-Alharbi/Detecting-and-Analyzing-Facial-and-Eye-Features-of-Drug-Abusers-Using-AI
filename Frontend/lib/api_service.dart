import 'dart:convert' show jsonDecode;
import 'dart:io';
import 'package:http/http.dart' as http;


class ApiService {
  static const String _baseUrl = 'http://10.0.2.2:5000';

  Future<Map<String, dynamic>> detectObjects(
      File image, int selectedIndex) async {
    final request =
        http.MultipartRequest('POST', Uri.parse('$_baseUrl/api/detect'));
    request.files.add(await http.MultipartFile.fromPath('image', image.path));
    request.fields['selectedIndex'] = selectedIndex.toString();

    final response = await request.send();

    if (response.statusCode == 200) {
      return jsonDecode(await response.stream.bytesToString());
    } else {
      throw Exception('Failed to detect objects');
    }
  }
}
