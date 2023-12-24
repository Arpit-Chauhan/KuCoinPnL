import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FancyText extends StatelessWidget {
  FancyText({
    required this.number,
    required this.positiveChange,
    this.positivePrefix = "",
    this.positiveSuffix = "",
    this.negativePrefix = "",
    this.negativeSuffix = "",
    this.showRupeeIcon = false,
    required this.positiveIntegerStyle,
    required this.positiveDecimalStyle,
    required this.negativeIntegerStyle,
    required this.negativeDecimalStyle,
    this.rsSignSize = 14,
    this.customAppStyle = false,
    this.numberFormat,
    this.mfpNAV,
    this.decimalDigits = 2,
  });

  late dynamic number;
  late bool positiveChange;
  late String? positiveSuffix;
  late String? positivePrefix;
  late String? negativePrefix;
  late String? negativeSuffix;
  bool showRupeeIcon;
  late TextStyle positiveIntegerStyle;
  late TextStyle positiveDecimalStyle;
  late TextStyle negativeIntegerStyle;
  late TextStyle negativeDecimalStyle;
  late double? rsSignSize;
  late bool customAppStyle;
  late bool? mfpNAV;
  int? decimalDigits;

  NumberFormat? numberFormat;

  @override
  Widget build(BuildContext context) {
    String formattedNumber = NumberFormat.decimalPattern().format(number);

    int integer = number.toInt();
     String ltpFractions = number.toString().split('.').length > 1 ? number.toString().split('.')[1] : "";
    if (number.isNegative && integer == 0) {
      if (negativePrefix != null) {
        negativePrefix = '${negativePrefix!}-';
      }
    }

    return Container(
      padding: EdgeInsets.all(0),
      child: RichText(
          text: TextSpan(
        children: [
          if (showRupeeIcon)
            TextSpan(
                text: "₹".tr,
                style: positiveChange
                    ? positiveIntegerStyle.copyWith(fontFamily: 'Manrope', fontFeatures: [FontFeature.tabularFigures()])
                    : negativeIntegerStyle.copyWith(fontFamily: 'Manrope', fontFeatures: [FontFeature.tabularFigures()])),
          TextSpan(
            text: positiveChange ? positivePrefix! : negativePrefix!,
            style: customAppStyle == true
                ? positiveChange
                    ? positiveIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()], fontSize: 17.0)
                    : negativeIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()], fontSize: 17.0)
                : positiveChange
                    ? positiveIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()])
                    : negativeIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()]),
          ),
          TextSpan(
            text: formattedNumber,
            style: positiveChange
                ? positiveIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()])
                : negativeIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()]),
          ),
          TextSpan(
              text: positiveChange ? ".$ltpFractions${positiveSuffix!}" : ".$ltpFractions${negativeSuffix!}",
              style: positiveChange
                  ? positiveDecimalStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()])
                  : negativeDecimalStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()])),
        ],
      )),
    );
  }
}

class FancyTextTxn extends StatelessWidget {
  FancyTextTxn({
    required this.number,
    required this.positiveChange,
    this.positivePrefix = "",
    this.positiveSuffix = "",
    this.negativePrefix = "",
    this.negativeSuffix = "",
    this.showRupeeIcon = false,
    required this.positiveIntegerStyle,
    required this.positiveDecimalStyle,
    required this.negativeIntegerStyle,
    required this.negativeDecimalStyle,
    this.rsSignSize = 14,
    this.customAppStyle = false,
    this.numberFormat,
    this.mfpNAV,
    this.decimalDigits = 2,
  });

  late dynamic number;
  late bool positiveChange;
  late String? positiveSuffix;
  late String? positivePrefix;
  late String? negativePrefix;
  late String? negativeSuffix;
  bool showRupeeIcon;
  late TextStyle positiveIntegerStyle;
  late TextStyle positiveDecimalStyle;
  late TextStyle negativeIntegerStyle;
  late TextStyle negativeDecimalStyle;
  late double? rsSignSize;
  late bool customAppStyle;
  late bool? mfpNAV;
  int? decimalDigits;

  NumberFormat? numberFormat;

