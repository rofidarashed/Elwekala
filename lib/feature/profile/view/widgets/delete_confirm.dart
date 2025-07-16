 import 'package:el_wekala/feature/profile/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';

void showDeleteConfirmation(
    BuildContext context,
    ProfileCubit profileCubit,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Account'),
        content: const Text(
          'Are you sure you want to delete your account? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              profileCubit.deleteProfile();
              Navigator.pop(context);
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
