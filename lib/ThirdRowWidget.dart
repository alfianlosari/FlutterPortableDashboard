import 'package:flutter/material.dart';

import 'charts/i18n/rtl_bar_chart.dart';
import 'charts/line_chart/simple.dart';
import 'charts/scatter_plot_chart/simple.dart';

class ForthRowWidget extends StatelessWidget {
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
          ScatterPlotWidget(),
          Padding(
            padding: EdgeInsets.only(bottom: 16),
          ),
          SeriesLineChart(),
          Padding(
            padding: EdgeInsets.only(bottom: 16),
          ),
          EventBarChart()
        ],
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: ScatterPlotWidget(),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
          ),
          Expanded(
            flex: 1,
            child: SeriesLineChart(),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
          ),
          Expanded(
            flex: 1,
            child: EventBarChart(),
          ),
        ],
      );
    }
  }
}

class ScatterPlotWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "Usage Pattern",
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
            ),
            Container(
                height: 250, child: SimpleScatterPlotChart.withSampleData()),
          ],
        ),
      ),
    );
  }
}

class SeriesLineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "Crash Free",
                  style: Theme.of(context).textTheme.display1,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8),
                ),
                Text(
                  "+1.65%",
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
            Container(height: 250, child: SimpleLineChart.withSampleData()),
          ],
        ),
      ),
    );
  }
}

class EventBarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "Total Events",
                  style: Theme.of(context).textTheme.display1,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8),
                ),
                Text(
                  "+120.12%",
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
            Container(height: 250, child: RTLBarChart.withSampleData()),
          ],
        ),
      ),
    );
  }
}
