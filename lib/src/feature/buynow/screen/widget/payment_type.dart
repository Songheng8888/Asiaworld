import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/shared/bloc/indexing/indexing_bloc.dart';
import 'package:royal_landapp/src/shared/bloc/indexing/indexing_event.dart';


class PaymentType extends StatelessWidget {
  const PaymentType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            // color: Theme.of(context).buttonColor,
            borderRadius:
                BorderRadius.all(Radius.circular(15))),
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: BlocBuilder<IndexingBloc, int>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Payment Type"),
                SizedBox(height: 15),
                Divider(
                  height: 0,
                ),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<IndexingBloc>(context).add(Tapped(index: 0));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        (BlocProvider.of<IndexingBloc>(context).state == 0)
                            ? Icon(Icons.radio_button_checked,
                                color: Theme.of(context).primaryColor)
                            : Icon(Icons.radio_button_unchecked,
                                color: Theme.of(context).primaryColor),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Case on delivery")
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<IndexingBloc>(context).add(Tapped(index: 1));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        (BlocProvider.of<IndexingBloc>(context).state == 1)
                            ? Icon(Icons.radio_button_checked,
                                color: Theme.of(context).primaryColor)
                            : Icon(Icons.radio_button_off,
                                color: Theme.of(context).primaryColor),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Transfer")
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
