import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stripe_app/screens/checkout.dart';
import 'package:stripe_app/screens/home.dart';
import 'package:stripe_app/screens/login.dart';
import 'package:stripe_app/screens/profile.dart';
import 'package:stripe_app/utils/application_state.dart';
import 'package:stripe_app/utils/custem_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (context) => ApplicationState(),
    builder: (context, _) => Consumer<ApplicationState>(
      builder: (context, ApplicationState, _) {
        Widget child;
        switch (ApplicationState.loginState) {
          case ApplicationLoginState.loggedOut:
            child = LoginScreen();
            break;
          case ApplicationLoginState.loggedIn:
            child = MyApp();
            break;
          default:
            child = LoginScreen();
        }
        return MaterialApp(
          theme: CustemTheme.getTheme(),
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("Shoppy"),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35)),
                boxShadow: CustemTheme.cardShadow),
            child: const TabBar(
                padding: EdgeInsets.symmetric(vertical: 10),
                indicatorColor: Colors.transparent,
                tabs: [
                  Tab(
                      icon: Icon(
                    Icons.home,
                  )),
                  Tab(
                      icon: Icon(
                    Icons.person,
                  )),
                  Tab(
                      icon: Icon(
                    Icons.shopping_cart,
                  ))
                ]),
          ),
          body: const TabBarView(children: [
            HomeScreen(),
            ProfileScreen(),
            CheckoutScreen(),
          ]),
        ));
  }
}
