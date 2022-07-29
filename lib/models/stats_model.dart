class StatsModel {
  String? thisMonthProfitLoss;
  String? profitLoss;
  String? profitLossUsd;
  int? profitLossPercentage;
  String? profitShare;
  String? profitShareNet;
  String? totalDeposit;
  String? equity;
  String? startCap;

  StatsModel({
    required this.thisMonthProfitLoss,
    required this.equity,
    required this.profitLoss,
    required this.profitLossPercentage,
    required this.profitLossUsd,
    required this.profitShare,
    required this.profitShareNet,
    required this.startCap,
    required this.totalDeposit,
  });

  Map<String, dynamic> toMap() {
    return {
      'this_month_profit_loss': thisMonthProfitLoss,
      'profitloss': profitLoss,
      'profitloss_usd': profitLossUsd,
      'profitloss_percentage': profitLossPercentage,
      'profitshare': profitShare,
      'profitshare_net': profitShareNet,
      'total_deposit': totalDeposit,
      'equity': equity,
      'startcap': startCap,
    };
  }

  StatsModel.fromMap(Map<String, dynamic> map) {
    thisMonthProfitLoss = map["this_month_profit_loss"];
    profitLoss = map["profitloss"];
    profitLossUsd = map["profitloss_usd"];
    profitLossPercentage = map["profitloss_percentage"];
    profitShare = map["profitshare"];
    profitShareNet = map["profitshare_net"];
    totalDeposit = map["total_deposit"];
    equity = map["equity"];
    startCap = map["startcap"];
  }
}
