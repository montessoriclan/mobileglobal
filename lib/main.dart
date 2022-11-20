import 'package:deernier/page/quiz/quiz.dart';
import 'package:deernier/service/network_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    
    return Builder(builder: (context) {
      return MultiProvider(
        providers: [
          StreamProvider(
            create: (context) => NetworkService().controller.stream,
            initialData: NetworkStatus.online,
          ),
        ],
        child: MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          home: Quiz(),
          // home: StreamBuilder<User?>(
          //     stream: FirebaseAuth.instance.authStateChanges(),
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return const Center(
          //           child: LinearProgressIndicator(),
          //         );
          //       } else if (snapshot.hasError) {
          //         return const Center(
          //           child: Text("something where wrong"),
          //         );
          //       } else if (snapshot.hasData) {
          //         return  Quiz();
          //       } else {
          //         return const LoginView();
          //       }
          //     }),
        ),
      );
    });
  }
}
