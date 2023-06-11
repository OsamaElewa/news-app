import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/components/constants.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';

class SearchPage extends StatelessWidget {
   SearchPage({Key? key}) : super(key: key);
  var searchController=TextEditingController();
   var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<NewsCubit,NewsState>(
        listener: (context,state){},
        builder: (context,state){
          var list=NewsCubit.get(context).search;
          return  Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: searchController,
                      keyboardType: TextInputType.text,
                      onChanged: (value){
                        NewsCubit.get(context).GetSearch(value);
                      },
                      validator: (value){
                        if(value!.isEmpty)
                        {
                          return 'title must not be empty';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search),
                        label:Text('Search'),
                      ),
                    ),
                  ),
                  Expanded(child: articleBuilder(list, context))
                ],
              ),
            ),
          );
        },
      );
  }
}
