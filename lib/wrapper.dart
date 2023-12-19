import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider.dart';
import './home/home.dart';
import './authentication/auth.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isUserAuthenticated =
        Provider.of<IncubeProvider>(context).isUserAuthenticated;

    return isUserAuthenticated ? const Home() : const AuthScreen();
  }
}
