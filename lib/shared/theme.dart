part of 'shared.dart';

const double defaultMargin = 24.0;
final Color greyColor = "8d92a3".toColor();
final Color mainColor = "ffc700".toColor();

TextStyle greyFontStyle = GoogleFonts.poppins().copyWith(color: greyColor);
TextStyle blackFontStyle1 = GoogleFonts.poppins().copyWith(
  color: Colors.black,
  fontSize: 22,
  fontWeight: FontWeight.w500,
);
TextStyle blackFontStyle2 = GoogleFonts.poppins().copyWith(
  color: Colors.black,
  fontSize: 16,
  fontWeight: FontWeight.w500,
);
TextStyle blackFontStyle3 = GoogleFonts.poppins().copyWith(
  color: Colors.black,
);

Widget loadingIndicator = Container(
  margin: EdgeInsets.fromLTRB(defaultMargin, defaultMargin, defaultMargin, 10),
  child: SpinKitFadingCircle(
    size: 45,
    color: mainColor,
  ),
);
