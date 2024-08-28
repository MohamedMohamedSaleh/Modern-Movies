import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constant/end_point.dart';
import '../../core/helpers/dio.dart';
import '../data/category_model.dart';

part 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit() : super(GetCategoriesInitial());

  List<CategoryModel> categories = [];

  Future<void> getCategories() async {
    emit(GetCategoriesLoading());
    final response = await DioHelper.getData(endPoint: EndPoint.catetory);
    if (response.isSuccess) {
      final model = CategoriesData.fromJson(response.response!.data);
      categories = model.genres;
      emit(GetCategoriesSuccess());
    } else {
      emit(GetCategoriesFailure(message: response.message));
    }
  }
}
