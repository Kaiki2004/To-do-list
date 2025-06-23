import 'package:flutter/material.dart';

void main() {
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do Moderna',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF6C63FF),
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      home: ToDoHomePage(),
    );
  }
}

class ToDoHomePage extends StatefulWidget {
  @override
  _ToDoHomePageState createState() => _ToDoHomePageState();
}

class _ToDoHomePageState extends State<ToDoHomePage> {
  final List<ToDoItem> _items = [];
  final TextEditingController _controller = TextEditingController();

  void _addItem() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _items.insert(0, ToDoItem(text));
        _controller.clear();
      });
    }
  }

  void _toggleDone(int index) {
    setState(() {
      _items[index].isDone = !_items[index].isDone;
    });
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  Widget _buildItem(ToDoItem item, int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: item.isDone ? Colors.green[100] : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(2, 2),
          )
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: IconButton(
          icon: Icon(
            item.isDone ? Icons.check_circle : Icons.radio_button_unchecked,
            color: item.isDone ? Colors.green : Colors.grey,
          ),
          onPressed: () => _toggleDone(index),
        ),
        title: Text(
          item.title,
          style: TextStyle(
            fontSize: 16,
            decoration: item.isDone ? TextDecoration.lineThrough : null,
            color: item.isDone ? Colors.grey : Colors.black,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete_outline, color: Colors.redAccent),
          onPressed: () => _removeItem(index),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      appBar: AppBar(
        title: Text('Minha Lista'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFF6C63FF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo de entrada
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      hintText: 'Digite uma nova tarefa...',
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSubmitted: (_) => _addItem(),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _addItem,
                    child: Icon(Icons.add, size: 24),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF6C63FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: _items.isEmpty
                  ? Center(
                      child: Text(
                        "Nenhuma tarefa ainda!",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: (context, index) =>
                          _buildItem(_items[index], index),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class ToDoItem {
  final String title;
  bool isDone;

  ToDoItem(this.title, {this.isDone = false});
}
            // Campo de entrada
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      hintText: 'Digite uma nova tarefa...',
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSubmitted: (_) => _addItem(),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _addItem,
                    child: Icon(Icons.add, size: 24),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF6C63FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: _items.isEmpty
                  ? Center(
                      child: Text(
                        "Nenhuma tarefa ainda!",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: (context, index) =>
                          _buildItem(_items[index], index),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class ToDoItem {
  final String title;
  bool isDone;

  ToDoItem(this.title, {this.isDone = false});
}
