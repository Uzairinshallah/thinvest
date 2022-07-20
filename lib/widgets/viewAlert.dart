import 'package:flutter/material.dart';
import 'package:thinvest/Extras/colors.dart';
import 'package:thinvest/Extras/strings.dart';
import 'package:thinvest/models/trades_model.dart';


class ViewAlert extends StatefulWidget {
  TradesModel ? tradesModel;
  ViewAlert({Key? key, required this.tradesModel,}) : super(key: key);

  @override
  State<ViewAlert> createState() => _ViewAlertState();
}

class _ViewAlertState extends State<ViewAlert> {
  var screenWidth, screenHeight;

  @override
  Widget build(BuildContext context) {
    print(widget.tradesModel!.amount);
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: CColors.buttonOne,
        ),
        padding: EdgeInsets.all(15),
        child: const Text(
          'Details',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
      titlePadding: const EdgeInsets.all(0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leftText('User ID'),
              rightText(widget.tradesModel!.userId!.toString())
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leftText(AppStrings.type),
              rightText(widget.tradesModel!.type!, color: (widget.tradesModel!.type! == "B") ? CColors.green : Colors.red.withOpacity(.6))
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leftText(AppStrings.amount),
              rightText(widget.tradesModel!.amount!)
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leftText(AppStrings.pair),
              rightText(widget.tradesModel!.pair!)
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leftText(AppStrings.stopLoss),
              rightText(widget.tradesModel!.stoploss!)
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leftText(AppStrings.price),
              rightText(widget.tradesModel!.price!)
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leftText(AppStrings.cp),
              rightText(widget.tradesModel!.closing_price!)
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leftText(AppStrings.price_loss),
              rightText(widget.tradesModel!.p1!)
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leftText(AppStrings.pip),
              rightText(widget.tradesModel!.pip!)
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leftText('pl_usd'),
              rightText('${widget.tradesModel!.p1_usd!} \$', color: (widget.tradesModel!.type! == "B") ? CColors.green : Colors.red.withOpacity(.6)),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leftText('pl_eur'),
              rightText('${widget.tradesModel!.p1_eur!} €')
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leftText(AppStrings.time),
              rightText(widget.tradesModel!.trade_time!)
            ],
          ),
        ],
      ),
    );
  }

  Text rightText(String txt, {Color? color}) {
    color ??= CColors.textColor;
    return Text(
      txt,
      style: TextStyle(fontSize: 16, color: color),
    );
  }

  Text leftText(String txt) {
    return Text(
      txt,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.values[4]),
    );
  }
}
