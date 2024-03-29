import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double borderRadiusAuth() {
  return 12.0;
}

double MainBorderRadius() {
  return 12.0;
}

Widget CustomButton(
    {required String text,
    required VoidCallback onPressed,
    required Icon icon,
    required double screenWidth}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusAuth()),
        color: secondaryColor(),
      ),
      child: Container(
        padding: EdgeInsets.only(
            left: screenWidth * 0.01,
            right: screenWidth * 0.01,
            top: screenWidth * 0.005,
            bottom: screenWidth * 0.005),
        child: Row(
          children: [
            icon,
            Text(
              text,
              style: BodySmall().copyWith(color: Colors.white.withOpacity(0.9)),
            ),
          ],
        ),
      ),
    ),
  );
}

Color primaryColor1() {
  return const Color.fromRGBO(149, 104, 255, 1);
}
// Color primaryColor1() {
//   return const Color.fromRGBO(54, 36, 101, 1);
// }

Color primaryColor2() {
  return const Color(0xFFF28705);
}

Color secondaryColor() {
  return const Color.fromRGBO(54, 36, 101, 1);
}

Color tertiaryColor1() {
  return const Color(0xFFF4EFFF);
}

Color tertiaryColor2() {
  return const Color(0xFFECE8F7);
}

Color textColor() {
  return const Color(0xFF331B5E);
}

TextStyle displayLarge() {
  return GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 76,
    letterSpacing: -0.333,
    height: 85.312,
  );
}

TextStyle displayMedium() {
  return GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 60,
    letterSpacing: 0,
    height: 69.316,
  );
}

TextStyle displaySmall() {
  return GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 48,
    letterSpacing: 0,
    height: 58.652,
  );
}

TextStyle HeadlineLarge() {
  return GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 42.6,
    letterSpacing: 0,
    // height: 53.32,
  );
}

TextStyle HeadlineMedium() {
  return GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 37.324,
    letterSpacing: 0,
    // height: 48,
  );
}

TextStyle HeadlineSmall() {
  return GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 32,
    letterSpacing: 0,
    // height: 42.6,
  );
}

TextStyle TitleLarge() {
  return GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 29.326,
    letterSpacing: 0,
    // height: 37.324,
  );
}

TextStyle TitleMedium() {
  return GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 21.328,
    letterSpacing: 0.2,
    // height: 32,
  );
}

TextStyle TitleSmall() {
  return GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 18.662,
    letterSpacing: 0.1333,
    // height: 26.66,
  );
}

TextStyle BodyLarge() {
  return GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 21.328,
    letterSpacing: 0.6665,
    // height: 32,
  );
}

TextStyle BodyMedium() {
  return GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 18.666,
    letterSpacing: 0.33,
    // height: 26.66,
  );
}

TextStyle BodySmall() {
  return GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.53,
    // height: 21.328,
  );
}

TextStyle LabelLarge() {
  return GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 18.666,
    letterSpacing: 0.133,
    // height: 26.66,
  );
}

TextStyle LabelMedium() {
  return GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    letterSpacing: 0.667,
    // height: 21.328,
  );
}

TextStyle LabelSmall() {
  return GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 14.663,
    letterSpacing: 0.667,
    // height: 21.328,
  );
}
