import 'package:flutter/material.dart';

import 'GaugeText.dart';
import 'TextDetailView.dart';
import 'charts/pie_chart/gauge.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class FirstRowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(top: 32, bottom: 16),
      sliver: SliverGrid.count(
        crossAxisCount: calculateCrossAxisCount(context),
        childAspectRatio: (MediaQuery.of(context).size.width /
                (calculateCrossAxisCount(context))) /
            242,
        crossAxisSpacing: 0,
        mainAxisSpacing: 16,
        children: [
          GaugeText("CPU USAGE", 0.9, [
            new GaugeSegment(
                'Low', 500, charts.ColorUtil.fromDartColor(Colors.green[500])),
            new GaugeSegment('Acceptable', 150,
                charts.ColorUtil.fromDartColor(Colors.yellow[800])),
            new GaugeSegment('High', 100,
                charts.ColorUtil.fromDartColor(Colors.orange[800])),
            new GaugeSegment('Highly Unusual', 50,
                charts.ColorUtil.fromDartColor(Colors.red[800])),
          ]),
          GaugeText("RAM USAGE", 0.4, [
            new GaugeSegment(
                'Low', 500, charts.ColorUtil.fromDartColor(Colors.green[500])),
            new GaugeSegment('Acceptable', 150,
                charts.ColorUtil.fromDartColor(Colors.yellow[800])),
            new GaugeSegment('High', 100,
                charts.ColorUtil.fromDartColor(Colors.orange[800])),
            new GaugeSegment('Highly Unusual', 50,
                charts.ColorUtil.fromDartColor(Colors.red[800])),
          ]),
          GaugeText("DISK USAGE", 0.95, [
            new GaugeSegment(
                'Low', 500, charts.ColorUtil.fromDartColor(Colors.green[500])),
            new GaugeSegment('Acceptable', 150,
                charts.ColorUtil.fromDartColor(Colors.yellow[800])),
            new GaugeSegment('High', 100,
                charts.ColorUtil.fromDartColor(Colors.orange[800])),
            new GaugeSegment('Highly Unusual', 50,
                charts.ColorUtil.fromDartColor(Colors.red[800])),
          ]),
          GaugeText("GPU USAGE", 0.25, [
            new GaugeSegment(
                'Low', 500, charts.ColorUtil.fromDartColor(Colors.green[500])),
            new GaugeSegment('Acceptable', 150,
                charts.ColorUtil.fromDartColor(Colors.yellow[800])),
            new GaugeSegment('High', 100,
                charts.ColorUtil.fromDartColor(Colors.orange[800])),
            new GaugeSegment('Highly Unusual', 50,
                charts.ColorUtil.fromDartColor(Colors.red[800])),
          ]),
          TextDetailView(
            titleText: "10.000.000",
            detailText: "Total Downloads",
            backgroundColor: Colors.pink[400],
            textColor: Colors.white,
          ),
          TextDetailView(
            titleText: "5.768.987",
            detailText: "Daily Active Users",
            backgroundColor: Colors.teal[700],
            textColor: Colors.white,
          ),
          TextDetailView(
            titleText: "25.556",
            detailText: "Daily New Users",
            backgroundColor: Colors.blue[700],
            textColor: Colors.white,
          ),
          TextDetailView(
            titleText: "99.99%",
            detailText: "Crash Free Users",
            backgroundColor: Colors.green[700],
            textColor: Colors.white,
          )
        ],
      ),
    );
  }

  int calculateCrossAxisCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width <= 500) {
      return 1;
    } else if (width < 768) {
      return 2;
    } else if (width < 1500) {
      return 4;
    } else {
      return 8;
    }
  }
}
