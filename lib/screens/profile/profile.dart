import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:generali/screens/login/login.dart';
import 'package:generali/screens/widgets/custom_circular_profile_image.dart';
import 'package:generali/services/user_local_data.dart';
import 'package:generali/utilities/custom_colors.dart';
import 'package:generali/utilities/custom_images.dart';
import 'package:generali/utilities/utilities.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  static const String routeName = '/Profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.secondary,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(Utilities.padding),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(CustomImages.loginBG),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 30),
            _backButton(context),
            const SizedBox(height: 10),
            _personalDetails(),
            const SizedBox(height: 8),
            const Text(
              'Datos Acceso Gener@',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(Utilities.padding / 2),
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(
                  Utilities.searchBorderRadius,
                ),
              ),
              child: const Text(
                'Content Writing Uk information. 100% Privacy Protected! Find what you are looking for Here. 99% Match on Content Writing Uk. Only relevant search results, click here and find. Easy Acces To Information. Multiple sources combined. All the Answers. Discover us now!',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Datos Acceso Gener@mobile',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: EdgeInsets.all(Utilities.padding / 2),
              margin: EdgeInsets.symmetric(vertical: Utilities.padding / 3),
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(
                  Utilities.searchBorderRadius,
                ),
              ),
              child: Column(
                children: <Widget>[
                  _IconicButton(
                    title:
                        'https://www.google.com/search?q=paragraph&oq=paragr&aqs=chrome.1.69i57j0i271l3.3753j0j7&sourceid=chrome&ie=UTF-8',
                    onTap: () {},
                  ),
                  const Divider(thickness: 2),
                  _IconicButton(
                    title:
                        'https://www.google.com/search?q=paragraph&oq=paragr&aqs=chrome.1.69i57j0i271l3.3753j0j7&sourceid=chrome&ie=UTF-8',
                    onTap: () {},
                  ),
                  const Divider(thickness: 2),
                  _IconicButton(
                    title:
                        'https://www.google.com/search?q=paragraph&oq=paragr&aqs=chrome.1.69i57j0i271l3.3753j0j7&sourceid=chrome&ie=UTF-8',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () async {
                UserLocalData.signout();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  Login.routeName,
                  (Route<dynamic> route) => false,
                );
              },
              child: Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Utilities.searchBorderRadius),
                  color: Colors.white,
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Row _personalDetails() {
    return Row(
      children: <Widget>[
        const CustomCircularProfileImage(imageURL: '', radius: 36),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Text(
                'John Doe',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                'Score Opt',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
        FloatingActionButton(
          backgroundColor: Colors.white,
          mini: true,
          onPressed: () {},
          child: const Icon(Icons.photo_camera_front_sharp, size: 30),
        ),
        FloatingActionButton(
          backgroundColor: Colors.white,
          mini: true,
          onPressed: () {},
          child: const Icon(Icons.add, size: 30),
        ),
      ],
    );
  }

  GestureDetector _backButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Row(
        children: const <Widget>[
          Icon(Icons.arrow_back_ios_new, size: 20),
          Text(
            ' Back',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }
}

class _IconicButton extends StatelessWidget {
  const _IconicButton({required this.title, required this.onTap, Key? key})
      : super(key: key);
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            radius: 16,
            backgroundColor: Theme.of(context).primaryColor,
            child: const Icon(Icons.add),
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
        )
      ],
    );
  }
}
