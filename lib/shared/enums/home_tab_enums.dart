import 'package:flutter/material.dart';
import 'package:universalexpensetracker/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:universalexpensetracker/features/transactions/presentation/screen/transaction_list_screen.dart';

enum HomeTabEnums {
  home,
  add,

  transaction;

  /// Returns the title of the tab.
  String get title {
    switch (this) {
      case HomeTabEnums.home:
        return 'Home';
      case HomeTabEnums.add:
        return '';
      case HomeTabEnums.transaction:
        return 'Statements';
    }
  }

  IconData get icon {
    switch (this) {
      case HomeTabEnums.home:
        return Icons.home_rounded;
      case HomeTabEnums.add:
        return Icons.add;
      case HomeTabEnums.transaction:
        return Icons.receipt_long_rounded;
    }
  }

  Widget get screen {
    switch (this) {
      case HomeTabEnums.home:
        return DashboardScreen();
      case HomeTabEnums.add:
        return Container();
      case HomeTabEnums.transaction:
        return TransactionListScreen();
    }
  }
}
