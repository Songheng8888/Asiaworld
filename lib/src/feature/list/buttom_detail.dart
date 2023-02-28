import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:royal_landapp/src/constants/app_constant.dart';
import 'package:royal_landapp/src/feature/buynow/screen/buynow_page.dart';
import 'package:royal_landapp/src/feature/installment/screen/monthly_pay_page.dart';
import 'package:royal_landapp/src/feature/property/model/property_model.dart';

class ButtomDetailPage extends StatefulWidget {
  // const ButtomDetailPage({Key? key}) : super(key: key);
  final PropertyModel? listDeatail;
  ButtomDetailPage({this.listDeatail});

  @override
  _ButtomDetailPageState createState() => _ButtomDetailPageState();
}

class _ButtomDetailPageState extends State<ButtomDetailPage> {
  String dropdownValue = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      height: 70,
      width: double.infinity,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 160,
              height: 50,
              child: FlatButton(
                  color: app_color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => MonthlyPayment()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "បង់រំលោះ",
                        textScaleFactor: 1.2,
                        style: TextStyle(color: Colors.white, fontFamily: 'kh'),
                      )
                    ],
                  )),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 160,
              height: 50,
              child: FlatButton(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BuyNowPage(
                                listDeatail: widget.listDeatail!,
                              )));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "បងផ្តាច់",
                      textScaleFactor: 1.2,
                      style: TextStyle(color: Colors.white, fontFamily: 'kh'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
