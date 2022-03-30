import 'package:flutter/material.dart';
import 'package:quran_tabseer/utils/custom_colors.dart';

import 'package:quran_tabseer/utils/custom_textstyle.dart';
import 'package:quran_tabseer/views/surah.dart';

import '../widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;
  final tabs = [
    Center(
      child: Text('Parah'),
    ),
    Center(
      child: SurahScreen(),
    ),
    Center(
      child: Text('Bookmarks'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Quran and Tafseer',
          style: StylesText.HeadingStyle,
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: tabs[_currentIndex],
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                  child: Text(
                'Quran with Tafseer',
                style: StylesText.HeadingStyle,
              )),
            ),
            ListTile(
              title: const Text('Sajdah'),
              leading: Icon(Icons.handshake_sharp),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Notification'),
              leading: Icon(Icons.notifications_active),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Rate'),
              leading: Icon(Icons.star_rate),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Share'),
              leading: Icon(Icons.share),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Contact Us'),
              leading: Icon(Icons.contact_page),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: CustomColors.defaultcolor,
        selectedFontSize: 13,
        selectedItemColor: CustomColors.text_color,
        selectedLabelStyle: StylesText.Heading2Style,

        currentIndex:
            _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            label: 'Parah',
            icon: new Icon(Icons.menu),
          ),
          BottomNavigationBarItem(
            label: 'Surah',
            icon: new Icon(Icons.menu_book),
          ),
          BottomNavigationBarItem(
            label: 'Bookmark',
            icon: Icon(Icons.bookmark_add),
          )
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  // @override
  // State<StatefulWidget> createState() {
  //   // TODO: implement createState
  //   throw UnimplementedError();
  // }
}
