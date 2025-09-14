import 'package:flutter/material.dart';
import 'package:movies/ui/utils/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function() onPressed;
  final Color colorButton;
  final Color borderColor;
  final Widget child;


  const CustomElevatedButton({this.borderColor=AppColors.yellow,
    super.key,required this.onPressed, this.colorButton=AppColors.yellow,required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      // margin: EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: colorButton,
             side: BorderSide(color: borderColor,width: 2),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
          ),
          child: child),
    );
  }
}
