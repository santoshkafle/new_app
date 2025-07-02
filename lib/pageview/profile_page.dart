import 'package:flutter/material.dart';
import 'package:new_app/provider/form_provider.dart';
import 'package:new_app/view/logout_alertbox.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Widget _profileButtonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          child: Text(
            "Subscribe",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          child: Text(
            "Message",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _personLikeNDShareSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //first child... of like & share section...
        Row(
          children: [
            Icon(Icons.heart_broken_outlined),
            Text("60.4k", style: TextStyle(fontSize: 14)),
          ],
        ),
        SizedBox(height: 16, child: VerticalDivider(width: 18)),
        Row(
          children: [
            Icon(Icons.message_outlined),
            Text("20k", style: TextStyle(fontSize: 14)),
          ],
        ),
        SizedBox(height: 16, child: VerticalDivider(width: 18)),
        Row(
          children: [
            Icon(Icons.share_outlined),
            Text("12.4k", style: TextStyle(fontSize: 14)),
          ],
        ),
      ],
    );
  }

  Widget _accountSection(BuildContext ctx) {
    return Container(
      width: MediaQuery.sizeOf(ctx).width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 1,
            spreadRadius: 1.3,
            offset: Offset(0, 1.5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 7,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Account",
              style: TextStyle(fontSize: 17, color: Colors.grey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 5,
                  children: [
                    CircleAvatar(
                      radius: 18,
                      child: Icon(Icons.person_outline, size: 18),
                    ),
                    Text(
                      "Personal Information",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 5,
                  children: [
                    CircleAvatar(
                      radius: 18,
                      child: Icon(Icons.settings, size: 18),
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _moreSection(BuildContext ctx) {
    return Container(
      width: MediaQuery.sizeOf(ctx).width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 1,
            spreadRadius: 1.3,
            offset: Offset(0, 1.5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 7,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("More", style: TextStyle(fontSize: 17, color: Colors.grey)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 5,
                  children: [
                    CircleAvatar(
                      radius: 18,
                      child: Icon(Icons.switch_account, size: 18),
                    ),
                    Text(
                      "Switch Account",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right),
              ],
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: ctx,
                  builder: (context) => LogoutAlertbox(),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 5,
                    children: [
                      CircleAvatar(
                        radius: 18,
                        child: Icon(Icons.exit_to_app, size: 18),
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.keyboard_arrow_right),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _userData = context.watch<FormProvider>();
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 5,
            children: [
              SizedBox(height: 25),
              CircleAvatar(radius: 60, child: Icon(Icons.person, size: 80)),
              Text(
                _userData.userModel!.userName,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(_userData.userModel!.email, style: TextStyle(fontSize: 14)),
              //buttons here.....
              _profileButtonsRow(),
              //like & share section here....
              _personLikeNDShareSection(),
              SizedBox(height: 12),
              //section 2... 2  Buttons here....
              _accountSection(context),
              SizedBox(height: 5),

              //section 2... 2  Buttons here....
              _moreSection(context),
            ],
          ),
        ),
      ),
    );
  }
}
