class DepositModel {
  int? id;
  int? userId;
  String? description;
  String? type;
  String? amount;
  String? bank;
  String? status;
  String? deposit_date;
  DateTime? createdAt;
  DateTime? updatedAt;

  DepositModel({
    required this.id,
    required this.userId,
    required this.description,
    required this.type,
    required this.amount,
    required this.bank,
    required this.status,
    required this.deposit_date,
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
      'depositDate': deposit_date,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  DepositModel.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    userId = map["user_id"];
    description = map["description"];
    type = map["type"];
    amount = map["amount"];
    bank = map["bank"];
    status = map["status"];
    deposit_date = map["deposit_date"];
    createdAt = map["createdAt"];
    updatedAt = map["updatedAt"];
  }
}