  @override
  Widget build(BuildContext context) {
    int integer = number.toInt();
    String ltpFractions = number.toString() ;
    if (number.isNegative && integer == 0) {
      if (negativePrefix != null) {
        negativePrefix = '${negativePrefix!}-';
      }
    }

    return Container(
      padding: EdgeInsets.all(0),
      child: RichText(
          text: TextSpan(
        children: [
          TextSpan(
            text: positiveChange ? positivePrefix! : negativePrefix!,
            style: customAppStyle == true
                ? positiveChange
                    ? positiveIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()], fontSize: 17.0)
                    : negativeIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()], fontSize: 17.0)
                : positiveChange
                    ? positiveIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()])
                    : negativeIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()]),
          ),
          TextSpan(
            text: positiveChange
                ? (numberFormat ?? NumberFormat.decimalPattern('hi')).format(integer)
                : (numberFormat ?? NumberFormat.decimalPattern('hi')).format(integer),
            style: positiveChange
                ? positiveIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()])
                : negativeIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()]),
          ),
        ],
      )),
    );
  }
}

class FancyTextFno extends StatelessWidget {
  FancyTextFno({
    required this.number,
    required this.positiveChange,
    this.positivePrefix = "",
    this.positiveSuffix = "",
    this.negativePrefix = "",
    this.negativeSuffix = "",
    this.showRupeeIcon = false,
    required this.positiveIntegerStyle,
    required this.positiveDecimalStyle,
    required this.negativeIntegerStyle,
    required this.negativeDecimalStyle,
    this.rsSignSize = 14,
    this.customAppStyle = false,
    this.numberFormat,
  });

  late dynamic number;
  late bool positiveChange;
  late String? positiveSuffix;
  late String? positivePrefix;
  late String? negativePrefix;
  late String? negativeSuffix;
  bool showRupeeIcon;
  late TextStyle positiveIntegerStyle;
  late TextStyle positiveDecimalStyle;
  late TextStyle negativeIntegerStyle;
  late TextStyle negativeDecimalStyle;
  late double? rsSignSize;
  late bool customAppStyle;

  NumberFormat? numberFormat;

  @override
  Widget build(BuildContext context) {
    int integer = number.toInt();
    String ltpFractions = number.toStringAsFixed(2).split('.')[1];
    if (number.isNegative && integer == 0) {
      if (negativePrefix != null) {
        negativePrefix = '${negativePrefix!}-';
      }
    }

    return Container(
      padding: EdgeInsets.all(0),
      child: RichText(
          text: TextSpan(
        children: [
          if (showRupeeIcon)
            TextSpan(
                text: "lbl_rupee".tr,
                style: positiveChange
                    ? positiveIntegerStyle.copyWith(fontFamily: 'Manrope', fontFeatures: [FontFeature.tabularFigures()])
                    : negativeIntegerStyle.copyWith(fontFamily: 'Manrope', fontFeatures: [FontFeature.tabularFigures()])),
          TextSpan(
            text: positiveChange ? positivePrefix! : negativePrefix!,
            style: customAppStyle == true
                ? positiveChange
                    ? positiveIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()], fontSize: 17.0)
                    : negativeIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()], fontSize: 17.0)
                : positiveChange
                    ? positiveIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()])
                    : negativeIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()]),
          ),
          TextSpan(
            text: positiveChange
                ? (numberFormat ?? NumberFormat.decimalPattern('hi')).format(integer)
                : (numberFormat ?? NumberFormat.decimalPattern('hi')).format(integer),
            style: positiveChange
                ? positiveIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()])
                : negativeIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()]),
          ),
          TextSpan(
              text: positiveChange ? ".$ltpFractions${positiveSuffix!}" : ".$ltpFractions${negativeSuffix!}",
              style: positiveChange
                  ? positiveDecimalStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()])
                  : negativeDecimalStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()])),
        ],
      )),
    );
  }
}

class FancyTextCorporate extends StatelessWidget {
  FancyTextCorporate({
    required this.number,
    required this.positiveChange,
    this.positivePrefix = "",
    this.positiveSuffix = "",
    this.negativePrefix = "",
    this.negativeSuffix = "",
    this.showRupeeIcon = false,
    required this.positiveIntegerStyle,
    required this.positiveDecimalStyle,
    required this.negativeIntegerStyle,
    required this.negativeDecimalStyle,
    this.rsSignSize = 14,
    this.customAppStyle = false,
    this.numberFormat,
  });

  late dynamic number;
  late bool positiveChange;
  late String? positiveSuffix;
  late String? positivePrefix;
  late String? negativePrefix;
  late String? negativeSuffix;
  bool showRupeeIcon;
  late TextStyle positiveIntegerStyle;
  late TextStyle positiveDecimalStyle;
  late TextStyle negativeIntegerStyle;
  late TextStyle negativeDecimalStyle;
  late double? rsSignSize;
  late bool customAppStyle;

