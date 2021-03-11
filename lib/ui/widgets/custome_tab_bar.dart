part of 'widget.dart';

class CustomeTabBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;
  final List<String> titles;
  final MainAxisAlignment mainAxisAlignment;

  const CustomeTabBar(
      {Key key,
      this.selectedIndex = 0,
      this.onTap,
      @required this.titles,
      this.mainAxisAlignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      margin: EdgeInsets.only(top: defaultMargin, left: defaultMargin),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 38),
            height: 1,
            width: double.infinity,
            color: "fafafc".toColor(),
          ),
          Row(
              mainAxisAlignment:
                  mainAxisAlignment ?? MainAxisAlignment.spaceAround,
              children: titles
                  .map((e) => GestureDetector(
                        onTap: () {
                          if (onTap != null) {
                            onTap(titles.indexOf(e));
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              right: mainAxisAlignment != null
                                  ? defaultMargin
                                  : 0),
                          child: Column(
                            children: [
                              Text(
                                e,
                                style: (titles.indexOf(e) == selectedIndex)
                                    ? blackFontStyle3.copyWith(
                                        fontWeight: FontWeight.w500)
                                    : greyFontStyle,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 13),
                                width: 40,
                                height: 3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(1.5),
                                    color: (titles.indexOf(e) == selectedIndex
                                        ? "020202".toColor()
                                        : Colors.transparent)),
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList())
        ],
      ),
    );
  }
}
