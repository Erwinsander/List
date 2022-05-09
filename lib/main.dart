import 'package:flutter/material.dart';

void main() => runApp(Listas());

class Listas extends StatefulWidget {
  const Listas({Key? key}) : super(key: key);

  @override
  State<Listas> createState() => _ListasState();
}

class _ListasState extends State<Listas> {
  List<Persona> _personas = [
    Persona("Erwin", "Sander", "1165272789"),
    Persona("martin", "Sanchez", "1123442876"),
    Persona("juan", "mansilla", "1123455432"),
    Persona("Julia", "Verne", "1123445897"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Listas",
      home: Scaffold(
          appBar: AppBar(
            title: Text("Listas"),
          ),
          body: ListView.builder(
              itemCount: _personas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onLongPress: () {
                    this._borrarpersona(context, _personas[index]);
                  },
                  title: Text(
                      _personas[index].name + " " + _personas[index].lastname),
                  subtitle: Text(_personas[index].phone),
                  leading: CircleAvatar(
                    child: Text(_personas[index].name.substring(0, 1)),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                );
              })),
    );
  }

  _borrarpersona(context, Persona persona) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Eliminar contacto"),
              content: Text(
                  "¿Está seguro de querer eliminar a " + persona.name + "?"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancelar")),
                TextButton(
                    onPressed: () {
                      print(persona.name);
                      this.setState(() {
                        this._personas.remove(persona);
                      });
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Borrar",
                      style: TextStyle(color: Colors.red),
                    )),
              ],
            ));
  }
}

class Persona {
  late String name;
  late String lastname;
  late String phone;

  Persona(name, lastname, phone) {
    this.name = name;
    this.lastname = lastname;
    this.phone = phone;
  }
}
