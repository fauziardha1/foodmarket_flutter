part of 'pages.dart';

class SuccessSignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: IllustrationPage(
          title: "Yeay! Completed",
          subTitle: "Now you are able to order some foods as a self-reward",
          illustrationPath: "assets/food_wishes.png",
          buttonTitle1: "Find Foods",
          buttonOnPress1: () {},
        ),
      ),
    );
  }
}
