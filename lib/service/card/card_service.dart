import 'package:dio/dio.dart';

class CardService {
   Future<dynamic> getCards() async {
    try {
      Response response = await Dio().get("http://192.168.0.103:3000/card");
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return e.message.toString();
    }
  }
 Future<dynamic> addCard({required String cardNumber,required String cardDate})async{
  try {
      Response response = await Dio().post("http://192.168.0.103:3000/cards",data: {
        "number":cardNumber,
    "data":cardDate,
    "user":"Anzor Ravshanov",
    "phone":"+998939691500",
    "ballanc":"5000000",
      "img":"https://logos-download.com/wp-content/uploads/2022/01/Uzcard_Logo_old-2048x1285.png"
      },options: Options(contentType: "application/json"));
      if (response.statusCode == 201) {
        return response.data;
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return e.message.toString();
    }
 }


}
