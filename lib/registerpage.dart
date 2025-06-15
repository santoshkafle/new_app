import 'package:flutter/material.dart';
import 'package:new_app/homepage.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Register Page"))),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22),
        child: Form(
          key: _formkey,
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                child: ClipOval(child: Image.asset("asset/profile.jpg")),
                radius: 65,
              ),
              Text(
                "Creat Account",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),

              TextFormField(
                controller: emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == "" || value == null) {
                    return "Email can not be empty"; //passing errors here.
                  } else {
                    return null; //this means no errors.
                  }
                },
                decoration: InputDecoration(
                  hintText: "Email:",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              TextFormField(
                controller: passwordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == "" || value == null) {
                    return "Password cannot be empty";
                  } else if (value.length < 7) {
                    return "Password cannot be too short or too long";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: "Password:",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              SizedBox(
                width: 180,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (emailController.text == "santoshkafle" &&
                        passwordController.text == "santosh") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Homepage()),
                      );
                    }

                    if (_formkey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Submitted."),
                          behavior: SnackBarBehavior.fixed,
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Submitted Faill"),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
                  child: Text("Register"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
