// import 'dart:convert';
// import 'dart:developer';
// import 'package:http/http.dart' as http;
// import 'package:royal_landapp/src/feature/subscription/model/model_subscribtion.dart';

// class SubscriptionRepository {
//   Future<List<SubscriptionModel>> getnotification() async {
//     try {
//       print("company ");
//       http.Response response = await http.get(Uri.parse(
//           "http://loan.anakutjob.com/loan/anakut/public/api/notifications?row_per_page=12"));
//       if (response.statusCode == 200) {
//         //  log(response.body);
//         // print(response.body);

//         var data = json.decode(response.body);
//         List<SubscriptionModel> subscription = [];
//         data["data"].forEach((element) {
//           subscription.add(SubscriptionModel.fromJsom(element));
//         });
//         log(data["data"].length.toString());
//         return subscription;
//       } else {
//         throw Exception();
//       }
//     } catch (e) {
//       log(e.toString());
//       throw e;
//     }
//   }
// }
