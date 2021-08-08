import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_appli/layout/main_layout/cubit/shop_cubit.dart';
import 'package:shop_appli/layout/main_layout/cubit/shop_states.dart';
import 'package:shop_appli/models/categories_model/categories_model.dart';
import 'package:shop_appli/models/home_model/home_model.dart';
import 'package:shop_appli/shared/colors/colors.dart';
import 'package:shop_appli/shared/components/components.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List<String> images = [
    "https://freepikpsd.com/media/2019/10/grocery-products-png-Transparent-Images.png",
    "https://www.apple.com/ecc-shared/global/buy/images/landing_hero_large.png",
    "https://www.rawayielibrary.com/wp-content/uploads/2021/02/download-beauty-ingredients-of-makeup-parlour-cosmetics-clipart-health-beauty-png-1024_777.png",
  ];
  List<String> offers = [
    "30% OFF DURING COVID19",
    "10% OFF ON APPLE PRODUCTS",
    "40% OFF ON BEAUTY PRODUCTS"
  ];
  List<Color> primaryColors = [
    Colors.deepOrange,
    Colors.blueAccent,
    Colors.green,
  ];

  List<Color> secondaryColors = [
    Colors.orange,
    Colors.lightBlueAccent,
    Colors.greenAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        builder: (context, state) {
          return ShopCubit.get(context).homeModel == null || ShopCubit.get(context).categoriesModel == null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LinearProgressIndicator(),
                        Text(
                          'Loading...',
                        ),
                      ],
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello Abdelrahman',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 24.0),
                        ),
                        Text(
                          'Let\'s gets somethings?',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Colors.blueGrey),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          height: 150,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return buildCard(
                                  image: images[index],
                                  offer: offers[index],
                                  primary: primaryColors[index],
                                  secondary: secondaryColors[index],
                                  context: context);
                            },
                            itemCount: 3,
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Text(
                              'Top Categories',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Spacer(),
                            TextButton(
                                onPressed: (){},
                                child: Text(
                                  'SEE ALL',
                                  style: TextStyle(
                                    color: defaultColor,
                                    fontSize: 12.0
                                  ),
                                ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50.0,
                          child: ListView.separated
                            (
                              separatorBuilder: (context,index)=>SizedBox(
                                width: 5.0,
                              ),
                              itemBuilder:
                                  (context,index)=>buildTopCategories(
                                      context: context,
                                      categoriesModel: ShopCubit.get(context).categoriesModel!,
                                      index: index
                                  ),
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            itemCount: ShopCubit.get(context).categoriesModel!.data!.data.length,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Text(
                              'Top Products',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: (){
                                ShopCubit.get(context).changeBottomScreens(index: 1);
                              },
                              child: Text(
                                'SEE ALL',
                                style: TextStyle(
                                    color: defaultColor,
                                    fontSize: 12.0
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 250.0,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return buildTopProducts(
                                  productModel: ShopCubit.get(context)
                                      .homeModel!
                                      .data!
                                      .products[index],
                                  index: index,
                                  context: context);
                            },
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
        listener: (context, state) {});
  }

  Widget buildCard(
      {required String image,
      required String offer,
      required Color primary,
      required Color secondary,
      required context}) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 350,
            height: 150,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [primary, secondary],
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SizedBox(
              width: 350,
              height: 150,
            ),
          ),
        ),
        Container(
          width: 350,
          height: 140.0,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Image(
              image: NetworkImage(image),
              width: 150.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                offer,
                maxLines: 2,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Get Now',
                      style: TextStyle(
                        color: primary,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTopProducts(
      {required ProductModel productModel, required int index, context}) {
    return SizedBox(
      width: 250,
      child: Stack(
        children: [
          Container(
            child: Center(
              child: Image(
                image: NetworkImage(productModel.image),
                height: 150,
                width: 150,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    productModel.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Colors.blueGrey),
                  ),
                  RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${productModel.price}\$  ',
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.blueGrey
                            ),
                          ),
                          productModel.discount==0?TextSpan(
                            text: '',
                          ):TextSpan(
                            text: '${productModel.oldPrice}\$',
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.blueGrey,
                              decoration: TextDecoration.lineThrough,
                              fontSize: 10.0

                            ),
                          ),
                        ],
                    )
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0
              ),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.grey,
                  )
              ),
            ),
          ),
          Container(
            child: productModel.discount!=0?Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
              ),
              child: Container(
                decoration:BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 5.0,
                  ),
                  child: Text(
                    '${productModel.discount}%',
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ):Container(),
          ),
        ],
      ),
    );
  }

  Widget buildTopCategories({
  required context,
    required CategoriesModel categoriesModel,
    required int index,
}){
    return Container(
      decoration: BoxDecoration(
        color: HexColor('#F3F3F3'),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: CategoryIcon(name: categoriesModel.data!.data[index].name),
      ),
    );
  }
}
