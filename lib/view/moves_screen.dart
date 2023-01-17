import 'package:flutter/animation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:note/component/moves_widgets/moves_widgets.dart';
import 'package:note/model/model_data.dart';
import 'package:note/view_model/cubit/cubit.dart';
import 'package:note/view_model/cubit/states.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:note/component/moves_widgets/moves_widgets.dart' as slider;

class MovesScreen extends StatefulWidget {
  const MovesScreen({super.key});

  @override
  State<MovesScreen> createState() => _MovesScreenState();
}

class _MovesScreenState extends State<MovesScreen> {
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<MovesCubit,MovesStates>(
          listener: (context, state) {
          },
          builder:  (context, state){
    //  var cubit =BlocProvider.of(context);

var cubit  =MovesCubit.get(context);
  var element = List<int>.generate(cubit.resultsUpComing.length, (i) => i);

  // cubit.getNowPlayingMovie();
  cubit.getNowPlaying();
  cubit.getActionMoves();
  cubit.getUPComimg();
  cubit.getDramaMoves();
  cubit.getHorrorMoves();
  // cubit.listcast=[];
  // cubit.move=null;
  // cubit.getActionMoves();

return Scaffold(
          backgroundColor: Color(0xff1D3153),
          appBar: AppBar(
            backgroundColor: Color(0xff1D3153),
           
            title: const Center(
                child: Image(
              image: AssetImage(
                'assets/image/popcorn1.png',
              ),
            )),
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // context.read<MovesCubit>();
                // context.watch<MovesCubit>();

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 5),
                      child: Text(
                        'Now Playing',
                        style: TextStyle(fontSize: 27, color: Colors.white,
                          fontFamily: 'Mont',
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: Device.orientation == Orientation.portrait ? 21.h : 60.h,
                  // width: 110.w,
                  // child: buildImageSlider(article:cubit.resultsUpComing,context: context, ),
                  child: CarouselSlider(
    options: CarouselOptions(
      height: Device.orientation == Orientation.portrait ? 30.h : 100.h,
      initialPage: 0,
      autoPlay: true,
      onPageChanged: (index, _) {},
      autoPlayInterval: const Duration(seconds: 3),
      enableInfiniteScroll: true,
      enlargeCenterPage: true,
    ),
    items: element.map((i) {
      return Builder(builder: (BuildContext context) {
        return slider.Slider(image:"https://image.tmdb.org/t/p/w220_and_h330_face/${cubit.resultsUpComing[i].posterPath}",
        id: cubit.resultsUpComing[i].id,
        );
      });
    }).toList(),
  )),
                  // ListView.builder(
                  //   physics: BouncingScrollPhysics(),
                  //   scrollDirection: Axis.horizontal,
                  //   itemBuilder: (context, index) {
                  //     return MovesCard(
                  //       image: moves[index].image,
                  //     );
                  //   },
                  //   itemCount: moves.length,
                  // ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const[
                    Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 5,top: 1),
                      child: Text(
                        'Upcoming',
                        // 'Upcoming ',

                        style: TextStyle(fontSize: 27, color: Colors.white,
                          fontFamily: 'Mont',
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 25.h,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    // shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      
                      return Coming(
                        image: "https://image.tmdb.org/t/p/w220_and_h330_face/${cubit.resultsUpComing[index].posterPath}",
                         id: cubit.resultsUpComing[index].id,
                        // name:cubit.resultsUpComing[index].title ,
                      );
                    },
                    itemCount: cubit.resultsUpComing.length,
                  ),
                ),
             Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Movies',
                        style: TextStyle(fontSize: 27, color: Colors.white,
                          fontFamily: 'Mont',
                        ),
                      ),
                    ),
                  ],
                ),
                        Container(height: 35.h,
          
                          child: DefaultTabController(
                length: 3,
                
                child: Scaffold(
                        backgroundColor:Color(0xff1D3153) ,
          
                  appBar: AppBar(
                    // toolbarHeight: kToolbarHeight + 1,
                    // bottomOpacity: 0.0,
                    // scrolledUnderElevation: ,
                    // automaticallyImplyLeading: false,
                    toolbarHeight: .1,
                    // toolbarHeight: 15,
                    backgroundColor: Color(0xff1D3153),
                    // backgroundColor: Colors.white,
                    elevation: 0,
                    bottom: TabBar(
                          unselectedLabelColor: Colors.redAccent,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                      
                              color: Colors.redAccent),
                          tabs: [
                            Tab(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(color: Colors.redAccent, width: 1)),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("Action"),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(color: Colors.redAccent, width: 1)),
                                child:const Align(
                                  alignment: Alignment.center,
                                  child: Text("Drama"),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(color: Colors.redAccent, width: 1)),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("Horror"),
                                ),
                              ),
                            ),
                          ]),
                  ),
                  body: TabBarView(children: [
//                   
  Container(
                            height: 20.h,
                            // width: 120.w,
                            color: Color(0xff1D3153),
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                // return UpComing(
//  image: upcoming[index].image,
                                // );
                                return Coming(
                                  image: "https://image.tmdb.org/t/p/w220_and_h330_face/${cubit.resultsAction[index].posterPath}",
                                  id: cubit.resultsAction[index].id,
                                  
                                );
                              },
                              itemCount:cubit.resultsAction.length,
                            ),
                          ),
                            Container(
                            height: 20.h,
                            // width: 120.w,
                            color: Color(0xff1D3153),
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Coming(
                                  image:"https://image.tmdb.org/t/p/w220_and_h330_face/${cubit.resultsDrama[index].posterPath}",
                                  id: cubit.resultsDrama[index].id,

                                );
                              },
                              itemCount: cubit.resultsDrama.length,
                            ),
                          ), 
                           Container(
                            height: 20.h,
                            // width: 120.w,
                            color: Color(0xff1D3153),
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Coming(
                                  image: "https://image.tmdb.org/t/p/w220_and_h330_face/${cubit.resultsHorror[index].posterPath}",
                                  id: cubit.resultsHorror[index].id,
                                );
                              },
                              itemCount: cubit.resultsHorror.length,
                            ),
                          ),
            
                  ]),
                )),
                        )
       
              ],
            ),
          ),
        );
          }
        
      ),
    );
  }
}
