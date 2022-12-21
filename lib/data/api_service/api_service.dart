import 'package:dio/dio.dart';
import 'package:working_with_dio/data/models/first_model/transfer_model.dart';
import 'package:working_with_dio/data/api_service/api_client.dart';

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
}
