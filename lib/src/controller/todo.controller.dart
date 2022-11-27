// ignore_for_file: library_private_types_in_public_api

import 'package:desafio_sprint_dois/src/model/todo.model.dart';
import 'package:mobx/mobx.dart';
part 'todo.controller.g.dart';

class TodoListController = _TodoListControllerBase with _$TodoListController;

abstract class _TodoListControllerBase with Store {
  ObservableList<TodoModel> todoList = ObservableList<TodoModel>();

  @observable
  bool done = false;

  @observable
  String description = "";

  @action
  setDescription(String value) => description = value;

  @action
  setDone(bool value) {
    done = value;
  }

  @action
  void addItem(TodoModel description) {
    todoList.add(description);
  }

  @action
  void removeItem(TodoModel todo) {
    todoList.removeWhere((element) => element == todo);
  }

  @computed
  bool get isDescriptionValid => description.isNotEmpty;
}
