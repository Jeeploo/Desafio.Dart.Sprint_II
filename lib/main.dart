import 'package:desafio_sprint_dois/src/controller/todo.controller.dart';
import 'package:desafio_sprint_dois/src/view/todo_list/todo.list.page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  final getit = GetIt.instance;

  getit.registerSingleton(TodoListController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Desafio Sprint II',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TodoListPage());
  }
}
