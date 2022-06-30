import 'dart:convert';

class TradesModel {
  int? id;
  int? userId;
  String? type;
  String? amount;
  String? pair;
  String? stoploss;
  String? closing_price;
  String? price;
  String? pip;
  String? p1;
  String? p1_eur;
  String? p1_usd;
  String? trade_date;
  String? trade_time;
  String? created_at;
  String? updated_at;

  TradesModel({
    required this.id,
    required this.userId,
    required this.type,
    required this.amount,
    required this.closing_price,
    required this.price,
    required this.p1,
    required this.p1_eur,
    required this.p1_usd,
    required this.pair,
    required this.pip,
    required this.stoploss,
    required this.trade_date,
    required this.trade_time,
    required this.created_at,
    required this.updated_at,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'type': type,
      'amount': amount,
      'closing_price': closing_price,
      'price': price,
      'p1': p1,
      'p1_eur': p1_eur,
      'p1_usd': p1_usd,
      'pair': pair,
      'pip': pip,
      'stoploss': stoploss,
      'trade_date': trade_date,
      'trade_time': trade_time,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  TradesModel.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    userId = map["user_id"];
    type = map["type"];
    amount = map["amount"];
    closing_price = map["closing_price"];
    price = map["price"];
    p1 = map["p1"];
    p1_eur = map["p1_eur"];
    p1_usd = map["p1_usd"];
    pair = map["pair"];
    pip = map["pip"];
    stoploss = map["stoploss"];
    trade_date = map["trade_date"];
    trade_time = map["trade_time"];
    created_at = map["created_at"];
    updated_at = map["updated_at"];
  }
}
