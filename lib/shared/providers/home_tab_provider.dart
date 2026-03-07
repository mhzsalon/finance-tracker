import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universalexpensetracker/shared/enums/home_tab_enums.dart';

final providerOfHomeTab =
    StateNotifierProvider.autoDispose<HomeTabNotifier, HomeTabEnums>(
      (ref) => HomeTabNotifier(HomeTabEnums.home),
    );

class HomeTabNotifier extends StateNotifier<HomeTabEnums> {
  HomeTabNotifier(super.state);

  void updateTab(HomeTabEnums value) => state = value;

  void currentTab() => state;
}
