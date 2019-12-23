import 'package:flutter/material.dart';

import 'FirstRowWidget.dart';
import 'ThirdRowWidget.dart';
import 'SecondRowWidget.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Dashboard Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Portable UI Dashboard Demo"),
      ),
      body: Container(

        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            constraints: BoxConstraints(maxWidth: 1600),
            child: CustomScrollView(
              slivers: <Widget>[
                FirstRowWidget(),
                SecondRowWidget(),
                ForthRowWidget(),
                FooterRowWidget()]
            ),
          ),
        ),
      ),
    );
  }


}


class FooterRowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(vertical: 32),
      sliver: SliverToBoxAdapter(
        child: Text("Built with Flutter 1.12 SDK & charts_flutter.\nAlfian Losari", textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline,),
      ),
    );
  }
}
