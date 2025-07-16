import 'package:el_wekala/core/utils/animations/fade_in_animation.dart';
import 'package:el_wekala/feature/auth/view/screens/login_screen.dart';
import 'package:el_wekala/feature/auth/view/screens/register_screen.dart';
import 'package:el_wekala/feature/profile/cubit/profile_cubit.dart';
import 'package:el_wekala/feature/profile/cubit/profile_state.dart';
import 'package:el_wekala/feature/profile/view/widgets/delete_confirm.dart';
import 'package:el_wekala/feature/profile/view/widgets/edit_button.dart';
import 'package:el_wekala/feature/profile/view/widgets/edit_profile_info.dart';
import 'package:el_wekala/feature/profile/view/widgets/profile_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileDeleteState) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => RegisterScreen()),
            (route) => false,
          );
        }
        if (state is ProfileErrorState) {
          print(state.message);
          Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Failed to load profile'),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () => context.read<ProfileCubit>().getProfile(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }
        if (state is ProfileUpdateSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Profile updated successfully'),
              duration: Durations.medium4,
            ),
          );
        }
        if (state is ProfileLoadingState) {
          Center(child: CircularProgressIndicator());
        }
      },
      builder: (context, state) {
        final profileCubit = context.read<ProfileCubit>();

        if (state is ProfileInitialState) {
          profileCubit.getProfile();
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ProfileGetDataSuccessState) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'My Profile',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              elevation: 0,
            ),
            body: FadeInAnimation(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(16.r, 8.r, 16.r, 16.r),
                child: Column(
                  children: [
                    editButton(state, context),
                    SizedBox(height: 24.h),
                    profileCubit.isEdit
                        ? Center(child: profileInfo(state))
                        : editProfileInfo(state, context),
                    SizedBox(height: 24.h),
                    OutlinedButton(
                      onPressed: () =>
                          showDeleteConfirmation(context, profileCubit),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.red),
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 12.h,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: const Text(
                        "Delete account",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        print(state);
        return Container();
      },
    );
  }
}
