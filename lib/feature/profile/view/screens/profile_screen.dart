import 'package:el_wekala/core/utils/colors/colors.dart';
import 'package:el_wekala/feature/profile/cubit/profile_cubit.dart';
import 'package:el_wekala/feature/profile/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoadingState) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (state is ProfileGetDataSuccessState) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(state.model.profileImage),
                  ),
                  Text(
                    state.model.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(state.model.email, style: TextStyle(color: gray3)),
                ],
              ),
            ),
          );
        }
        return Scaffold(body: Center(child: Text('Error')));
      },
    );
  }
}
