import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_appli/modules/register_screen/cubit/register_cubit.dart';
import 'package:shop_appli/modules/register_screen/cubit/register_states.dart';
import 'package:shop_appli/shared/colors/colors.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  var formKey = GlobalKey<FormState>();
  bool isVisible = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();

  RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
          listener: (context, state) {
      }, builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [defaultColor, Colors.red],
          )),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Salla',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(fontSize: 54.0, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Expanded(
                        child: Form(
                          key: widget.formKey,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'REGISTER',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(color: Colors.white),
                                ),
                                Text(
                                  'Register now to see our new offers',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  controller: widget.emailController,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        width: 1.0,
                                        color: Colors.white,
                                      )),
                                      errorStyle:
                                          TextStyle(color: Colors.white),
                                      labelText: "Email",
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        width: 1.0,
                                        color: Colors.white,
                                      )),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 1.0)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 1.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.email_outlined,
                                        color: Colors.white,
                                      )),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Email must not be empty";
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                TextFormField(
                                  obscureText: widget.isVisible,
                                  style: TextStyle(color: Colors.white),
                                  controller: widget.passwordController,
                                  decoration: InputDecoration(
                                    errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                      width: 1.0,
                                      color: Colors.white,
                                    )),
                                    errorStyle: TextStyle(color: Colors.white),
                                    labelStyle: TextStyle(color: Colors.white),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                      width: 1.0,
                                      color: Colors.white,
                                    )),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 1.0)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.lock_outlined,
                                      color: Colors.white,
                                    ),
                                    labelText: "Password",
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          widget.isVisible = !widget.isVisible;
                                        });
                                      },
                                      icon: Icon(
                                        !widget.isVisible
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "The password is too short";
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                TextFormField(
                                  controller: widget.nameController,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        width: 1.0,
                                        color: Colors.white,
                                      )),
                                      errorStyle:
                                          TextStyle(color: Colors.white),
                                      labelText: "Username",
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        width: 1.0,
                                        color: Colors.white,
                                      )),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 1.0)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 1.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Colors.white,
                                      )),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "User name must not be empty";
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                TextFormField(
                                  controller: widget.phoneController,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        width: 1.0,
                                        color: Colors.white,
                                      )),
                                      errorStyle:
                                          TextStyle(color: Colors.white),
                                      labelText: "Phone",
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        width: 1.0,
                                        color: Colors.white,
                                      )),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 1.0)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 1.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.phone,
                                        color: Colors.white,
                                      )),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Phone Number must not be empty";
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 50.0,
                                ),
                                Container(
                                    width: double.infinity,
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                    child: state is! ShopRegisterLoadingState
                                        ? MaterialButton(
                                            onPressed: () {
                                              if (widget.formKey.currentState!
                                                  .validate()) {
                                                ShopRegisterCubit.get(context)
                                                    .userRegister(
                                                  name: widget
                                                      .nameController.text,
                                                  email: widget
                                                      .emailController.text,
                                                  password: widget
                                                      .passwordController.text,
                                                  phone: widget
                                                      .phoneController.text,
                                                );
                                              }
                                            },
                                            child: Text(
                                              'REGISTER',
                                              style: TextStyle(
                                                  color: defaultColor),
                                            ),
                                          )
                                        : Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        );
      }),
    );
  }
}
