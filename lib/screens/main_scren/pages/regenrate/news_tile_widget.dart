import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:generali/model/news.dart';
import 'package:generali/utilities/custom_colors.dart';
import 'package:generali/utilities/custom_images.dart';
import 'package:generali/utilities/utilities.dart';

class NewsTileWidget extends StatelessWidget {
  const NewsTileWidget({required this.news, Key? key}) : super(key: key);
  final News news;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Utilities.padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Utilities.searchBorderRadius),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 4,
            blurRadius: 9,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _imageSide(context),
          _detailSide(context),
        ],
      ),
    );
  }

  Container _detailSide(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 2.8,
      width: MediaQuery.of(context).size.width / 1.6,
      padding: EdgeInsets.all(Utilities.padding / 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Utilities.searchBorderRadius),
          bottomRight: Radius.circular(Utilities.searchBorderRadius),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            news.title ?? 'No Title Found',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          CustomIconicTextButton(
            title: (news.subscription!) ? 'Solicitado' : 'No Solicitado',
            icon: Icons.notifications,
            onTap: () {},
          ),
          Row(
            children: <Widget>[
              CustomIconicTextButton(
                title: (news.isOnline!) ? 'Online' : 'Offline',
                icon: Icons.radio_button_on_outlined,
                onTap: () {},
              ),
              const Spacer(),
              RatingBar(
                itemSize: 20,
                wrapAlignment: WrapAlignment.end,
                initialRating: news.rating ?? 0,
                minRating: 1,
                maxRating: 5,
                allowHalfRating: true,
                onRatingUpdate: (double rating) {
                  // TODO: on chnage
                },
                ratingWidget: RatingWidget(
                  full: const Icon(Icons.star, color: Colors.amber),
                  half: const Icon(Icons.star_border_purple500,
                      color: Colors.amber),
                  empty: Icon(Icons.star_border, color: CustomColors.darkGrey),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container _imageSide(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 3,
      width: MediaQuery.of(context).size.width / 1.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Utilities.searchBorderRadius),
          topRight: Radius.circular(Utilities.searchBorderRadius),
        ),
        image: DecorationImage(
          image: AssetImage(CustomImages.icon),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class CustomIconicTextButton extends StatelessWidget {
  const CustomIconicTextButton({
    required this.title,
    required this.icon,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(Utilities.buttonBorderRadius),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(width: 2),
            Icon(icon),
            const SizedBox(width: 4),
            Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
