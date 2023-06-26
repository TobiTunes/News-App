import 'package:flutter/material.dart';
import 'package:news_app/constants/constants.dart';

AppBar appBarWidget(TabController tabController, IconData icon, bool isHome,
    BuildContext context) {
  return AppBar(
    backgroundColor: Constants().firstBlue,
    toolbarHeight: 80,
    leading: isHome
        ? IconButton(
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        : IconButton(
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'First',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        Text(
          'News',
          style: TextStyle(
            color: Constants().firstYellow,
          ),
        ),
        Image.asset(
          'assets/fbnlogo.png',
          width: 30,
          height: 30,
        ),
      ],
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
    ],
    bottom: isHome
        ? PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: Container(
              height: 30,
              color: Colors.white,
              child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Constants().firstGrey,
                  indicatorColor: Constants().firstGrey,
                  indicatorWeight: 1,
                  controller: tabController,
                  tabs: const <Widget>[
                    Tab(
                      text: 'Home',
                    ),
                    Tab(
                      text: 'Business',
                    ),
                    Tab(
                      text: 'Tech',
                    ),
                    Tab(
                      text: 'Sports',
                    ),
                  ]),
            ),
          )
        : PreferredSize(
            preferredSize: Size.zero,
            child: Container(),
          ),
  );
}
