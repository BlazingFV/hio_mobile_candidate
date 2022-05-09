import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Color? color;

  final double width;
  final double? height;
  final VoidCallback onPressed;

  const RaisedGradientButton({
    Key? key,
    required this.child,
    this.width = double.infinity,
    this.color,
    this.height,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? 48.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: color ?? const Color(0xffEDEDED),
      ),
      child: Material(
        elevation: 0,
        color: Colors.transparent,
        child: InkWell(
            splashColor: Colors.blue[200],
            borderRadius: BorderRadius.circular(25.0),
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}
