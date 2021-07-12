import 'package:flutter/material.dart';
import 'package:salon/screens/home/widgets/custom_app_bar.dart';
import 'package:salon/configs/app_globals.dart';
import 'package:salon/widgets/image_display.dart';

class HomePageCard extends StatefulWidget {
  final String profilePhotoUrl;
  final String profileName;
  final String profileTitle;
  final String photoUrl;
  final int likes;
  final int comments;
  final String commentContent;
  final int timePosted;

  HomePageCard(
      {@required this.photoUrl,
      @required this.profilePhotoUrl,
      @required this.profileName,
      @required this.profileTitle,
      @required this.likes,
      @required this.comments,
      @required this.commentContent,
      @required this.timePosted});

  @override
  _HomePageCardState createState() => _HomePageCardState();
}

class _HomePageCardState extends State<HomePageCard> {
  bool isHeartClicked;

  @override
  void initState() {
    super.initState();
    isHeartClicked = false;
  }

  void _handleHeartClicked() {
    setState(() {
      isHeartClicked = !isHeartClicked;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Builds out the card section in the homepage card.
  Widget _cardHeader() {
    return Container(
      margin: const EdgeInsets.only(top: 12.0),
      child: Row(
        children: <Widget>[
          ProfileIcon(
            photoUrl: widget.profilePhotoUrl,
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
                  widget.profileName,
                  style: AppGlobals().buildTextStyle(16.0, true, Colors.black),
                ),
                const SizedBox(
                  height: 3.0,
                ),
                Text(
                  widget.profileTitle,
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

  /// Builds out the card body with the main picture, likes and comments.
  Widget _cardBody(double width) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        children: <Widget>[
          ImageDisplay(
            photoUrl: widget.photoUrl,
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
                  '${widget.likes} likes |',
                  style: AppGlobals()
                      .buildTextStyle(16.0, false, Colors.grey[400]),
                ),
                Text(
                  ' ${widget.comments} comments',
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

  /// Builds out the like and comment section.
  Widget _buildlikeCommentSection(
      _handleHeartClicked, bool isHeartClicked, bool isLikeSection) {
    return Row(
      children: <Widget>[
        // TODO: Change icons to svg so that, the color can be changed
        // to grey.
        InkWell(
            onTap: () {
              _handleHeartClicked();
            },
            child: isLikeSection
                ? isHeartClicked
                    ? ImageDisplay(
                        photoUrl: 'assets/images/icons/heart-filled.png',
                        height: 25.0,
                        width: 25.0,
                        borderRadius: false,
                      )
                    : ImageDisplay(
                        photoUrl: 'assets/images/icons/heart.png',
                        height: 28.0,
                        width: 28.0,
                        borderRadius: false,
                      )
                : const Icon(
                    Icons.chat_bubble_outline,
                    size: 28.0,
                  )),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text(
            isLikeSection ? 'Like' : 'Comment',
            style: AppGlobals().buildTextStyle(15.0, false, Colors.grey),
          ),
        )
      ],
    );
  }

  Widget _buildCardFooter() {
    return Container(
      margin: const EdgeInsets.only(top: 12.0, left: 15.0, right: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              _buildlikeCommentSection(
                  _handleHeartClicked, isHeartClicked, true),
              const SizedBox(
                width: 28.0,
              ),
              _buildlikeCommentSection(
                  _handleHeartClicked, isHeartClicked, false)
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14.0, bottom: 12.0),
            child: Text(
              widget.commentContent.length > 100
                  ? widget.commentContent.substring(0, 100) + '...'
                  : widget.commentContent,
              style: AppGlobals().buildTextStyle(15.0, false, Colors.black),
            ),
          ),
          Text(
            '${widget.timePosted} min ago',
            style: AppGlobals().buildTextStyle(14.0, false, Colors.grey[400]),
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
      margin: const EdgeInsets.only(top: 28.0),
      width: mediaQueryWidth.width,
      height: 510.0,
      child: Column(
        children: <Widget>[
          _cardHeader(),
          _cardBody(mediaQueryWidth.width - 32.0),
          _buildCardFooter()
        ],
      ),
    );
  }
}
