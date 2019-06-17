import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  ScrollController _scrollController = new ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregarDiez();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas"),
      ),
      body: Stack(children: <Widget>[
        _crearLista(),
        _crearLoading(),
      ],),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
          child: ListView.builder(
          itemCount: _listaNumeros.length,
          controller: _scrollController,
          itemBuilder: (BuildContext contex, int index) {
            final imagen = _listaNumeros[index];
            return FadeInImage(
              image: NetworkImage("https://picsum.photos/500/300/?image=$imagen"),
              placeholder: AssetImage("assets/jar-loading.gif"),
            );
          },
        ),
        onRefresh: _obtenerPaginaUno,
    );
  }


  Future<Null> _obtenerPaginaUno() async {
    final duration = new Duration(seconds: 2);

    new Timer(duration, ()  {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregarDiez();
    });

    return Future.delayed(duration);

  }
  void _agregarDiez() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
      setState(() {});
    }
  }

  Future<Null> _fetchData () async {
    _isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
     return new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP () {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );
    _agregarDiez();
  }

  Widget _crearLoading() {
    if (_isLoading) {

      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()

            ],
          ),
          SizedBox(height: 15.0,)
      ],
      );
    } else {
      return Container();
    }
  }
} 