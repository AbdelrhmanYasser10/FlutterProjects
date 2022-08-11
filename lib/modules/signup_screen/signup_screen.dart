// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/modules/login_screen/login_screen.dart';
import 'package:instagram_clone/shared/network/resources/auth_method/auth_method.dart';
import 'package:instagram_clone/shared/network/resources/image_picker/image_picker.dart';
import '../../shared/colors/colors.dart';
import '../../Layout/responsive/mobile_screen_layout/mobile_screen_layout.dart';
import '../../Layout/responsive/responsive_layout_screen.dart';
import '../../Layout/responsive/web_screen_layout/web_screen_layout.dart';
import '../../shared/widgets/text_field_input/text_field_input.dart';
import '../../shared/widgets/toast/my_toast.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void selectImage() async {
    Uint8List? im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void signUpUser() async {
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethod().signUpUser(
        email: _emailController.text,
        password: _passwordController.text,
        username: _usernameController.text,
        bio: _bioController.text,
        file: _image!);
    if (res != "Registered Successfully") {
      await myToast(
        msg: res,
        color: Colors.red,
        txtColor: Colors.white,
      );
    } else {
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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: Container(),
              ),
              SvgPicture.asset(
                'assets/images/instagram-1.svg',
                height: 64.0,
                color: primaryColor,
              ),
              const SizedBox(
                height: 64.0,
              ),
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                          backgroundColor: Colors.red,
                        )
                      : const CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                              'https://i.stack.imgur.com/l60Hf.png'),
                          backgroundColor: Colors.red,
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        width: 24.0,
                        height: 24.0,
                        child: const Icon(
                          Icons.add_a_photo,
                          size: 14.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldLayout(
                textEditingController: _usernameController,
                textInputType: TextInputType.text,
                hintText: "Enter your username",
              ),
              const SizedBox(
                height: 24.0,
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
              TextFieldLayout(
                textEditingController: _bioController,
                textInputType: TextInputType.text,
                hintText: "Enter your bio",
              ),
              const SizedBox(
                height: 24.0,
              ),
              isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: signUpUser,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50), // NEW
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 18.0),
                      )),
              const SizedBox(
                height: 16.0,
              ),
              Flexible(
                flex: 2,
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: const Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                          (route) => false);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: const Text(
                        " Log in",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
