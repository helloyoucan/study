import 'package:flutter/material.dart';
// 加载进度条组件
class LoadingContainer extends StatelessWidget{
  final Widget child;
  final bool isLoading;
  final bool cover;//是否覆盖整个页面的布局

  const LoadingContainer({Key key,@required this.isLoading, this.cover=false, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return !cover ? !isLoading? child : _loadingView:Stack(
      children: [
        child,isLoading?_loadingView:null
      ],
    );
  }
  Widget get _loadingView{
      return Center(
        child: CircularProgressIndicator()
      );
  }
}

