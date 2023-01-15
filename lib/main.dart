import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hashcrypt/theme/app_theme.dart';
import 'package:hashcrypt/values/strings.dart';

import 'hash_crypt.dart';

final isLightTheme = StateProvider<bool>((ref) => true);

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Consumer(
        builder: (context, ref, child) {
          final isLight = ref.watch(isLightTheme);
          return MaterialApp(
            title: Strings.APP_TITLE,
            theme: isLight ? AppTheme.lightThemeData : AppTheme.darkThemeData,
            home: const Hashcrypt(),
          );
        },
      ),
    );
  }
}
