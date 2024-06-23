class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(
        id: '1',
        todoText: 'Task 1',
        isDone: true,
      ),
      ToDo(
        id: '2',
        todoText: 'Task 2',
        isDone: false,
      ),
      ToDo(
        id: '3',
        todoText: 'Task 3',
        isDone: true,
      ),
      ToDo(
        id: '4',
        todoText: 'Task 4',
        isDone: true,
      ),
      ToDo(
        id: '5',
        todoText: 'Task 5',
        isDone: false,
      ),
      ToDo(
        id: '6',
        todoText: 'Task 6',
        isDone: false,
      ),
      ToDo(
        id: '7',
        todoText: 'Task 7',
        isDone: false,
      ),
      ToDo(
        id: '8',
        todoText: 'Task 8',
        isDone: true,
      ),
    ];
  }
}
