import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// regular 400 /  light 300 / semi 600
class AppStyles {
  static TextStyle semiBold24White = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );
  static TextStyle light16White = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: AppColors.whiteColor,
  );
  static TextStyle medium18White = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
  static TextStyle medium18Black = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );
  static TextStyle medium18PrimaryDark = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryDark,
  );
  static TextStyle bold18White = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,
  );
  static TextStyle light18HintTextColor = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w300,
    color: AppColors.hintTextColor,
  );
  static TextStyle light14primaryDark = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColors.primaryDark,
  );
  static TextStyle regular18White = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteColor,
  );
  static TextStyle regular12PrimaryDark = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryDark,
  );
  static TextStyle regular11White = GoogleFonts.poppins(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteColor,
  );
  static TextStyle regular14PrimaryDark = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryDark,
  );
  static TextStyle semiBold20Primary = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );
}
