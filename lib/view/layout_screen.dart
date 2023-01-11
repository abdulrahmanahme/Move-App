import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/view/favorite_screen.dart';
import 'package:note/view/moves_screen.dart';
import 'package:note/view/trending_screen.dart';
import 'package:note/view_model/cubit/cubit.dart';
import 'package:note/view_model/cubit/states.dart';

class LayoutScreen extends StatefulWidget {
  @override
  _LayoutScreenState createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
        return  BlocConsumer<MovesCubit,MovesStates>(
            listener: (context, state) {
            },
            builder: (context, state) {
              // var cubit = LayoutCubit.get(context);
var cubit  =MovesCubit.get(context);
          return SafeArea(
              child: Scaffold(
                extendBody: true,
                body: cubit.screen[cubit.currentPage],
                bottomNavigationBar: BottomAppBar(
                  elevation: 0,
                color: Color(0xff1D3153),
                  // shape: CircularNotchedRectangle(),
                  notchMargin: 12,
                  child: Container(
                    height: 55,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        cubit.bottomBar(
                          numberPage: 0,
                          currentscreen:MovesScreen(),
                          icon: AssetImage("assets/image/nav_corn.png"),
                          iconName:'Movies' ,
                        ),
                        SizedBox(width: 20,
                        ),
                         cubit.bottomBar(
                          numberPage: 1,
                          currentscreen:MovesScreen(),
                          icon: AssetImage("assets/image/likee.png"),
                          iconName:'Favorite' ,

                        ),
                       
                        // SizedBox(width: 15),
                        // cubit.bottomBar(
                        //   numberPage: 2,
                        //   // currentscreen: ProductScreen(),
                        //   // icon: Icons.mail,
                        //   icon: AssetImage("assets/image/navbar_icons/Bell.png"),
                        // ),
                        // cubit.bottomBar(
                        //   numberPage: 3,
                        //   // currentscreen: ProductScreen(),
                        //   // icon: Icons.settings_cell,
                        //   // iconName: 'Setting',
                        //   icon: AssetImage("assets/image/navbar_icons/person.png"),
                        // ),
                      ],
                    ),
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                              
                  child:Image(image:  AssetImage('assets/image/fire.png'),),
                   
                   
                  backgroundColor: Color(0xff1D3153),
                  onPressed: () {
                // cubit.flotingActionState(context);
                    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return TrendingScreen();
        },
      ),
    );
                  },
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
              ),
            );
            }
          
        )
        ;
  
  }
}