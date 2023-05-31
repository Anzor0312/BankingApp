import 'package:flutter/cupertino.dart';

class TransferCardProvider extends ChangeNotifier {
  String fromUser  = "";
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  void transfer(){}

}
