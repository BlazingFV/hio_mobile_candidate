import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hio_mobile_candidate/shared/widgets/custom_text_field.dart';
import 'package:hio_mobile_candidate/shared/widgets/raised_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 896.h,
      width: 414.w,
      child: Scaffold(
        backgroundColor: const Color(0xffE5E5E5),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'tag',
                transitionOnUserGestures: true,
                child: Material(
                  type: MaterialType.transparency,
                  child: Container(
                    height: 77,
                    width: 93,
                    margin: EdgeInsets.fromLTRB(160.sp, 104.sp, 160.sp, 0),
                    child: Text(
                      'hio',
                      style: GoogleFonts.nunito(
                        color: const Color(0xff3096F3),
                        fontSize: 64.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                  width: 374.w,
                  height: 42.h,
                  margin: EdgeInsets.fromLTRB(20.sp, 127.h, 20.sp, 0),
                  child: CustomTextField(
                    labelText: 'E-mail',
                    passwordVisible: false,
                  )),
              Container(
                width: 374.w,
                height: 42.h,
                margin: EdgeInsets.fromLTRB(20.sp, 32.h, 20.sp, 0),
                child: CustomTextField(
                  passwordVisible: false,
                  labelText: 'Password',
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.fromLTRB(20.sp, 16.h, 20.sp, 0),
                  height: 18.h,
                  // width: 374.w,
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password?',
                    style: GoogleFonts.roboto(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff3096F3),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20.sp, 32.h, 20.sp, 0),
                child: RaisedGradientButton(
                  width: 374.w,
                  height: 48.h,
                  child: Text(
                    'LOGIN',
                    style: GoogleFonts.roboto(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(83.w, 18.h, 83.w, 0),
                height: 17.h,
                // width: 248.w,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: "Don't have an account?  ",
                          style: GoogleFonts.roboto(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          )),
                      TextSpan(
                        text: ' Register',
                        style: GoogleFonts.roboto(
                          color: const Color(0xff3096F3),
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20.sp, 45.h, 20.sp, 0),
                child: Row(children: [
                  Expanded(
                      child: Divider(
                    endIndent: 7.w,
                    color: const Color(0xff3E4657),
                    thickness: 0.5,
                  )),
                  Text(
                    "Or",
                    style: GoogleFonts.roboto(
                      fontSize: 15.sp,
                      color: const Color(0xff3E4657),
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    color: const Color(0xff3E4657),
                    indent: 7.w,
                    thickness: 0.5,
                  )),
                ]),
              ),
              Container(
                width: 374.w,
                height: 46.h,
                margin: EdgeInsets.fromLTRB(20.sp, 34.h, 20.sp, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(
                      color: const Color(0xff3096F3),
                      width: 1.sp,
                    )),
                child: Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/Vector.svg'),
                        SizedBox(width:8.w),
                        Text(
                          'Continue with Linkedin',
                          style: GoogleFonts.arimo(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                              color: const Color(0xff3E4657)),
                        )
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
