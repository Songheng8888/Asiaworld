import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:royal_landapp/src/feature/notification/bloc/index.dart';
import 'package:royal_landapp/src/feature/notification/model/notification_model.dart';
import 'package:royal_landapp/src/shared/widget/error_snackbar.dart';
import 'package:royal_landapp/src/shared/widget/standard_appbar.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationModel> notificationModel = [];
  NotificationBloc _notificationBloc = NotificationBloc();
  final RefreshController _refreshController = RefreshController();
  @override
  void initState() {
    _notificationBloc.add(InitailizeNotificationStarted(isRefresh: false));
    super.initState();
  }

  @override
  void dispose() {
    _notificationBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: standardAppBar(context, 'Notification'),
      body: Container(
        child: BlocConsumer(
            bloc: _notificationBloc,
            builder: (context, state) {
              if (state is InitailizingNotification) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ErrorFetchingNotification) {
                Navigator.pop(context);
                errorSnackBar(text: state.error.toString(), context: context);
              }
              return SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                controller: _refreshController,
                onLoading: () {
                  _notificationBloc.add(FetchNotificationStarted());
                },
                onRefresh: () {
                  _notificationBloc
                      .add(InitailizeNotificationStarted(isRefresh: true));
                },
                child: Container(
                  child: ListView.builder(
                      itemCount: _notificationBloc.notificationModel.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Container(
                            height: 110,
                            width: MediaQuery.of(context).size.width,
                            child: ListTile(
                              leading: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: Colors.indigo,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(30.0))),
                                child: IconButton(
                                    icon: Icon(
                                      CupertinoIcons.bell,
                                      size: 28,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {}),
                              ),
                              title: Text(
                                _notificationBloc
                                    .notificationModel[index].title,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                _notificationBloc
                                    .notificationModel[index].comment!,
                                style: TextStyle(fontSize: 18),
                              ),
                              trailing: Text(
                                _notificationBloc
                                    .notificationModel[index].date!,
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              );
            },
            listener: (context, state) {
              if (state is FetchedNotification) {
                _refreshController.loadComplete();
                _refreshController.refreshCompleted();
              }
              if (state is EndofNotificationList) {
                _refreshController.loadNoData();
              }
            }),
      ),
    );
  }
}
