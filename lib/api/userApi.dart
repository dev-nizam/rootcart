import 'dart:convert';

import 'package:http/http.dart';
import 'package:rootcart/api/Api_client.dart';
import 'package:rootcart/model/UserModel.dart';




class UserApi{
  ApiClient apiClient=ApiClient();
  Future<String>Login({required String password, required String email, required String name})async{
    print(email+password+name);
    String body1 = "{\"email\":\"$email\",\"password\":\"$password\",\"name\":\"$name\"}";

    String path="/login";
    print(body1);
    Response response=await apiClient.invokeApi(path: path, method: "POST", body: body1);
    return response.body;

  }
  Future<UserModel>signup({required String name,required String password, required String email})async{
    String path="/signup?email=$email&password=$password&name=$name";
    Response response=await apiClient.invokeApi(path: path, method: "POST", body: null);
    return UserModel.fromJson(jsonDecode(response.body));

  }
}