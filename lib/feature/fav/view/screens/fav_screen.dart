import 'package:ap2/feature/fav/cubit/fav_state.dart';
import 'package:ap2/feature/fav/cubit/fav_cubit.dart';
import 'package:ap2/feature/fav/view/widgets/fav_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        if (state is FavLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is FavSuccess) {
          return Scaffold(
            appBar: AppBar(),
            body: ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                return FavItem(favModel: state.list[index]);
              },
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
