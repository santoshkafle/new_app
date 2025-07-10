import 'package:flutter/material.dart';
import 'package:new_app/auth/services/auth_api_services.dart';
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

    final authProvider = context.watch<FormProvider>();
    return Scaffold(
      body: Center(
        child:
            authProvider.isLoading
                ? CircularProgressIndicator()
                : SingleChildScrollView(
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator:
                                context.watch<FormProvider>().emailCorrection,
                            decoration: InputDecoration(
                              label: Text("Email:"),
                              border: OutlineInputBorder(),
                            ),
                          ),

                          //password......
                          TextFormField(
                            controller: passwordController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator:
                                context
                                    .watch<FormProvider>()
                                    .passwordCorrection,
                            obscureText: true, //hides the text while typing
                            decoration: InputDecoration(
                              label: Text("Password:"),
                              border: OutlineInputBorder(),
                            ),
                          ),

                          //Submit buttons......
                          ElevatedButton(
                            onPressed: () async {
                              if (_loginFormKey.currentState?.validate() ??
                                  false) {
                                context
                                    .read<FormProvider>()
                                    .logInUser(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    )
                                    .then((onValue) {
                                      if (onValue) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            behavior: SnackBarBehavior.fixed,
                                            content: Text('Login Scussfull'),
                                            backgroundColor: Colors.green,
                                            duration: Duration(
                                              milliseconds: 500,
                                            ),
                                          ),
                                        );

                                        Navigator.pushReplacementNamed(
                                          context,
                                          "/manNav",
                                        );
                                      } else {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            behavior: SnackBarBehavior.floating,
                                            content: Text(
                                              'Do not enter others email and passwords, always use own',
                                            ),
                                            backgroundColor: Colors.red,
                                            duration: Duration(
                                              milliseconds: 500,
                                            ),
                                          ),
                                        );
                                      }
                                    });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    content: Text('Try to Fill Empty Fields!'),
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
                                  Navigator.pushReplacementNamed(
                                    context,
                                    "/register",
                                  );
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
