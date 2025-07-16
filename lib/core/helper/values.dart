import 'package:el_wekala/core/helper/cash_helper/cash_helper.dart';

var token = CashHelper.getData(key: "token");
var email = CashHelper.getData(key: "email");

String tokenKey = "token";
bool isLogin = true;
var  getIsLogin = CashHelper.getBool(key: "loginKey")??true;
