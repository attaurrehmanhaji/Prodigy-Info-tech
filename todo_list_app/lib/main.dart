import 'model/todo.dart';
import '../widgets/todo_items.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final todosList = ToDo.todoList();
  final newTodo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    return Scaffold(
      backgroundColor: Color(0xffF3F7EC),
      appBar: myappBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      // searchBox(),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text('All TODOs',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                      ),
                      for (ToDo todo in todosList)
                        ToDoItems(
                          todo: todo,
                          onChanged: handleToDo,
                          onDelete: handleDelete,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffF3F7EC),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                          )
                        ]),
                    child: TextField(
                      style: TextStyle(fontSize: 22),
                      controller: newTodo,
                      decoration: InputDecoration(
                        hintText: "Enter new task",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      addNewTodo(newTodo.text);
                    },
                    child: Text(
                      "+",
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff102C57),
                      foregroundColor: Color(0xffF3F7EC),
                      elevation: 10,
                      minimumSize: Size(60, 60),
                      // onPrimary: Colors.white,

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void handleToDo(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void handleDelete(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void addNewTodo(String toDo) {
    setState(() {
      todosList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
    });
    newTodo.clear();
  }

  AppBar myappBar() {
    return AppBar(
      backgroundColor: Color(0xffF97300),
      title: Text(
        'ToDo App',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
      ),
    );
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      // height: 60,
      // width: 500,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 238, 238, 238),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: const TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
              size: 25,
            ),
            border: InputBorder.none,
            prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              minWidth: 25,
            ),
            contentPadding: EdgeInsets.all(0),
            hintText: "Search ",
            hintStyle: TextStyle(color: Colors.black)),
      ),
    );
  }
}
