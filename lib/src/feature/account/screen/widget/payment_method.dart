
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/shared/bloc/index/index_bloc.dart';
import 'package:royal_landapp/src/shared/bloc/index/index_event.dart';
import 'package:royal_landapp/src/shared/bloc/indexing/indexing_bloc.dart';
import 'package:royal_landapp/src/shared/bloc/indexing/indexing_event.dart';

import '../../../../appLocalizations.dart';

List<Map> paymentMethodList = [
  {
    "name": "ABA",
    "image": "assets/icon/payment_method/aba.png",
    "description": "010601168 | Sim Sophea"
  },
  {
    "name": "Aceleda",
    "image": "assets/icon/payment_method/aceleda.png",
    "description": "010601168 | Sim Sophea"
  },
  {
    "name": "Phone Number (Wing,TrueMoney,eMoney)",
    "image": "assets/icon/payment_method/phone_transfer.jpg",
    "description": "010601168"
  }
];
Future<void> paymentMethodDialog(BuildContext c) async {
  return showDialog(
      context: c,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: Colors.white,
            content: Container(
              padding: EdgeInsets.all(15),
              //height: 500,
              width: MediaQuery.of(context).size.width - 30,
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(height: 5),
                  Text(
                    // 'chooseTransferMethod',
                    AppLocalizations.of(context)!
                        .translate("chooseTransfermethod")!,
                    textScaleFactor: 1,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Divider(
                      // height: 8,
                      ),
                  ...paymentMethodList
                      .map(
                        (data) => Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<IndexingBloc>(c).add(Tapped(
                                    index: paymentMethodList.indexOf(data)));
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                color: Colors.blue.withOpacity(0.2),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                //color: Colors.red,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image(
                                      height: 50,
                                      // width: 15,
                                      // height: 15,
                                      image: AssetImage(data["image"]),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data["name"],
                                            textScaleFactor: 0.9,
                                            maxLines: 2,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            data["description"],
                                            textScaleFactor: 0.9,
                                            maxLines: 2,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              height: 8,
                            )
                          ],
                        ),
                      )
                      .toList()
                ]),
              ),
            ));
      });
}
