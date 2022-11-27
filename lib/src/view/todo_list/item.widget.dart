import 'package:desafio_sprint_dois/src/controller/todo.controller.dart';
import 'package:desafio_sprint_dois/src/model/todo.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class ItemWidget extends StatefulWidget {
  final TodoModel item;

  ItemWidget(this.item, {super.key});

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  final listcontroller = GetIt.instance.get<TodoListController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ListTile(
        leading: Checkbox(
          value: widget.item.done,
          onChanged: (value) => setState(() {
            widget.item.done = !widget.item.done;
          }),
        ),
        title: Text(widget.item.description),
        trailing: IconButton(
            onPressed: () => listcontroller.removeItem(widget.item),
            icon: const Icon(
              Icons.backspace_outlined,
              color: Colors.redAccent,
            )),
      ),
    );
  }
}
