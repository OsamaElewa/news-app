import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/constants.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class Sportspage extends StatelessWidget {
  const Sportspage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
      listener:(context, state) {} ,
      builder: (context, state) {
        var cubit=NewsCubit.get(context);
        var list=NewsCubit.get(context).sport;
        return articleBuilder(list,context);
      },
    );
  }
}
