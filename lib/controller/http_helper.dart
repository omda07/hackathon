
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class HttpHelper {
  final String baseUrl = "https://odc-app.herokuapp.com/api";

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    return await http.post(Uri.parse('https://odc-app.herokuapp.com/api$url'),
        body: data, headers: {'x-auth-token': token ?? ''});

  }

  static Future<http.Response> getData({
    required String url,
    Map<String, dynamic>? query,
     Map<String, dynamic>? data,
    String? token,
  }) async {
    return http.get(Uri.parse('https://odc-app.herokuapp.com/api$url'),headers: {'x-auth-token':token ?? ''});
  }

  static Future<http.Response> putData({
    required String url,
    Map<String, dynamic>? query,
     Map<String, dynamic>? data,
    String? token,
  }) async {
    return http.put(Uri.parse('https://odc-app.herokuapp.com/api$url'),
        body: data, headers: {'x-auth-token': token ?? ''});
  }
}
