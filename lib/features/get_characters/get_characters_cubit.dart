import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modern_movies/core/constant/end_point.dart';
import 'package:modern_movies/core/helpers/dio.dart';

import '../data/characters_model.dart';

part 'get_characters_state.dart';

class GetCharactersCubit extends Cubit<GetCharactersState> {
  GetCharactersCubit() : super(GetCharactersInitial());

  List<Actors> actorsList = [];
  List<ProductionTeam> productionTeamList = [];

  Future<void> getCharacters({required int id}) async {
    emit(GetCharactersLoading());
    final response =
        await DioHelper.getData(endPoint: "${EndPoint.getMovie}$id/credits");
    if (response.isSuccess) {
      final model = CharactersData.fromJson(response.response!.data);
      actorsList.addAll(model.actors);
      productionTeamList.addAll(model.productionTeam);
      emit(GetCharactersSuccess());
    } else {
      emit(GetCharactersFailure(message: response.message));
    }
  }
}