  NumberFormat? numberFormat;

  @override
  Widget build(BuildContext context) {
    int integer = number.toInt();
    String ltpFractions = number.toStringAsFixed(2).split('.')[1];
    if (number.isNegative && integer == 0) {
      if (negativePrefix != null) {
        negativePrefix = '${negativePrefix!.replaceAll("-", "")}';
      }
    }

    return Container(
      padding: EdgeInsets.all(0),
      child: RichText(
          text: TextSpan(
        children: [
          if (showRupeeIcon)
            TextSpan(
                text: "lbl_rupee".tr,
                style: positiveChange
                    ? positiveIntegerStyle.copyWith(fontFamily: 'Manrope', fontFeatures: [FontFeature.tabularFigures()])
                    : negativeIntegerStyle.copyWith(fontFamily: 'Manrope', fontFeatures: [FontFeature.tabularFigures()])),
          TextSpan(
            text: positiveChange ? positivePrefix! : negativePrefix!,
            style: customAppStyle == true
                ? positiveChange
                    ? positiveIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()], fontSize: 17.0)
                    : negativeIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()], fontSize: 17.0)
                : positiveChange
                    ? positiveIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()])
                    : negativeIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()]),
          ),
          TextSpan(
            text: positiveChange
                ? (numberFormat ?? NumberFormat.decimalPattern('hi')).format(integer)
                : (numberFormat ?? NumberFormat.decimalPattern('hi')).format(integer),
            style: positiveChange
                ? positiveIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()])
                : negativeIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()]),
          ),
          TextSpan(
              text: positiveChange ? ".$ltpFractions${positiveSuffix!}" : ".$ltpFractions${negativeSuffix!}",
              style: positiveChange
                  ? positiveDecimalStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()])
                  : negativeDecimalStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()])),
        ],
      )),
    );
  }
}

class HoldingsFancyText extends StatelessWidget {
  HoldingsFancyText({
    required this.number,
    required this.positiveChange,
    this.positivePrefix = "",
    this.positiveSuffix = "",
    this.negativePrefix = "",
    this.negativeSuffix = "",
    this.showRupeeIcon = false,
    required this.positiveIntegerStyle,
    required this.positiveDecimalStyle,
    required this.negativeIntegerStyle,
    required this.negativeDecimalStyle,
    this.rsSignSize = 14,
    this.customAppStyle = false,
    this.numberFormat,
  });

  late dynamic number;
  late bool positiveChange;
  late String? positiveSuffix;
  late String? positivePrefix;
  late String? negativePrefix;
  late String? negativeSuffix;
  bool showRupeeIcon;
  late TextStyle positiveIntegerStyle;
  late TextStyle positiveDecimalStyle;
  late TextStyle negativeIntegerStyle;
  late TextStyle negativeDecimalStyle;
  late double? rsSignSize;
  late bool customAppStyle;

  NumberFormat? numberFormat;

  @override
  Widget build(BuildContext context) {
    int integer = number.toInt();
    String ltpFractions = number.toStringAsFixed(2).split('.')[1];
    if (number.isNegative && integer == 0) {
      if (negativePrefix != null) {
        negativePrefix = '${negativePrefix!}-';
      }
    }

    return Container(
      padding: EdgeInsets.all(0),
      child: RichText(
          text: TextSpan(
        children: [
          TextSpan(
            text: positiveChange ? positivePrefix! : negativePrefix!,
            style: customAppStyle == true
                ? positiveChange
                    ? positiveIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()], fontSize: 17.0)
                    : negativeIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()], fontSize: 17.0)
                : positiveChange
                    ? positiveIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()])
                    : negativeIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()]),
          ),
          TextSpan(
            text: positiveChange ? "" : "-",
            style: positiveChange ? positiveIntegerStyle : negativeIntegerStyle,
          ),
          if (showRupeeIcon)
            TextSpan(
                text: "lbl_rupee".tr,
                style: positiveChange
                    ? positiveIntegerStyle.copyWith(fontFamily: 'Manrope', fontFeatures: [FontFeature.tabularFigures()])
                    : negativeIntegerStyle.copyWith(fontFamily: 'Manrope', fontFeatures: [FontFeature.tabularFigures()])),
          TextSpan(
            text: positiveChange
                ? (numberFormat ?? NumberFormat.decimalPattern('hi')).format(integer)
                : (numberFormat ?? NumberFormat.decimalPattern('hi')).format(-integer),
            style: positiveChange
                ? positiveIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()])
                : negativeIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()]),
          ),
          TextSpan(
              text: positiveChange ? ".$ltpFractions${positiveSuffix!}" : ".$ltpFractions${negativeSuffix!}",
              style: positiveChange
                  ? positiveDecimalStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()])
                  : negativeDecimalStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()])),
        ],
      )),
    );
  }
}

