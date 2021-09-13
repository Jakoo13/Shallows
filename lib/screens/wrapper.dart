import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shallows/screens/lake_page/lake.dart';
import 'package:shallows/screens/authenticate/sign_in.dart';
import 'package:shallows/models/myUser.dart';
import 'package:shallows/services.dart/auth_service.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<MyUser?>(
        stream: authService.user,
        builder: (_, AsyncSnapshot<MyUser?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final MyUser? myUser = snapshot.data;
            return myUser == null ? SignIn() : Lake();
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
