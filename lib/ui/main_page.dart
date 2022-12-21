import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:working_with_dio/ui/home/kunuz.dart';
import 'package:working_with_dio/ui/home/transfer_page.dart';
import 'package:working_with_dio/ui/home/categories_page.dart';
import 'package:working_with_dio/view_model/categories_view_model.dart';
import 'package:working_with_dio/view_model/transfer_view_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    List pages = [TransfersPage(), CategoriesPage(),KunUz()];
    return Scaffold(
      body: pages[currentPage],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.download),
        onPressed: () {
          if (currentPage == 0) {
            context.read<TransferViewModel>().listenTransfers();
          } else {
            context.read<CategoriesViewModel>().listenTransfers();
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (v) {
          setState(() {
            currentPage = v;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.local_airport), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.web), label: ""),
        ],
      ),
    );
  }
}
