import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'charts/pie_chart/gauge.dart';

class GaugeText extends StatelessWidget {
  final String title;
  final double currentProgress;
  final List<GaugeSegment> segments;

  GaugeText(this.title, this.currentProgress, this.segments);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 242,
        child: Stack(children: [
          GaugeChart(
            _createGauge(segments),
            animate: false,
            arcWidth: 10,
          ),
          Transform.scale(
            scale: 0.84,
            child: GaugeChart(
              _createCurrentGauge(),
              arcWidth: 30,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              (currentProgress * 100).toInt().toString() + "%",
              style: Theme.of(context).textTheme.headline,
            ),
          ),
          Positioned(
            bottom: 32,
              left: 0,
              right: 0,
              child: Text(

                title,
                style: Theme.of(context).textTheme.title,
                textAlign: TextAlign.center,
              )

          )
        ]));
  }

  List<charts.Series<GaugeSegment, String>> _createCurrentGauge() {
    final totalCount = this.segments.fold(0, (a, b) => a + b.size);
    charts.Color color = charts.ColorUtil.fromDartColor(Colors.red);
    double size = 0;

    for (var i = 0; i < this.segments.length; i++) {
      final segment = this.segments[i];
      size += segment.size;
      final fraction = size / totalCount;
      if (currentProgress <= fraction) {
        color = segment.color;
        break;
      }
    }

    final data = [
      new GaugeSegment('Low', (currentProgress * 100).toInt(), color),
      new GaugeSegment('High', ((1 - currentProgress) * 100).toInt(),
          charts.ColorUtil.fromDartColor(Colors.grey[200])),
    ];

    return _createGauge(data);
  }

  List<charts.Series<GaugeSegment, String>> _createGauge(
      List<GaugeSegment> segments) {
    return [
      new charts.Series<GaugeSegment, String>(
        id: 'Segments',
        colorFn: (segment, _) => segment.color,
        domainFn: (GaugeSegment segment, _) => segment.segment,
        measureFn: (GaugeSegment segment, _) => segment.size,
        data: segments,
      )
    ];
  }
}
