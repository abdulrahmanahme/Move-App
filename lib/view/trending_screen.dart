import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:note/component/moves_widgets/moves_widgets.dart';
import 'package:note/model/model_data.dart';
import 'package:note/view_model/cubit/cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_model/cubit/states.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({super.key});

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  BlocConsumer<MovesCubit,MovesStates>(
          listener: (context, state) {
          },
          builder:  (context, state){
// context.read<MovesCubit>().getTrendingMoves();
var cubit  =MovesCubit.get(context);
 cubit.getTrendingMoves();
       return Scaffold(
            backgroundColor: Color(0xff1D3153),
            appBar: AppBar(
              backgroundColor: Color(0xff1D3153),
              // actions: [  IconButton(onPressed: () {
                
              // }, icon: Icon(Icons.arrow_back_ios,size: 30,))],
              leading: IconButton(onPressed: () {
                
              }, icon: Icon(Icons.arrow_back_ios,size: 30,)),
      
              title: const Center(
                  child: Text(
                'Trending',
                style: TextStyle(fontSize: 27, color: Colors.white ,
                          fontFamily: 'Mont',
                ),
              )),
              elevation: 0,
            ),
            body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                   height: MediaQuery.of(context).size.height,
                   // width: 120.w,
                   color: Color(0xff1D3153),
                   child: ListView.builder(
                     padding: EdgeInsets.zero,
                     shrinkWrap: true,
                     physics: BouncingScrollPhysics(),
                     scrollDirection: Axis.vertical,
                     itemBuilder: (context, index) {
                       return Padding(
                         padding: const EdgeInsets.all(3.0),
                         child: Coming(
                          //  image: context.read<MovesCubit>().resultsTending[index].posterPath,
                          image: "https://image.tmdb.org/t/p/w220_and_h330_face/${cubit.resultsTending[index].posterPath}" ,
                          id:cubit.resultsTending[index].id ,
                         ),
                       );
                     },
                     itemCount: context.read<MovesCubit>().resultsTending.length,
                   ),
                 ))
      ////////////////////////////////////////
          
            );
          }
      ),
    );
  }
}