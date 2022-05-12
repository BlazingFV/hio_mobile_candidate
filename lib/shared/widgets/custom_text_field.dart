import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController? controller;

  bool? passwordVisible;

  late String? labelText;

  late String? hintText;
  String? Function(String? value)? onSaved;
  String? Function(String? value)? validator;
  VoidCallback? obscuringFunction;
  String? Function(String? value)? onChanged;
  late TextInputType? keyboardType;
  int? maxLines;
  Widget? suffixIcon;
  TextInputAction? textInputAction;

  CustomTextField({
    this.controller,
    this.passwordVisible,
    this.hintText,
    this.labelText,
    this.obscuringFunction,
    this.validator,
    this.keyboardType,
    this.onSaved,
    this.onChanged,
    this.suffixIcon,
    this.maxLines,
    this.textInputAction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        // onChanged: onChanged,
        onFieldSubmitted: onChanged,
        onSaved: onSaved,
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        maxLines: maxLines ?? 1,
        enableIMEPersonalizedLearning: true,
        textInputAction: textInputAction,
        //controller: _userPasswordController,
        obscureText: !passwordVisible!,
        decoration: InputDecoration(
          suffixIconConstraints:
              const BoxConstraints(minHeight: 20, minWidth: 21),
          suffixIcon: keyboardType == TextInputType.visiblePassword
              ? IconButton(
                  icon: Icon(passwordVisible!
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: obscuringFunction,
                )
              : suffixIcon ?? const SizedBox(),
          // border: InputBorder.none,
          labelStyle: GoogleFonts.roboto(
            fontSize: 17.sp,
            color: Color(0xff3E4657),
            fontWeight: FontWeight.w400,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: labelText,
          hintText: hintText,
          hintStyle: GoogleFonts.openSans(
            color: const Color(0xffa7b1bc),
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff3096F3), width: 1.0),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff3096F3), width: 1.0),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffb41139), width: 1.0),
          ),
         
        ),
      ),
    );
  }
}
