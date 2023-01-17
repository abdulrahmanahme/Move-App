import 'package:flutter/animation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:note/component/moves_widgets/moves_widgets.dart';
import 'package:note/model/model_data.dart';
import 'package:note/view_model/cubit/cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/cubit/states.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
      debugPrint('Here From initState');

    super.initState();
  }
  @override
  void didChangeDependencies() {
 
  debugPrint('Here From  didChangeDependencies');

    super.didChangeDependencies();
  }
  @override
  void deactivate() {
      debugPrint('Here From deactivate');

    super.deactivate();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  BlocConsumer<MovesCubit,MovesStates>(
          listener: (context, state) {
          },
          builder:  (context, state){
            // context.read<MovesCubit>().getFavouiteMoves();
           var cubit=MovesCubit.get(context);
           cubit.getFavouiteMoves();
            
       return Scaffold(
            backgroundColor: Color(0xff1D3153),
            appBar: AppBar(
              backgroundColor: Color(0xff1D3153),
              title: const Center(
                  child: Text(
                'Favorite',
                style: TextStyle(fontSize: 27, color: Colors.white),
              )),
              elevation: 0,
            ),
            body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                
              cubit.favouriteResults.length>0?    GridView.count(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 2,
                      childAspectRatio: 1 / 1.3,
                      children: List.generate(
                      
                       cubit.favouriteResults.length,
                        (index) => Coming(
                          image:"https://image.tmdb.org/t/p/w220_and_h330_face/${cubit.favouriteResults[index].posterPath}",
                          id:cubit.favouriteResults[index].id ,
                        ),
                      ),
                    ):
                    CircularProgressIndicator(),
                  ],
                )),
      ////////////////////////////////////////
      
            );
          }
      ),
    );
  }
}
