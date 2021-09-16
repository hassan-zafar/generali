import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:generali/utilities/custom_colors.dart';
import 'package:generali/utilities/custom_images.dart';
import 'package:generali/utilities/utilities.dart';

class ChatBot extends StatelessWidget {
  const ChatBot({Key? key}) : super(key: key);
  static const String routeName = '/ChatBot';

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          _customAppBar(context, _size),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Utilities.padding),
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: Image.asset(CustomImages.leonardoChat),
                      ),
                      Container(
                        width: _size.width * 0.7,
                        padding: EdgeInsets.all(Utilities.padding / 2),
                        margin: EdgeInsets.only(
                          top: Utilities.padding / 2,
                          left: Utilities.padding / 3,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            Utilities.searchBorderRadius,
                          ),
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        child: const SelectableText(
                          'This is a long paragraph, which container at least 50 words, all of these word a just for checking the lenght os the container and display style of chatbot.',
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          _chatShortcuts(),
          _sendMessageField(),
        ],
      ),
    );
  }

  Container _chatShortcuts() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(Utilities.padding),
      margin: EdgeInsets.only(
        left: Utilities.padding,
        right: Utilities.padding,
        bottom: Utilities.padding,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        children: <Widget>[
          _IconicButton(
            title: 'Aprenda',
            onTap: () {},
          ),
          _IconicButton(
            title: 'Regenrate',
            onTap: () {},
          ),
          _IconicButton(
            title: 'Recuerda',
            onTap: () {},
          ),
          _IconicButton(
            title: 'Cikabora',
            onTap: () {},
          ),
          _IconicButton(
            title: 'Gestiona',
            onTap: () {},
          ),
          _IconicButton(
            title: 'Ver el video tutorial',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Container _sendMessageField() {
    return Container(
      height: 70,
      width: double.infinity,
      padding: EdgeInsets.all(Utilities.padding),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Escibe tu mensaje',
          border: InputBorder.none,
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.send),
          ),
        ),
      ),
    );
  }

  Container _customAppBar(BuildContext context, Size _size) {
    return Container(
      height: 130,
      width: double.infinity,
      color: CustomColors.black,
      child: Row(
        children: <Widget>[
          IconButton(
            padding: const EdgeInsets.only(top: 20),
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios),
          ),
          SizedBox(
            height: 100,
            width: _size.width * 0.8,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                children: <Widget>[
                  Image.asset(CustomImages.leonardoChat),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: _size.width * 0.6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          'Hola, soy Leonardo',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            'en que puedo ayudrte?',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _IconicButton extends StatelessWidget {
  const _IconicButton({
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(Utilities.padding / 2),
        margin: EdgeInsets.all(Utilities.padding / 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Utilities.buttonBorderRadius,
          ),
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.notifications, color: CustomColors.lightGrey),
            const SizedBox(width: 6),
            Text(
              title,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
