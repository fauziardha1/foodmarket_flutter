part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int initialPageIndex;

  const MainPage({Key key, this.initialPageIndex = 0}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    selectedPage = widget.initialPageIndex;
    _pageController = PageController(initialPage: widget.initialPageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.white),
          SafeArea(child: Container(color: "fafafc".toColor())),
          SafeArea(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedPage = index;
                });
              },
              children: [
                Center(
                  child: FoodPage(),
                ),
                Center(
                  child: HistoryOrderPage(),
                ),
                Center(
                  child: ProfilePage(
                    user: mockUser,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomeBottomNavbar(
              selectedIndex: selectedPage,
              onTap: (index) {
                setState(() {
                  selectedPage = index;
                });

                _pageController.jumpToPage(selectedPage);
              },
            ),
          )
        ],
      ),
    );
  }
}
