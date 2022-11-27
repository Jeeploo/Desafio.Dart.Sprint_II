import 'package:desafio_sprint_dois/src/controller/todo.controller.dart';
import 'package:desafio_sprint_dois/src/model/todo.model.dart';
import 'package:desafio_sprint_dois/src/view/todo_list/input.dialog.dart';
import 'package:desafio_sprint_dois/src/view/todo_list/item.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({this.item, super.key});

  final TodoModel? item;

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final listcontroller = GetIt.instance.get<TodoListController>();

  late TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "T O D O - L I S T",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.black,
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.task),
          backgroundColor: Colors.black,
          label: const Text(
            "N E W - T A S K",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          onPressed: (() {
            displayTextInputDialog(context);
          }),
        ),
        body: Observer(
          builder: (context) => SizedBox(
            height: MediaQuery.of(context).size.height * 7,
            child: listcontroller.todoList.isEmpty
                ? Container(
                    color: Colors.black,
                    child: const Center(
                      child: SizedBox(
                        child: Text(
                          textAlign: TextAlign.left,
                          " It`s dark and cold here,\n try to create a new task\n to keep this place lighter\n and warm ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: listcontroller.todoList.length,
                    itemBuilder: (context, index) {
                      return ItemWidget(
                        listcontroller.todoList[index],
                      );
                    }),
          ),
        ));
  }
}
