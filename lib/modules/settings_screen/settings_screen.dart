import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_appli/layout/main_layout/cubit/shop_cubit.dart';
import 'package:shop_appli/layout/main_layout/cubit/shop_states.dart';
import 'package:shop_appli/shared/colors/colors.dart';
import 'package:shop_appli/shared/constants/constants.dart';

// ignore: must_be_immutable
class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  TextEditingController? nameController;
  TextEditingController? phoneController;
  TextEditingController? emailController;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        nameController = TextEditingController(text: ShopCubit.get(context).userModel!.data!.name!);
        phoneController = TextEditingController(text: ShopCubit.get(context).userModel!.data!.phone!);
        emailController = TextEditingController(text: ShopCubit.get(context).userModel!.data!.email!);
        print(ShopCubit.get(context).userModel);

        return ShopCubit.get(context).userModel == null
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LinearProgressIndicator(),
                      Text('Loading...'),
                    ],
                  ),
                ),
              )
            : Form(
              key: formKey,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                    children: [
                      if(state is ShopLoadingUpdateUserState)
                        LinearProgressIndicator(),
                      SizedBox(
                        height: 5.0,
                      ),
                      Center(
                        child: CircleAvatar(
                          backgroundColor: defaultColor,
                          radius: 64,
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(
                                '${ShopCubit.get(context).userModel!.data!.image!}'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: InkWell(
                                onTap:(){},
                                child: Column(
                                  children: [
                                    Text(
                                      'Credits',
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      '${ShopCubit.get(context).userModel!.data!.credits!}'
                                    ),
                                  ],
                                ),
                              ),
                          ),
                          Expanded(
                              child: InkWell(
                                onTap: (){},
                                child: Column(
                                  children: [
                                    Text(
                                      'Points',
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      '${ShopCubit.get(context).userModel!.data!.points!}'
                                    ),
                                  ],
                                ),
                              ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1.0,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              TextFormField(
                                controller: nameController,
                                decoration: InputDecoration(
                                  labelText: "User Name",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1.0,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              TextFormField(
                                controller: phoneController,
                                decoration: InputDecoration(
                                  labelText: "Phone",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1.0,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.phone,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.deepOrange
                                      ),
                                      child: MaterialButton(
                                        onPressed: () {
                                          signOut(context);
                                        },
                                        child: Text(
                                          'LOGOUT',
                                          style: TextStyle(
                                            color: Colors.white
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.deepOrange
                                      ),
                                      child: MaterialButton(
                                        onPressed: () {
                                          if(formKey.currentState!.validate())
                                          {
                                            ShopCubit.get(context).updateUserData(
                                              name: nameController!.text,
                                              phone: phoneController!.text,
                                              email: emailController!.text,
                                            );
                                          }
                                        },
                                        child: Text(
                                          'UPDATE',
                                          style: TextStyle(
                                            color: Colors.white
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
}
