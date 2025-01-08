import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:workout/core/controller/base_controller.dart';

class BaseScreen extends StatelessWidget {
  final Widget body;
  final bool resizeToAvoidBottomPadding;
  final Future<bool>? onWillPop;
  final BaseController? controller;
  final String title;

  const BaseScreen(this.body,
      {super.key,
      this.controller,
      this.resizeToAvoidBottomPadding = false,
      this.onWillPop,
      this.title = 'Workout App'});

  @override
  Widget build(BuildContext context) {
    return controller != null ? _childWithController : _child;
  }

  get _childWithController {
    return controller?.obx((state) => _child,
        onLoading: Stack(
          children: [_child, _loadingIndicator],
        ),
        onEmpty: const Text('No data found'),
        onError: (error) => _child);
  }

  get _loadingIndicator => Positioned.fill(
          child: Container(
        color: Colors.black54,
        child: Center(
          child: SpinKitDoubleBounce(
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ));

  get _child =>
      Scaffold(resizeToAvoidBottomInset: resizeToAvoidBottomPadding, appBar: _appBar, body: SafeArea(child: body));

  get _appBar => AppBar(title: Text(title), backgroundColor: Colors.black12);
}
