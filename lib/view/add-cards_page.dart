import 'package:bankingapp/provider/card/add_card_provider.dart';
import 'package:bankingapp/view/my_card_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddCardprovider(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/", (route) => false);

                setState(() {});
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            title: const Text("Add Card"),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                TextFormField(
                  controller:
                      context.watch<AddCardprovider>().cardNumberController,
                  maxLength: 16,
                  decoration: InputDecoration(
                    hintText: "Card number",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    controller:
                        context.watch<AddCardprovider>().cardDateController,
                    maxLength: 4,
                    decoration: InputDecoration(
                        labelText: "Expire date",
                        hintText: "mm/yy",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        )))
              ],
            ),
          ),
          floatingActionButton: ElevatedButton(
            onPressed: () {
              context.read<AddCardprovider>().addCard();
               Navigator.pushNamedAndRemoveUntil(
                context, "/", (route) => false);
                      
                    
                    setState(() {
                      
                    });
            },
            child: context.read<AddCardprovider>().isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const Text("Kartani qo'shish"),
          ),
        );
      },
    );
  }
}
