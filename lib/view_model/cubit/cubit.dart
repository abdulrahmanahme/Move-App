import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/model/action_moves_model.dart';
import 'package:note/model/cast_move_model.dart';
import 'package:note/model/drama_moves_model.dart';
import 'package:note/model/horror_move_model.dart';
import 'package:note/model/model_data.dart';
import 'package:note/model/move_details.dart';
import 'package:note/model/moves_details_model.dart';
import 'package:note/model/product_model.dart';
import 'package:note/model/trenging_moves_model.dart';
import 'package:note/model/upcoming_model.dart';
import 'package:note/view/favorite_screen.dart';
import 'package:note/view/moves_screen.dart';
import 'package:note/view_model/Server/Dio/dio.dart';
import 'package:note/view_model/Server/Dio/end_point.dart';
import 'package:note/view_model/cubit/states.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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
  ProductModel? productModel;

  // List<ProductModel>? listproduct;

  // ListData? listData;
  MoveDetails? move;
  CastMove? castMove;
  List<Cast> listcast = [];
  List<Results> results = [];
  List<ResultsUpComing> resultsUpComing = [];
  List<ResultsAction> resultsAction = [];
  List<ResultsDrama> resultsDrama = [];
  List<ResultsHorror> resultsHorror = [];
  List<ResultsTending> resultsTending = [];

// https://api.themoviedb.org/3/movie/now_playing?api_key=1d753db7ee9a0563a0f8a2d0989b6ab0&language=en-US&page=1
// "$NowPlaying?api_key=1d753db7ee9a0563a0f8a2d0989b6ab0&language=en-US&page=1"
  Future<List<ResultsHorror>> getHorrorMoves() async {
    emit(HorrorMovesState());
    final response = await Dio().get(
        'https://api.themoviedb.org/3/discover/movie?api_key=1d753db7ee9a0563a0f8a2d0989b6ab0&with_genres=27');
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
        'https://api.themoviedb.org/3/trending/tv/week?api_key=1d753db7ee9a0563a0f8a2d0989b6ab0');
    if (response.statusCode == 200) {
      resultsTending = List.from((response.data['results'] as List)
          .map((e) => ResultsTending.fromJson(e)));

      emit(TrndingMovesSuccessState());
      return resultsTending;
    } else {
      // emit(HomeErrorState());
      emit(TrndingMovesErrorState());
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  Future<List<ResultsDrama>> getDramaMoves() async {
    emit(DramaMovesState());
    // emit(HomeLoadingState());
    final response = await Dio().get(
        'https://api.themoviedb.org/3/discover/movie?api_key=1d753db7ee9a0563a0f8a2d0989b6ab0&with_genres=18');
    print('cccccccccccc${response.data}');

    if (response.statusCode == 200) {
      resultsDrama = List<ResultsDrama>.from((response.data['results'] as List)
          .map((e) => ResultsDrama.fromJson(e)));

      emit(DramaMovesSuccessState());

      return resultsDrama;
    } else {
      // emit(HomeErrorState());
      emit(DramaMovesErrerState());
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  // Future<List<ProductModel>> getprodct() async {
  //   try {
  //     final response = await Dio().get('https://fakestoreapi.com/products');
  //     if (response.statusCode == 200) {
  //       listproduct = List<ProductModel>.from((response.data as List).map((e) => ProductModel.fromJson(e)));
  //     }
  //   } catch (error) {
  //     if(error is DioError){
  //       print('$error');
  //     }
  //   }
  //   return listproduct!;
  // }



  Future<List<ResultsAction>> getActionMoves() async {
    emit(ActionMovesState());
    // emit(HomeLoadingState());

    final response = await Dio().get(
        'https://api.themoviedb.org/3/discover/movie?api_key=1d753db7ee9a0563a0f8a2d0989b6ab0&with_genres=28');
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



  void getCastMove({int?id}) async {
    emit(CastMoveLogingState());
    // emit(HomeLoadingState());
// https://api.themoviedb.org/3/movie/830784/credits?api_key=1d753db7ee9a0563a0f8a2d0989b6ab0&language=en-US
    final response = await Dio().get(
        'https://api.themoviedb.org/3/movie/$id/credits?api_key=1d753db7ee9a0563a0f8a2d0989b6ab0&language=en-US');
    print('${response.data}');
    listcast=[];

    castMove = CastMove.fromJson(response.data);
    for (var element in castMove!.cast) {
      listcast.add(element);
      debugPrint(" name ${element.originalName}image ${element.profilePath} ");
      // print("cccccccccccccc${element.originalName} ${element.profilePath} ");
      // print("cccccccccccccc${element.profilePath}");

    }
  }
  //https://api.themoviedb.org/3/movie/676710?api_key=1d753db7ee9a0563a0f8a2d0989b6ab0&language=en-US
  void getMoveDetelis({int ?id}) {
    emit(MoveDetailsLogingState());
    Dio()
        .get(
            'https://api.themoviedb.org/3/movie/$id?api_key=1d753db7ee9a0563a0f8a2d0989b6ab0&language=en-US')
        .then((value) {
          move=null;
          
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

  // Future<MoveDetails> getMoveDetelis() async {
  //   emit(MoveDetailsLogingState());
  //   try {
  //     var response = await Dio().get(
  //         'https://api.themoviedb.org/3/movie/724495?api_key=1d753db7ee9a0563a0f8a2d0989b6ab0&language=en-US');
  //     if (response.statusCode == 200) {
  //       move = MoveDetails.fromJson(response.data);
  //       print(move?.originalTitle);

  //     }
  //   } catch (error) {
  //     if (error is DioError) {
  //       print('$error');
  //     }
  //   }
  //   return move!;

  // }

  void getUPComimg() async {
    try {
      emit(UpComingState());

      var response = await Dio().get(
          'https://api.themoviedb.org/3/movie/upcoming?api_key=1d753db7ee9a0563a0f8a2d0989b6ab0&language=en-US&page=2');
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
            'https://api.themoviedb.org/3/movie/now_playing?api_key=1d753db7ee9a0563a0f8a2d0989b6ab0&language=en-US&page=1')
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
