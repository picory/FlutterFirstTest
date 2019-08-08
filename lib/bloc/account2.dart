import 'package:rxdart/rxdart.dart';
import '../model/account.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
class AccountBloc2 {
  BehaviorSubject<List<Account>> _accountList;
  BehaviorSubject<bool> _loadingStream;
  
  List<Account> tmpList = new List();
  int page;
  bool _loading; 
  Observable get accountObservable => _accountList.stream; 
  Observable get loadingObservable => _loadingStream.stream;

  AccountBloc2({this.page}){
    _accountList = new BehaviorSubject.seeded(List<Account>.generate(0, (int index){
      return null;
    }));
    _loadingStream = new BehaviorSubject.seeded(false);
    getData(this.page);
  }
  
  getData(page) async{
    var url = "https://api.github.com/search/repositories?q=flutter&page=${page}&per_page=20";  
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body)['items'];
      jsonResponse.forEach((i)=>tmpList.add(Account.fromJson(i)));
      _accountList.sink.add(tmpList);
      
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
    _loadingStream.sink.add(false);
    _loading = false;
  }

  getLength() => _accountList.value.length;
  setPage() => page++;
  getPage() => page;
  void setLoading() {
    _loading=true;
    _loadingStream.sink.add(true);
  }
  getLoading() => _loading;
  
  void dispose(){
    _accountList.close();
    _loadingStream.close();
  }

}