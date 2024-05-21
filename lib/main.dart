import 'package:flutter/material.dart';
import 'package:flutter_4a/Lc/lc.dart';
import 'package:flutter_4a/item_app_screen/form_app_screen.dart';
import 'package:flutter_4a/repository/item_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_4a/Bloc/item_app_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Routes/Routes.dart';

void main() async {
  BlocOverrides.runZoned(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initializeDependencies();
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    late double screenWidth;
    screenWidth = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      designSize:
      screenWidth > 600 ? const Size(1440, 900) : const Size(360, 640),
      builder: (BuildContext context, Widget? child) =>
          buildMaterialApp(context),
    );
  }

  Widget buildMaterialApp(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ItemBloc(lc()),),
      ],
      child: const MaterialApp(
        title: 'Form Assignment',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.onGenerateRoute,
        initialRoute: '/FormAppScreen',
      ),
    );
  }
}
