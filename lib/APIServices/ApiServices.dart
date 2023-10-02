import 'dart:convert';
import 'dart:convert' as JSON;
import 'package:http/http.dart' as http;

class ApiService {

  static var baseurl = "https://getdemo.in/hdfc-cpv/api/";

  Future callloginApi(Map<String, Object> jsonparam) async {
    final JsonParam = jsonEncode(jsonparam);
    var responseData;
    try {
      print(baseurl + "login");
      http.Response response = await http.post(Uri.parse(baseurl + "login"), body: JsonParam,
          headers: {"Content-Type": "application/json"});
      // responseData = JSON.jsonDecode(response.body.toString());
      final data = response.body;

      print("Login Response: + $data");
      return data;
    } catch (E) {
      print("Error" + E.toString());
    }
  }

  Future callPeningListApi(Map<String, Object> jsonparam,String token) async {

    final JsonParam = jsonEncode(jsonparam);
    var Dataresponse;
    try {
      print(baseurl + "");
      http.Response response = await http.post(
          Uri.parse(baseurl + ""),body: JsonParam,
          headers:{"Content-Type": "application/json",
            'Authorization': 'Bearer $token',
          } );

      Dataresponse = JSON.jsonDecode(response.body);
      print("Pening App List Response : " + response.body);
      return Dataresponse;

    } catch (E) {
      print("Error" + E.toString());
    }
  }

  Future callDashboardCountApi(Map<String, Object> jsonparam,String token) async {

    final JsonParam = jsonEncode(jsonparam);
    var Dataresponse;
    try {
      print(baseurl + "");
      http.Response response = await http.post(
          Uri.parse(baseurl + ""),body: JsonParam,
          headers:{"Content-Type": "application/json",
            'Authorization': 'Bearer $token',
          } );

      Dataresponse = JSON.jsonDecode(response.body);
      print("Dashboard App Count Response : " + response.body);
      return Dataresponse;

    } catch (E) {
      print("Error" + E.toString());
    }
  }



}