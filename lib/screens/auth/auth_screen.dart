import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hio_mobile_candidate/controllers/auth_controller.dart';
import 'package:hio_mobile_candidate/screens/auth/register_screen.dart';
import 'package:hio_mobile_candidate/screens/auth/reset_password_screen.dart';
import 'package:hio_mobile_candidate/shared/widgets/custom_text_field.dart';
import 'package:hio_mobile_candidate/shared/widgets/raised_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AuthController authController = Get.put(AuthController());
  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {}); // setState every time text changes
    });
    _passwordController.addListener(() {
      setState(() {}); // setState every time text changes
    });
  }

  bool passwordVisible1 = false;
  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 896.h,
      width: 414.w,
      child: Scaffold(
        backgroundColor: const Color(0xffe5e5e5),
        body: Form(
          key: _formKey,
          child: SizedBox(
            height: 896.h,
            width: 414.w,
            child: Stack(
              alignment: Alignment.topCenter,
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
                          'hio',
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 64.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 280.h,
                  left: 20.w,
                  right: 19.w,
                  child: Container(
                    width: 375.w,
                    height: 460.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Column(
                      children: [
                        Container(
                            width: 374.w,
                            height: 55.h,
                            margin: EdgeInsets.fromLTRB(20.sp, 42.h, 20.sp, 0),
                            child: CustomTextField(
                              controller: _emailController,
                              labelText: 'E-mail',
                              passwordVisible: true,
                              onSaved: (val) {
                                setState(() {
                                  email = val!;
                                });
                                return null;
                              },
                              onChanged: (val) {
                                setState(() {
                                  email = val!;
                                });
                                return null;
                              },
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Please enter your email';
                                } else {
                                  return null;
                                }
                              },
                            )),
                        Container(
                          width: 374.w,
                          height: 55.h,
                          margin: EdgeInsets.fromLTRB(20.sp, 28.75.h, 20.sp, 0),
                          child: CustomTextField(
                            controller: _passwordController,
                            passwordVisible: passwordVisible1,
                            keyboardType: TextInputType.visiblePassword,
                            obscuringFunction: () {
                              setState(() {
                                passwordVisible1 = !passwordVisible1;
                              });
                            },
                            labelText: 'Password',
                            onSaved: (val) {
                              setState(() {
                                password = val!;
                              });
                              return null;
                            },
                            onChanged: (val) {
                              setState(() {
                                password = val!;
                              });
                              return null;
                            },
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Please enter your password';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Get.to(() => const ResetPasswordScreen());
                              //                  Navigator.of(context)
                              // .push(NavigationAnimation(child: const AuthScreen()));
                            },
                            child: Container(
                              margin:
                                  EdgeInsets.fromLTRB(20.sp, 16.h, 20.sp, 0),
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
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20.sp, 28.75.h, 20.sp, 0),
                          child: RaisedGradientButton(
                            color: _passwordController.text.isNotEmpty &&
                                    _emailController.text.isNotEmpty
                                ? const Color(0xff3096F3)
                                : null,
                            width: 374.w,
                            height: 43.12.h,
                            child: Text(
                              'LOGIN',
                              style: GoogleFonts.roboto(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            onPressed: () async {
                              _formKey.currentState?.save();
                              if (_formKey.currentState!.validate()) {
                              
                              await authController.loginUsingEmail(
                                  email, password, context);
                              }
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(83.w, 16.17.h, 83.w, 0),
                          height: 15.27.h,
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
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.to(() => const RegisterScreen());
                                    },
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
                          margin: EdgeInsets.fromLTRB(20.sp, 40.43.h, 20.sp, 0),
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
                          height: 41.h,
                          margin: EdgeInsets.fromLTRB(20.sp, 30.55.h, 20.sp, 0),
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
                                  SizedBox(width: 8.w),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