class FnoFancyText extends StatelessWidget {
  FnoFancyText({
    required this.number,
    required this.positiveChange,
    this.positivePrefix = "",
    this.positiveSuffix = "",
    this.negativePrefix = "",
    this.negativeSuffix = "",
    this.showRupeeIcon = false,
    required this.positiveIntegerStyle,
    required this.positiveDecimalStyle,
    required this.negativeIntegerStyle,
    required this.negativeDecimalStyle,
    this.rsSignSize = 14,
    this.customAppStyle = false,
    this.numberFormat,
  });

  late dynamic number;
  late bool positiveChange;
  late String? positiveSuffix;
  late String? positivePrefix;
  late String? negativePrefix;
  late String? negativeSuffix;
  bool showRupeeIcon;
  late TextStyle positiveIntegerStyle;
  late TextStyle positiveDecimalStyle;
  late TextStyle negativeIntegerStyle;
  late TextStyle negativeDecimalStyle;
  late double? rsSignSize;
  late bool customAppStyle;

  NumberFormat? numberFormat;

  @override
  Widget build(BuildContext context) {
    int integer = number.toInt();
    String ltpFractions = number.toStringAsFixed(2).split('.')[1];
    if (number.isNegative && integer == 0) {
      if (negativePrefix != null) {
        negativePrefix = '${negativePrefix!}-';
      }
    }

    return Container(
      padding: EdgeInsets.all(0),
      child: RichText(
          text: TextSpan(
        children: [
          TextSpan(
            text: positiveChange ? "+" : "-",
            style: positiveChange ? positiveIntegerStyle : negativeIntegerStyle,
          ),
          TextSpan(
            text: positiveChange ? positivePrefix! : negativePrefix!,
            style: customAppStyle == true
                ? positiveChange
                    ? positiveIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()], fontSize: 17.0)
                    : negativeIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()], fontSize: 17.0)
                : positiveChange
                    ? positiveIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()])
                    : negativeIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()]),
          ),
          if (showRupeeIcon)
            TextSpan(
                text: "lbl_rupee".tr,
                style: positiveChange
                    ? positiveIntegerStyle.copyWith(fontFamily: 'Manrope', fontFeatures: [FontFeature.tabularFigures()])
                    : negativeIntegerStyle.copyWith(fontFamily: 'Manrope', fontFeatures: [FontFeature.tabularFigures()])),
          TextSpan(
            text: positiveChange
                ? (numberFormat ?? NumberFormat.decimalPattern('hi')).format(integer)
                : (numberFormat ?? NumberFormat.decimalPattern('hi')).format(-integer),
            style: positiveChange
                ? positiveIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()])
                : negativeIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()]),
          ),
          TextSpan(
              text: positiveChange ? ".$ltpFractions${positiveSuffix!}" : ".$ltpFractions${negativeSuffix!}",
              style: positiveChange
                  ? positiveDecimalStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()])
                  : negativeDecimalStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()])),
        ],
      )),
    );
  }
}

class NewTextFancy extends StatelessWidget {
  NewTextFancy({
    required this.number,
    required this.positiveChange,
    this.positivePrefix = "",
    this.positiveSuffix = "",
    this.negativePrefix = "",
    this.negativeSuffix = "",
    this.showRupeeIcon = false,
    required this.positiveIntegerStyle,
    required this.positiveDecimalStyle,
    required this.negativeIntegerStyle,
    required this.negativeDecimalStyle,
    this.rsSignSize = 14,
    this.customAppStyle = false,
    this.numberFormat,
  });

  late String? number;
  late bool positiveChange;
  late String? positiveSuffix;
  late String? positivePrefix;
  late String? negativePrefix;
  late String? negativeSuffix;
  bool showRupeeIcon;
  late TextStyle positiveIntegerStyle;
  late TextStyle positiveDecimalStyle;
  late TextStyle negativeIntegerStyle;
  late TextStyle negativeDecimalStyle;
  late double? rsSignSize;
  late bool customAppStyle;

