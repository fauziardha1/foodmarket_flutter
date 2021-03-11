part of 'pages.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController houseNumController = TextEditingController();
  String citiesValue = "Jakarta";

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      onBackButttonPressed: () {
        Get.back();
      },
      title: "Address",
      subtitle: "Make sure it valid!",
      child: Column(
        children: [
          // full name label
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Phone No.",
              style: blackFontStyle2,
            ),
          ),

          // full name text input
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black),
            ),
            child: TextField(
              controller: phoneController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Enter yout phone number here!"),
            ),
          ),

          // email address label for email input
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Address",
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
              controller: addressController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Enter your address here!"),
            ),
          ),

          // password label for password input
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "House Number",
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
              controller: houseNumController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Password"),
            ),
          ),

          // password label for password input
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "City",
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
              child: DropdownButton(
                underline: SizedBox(),
                items: [
                  DropdownMenuItem(
                    child: Text("Jakarta"),
                    value: "Jakarta",
                  ),
                  DropdownMenuItem(
                    child: Text("Bandung"),
                    value: "Bandung",
                  ),
                  DropdownMenuItem(
                    child: Text("Semarang"),
                    value: "Semarang",
                  ),
                ],
                onChanged: (item) {
                  setState(() {
                    citiesValue = item;
                  });
                },
                value: citiesValue,
                isExpanded: true,
              )),

          // Button Continue
          Container(
            height: 45,
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(
                defaultMargin, defaultMargin, defaultMargin, 10),
            child: RaisedButton(
              onPressed: () {},
              child: Text(
                "Continue",
                style: blackFontStyle2,
              ),
              elevation: 0,
              color: mainColor,
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
