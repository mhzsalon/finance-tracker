import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universalexpensetracker/core/services/events/ui_events.dart';

final uiEventProvider = StateProvider<UiEvent?>((ref) => null);