  NumberFormat? numberFormat;

  @override
  Widget build(BuildContext context) {
    int integer = int.parse(number!);
    String ltpFractions = number!.split('.')[1];

    return Container(
      padding: EdgeInsets.all(0),
      child: RichText(
          text: TextSpan(
        children: [
          if (showRupeeIcon)
            TextSpan(
                text: "lbl_rupee".tr,
                style: positiveChange
                    ? positiveIntegerStyle.copyWith(fontFamily: 'Manrope', fontFeatures: [FontFeature.tabularFigures()])
                    : negativeIntegerStyle.copyWith(fontFamily: 'Manrope', fontFeatures: [FontFeature.tabularFigures()])),
          TextSpan(
            text: positiveChange ? positivePrefix! : negativePrefix!,
            style: customAppStyle == true
                ? positiveChange
                    ? positiveIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()], fontSize: 17.0)
                    : negativeIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()], fontSize: 17.0)
                : positiveChange
                    ? positiveIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()])
                    : negativeIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()]),
          ),
          TextSpan(
            text: positiveChange
                ? (numberFormat ?? NumberFormat.decimalPattern('hi')).format(integer)
                : (numberFormat ?? NumberFormat.decimalPattern('hi')).format(integer),
            style: positiveChange
                ? positiveIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()])
                : negativeIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()]),
          ),
          TextSpan(
              text: positiveChange ? ".$ltpFractions${positiveSuffix!}" : ".$ltpFractions${negativeSuffix!}",
              style: positiveChange
                  ? positiveDecimalStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()])
                  : negativeDecimalStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()])),
        ],
      )),
    );
  }
}

class FancyTextMFP extends StatelessWidget {
  FancyTextMFP(
      {required this.number,
      required this.positiveChange,
      this.positivePrefix = "",
      this.positiveSuffix = "",
      this.negativePrefix = "",
      this.negativeSuffix = "",
      this.showRupeeIcon = false,
      required this.positiveIntegerStyle,
      required this.positiveDecimalStyle,
      required this.negativeIntegerStyle,
      required this.negativeDecimalStyle,
      this.rsSignSize = 14,
      this.customAppStyle = false,
      this.numberFormat,
      this.isPer,
      this.shouldPrefixSuffixForZero = false});

  /// Should use prefix and suffix for zero as well
  late bool shouldPrefixSuffixForZero;
  late double number;
  late bool positiveChange;
  late String? positiveSuffix;
  late String? positivePrefix;
  late String? negativePrefix;
  late String? negativeSuffix;
  bool showRupeeIcon;
  late TextStyle positiveIntegerStyle;
  late TextStyle positiveDecimalStyle;
  late TextStyle negativeIntegerStyle;
  late TextStyle negativeDecimalStyle;
  late double? rsSignSize;
  late bool customAppStyle;
  bool? isPer;

  NumberFormat? numberFormat;

