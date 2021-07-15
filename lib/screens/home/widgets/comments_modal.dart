import 'package:flutter/material.dart';
import 'package:salon/configs/app_globals.dart';
import 'package:salon/widgets/back_arrow.dart';
import 'package:salon/screens/home/widgets/profile_icon.dart';

class CommentsModal extends StatelessWidget {
  dynamic parentContext;
  final String profileUrl;
  final String commentContent;

  CommentsModal(
      {@required this.parentContext,
      @required this.profileUrl,
      @required this.commentContent});

  Widget build(BuildContext context) {
    final Size mediaQueryHeight = MediaQuery.of(context).size;
    final Size mediaQueryWidth = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppGlobals().primaryColor,
        centerTitle: true,
        leading: BackArrow(
          arrowColor: Colors.white,
        ),
        title: Text(
          'Comments',
          style: AppGlobals().buildTextStyle(16.0, true, Colors.white),
        ),
        elevation: 0.0,
      ),
      body: Container(
          margin: const EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
          child: Column(children: <Widget>[
            Row(
              children: <Widget>[
                ProfileIcon(
                  photoUrl: profileUrl,
                  width: 45.0,
                  height: 45.0,
                  location: 'comments',
                ),
                const SizedBox(
                  width: 12.0,
                ),
                Expanded(
                  child: Text(
                    commentContent,
                  ),
                )
              ],
            )
          ])),
    );
  }
}
