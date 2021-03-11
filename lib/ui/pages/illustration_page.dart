part of 'pages.dart';

class IllustrationPage extends StatelessWidget {
  final String title;
  final String subTitle;
  final String illustrationPath;
  final String buttonTitle1;
  final String buttonTitle2;
  final Function buttonOnPress1;
  final Function buttonOnPress2;

  const IllustrationPage(
      {Key key,
      @required this.title,
      @required this.subTitle,
      @required this.illustrationPath,
      @required this.buttonTitle1,
      this.buttonTitle2,
      @required this.buttonOnPress1,
      this.buttonOnPress2})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // illustration
          Container(
            margin: EdgeInsets.symmetric(vertical: defaultMargin),
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(illustrationPath),
            )),
          ),

          // title
          Text(title, style: blackFontStyle1),

          // subtitle
          Container(
            // margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            width: 200,
            child: Text(
              subTitle,
              style: greyFontStyle,
              textAlign: TextAlign.center,
            ),
          ),

          // button1
          Container(
            margin: EdgeInsets.only(
              top: 30,
              bottom: 12,
              left: defaultMargin,
              right: defaultMargin,
            ),
            width: 200,
            child: RaisedButton(
              color: mainColor,
              elevation: 0,
              onPressed: buttonOnPress1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  buttonTitle1,
                  style: blackFontStyle2.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),

          // button2
          buttonTitle2 == null && buttonOnPress2 == null
              ? SizedBox()
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                  width: 200,
                  child: RaisedButton(
                    color: Colors.grey,
                    elevation: 0,
                    onPressed: buttonOnPress2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        buttonTitle2 ?? "Button Title",
                        style: blackFontStyle2.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
