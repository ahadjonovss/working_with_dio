import 'package:dio/dio.dart';
import 'package:working_with_dio/data/models/first_model/transfer_model.dart';
import 'package:working_with_dio/data/api_service/api_client.dart';

class ApiService extends ApiClient{

  Future<List?> getTransfers() async {
    try{
      print("Keldi");
      Response response= await dio.get("${dio.options.baseUrl}/transactions-expenses");
      if(response.statusCode==200){
        print(response.data);
        return response.data.map((e)=>TransferModel.fromJson(e)).toList();
      }
    } catch(e){
      print("Error");
      print(e.toString());
    }
  }
}