import 'package:atro/provider/bottom_navigation_bar_provider.dart';
import 'package:atro/provider/drawer_provider.dart';
import 'package:atro/provider/search_provider.dart';
import 'package:atro/provider/sign_in_provider.dart';
import 'package:atro/provider/statistics_provider.dart';
import 'package:atro/provider/transactions_list_provider.dart';
import 'package:atro/ui/account_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignInProvider()),
        ChangeNotifierProvider(create: (context) => TransactionProviderMy()),
        ChangeNotifierProvider(create: (context) => BottomNavigationBarProvider()),
        ChangeNotifierProvider(create: (context) =>DrawerProviderMy()),
        ChangeNotifierProvider(create: (context) =>SearchProviderMy()),
        ChangeNotifierProvider(create: (context) =>StatisticsProviderMy()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AccountLoginPage(),
    );
  }
}
////FLUTTER MAP 
//https://www.instaflutter.com/flutter-tutorials/flutter-maps/

//// FLUTTER DIAGRAM 
//https://pub.dev/packages/syncfusion_flutter_charts

