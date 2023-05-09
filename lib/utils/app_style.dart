import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  TextStyle appTextStyle(double fSize, Color fColor, FontWeight fWeight) {
    return GoogleFonts.poppins(
        fontSize: fSize.sp, color: fColor, fontWeight: fWeight);
  }
}