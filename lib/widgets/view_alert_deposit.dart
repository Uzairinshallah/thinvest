import 'package:flutter/material.dart';
import 'package:thinvest/Extras/colors.dart';
import 'package:thinvest/Extras/strings.dart';
import 'package:thinvest/models/deposit_model.dart';
import 'package:thinvest/models/trades_model.dart';


class ViewAlertDeposit extends StatefulWidget {
  DepositModel ? depositModel;
  ViewAlertDeposit({Key? key, required this.depositModel,}) : super(key: key);

  @override
  State<ViewAlertDeposit> createState() => _ViewAlertDepositState();
}

class _ViewAlertDepositState extends State<ViewAlertDeposit> {
  var screenWidth, screenHeight;

  @override
  Widget build(BuildContext context) {
    print(widget.depositModel!.amount);
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
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
              leftText('ID'),
              rightText(widget.depositModel!.id!.toString())
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leftText('User ID'),
              rightText(widget.depositModel!.userId!.toString())
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leftText(AppStrings.type),
              rightText(widget.depositModel!.type!)
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leftText(AppStrings.amount),
              rightText(widget.depositModel!.amount!)
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leftText('Deposit Date'),
              rightText(widget.depositModel!.deposit_date!)
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leftText('Bank'),
              rightText(widget.depositModel!.bank!)
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leftText(AppStrings.description),
              Expanded(child: Text(widget.depositModel!.description!, textAlign: TextAlign.end,maxLines: 2, style : TextStyle(fontSize: 16, color: CColors.textColor)))
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leftText(AppStrings.status),
              rightText((widget.depositModel!.status! == '1') ? 'Received' : 'In Progress', color: (widget.depositModel!.status! == "1") ? CColors.green : Colors.red.withOpacity(.6))
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
