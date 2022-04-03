import 'package:flutter/material.dart';
import 'package:marathon/controller/app_provider.dart';
import 'package:marathon/controller/cach_helper.dart';
import 'package:marathon/presentation/resources/routes_manager.dart';
import 'package:marathon/presentation/resources/theme_manager.dart';
import 'package:provider/provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

 //AppConstants.token=CacheHelper.get(key: "token");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppProvider>(
      create: (context) => AppProvider()..getBackendUsers()..getMathematicsUsers()..getAlgorithmModelUsers(),
      child: Consumer<AppProvider>(
        builder: (context, value, child) {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: Routes.splashRoute,
            theme: getApplicationTheme(),
           // home: Home(),
          );
        },

      ),
    );
  }
}


