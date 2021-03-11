part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Sign In",
      subtitle: "Find Your Best Ever Meal!",
      child: Column(
        children: [
          // email address label for email input
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              "Email address",
              style: blackFontStyle2,
            ),
          ),

          // email input or email text input
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black),
            ),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Type your email address"),
            ),
          ),

          // password label for password input
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Password",
              style: blackFontStyle2,
            ),
          ),

          // password input or password text input
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black),
            ),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Password"),
            ),
          ),

          // Button Sign In
          isLoading
              ? loadingIndicator
              : Container(
                  height: 45,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(
                      defaultMargin, defaultMargin, defaultMargin, 10),
                  child: RaisedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      await context.read<UserCubit>().signIn(
                          email: emailController.text,
                          password: passwordController.text);

                      UserState state = context.read<UserCubit>().state;

                      if (state is UserLoaded) {
                        print("Success Login userLoaded");
                        context.read<FoodCubit>().getFoods();
                        context.read<TransactionCubit>().getTransactions();

                        Get.to(() => MainPage());
                      } else {
                        Get.snackbar(
                          "",
                          "",
                          backgroundColor: "D9435E".toColor(),
                          icon: Icon(
                            MdiIcons.closeCircleOutline,
                            color: Colors.white,
                          ),
                          titleText: Text(
                            "Sign In Failed",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          messageText: Text(
                            (state as UserLoadFailed).message,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                            ),
                          ),
                        );

                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                    child: Text(
                      "Sign In",
                      style: blackFontStyle2,
                    ),
                    elevation: 0,
                    color: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),

          // Button Sign Up
          Container(
            height: 45,
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: RaisedButton(
              onPressed: () {
                setState(() {
                  isLoading = false;
                });
                Get.to(() => SignUpPage());
              },
              child: Text(
                "Create New Account",
                style: blackFontStyle2.copyWith(color: Colors.white),
              ),
              elevation: 0,
              color: greyColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
