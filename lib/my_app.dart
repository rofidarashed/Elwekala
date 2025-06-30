import 'package:el_wekala/feature/cart/cubit/cart_cubit.dart';
import 'package:el_wekala/feature/fav/cubit/fav_cubit.dart';
import 'package:el_wekala/feature/home/cubit/home_cubit.dart';
import 'package:el_wekala/feature/home/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()..dataCubit()),
        BlocProvider(create: (context) => FavCubit()..getFavCubit()),
        BlocProvider(create: (context) => CartCubit()..getCartCubit()),
      ],
      child: MaterialApp(home: HomeScreen(), debugShowCheckedModeBanner: false),
    );
  }
}
