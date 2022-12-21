import 'package:flutter/cupertino.dart';
import 'package:working_with_dio/data/models/first_model/transfer_model.dart';
import 'package:working_with_dio/data/repositories/transfer_repository.dart';

class TransferViewModel extends ChangeNotifier{
  TransferRepository transferRepository;
  TransferViewModel({required this.transferRepository});


  List? transferModels;
  int currentInfo=0;

  listenTransfers() async {
    transferModels = await transferRepository.getTransfers();
    notifyListeners();
  }

  changeInfo(int number){
    currentInfo=number;
    notifyListeners();
  }

}