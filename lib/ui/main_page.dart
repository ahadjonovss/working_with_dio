import 'package:flutter/material.dart';
import 'package:working_with_dio/ui/home/first_task.dart';
import 'package:working_with_dio/ui/home/second_task.dart';

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
      FirstTask(),
      SecondTask()
    ];
    return Scaffold(
      body: pages[currentPage],
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
