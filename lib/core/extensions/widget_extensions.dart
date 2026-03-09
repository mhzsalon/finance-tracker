import 'package:flutter/material.dart';

extension WidgetExt on Widget {
  Widget toSliverBox() => SliverToBoxAdapter(key: key, child: this);
}
