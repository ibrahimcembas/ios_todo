import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_todo/models/todo.dart';

class AddPage extends StatefulWidget {
  AddPage({Key key}) : super(key: key);
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController _textController;
  @override
  void initState() {
    _textController = TextEditingController(text: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var todos = Todo.todos;
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              // ignore: missing_return
              itemBuilder: (BuildContext context, int index) {
                var todo = todos[index];
                return GestureDetector(
                  onTap: () {
                    todo.toggle();
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      width: 1,
                      color: CupertinoColors.inactiveGray,
                    ))),
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          todo.name,
                          style: TextStyle(
                              decoration: todo.complete
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none),
                        ),
                        CupertinoSwitch(
                          value: todo.complete,
                          onChanged: (bool value) {
                            todo.toggle();
                          },
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: todos.length,
            ),
          ),
          CupertinoTextField(
            controller: _textController,
            prefix: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(CupertinoIcons.book),
            ),
            placeholder: 'I want to...',
            suffix: CupertinoButton(
              child: Icon(CupertinoIcons.add_circled_solid),
              onPressed: () {
                if (_textController.text.isEmpty) return;
                Todo.add(_textController.text);
                _textController.clear();
                setState(() {});
              },
            ),
          )
        ],
      ),
    );
  }
}
