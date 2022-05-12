import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hio_mobile_candidate/utils/colors.dart';

class AuthScreenBackgroundWidget extends StatelessWidget {
  const AuthScreenBackgroundWidget(
      {Key? key, required this.heading, required this.child})
      : super(key: key);
  final String heading;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 896.h,
      width: 414.w,
      child: Scaffold(
        backgroundColor: AppColors.greyBackgroud,
        body: Stack(
          children: [
            Container(
              height: 896.h,
              width: 414.w,
              decoration: BoxDecoration(
                  color: AppColors.bluePrimaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r),
                  )),
              child: Column(
                children: [
                  SizedBox(
                    height: 70.h,
                  ),
                  Icon(
                    Icons.clear,
                    color: AppColors.white,
                    size: 12,
                  ),
                  Text(
                    heading,
                    style: GoogleFonts.neucha(
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 24.sp,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                top: 221.h,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular((20.r))),
                  child: child,
                ))
          ],
        ),
      ),
    );
  }
}
