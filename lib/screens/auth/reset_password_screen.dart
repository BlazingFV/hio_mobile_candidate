import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/widgets/custom_text_field.dart';
import '../../shared/widgets/raised_button.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool isEmail = true;
  bool isPhone = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 896.h,
      width: 414.w,
      child: Scaffold(
        backgroundColor: const Color(0xffe5e5e5),
        body: SingleChildScrollView(
          child: SizedBox(
            height: 896.h,
            width: 414.w,
            child: Stack(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'tag',
                  transitionOnUserGestures: true,
                  child: Material(
                    type: MaterialType.transparency,
                    child: Container(
                      height: 328.h,
                      width: 414.w,
                      decoration: BoxDecoration(
                          color: const Color(0xff3096F3),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.r),
                              bottomRight: Radius.circular(20.r))),
                      // margin: EdgeInsets.fromLTRB(160.sp, 104.sp, 160.sp, 0),
                      child: Center(
                        child: Text(
                          'Reset Password',
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 64.h,
                  right: 20.sp,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.close,
                      size: 24.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 210.h,
                  left: 20.w,
                  right: 19.w,
                  child: Container(
                    width: 375.w,
                    height:590.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 30.h, 0, 0),
                            child: SvgPicture.asset('assets/icons/rafiki.svg')),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 16.11.h, 0, 0),
                          child: Center(
                            child: Text(
                              'Trouble Signing In?',
                              style: GoogleFonts.roboto(
                                color: const Color(0xff3e4657),
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 30.h,
                          width: 330.w,
                          margin: EdgeInsets.fromLTRB(22.sp, 17.h, 23.sp, 0),
                          child: Center(
                            child: Text(
                              'Enter your registered email address  and we will send a code to get back into your account',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.nunito(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                height: 1,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 333.w,
                          // height: 32.h,
                          margin: EdgeInsets.fromLTRB(22.sp, 35.h, 22.sp, 0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xff3096f3),
                              width: 1.sp,
                            ),
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isEmail = !isEmail;
                                    isPhone = false;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(
                                    milliseconds: 0,
                                  ),
                                  width: isPhone ? 158.71.w : 169.29.w,
                                  height: 32.h,
                                  color: !isEmail
                                      ? Colors.white
                                      : const Color(0xff3096f3),
                                  child: Center(
                                    child: Text(
                                      'Email',
                                      style: GoogleFonts.roboto(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w700,
                                          color: isEmail
                                              ? Colors.white
                                              : const Color(0xff3E4657)),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isPhone = true;
                                    isEmail = false;
                                  });
                                },
                                child: AnimatedContainer(
                                  width: isPhone ? 169.29.w : 158.71.w,
                                  duration: const Duration(milliseconds: 0),
                                  height: 32.h,
                                  // margin: EdgeInsets.only(right:2.w),
                                  color: isPhone
                                      ? const Color(0xff3096f3)
                                      : Colors.white,
                                  child: Center(
                                    child: Text(
                                      'Phone',
                                      style: GoogleFonts.roboto(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w700,
                                          color: isPhone
                                              ? Colors.white
                                              : const Color(0xff3e4657)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        isEmail
                            ? Container(
                                width: 374.w,
                                height: 42.h,
                                margin:
                                    EdgeInsets.fromLTRB(22.sp, 39.h, 20.sp, 0),
                                child: CustomTextField(
                                  labelText: 'E-mail',
                                  passwordVisible: false,
                                ))
                            : Container(
                                width: 374.w,
                                height: 42.h,
                                margin:
                                    EdgeInsets.fromLTRB(22.sp, 39.h, 20.sp, 0),
                                child: CustomTextField(
                                  labelText: 'Number',
                                  passwordVisible: false,
                                )),
                        Container(
                          margin: EdgeInsets.fromLTRB(20.sp, 55.h, 20.sp, 0),
                          child: RaisedGradientButton(
                            width: 330.w,
                            height: 48.h,
                            child: Text(
                              'Reset',
                              style: GoogleFonts.roboto(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
