import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hio_mobile_candidate/controllers/auth_controller.dart';
import 'package:hio_mobile_candidate/shared/widgets/custom_text_field.dart';
import 'package:hio_mobile_candidate/shared/widgets/raised_button.dart';
import 'package:hio_mobile_candidate/shared/widgets/shared_app_bar_widget.dart';
import 'dart:developer';

import '../../configs/app_configs.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String name = '';
  String email = '';
  String country = '';
  String phoneNumber = '';
  String password = '';
  String confirmPassword = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AuthController _authController = Get.put(AuthController());

  bool passwordVisible1 = false;

  bool passwordVisible2 = false;
  @override
  void initState() {
    super.initState();
    nameController.addListener(() {
      setState(() {});
    });
    emailController.addListener(() {
      setState(() {});
    });
    phoneNumberController.addListener(() {
      setState(() {});
    });
    passwordController.addListener(() {
      setState(() {});
    });
    confirmPasswordController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

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
          child: SingleChildScrollView(
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
                        alignment: Alignment.center,
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
                      height: 610.sm,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Column(
                        children: [
                          Container(
                              width: 374.w,
                              height: 55.h,
                              margin:
                                  EdgeInsets.fromLTRB(20.sp, 20.h, 20.sp, 0),
                              child: CustomTextField(
                                labelText: 'Name',
                                passwordVisible: true,
                                controller: nameController,
                                onChanged: (value) {
                                  setState(() {
                                    name = value!;
                                  });
                                  return null;
                                },
                                onSaved: (value) {
                                  setState(() {
                                    name = value!;
                                  });
                                  return null;
                                },
                                validator: (val) {
                                  //validate if the name is empty
                                  if (val!.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },
                              )),
                          Container(
                            width: 374.w,
                            height: 55.h,
                            margin: EdgeInsets.fromLTRB(20.sp, 20.h, 20.sp, 0),
                            child: CustomTextField(
                                passwordVisible: true,
                                labelText: 'E-mail',
                                controller: emailController,
                                onChanged: (value) {
                                  setState(() {
                                    email = value!;
                                  });
                                  return null;
                                },
                                onSaved: (value) {
                                  setState(() {
                                    email = value!;
                                  });
                                  return null;
                                },
                                validator: (val) {
                                  //validate if the email is empty
                                  if (val!.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  return null;
                                }),
                          ),
                          Container(
                            width: 374.w,
                            height: 55.h,
                            margin: EdgeInsets.fromLTRB(20.sp, 20.h, 20.sp, 0),
                            child: CSCPicker(
                              // disableCountry: true,
                              showStates: false,
                              showCities: false,

                              onCountryChanged: (value) {
                                setState(() {
                                  country = value.trim();
                                });
                                log('country: $country');
                              },
                              dropdownDialogRadius: 22.r,
                              searchBarRadius: 22.r,
                              currentState: "",
                              currentCity: "",
                              flagState: CountryFlag.SHOW_IN_DROP_DOWN_ONLY,
                              onStateChanged: (val) {
                                setState(() {
                                  final state = val?.trim() ?? "";
                                  log('state: $state');
                                });
                              },
                              onCityChanged: (val) {
                                setState(() {
                                  final city = val?.trim() ?? "";
                                  log('city: $city');
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 374.w,
                            height: 55.h,
                            margin: EdgeInsets.fromLTRB(20.sp, 20.h, 20.sp, 0),
                            child: CustomTextField(
                                passwordVisible: true,
                                labelText: 'Number',
                                controller: phoneNumberController,
                                onChanged: (value) {
                                  setState(() {
                                    phoneNumber = value!;
                                  });
                                  return null;
                                },
                                onSaved: (value) {
                                  setState(() {
                                    phoneNumber = value!;
                                  });
                                  return null;
                                },
                                validator: (val) {
                                  //validate if the phone number is empty
                                  if (val!.isEmpty) {
                                    return 'Please enter your phone number';
                                  }
                                  return null;
                                }),
                          ),
                          Container(
                            width: 374.w,
                            height: 55.h,
                            margin: EdgeInsets.fromLTRB(20.sp, 20.h, 20.sp, 0),
                            child: CustomTextField(
                                // passwordVisible: true,
                                labelText: 'Password',
                                controller: passwordController,
                                passwordVisible: passwordVisible1,
                                keyboardType: TextInputType.visiblePassword,
                                obscuringFunction: () {
                                  setState(() {
                                    passwordVisible1 = !passwordVisible1;
                                  });
                                },
                                onChanged: (value) {
                                  setState(() {
                                    password = value!;
                                  });
                                  return null;
                                },
                                onSaved: (value) {
                                  setState(() {
                                    password = value!;
                                  });
                                  return null;
                                },
                                validator: (val) {
                                  //validate if the password is empty
                                  if (val!.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                }),
                          ),
                          Container(
                            width: 374.w,
                            height: 55.h,
                            margin: EdgeInsets.fromLTRB(20.sp, 20.h, 20.sp, 0),
                            child: CustomTextField(
                                labelText: 'Confirm Password',
                                controller: confirmPasswordController,
                                passwordVisible: passwordVisible2,
                                keyboardType: TextInputType.visiblePassword,
                                obscuringFunction: () {
                                  setState(() {
                                    passwordVisible2 = !passwordVisible2;
                                  });
                                },
                                onChanged: (value) {
                                  setState(() {
                                    confirmPassword = value!;
                                  });
                                  return null;
                                },
                                onSaved: (value) {
                                  setState(() {
                                    confirmPassword = value!;
                                  });
                                  return null;
                                },
                                validator: (val) {
                                  //validate if the password is empty
                                  if (val!.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  //validate if the password and confirm password are same
                                  else if (val != password) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                }),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(20.w, 30.75.h, 20.w, 0),
                            child: RaisedGradientButton(
                              width: 374.w,
                              height: 43.12.h,
                              color: nameController.text.isNotEmpty &&
                                      emailController.text.isNotEmpty &&
                                      phoneNumberController.text.isNotEmpty &&
                                      passwordController.text.isNotEmpty &&
                                      confirmPasswordController
                                          .text.isNotEmpty &&
                                      country.isNotEmpty
                                  ? AppConfigs.primaryColor
                                  : null,
                              child: Text(
                                'Register',
                                style: GoogleFonts.roboto(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              onPressed: () async {
                                _formKey.currentState!.save();
                                // validate form
                                if (_formKey.currentState!.validate()) {
                                  // if the form is valid
                                  // register the user
                                  await _authController.registerUser(context,
                                      name: name,
                                      email: email,
                                      country: country,
                                      phone: phoneNumber,
                                      password: password,
                                      passwordConfirm: confirmPassword);
                                }
                              },
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
      ),
    );
  }
}
