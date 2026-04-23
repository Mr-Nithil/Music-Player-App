import 'package:client/features/auth/view/pages/login_page.dart';
import 'package:client/config/theme/theme.dart';
import 'package:client/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  await container.read(authViewModelProvider.notifier).initSharedPreferences();
  final userModel = await container
      .read(authViewModelProvider.notifier)
      .getUserData();
  print(userModel);
  runApp(UncontrolledProviderScope(container: container, child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkThemeMode,
      home: LoginPage(),
    );
  }
}
