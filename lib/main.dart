import 'package:flutter/material.dart';
import 'package:assignment_flutter/screen/menu.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:assignment_flutter/screen/login.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Provider(
            create: (_) {
                CookieRequest request = CookieRequest();
                return request;
            },
            child: MaterialApp(
                title: 'Flutter App',
                theme: ThemeData(
                    primarySwatch: Colors.teal,
                ),
                home: LoginPage(),
                routes: {
                    "/login": (BuildContext context) => const LoginPage(),
                },
            ),
        );
    }
}

