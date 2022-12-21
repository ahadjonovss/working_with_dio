import 'package:flutter/cupertino.dart';
import 'package:working_with_dio/data/api_service/api_service.dart';
import 'package:working_with_dio/data/repositories/category_repository.dart';

class CategoriesViewModel extends ChangeNotifier{
  CategoryRepository categoryRepository;
  CategoriesViewModel({required this.categoryRepository});


  List? categories;
  int currentInfo=0;
  String errorForUI = "";

  listenTransfers() async {
    MyResponse myResponse= await categoryRepository.getCategories();
    if (myResponse.error.isEmpty) {
      categories = myResponse.data;
    } else {
      errorForUI = myResponse.error;
    }
    notifyListeners();
  }

  changeInfo(int number){
    currentInfo=number;
    notifyListeners();
  }

}