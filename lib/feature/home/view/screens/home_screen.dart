import 'package:el_wekala/core/utils/colors/colors.dart';
import 'package:el_wekala/feature/home/cubit/home_cubit.dart';
import 'package:el_wekala/feature/home/cubit/home_state.dart';
import 'package:el_wekala/feature/home/view/widgets/home_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeSuccess) {
          return Scaffold(
            backgroundColor: Colors.grey[50],
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                'Discover Products',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(Icons.refresh, color: defaultColor),
                  onPressed: () => context.read<HomeCubit>().dataCubit(),
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: GridView.builder(
                padding: EdgeInsets.only(top: 16.h),
                itemCount: state.list.length,
                itemBuilder: (context, index) {
                  final item = state.list[index];
                  return HomeProductWidget(productModel: item);
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.h,
                  crossAxisSpacing: 16.w,
                  childAspectRatio: 0.62.h,
                ),
              ),
            ),
          );
        } else if (state is HomeError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => context.read<HomeCubit>().dataCubit(),
                  child: Text('Retry'),
                ),
              ],
            ),
          );
        }
        return Center(child: Text('Unknown state'));
      },
    );
  }
}
