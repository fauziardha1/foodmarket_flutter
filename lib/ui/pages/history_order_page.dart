part of 'pages.dart';

class HistoryOrderPage extends StatefulWidget {
  @override
  _HistoryOrderPageState createState() => _HistoryOrderPageState();
}

class _HistoryOrderPageState extends State<HistoryOrderPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (contex, state) {
        if ((state as TransactionLoaded).transactions.length == 0) {
          return IllustrationPage(
            title: "Ouch! Hungry",
            subTitle: """Seems like you have not ordered any food yet  """,
            illustrationPath: "assets/love_burger.png",
            buttonTitle1: "Find Foods",
            buttonOnPress1: () {},
          );
        } else {
          return GeneralPage(
            title: "Your Orders",
            subtitle: "You deserve better meal",
            backColor: "fafafc".toColor(),
            child: Column(
              children: [
                CustomeTabBar(
                  mainAxisAlignment: MainAxisAlignment.start,
                  titles: ["In Progress", "Past Order"],
                  selectedIndex: selectedIndex,
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),

                // list order
                Builder(
                  builder: (_) {
                    if (state is TransactionLoaded) {
                      List<Transaction> transaction = selectedIndex == 0
                          ? (state)
                              .transactions
                              .where((element) =>
                                  element.status ==
                                      TransactionStatus.on_delivery ||
                                  element.status == TransactionStatus.pending)
                              .toList()
                          : (state)
                              .transactions
                              .where((element) =>
                                  element.status ==
                                      TransactionStatus.delivered ||
                                  element.status == TransactionStatus.cancelled)
                              .toList();

                      return Container(
                        child: Column(
                          children: transaction
                              .map((e) => Container(
                                    margin: EdgeInsets.symmetric(
                                      vertical: defaultMargin / 2,
                                      horizontal: defaultMargin,
                                    ),
                                    child: OrderListItem(
                                      transaction: e,
                                      listItemWidth:
                                          MediaQuery.of(context).size.width -
                                              2 * defaultMargin,
                                    ),
                                  ))
                              .toList(),
                        ),
                      );
                    } else {
                      return Center(child: loadingIndicator);
                    }
                  },
                ),

                SizedBox(
                  height: 100,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
