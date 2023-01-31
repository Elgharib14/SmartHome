import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradutionproject/business-layer/bloc/cubit.dart';
import 'package:gradutionproject/business-layer/bloc/statas.dart';
import 'package:gradutionproject/preseitation-layer/pages/GaragePage.dart';
import 'package:gradutionproject/preseitation-layer/pages/firstfloorpage.dart';
import 'package:gradutionproject/preseitation-layer/pages/gardenpage.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../../data-layer/custemshard/shard.dart';



// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  
  
  List<dynamic> items = [
    "First Floor",
    "Garden",
    "Garage",
  ];
  
  List<dynamic> pages = [
    FirstFloorPage(),
    GardenPage(),
    GaragePage(),
  ];



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<iotCubit,iotStates>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        
       
        return  Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child:  Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Home Temperature',
                          style: GoogleFonts.lora(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height/25,
                          ),
                       Expanded(
        child: Row(
          children: [
                 
            Expanded(
              child: FirebaseAnimatedList(
                query: iotCubit.get(context).ref,
                itemBuilder: (context, snapshot, animation, index) {
                  return  SleekCircularSlider(
                        appearance: CircularSliderAppearance(
                            customWidths: CustomSliderWidths(
                                trackWidth: 4,
                                progressBarWidth: 20,
                                shadowWidth: 40),
                            customColors: CustomSliderColors(
                                trackColor: HexColor('##ea1010'),
                                progressBarColor: HexColor('##ea1010'),
                                shadowColor: HexColor('##ea1010'),
                                shadowMaxOpacity: 0.5, //);
                                shadowStep: 20),
                            infoProperties: InfoProperties(
                                bottomLabelStyle:GoogleFonts.lora(
                                  color: HexColor('##f6f4f4'),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                ),
                               
                                bottomLabelText: 'Temp',
                                mainLabelStyle: GoogleFonts.lora(
                                    color: HexColor('##f6f4f4'),
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w600),
                                modifier: (double value) {
                                  return '${snapshot.value.toString()} ˚C';
                                }),
                            startAngle: 90,
                            angleRange: 360,
                            size: 150.0,
                            animationEnabled: true),
                        min: 0,
                        max: 100,
                        initialValue: double.parse(snapshot.value.toString()),
                      );
                },
              ),
            ),
            Expanded(
              child: FirebaseAnimatedList(
                  query: iotCubit.get(context).ref2,
                  itemBuilder: (context, snapshot, animation, index) {
                    return SleekCircularSlider(
                          appearance: CircularSliderAppearance(
                              customWidths: CustomSliderWidths(
                                  trackWidth: 4,
                                  progressBarWidth: 20,
                                  shadowWidth: 40),
                              customColors: CustomSliderColors(
                                  trackColor: HexColor('#0277bd'),
                                  progressBarColor: HexColor('#4FC3F7'),
                                  shadowColor: HexColor('#B2EBF2'),
                                  shadowMaxOpacity: 0.5, //);
                                  shadowStep: 20),
                              infoProperties: InfoProperties(
                                  bottomLabelStyle: GoogleFonts.lora(
                                      color: HexColor('##f6f4f4'),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                  bottomLabelText: 'Humidity',
                                  mainLabelStyle: GoogleFonts.lora(
                                      color: HexColor('##f6f4f4'),
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w600),
                                  modifier: (double value) {
                                    return  '${snapshot.value.toString()} %';
                                  }),
                              startAngle: 90,
                              angleRange: 360,
                              size: 150.0,
                              animationEnabled: true),
                          min: 0,
                          max: 100,
                          initialValue:double.parse(snapshot.value.toString()),
                        );
                  }
              ),
            )
          ],
        ),
      ) ,
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 9,
                  width: double.infinity,
                  //علشان اعرض الايتم بشكل تلقائي
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: items.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                           
                            GestureDetector(
                              onTap: () {
              
                                iotCubit.get(context).changepages(index);
                               
                              },
                              //دا الشكل الي انا استلمت فيه الايتم من اللست
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal:
                                        MediaQuery.of(context).size.width / 14),
                                width: MediaQuery.of(context).size.width/4,
                                height: MediaQuery.of(context).size.height/16,
                                decoration: BoxDecoration(
                                    color: iotCubit.get(context).curntindex == index
                                        ? Colors.blue
                                        : Colors.grey,
                                    borderRadius: iotCubit.get(context).curntindex == index
                                        ? BorderRadius.circular(15)
                                        : BorderRadius.circular(15),
                                    //داالبوردر الخارجي للكونتينر
                                    border: iotCubit.get(context).curntindex == index
                                        ? Border.all(color: Colors.black, width: 2)
                                        : null),
                                child: Center(
                                  child: Text(items[index],style: GoogleFonts.lora(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    ),),
                                ),
                              ),
                            ),
                      
                            Visibility(
                                visible: iotCubit.get(context).curntindex == index,
                                child: Container(
                                  width: 5,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey,
                                  ),
                                ))
                          ],
                        );
                      }),
                ),
                //دا بقي الكونتينر الي انا بستلم فيه الصفح بتاع كل ايتم
                Container(
                  margin: EdgeInsets.only(top: 30),
                  width: double.infinity,
                  height: 700,
                  child: pages[iotCubit.get(context).curntindex],
                )
              ],
            ),
        ),
    
          );
        
      },
    );
  }
}
