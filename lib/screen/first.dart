import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../bloc/counter.dart';
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterBloc = Provider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider & Bloc example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Counter Value is: ${counterBloc.getCounter()}',
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(
              child: Text('Next example (second)'),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () => counterBloc.incrementCounter(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 30),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () => counterBloc.decrementCounter(),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          
        ],
      ),
    );
  }
}
