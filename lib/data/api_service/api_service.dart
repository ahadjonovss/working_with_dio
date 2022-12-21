import 'package:dio/dio.dart';
import 'package:working_with_dio/data/models/first_model/transfer_model.dart';
import 'package:working_with_dio/data/api_service/api_client.dart';
import 'package:working_with_dio/data/models/second_model/category_model.dart';

class MyResponse {
  String error;
  dynamic data;
  MyResponse({this.data, required this.error});
}

class ApiService extends ApiClient {
  Future<MyResponse> getTransfers() async {
    MyResponse myResponse=MyResponse(error: "");
    try {
      print("Keldi");
      Response response =
          await dio.get("${dio.options.baseUrl}/transactions-expenses");
      if (response.statusCode == 200) {
        myResponse.data = response.data.map((e) => TransferModel.fromJson(e)).toList();
      }
    } catch (e) {
      myResponse.error = e.toString();
    }
    return myResponse;
  }

  Future<MyResponse> getCategories() async {
    MyResponse myResponse=MyResponse(error: "");
    try {
      print("Keldi");
      Response response =
      await dio.get("${dio.options.baseUrl}/income-types");
      if (response.statusCode == 200) {
        myResponse.data = response.data.map((e) => CategoryModel.fromJson(e)).toList();
      }
    } catch (e) {
      myResponse.error = e.toString();
    }
    return myResponse;
  }
}
