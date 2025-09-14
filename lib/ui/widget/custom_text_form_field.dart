import 'package:flutter/material.dart';
import 'package:movies/ui/utils/app_colors.dart';

import '../utils/app_text_style.dart';
class CustomTextFormField extends StatelessWidget {
  bool obscure;
  final Widget ?suffixIcon;
  final Widget ?prefixIcon;
  final String hintText;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
 final Function(String) ?onChanged;

   CustomTextFormField({
     this.obscure=false,
     this.onChanged,
    required this.controller,
    required this.validator,this.prefixIcon,required this.hintText, this.suffixIcon,super.key});

  @override
  Widget build(BuildContext context) {
    var lineInputBorder =
    OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(15),) );
    var errorInputBorder =
    OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Colors.red
    ));
    return TextFormField(
      onChanged:onChanged ,
      decoration:
      InputDecoration(
        filled: true,
        fillColor: AppColors.gray,
        enabledBorder: lineInputBorder,
        border: lineInputBorder,
        focusedBorder: lineInputBorder,
        errorBorder: errorInputBorder,
        disabledBorder: lineInputBorder,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        focusedErrorBorder: errorInputBorder,
        hintText: hintText,
        hintStyle: AppTextStyle.smallText,
      ),
      obscureText: obscure,
      style: AppTextStyle.smallText,
      validator: validator,
      controller:controller ,
      cursorColor: AppColors.white,
    );
  }
}
