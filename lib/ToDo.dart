import 'package:flutter/material.dart';

class ToDo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ToDoState();
  }
}

class _ListItem {
  _ListItem(this.value, this.checked);
  final String value;
  bool checked;
}

class ToDoState extends State<ToDo> {
  bool _reverseSort = false;
  static final _items = <String>[
    'Aducción de cadera',
    'Abducción de cadera',
    'Press de pierna',
    'Single Press de pierna sentado',
    'Femoral sentado',
    'Femoral tumbado',
    'Femoral tumbado (una pierna)',
    'Extensión de piernas',
    'Extensión de piernas (una pierna)',
    'Glute',
    'Extensión de pantorrilla',
    'Extensión lumbar',
    'Press de pecho sentado',
    'Mariposa pectoral',
    'Estirar hacia abajo (intercalado)',
    'Deltoide posterior',
  ].map((item) => _ListItem(item, false)).toList();

  void onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final _ListItem item = _items.removeAt(oldIndex);
      _items.insert(newIndex, item);
    });
  }

  //Codigo q se usaba para reorenar alfabeticamente la lista.
//  void _onSort() {
//    setState(() {
//      _reverseSort = !_reverseSort;
//      _items.sort((_ListItem a, _ListItem b) => _reverseSort
//          ? b.value.compareTo(a.value)
//          : a.value.compareTo(b.value));
//    });
//  }

  //Prueba uncheck box
  getCheckboxItems() {
    _items.forEach((key) {
      setState(() => key.checked = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _listTiles = _items
        .map(
          (item) => CheckboxListTile(
            key: Key(item.value),
            value: item.checked ?? false,
            onChanged: (bool newValue) {
              setState(() => item.checked = newValue);
            },
            title: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
              child: Text(
                '${item.value}',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            isThreeLine: true,
            subtitle: Text(''),
            secondary: Icon(Icons.drag_handle),
          ),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('ITEMS MOVIBLES')),
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.replay),
            tooltip: "Ordenar",
            onPressed: getCheckboxItems,
          ),
        ],
      ),
      body: ReorderableListView(
        onReorder: onReorder,
        children: _listTiles,
      ),
    );
  }
}
