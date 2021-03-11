part of 'pages.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var listItemWidth = MediaQuery.of(context).size.width - 4 * defaultMargin;
    return ListView(
      children: [
        // Header
        Container(
          width: double.infinity,
          height: 100,
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Food Market", style: blackFontStyle1),
                    Text("Let's get some foods",
                        style: greyFontStyle.copyWith(
                            fontWeight: FontWeight.w300)),
                  ],
                ),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(
                        (context.read<UserCubit>().state as UserLoaded)
                            .user
                            .picturePath,
                      ),
                      fit: BoxFit.cover,
                    )),
              )
            ],
          ),
        ),
        // FoodCard
        Container(
          height: 258,
          width: double.infinity,
          child: BlocBuilder<FoodCubit, FoodState>(
            builder: (context, state) => (state is FoodLoaded)
                ? ListView(
                    scrollDirection: Axis.horizontal,
                    children: state.foods
                        .map((e) => Padding(
                              padding:
                                  const EdgeInsets.only(left: defaultMargin),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => FoodDetailsPage(
                                        transaction: Transaction(
                                          food: e,
                                          user: (context.read<UserCubit>().state
                                                  as UserLoaded)
                                              .user,
                                        ),
                                        onBackButtonPress: () {
                                          Get.back();
                                        },
                                      ));
                                },
                                child: FoodCard(
                                  food: e,
                                ),
                              ),
                            ))
                        .toList(),
                  )
                : Center(
                    child: loadingIndicator,
                  ),
          ),
        ),

        // Food list with tabbar

        Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 12),
                child: CustomeTabBar(
                  titles: ["New Taste", "Popular", "Recommended"],
                  selectedIndex: selectedIndex,
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
              ),
              BlocBuilder<FoodCubit, FoodState>(builder: (_, state) {
                if (state is FoodLoaded) {
                  List<Food> foods = state.foods
                      .where(
                          (element) => element.types.contains(selectedIndex == 0
                              ? FoodTypes.new_food
                              : selectedIndex == 1
                                  ? FoodTypes.popular
                                  : FoodTypes.recommended))
                      .toList();

                  return Column(
                    children: foods
                        .map((e) => Padding(
                              padding: EdgeInsets.fromLTRB(
                                defaultMargin,
                                0,
                                defaultMargin,
                                6,
                              ),
                              child: FoodListItem(
                                  food: e, listItemWidth: listItemWidth),
                            ))
                        .toList(),
                  );
                } else {
                  return Center(
                    child: loadingIndicator,
                  );
                }
              }),
              SizedBox(
                height: 80,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
