import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp2/networking/DB.dart';
import 'package:todoapp2/screens/add_task_screen.dart';
import 'package:todoapp2/screens/home_screen.dart';
import 'package:todoapp2/shared/app_theme.dart';
import 'package:todoapp2/shared/cash.dart';
import 'package:todoapp2/shared/constants.dart';
import 'package:todoapp2/shared/routes.dart';
import 'package:todoapp2/state/add_task_cubit/task_cubit.dart';
import 'package:todoapp2/state/blocObservable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  Bloc.observer = MyBlocObserver();
  // await DBRepo.initializeDB();
  // Constants.themeMode = CashHelper.getData(key: "ThemeMode");
  // print(Constants.themeMode);

  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (_) => TaskCubit()..initializeDB())],
      child: const Todo()));
}

class Todo extends StatelessWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomeScreen(),
      // theme: getAppTheme(),
      initialRoute: "/chat",
      // routes: {
      //   '/': (_) => HomeScreen(),
      //   '/addTask': (_) => AddTaskScreen(),
      // },
      onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}
