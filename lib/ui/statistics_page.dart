import 'package:atro/consts/Colors/colors.dart';
import 'package:atro/consts/SizeConfig/size_config.dart';
import 'package:atro/models/sales_data_model.dart';
import 'package:atro/provider/statistics_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: _appBar(context),
      body: Column(
        children: [
          _chart(0, context),
          _chart(1, context),
          _chart(2, context),
          //Initialize the chart widget
        ],
      ),
    );
  }

  _chart(int i, BuildContext context) {
    return SizedBox(
      height: gpsH(487.0),
      width: gpsW(750.0),
      child: SfCartesianChart(
        borderColor: Colors.grey,
        primaryXAxis: CategoryAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          majorGridLines:
              const MajorGridLines(width: 2.0, color: Colors.transparent),
          majorTickLines:
              const MajorTickLines(size: 2.0, color: Colors.transparent),
          axisLine: const AxisLine(color: Colors.white, width: 2.0),
          isVisible: true,
        ),
        primaryYAxis: CategoryAxis(
            majorGridLines:
                MajorGridLines(color: Colors.grey.withOpacity(.3), width: .1),
            majorTickLines:
                const MajorTickLines(color: Colors.transparent, size: 2.0),
            axisLine: const AxisLine(color: Colors.white),
            isVisible: true),
        title: ChartTitle(
            text: context.watch<StatisticsProviderMy>().chartTitles[i],
            alignment: ChartAlignment.near),
        tooltipBehavior: TooltipBehavior(
          builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
              int seriesIndex) {
            return Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: context
                      .read<StatisticsProviderMy>()
                      .chartIndicatorColors[i]),
              child: Text(
                "\$" +
                    Provider.of<StatisticsProviderMy>(context, listen: false)
                        .selectedData[i][pointIndex]
                        .sales
                        .toString(),
                style: const TextStyle(color: Colors.white),
              ),
            );
          },
          color: context.watch<StatisticsProviderMy>().chartIndicatorColors[i],
          shouldAlwaysShow: true,
          activationMode: ActivationMode.singleTap,
          enable: true,
        ),
        series: <SplineAreaSeries<SalesData, String>>[
          SplineAreaSeries<SalesData, String>(
            markerSettings: const MarkerSettings(
                borderColor: Colors.red, shape: DataMarkerType.diamond),
            borderColor:
                context.watch<StatisticsProviderMy>().chartIndicatorColors[i],
            borderWidth: 2.0,
            gradient: LinearGradient(
              tileMode: TileMode.repeated,
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.white,
                context
                    .watch<StatisticsProviderMy>()
                    .chartIndicatorColors[i]
                    .withOpacity(.9),
              ],
            ),
            animationDuration: 2900.0,
            opacity: .2,
            isVisible: true,
            color:
                context.watch<StatisticsProviderMy>().chartIndicatorColors[i],
            dataSource: context.read<StatisticsProviderMy>().selectedData[i],
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
            name: '',
          ),
        ],
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: blackColor,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'MY BUDGET',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'Available now: \$3550.36',
            style: TextStyle(color: appBarSubtitleColor, fontSize: gpsW(25.0)),
          ),
        ],
      ),
      actions: [
        _dropDownButton(context),
      ],
    );
  }

  _dropDownButton(BuildContext context) {
    return DropdownButton<int>(
      underline: Container(
        alignment: Alignment.center,
        height: 40,
        child: Row(
          children: [
            Text(
              context.watch<StatisticsProviderMy>().title,
            ),
            SizedBox(
              width: gpsW(15.0),
            ),
            const Icon(
              Icons.expand_more,
              color: Colors.white,
            )
          ],
        ),
        color: blackColor,
      ),
      autofocus: true,
      focusColor: Colors.red,
      borderRadius: BorderRadius.circular(
        gpsW(30.0),
      ),
      value: context.watch<StatisticsProviderMy>().dropDownIndex,
      items: [
        __dropDownMenuItem(0, context),
        __dropDownMenuItem(1, context),
        __dropDownMenuItem(2, context),
        __dropDownMenuItem(3, context),
      ],
      style: const TextStyle(color: Colors.red),
      onChanged: (v) {
        context.read<StatisticsProviderMy>().changeDropDownValue(v!);
      },
    );
  }

  __dropDownMenuItem(int v, BuildContext context) {
    return DropdownMenuItem(
      value: v,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor:
                context.watch<StatisticsProviderMy>().dropDownIndex == v
                    ? Colors.blue
                    : Colors.grey,
            radius: gpsW(18.0),
            child: Icon(
              Icons.circle,
              color: Colors.white,
              size: context.watch<StatisticsProviderMy>().dropDownIndex == v
                  ? 10.0
                  : 20.0,
            ),
          ),
          SizedBox(
            width: gpsW(20.0),
          ),
          Text(
            context.watch<StatisticsProviderMy>().titles[v],
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
