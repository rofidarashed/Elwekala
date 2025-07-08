import 'package:el_wekala/feature/profile/cubit/profile_cubit.dart';
import 'package:el_wekala/feature/profile/cubit/profile_state.dart';
import 'package:el_wekala/feature/profile/view/widgets/edit_button.dart';
import 'package:el_wekala/feature/profile/view/widgets/edit_profile_info.dart';
import 'package:el_wekala/feature/profile/view/widgets/profile_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        if (state is ProfileLoadingState) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (state is ProfileGetDataSuccessState) {
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    editButton(state, context),
                    cubit.isEdit
                        ? profileInfo(state)
                        : editProfileInfo(state, context),
                  ],
                ),
              ),
            ),
          );
        }
        return Scaffold(body: Center(child: Text('Error')));
      },
    );
  }
}
