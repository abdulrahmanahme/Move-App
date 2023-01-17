import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note/component/moves_widgets/moves_widgets.dart';
import 'package:note/model/model_data.dart';
import 'package:note/view_model/cubit/cubit.dart';
import 'package:note/view_model/cubit/states.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovesDetalis extends StatefulWidget {
  const MovesDetalis({super.key,this.id});
final int ? id;
   
  @override
  State<MovesDetalis> createState() => _MovesDetalisState();
}

class _MovesDetalisState extends State<MovesDetalis> {
  
  @override
  Widget build(BuildContext context) {
  //   @override
  // void dispose() {
  //   // TODO: implement dispose
  //             var cubit  =MovesCubit.get(context);



  //   super.dispose();
  // }
    return SafeArea(
      child:  BlocConsumer<MovesCubit,MovesStates>(
            listener: (context, state) {
            },
            builder: (context, state) {
              // context.read<MovesCubit>().getMoveDetelis();

              var cubit  =MovesCubit.get(context);
              cubit.getCastMove(id:widget.id!);

              print('cccccccc${widget.id}');
              cubit.getMoveDetelis(id:widget.id!);
              print('mmmm${widget.id}');
             

      return  Scaffold(
          // backgroundColor: ,
          backgroundColor: Color(0xff1D3153),
        
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          // ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                
                   cubit.move?.posterPath!=null?     Container(
                  height: 38.h,
                  width: double.infinity,
                  // height: 250,
                  // width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:   NetworkImage(
                        
                        
                          "https://image.tmdb.org/t/p/w220_and_h330_face/${cubit.move?.posterPath}"),
                      // AssetImage('assets/image/Background.png'),
                      fit: BoxFit.fill,
                    
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 1.h,
            
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context,);
                                
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 30,
                                color: Colors.white,
                              )),
                          // IconButton(
                          //     onPressed: () {},
                          //     icon: Icon(
                          //       Icons.favorite_rounded,
                          //       size: 30,
                          //       color: Colors.red,
                          //     )),
                        ],
                      ),
                    Spacer(),
                    // cubit.move?.originalTitle!=null?
                    //   Padding(
                    //     padding: const EdgeInsets.all(10.0),
                    //     child: Text(
                    //         '${cubit.move?.originalTitle}',
                    //         style: TextStyle(fontSize: 27, color: Colors.white,
                    //         fontFamily: 'Mont',
                            
                
                    //         ),
                    //       ),
                    //   ):CircularProgressIndicator(),
                    ],
                  )
                ):CircularProgressIndicator(),
               
            
             Row(
             children: [
            cubit.move?.posterPath!=null?    Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'Reviews:${cubit.move?.voteAverage}',
                                style: TextStyle(fontSize: 20, color: Colors.white,
                                fontFamily: 'Mont',
                                
              
                                ),
                              ),
                          ):CircularProgressIndicator(),
             ],
             ),
             cubit.move?.overview!=null?    Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${cubit.move?.overview}'
             
                                ,
                                style: TextStyle(fontSize: 15, color: Colors.white,
                                // fontFamily: 'Mont',
                                
              
                                ),
                              ),
                          ):CircularProgressIndicator(),
                          Row(
             children: [
               Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'Cast',
                                style: TextStyle(fontSize: 25, color: Colors.white,
                                fontFamily: 'Mont',
                                
              
                                ),
                              ),
                          ),
             ],
             ),
             cubit.listcast.length!=null?
             Container(
                      height: 30.h,
                      // width: 120.w,
                      color: Color(0xff1D3153),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CastWidget(
                            image:cubit.listcast[index].profilePath!=null? "https://image.tmdb.org/t/p/w220_and_h330_face/${cubit.listcast[index].profilePath}":'https://www.shutterstock.com/image-vector/profile-photo-vector-placeholder-pic-600w-535853263.jpg',
                            name:cubit.listcast[index].name,
                           
                          );
                        },
                        itemCount:cubit.listcast.length,
                        
                      ),
                    ):CircularProgressIndicator(),
            //  cubit.listproduct?.length!=null?
            //  Container(
            //           height: 30.h,
            //           // width: 120.w,
            //           color: Color(0xff1D3153),
            //           child: ListView.builder(
            //             padding: EdgeInsets.zero,
            //             shrinkWrap: true,
            //             physics: BouncingScrollPhysics(),
            //             scrollDirection: Axis.horizontal,
            //             itemBuilder: (context, index) {
            //               return CastWidget(
            //                 image:cubit.listproduct![index].image,
            //                 name:cubit.listproduct![index].id,
            //               );
            //             },
            //             itemCount: cubit.listproduct!.length,
                        
            //           ),
            //         ):CircularProgressIndicator(),
             
            
              ],
            ),
          ),
        );
            }  
      ),
  
    );
    
  }
  
}
