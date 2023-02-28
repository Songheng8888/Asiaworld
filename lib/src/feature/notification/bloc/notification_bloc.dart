import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/feature/notification/model/notification_model.dart';

import 'package:royal_landapp/src/feature/notification/res/notification_repository.dart';

import 'index.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(InitailizingNotification());
  List<NotificationModel> notificationModel = [];
  NotificationRepository notificationRepository = NotificationRepository();
  int page = 1;
  int rowperpage = 12;
  @override
  Stream<NotificationState> mapEventToState(NotificationEvent event) async* {
    if (event is InitailizeNotificationStarted) {
      yield InitailizingNotification();
      try {
        page = 1;
        notificationModel.clear();
        List<NotificationModel> _temList = await notificationRepository
            .getnotification(page: 1, rowperpage: rowperpage);
        notificationModel.addAll(_temList);
        page++;
        if (event.isRefresh == true) {
          yield FetchedNotification();
        } else {
          yield InitailizedNotification();
        }
      } catch (e) {
        yield ErrorFetchingNotification(error: e.toString());
      }
    }
    if (event is FetchNotificationStarted) {
      yield FetchingNotification();
      try {
        Future.delayed(Duration(milliseconds: 200));
        List<NotificationModel> _temList = await notificationRepository
            .getnotification(page: page, rowperpage: rowperpage);
        log(notificationModel.length.toString());
        notificationModel.addAll(_temList);
        page++;
        if (_temList.length < rowperpage) {
          yield EndofNotificationList();
        } else {
          yield FetchedNotification();
        }
      } catch (e) {
        yield ErrorFetchingNotification(error: e.toString());
      }
    }
  }
}
