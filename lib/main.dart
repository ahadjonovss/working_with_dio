import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:working_with_dio/data/api_service/api_service.dart';
import 'package:working_with_dio/data/repositories/category_repository.dart';
import 'package:working_with_dio/data/repositories/transfer_repository.dart';
import 'package:working_with_dio/ui/main_page.dart';
import 'package:working_with_dio/view_model/categories_view_model.dart';
import 'package:working_with_dio/view_model/transfer_view_model.dart';

void main() {
  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TransferViewModel(transferRepository: TransferRepository(simpleApiService: ApiService())),),
        ChangeNotifierProvider(create: (context) => CategoriesViewModel(categoryRepository: CategoryRepository(simpleApiService: ApiService())),)
      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage()
    );
  }
}
