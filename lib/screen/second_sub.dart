import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../bloc/counter.dart';
class SecondSub extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<CounterBloc>(context);
    return Text('SecondSub Counter Value is: ${counterModel.getCounter()}');
  }
}
