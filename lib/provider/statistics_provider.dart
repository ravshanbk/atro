import 'dart:math';

import 'package:atro/consts/Colors/colors.dart';
import 'package:atro/models/sales_data_model.dart';
import 'package:flutter/cupertino.dart';

class StatisticsProviderMy extends ChangeNotifier {
  int dropDownIndex = 0;

  changeDropDownValue(int v) {
    dropDownIndex = v;
    notifyListeners();
  }

  List<List<SalesData>> get selectedData => _datas[dropDownIndex];
  List<String> titles = [
    "1 MONTH",
    "6 MONTH",
    "1 YEAR",
    "5 YEARS",
  ];
  List<String> chartTitles = [
    "Savings",
    "Expanses",
    "Investments",
  ];
  List<Color> chartIndicatorColors = [
    savingsChartColor,
    expansesChartColor,
    investmentsChartColor,
  ];

  final List _datas = [
    [
      List.generate(
        31,
        (index) => SalesData(
            "${index + 1} - day", Random().nextInt(Aaa().savingsIn) + 10),
      ),
      List.generate(
        31,
        (index) => SalesData(
            "${index + 1} - day", Random().nextInt(Aaa().expansesIn) + 10),
      ),
      List.generate(
        31,
        (index) => SalesData(
            "${index + 1} - day", Random().nextInt(Aaa().investmentsIn) + 10),
      ),
    ],
    [
      List.generate(
          6,
          (index) => SalesData(
              Aaa().months[index], Random().nextInt(Aaa().savingsIn) + 10)),
      List.generate(
          6,
          (index) => SalesData(
              Aaa().months[index], Random().nextInt(Aaa().expansesIn) + 10)),
      List.generate(
          6,
          (index) => SalesData(
              Aaa().months[index], Random().nextInt(Aaa().investmentsIn) + 10)),
    ],
    [
      List.generate(
        12,
        (index) => SalesData(
            Aaa().months[index], Random().nextInt(Aaa().savingsIn) + 10),
      ),
      List.generate(
        12,
        (index) => SalesData(
            Aaa().months[index], Random().nextInt(Aaa().expansesIn) + 10),
      ),
      List.generate(
        12,
        (index) => SalesData(
            Aaa().months[index], Random().nextInt(Aaa().investmentsIn) + 10),
      ),
    ],
    [
      List.generate(
        5,
        (index) => SalesData(
            "${index + 1} - year", Random().nextInt(Aaa().savingsIn) + 10),
      ),
      List.generate(
        5,
        (index) => SalesData(
            "${index + 1} - year", Random().nextInt(Aaa().expansesIn) + 10),
      ),
      List.generate(
        5,
        (index) => SalesData(
            "${index + 1} - year", Random().nextInt(Aaa().investmentsIn) + 10),
      ),
    ],
  ];
  String get title => titles[dropDownIndex];
}

class Aaa {
  final List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];
  int savingsIn = 90;
  int expansesIn = 260;
  int investmentsIn = 50;
}
