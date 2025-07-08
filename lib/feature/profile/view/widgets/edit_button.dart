import 'package:el_wekala/core/utils/colors/colors.dart';
import 'package:el_wekala/feature/profile/cubit/profile_cubit.dart';
import 'package:el_wekala/feature/profile/cubit/profile_state.dart';
import 'package:flutter/material.dart';

Stack editButton(ProfileGetDataSuccessState state, BuildContext context) {
  return Stack(
    alignment: Alignment.bottomRight,
    children: [
      Padding(
        padding: const EdgeInsets.all(18),
        child: CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(state.model.profileImage),
        ),
      ),
      IconButton(
        style: IconButton.styleFrom(backgroundColor: defaultColor),
        onPressed: () async {
          ProfileCubit.get(context).edit();
        },
        icon: Icon(Icons.edit, color: white, size: 22),
      ),
    ],
  );
}
