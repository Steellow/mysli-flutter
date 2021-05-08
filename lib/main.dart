import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mysli/logic/cubit/itemlist_cubit.dart';
import 'package:mysli/ui/screens/home_screen/home_page.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  // Hydrated bloc stuff:
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mysli',
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      home: BlocProvider(
        create: (context) => ItemlistCubit(),
        child: HomePage(),
      ),
    );
  }
}
