import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

customModal(context, List<String> option, Function(String) onChose) {
  TextEditingController valueCtl = TextEditingController();
  valueCtl.text = option[0];
  return showCupertinoModalPopup(
    semanticsDismissible: false,
    context: context,
    builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              border: Border(
                bottom: BorderSide(
                  color: Color(0xff999999),
                  width: 0.0,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CupertinoButton(
                  child: Text('Cancel'
                      // AppLocalizations.of(context).translate("cancel"),
                      ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 5.0,
                  ),
                ),
                CupertinoButton(
                  child: Text('Confirm'
                      // AppLocalizations.of(context).translate("confirm"),
                      ),
                  onPressed: () {
                    onChose(valueCtl.text);
                    Navigator.of(context).pop();
                  },
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 5.0,
                  ),
                )
              ],
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height / 3,
              color: Color(0xfff7f7f7),
              child: CupertinoPicker(
                itemExtent: 50,
                children: option
                    .map((option) => Center(
                          child: Text(option),
                        ))
                    .toList(),
                onSelectedItemChanged: (index) {
                  valueCtl.text = option[index];
                },
              ))
        ],
      );
    },
  );
}
