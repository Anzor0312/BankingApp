import 'package:bankingapp/provider/card/get_card_provider.dart';
import 'package:bankingapp/view/add-cards_page.dart';
import 'package:bankingapp/view/my_card_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers:[
   ChangeNotifierProvider(create: (context) => GetCardprovider(),),
   ]
   ,child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    debugShowCheckedModeBanner: false,
    home:MyCardPage() ,
    );
  }
}
