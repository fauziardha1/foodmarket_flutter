part of 'widget.dart';

class FoodListItem extends StatelessWidget {
  final Food food;
  final double listItemWidth;

  const FoodListItem({
    Key key,
    this.food,
    this.listItemWidth,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              // image
              width: 60,
              height: 60,
              margin: EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(food.picturePath),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              width: listItemWidth - 182,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food.name,
                    style: blackFontStyle2,
                  ),
                  Text(
                    NumberFormat.currency(
                            symbol: "Rp ", decimalDigits: 0, locale: "id-ID")
                        .format(food.price),
                    style: greyFontStyle.copyWith(fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
        RatingStar(
          rate: food.rate,
        ),
      ],
    );
  }
}
