import 'package:mobx/mobx.dart';

class TodoModel {
  final String description;
  bool done;

  TodoModel({required this.description, this.done = false});
}
