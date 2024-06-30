import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/common/widgets/bottom_navigator.dart';
import 'package:news_app/core/pages/BookMark/cubits/cubit/book_mark_cubit.dart';
import 'package:news_app/core/pages/HomePage/cubit/homepage_cubit.dart';
import 'package:news_app/core/pages/splashscreen/splashscreen.dart';

class Routes {
  static Route? onGenerateRoure(RouteSettings settings) {
    switch (settings.name) {
      // case "/landingPage":
      //   return MaterialPageRoute(
      //       builder: (context) => BlocProvider(
      //             create: (context) => HomepageCubit(),
      //             child: HomePage(),
      //           ));

      case "/landingPage":
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider<HomepageCubit>(
                    create: (BuildContext context) => HomepageCubit(),
                  ),
                  BlocProvider<BookMarkCubit>(
                    create: (BuildContext context) => BookMarkCubit(),
                  ),
                ], child: const NavigatorPage()));

      case "/splashScreen":
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
    return null;
  }
}
