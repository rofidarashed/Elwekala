import 'package:device_preview/device_preview.dart';
import 'package:el_wekala/core/helper/values.dart';
import 'package:el_wekala/feature/auth/cubit/auth_cubit.dart';
import 'package:el_wekala/feature/auth/view/screens/register_screen.dart';
import 'package:el_wekala/feature/cart/cubit/cart_cubit.dart';
import 'package:el_wekala/feature/fav/cubit/fav_cubit.dart';
import 'package:el_wekala/feature/home/cubit/home_cubit.dart';
import 'package:el_wekala/feature/home/view/screens/navigator_page.dart';
import 'package:el_wekala/feature/profile/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), 
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => HomeCubit()..dataCubit()),
            BlocProvider(create: (context) => FavCubit()..getFavCubit()),
            BlocProvider(create: (context) => CartCubit()..getCart()),
            BlocProvider(create: (context) => AuthCubit()),
            BlocProvider(create: (context) => ProfileCubit()),
          ],
          child: MaterialApp(
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            home: getIsLogin ? RegisterScreen() : MainScreen(),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
