import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/business-layer/bloc/cubit.dart';
import 'package:gradutionproject/business-layer/bloc/statas.dart';
import 'package:gradutionproject/data-layer/custemshard/shard.dart';

// ignore: must_be_immutable
class FirstFloorPage extends StatelessWidget {
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  Widget build(BuildContext context) {
    return BlocConsumer<iotCubit, iotStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                ElectricItem(context,
                    imagoff: "assets/lampoff.png",
                    imagon: "assets/lampon.png",
                    nam: "Living",
                    value: iotCubit.get(context).lamp1, fun: () async {
                  iotCubit.get(context).Lamp1State();
                  await ref.update({
                    "Homelightred": {"Switch": iotCubit.get(context).lamp1},
                  });
                }),
                Spacer(),
                ElectricItem(context,
                    imagoff: "assets/dooroff.png",
                    imagon: "assets/dooron.png",
                    nam: "Door",
                    value: iotCubit.get(context).door, fun: () async {
                  print(iotCubit.get(context).door);
                  iotCubit.get(context).Doorstate();
                  await ref.update({
                    "HomeDoor": {"Switch": iotCubit.get(context).door}
                  });
                }),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            Row(
              children: [
                ElectricItem(context,
                    imagoff: "assets/fanoff.png",
                    imagon: "assets/fanon.png",
                    nam: "Fan",
                    value: iotCubit.get(context).fan, fun: () async {
                  iotCubit.get(context).Fanstate();
                  await ref.update({
                    "FanState": {"Switch": iotCubit.get(context).fan},
                  });
                }),
                Spacer(),
                ElectricItem(context,
                    imagoff: "assets/lampoff.png",
                    imagon: "assets/lampon.png",
                    nam: "Bathroom",
                    value: iotCubit.get(context).lamp2, fun: () async {
                  iotCubit.get(context).Lamp2state();
                  await ref.update({
                    "Homelightyellow": {"Switch": iotCubit.get(context).lamp2},
                  });
                }),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            ElectricItem(context,
                imagoff: "assets/windooff.png",
                imagon: "assets/windoon.png",
                nam: "Window",
                value: iotCubit.get(context).wendo, fun: () async {
              print(iotCubit.get(context).wendo);
              iotCubit.get(context).Wendostate();
              await ref.update({
                "WindowDoor": {"Switch": iotCubit.get(context).wendo},
              });
            }),
          ],
        );
      },
    );
  }
}
