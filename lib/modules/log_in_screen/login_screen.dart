import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_appli/layout/main_layout/main_layout.dart';
import 'package:shop_appli/modules/log_in_screen/cubit/login_cubit.dart';
import 'package:shop_appli/modules/log_in_screen/cubit/login_state.dart';
import 'package:shop_appli/modules/register_screen/register_screen.dart';
import 'package:shop_appli/shared/components/components.dart';
import 'package:shop_appli/shared/constants/constants.dart';
import 'package:shop_appli/shared/network/local/cache_helper.dart';

// ignore: must_be_immutable
class LogInScreen extends StatefulWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isVisible = true;
  var formKey = GlobalKey<FormState>();
  LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (!state.loginModel.status!) {
              showToast(
                message: state.loginModel.message!,
                state: ToastStates.ERROR,
              );
            } else {
              CacheHelper.saveData(
                      key: 'token', value: state.loginModel.userData!.token)
                  .then((value) {
                token = state.loginModel.userData!.token;
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => ShopLayout()),
                    (route) => false);
              });
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 400,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.deepOrange, Colors.red],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Salla',
                          style:
                              Theme.of(context).textTheme.headline1!.copyWith(
                                    color: Colors.white,
                                    fontSize: 75.0,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: widget.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'LOGIN',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 36.0),
                              ),
                              Text(
                                'Login and see ower new offers',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                controller: widget.emailController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1.0),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                  ),
                                  labelText: "Email Address",
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "The Email must not be empty";
                                  } else {
                                    bool valid = value.contains('@', 0);
                                    if (!valid) {
                                      return "This Email is Not Valid";
                                    }
                                  }
                                },
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              TextFormField(
                                obscureText: widget.isVisible,
                                controller: widget.passwordController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1.0),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.lock_outlined,
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
                                height: 20.0,
                              ),
                              Container(
                                child: state is! LoginLoadingState
                                    ? Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.deepOrange,
                                        ),
                                        child: MaterialButton(
                                          onPressed: () {
                                            if (widget.formKey.currentState!
                                                .validate()) {
                                              LoginCubit.get(context).userLogin(
                                                email:
                                                    widget.emailController.text,
                                                password: widget
                                                    .passwordController.text,
                                              );
                                            }
                                          },
                                          child: Text(
                                            'LOGIN',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ))
                                    : Center(
                                        child: CircularProgressIndicator(),
                                      ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Don\'t have an account ?',
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegisterScreen()));
                                    },
                                    child: Text(
                                      'Register',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
