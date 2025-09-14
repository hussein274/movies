import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/ui/utils/app_colors.dart';

abstract final class AppTextStyle{
static TextStyle largeText24=GoogleFonts.inter(fontSize: 24,fontWeight: FontWeight.w700,color: AppColors.white);

static TextStyle mediam=GoogleFonts.inter(fontSize: 20,fontWeight: FontWeight.w400,color: AppColors.white);
static TextStyle RobotoW400_20=GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.w400,color: AppColors.black);
static TextStyle RobotoW400_24=GoogleFonts.roboto(fontSize: 24,fontWeight: FontWeight.w700,color: AppColors.white);
static TextStyle smallText=GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.white);
static TextStyle semiSmallText=GoogleFonts.roboto(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.white);

static TextStyle roboto27W700=GoogleFonts.roboto(fontSize: 27,fontWeight: FontWeight.w700,color: AppColors.white);
static TextStyle titleMovieYear=GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.w700,color: Color(0xffADADAD));
static TextStyle robotoW700_20=GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.w700,color: AppColors.white);
}