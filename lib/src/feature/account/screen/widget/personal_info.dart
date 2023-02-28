import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:royal_landapp/src/feature/account/model/acc_model.dart';
import 'package:royal_landapp/src/feature/account/screen/edit_profile_page.dart';
import 'package:royal_landapp/src/utils/share/appbar.dart';

class PersonalInfo extends StatefulWidget {
  final AccountModel accountModel;
  const PersonalInfo({required this.accountModel});

  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          AspectRatio(
            aspectRatio: 1,
            child: InkWell(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (con) => EditProfilePage(
                //             accountModel: widget.accountModel)));
              },
              child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.redAccent[100],
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Icon(Icons.edit_outlined)),
            ),
          ),
          // InkWell(
          //   onTap: () {

          //   },
          //   child: Container(
          //     width: 30,
          //     height: 30,
          //     decoration: BoxDecoration(
          //         color: Colors.blueAccent,
          //         borderRadius: BorderRadius.circular(50)),

          //     padding: EdgeInsets.all(10),
          //     // margin: EdgeInsets.only(top: statusBarHeight, right: 0, left: 0),
          //     child: Center(
          //       child: Icon(
          //         Icons.edit_outlined,
          //         color: Colors.black,
          //       ),
          //     ),
          //   ),
          // ),
          // IconButton(
          //     icon: Icon(Icons.edit_outlined, color: Colors.black),
          //     onPressed: () {})
        ],
        centerTitle: true,
        title: Text(
          "Personal Info",
          style:
              TextStyle(color: Colors.black, fontFamily: 'BattambangRegular'),
          textScaleFactor: 1.1,
        ),
      ),
      body: ListView(
        children: [
          _buildTitle(title: "Top skill & other skills"),
          _buildDescription(
              title: widget.accountModel.skills == null
                  ? "No Data"
                  : "${widget.accountModel.skills}"),
          _buildTitle(title: "Education"),
          _buildDescription(
              title: widget.accountModel.educations == null
                  ? "No Data"
                  : "${widget.accountModel.educations}"),
          _buildTitle(title: "Experiences"),
          _buildDescription(
              title: widget.accountModel.experiences == null
                  ? "No Data"
                  : "${widget.accountModel.experiences}"),
        ],
      ),
    );
  }

  _buildTitle({required String title}) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
        textScaleFactor: 1.3,
      ),
    );
  }

  _buildDescription({required String title}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0, left: 8.0, right: 8.0, top: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[400]!),
        borderRadius: BorderRadius.circular(6.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 3,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(title),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Container(
            //       child: Row(
            //         children: [
            //           CupertinoButton(
            //               padding: EdgeInsets.all(10.0),
            //               color: Colors.indigo,
            //               child: Row(
            //                 children: [
            //                   Icon(Icons.edit_outlined),
            //                 ],
            //               ),
            //               onPressed: () {
            //                 // Navigator.push(
            //                 //     context,
            //                 //     MaterialPageRoute(
            //                 //         builder: (con) => EducationPage()));
            //               }),
            //           SizedBox(
            //             width: 4.0,
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
