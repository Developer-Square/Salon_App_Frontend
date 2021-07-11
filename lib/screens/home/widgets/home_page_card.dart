import 'package:flutter/material.dart';
import 'package:salon/screens/home/widgets/custom_app_bar.dart';
import 'package:salon/configs/app_globals.dart';
import 'package:salon/widgets/image_display.dart';

class HomePageCard extends StatefulWidget {
  final String photoUrl;

  HomePageCard({@required this.photoUrl});

  @override
  _HomePageCardState createState() => _HomePageCardState();
}

class _HomePageCardState extends State<HomePageCard> {
  /// Builds out the card section in the homepage card.
  Widget _cardHeader() {
    return Container(
      margin: const EdgeInsets.only(top: 12.0),
      child: Row(
        children: <Widget>[
          ProfileIcon(
            photoUrl: 'assets/images/profile/profile-1.jpg',
            height: 35.0,
            width: 35.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Nancy Muthoni',
                  style: AppGlobals().buildTextStyle(16.0, true, Colors.black),
                ),
                const SizedBox(
                  height: 3.0,
                ),
                Text(
                  'Hair Dresser',
                  style: AppGlobals()
                      .buildTextStyle(13.0, false, Colors.grey[400]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _cardBody(double width) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        children: <Widget>[
          ImageDisplay(
            photoUrl: 'assets/images/profile/profile-5.jpg',
            height: 250.0,
            width: width,
            borderRadius: true,
          ),
          const SizedBox(
            height: 12.0,
          ),
          Container(
            margin: const EdgeInsets.only(left: 15.0, bottom: 12.0),
            child: Row(
              children: <Widget>[
                Text(
                  '250 likes |',
                  style: AppGlobals()
                      .buildTextStyle(16.0, false, Colors.grey[400]),
                ),
                Text(
                  ' 50 comments',
                  style: AppGlobals()
                      .buildTextStyle(16.0, false, Colors.grey[400]),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey[200],
            width: width,
            height: 2.0,
          )
        ],
      ),
    );
  }

  Widget build(BuildContext buildContext) {
    final Size mediaQueryWidth = MediaQuery.of(context).size;
    final Size mediaQueryHeight = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 37.0),
      width: mediaQueryWidth.width,
      height: 439.0,
      child: Column(
        children: <Widget>[
          _cardHeader(),
          _cardBody(mediaQueryWidth.width - 32.0)
        ],
      ),
    );
  }
}
