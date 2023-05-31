import 'package:bankingapp/provider/card/get_card_provider.dart';
import 'package:bankingapp/view/add-cards_page.dart';
import 'package:bankingapp/view/transfer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class MyCardPage extends StatefulWidget {
  const MyCardPage({super.key});

  @override
  State<MyCardPage> createState() => _MyCardPageState();
}

class _MyCardPageState extends State<MyCardPage> {
  @override
  Widget build(BuildContext context) {
    GetCardprovider provider = Provider.of<GetCardprovider>(context);
    return ChangeNotifierProvider(
      create: (context) => GetCardprovider(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('My Card'), actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddCardPage(),
                    ));
              },
              icon: const Icon(Icons.add),
            ),
          ]),
          body: Builder(
            builder: (context) {
              if (provider.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (provider.error.isNotEmpty) {
                return Center(
                  child: Text(provider.error),
                );
              } else {
                return RefreshIndicator(
                  onRefresh: context.read<GetCardprovider>().update,
                  child: PageView.builder(
                   
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:const  EdgeInsets.symmetric(horizontal: 12,vertical: 15),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius:BorderRadius.circular(15),
                                color: Colors.red,
                                image: DecorationImage(image: NetworkImage(provider.data[index]['img']),fit: BoxFit.fill,)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(provider.data[index]["number"].toString(),style:const TextStyle(color: Colors.white),),
                                    Text(provider.data[index]["user"].toString(),style:const TextStyle(color: Colors.white)),
                                    Text(provider.data[index]["data"].toString(),style:const TextStyle(color: Colors.white)),
                                   
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: (provider.data as List).length,
                  ),
                );
              }
            },
          ),
          floatingActionButton: ElevatedButton(onPressed: (){
             Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TransferPage(),
                    ));
          }, child:const Text("O'tkazmalar")),
        );
      },
    );
  }
}
