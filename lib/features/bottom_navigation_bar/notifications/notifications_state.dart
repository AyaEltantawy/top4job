class NotificationsState {}

class NotificationsStateInit extends NotificationsState {}

class NotificationsTabChanged extends NotificationsState {
  final int selectedIndex;

  NotificationsTabChanged(this.selectedIndex);
}