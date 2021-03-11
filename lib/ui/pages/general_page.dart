part of 'pages.dart';

class GeneralPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onBackButttonPressed;
  final Widget child;
  final Color backColor;

  const GeneralPage(
      {Key key,
      this.title = "Title",
      this.subtitle = "Subtitle",
      this.onBackButttonPressed,
      this.backColor,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SafeArea(
              child: Container(
            color: backColor ?? Colors.white,
          )),
          SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: 100,
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Row(
                        children: [
                          onBackButttonPressed != null
                              ? GestureDetector(
                                  onTap: this.onBackButttonPressed,
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    margin: EdgeInsets.only(right: 26),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      image:
                                          AssetImage("assets/back_arrow.png"),
                                    )),
                                  ),
                                )
                              : SizedBox(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // title text
                              Text(
                                this.title,
                                style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              // subtitle text
                              Text(
                                this.subtitle,
                                style: GoogleFonts.poppins(
                                    color: greyColor,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                    // line pemisah
                    Container(
                      width: double.infinity,
                      height: defaultMargin,
                      color: "fafafc".toColor(),
                    ),

                    // widget's child
                    child ?? SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
