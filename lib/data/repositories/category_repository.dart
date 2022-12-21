import 'package:working_with_dio/data/api_service/api_service.dart';

class CategoryRepository{
  ApiService simpleApiService;
  CategoryRepository({required this.simpleApiService});

  getCategories()=> simpleApiService.getCategories();
}