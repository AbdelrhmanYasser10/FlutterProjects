// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/modules/signup_screen/signup_screen.dart';
import 'package:instagram_clone/shared/network/resources/auth_method/auth_method.dart';

import '../../shared/colors/colors.dart';
import '../../Layout/responsive/mobile_screen_layout/mobile_screen_layout.dart';
import '../../Layout/responsive/responsive_layout_screen.dart';
import '../../Layout/responsive/web_screen_layout/web_screen_layout.dart';
import '../../shared/widgets/text_field_input/text_field_input.dart';
import '../../shared/widgets/toast/my_toast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser()async{
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethod().logInUser(email: _emailController.text, password: _passwordController.text);
    if(res != "Log in successfully"){
      await myToast(
        msg: res,
        color: Colors.red,
        txtColor: Colors.white,
      );
    }
    else{
      await myToast(
        msg: res,
        color: Colors.green,
        txtColor: Colors.white,
      );
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => const ResponsiveLayout(
                mobileScreenLayout: MobileScreenLayout(),
                webScreenLayout: WebScreenLayout(),
              )),
              (route) => false);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(flex: 2,child:  Container(),),
              SvgPicture.asset(
                'assets/images/instagram-1.svg',
                height: 64.0,
                color: primaryColor,
              ),
              const SizedBox(
                height: 64.0,
              ),
              TextFieldLayout(
                textEditingController: _emailController,
                textInputType: TextInputType.emailAddress,
                hintText: "Enter your email",
              ),
              const SizedBox(
                height: 24.0,
              ),
              TextFieldLayout(
                textEditingController: _passwordController,
                textInputType: TextInputType.text,
                hintText: "Enter your password",
                isPassword: true,
              ),
              const SizedBox(
                height: 24.0,
              ),
              isLoading?const Center(child: CircularProgressIndicator(),):ElevatedButton(
                  onPressed: loginUser,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50), // NEW
                  ),
                  child: const Text(
                      'Log In',
                    style: TextStyle(
                      fontSize: 18.0
                    ),
                  )
              ),
              const SizedBox(height: 16.0,),
              Flexible(flex: 2,child:  Container(),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: const Text(
                        "Don't have an account?",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const SignUpScreen()), (route) => false);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: const Text(
                          " Sign up",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0,),
            ],
          ),
        ),
      ),
    );
  }
}
