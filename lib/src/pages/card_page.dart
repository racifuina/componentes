import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards")
      ),
      body: ListView(
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 10.0,),
          _cardTipo2(),
          SizedBox(height: 10.0,),
          _cardTipo1(),
          SizedBox(height: 10.0,),
          _cardTipo2(),
          SizedBox(height: 10.0,),
          _cardTipo1(),
          SizedBox(height: 10.0,),
          _cardTipo2(),
          SizedBox(height: 10.0,),
          _cardTipo1(),
          SizedBox(height: 10.0,),
          _cardTipo2(),
          SizedBox(height: 10.0,),
          _cardTipo1(),
          SizedBox(height: 10.0,),
          _cardTipo2(),
          SizedBox(height: 10.0,),
          _cardTipo1(),
          SizedBox(height: 10.0,),
          _cardTipo2(),
          SizedBox(height: 10.0,),
          _cardTipo1(),
          SizedBox(height: 10.0,),
          _cardTipo2(),
          SizedBox(height: 10.0,),
        ],
        padding: EdgeInsets.all(10.0),),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)
      ),
      child: Column(children: <Widget>[
        ListTile(
          leading: Icon(Icons.photo_album, color: Colors.blue,),
          title: Text("Soy el Titulo de esta tarjeta"),
          subtitle: Text("Aquí estamos con la descripción de la tarjeta que muestra la información de la tarjeta que estmos creando"),
        ),
        Row(children: <Widget>[
          FlatButton(child: Text('Cancelar'), onPressed: (){},),
          FlatButton(child: Text('Ok'), onPressed: (){},)
        ],
        mainAxisAlignment: MainAxisAlignment.end  ,)
      ],),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://static.photocdn.pt/images/articles/2017/12/11/articles/2017_8/iStock-875430954-min.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: (Duration(milliseconds: 200)),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
            child: Text("No tengo idea de que escribir."), 
            padding: EdgeInsets.all(10.0),
            )
          ],
      ),
    );
    return Container(
      child: ClipRRect(child: card, borderRadius: BorderRadius.circular(5.0)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
      ),
    );
  }
}