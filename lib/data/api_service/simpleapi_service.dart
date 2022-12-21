import 'package:dio/dio.dart';
import 'package:working_with_dio/data/models/first_model/transfer_model.dart';

class SimpleApiService{
  Dio dio=Dio();

  Future<List?> getTransfers() async {
    try{
      print("Keldi");
      Response response= await dio.get("https://banking-api.free.mockoapp.net/transactions-expenses");
      if(response.statusCode!>=200){
        print(response.data);
        return response.data.map((e)=>TransferModel.fromJson(e)).toList();
      }
    } catch(e){
      print("Error");
      print(e.toString());
    }
  }
}