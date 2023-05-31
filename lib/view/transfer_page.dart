import 'package:bankingapp/provider/card/get_card_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transfer"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Column(
              children: [
                const Text("From"),
                SizedBox(
                  height: 230,
                  width: double.infinity,
                  child: ChangeNotifierProvider(
                    create: (context) => GetCardprovider(),
                    builder: (context, child) {
                      return Builder(
                        builder: (context) {
                          GetCardprovider provider =
                              Provider.of<GetCardprovider>(context);
                          if (provider.isLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (provider.error.isNotEmpty) {
                            return Center(
                              child: Text(provider.error),
                            );
                          } else {
                            return PageView.builder(
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 15),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 200,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.red,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  provider.data[index]['img']),
                                              fit: BoxFit.fill,
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                provider.data[index]["number"]
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                  provider.data[index]["user"]
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.white)),
                                              Text(
                                                  provider.data[index]["data"]
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.white)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: (provider.data as List).length,
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
                const Text("TO"),
                TextFormField(
                    maxLength: 16,
                    decoration: InputDecoration(
                        labelText: "Card Number",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ))),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    decoration: InputDecoration(
                        labelText: "Pul miqdori",
                        suffix: const Text("UZS"),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ))),
                    const    SizedBox(height: 15,),
                         SizedBox(
                          width: double.infinity,
                          
        height: 60,
        child: ElevatedButton(onPressed: (){},child:const Text("O'tkazish"),),
      ),
              ],
            );
          },
          itemCount: 1,
        ),
      ),
     
    );
  }
}
