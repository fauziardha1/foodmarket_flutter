part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  final Transaction transaction;
  final User user;
  final int quantity;
  final Function onBackButtonPressed;

  const PaymentPage(
      {Key key,
      this.transaction,
      this.user,
      this.quantity,
      this.onBackButtonPressed})
      : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    int foodPrice = widget.transaction.food.price * widget.quantity;
    int driverCost = 50000;
    double tax = 0.1 * foodPrice;

    return GeneralPage(
      title: "Payment",
      subtitle: "You deserve better meal",
      onBackButttonPressed: widget.onBackButtonPressed,
      backColor: "fafafc".toColor(),
      child: Column(
        children: [
          // bagian atas
          Container(
              margin:
                  EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // section title
                  Text("Item Ordered", style: blackFontStyle3),

                  // gambar nama dan harga (clip)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // clip image
                          Container(
                            margin: EdgeInsets.only(top: 12),
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      widget.transaction.food.picturePath),
                                  fit: BoxFit.cover,
                                )),
                          ),

                          // name and price
                          Container(
                            margin: EdgeInsets.only(left: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.transaction.food.name,
                                    style: blackFontStyle2),
                                Text(
                                  NumberFormat.currency(
                                    decimalDigits: 0,
                                    locale: "id-ID",
                                    symbol: "Rp ",
                                  ).format(widget.transaction.food.price *
                                      widget.quantity),
                                  style: greyFontStyle.copyWith(fontSize: 13),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),

                      // number of item
                      Text("${widget.quantity} Items",
                          style: greyFontStyle.copyWith(fontSize: 13)),
                    ],
                  ),

                  // Details Transaction section
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              child: Text(
                                "Details Transaction",
                                style: blackFontStyle2.copyWith(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.transaction.food.name,
                              style: greyFontStyle,
                            ),
                            Text(
                              NumberFormat.currency(
                                locale: "id-ID",
                                symbol: "Rp ",
                                decimalDigits: 0,
                              ).format(widget.transaction.food.price *
                                  widget.quantity),
                              style: blackFontStyle3,
                            )
                          ],
                        ),

                        // driver cost
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Driver",
                              style: greyFontStyle,
                            ),
                            Text(
                              NumberFormat.currency(
                                locale: "id-ID",
                                symbol: "Rp ",
                                decimalDigits: 0,
                              ).format(50000),
                              style: blackFontStyle3,
                            )
                          ],
                        ),

                        // tax
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tax 10%",
                              style: greyFontStyle,
                            ),
                            Text(
                              NumberFormat.currency(
                                locale: "id-ID",
                                symbol: "Rp ",
                                decimalDigits: 0,
                              ).format(tax),
                              style: blackFontStyle3,
                            )
                          ],
                        ),

                        // total
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: greyFontStyle,
                            ),
                            Text(
                              NumberFormat.currency(
                                locale: "id-ID",
                                symbol: "Rp ",
                                decimalDigits: 0,
                              ).format(foodPrice + driverCost + tax),
                              style: blackFontStyle3.copyWith(
                                color: "1ABC9C".toColor(),
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),

          // bagian bawah

          Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Details Transaction section
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 8),
                            child: Text(
                              "Delivered to",
                              style: blackFontStyle2.copyWith(fontSize: 14),
                            ),
                          ),
                        ],
                      ),

                      // user name
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Name",
                            style: greyFontStyle,
                          ),
                          Text(
                            widget.user.name,
                            style: blackFontStyle3,
                          )
                        ],
                      ),

                      // phoneNumber
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Phone",
                            style: greyFontStyle,
                          ),
                          Text(
                            widget.user.phoneNumber,
                            style: blackFontStyle3,
                          )
                        ],
                      ),

                      // address
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Address",
                            style: greyFontStyle,
                          ),
                          Text(
                            widget.user.address,
                            style: blackFontStyle3,
                          )
                        ],
                      ),

                      // house number
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "House no.",
                            style: greyFontStyle,
                          ),
                          Text(
                            widget.user.houseNumber,
                            style: blackFontStyle3,
                          )
                        ],
                      ),

                      // city
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "City",
                            style: greyFontStyle,
                          ),
                          Text(
                            widget.user.city,
                            style: blackFontStyle3,
                          )
                        ],
                      ),

                      // button checkout
                      isLoading
                          ? loadingIndicator
                          : Container(
                              margin:
                                  EdgeInsets.symmetric(vertical: defaultMargin),
                              width: double.infinity,
                              child: RaisedButton(
                                color: mainColor,
                                elevation: 0,
                                onPressed: () async {
                                  setState(() {
                                    isLoading = true;
                                  });

                                  // sumbit ke backend
                                  bool result = await context
                                      .read<TransactionCubit>()
                                      .submitTransaction(
                                          transaction:
                                              widget.transaction.copyWith(
                                        total: widget.transaction.total +
                                            driverCost +
                                            tax.toInt(),
                                        dateTime: DateTime.now(),
                                      ));

                                  if (result) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    Get.to(() => SuccessOrderPage());
                                  } else {
                                    setState(() {
                                      isLoading = false;
                                    });

                                    Get.snackbar(
                                      "",
                                      "",
                                      backgroundColor: "d9435E".toColor(),
                                      colorText: Colors.white,
                                      icon: Icon(MdiIcons.closeCircleOutline,
                                          color: Colors.white),
                                      titleText: Text(
                                        "Payment Failed",
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      messageText: Text(
                                          "Please wait a moment and then try again",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white)),
                                    );
                                  }
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  child: Text(
                                    "Checkout Now",
                                    style: blackFontStyle2.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
