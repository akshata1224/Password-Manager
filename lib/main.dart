import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pm/data/repositories/auth_repository.dart';
import 'package:pm/data/repositories/pass_repository.dart';
import 'package:pm/logic/bloc/auth/auth_bloc.dart';
import 'package:pm/logic/bloc/pass/pass_bloc.dart';
import 'package:pm/logic/bloc_observer.dart';
import 'package:pm/presentation/routes/routes.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  // Hive
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // To look at the current state info
  BlocOverrides.runZoned(
    () => runApp(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => PassRepository(),
          ),
          RepositoryProvider(
            create: (context) => AuthRepository(),
          ),
        ],
        child: const MyApp(),
      ),
    ),
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(context.read<AuthRepository>()),
        ),
        BlocProvider(
          create: (context) =>
              PassBloc(context.read<PassRepository>())..add(PassLoadEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'My Pass',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        onGenerateRoute: routes,
        initialRoute: '/',
      ),
    );
  }
}
