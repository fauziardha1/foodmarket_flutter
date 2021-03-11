import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:foodmarket/cubit/cubit.dart';
import 'package:foodmarket/cubit/user_cubit.dart';
import 'package:foodmarket/ui/pages/pages.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 640),
      allowFontScaling: true,
      builder: () => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => UserCubit()),
          BlocProvider(create: (_) => FoodCubit()),
          BlocProvider(create: (_) => TransactionCubit()),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Food Market",
          // home: MainPage(),
          home: SignInPage(),
        ),
      ),
    );
    // return MultiBlocProvider(
    //   providers: [
    // BlocProvider(create: (_) => UserCubit()),
    // BlocProvider(create: (_) => FoodCubit()),
    // BlocProvider(create: (_) => TransactionCubit()),
    //   ],
    //   child: GetMaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: "Food Market",
    //     home: SignInPage(),
    //   ),
    // );
  }
}
