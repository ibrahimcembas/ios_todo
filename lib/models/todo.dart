class Todo {
  String name;
  bool complete;

  static List<Todo> todos = [
    Todo('Go to X Ofis', false),
    Todo('Eat your launch', true),
  ];
  Todo(this.name, this.complete);

  static add(String name) {
    todos.add(Todo(name, false));
  }

  toggle() {
    complete = !complete;
  }
}
