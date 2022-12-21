import 'package:working_with_dio/data/models/first_model/transferinfo_model.dart';

class TransferModel {
  String transfer_date;
  List<TransferInfoModel> data;

  TransferModel({required this.data, required this.transfer_date});

  factory TransferModel.fromJson(Map<String, dynamic> json) {
    return TransferModel(
      data: json["data"].map((e)=>TransferInfoModel.fromJson(e)),
      transfer_date: json["transfer_date"]??"",
    );
  }
}
