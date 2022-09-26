

import 'dart:convert';

import 'package:http/http.dart';
import 'package:rootcart/model/ProductModel.dart';

import 'Api_client.dart';

class ProductApi {
  ApiClient apiClient = ApiClient();

  Future<List<ProductModel>> Product() async {
    String path = "/products";
    Response response = await apiClient.invokeApi(
        path: path, method: "GET", body: Null);
    return ProductModel.listFromJson(jsonDecode(response.body));

  }
}