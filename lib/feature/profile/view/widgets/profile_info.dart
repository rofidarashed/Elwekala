import 'package:el_wekala/core/utils/colors/colors.dart';
import 'package:el_wekala/feature/profile/cubit/profile_state.dart';
import 'package:flutter/material.dart';

Column profileInfo(ProfileGetDataSuccessState state) {
    return Column(
                  children: [
                    Text(
                      state.model.name,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(state.model.email, style: TextStyle(color: gray3)),
                  ],
                );
  }
