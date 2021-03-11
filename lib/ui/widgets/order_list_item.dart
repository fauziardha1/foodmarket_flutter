part of 'widget.dart';

class OrderListItem extends StatelessWidget {
  final double listItemWidth;
  final Transaction transaction;

  const OrderListItem({Key key, this.listItemWidth, this.transaction})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          // image
          width: 60,
          height: 60,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(transaction.food.picturePath),
                fit: BoxFit.cover,
              )),
        ),
        SizedBox(
          width: listItemWidth - 182,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.food.name,
                style: blackFontStyle2,
              ),
              Text(
                "${transaction.quantity} Items • " +
                    NumberFormat.currency(
                            symbol: "Rp ", decimalDigits: 0, locale: "id-ID")
                        .format(
                      transaction.food.price * transaction.quantity,
                    ),
                style: greyFontStyle.copyWith(fontSize: 13),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              convertDate(
                dateTime: transaction.dateTime,
              ),
              style: greyFontStyle.copyWith(fontSize: 10),
            ),
            Text(
              transaction.status == TransactionStatus.on_delivery
                  ? "On Delivery"
                  : transaction.status == TransactionStatus.pending
                      ? "Pending"
                      : transaction.status == TransactionStatus.cancelled
                          ? "Cancelled"
                          : "Delivered",
              style: greyFontStyle.copyWith(
                fontSize: 10,
                color: transaction.status == TransactionStatus.on_delivery
                    ? "1ABC9C".toColor()
                    : transaction.status == TransactionStatus.pending
                        ? mainColor
                        : transaction.status == TransactionStatus.cancelled
                            ? "D9435E".toColor()
                            : Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

String convertDate({DateTime dateTime}) {
  String month = "";
  switch (dateTime.month) {
    case 1:
      month = "Jan";
      break;
    case 2:
      month = "Feb";
      break;
    case 3:
      month = "Mar";
      break;
    case 4:
      month = "Apr";
      break;
    case 5:
      month = "Mey";
      break;
    case 6:
      month = "Jun";
      break;
    case 7:
      month = "Jul";
      break;
    case 8:
      month = "Aug";
      break;
    case 9:
      month = "Sept";
      break;
    case 10:
      month = "Oct";
      break;
    case 11:
      month = "Nov";
      break;
    default:
      month = "Des";
  }

  return "${dateTime.day}-$month-${dateTime.year}";
}
