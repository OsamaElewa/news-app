import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/components/constants.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';

class Businesspage extends StatelessWidget {
  const Businesspage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
      listener:(context, state) {} ,
      builder: (context, state) {
        var cubit=NewsCubit.get(context);
        var list=NewsCubit.get(context).business;
        return articleBuilder(list,context);
      },
    );
  }
}
