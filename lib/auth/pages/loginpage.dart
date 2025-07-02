import 'package:flutter/material.dart';
import 'package:new_app/auth/services/local_storages.dart';
import 'package:new_app/provider/form_provider.dart';
import 'package:provider/provider.dart';

class Loginpage extends StatefulWidget {
  Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formProvider = context.read<FormProvider>();
    final _loginFormKey = GlobalKey<FormState>();
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Form(
              key: _loginFormKey,
              child: Column(
                spacing: 22,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assest/auth/auth_image_one.jpeg",
                    height: 230,
                    width: 230,
                  ),

                  //emaill......
                  TextFormField(
                    controller: emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: context.watch<FormProvider>().emailCorrection,
                    decoration: InputDecoration(
                      label: Text("Email:"),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  //password......
                  TextFormField(
                    controller: passwordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: context.watch<FormProvider>().passwordCorrection,
                    obscureText: true, //hides the text while typing
                    decoration: InputDecoration(
                      label: Text("Password:"),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  //Submit buttons......
                  ElevatedButton(
                    onPressed: () {
                      if (_loginFormKey.currentState?.validate() ?? false) {
                        if (formProvider.userModel != null) {
                          if (emailController.text ==
                                  formProvider.userModel!.email &&
                              passwordController.text ==
                                  formProvider.userModel!.password) {
                            LocalStorages.setUserLoggedIn();
                            Navigator.pushNamed(context, '/manNav');

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                behavior: SnackBarBehavior.fixed,
                                content: Text('Login Successful'),
                                backgroundColor: Colors.green,
                                duration: Duration(milliseconds: 500),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                behavior: SnackBarBehavior.floating,
                                content: Text(
                                  'Your email and password doesnot match',
                                ),
                                backgroundColor: Colors.red,
                                duration: Duration(milliseconds: 500),
                              ),
                            );
                          }
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text('Try correcting your mistakes!'),
                            backgroundColor: Colors.red,
                            duration: Duration(milliseconds: 500),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Go',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(fontSize: 13),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          visualDensity: VisualDensity.compact,
                          padding: EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 10,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, "/register");
                        },
                        child: Text(
                          'Register Here',
                          style: TextStyle(fontSize: 13),
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
    );
  }
}
