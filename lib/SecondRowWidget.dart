import 'package:flutter/material.dart';

import 'charts/line_chart/stacked_area.dart';
import 'charts/pie_chart/outside_label.dart';
import 'charts/time_series_chart/with_bar_renderer.dart';

class SecondRowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(vertical: 16),
      sliver: SliverToBoxAdapter(
        child: getLayoutWidget(context),
      ),
    );
  }

  int calculateCrossAxisCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 1024) {
      return 1;
    } else {
      return 2;
    }
  }

  Widget getLayoutWidget(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 1024) {
      return Column(
        children: <Widget>[
          SalesDataColumn(),
          Padding(
            padding: EdgeInsets.only(bottom: 16),
          ),
          StackedAreaSalesLineChart(),
          Padding(
            padding: EdgeInsets.only(bottom: 16),
          ),
          PieOSData()
        ],
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: SalesDataColumn(),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                StackedAreaSalesLineChart(),
                Padding(
                  padding: EdgeInsets.only(bottom: 24),
                ),
                PieOSData(),
              ],
            ),
          )
        ],
      );
    }
  }
}

class PieOSData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "OS Distribution",
              style: Theme.of(context).textTheme.display1,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
            ),
            Container(
              child: PieOutsideLabelChart.withSampleData(),
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}

class StackedAreaSalesLineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Average Users",
              style: Theme.of(context).textTheme.display1,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
            ),
            Container(
                height: 200, child: StackedAreaLineChart.withSampleData()),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
            ),
            Row(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Mobile"),
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                    ),
                    Container(
                      color: Colors.green,
                      height: 10,
                      width: 40,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16),
                ),
                Row(
                  children: <Widget>[
                    Text("Web"),
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                    ),
                    Container(
                      color: Colors.red,
                      height: 10,
                      width: 40,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16),
                ),
                Row(
                  children: <Widget>[
                    Text("Desktop"),
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                    ),
                    Container(
                      color: Colors.blue,
                      height: 10,
                      width: 40,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SalesDataColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "\$75,777,00",
                  style: Theme.of(context).textTheme.display1,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8),
                ),
                Text(
                  "+52.55%",
                  style: Theme.of(context)
                      .textTheme
                      .headline
                      .apply(color: Colors.green),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
            ),
            Container(
              child: TimeSeriesBar.withSampleData(),
              height: 550,
            ),
          ],
        ),
      ),
    );
  }
}
