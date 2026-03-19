import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universalexpensetracker/core/helpers/app_toast.dart';
import 'package:universalexpensetracker/core/services/events/ui_event_provider.dart';
import 'package:universalexpensetracker/core/services/events/ui_events.dart';

class AppEventListener extends ConsumerWidget {
  final Widget child;

  const AppEventListener({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<UiEvent?>(uiEventProvider, (previous, next) {
      if (next == null) return;

      switch (next) {
        case ShowLoading(:final message):
          showAppToast(message);
          break;
        case ShowSuccess(:final message):
          showAppToast(message);
          break;
        case ShowError(:final message):
          showAppToast(message);
      }
    });
    return child;
  }
}
