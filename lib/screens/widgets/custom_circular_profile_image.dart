import 'package:flutter/material.dart';

class CustomCircularProfileImage extends StatelessWidget {
  const CustomCircularProfileImage({
    required this.imageURL,
    this.radius = 20.0,
    Key? key,
  }) : super(key: key);
  final String imageURL;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return (imageURL != '' && imageURL.isNotEmpty)
        ? CircleAvatar(
            radius: radius,
            backgroundImage: NetworkImage(imageURL),
          )
        : CircleAvatar(
            radius: radius,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: const Icon(Icons.person),
          );
  }
}
