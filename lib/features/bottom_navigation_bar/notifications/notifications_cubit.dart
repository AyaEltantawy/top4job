import 'package:bloc/bloc.dart';

import 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsStateInit());
  int selectedIndex=0;
  final List<String> tabs = ["General", "New Jobs"];

  void changeSelectedIndex(int index) {
    selectedIndex = index;
    emit(NotificationsTabChanged(index));
  }

}
