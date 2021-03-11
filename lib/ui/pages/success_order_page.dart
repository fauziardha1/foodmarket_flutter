part of 'pages.dart';

class SuccessOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: IllustrationPage(
          title: "You’ve Made Order",
          subTitle: "Just stay at home while we are preparing your best foods",
          illustrationPath: "assets/bike.png",
          buttonTitle1: "Order Other Foods",
          buttonOnPress1: () {
            Get.offAll(() => MainPage());
          },
          buttonTitle2: "View My Order",
          buttonOnPress2: () {
            Get.offAll(() => MainPage(initialPageIndex: 1));
          },
        ),
      ),
    );
  }
}
