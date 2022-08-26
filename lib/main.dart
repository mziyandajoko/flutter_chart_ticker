import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_stock_ticker/api/api.dart';

import 'components/search_page.dart';
import 'state/bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // This project has a .env file which is git ignored. It has the api key.
  // In order to clone this repo and try out the app, you will need to create
  // your own ".env" file in the root level folder (which has pubspec.yaml)
  // and get your own api key.
  await FlutterConfig.loadEnvVariables();
  final apiKey = FlutterConfig.get('ApiKey').toString();
  final api = Api(Api.buildDefaultHttpClient(apiKey));

  runApp(MyApp(api: api));
}

class MyApp extends StatelessWidget {
  final Api api;

  const MyApp({
    required this.api,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppStateCubit(api),
      child: MaterialApp(
        title: 'Flutter stock ticker',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: AppBarTheme(
            color: Colors.red[900]!,
          ),
        ),
        home: const SearchPage(),
      ),
    );
  }
}
