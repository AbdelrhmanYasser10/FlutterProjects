import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_appli/modules/log_in_screen/cubit/login_cubit.dart';
import 'package:shop_appli/modules/log_in_screen/cubit/login_state.dart';

// ignore: must_be_immutable
class LogInScreen extends StatefulWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isVisible = true;

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
        listener: (context, state) {},
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
                                    widget.isVisible
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
                              ),
                              child: MaterialButton(
                                onPressed: () {},
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account ?',
                                ),
                                TextButton(
                                  onPressed: () {},
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
