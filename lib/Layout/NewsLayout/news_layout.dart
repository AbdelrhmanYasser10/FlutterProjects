import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Layout/NewsLayout/cubit/news_cubit.dart';
import 'package:news_app/shared/cubit/cubit.dart';

import 'cubit/states.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusinessNews(),
      child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NewsCubit.get(context);
            return Scaffold(
              body: cubit.screens[cubit.currentIndex],
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(
                    Icons.brightness_6_outlined,
                  ),
                  onPressed: () {
                   AppCubit.get(context).changeAppMode();
                  },
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.search,
                    ),
                    onPressed: () {},
                  ),
                ],
                title: Text(
                  'BREAKING NEWS',
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeIndex(index);
                },
                items: cubit.items,
              ),
            );
          }),
    );
  }
}
