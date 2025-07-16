import 'package:el_wekala/core/utils/animations/fade_in_animation.dart';
import 'package:el_wekala/feature/fav/cubit/fav_state.dart';
import 'package:el_wekala/feature/fav/cubit/fav_cubit.dart';
import 'package:el_wekala/feature/fav/view/widgets/fav_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        if (state is FavLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is FavSuccess) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Favorites',
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
              centerTitle: true,
              elevation: 0,
            ),
            body: FadeInAnimation(
              child: state.list.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.favorite_border,
                              size: 60.sp, color: Colors.grey[400]),
                          SizedBox(height: 16.h),
                          Text('No favorites yet',
                              style: TextStyle(
                                  fontSize: 18.sp, color: Colors.grey[600])),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.all(16.r),
                      itemCount: state.list.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: FavItem(favModel: state.list[index]),
                        );
                      },
                    ),
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}