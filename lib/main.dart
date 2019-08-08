import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloc/counter.dart';
import 'bloc/name.dart';
import 'bloc/account.dart';

import 'screen/first.dart';
import 'screen/second.dart';
import 'screen/third.dart';
import 'screen/fourth.dart';
import 'dart:async';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterBloc>(builder: (_)=>CounterBloc()),
        ChangeNotifierProvider<NameBloc>(builder: (_)=>NameBloc()),
        ChangeNotifierProvider<AccountBloc>(builder: (_)=>AccountBloc(page:1)),
      ],
      child: MaterialApp(
        title: 'Provider & Bloc example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/':(context)=> FirstScreen(),
          '/second':(context)=>SecondScreen(),
          '/third':(context)=>ThirdScreen(),
          '/fourth':(context)=>FourthScreen(),
        },
      ),
    );
  }
}
