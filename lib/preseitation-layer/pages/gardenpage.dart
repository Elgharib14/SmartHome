import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/business-layer/bloc/cubit.dart';
import 'package:gradutionproject/business-layer/bloc/statas.dart';

import '../../data-layer/custemshard/shard.dart';

// ignore: must_be_immutable
class GardenPage extends StatelessWidget {
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  Widget build(BuildContext context) {
    return BlocConsumer<iotCubit, iotStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
            child: Column(
          children: [
            Row(
              children: [
                ElectricItem(context,
                    imagoff: "assets/lampoff.png",
                    imagon: "assets/lampon.png",
                    nam: "Lights",
                    value: iotCubit.get(context).gardenlamp, fun: () async {
                  iotCubit.get(context).GardenLamp();
                  await ref.update({
                    "Gardenlight": {"Switch": iotCubit.get(context).gardenlamp},
                  });
                }),
                Spacer(),
                ElectricItem(context,
                    imagoff: "assets/coveron.png",
                    imagon: "assets/coveroff.png",
                    nam: "Cover",
                    value: iotCubit.get(context).gardencover, fun: () async {
                  iotCubit.get(context).Gardencover();
                  await ref.update({
                    "gardencoverstate": {
                      "Switch": iotCubit.get(context).gardencover
                    },
                  });
                }),
              ],
            ),
            //  SafteyItem(
            //       text: 'Close All Home',
            //       value:iotCubit.get(context).closslamp ,
            //       fun: () async {
            //         iotCubit.get(context).closegardenlamp();
            //         await ref.set({
            //             "GardenLampState": {"Switch":iotCubit.get(context).closslamp},
            //                   });
            //       }
            //       )
          ],
        ));
      },
    );
  }
}
