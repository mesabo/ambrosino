
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormatDates {
  String dateFormatShortMonthDayYear(String date) {
    return DateFormat.yMMMd().format(DateTime.parse(date));
  }

  String dateFormatDayNumber(String date) {
    return DateFormat.d().format(DateTime.parse(date));
  }

  String dateFormatShortDayName(String date) {
    return DateFormat.E().format(DateTime.parse(date));
  }

  String dateFormatFamily(String date){
    return DateFormat("EEE, MMM d,''yyyy").format(DateTime.parse(date));
  }

  String dateFormatSimple(String date,BuildContext context) {
    return DateFormat.yMMMMd(Localizations.localeOf(context).languageCode).format(DateTime.parse(date));
  }

  String dateFormatWithYear(DateTime date){
    return DateFormat.yMMMd().format(date);
  }
}