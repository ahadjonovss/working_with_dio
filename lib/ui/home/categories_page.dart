import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:provider/provider.dart';
import 'package:working_with_dio/view_model/categories_view_model.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        body: Center(
          child: Consumer<CategoriesViewModel>(
            builder: (context, value, child) {
              if (value.categories != null) {
                int currentInfo=context.watch<CategoriesViewModel>().currentInfo;
                List categories=value.categories!;
                return SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 200,),
                      const Center(child: Text("Information",style: TextStyle(fontWeight: FontWeight.w600),),),
                      const SizedBox(height: 20,),
                      Container(
                        color: Color(int.parse("0xFF${categories[currentInfo].color.substring(1,6)}")),
                        child: Column(
                          children: [
                            Text('Id: ${categories[currentInfo].id.toString()}'),
                            Text('Income type: ${categories[currentInfo].incomeType.toString()}'),
                          ],
                        ),
                      ),

                       Padding(
                        padding: const EdgeInsets.all(30),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder()
                          ),
                          onSubmitted: (value) {
                            context.read<CategoriesViewModel>().changeInfo(int.parse(value)%6);
                          },

                        ),
                      )

                    ],
                  ),
                );
              }
              return const Text("No data");
            },
          ),
        ),
      ),
    );
  }
}
