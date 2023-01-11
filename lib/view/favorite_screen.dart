import 'package:flutter/animation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:note/component/moves_widgets/moves_widgets.dart';
import 'package:note/model/model_data.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GridView.count(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 2,
                    childAspectRatio: 1 / 1.3,
                    children: List.generate(
                    
                      upcoming.length,
                      (index) => UpComing(
                        image: upcoming[index].image,
                      ),
                    ),
                  ),
                ],
              ))
////////////////////////////////////////

          ),
    );
  }
}
