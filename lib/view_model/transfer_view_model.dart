import 'package:flutter/cupertino.dart';
import 'package:working_with_dio/data/api_service/api_service.dart';
import 'package:working_with_dio/data/repositories/transfer_repository.dart';

class TransferViewModel extends ChangeNotifier{
  TransferRepository transferRepository;
  TransferViewModel({required this.transferRepository});


  List? transferModels;
  int currentInfo=0;
  String errorForUI = "";

  listenTransfers() async {
    MyResponse myResponse= await transferRepository.getTransfers();
    if (myResponse.error!.isEmpty) {
      transferModels = myResponse.data;
    } else {
      errorForUI = myResponse.error!;
    }
    notifyListeners();
  }

  changeInfo(int number){
    currentInfo=number;
    notifyListeners();
  }

}