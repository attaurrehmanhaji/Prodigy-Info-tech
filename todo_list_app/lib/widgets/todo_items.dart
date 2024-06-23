import '../model/todo.dart';
import 'package:flutter/material.dart';

class ToDoItems extends StatelessWidget {
  final ToDo todo;
  final onChanged;
  final onDelete;
  const ToDoItems(
      {super.key,
      required this.todo,
      required this.onChanged,
      required this.onDelete});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: ListTile(
          onTap: () {
            onChanged(todo);
          },
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tileColor: Color(0xffF6E6CB),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          leading: todo.isDone
              ? Icon(
                  Icons.check_box,
                  color: Color(0xff102C57),
                )
              : Icon(
                  Icons.check_box_outline_blank,
                  color: Color(0xff102C57),
                ),
          title: Text(
            todo.todoText!,
            style: TextStyle(
              fontSize: 22,
              color: Color(0xff102C57),
              decorationThickness: 2,
              decorationColor: Color(0xff102C57),
              //  todo.isDone ? TextDecoration.lineThrough : null,
              decoration: todo.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Container(
            height: 35,
            width: 35,
            child: IconButton(
              color: Color(0xffF6E6CB),
              icon: Icon(Icons.delete_forever),
              iconSize: 21,
              onPressed: () {
                onDelete(todo.id);
              },
            ),
            decoration: BoxDecoration(
                color: Color(0xffF97300),
                borderRadius: BorderRadius.circular(5)),
          ),
        ));
  }
}
