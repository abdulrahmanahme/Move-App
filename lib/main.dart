import 'package:flutter/material.dart';
import 'package:note/view/favorite_screen.dart';
import 'package:note/view/layout_screen.dart';
import 'package:note/view/move_detalis.dart';
import 'package:note/view/moves_screen.dart';
import 'package:note/view/trending_screen.dart';
// import 'package:note/view_model/Server/dio/dio.dart';
import 'package:note/view_model/cubit/Bloc_observer/Bloc_observer.dart';
import 'package:note/view_model/cubit/cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';


void main() {
  runApp(const MyApp());
  Bloc.observer = MyBlocObserver();

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return  MultiBlocProvider(
          providers: [
        BlocProvider(
          create: (context) => MovesCubit(),
        ),
      ],
        child: MaterialApp(
          title: 'Moves App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home:  LayoutScreen(), 
        ),
      );
    });
  }
}
