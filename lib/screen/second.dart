import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../bloc/counter.dart';
import '../bloc/name.dart';
import './second_sub.dart';
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterBloc = Provider.of<CounterBloc>(context);
    final nameBloc = Provider.of<NameBloc>(context);
    String name;
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider & Bloc example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SecondSub(), //This is sub widget
            Text('Counter Value is: ${counterBloc.getCounter()}'),   // Also, it is not necessary to separate like SecondSub()
            Text('Name is : ${nameBloc.getName()}'),
            Container(
              margin: EdgeInsets.only(right: 50,left:50),
              child: TextField(
                textAlign: TextAlign.center,
                onChanged: (str){
                  name=str;
                },
                decoration: InputDecoration(
                  hintText: 'Put in your name'
                ),
              ),
            ),
            RaisedButton(
              child: Text('Save name'),
              onPressed: () => nameBloc.setName(name),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  child: Text('Next example(Third)'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/third');
                  },
                ),
                RaisedButton(
                  child: Text('Next example(Fourth)'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/fourth');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
     
    );
  }
}
