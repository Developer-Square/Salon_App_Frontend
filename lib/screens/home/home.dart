import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salon/configs/app_globals.dart';
import 'package:salon/configs/constants.dart';
import 'package:salon/data/models/category_model.dart';
import 'package:salon/data/models/search_tab_model.dart';
import 'package:salon/main.dart';
import 'package:salon/screens/home/widgets/category_list_item.dart';
import 'package:salon/screens/search/search.dart';
import 'package:salon/screens/search/widgets/search_tabs.dart';
import 'package:salon/utils/bottom_bar_items.dart';
import 'package:salon/widgets/shimmer_box.dart';
import 'package:salon/screens/home/widgets/custom_app_bar.dart';
import 'package:salon/screens/home/widgets/home_page_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bool _isDataLoaded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Use this when fetching data from backend
  Widget _showHome() {
    return Container(
      height: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 130,
            child: _isDataLoaded
                ? ListView(
                    padding: const EdgeInsetsDirectional.only(start: kPaddingM),
                    scrollDirection: Axis.horizontal,
                    children: getIt
                        .get<AppGlobals>()
                        .categories
                        .map((CategoryModel category) {
                      return Container(
                        width: 160,
                        margin:
                            const EdgeInsets.only(bottom: 1), // for card shadow
                        padding:
                            const EdgeInsetsDirectional.only(end: kPaddingS),
                        child: CategoryListItem(
                          category: category,
                          onTap: () => _scrollToTabItem(category),
                        ),
                      );
                    }).toList(),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsetsDirectional.only(start: kPaddingM),
                    itemBuilder: (BuildContext context, int index) =>
                        const ShimmerBox(width: 160, height: 130),
                    itemCount:
                        List<int>.generate(3, (int index) => index).length,
                  ),
          ),
        ],
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
                  HomePageCard(
                    profileName: 'Nancy Muthoni',
                    profilePhotoUrl: 'assets/images/profile/profile-1.jpg',
                    profileTitle: 'Hair Dresser',
                    photoUrl: 'assets/images/profile/profile-5.jpg',
                    likes: 250,
                    comments: 50,
                    commentContent:
                        'Nancy, But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain.',
                    timePosted: 5,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
