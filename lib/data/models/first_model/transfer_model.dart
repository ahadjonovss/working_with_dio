import 'dart:convert';

List<TransferModel> transferModelFromJson(String str) => List<TransferModel>.from(json.decode(str).map((x) => TransferModel.fromJson(x)));

String transferModelToJson(List<TransferModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransferModel {
  TransferModel({
    required this.transferDate,
    required this.data,
  });

  DateTime transferDate;
  List<Datum> data;

  factory TransferModel.fromJson(Map<String, dynamic> json) => TransferModel(
    transferDate: DateTime.parse(json["transfer_date"]),
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "transfer_date": "${transferDate.year.toString().padLeft(4, '0')}-${transferDate.month.toString().padLeft(2, '0')}-${transferDate.day.toString().padLeft(2, '0')}",
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.transactionCode,
    required this.date,
    required this.expenseId,
    required this.amount,
    required this.cardId,
    required this.receiver,
  });

  int transactionCode;
  DateTime date;
  int expenseId;
  num amount;
  int cardId;
  Receiver receiver;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    transactionCode: json["transaction_code"],
    date: DateTime.parse(json["date"]),
    expenseId: json["expense_id"],
    amount: json["amount"],
    cardId: json["card_id"],
    receiver: Receiver.fromJson(json["receiver"]),
  );

  Map<String, dynamic> toJson() => {
    "transaction_code": transactionCode,
    "date": date.toIso8601String(),
    "expense_id": expenseId,
    "amount": amount,
    "card_id": cardId,
    "receiver": receiver.toJson(),
  };
}

class Receiver {
  Receiver({
    required this.brandImage,
    required this.name,
    required this.location,
  });

  String brandImage;
  String name;
  String location;

  factory Receiver.fromJson(Map<String, dynamic> json) => Receiver(
    brandImage: json["brand_image"],
    name: json["name"],
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "brand_image": brandImage,
    "name": name,
    "location": location,
  };
}
