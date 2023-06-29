import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constants/font_family.dart';

class CustomText{
  static Widget richText(String text,Widget icon,{Color colors=Colors.black,FontWeight fontWeight=FontWeight.w600,double fontSize=14,EdgeInsets margin = EdgeInsets.zero}){
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        style: TextStyle(color: colors, fontSize: fontSize, fontWeight: fontWeight,fontFamily: FontFamily.montserrat, ),
        children: [
          WidgetSpan(
            child: Container(
                margin: margin,
                child: icon),
          ),
          TextSpan(
            text: text,
          ),
        ],
      ),
    );
  }

  static Widget text(String text,{FontWeight weight=FontWeight.normal, Color color=Colors.white, double size=14.0,FontStyle fontStyle = FontStyle.normal,TextOverflow overFlow=TextOverflow.visible, int? maxLines,TextAlign textAlign=TextAlign.start}) {
    return Text(
        text,
        overflow:overFlow,
        maxLines: maxLines,
        textAlign: textAlign,
        style: TextStyle(
          fontWeight: weight,
          fontStyle: fontStyle,
          color: color,
          fontSize: size,
          fontFamily: FontFamily.montserrat,
        ));
  }
}