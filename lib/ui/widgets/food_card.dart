part of 'widget.dart';

class FoodCard extends StatelessWidget {
  final Food food;

  const FoodCard({Key key, this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 200,
          height: 210,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    blurRadius: 15, spreadRadius: 3, color: Colors.black12)
              ]),
          child: Column(
            children: [
              Container(
                height: 140,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(food.picturePath),
                    )),
              ),
              Container(
                width: 200,
                margin: EdgeInsets.fromLTRB(12, 12, 12, 6),
                child: Text(
                  food.name,
                  style: blackFontStyle2,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 12),
                child: RatingStar(
                  rate: food.rate,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
