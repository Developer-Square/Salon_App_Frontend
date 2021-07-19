import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salon/configs/app_globals.dart';
import 'package:salon/configs/constants.dart';
import 'package:salon/data/models/category_model.dart';
import 'package:salon/data/models/search_tab_model.dart';
import 'package:salon/main.dart';
import 'package:salon/screens/search/search.dart';
import 'package:salon/screens/search/widgets/search_tabs.dart';
import 'package:salon/utils/bottom_bar_items.dart';
import 'package:salon/widgets/shimmer_box.dart';
import 'package:salon/screens/home/widgets/custom_app_bar.dart';
import 'package:salon/screens/home/widgets/home_page_card.dart';
import 'package:salon/data/models/home_page_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isDataLoaded;

  @override
  void initState() {
    if (cards.isEmpty) {
      _isDataLoaded = false;
    } else {
      _isDataLoaded = true;
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Use this when fetching data from backend
  Widget _showCards() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: _isDataLoaded
          ? ListView.builder(
              itemCount: cards.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext buildContext, int index) {
                return Column(
                  children: <Widget>[
                    HomePageCard(
                      profileName: cards[index].profileName,
                      profilePhotoUrl: cards[index].profilePhotoUrl,
                      profileTitle: cards[index].profileTitle,
                      photoUrl: cards[index].photoUrl,
                      likes: cards[index].likes,
                      comments: cards[index].comments,
                      commentContent: cards[index].commentContent,
                      timePosted: cards[index].timePosted,
                    ),
                    // Add some spacing to the last card in the list otherwise the bottom
                    // bar will block some part of the card.
                    if (index == cards.length - 1)
                      const SizedBox(
                        height: 180.0,
                      )
                    else
                      const SizedBox()
                  ],
                );
              })
          : ListView.builder(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsetsDirectional.only(top: kPaddingM),
              itemBuilder: (BuildContext context, int index) => CardShimmerBox(
                  width: MediaQuery.of(context).size.width, height: 510),
              itemCount: List<int>.generate(3, (int index) => index).length,
            ),
    );
  }

  Future<void> _scrollToTabItem(CategoryModel category) async {
    // Tap on the explore icon in the bottom bar.
    (getIt.get<AppGlobals>().globalKeyBottomBar.currentWidget
            as BottomNavigationBar)
        .onTap(getIt.get<BottomBarItems>().getBottomBarItem('explore'));

    final SearchScreenState searchScreenState = getIt
        .get<AppGlobals>()
        .globalKeySearchScreen
        .currentState as SearchScreenState;
    final List<SearchTabModel> catTabs = searchScreenState.categoryTabs;
    final int index =
        catTabs.indexWhere((SearchTabModel tab) => tab.id == category.id);

    if (index != -1) {
      // Scroll to the element.
      (getIt.get<AppGlobals>().globalKeySearchTabs.currentState
              as SearchTabsState)
          .itemScrollController
          .scrollTo(index: index, duration: const Duration(milliseconds: 100));

      // Wait for the scroll to finish.
      await Future<int>.delayed(const Duration(milliseconds: 200));

      // Tap on tab item.
      (searchScreenState.categoryTabs[index].globalKey.currentWidget as InkWell)
          .onTap();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      // Changes the top objects to either light or dark.
      // The top object include the time, text icons, charging icon displayed at the top.
      value: SystemUiOverlayStyle.light,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: AppGlobals().backgroundColor,
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: CustomAppBar(
                      activePage: 'home',
                    ),
                  ),
                  _showCards(),
                ],
              ),
            )),
      ),
    );
  }
}
