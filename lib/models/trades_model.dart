import 'dart:convert';



class TradesModel {
  int? id;
  int? userId;
  String? description;
  String? type;
  String? amount;
  String? bank;
  String? status;
  DateTime? depositDate;
  DateTime? createdAt;
  DateTime? updatedAt;

  TradesModel({
    required this.id,
    required this.userId,
    required this.description,
    required this.type,
    required this.amount,
    required this.bank,
    required this.status,
    required this.depositDate,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'description': description,
      'type': type,
      'amount': amount,
      'bank': bank,
      'status': status,
      'depositDate': depositDate,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  TradesModel.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    userId = map["userId"];
    description = map["description"];
    type = map["type"];
    amount = map["amount"];
    bank = map["bank"];
    status = map["status"];
    depositDate = map["depositDate"];
    createdAt = map["createdAt"];
    updatedAt = map["updatedAt"];


  }
}
