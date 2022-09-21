import 'dart:convert';

import 'package:http/http.dart';
import 'package:rootcart/api/Api_client.dart';




class UserApi{
  ApiClient apiClient=ApiClient();
  Future<String>Login({required String password, required String email})async{
    String path="/login";
    Response response=await apiClient.invokeApi(path: path, method: "POST", body: null);
    return response.body;

  }
}