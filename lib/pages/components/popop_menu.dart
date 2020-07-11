import 'package:flutter/material.dart';
import 'package:quitandadoseuze/pages/buying_list.dart';

class CustomPopupMenu extends StatelessWidget {
  final List<Map<String, dynamic>> listScore = [
    <String, dynamic>{"name": "marcos", "point": 22},
    <String, dynamic>{"name": "marcos", "point": 17},
    <String, dynamic>{"name": "marcos", "point": 8},
    <String, dynamic>{"name": "marcos", "point": 23},
  ];
  List<PopupMenuEntry<dynamic>> _itemBuilder(context) {
    var list = List<PopupMenuEntry<Object>>();
    list.add(
      PopupMenuItem(
        child: GestureDetector(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => BuyingList())),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.list,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              Text(
                "Fazer Lista de Compras",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      tooltip: "Menu",
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.white,
          width: 3,
        ),
      ),
      color: Color(0xFFC9DAE2).withOpacity(.9),
      itemBuilder: _itemBuilder,
      icon: Icon(
        Icons.more_vert,
        size: 40,
        color: Colors.white,
      ),
    );
  }
}