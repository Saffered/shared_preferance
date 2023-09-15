import 'package:flutter/material.dart';
import 'package:git_test_2/data/prefs_service.dart';
import 'package:git_test_2/model/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    var user = User("101", "shamshun@gmail.com", "12345678");
    UserService.storeUser(user);
    UserService.getUser().then((value) => print(value!.toJson()));
    PrefsService.storageName("Jamshid");

    PrefsService.loadName().then((name) {
      if (name != null) {
        print("Nom: $name");
      } else {
        print("Nom topilmadi");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
