import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shop_appli/layout/main_layout/cubit/shop_cubit.dart';
import 'package:shop_appli/layout/main_layout/cubit/shop_states.dart';
import 'package:shop_appli/shared/colors/colors.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);

        return Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(
                bottom: 10.0,
                right: 10.0,
                top: 0.0,
                left: 10.0,
            ),
            child: GNav(
                    rippleColor: defaultColor, // tab button ripple color when pressed
                    hoverColor: defaultColor, // tab button hover color
                    duration: Duration(milliseconds: 900),
                    tabBorderRadius: 5.0,
                    gap: 10,// tab animation duration
                    activeColor: defaultColor, // selected icon and text color
                    color: Colors.blueGrey,
                    iconSize: 24, // tab button icon size
                    tabBackgroundColor: defaultColor.withOpacity(0.2), // selected tab background color
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5), // navigation bar padding
                    tabs: [
                      GButton(
                        onPressed: (){
                            cubit.changeBottomScreens(index: 0);
                        },
                        icon: FontAwesomeIcons.home,
                        text: '${cubit.titles[0]}',
                      ),
                      GButton(
                        onPressed: (){
                          cubit.changeBottomScreens(index: 1);
                        },
                        icon: FontAwesomeIcons.shoppingBag,
                        text: '${cubit.titles[1]}',
                      ),
                      GButton(
                        onPressed: (){
                          cubit.changeBottomScreens(index: 2);
                        },
                        icon: FontAwesomeIcons.heart,
                        text: '${cubit.titles[2]}',
                      ),
                      GButton(
                        onPressed: (){
                          cubit.changeBottomScreens(index: 3);
                        },
                        icon: FontAwesomeIcons.cogs,
                        text: '${cubit.titles[3]}',
                      )
                    ]
            ),
          ),
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.search,
                    size: 18.0,
                  )),
            ],
            title: Text(
              'Salla',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 30.0,
                  ),
            ),
          ),
          /*drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Row(
                children: [

                ],
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),*/
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
