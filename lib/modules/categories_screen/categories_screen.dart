import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_appli/layout/main_layout/cubit/shop_cubit.dart';
import 'package:shop_appli/layout/main_layout/cubit/shop_states.dart';
import 'package:shop_appli/models/categories_model/categories_model.dart';
import 'package:shop_appli/shared/components/components.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Salla',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 36.0,
                  ),
            ),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Text(
                  'All Categories',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Container(
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                    children: List.generate(
                      ShopCubit.get(context).categoriesModel!.data!.data.length,
                      (index) => buildGridCategories(
                          categoriesData: ShopCubit.get(context)
                              .categoriesModel!
                              .data!
                              .data[index],
                          context: context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildGridCategories({
    required context,
    required CategoriesData categoriesData,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            CategoryIcon(name: categoriesData.name)!,
            SizedBox(
              height: 15.0,
            ),
            Text(
              categoriesData.name!,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}
