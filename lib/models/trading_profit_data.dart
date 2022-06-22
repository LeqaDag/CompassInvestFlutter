
// ignore_for_file: non_constant_identifier_names
class TradingProfitData {
  late String? uid;
  late String user_id;
  late String trade_id;
  late double? profit;
  late double? profit_percentage;
  late bool? archive;
  late DateTime created_at;
  late String? image;

  TradingProfitData(
      {this.uid,
      required this.user_id,
      required this.trade_id,
      required this.profit,
      this.profit_percentage,
      this.archive = false,
      this.image,
      required this.created_at});
}