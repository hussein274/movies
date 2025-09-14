import 'package:flutter/cupertino.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';

class CustomContainer extends StatelessWidget {
  String icon;
  String text;

  CustomContainer({required this.icon,required this.text,super.key});
@override
  Widget build(BuildContext context) {
   return Container(
     padding: EdgeInsets.symmetric(vertical: 9,horizontal: 22),
     decoration: BoxDecoration(
       
       color: AppColors.gray,
       borderRadius: BorderRadius.circular(16),
     ),

     child: Row(children: [
       Image.asset(icon),
       SizedBox(width: 10,),
       Text(text,style: AppTextStyle.RobotoW400_20.copyWith(color: AppColors.white),),

     ],)
     ,
   );
  }}