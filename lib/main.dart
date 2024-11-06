import 'package:flutter/material.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Todo Manager",
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: const TodoList(
        title: "Todo Manager"),
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({super.key, required this.title});

  final String title;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends  State<TodoList>{
  final List<Todo> _todos = <Todo>[];
  final TextEditingController _textFieldController = TextEditingController();

  void _addTodoItem(String name){
    setState(() {
      _todos.add(Todo(name: name, completed: false));
    });
    _textFieldController.clear();
  }

  Future<void> _displayDialog() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text("Add a ToDo"),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: 'Type your todo'),
              autofocus: true,
            ),
            actions: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                  onPressed: (){
                  Navigator.of(context).pop();
                  },
                  child: const Text("Cancel"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                  onPressed: (){
                  Navigator.of(context).pop();
                  _addTodoItem(_textFieldController.text);
                  },
                  child: const Text("Add")
              )
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> _displayDialog(),
        tooltip: "Add a Todo",
        child: Icon(Icons.add),
      ),
    );
  }
}

class Todo {
  Todo({required this.name, required this.completed});
  String name;
  bool completed;
}

class ToDoItem extends StatelessWidget{
  ToDoItem({required this.todo}) : super(key: ObjectKey(todo));

  final Todo todo;

  TextStyle ? _getTextStyle(bool checked){
    if (!checked) return null;

    return const TextStyle(
      color: Colors.black45,
      decoration: TextDecoration.lineThrough,
    );
  }

}