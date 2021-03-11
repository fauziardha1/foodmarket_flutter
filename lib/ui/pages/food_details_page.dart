part of 'pages.dart';

class FoodDetailsPage extends StatefulWidget {
  final Transaction transaction;
  final Function onBackButtonPress;

  const FoodDetailsPage({Key key, this.transaction, this.onBackButtonPress})
      : super(key: key);

  @override
  _FoodDetailsPageState createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int selectedQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: mainColor,
          ),

          // bg
          SafeArea(
            child: Container(
              color: Colors.white,
            ),
          ),

          // food image
          SafeArea(
            child: Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.transaction.food.picturePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // content
          SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    // onback Button
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          if (widget.onBackButtonPress != null) {
                            widget.onBackButtonPress();
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            top: defaultMargin,
                            left: defaultMargin,
                          ),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black12,
                            image: DecorationImage(
                              image: AssetImage("assets/back_arrow_white.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // desctiption
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 180),
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 26),
                      decoration: BoxDecoration(
                        color: "fafafc".toColor(),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // name , rating and quantity
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // name and rating
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.transaction.food.name,
                                    style: blackFontStyle2,
                                  ),
                                  RatingStar(
                                      rate: widget.transaction.food.rate),
                                ],
                              ),

                              // quantity
                              Row(
                                children: [
                                  // btn min
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedQuantity =
                                            max(selectedQuantity - 1, 1);
                                      });
                                    },
                                    child: Container(
                                      width: 26,
                                      height: 26,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                          image:
                                              AssetImage("assets/btn_min.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),

                                  // text of quantity
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      selectedQuantity.toString(),
                                      style: blackFontStyle2,
                                    ),
                                  ),

                                  // btn add
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedQuantity =
                                            min(selectedQuantity + 1, 999);
                                      });
                                    },
                                    child: Container(
                                      width: 26,
                                      height: 26,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                          image:
                                              AssetImage("assets/btn_add.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // description text  and ingredients
                          Container(
                            margin: EdgeInsets.only(top: 12, bottom: 16),
                            child: Text(
                              widget.transaction.food.description,
                              style: greyFontStyle,
                            ),
                          ),
                          Text(
                            "Ingredients:",
                            style: greyFontStyle.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 4),
                            child: Text(
                              widget.transaction.food.ingredients,
                              style: greyFontStyle,
                            ),
                          ),

                          // price and checkout button
                          Container(
                            margin: EdgeInsets.only(top: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Total Price:", style: greyFontStyle),
                                    Text(
                                      NumberFormat.currency(
                                              symbol: "Rp ",
                                              decimalDigits: 0,
                                              locale: "id-ID")
                                          .format(
                                              widget.transaction.food.price *
                                                  selectedQuantity),
                                      style: blackFontStyle2.copyWith(
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                                RaisedButton(
                                  color: mainColor,
                                  elevation: 0,
                                  onPressed: () {
                                    Get.to(
                                      () => PaymentPage(
                                        onBackButtonPressed: () {
                                          Get.back();
                                        },
                                        transaction:
                                            widget.transaction.copyWith(
                                          quantity: selectedQuantity,
                                          total: widget.transaction.food.price *
                                              selectedQuantity,
                                        ),
                                        quantity: selectedQuantity,
                                        user: (context.read<UserCubit>().state
                                                as UserLoaded)
                                            .user,
                                      ),
                                    );
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 44),
                                    child: Text(
                                      "Order Now",
                                      style: blackFontStyle2.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
