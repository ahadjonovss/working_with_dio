import 'package:working_with_dio/data/api_service/simpleapi_service.dart';

class TransferRepository{
  SimpleApiService simpleApiService;
  TransferRepository({required this.simpleApiService});

  getTransfers()=> simpleApiService.getTransfers();
}