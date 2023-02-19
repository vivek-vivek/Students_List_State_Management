import 'package:data_base_hive/db/model/data_model.dart';
import 'package:data_base_hive/providers/addStudent_provider.dart';
import 'package:data_base_hive/providers/searchStudents_provider.dart';
import 'package:data_base_hive/providers/updateStudent_provider.dart';
import 'package:data_base_hive/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AddStudentProvider>(
          create: (_) => AddStudentProvider(),
        ),
        ChangeNotifierProvider<UpdateStudentProvider>(
          create: (_) => UpdateStudentProvider(),
        ),
        ChangeNotifierProvider<SearchStudentProvider>(
          create: (_) => SearchStudentProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Students Data', theme: ThemeData.dark(),
        // theme: ThemeData(
        //   primarySwatch: Colors.blueGrey,
        // ),
        home: const HomeScreen(),
      ),
    );
  }
}
