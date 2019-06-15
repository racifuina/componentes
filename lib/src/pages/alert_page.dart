import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AlertPage"),),
      body: Center(
        child: RaisedButton(child: Text("Mostrar Alerta"),
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: () => _mostarAlerta(context),
        shape: StadiumBorder(),
        ),),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.backspace), onPressed: () {
          Navigator.pop(context);
      },),
    );
  }

  void _mostarAlerta(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Text("Titulo"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("este es el contenido de la caja de la alerta."),
              FlutterLogo(
                size: 100,
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancelar"),
              onPressed: ()=> Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("Aceptar"),
              onPressed: ()=> Navigator.of(context).pop(),
            )
          ],
        );
      }
      
    );
  }
}