import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/business-layer/bloc/cubit.dart';
import 'package:gradutionproject/business-layer/bloc/statas.dart';
import '../../data-layer/custemshard/shard.dart';

// ignore: must_be_immutable
class GaragePage extends StatelessWidget {
  @override
  // ignore: override_on_non_overriding_member
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
                    nam: "Lights",
                    value: iotCubit.get(context).garagelamp, fun: () async {
                  iotCubit.get(context).GarageLamp();
                  await ref.update({
                    "GarageLight": {"Switch": iotCubit.get(context).garagelamp},
                  });
                }),
                Spacer(),
                ElectricItem(context,
                    imagoff: "assets/garageoff.png",
                    imagon: "assets/garageon.png",
                    nam: "Door",
                    value: iotCubit.get(context).garagedoor, fun: () async {
                  print(iotCubit.get(context).garagedoor);
                  iotCubit.get(context).GarageDoor();
                  await ref.update({
                    "GarageDoor": {"Switch": iotCubit.get(context).garagedoor},
                  });
                }),
              ],
            ),
          ],
        );
      },
    );
  }
}
