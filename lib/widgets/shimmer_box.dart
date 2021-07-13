import 'package:flutter/material.dart';
import 'package:salon/configs/constants.dart';
import 'package:shimmer/shimmer.dart';

/// A convenient widget to create a [Shimmer] box where needed to present a
/// loading state.
class CardShimmerBox extends StatelessWidget {
  const CardShimmerBox({
    Key key,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  /// Builds out a small shimmer for small text areas.
  Widget _buildTextBox() {
    return Container(
      width: 70.0,
      height: 20.0,
      color: kWhite,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    return Container(
      width: width,
      height: height,
      color: kWhite,
      margin: const EdgeInsetsDirectional.only(bottom: kPaddingM),
      child: Shimmer.fromColors(
        baseColor: Theme.of(context).hoverColor,
        highlightColor: Theme.of(context).dividerColor,
        enabled: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 35.0,
                  width: 35.0,
                  margin: const EdgeInsets.only(top: 12.0, left: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: kWhite,
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                _buildTextBox()
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 12.0, left: 16.0),
              height: 250,
              width: mediaQuery.width - 32.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0), color: kWhite),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12.0, left: 15.0),
              child: Row(
                children: <Widget>[
                  _buildTextBox(),
                  SizedBox(
                    width: 10.0,
                  ),
                  _buildTextBox()
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12.0, left: 15.0),
              width: mediaQuery.width - 32.0,
              height: 80.0,
              color: kWhite,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 12.0),
              child: _buildTextBox(),
            )
          ],
        ),
      ),
    );
  }
}
