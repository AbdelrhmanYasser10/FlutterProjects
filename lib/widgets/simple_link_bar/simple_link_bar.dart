import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SimpleLinkBar extends StatefulWidget {
  SimpleLinkBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SimpleLinkBarState();
  }
}

class _SimpleLinkBarState extends State<SimpleLinkBar>
    with RefreshProcessor, SingleTickerProviderStateMixin {
  RefreshStatus _status = RefreshStatus.idle;
  late AnimationController _animationController;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Future endRefresh() {
    // TODO: implement endRefresh
    _animationController.animateTo(0.0, duration: Duration(milliseconds: 300));
    return Future.value();
  }

  @override
  void onOffsetChange(double offset) {
    // TODO: implement onOffsetChange
    if (_status != RefreshStatus.refreshing)
      _animationController.value = offset / 80.0;
    super.onOffsetChange(offset);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScaleTransition(
      child: CupertinoActivityIndicator(),
      scale: _animationController,
    );
  }

}