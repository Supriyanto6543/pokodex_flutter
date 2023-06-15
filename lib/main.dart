import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/features/presentation/detail/bloc/detail_bloc.dart';
import 'package:pokemon/features/presentation/detail/pages/detail_page.dart';
import 'package:pokemon/features/presentation/home/bloc/home_bloc.dart';
import 'package:pokemon/injection.dart' as di;

import 'common/routes.dart';
import 'features/presentation/home/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => di.locator<HomeBloc>()),
    BlocProvider(create: (_) => di.locator<DetailBloc>())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: HomePage(),
            initialRoute: '/',
            onGenerateRoute: (setting) {
              switch (setting.name) {
                case Routes.homePage:
                  return pageRoute(HomePage());
                case Routes.detailView:
                  final data = setting.arguments as Map;
                  return pageRoute(DetailPage(
                    id: data['id'],
                    color: data['color'],
                    images: data['image'],
                  ));
                default:
                  return MaterialPageRoute(
                      builder: (context) => Container(
                            color: Colors.white,
                            child: const Text('Page not found'),
                          ));
              }
            });
      },
    );
  }

  pageRoute(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
