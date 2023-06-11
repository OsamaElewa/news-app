import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/components/constants.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/network/remote/dio_helper.dart';

import '../modules/search/search_screen.dart';
import '../shared/cubit/states.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, states){},
      builder: (context, states){
        var cubit= NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
            actions:[
              IconButton(
                  onPressed: (){
                    navigateTo(context, SearchPage());
                  },
                  icon:const Icon(Icons.search),
              ),
              const SizedBox(width: 10.0,),
              IconButton(
                icon: Icon(NewsCubit.get(context).isDark?Icons.brightness_3_rounded:Icons.brightness_7),
                onPressed: (){
                    NewsCubit.get(context).changeAppMode();
                },
              ),
            ],
          ),
          body: cubit.Screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItems,
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.Changeindex(index);
            },
          ),
        );
      },
    );
  }
}
