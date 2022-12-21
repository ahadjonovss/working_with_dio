import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:working_with_dio/ui/home/transfer_page.dart';
import 'package:working_with_dio/ui/home/second_task.dart';
import 'package:working_with_dio/view_model/transfer_view_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage=0;
  @override
  Widget build(BuildContext context) {
    List pages=[
      TransfersPage(),
      SecondTask()
    ];
    return Scaffold(
      body: pages[currentPage],
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.read<TransferViewModel>().listenTransfers();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (v){
          setState(() {
            currentPage=v;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.local_airport),label: ""),
        ],
      ),

    );
  }
}
