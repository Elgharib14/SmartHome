import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //**************************************************** AlanVoiceAssistantHandling Start*********************************************
  // alanVoiceAssistant() {
  //   /// Init Alan Button with project key from Alan Studio
  //   AlanVoice.addButton(
  //       "f00b161b0668189a1474a9a99231d01d2e956eca572e1d8b807a3e2338fdd0dc/stage",
  //       buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);

  //   /// Handle commands from Alan Studio
  //   AlanVoice.onCommand.add((command) => _handleCommand(command.data));
  //   // AlanVoice.getWakewordEnabled();
  //   // AlanVoice.setWakewordEnabled(true);
  // }

  // void _handleCommand(Map<String, dynamic> command) {
  //   switch (command['command']) {
  //     case "turn Off":
  //       offOn();
  //       break;
  //     case "turn On":
  //       offOn();
  //       break;
  //     default:
  //       debugPrint('**********');
  //   }
  // }

  //**************************************************** AlanVoiceAssistantHandling End***********************************************

//******************************************************FireBaseHandling Start********************************************************

  void offOn() {
    setState(() {
      isOffInrealTimeDatabase = !isOffInrealTimeDatabase;
    });
  }

  bool isOffInrealTimeDatabase = false;
  DatabaseReference ref = FirebaseDatabase.instance.ref();
//******************************************************FireBaseHandling End********************************************************
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Switch(
              value: isOffInrealTimeDatabase,
              onChanged: (value) async {
                await ref.set({
                  "HomeLightOne": {"Switch": !isOffInrealTimeDatabase},
                });
                offOn();
              },
            ),
          ),
          // Container(
          //   child: alanVoiceAssistant(),
          // )
        ],
      ),
    );
  }
}
