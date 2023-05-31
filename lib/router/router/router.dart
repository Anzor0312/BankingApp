
import 'package:bankingapp/view/add-cards_page.dart';
import 'package:bankingapp/view/my_card_page.dart';
import 'package:bankingapp/view/transfer_page.dart';
import 'package:flutter/material.dart';


class RouteGenerator {
  static final RouteGenerator _generator = RouteGenerator._init();
  static RouteGenerator get router => _generator;

  RouteGenerator._init();
  Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return _navigator(const MyCardPage());
      case "add":
        return _navigator(const AddCardPage());
        case "tranfer":
        return _navigator(const TransferPage());
     
    }
    return null;
  }

  MaterialPageRoute _navigator(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
