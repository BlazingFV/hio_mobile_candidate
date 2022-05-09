import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hio_mobile_candidate/shared/widgets/custom_text_field.dart';
import 'package:hio_mobile_candidate/shared/widgets/raised_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String name='';
  String email='';
  String country='';
  String phoneNumber='';
  String password='';
  String confirmPassword='';
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
              alignment: Alignment.topCenter,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'tag1',
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
                          'Register',
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
                  top: 221.h,
                  left: 20.w,
                  right: 19.w,
                  child: Container(
                    width: 375.w,
                    height: 600.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Column(
                      children: [
                        Container(
                            width: 374.w,
                            height: 42.h,
                            margin: EdgeInsets.fromLTRB(20.sp, 42.h, 20.sp, 0),
                            child: CustomTextField(
                              labelText: 'Name',
                              passwordVisible: true,
                            )),
                        Container(
                          width: 374.w,
                          height: 42.h,
                          margin: EdgeInsets.fromLTRB(20.sp, 28.75.h, 20.sp, 0),
                          child: CustomTextField(
                            passwordVisible: true,
                            labelText: 'E-mail',
                          ),
                        ),
                        Container(
                          width: 374.w,
                          height: 42.h,
                          margin: EdgeInsets.fromLTRB(20.sp, 28.75.h, 20.sp, 0),
                          child: CustomTextField(
                            passwordVisible: true,
                            labelText: 'Country',
                          ),
                        ),
                        Container(
                          width: 374.w,
                          height: 42.h,
                          margin: EdgeInsets.fromLTRB(20.sp, 28.75.h, 20.sp, 0),
                          child: CustomTextField(
                            passwordVisible: true,
                            labelText: 'Number',
                          ),
                        ),
                        Container(
                          width: 374.w,
                          height: 42.h,
                          margin: EdgeInsets.fromLTRB(20.sp, 28.75.h, 20.sp, 0),
                          child: CustomTextField(
                            passwordVisible: true,
                            labelText: 'Password',
                          ),
                        ),
                        Container(
                          width: 374.w,
                          height: 42.h,
                          margin: EdgeInsets.fromLTRB(20.sp, 28.75.h, 20.sp, 0),
                          child: CustomTextField(
                            passwordVisible: true,
                            labelText: 'Confirm Password',
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20.w, 30.75.h, 20.w, 0),
                          child: RaisedGradientButton(
                            width: 374.w,
                            height: 43.12.h,
                            child: Text(
                              'Register',
                              style: GoogleFonts.roboto(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20.w, 30.17.h, 15.w, 0),
                          // height: 38.h,
                          // width: 248.w,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: "By registering you agree to the ",
                                    style: GoogleFonts.roboto(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                    )),
                                TextSpan(
                                  text: 'Terms & Conditions ',
                                  style: GoogleFonts.roboto(
                                    color: const Color(0xff3096F3),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                TextSpan(
                                  text: 'and our ',
                                  style: GoogleFonts.roboto(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Privacy policy',
                                  style: GoogleFonts.roboto(
                                    color: const Color(0xff3096F3),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
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
