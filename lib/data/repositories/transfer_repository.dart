import 'package:working_with_dio/data/api_service/api_service.dart';

class TransferRepository{
  ApiService simpleApiService;
  TransferRepository({required this.simpleApiService});

  getTransfers()=> simpleApiService.getTransfers();
}