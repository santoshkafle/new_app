import 'package:flutter/material.dart';
import 'package:new_app/provider/form_provider.dart';
import 'package:provider/provider.dart';

class Registerpage extends StatefulWidget {
  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  TextEditingController userController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formProvider = context.read<FormProvider>();
    final _regFormKey = GlobalKey<FormState>();
    final authProvider = context.watch<FormProvider>();
    return Scaffold(
      body:
          authProvider.isLoading
              ? Center(child: CircleAvatar())
              : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Form(
                  key: _regFormKey,
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: 20,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assest/auth/auth_image_two.jpeg",
                          height: 230,
                          width: 230,
                        ),
                        Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        //username......
                        TextFormField(
                          controller: userController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator:
                              context.watch<FormProvider>().userNameCorrection,
                          decoration: InputDecoration(
                            label: Text("My Namme is"),
                            border: OutlineInputBorder(),
                          ),
                        ),

                        //emaill......
                        TextFormField(
                          controller: emailController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator:
                              context.watch<FormProvider>().emailCorrection,
                          decoration: InputDecoration(
                            label: Text("You can mail at"),
                            border: OutlineInputBorder(),
                          ),
                        ),

                        //password......
                        TextFormField(
                          controller: passwordController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator:
                              context.watch<FormProvider>().passwordCorrection,
                          obscureText: true, //hides the text while typing
                          decoration: InputDecoration(
                            label: Text("Password"),
                            border: OutlineInputBorder(),
                          ),
                        ),

                        //phone......
                        TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator:
                              context.watch<FormProvider>().phNumberCorrection,
                          decoration: InputDecoration(
                            label: Text(
                              "Phone Number to Verify that You are a Human",
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),

                        //Submit buttons......
                        ElevatedButton(
                          onPressed: () async {
                            if (_regFormKey.currentState?.validate() ?? false) {
                              _registerAndNavigate();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  content: Text('Errors Form Field'),
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
                            'Submit',
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
                              'Already have an account?',
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
                                Navigator.pushNamed(context, "/login");
                              },
                              child: Text(
                                'Login Here',
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
    );
  }

  void _registerAndNavigate() {
    context
        .read<FormProvider>()
        .registerUserData(
          email: emailController.text,
          userName: userController.text,
          password: passwordController.text,
          phoneNumber: phoneController.text,
        )
        .then((onValue) {
          if (!context.mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              behavior: SnackBarBehavior.fixed,
              content: Text('Your account is created!'),
              backgroundColor: Colors.green,
              duration: Duration(milliseconds: 500),
            ),
          );
          Navigator.pushReplacementNamed(context, '/loadingScreen');
        })
        .catchError((onError) {
          if (!context.mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text('Failed to Create Account!'),
              backgroundColor: Colors.red,
              duration: Duration(milliseconds: 500),
            ),
          );
        });
  }
}
