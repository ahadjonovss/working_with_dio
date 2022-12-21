import 'package:working_with_dio/data/models/first_model/reciever_model.dart';

class TransferInfoModel {
  num transaction_code;
  String date;
  int expense_id;
  num amount;
  int card_id;
  RecieverModel receiver;

  TransferInfoModel(
      {required this.amount,
      required this.card_id,
      required this.date,
      required this.expense_id,
      required this.receiver,
      required this.transaction_code});

  factory TransferInfoModel.fromJson(Map<String, dynamic> json) {
    return TransferInfoModel(
      amount: json["amount"] ?? 0,
      card_id: json["card_id"] ?? 1,
      date: json["date"] ?? "",
      expense_id: json["expense_id"] ?? 0,
      receiver: RecieverModel.fromJson(json["receiver"] ?? {}),
      transaction_code: json["transaction_code"] ?? 0,
    );
  }
}
