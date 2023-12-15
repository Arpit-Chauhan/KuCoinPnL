import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mvp_draft_4/core/app_export.dart';

class AppStyle {
  static TextStyle txtSoraSemiBold14Bluegray911 = TextStyle(
    color: LightTheme.bluegray911,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtSoraBold12Gray600 = TextStyle(
    color: LightTheme.gray600,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtSoraRegular12GreenA700 = TextStyle(
    color: LightTheme.greenA700,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraRegular11Gray600 = TextStyle(
    color: LightTheme.gray600,
    fontSize: getFontSize(
      11,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraSemiBold11WhiteA700 = TextStyle(
    color: LightTheme.whiteA700,
    fontSize: getFontSize(
      11,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle textstyleregular20 = TextStyle(
    color: LightTheme.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle textstyleregular11 = TextStyle(
    color: LightTheme.black900,
    fontSize: getFontSize(
      14,
    ),
    fontWeight: FontWeight.w800,
  );

  static TextStyle textstylesoraregular111 = textstylesoraregular163.copyWith(
    fontSize: getFontSize(
      11,
    ),
  );

  static TextStyle textstylesorabold12 = TextStyle(
    color: LightTheme.bluegray900,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w700,
  );

  static TextStyle textstylesoraregular1411 =
      textstylesoraregular1413.copyWith();

  static TextStyle textstylesoraregular1410 =
      textstylesoraregular1412.copyWith();

  static TextStyle textstylesoraregular114 = textstylesoraregular143.copyWith(
    fontSize: getFontSize(
      11,
    ),
  );

  static TextStyle txtSoraRegular11Bluegray900 = TextStyle(
    color: LightTheme.bluegray900,
    fontSize: getFontSize(
      11,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraRegular11Bluegray800 = TextStyle(
    color: LightTheme.blueGray800,
    fontSize: getFontSize(
      11,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraRegular12Bluegray200 = TextStyle(
    color: LightTheme.bluegray200,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle textstylesoraregular112 = textstylesoraregular146.copyWith(
    fontSize: getFontSize(
      11,
    ),
  );

  static TextStyle textstylesoraregular113 = textstylesoraregular114.copyWith(
    color: LightTheme.gray600,
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle textstylesoraregular20 = textstylesoraregular24.copyWith(
    fontSize: getFontSize(
      20,
    ),
  );

  static TextStyle textstylesoraregular1413 = textstylesoraregular162.copyWith(
    fontSize: getFontSize(
      14,
    ),
  );

  static TextStyle textstylesoraregular1412 = textstylesoraregular144.copyWith(
    fontWeight: FontWeight.w600,
  );

  static TextStyle textstylesoraregular24 = TextStyle(
    color: LightTheme.bluegray900,
    fontSize: getFontSize(
      24,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle textstylesoraregular14 = textstylesoraregular24.copyWith(
    fontSize: getFontSize(
      14,
    ),
  );

  static TextStyle textstylesoraregular16 = textstylesoraregular162.copyWith(
    fontWeight: FontWeight.w600,
  );

  static TextStyle textstylesorabold32 = textstylesorabold12.copyWith(
    fontSize: getFontSize(
      32,
    ),
  );

  static TextStyle textstylesoraregular11 = textstylesoraregular113.copyWith(
      color: LightTheme.gray201,
      fontSize: getFontSize(
        11,
      ),
      fontWeight: FontWeight.w400);

  static TextStyle textstylesoraregular12 = textstylesoraregular163.copyWith(
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle textstyleregular16 = TextStyle(
    color: LightTheme.bluegray400,
    fontSize: getFontSize(
      16,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle textstylesoraregular149 = textstylesoraregular144.copyWith(
    color: LightTheme.gray201,
  );

  static TextStyle textstylesoraregular147 = textstylesoraregular14.copyWith(
    color: LightTheme.bluegray900,
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle textstylesoraregular148 = textstylesoraregular144.copyWith(
    fontWeight: FontWeight.w600,
  );

  static TextStyle textstylesoraregular141 =
      textstylesoraregular1412.copyWith();

  static TextStyle textstylesoraregular142 = textstylesoraregular144.copyWith(
    color: LightTheme.gray600,
  );

  static TextStyle textstylesoraregular121 =
      textstylesoragreenregular12.copyWith(
    color: LightTheme.gray700,
  );

  static TextStyle textstylesoragreenregular12 = TextStyle(
    color: LightTheme.green400,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle textstylesoragreenregular32 = TextStyle(
    color: LightTheme.green400,
    fontSize: getFontSize(
      32,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w700,
  );

  static TextStyle textstylesoraregular145 =
      textstylesoraregular1412.copyWith();

  static TextStyle textstylesoraregular163 = textstylesoraregular162.copyWith(
    color: LightTheme.gray600,
  );

  static TextStyle textstylesoraregular146 = textstylesoraregular144.copyWith(
    color: LightTheme.bluegray200,
  );

  static TextStyle textstylesoraregular143 = TextStyle(
    color: LightTheme.deepOrange400,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle textstylesoraregular161 = textstylesoraregular16.copyWith(
    color: LightTheme.gray700,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: 'Sora',
  );

  static TextStyle textstylesoraregular144 = TextStyle(
    color: LightTheme.whiteA700,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle textstylesoraregular162 = TextStyle(
    color: LightTheme.bluegray900,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );
  static TextStyle txtSoraSemiBold14Bluegray900 = TextStyle(
    color: LightTheme.bluegray900,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );
  static TextStyle txtSoraSemiBold14Bluegray900Monospaced = TextStyle(
      color: LightTheme.bluegray900,
      fontSize: getFontSize(
        14,
      ),
      fontFamily: 'Sora',
      fontWeight: FontWeight.w600,
      fontFeatures: [FontFeature.tabularFigures()]);

  static TextStyle txtSoraSemiBold14gray600 = TextStyle(
    color: LightTheme.gray600,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtSoraSemiBold12Bluegray900 = TextStyle(
    color: LightTheme.bluegray900,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtSoraSemiBold12Bluegray900Monospaced = TextStyle(
      color: LightTheme.bluegray900,
      fontSize: getFontSize(
        12,
      ),
      fontFamily: 'Sora',
      fontWeight: FontWeight.w600,
      fontFeatures: [FontFeature.tabularFigures()]);

  static TextStyle txtSoraBold12Bluegray900 = TextStyle(
    color: LightTheme.bluegray900,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtSoraSemiBold14Indigo = TextStyle(
    color: LightTheme.blue600,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtSoraSemiBold20 = TextStyle(
    color: LightTheme.bluegray900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtSoraSemiBold11 = TextStyle(
    color: LightTheme.deepOrange400,
    fontSize: getFontSize(
      11,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtSoraSemiBold11Gray600 = TextStyle(
    color: LightTheme.gray600,
    fontSize: getFontSize(
      11,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtRobotoRegular20Black90012 = TextStyle(
    color: LightTheme.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraSemiBold14WhiteA700 = TextStyle(
    color: LightTheme.whiteA700,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtSoraSemiBold12WhiteA700 = TextStyle(
    color: LightTheme.whiteA700,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtSoraRegular11Bluegray200 = TextStyle(
    color: LightTheme.bluegray200,
    fontSize: getFontSize(
      11,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraRegular11Gray700 = TextStyle(
    color: LightTheme.gray700,
    fontSize: getFontSize(
      11,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraRegular11 = TextStyle(
    color: LightTheme.gray600,
    fontSize: getFontSize(
      11,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraRegular11Green900 = TextStyle(
    color: LightTheme.green900,
    fontSize: getFontSize(
      11,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraRegular11RedBgText = TextStyle(
    color: LightTheme.redBgText,
    fontSize: getFontSize(
      11,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraRegular11Orange400 = TextStyle(
    color: LightTheme.deepOrange400,
    fontSize: getFontSize(
      11,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraRegular12 = TextStyle(
    color: LightTheme.gray700,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraRegular12WhiteA700 = TextStyle(
    color: LightTheme.whiteA700,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraRegular12Default = TextStyle(
    color: LightTheme.gray700,
    fontSize: getFontSize(
      12,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraRegular11WhiteA700 = TextStyle(
    color: LightTheme.whiteA700,
    fontSize: getFontSize(
      11,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraRegular14 = TextStyle(
    color: LightTheme.gray600,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraRegular14Gray800 = TextStyle(
    color: LightTheme.gray800,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraBold32 = TextStyle(
    color: LightTheme.bluegray900,
    fontSize: getFontSize(
      32,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtSoraRegular16 = TextStyle(
    color: LightTheme.gray600,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black900 = TextStyle(
    color: LightTheme.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraRegular14WhiteA700 = TextStyle(
    color: LightTheme.whiteA700,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraRegular12Gray600 = TextStyle(
    color: LightTheme.gray600,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraRegular11Gray201 = TextStyle(
    color: LightTheme.gray201,
    fontSize: getFontSize(
      11,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraRegular14Gray201 = TextStyle(
    color: LightTheme.gray201,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraRegular12Gray201 = TextStyle(
    color: LightTheme.gray201,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraRegular14Gray600 = TextStyle(
    color: LightTheme.gray600,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraBold12 = TextStyle(
    color: LightTheme.bluegray900,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtRobotoRegular16 = TextStyle(
    color: LightTheme.bluegray400,
    fontSize: getFontSize(
      16,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraSemiBold24 = TextStyle(
    color: LightTheme.bluegray900,
    fontSize: getFontSize(
      24,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtSoraSemiBold14BlueGray900 = TextStyle(
    color: LightTheme.bluegray900,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtSoraSemiBold14BlueGray800 = TextStyle(
    color: LightTheme.blueGray800,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtManropeSemiBold16BlueGray900 = TextStyle(
    color: LightTheme.bluegray900,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtSoraSemiBold14 = TextStyle(
    color: LightTheme.deepOrange400,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtSoraSemiBold14Red = TextStyle(
    color: LightTheme.red700,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtRobotoRegular20 = TextStyle(
    color: LightTheme.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraSemiBold11Bluegray201 = TextStyle(
    color: LightTheme.gray201,
    fontSize: getFontSize(
      11,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtSoraSemiBold16 = TextStyle(
    color: LightTheme.bluegray900,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
    //uppercase
  );

  static TextStyle txtSoraSemiBold16Gray700 = TextStyle(
    color: LightTheme.gray700,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtSoraBold12Gray700 = TextStyle(
    color: LightTheme.gray700,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtSoraBold14Gray700 = TextStyle(
    color: LightTheme.gray700,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtSoraSemiBold16Bluegray900 = TextStyle(
    color: LightTheme.bluegray900,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtSoraSemiBold14Bluegray900With = TextStyle(
    color: LightTheme.bluegray900,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtSoraSemiBold16WhiteA700 = TextStyle(
    color: LightTheme.whiteA700,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtSoraRegular14Bluegray900 = TextStyle(
    color: LightTheme.bluegray900,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraRegular12Bluegray900 = TextStyle(
    color: LightTheme.bluegray900,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraBold12BlueGray900 = TextStyle(
    color: LightTheme.deepPurple400,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtSoraBold12BlueGray9000 = TextStyle(
    color: LightTheme.bluegray900,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtSoraBold16BlueGray900 = TextStyle(
    color: LightTheme.bluegray900,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtSoraBold16BlueGray600 = TextStyle(
      color: LightTheme.bluegray900,
      fontSize: getFontSize(
        16,
      ),
      fontFamily: 'Sora',
      fontWeight: FontWeight.w600,
      height: 1.40);

  static TextStyle txtSoraBold14BlueGray900 = TextStyle(
    color: LightTheme.bluegray900,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtSoraRegular12Green700 = TextStyle(
    color: LightTheme.greenA700,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraRegular12Green700Monospaced = TextStyle(
      color: LightTheme.greenA700,
      fontSize: getFontSize(
        12,
      ),
      fontFamily: 'Sora',
      fontWeight: FontWeight.w400,
      fontFeatures: [FontFeature.tabularFigures()]);

  static TextStyle txtSoraRegular14Green700 = TextStyle(
    color: LightTheme.greenA700,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraSemiBold16Green400 = TextStyle(
    color: LightTheme.green400,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtSoraSemiBold14Green400 = TextStyle(
    color: LightTheme.green400,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );
  static TextStyle txtSoraSemiBold14Green900 = TextStyle(
    color: LightTheme.green900,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );
  static TextStyle txtSoraBold14Green900 = TextStyle(
    color: LightTheme.green900,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtSoraSemiBold12Green400 = TextStyle(
    color: LightTheme.green400,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );
  static TextStyle txtSoraSemiBold12Green900 = TextStyle(
    color: LightTheme.green900,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtSoraBold12Green900 = TextStyle(
    color: LightTheme.green900,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtSoraRegular12Red700 = TextStyle(
    color: LightTheme.red700,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraRegular12Red700Monospaced = TextStyle(
      color: LightTheme.red700,
      fontSize: getFontSize(
        12,
      ),
      fontFamily: 'Sora',
      fontWeight: FontWeight.w400,
      fontFeatures: [FontFeature.tabularFigures()]);

  static TextStyle txtSoraBold12Red700 = TextStyle(
    color: LightTheme.red700,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtSoraRegular14Red700 = TextStyle(
    color: LightTheme.red700,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraRegular12Green400 = TextStyle(
    color: LightTheme.green400,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraRegular14Green400 = TextStyle(
    color: LightTheme.green400,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraSemiBold16Red700 = TextStyle(
    color: LightTheme.red700,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtSoraSemiBold14Red700 = TextStyle(
    color: LightTheme.red700,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );
  static TextStyle txtSoraBold14Red700 = TextStyle(
    color: LightTheme.red700,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtSoraSemiBold12Red700 = TextStyle(
    color: LightTheme.red700,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtSoraSemiBold11Deeporange400 = TextStyle(
    color: LightTheme.deepOrange400,
    fontSize: getFontSize(
      11,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtSoraBold12Deeporange400 = TextStyle(
    color: LightTheme.deepOrange400,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtSoraBold14Deeporange400 = TextStyle(
    color: LightTheme.deepOrange400,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtSoraSemiBold14Deeporange400 = TextStyle(
    color: LightTheme.deepOrange400,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );
  static TextStyle textErrorSemibold = TextStyle(
    color: LightTheme.red700,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );
  static TextStyle txtSoraBold24 = TextStyle(
    color: LightTheme.whiteA700,
    fontSize: 22,
    letterSpacing: 0.24,
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtSoraRegular14Gray100 = TextStyle(
    color: LightTheme.gray100,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSoraRegular12RedA200 = TextStyle(
    color: LightTheme.red700,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtManropeBold12 = TextStyle(
    color: LightTheme.bluegray900,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtSoraBold40 = TextStyle(
    color: LightTheme.bluegray900,
    fontSize: getFontSize(
      40,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtSoraSemiBold11Bluegray900 = TextStyle(
    color: LightTheme.bluegray900,
    fontSize: getFontSize(
      11,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtSoraSemiBold12 = TextStyle(
    color: LightTheme.bluegray900,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtSoraBold11Gray600 = TextStyle(
    color: LightTheme.gray600,
    fontSize: getFontSize(
      11,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtSoraExtraBold24 = TextStyle(
    color: LightTheme.deepOrange400,
    fontSize: getFontSize(
      24,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w800,
  );
  static TextStyle txtSoraRegular12Gray800 = TextStyle(
    color: LightTheme.gray800,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );
  static TextStyle txtSoraRegular11Gray800 = TextStyle(
    color: LightTheme.gray800,
    fontSize: getFontSize(
      11,
    ),
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );
}