  @override
  Widget build(BuildContext context) {
    String formattedNumber;

    if (isPer ?? false) {
      if (positiveChange) {
        formattedNumber = number.toStringAsFixed(1);
      } else {
        formattedNumber = number.round().toString();
      }
    } else {
      formattedNumber = number.round().toString();
    }

    int integer = number.toInt();
    String ltpFractions = (isPer == true && formattedNumber.split('.').length == 2) ? formattedNumber.split('.')[1] : '00';
    if ((number.isNegative && integer == 0) && !shouldPrefixSuffixForZero) {
      if (negativePrefix != null) {
        negativePrefix = '${negativePrefix!}-';
      }
    }
    if (number == 0.0 && !shouldPrefixSuffixForZero) {
      positivePrefix = '';
    }
    return Container(
      padding: EdgeInsets.all(0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: positiveChange ? positivePrefix! : negativePrefix!,
              style: customAppStyle == true
                  ? positiveChange
                      ? positiveIntegerStyle.copyWith(
                          fontFeatures: [FontFeature.tabularFigures()],
                          fontSize: 17.0,
                        )
                      : negativeIntegerStyle.copyWith(
                          fontFeatures: [FontFeature.tabularFigures()],
                          fontSize: 17.0,
                        )
                  : positiveChange
                      ? positiveIntegerStyle.copyWith(
                          fontFeatures: [FontFeature.tabularFigures()],
                        )
                      : negativeIntegerStyle.copyWith(
                          fontFeatures: [FontFeature.tabularFigures()],
                        ),
            ),
            if (!positiveChange && !number.isNegative)
              TextSpan(
                text: "-",
                style: negativeIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()]),
              ),
            if (showRupeeIcon)
              TextSpan(
                text: "₹".tr,
                style: positiveChange
                    ? positiveIntegerStyle.copyWith(
                        fontFamily: 'Manrope',
                        fontFeatures: [FontFeature.tabularFigures()],
                      )
                    : negativeIntegerStyle.copyWith(
                        fontFamily: 'Manrope',
                        fontFeatures: [FontFeature.tabularFigures()],
                      ),
              ),
            TextSpan(
              text: positiveChange
                  ? (numberFormat ?? NumberFormat.decimalPattern('hi')).format(integer)
                  : (numberFormat ?? NumberFormat.decimalPattern('hi')).format(-integer),
              style: positiveChange ? positiveIntegerStyle : negativeIntegerStyle,
            ),
            TextSpan(
              text: positiveChange
                  ? isPer == true
                      ? ".${ltpFractions.substring(0, 1)}${positiveSuffix!}"
                      : ""
                  : isPer == true
                      ? ".${ltpFractions.substring(0, 1)}${negativeSuffix!}"
                      : "",
              style: positiveChange
                  ? positiveDecimalStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()])
                  : negativeDecimalStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()]),
            ),
          ],
        ),
      ),
    );
  }
}

class BORFancyText extends StatelessWidget {
  BORFancyText({
    required this.number,
    required this.positiveChange,
    this.positivePrefix = "",
    this.positiveSuffix = "",
    this.negativePrefix = "",
    this.negativeSuffix = "",
    this.showRupeeIcon = false,
    required this.positiveIntegerStyle,
    required this.positiveDecimalStyle,
    required this.negativeIntegerStyle,
    required this.negativeDecimalStyle,
    this.rsSignSize = 14,
    this.customAppStyle = false,
    this.numberFormat,
  });

  late dynamic number;
  late bool positiveChange;
  late String? positiveSuffix;
  late String? positivePrefix;
  late String? negativePrefix;
  late String? negativeSuffix;
  bool showRupeeIcon;
  late TextStyle positiveIntegerStyle;
  late TextStyle positiveDecimalStyle;
  late TextStyle negativeIntegerStyle;
  late TextStyle negativeDecimalStyle;
  late double? rsSignSize;
  late bool customAppStyle;

  NumberFormat? numberFormat;

  @override
  Widget build(BuildContext context) {
    int integer = number.toInt();
    String ltpFractions = number.toStringAsFixed(2).split('.')[1];

    return Container(
      padding: EdgeInsets.all(0),
      child: RichText(
          text: TextSpan(
        children: [
          TextSpan(
            text: positiveChange ? positivePrefix! : negativePrefix!,
            style: customAppStyle == true
                ? positiveChange
                    ? positiveIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()], fontSize: 17.0)
                    : negativeIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()], fontSize: 17.0)
                : positiveChange
                    ? positiveIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()])
                    : negativeIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()]),
          ),
          TextSpan(
            text: positiveChange ? "" : "-",
            style: positiveChange ? positiveIntegerStyle : negativeIntegerStyle,
          ),
          if (showRupeeIcon)
            TextSpan(
                text: "lbl_rupee".tr,
                style: positiveChange
                    ? positiveIntegerStyle.copyWith(fontFamily: 'Manrope', fontFeatures: [FontFeature.tabularFigures()])
                    : negativeIntegerStyle.copyWith(fontFamily: 'Manrope', fontFeatures: [FontFeature.tabularFigures()])),
          TextSpan(
            text: positiveChange
                ? (numberFormat ?? NumberFormat.decimalPattern('hi')).format(integer)
                : (numberFormat ?? NumberFormat.decimalPattern('hi')).format(-integer),
            style: positiveChange
                ? positiveIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()])
                : negativeIntegerStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()]),
          ),
          TextSpan(
              text: positiveChange ? ".$ltpFractions${positiveSuffix!}" : ".$ltpFractions${negativeSuffix!}",
              style: positiveChange
                  ? positiveDecimalStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()])
                  : negativeDecimalStyle.copyWith(fontFeatures: [FontFeature.tabularFigures()])),
        ],
      )),
    );
  }
}
