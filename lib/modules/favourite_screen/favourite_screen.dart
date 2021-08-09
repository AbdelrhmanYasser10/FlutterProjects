import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_appli/layout/main_layout/cubit/shop_cubit.dart';
import 'package:shop_appli/layout/main_layout/cubit/shop_states.dart';
import 'package:shop_appli/models/favourite_model/favourite_model.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ShopCubit.get(context)
                    .favouriteModel!
                    .favouriteData!
                    .products
                    .length > 0
            ? state is! ShopLoadingFavouriteState
                ? ListView.separated(
                    physics: BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => Container(
                          height: 1.0,
                        ),
                    itemCount: ShopCubit.get(context)
                        .favouriteModel!
                        .favouriteData!
                        .products
                        .length,
                    itemBuilder: (context, index) {
                      return buildFavItem(
                        context: context,
                        productModel: ShopCubit.get(context)
                            .favouriteModel!
                            .favouriteData!
                            .products[index]
                            .productModel!,
                      );
                    })
                : Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          LinearProgressIndicator(),
                          Text('Loading...'),
                        ],
                      ),
                    ),
                  )
            : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.heartBroken,
                      size: 50.0,
                    ),
                    Text('You Haven\'t add any favourite Item yet.')
                  ],
                ),
            );
      },
    );
  }

  Widget buildFavItem({
    required FavouriteProductModel productModel,
    required context,
  }) =>
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Image(
              image: NetworkImage('${productModel.image}'),
              width: 120.0,
              height: 120.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${productModel.name}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Text('${productModel.price}\$  '),
                      productModel.discount == 0
                          ? Text('')
                          : Text(
                              '${productModel.oldPrice}\$',
                              style: TextStyle(
                                fontSize: 10.0,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                if (productModel.discount != 0)
                  Container(
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    child: Text(
                      '${productModel.discount}%',
                      style: TextStyle(
                        fontSize: 8.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                IconButton(
                  onPressed: () {
                    ShopCubit.get(context).changeFavourites(
                      productId: productModel.id!,
                    );
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: ShopCubit.get(context).favourite[productModel.id] ==
                            true
                        ? Colors.red
                        : Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
