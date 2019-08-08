import 'package:flutter/material.dart';
import '../bloc/account2.dart';

class FourthScreen  extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new FourthState();
}
class FourthState extends State<FourthScreen> {
  AccountBloc2 _accountBloc = new AccountBloc2(page:1);
  @override
  void dispose() {
    _accountBloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider & Bloc example"),
      ),
      body: Stack(
        children: <Widget>[
          Scrollbar(
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                  if (!_accountBloc.getLoading()) {
                    _accountBloc.setPage();
                    _accountBloc.setLoading();
                    _accountBloc.getData(_accountBloc.getPage());
                    return true;
                  }
                }
                return false;
              },
              child: StreamBuilder(
                stream : _accountBloc.accountObservable,
                builder: (context, AsyncSnapshot snapshot){
                  return ListView.builder(
                    itemCount: _accountBloc.getLength(),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          leading:
                            Image.network(snapshot.data[index].avatar),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(child:Text('${snapshot.data[index].name}')),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.star),
                                  Text('${snapshot.data[index].star}'),
                                ],
                              )
                            ],
                          ),
                          subtitle: Row(
                            children: <Widget>[Expanded(child: Text('${snapshot.data[index].description}'))],
                          )
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ),
          StreamBuilder(
            stream: _accountBloc.loadingObservable ,
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.data == true){
                return Align(
                  child: Container(
                    width: 200.0,
                    height: 150.0,
                    child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(child: CircularProgressIndicator())),
                  ),
                  alignment: FractionalOffset.bottomCenter,
                );
              }else{
                return SizedBox( 
                  width: 0.0,
                  height: 0.0,
                );
              }
              
            },
          ),
        ],
      )
    );
  }
}




          