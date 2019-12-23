import 'package:flutter/material.dart';

class TextDetailView extends StatelessWidget {
  final String titleText;
  final String detailText;
  final Color backgroundColor;
  final Color textColor;

  TextDetailView(
      {this.titleText, this.detailText, this.backgroundColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 2, // has the effect of softening the shadow
                  spreadRadius: 1.0, // has the effect of extending the shadow
                  offset: Offset(
                    1, // horizontal, move right 10
                    1, // vertical, move down 10
                  ),
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(detailText,
                    style: Theme.of(context).primaryTextTheme.body1),
                Padding(
                  padding: EdgeInsets.only(bottom: 48),
                ),
                Text(
                  titleText,
                  style: Theme.of(context).primaryTextTheme.headline,
                ),
              ],
            ),
          )),
    );
  }
}
