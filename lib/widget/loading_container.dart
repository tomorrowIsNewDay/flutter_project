import 'package:flutter/material.dart';

// 加载进度条
class LoadingContainer extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final bool cover;

  const LoadingContainer({
    Key key,
    @required this.isLoading,
    this.cover=false,
    @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !cover ? (isLoading ? _loadingView : child)
            : Stack(
                children: <Widget>[
                  child,
                  isLoading?_loadingView:null
                ],
              );
  }

  Widget get _loadingView {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}