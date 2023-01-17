import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/model/action_moves_model.dart';
import 'package:note/model/cast_move_model.dart';
import 'package:note/model/drama_moves_model.dart';
import 'package:note/model/favourite_moves_model.dart';
import 'package:note/model/horror_move_model.dart';
import 'package:note/model/model_data.dart';
import 'package:note/model/move_details.dart';
import 'package:note/model/moves_details_model.dart';
import 'package:note/model/trenging_moves_model.dart';
import 'package:note/model/upcoming_model.dart';
import 'package:note/view/favorite_screen.dart';
import 'package:note/view/moves_screen.dart';
import 'package:note/view_model/Server/constant.dart';
import 'package:note/view_model/cubit/states.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Server/Dio/end_point.dart';

class MovesCubit extends Cubit<MovesStates> {
  MovesCubit() : super(IntialStates());
  static MovesCubit get(context) => BlocProvider.of(context);

  int currentPage = 0;
  List<Widget> screen = [
    MovesScreen(),
    FavoriteScreen(),
  ];
  MovesDetails? movesDetails;
  UpComing? upComing;
  ActionMoves? actionMoves;
  DramaMoves? dramaMoves;
  HorrorMoves? horrorMoves;
  TrendingMoves? tendingMoves;
  List<FavouriteResults> favouriteResults = [];
  FavouriteMoves? favouriteMoves;
  MoveDetails? move;
  CastMove? castMove;
  List<Cast> listcast = [];
  List<Results> results = [];
  List<ResultsUpComing> resultsUpComing = [];
  List<ResultsAction> resultsAction = [];
  List<ResultsDrama> resultsDrama = [];
  List<ResultsHorror> resultsHorror = [];
  List<ResultsTending> resultsTending = [];
  Future<List<ResultsHorror>> getHorrorMoves() async {
    emit(HorrorMovesState());
    final response = await Dio().get(
        '$Base_Url$endPointmove?api_key=$aPIkey&with_genres=27');
    if (response.statusCode == 200) {
      resultsHorror = List<ResultsHorror>.from(
          (response.data['results'] as List)
              .map((e) => ResultsHorror.fromJson(e)));
      emit(HorrorMovesSuccessState());
      return resultsHorror;
    } else {
      emit(HorrorMovesErrerState());
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  Future<List<ResultsTending>> getTrendingMoves() async {
    emit(TrndingLogingMovesState());
    // emit(HomeLoadingState());
    final response = await Dio().get(
        '$Base_Url$trendingMoves?api_key=$aPIkey');
    if (response.statusCode == 200) {
      resultsTending = List.from((response.data['results'] as List)
          .map((e) => ResultsTending.fromJson(e)));

      emit(TrndingMovesSuccessState());
      return resultsTending;
    } else {
      emit(TrndingMovesErrorState());
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  Future<List<ResultsDrama>> getDramaMoves() async {
    emit(DramaMovesState());
    final response = await Dio().get(
        '$Base_Url$endPointmove?api_key=$aPIkey&with_genres=18');
    print('cccccccccccc${response.data}');

    if (response.statusCode == 200) {
      resultsDrama = List<ResultsDrama>.from((response.data['results'] as List)
          .map((e) => ResultsDrama.fromJson(e)));

      emit(DramaMovesSuccessState());

      return resultsDrama;
    } else {
      emit(DramaMovesErrerState());
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  Future<List<FavouriteResults>> getFavouiteMoves() async {
    try {
      emit(FavoriteMovesLogingState());
      final response = await Dio().get('$Base_Url$accountId$favoriteMove?api_key=$aPIkey&session_id=$sessionId&language=en-US&sort_by=created_at.asc&page=1');
      print('ffffffff${response.data}');
      if (response.statusCode == 200) {
        favouriteResults = List<FavouriteResults>.from(
            (response.data['results'] as List)
                .map((e) => FavouriteResults.fromJson(e)));
        debugPrint('dass${favouriteResults[0].title}');
      }
      emit(FavoriteMovesSuccessState());
    } catch (error) {
      if (error is DioError) {
        print('$error');
      }
      emit(FavoriteMovesErrorState());
    }
    return favouriteResults;
  }


  Future<List<ResultsAction>> getActionMoves() async {
    emit(ActionMovesState());
    // emit(HomeLoadingState());

    final response = await Dio().get(
        '$Base_Url$endPointmove?api_key=$aPIkey&with_genres=28');
    if (response.statusCode == 200) {
      resultsAction = List<ResultsAction>.from(
          (response.data['results'] as List)
              .map((e) => ResultsAction.fromJson(e)));

      emit(ActionMovesSuccessState());

      return resultsAction;
    } else {
      emit(ActionMovesErrerState());
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  void getCastMove({int? id}) async {
    emit(CastMoveLogingState());
    final response = await Dio().get(
        '$Base_Url/movie/$id/credits?api_key=$aPIkey&language=en-US');
    print('${response.data}');
    listcast = [];

    castMove = CastMove.fromJson(response.data);
    for (var element in castMove!.cast) {
      listcast.add(element);
      debugPrint(" name ${element.originalName}image ${element.profilePath} ");
    
    }
  }

  void getMoveDetelis({int? id}) {
    emit(MoveDetailsLogingState());
    Dio()
        .get(
            '$Base_Url/movie/$id?api_key=$aPIkey&language=en-US')
        .then((value) {
      move = null;

      move = MoveDetails.fromJson(value.data);
      print('${move?.id}');

      emit(MoveDetailsSuccessState());
    }).catchError((error) {
      emit(MoveDetailsErrorState());

      if (error is DioError) {
        print('eeeeeeeeeeeeeeeeeeeeeee${error}');
      }
    });
  }

  void getUPComimg() async {
    try {
      emit(UpComingState());

      var response = await Dio().get(
          '$Base_Url$upacomingMove?api_key=$aPIkey&language=en-US&page=2');
      upComing = UpComing.fromJson(response.data);
      for (var element in upComing!.resultsUpComing) {
        resultsUpComing.add(element);
        print('${element.title}');
        print('${element.id}');
      }
      emit(UpComingSuccessState());
    } catch (error) {
      if (error is DioError) {
        print("$error");
      }
      emit(UpCominErrorState());
    }
  }

  void getNowPlaying() {
    emit(HomeLoadingState());
    Dio()
        .get(
            '$Base_Url$nowPlayingMove?api_key=$aPIkey&language=en-US&page=1')
        .then((value) {
      movesDetails = MovesDetails.fromJson(value.data);
      for (var elrment in movesDetails!.results) {
        results.add(elrment);
        print('llllllllll${movesDetails!.dates.maximum}');
      }

      emit(HomeSuccessState());
    }).catchError((error) {
      if (error is DioError) {
        print(
            'eeeeeeeeeeeeeeeL${error.message} eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
        emit(HomeErrorState());
      }
    });
  }

  Widget bottomBar(
      {int? numberPage,
      Widget? currentscreen,
      ImageProvider<Object>? icon,
      String? iconName}) {
    return MaterialButton(
      minWidth: 20,
      onPressed: () {
        currentPage = numberPage!;
        currentscreen = currentscreen;
        emit(BottomStateState());
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ImageIcon(
              icon,
              color: currentPage == numberPage ? Colors.white : Colors.grey,
              size: 30,
            ),
          ),
          Text(
            iconName!,
            style: TextStyle(
                fontSize: 12,
                color: currentPage == numberPage ? Colors.white : Colors.grey),
          ),
        ],
      ),
    );
  }
}
