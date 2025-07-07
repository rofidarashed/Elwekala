import 'package:el_wekala/core/utils/colors/colors.dart';
import 'package:el_wekala/feature/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';

class ImagPickerWidget extends StatelessWidget {
  const ImagPickerWidget({super.key, required this.cubit});

  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Padding(
          padding: const EdgeInsets.all(18),
          child: CircleAvatar(
            radius: 40,
            backgroundImage: cubit.image == null
                ? AssetImage("assets/profile.png")
                : FileImage(cubit.image!),
          ),
        ),
        IconButton(
          style: IconButton.styleFrom(backgroundColor: Colors.white70),
          onPressed: () async {
            await cubit.saveImage();
          },
          icon: Icon(Icons.camera_alt, color: defaultColor, size: 22),
        ),
      ],
    );
  }
}
