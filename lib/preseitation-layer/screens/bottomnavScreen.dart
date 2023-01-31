import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradutionproject/business-layer/bloc/cubit.dart';
import 'package:gradutionproject/business-layer/bloc/statas.dart';
import 'package:gradutionproject/preseitation-layer/screens/homescreen.dart';
import 'package:gradutionproject/preseitation-layer/screens/safteyscreen.dart';
import 'package:intl/intl.dart';
import 'package:alan_voice/alan_voice.dart';

// ignore: must_be_immutable
class BottomNaveScreen extends StatelessWidget {
  List<dynamic> screens = [
    // ProfilScreen(),
    HomeScreen(),
    SecurityScreen()
  ];
  var date = DateFormat('dd-MM-yyyy').format(DateTime.now());
  var time = DateFormat('KK:mm:ss a').format(DateTime.now());

  IconData iconlight = Icons.light_mode_outlined;
  IconData iconDark = Icons.dark_mode_outlined;

  _MyHomePageState() {
    /// Init Alan Button with project key from Alan Studio
    AlanVoice.addButton(
        "b5b33323172cb13f96309a4e983bf44a2e956eca572e1d8b807a3e2338fdd0dc/stage",
        buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);

    /// Handle commands from Alan Studio
    AlanVoice.onCommand.add((command) {
      debugPrint("got new command ${command.toString()}");
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<iotCubit, iotStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            // floatingActionButton: FloatingActionButton(
            //   onPressed: (){},
            //   child:alanVoiceAssistant() ,
            // ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    child: _MyHomePageState(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        // CircleAvatar(
                        //   maxRadius: 40,
                        //   backgroundImage: NetworkImage(
                        //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoXSUxysVdmnP4CmDE3ENtI0AawOW_ysx4SQ&usqp=CAU'),
                        //   backgroundColor: Colors.white,
                        // ),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Welcome',
                                style: GoogleFonts.lora(
                                    fontSize: 25, fontWeight: FontWeight.bold)),
                            Text(
                              '${date}',
                              style: GoogleFonts.lora(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            // Text('${time}',style: GoogleFonts.aclonica(
                            //   fontSize: 20,
                            //     fontWeight: FontWeight.bold
                            // ),),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            iotCubit.get(context).Thememode();
                          },
                          icon: Icon(
                            iotCubit.get(context).themmode
                                ? iconDark
                                : iconlight,
                          ),
                          iconSize: 35,
                        )
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height / 40,
                  // ),
                  screens[iotCubit.get(context).curntscreen],
                  // SizedBox(
                  //   child:iotCubit.get(context).alanVoiceAssistant() ,
                  // )
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: iotCubit.get(context).curntscreen,
              onTap: (index) {
                iotCubit.get(context).changebottomvav(index);
              },
              type: BottomNavigationBarType.fixed,
              items: [
                // BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile',),
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.security), label: 'Safety'),
              ],
            ),
          );
        },
      ),
    );
  }
}
