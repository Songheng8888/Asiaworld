import 'package:equatable/equatable.dart';

class NotificationEvent extends Equatable {
  NotificationEvent([List props = const []]) : super();
  @override
  List<Object?> get props => [];
}

class FetchNotificationStarted extends NotificationEvent {}

class InitailizeNotificationStarted extends NotificationEvent {
  final bool isRefresh;
  InitailizeNotificationStarted({required this.isRefresh});
}
