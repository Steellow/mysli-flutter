import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mysli/logic/cubit/itemarchive_cubit.dart';
import 'package:mysli/logic/cubit/itemlist_cubit.dart';
import 'package:mysli/ui/screens/home_screen/home_page.dart';
import 'package:mysli/util/styles.dart';
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
      theme: Styles().theme,
      themeMode: ThemeMode.dark,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<ItemlistCubit>(
            create: (context) => ItemlistCubit(),
          ),
          BlocProvider<ItemarchiveCubit>(
            create: (context) => ItemarchiveCubit(),
          ),
        ],
        child: HomePage(),
      ),
    );
  }
}
