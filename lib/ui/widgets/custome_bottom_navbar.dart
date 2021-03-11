part of 'widget.dart';

class CustomeBottomNavbar extends StatefulWidget {
  int selectedIndex;
  Function(int index) onTap;

  CustomeBottomNavbar({this.selectedIndex, this.onTap});

  @override
  _CustomeBottomNavbarState createState() => _CustomeBottomNavbarState();
}

class _CustomeBottomNavbarState extends State<CustomeBottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: "fafafc".toColor(),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      padding: EdgeInsets.symmetric(vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              if (widget.onTap != null) {
                widget.onTap(0);
              }
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.selectedIndex == 0
                        ? "assets/ic_home.png"
                        : "assets/ic_home_normal.png")),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (widget.onTap != null) {
                widget.onTap(1);
              }
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage((widget.selectedIndex == 1)
                        ? "assets/ic_order.png"
                        : "assets/ic_order_normal.png")),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (widget.onTap != null) {
                widget.onTap(2);
              }
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage((widget.selectedIndex == 2)
                        ? "assets/ic_profile.png"
                        : "assets/ic_profile_normal.png")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
