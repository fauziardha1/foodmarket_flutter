part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  final User user;

  const ProfilePage({Key key, this.user}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // profile picture
            Container(
              width: 110,
              height: 110,
              margin: EdgeInsets.only(top: defaultMargin * 2),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/photo_border.png"),
                ),
              ),
              child: Container(
                // margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                        (context.read<UserCubit>().state as UserLoaded)
                            .user
                            .picturePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // full name
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text(
                (context.read<UserCubit>().state as UserLoaded).user.name,
                style: blackFontStyle1.copyWith(fontSize: 18),
              ),
            ),

            // email
            Container(
              child: Text(
                (context.read<UserCubit>().state as UserLoaded).user.email,
                style: greyFontStyle,
              ),
            ),

            // section tab
            Container(
              margin: EdgeInsets.all(24),
              child: Column(
                children: [
                  // tabbar
                  CustomeTabBar(
                    titles: ["Account", "FoodMarket"],
                    mainAxisAlignment: MainAxisAlignment.start,
                    selectedIndex: selectedIndex,
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),

                  // section conten
                  selectedIndex == 0
                      ? Container(
                          margin: EdgeInsets.only(
                            left: defaultMargin,
                            top: 17,
                            right: defaultMargin,
                          ),
                          child: Column(
                            children: [
                              // edit Profile item
                              ProfileItem(
                                title: "Edit Profile",
                              ),

                              // home address item
                              ProfileItem(
                                title: "Home Address",
                              ),

                              // Security item
                              ProfileItem(
                                title: "Security",
                              ),

                              // Payments item
                              ProfileItem(
                                title: "Payments",
                              ),
                            ],
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.only(
                            left: defaultMargin,
                            top: 17,
                            right: defaultMargin,
                          ),
                          child: Column(
                            children: [
                              // Rate App item
                              ProfileItem(
                                title: "Rate App",
                              ),

                              // Help Center item
                              ProfileItem(
                                title: "Help Center",
                              ),

                              // Privacy & Policy item
                              ProfileItem(
                                title: "Privacy & Policy",
                              ),

                              // Terms & Conditions item
                              ProfileItem(
                                title: "Terms & Conditions",
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String title;
  const ProfileItem({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: defaultMargin / 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: blackFontStyle2,
          ),
          Container(
            width: defaultMargin,
            height: defaultMargin,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage("assets/right_arrow.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
