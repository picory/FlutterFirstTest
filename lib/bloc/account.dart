import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../model/account.dart';

class AccountBloc with ChangeNotifier {
  var _accountList = [];
  var _isLoading = false;
  var page = 1;

  getLoading() => _isLoading;
  getList() => _accountList;
  getPage() => page;

  AccountBloc({this.page}){
    getData(this.page);
  }

  getData(page) async{
    var url = "https://api.github.com/search/repositories?q=flutter&page=${page}&per_page=20";  
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body)['items'];
      jsonResponse.forEach((i)=>_accountList.add(Account.fromJson(i)));
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
    _isLoading = false;
    notifyListeners();
  }
  void setLoading(){
    _isLoading = true;
    notifyListeners();
  }
  void setPage(page) {
    page = page;
    notifyListeners();
  }
}
