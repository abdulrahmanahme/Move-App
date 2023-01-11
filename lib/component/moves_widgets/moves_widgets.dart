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
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ItemDetails(
        //       itemname: item.name,
        //       itemfavorite: item.favorite,
        //       itemimage: item.image,
        //       itemprice: item.price,
        //     ),
        //   ),
        // );
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child:
            // isloading
            //     ? SpinKitFadingCircle(
            //         color: Color(0xffFF4500),
            //       )
            //     :
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
              //   child:  Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.end,
              //         children: [
              //       IconButton(onPressed: () {
                
              // }, icon: Icon(Icons.favorite_rounded,size: 30,color: Colors.red,)),
              // ],),
              //     ],
              //   ),
              ),
        ),
    //         SizedBox(
    // height: 1.h,
    //         ),
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
  const Slider({super.key,this.image});
 final String? image;
  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ItemDetails(
        //       itemname: item.name,
        //       itemfavorite: item.favorite,
        //       itemimage: item.image,
        //       itemprice: item.price,
        //     ),
        //   ),
        // );
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
          // Padding(
          //   padding: const EdgeInsets.all(4.0),
          //   child:
          //       // isloading
          //       //     ? SpinKitFadingCircle(
          //       //         color: Color(0xffFF4500),
          //       //       )
          //       //     :
          //       Container(
          //         height: 25.h,
          //         width: 36.w,
          //         // height: 250,
          //         // width: 150,
          //         decoration: BoxDecoration(
          //           image: DecorationImage(
          //             image:NetworkImage(image!),
          //                 // AssetImage('assets/image/Background.png'),
          //             fit: BoxFit.fill,
          //           ),
          //           borderRadius: BorderRadius.circular(20.0),
          //         ),
          //         child:  Column(
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           children: [
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.end,
          //               children: [
          //             IconButton(onPressed: () {
                  
          //       }, icon: Icon(Icons.favorite_rounded,size: 30,color: Colors.red,)),
          //       ],),
          //           ],
          //         ),
          //       ),
          // ),
    
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
class UpComing extends StatelessWidget {
  const UpComing({super.key,this.image,this.name});
 final String? image;
 final String? name;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ItemDetails(
        //       itemname: item.name,
        //       itemfavorite: item.favorite,
        //       itemimage: item.image,
        //       itemprice: item.price,
        //     ),
        //   ),
        // );
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //  Text(
                  //                              name!,
                  //                     // 'GAREDNIA PLANT',
                  //                     style: TextStyle(
                  //                       // fontFamily: 'Lobster-Regular',
                  //                       fontWeight: FontWeight.w100,
                  //                       fontSize: 14,
                  //                       color: Colors.black,
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

// class SliderImage extends StatefulWidget {
//   const SliderImage({super.key,this.article});
//  final List<dynamic>? article;

 

//   @override
//   State<SliderImage> createState() => _SliderImageState();
// }

// class _SliderImageState extends State<SliderImage> {
 

//   @override
//   void initState() {
   
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }


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

// Widget cardPlant({PlantsData ? model,BuildContext? context}){
//   return GestureDetector(
//       onTap: () {
//         // Navigator.push(
//         //   context,
//         //   MaterialPageRoute(
//         //     builder: (context) => ItemDetails(
//         //       itemname: item.name,
//         //       itemfavorite: item.favorite,
//         //       itemimage: item.image,
//         //       itemprice: item.price,
//         //     ),
//         //   ),
//         // );
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(4.0),
//         child:
//             // isloading
//             //     ? SpinKitFadingCircle(
//             //         color: Color(0xffFF4500),
//             //       )
//             //     :
//             Container(
//           // height: displayHeight(context!) * 76,

//           // width: displayWidth(context) * .9,
//           height: 250,
//           width: 200,

//           decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black12,
//                 spreadRadius: 1,
//                 blurRadius: 4,
//                 offset: Offset(0, 5), // changes position of shadow
//               ),
//             ],
//             borderRadius: BorderRadius.circular(15.0),
//           ),
//           child: Material(
//             type: MaterialType.transparency,
//             child: Expanded(
//               child: Stack(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         top: 1, bottom: 10, left: 15, right: 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//  model!.imageUrl==''?
//              Container(
//                           height: 140.0,
//                           width: 70.0,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: AssetImage('assets/image/Background.png'),
                                
//                               fit: BoxFit.cover,
//                             ),
//                             borderRadius: BorderRadius.circular(20.0),
//                           ),
//                         ):
//                         Container(
//                           height: 140.0,
//                           width: 70.0,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image:NetworkImage("https://lavie.orangedigitalcenteregypt.com${model.imageUrl}"),
//                                   // AssetImage('assets/image/Background.png'),
//                               fit: BoxFit.cover,
//                             ),
//                             borderRadius: BorderRadius.circular(20.0),
//                           ),
//                         ),

//                         //  Row(
//                         //   mainAxisAlignment: MainAxisAlignment.center,
//                         //   children: [
//                         //     ButtonShop(
//                         //       icon: Icons.remove,
//                         //       onPressed: () {
//                         //         // setState(() {
//                         //         //   numerOfItem--;
//                         //         // });
//                         //       },
//                         //     ),
//                         //     Text(
//                         //       // numerOfItem.toString().padLeft(1, '0'),
//                         //       '1',
//                         //       style: TextStyle(
//                         //         fontSize: 20,
//                         //       ),
//                         //     ),
//                         //     ButtonShop(
//                         //       icon: Icons.add,
//                         //       onPressed: () {
//                         //         // setState(() {
//                         //         //   numerOfItem++;
//                         //         // });
//                         //       },
//                         //     )
//                         //   ],
//                         // ),
//                         // Container(
//                         //   height: 140.0,
//                         //   width: 70.0,
//                         //   decoration: BoxDecoration(
//                         //     image: DecorationImage(
//                         //       image:NetworkImage("https://lavie.orangedigitalcenteregypt.com${widget.model!.imageUrl}"),
//                         //           // AssetImage('assets/image/Background.png'),
//                         //       fit: BoxFit.cover,
//                         //     ),
//                         //     borderRadius: BorderRadius.circular(20.0),
//                         //   ),
//                         // ),
//                         // Row(
//                         //   mainAxisAlignment: MainAxisAlignment.center,
//                         //   children: [
//                         //     ButtonShop(
//                         //       icon: Icons.remove,
//                         //       onPressed: () {
//                         //         setState(() {
//                         //           numerOfItem--;
//                         //         });
//                         //       },
//                         //     ),
//                         //     Text(
//                         //       numerOfItem.toString().padLeft(1, '0'),
//                         //       style: TextStyle(
//                         //         fontSize: 20,
//                         //       ),
//                         //     ),
//                         //     ButtonShop(
//                         //       icon: Icons.add,
//                         //       onPressed: () {
//                         //         setState(() {
//                         //           numerOfItem++;
//                         //         });
//                         //       },
//                         //     )
//                         //   ],
//                         // ),
//                       ],
//                     ),
//                   ),
//                   // Padding(
//                   //   padding: const EdgeInsets.only(top: 80),
//                   //   child: Align(
//                   //     alignment: Alignment.bottomRight,
//                   //     child: Column(
//                   //       mainAxisAlignment: MainAxisAlignment.end,
//                   //       children: [
//                   //         //
//                   //         Column(
//                   //           mainAxisAlignment: MainAxisAlignment.start,
//                   //           children: [
//                   //             Row(
//                   //               mainAxisAlignment: MainAxisAlignment.start,
//                   //               children: [
//                   //                 Padding(
//                   //                   padding: const EdgeInsets.only(
//                   //                     left: 5,
//                   //                     right: 5,
//                   //                     top: 55,
//                   //                   ),
//                   //                   child: Text(
//                   //                              '${model.name}',
//                   //                     // 'GAREDNIA PLANT',
//                   //                     style: TextStyle(
//                   //                       // fontFamily: 'Lobster-Regular',
//                   //                       fontWeight: FontWeight.bold,
//                   //                       fontSize: 14,
//                   //                       color: Colors.black,
//                   //                     ),
//                   //                   ),
//                   //                 ),
//                   //               ],
//                   //             ),
//                   //             // Row(
//                   //             //   mainAxisAlignment: MainAxisAlignment.start,
//                   //             //   children: [
//                   //             //     Padding(
//                   //             //       padding: const EdgeInsets.only(
//                   //             //           left: 5, right: 5),
//                   //             //       child: Text(
//                   //             //     '${model.temperature}',
//                   //             //         // '70 EGP',
//                   //             //         style: TextStyle(
//                   //             //           // fontFamily: 'Lobster-Regular',
//                   //             //           fontWeight: FontWeight.bold,
//                   //             //           fontSize: 15,
//                   //             //           color: Colors.black87,
//                   //             //         ),
//                   //             //       ),
//                   //             //     ),
//                   //             //   ],
//                   //             // ),
//                   //           ],
//                   //         ),

//                   //         // Button(
//                   //         //   text: 'Add to cart',
//                   //         //   color: Colors.green,
//                   //         //   textcolor: Colors.white,
//                   //         // ),
//                   //       ],
//                   //     ),
//                   //   ),
//                   // ),
//                 ],
                
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
// }