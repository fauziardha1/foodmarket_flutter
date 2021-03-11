part of 'widget.dart';

class RatingStar extends StatelessWidget {
  final double rate;

  const RatingStar({Key key, this.rate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int star = rate.round();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      children: List<Widget>.generate(
            5,
            (index) => Icon(
              (index < star) ? MdiIcons.star : MdiIcons.starOutline,
              color: mainColor,
              size: 16,
            ),
          ) +
          [
            SizedBox(
              width: 4,
            ),
            Text(rate.toString(),
                style: greyFontStyle.copyWith(
                  fontSize: 12,
                )),
          ],
    );
  }
}
