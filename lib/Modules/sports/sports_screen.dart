import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Layout/Components/components.dart';
import 'package:news_app/Layout/NewsLayout/cubit/news_cubit.dart';
import 'package:news_app/Layout/NewsLayout/cubit/states.dart';

class SportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder:(context,state) => ConditionalBuilder(
        condition: NewsCubit.get(context).sports.length > 0,
        builder: (context)=>ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context,index)=>buildArticleItem(NewsCubit.get(context).sports[index],context),
          separatorBuilder: (context,index)=>Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 1.0,
              width: double.infinity,
              color: Colors.grey,
            ),
          ),
          itemCount: NewsCubit.get(context).sports.length,
        ),
        fallback: (context) => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
