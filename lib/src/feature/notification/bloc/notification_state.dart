import 'package:equatable/equatable.dart';

class NotificationState extends Equatable {
  NotificationState([List props = const []]) : super();
  @override
  List<Object?> get props => [];
}

class InitailizingNotification extends NotificationState {}

class InitailizedNotification extends NotificationState {}

class FetchingNotification extends NotificationState {}

class FetchedNotification extends NotificationState {}

class EndofNotificationList extends NotificationState {}

class ErrorFetchingNotification extends NotificationState {
  final String error;
  ErrorFetchingNotification({required this.error});
}
