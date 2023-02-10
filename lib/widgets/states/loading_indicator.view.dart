import 'package:flutter/material.dart';
import 'package:fuodz/utils/ui_spacer.dart';
import 'package:fuodz/widgets/busy_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator(
      {this.loading, this.child, this.loadingWidget, Key key})
      : super(key: key);

  final bool loading;
  final Widget child;
  final Widget loadingWidget;
  @override
  Widget build(BuildContext context) {
    return HStack([
      child.expand(),
      loading
          ? (loadingWidget ?? BusyIndicator().p12())
          : UiSpacer.emptySpace(),
    ]);
  }
}
