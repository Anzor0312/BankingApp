import 'package:bankingapp/service/card/card_service.dart';
import 'package:flutter/cupertino.dart';

class AddCardprovider extends ChangeNotifier {
  CardService cardService = CardService();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardDateController = TextEditingController();

  bool isLoading = false;
  String error = "";
  dynamic data;

  void addCard() async {
    isLoading = true;
    await cardService
        .addCard(
            cardNumber: cardNumberController.text,
            cardDate: cardDateController.text)
        .then((dynamic response) {
      if (response is String) {
        isLoading = false;
        error = response;
        notifyListeners();
      } else {
        isLoading = false;
        data = response;
        notifyListeners();
      }
      cardDateController.clear();
      cardNumberController.clear();
      notifyListeners();
    });
  }
}
