import 'package:desafio_sprint_dois/src/controller/todo.controller.dart';
import 'package:desafio_sprint_dois/src/model/todo.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

Future<String?> displayTextInputDialog(BuildContext context) async {
  final listcontroller = GetIt.instance.get<TodoListController>();
  final formKey = GlobalKey<FormState>();

  return showDialog(
    context: context,
    builder: (context) {
      return Observer(
        builder: (context) => AlertDialog(
          title: const Text("New task TO DO"),
          content: Form(
            key: formKey,
            child: TextField(
              autofocus: true,
              onChanged: (value) {
                listcontroller.setDescription(value);
              },
              decoration: const InputDecoration(hintText: "Enter a new task"),
            ),
          ),
          actions: [
            listcontroller.isDescriptionValid
                ? ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black)),
                    onPressed: () {
                      var model = TodoModel(
                          description: listcontroller.description,
                          done: listcontroller.done);
                      listcontroller.addItem(model);
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  )
                : ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey)),
                    onPressed: () {},
                    child: const Text('Dados invalidos'),
                  ),
            const Spacer(),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        ),
      );
    },
  );
}
