import 'package:note/model/model_data.dart';
import 'package:note/model/upcoming_model.dart';
import 'package:note/view/move_detalis.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MovesCard extends StatelessWidget {
  const MovesCard({super.key,this.image});
 final String? image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child:
  
            Column(
              children: [
                Container(
                  height: 18.h,
                  width: 72.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:NetworkImage(image!),
                          // AssetImage('assets/image/Background.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ],
            ),
      )
    );
  }
}
class CastWidget extends StatelessWidget {
  const CastWidget({super.key,this.image,this.name,});
 final String? image;
 final String? name;



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              // isloading
              //     ? SpinKitFadingCircle(
              //         color: Color(0xffFF4500),
              //       )
              //     :
              Container(
                height: 25.h,
                width: 36.w,
                // height: 250,
                // width: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:NetworkImage(image!),
                        // AssetImage('assets/image/Background.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              
              ),
        ),
    
         Row(
     children: [
     Text(
         name!,
         style: TextStyle(fontSize: 18, color: Colors.white,
         fontFamily: 'Mont',
         
          
         ),
       ),
     ],
     ),
      ],
    );
}

}

class Slider extends StatelessWidget {
  const Slider({super.key,this.image,this.id});
 final String? image;
 final int? id;
  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector(
      onTap: () {
         Navigator.push(context, MaterialPageRoute(builder: (context) => MovesDetalis(id: id,)));
       
      },
      child: Column(
        children: [

           Card(
                 color: Theme.of(context).appBarTheme.backgroundColor,
                 shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25))),
                 // margin: EdgeInsets.only(left: 5, right: 0, top: 5, bottom: 5),
                 elevation: 2,
                child:SizedBox(
                  height:
                      Device.orientation == Orientation.portrait ? 18.h : 49.h,
                  width: double.infinity,
                  // width: 100.h,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        child: Container(
                          height: Device.orientation == Orientation.portrait
                              ? 24.h
                              :80.h,
                          width: double.infinity,
                          // width: 100.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                               image:NetworkImage(image!),
                            )
                          ),
                          // AssetImage('assets/image/Background.png'),
                      // fit: BoxFit.fill,
                    ),
                            ),
                    ]
                          ),
                        ),
                      ),
                     
                    ],
                  ),
          
    );
  }
}
class Coming extends StatelessWidget {
  const Coming({super.key,this.image,this.name,this.id});
 final String? image;
 final String? name;
 final int? id;
 
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        // Navigator.pushAndRemoveUntil<dynamic>(
        //  context,
        // MaterialPageRoute<dynamic>(
        //   builder: (BuildContext context) =>MovesDetalis(id: id,),
        // ),
        // (route) => true,//
        // );
        Navigator.push(context, MaterialPageRoute(builder: (context) => MovesDetalis(id: id,)));
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child:
            // isloading
            //     ? SpinKitFadingCircle(
            //         color: Color(0xffFF4500),
            //       )
            //     :
            Container(
              height: 20.h,
              width: 36.w,
              // height: 250,
              // width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:NetworkImage(image!),
                      // AssetImage('assets/image/Background.png'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //  Text(
                  //                              name!,
                  //                     // 'GAREDNIA PLANT',
                  //                     style: TextStyle(
                  //                       // fontFamily: 'Lobster-Regular',
                  //                       fontWeight: FontWeight.bold,
                  //                       fontSize: 20,
                  //                       color: Colors.white,
                  //                     ),
                  //                   ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         children: [
            //       IconButton(onPressed: () {
              
            // }, icon: Icon(Icons.favorite_rounded,size: 30,color: Colors.red,)),
            // ],),
                ],
              ),
            ),
      )
    );
      
    
  }
}




Widget buildImageSlider({BuildContext ?context, List<dynamic> ?article,}) {
  var md = MediaQuery.of(context!).size;
  int size = article!.length;
  var element = List<int>.generate(size, (i) => i);
  List<ResultsUpComing> resultsUpComing = [];
  

  return (CarouselSlider(
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
        return Slider(image:resultsUpComing[i].posterPath);
      });
    }).toList(),
  ));
}

