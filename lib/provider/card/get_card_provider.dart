import 'package:bankingapp/service/card/card_service.dart';
import 'package:flutter/cupertino.dart';

class GetCardprovider extends ChangeNotifier {
  GetCardprovider() {
    getCard();
  }
  CardService cardService = CardService();

  bool isLoading = false;
  String error = "";
  dynamic data;

 

  void getCard() async {
    isLoading = true;
    await cardService.getCards().then((dynamic response) {
      if (response is String) {
        isLoading = false;
        error = response;
        notifyListeners();
      } else {
        isLoading = false;
        data = response;
        notifyListeners();
      }
    });
  }
   Future<void> update() async {
    getCard();
  }
}
