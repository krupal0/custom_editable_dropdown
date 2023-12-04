import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_dimens.dart';

const fontWeightExtraLight = FontWeight.w200;
const fontWeightLight = FontWeight.w300;
const fontWeightRegular = FontWeight.w400;
const fontWeightMedium = FontWeight.w500;
const fontWeightW600 = FontWeight.w600;
const fontWeightSemiBold = FontWeight.w700;
const fontWeightBold = FontWeight.w700;
const fontWeightExtraBold = FontWeight.w800;

TextStyle textStyleAsapExtraLight({
  Color? color,
  double? fontSize,
}) =>
    TextStyle(
        color: color ?? AppColors.blackColor,
        fontSize: fontSize ?? AppDimens.fontMedium1sp,
        fontWeight: fontWeightExtraLight,
        letterSpacing: 0.4);

TextStyle textStyleAsapLight({
  Color? color,
  double? fontSize,
}) =>
    TextStyle(
        color: color ?? AppColors.blackColor,
        fontSize: fontSize ?? AppDimens.fontMedium1sp,
        fontWeight: fontWeightLight,
        letterSpacing: 0.4);

TextStyle textStyleAsapRegular(
        {Color? color,
        double? fontSize,
        double? height,
        TextDecoration? decoration = TextDecoration.none}) =>
    TextStyle(
        color: color ?? AppColors.blackColor,
        fontSize: fontSize ?? AppDimens.fontMedium1sp,
        fontWeight: fontWeightRegular,
        //fontFamily: "Rubik",
        fontFamily: "OpenSans",
        height: height,
        decoration: decoration);

TextStyle textStyleAsapMedium(
        {Color? color, double? fontSize, double? height}) =>
    TextStyle(
      color: color ?? AppColors.blackColor,
      fontSize: fontSize ?? AppDimens.fontMedium1sp,
      fontWeight: fontWeightMedium,
      fontFamily: "OpenSans",
      height: height,
    );

TextStyle textStyleAsapW600({Color? color, double? fontSize}) => TextStyle(
    color: color ?? AppColors.blackColor,
    fontSize: fontSize ?? AppDimens.fontMedium1sp,
    fontWeight: fontWeightW600,
    letterSpacing: 0.4);

TextStyle textStyleAsapSemiBold(
        {Color? color,
        double? fontSize,
        double? letterSpacing,
        TextDecoration textDecoration = TextDecoration.none}) =>
    TextStyle(
        color: color ?? AppColors.blackColor,
        fontSize: fontSize ?? AppDimens.fontMedium1sp,
        fontWeight: fontWeightSemiBold,
        fontFamily: "OpenSans",
        letterSpacing: letterSpacing ?? 0.0,
        decoration: textDecoration);

TextStyle textStyleAsapBold({Color? color, double? fontSize}) => TextStyle(
    color: color ?? AppColors.blackColor,
    fontSize: fontSize ?? AppDimens.fontMedium1sp,
    fontWeight: fontWeightBold,
    fontFamily: "OpenSans",
    letterSpacing: 0.4);

TextStyle textStyleUnderline({Color? color, double? fontSize}) => TextStyle(
    color: color ?? AppColors.primaryColor,
    fontSize: fontSize ?? AppDimens.fontMedium1,
    fontWeight: fontWeightRegular,
    decoration: TextDecoration.underline,
    fontFamily: "OpenSans",
    letterSpacing: 0.4);

TextStyle textStyleAsapPlayFairMedium(
    {Color? color, double? fontSize, double? height}) =>
    TextStyle(
      color: color ?? AppColors.blackColor,
      fontSize: fontSize ?? AppDimens.fontMedium1sp,
      fontWeight: fontWeightBold,
      fontFamily: "PlayfairDisplay",
      height: height,
    );