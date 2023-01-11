import 'package:flutter/material.dart';
import 'package:note/view/favorite_screen.dart';
import 'package:note/view/layout_screen.dart';
import 'package:note/view/move_detalis.dart';
import 'package:note/view/moves_screen.dart';
import 'package:note/view/trending_screen.dart';
import 'package:note/view_model/Server/Dio/dio.dart';
// import 'package:note/view_model/Server/dio/dio.dart';
import 'package:note/view_model/cubit/Bloc_observer/Bloc_observer.dart';
import 'package:note/view_model/cubit/cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';


void main() {
  // DioHelper.init();
  runApp(const MyApp());
  Bloc.observer = MyBlocObserver();

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return  MultiBlocProvider(
          providers: [
        BlocProvider(
          create: (context) => MovesCubit()..getNowPlaying(),
        ),
        //  BlocProvider(
        //   create: (context) => NewsCubit()..getBusiness(CacheService.lange)..getsports(CacheService.lange)..getscience(CacheService.lange)..getEntertainment(CacheService.lange)..getTechnology(CacheService.lange)..gethealth(CacheService.lange),
        // ),
      ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home:  LayoutScreen(),
          // home: MovesDetalis(),
        ),
      );
    });
  }
}
