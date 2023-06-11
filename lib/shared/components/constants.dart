
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/modules/web_view/web_view_screen.dart';

import '../cubit/cubit.dart';

Widget buildArticleItem(article, context)=>
    GestureDetector(
     onTap: (){
      navigateTo(context, WebViewScreen( article['url']));
     },
      child: Padding(
 padding: const EdgeInsets.all(20.0),
 child: Row(
  children: [
   Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image:  DecorationImage(
           image: NetworkImage('${article['urlToImage']}'),
           fit: BoxFit.cover,
          )
      ),
   ),
   const SizedBox(width: 20,),
   Expanded(
      child: SizedBox(
       height: 120,
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
         Expanded(
          child: Text('${article['title']}',
           style: Theme.of(context).textTheme.bodyText1,
           maxLines: 2,
          ),
         ),
         Text('${article['publishedAt']}',
          style: const TextStyle(
           color: Colors.grey,
          ),),
        ],
       ),
      ),
   ),
  ],
 ),
),
    );

Widget myDivider()=>Padding(
 padding: const EdgeInsetsDirectional.only(start: 20),
 child: Container(
  height: 1,
  width: double.infinity,
  color: Colors.grey[300],
 ),
);

Widget articleBuilder(list, context)=>ConditionalBuilder(
 condition: list.isNotEmpty,
 builder: (context)=> ListView.separated(
  physics: BouncingScrollPhysics(),
  itemBuilder: (context, index)=> buildArticleItem(list[index],context),
  separatorBuilder: (context, index)=>myDivider(),
  itemCount:NewsCubit.get(context).business.length,
 ),
 fallback: (context)=> const Center(child: CircularProgressIndicator(),),
);

void navigateTo(context,widget)=>Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context)=>widget,
    ),
);