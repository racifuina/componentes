import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Sliders"),
       ),
       body: Container(
         padding: EdgeInsets.only(top: 50),
         child: Column(
           children: <Widget>[
             _crearSlider(),
             Expanded(child: _crearImagen())
           ],
         ),
       ),
    );
  }

  Widget _crearSlider () {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      onChanged: (valor) {
        setState(() {
         _valorSlider = valor; 
        });
      },
      min: 10,
      max: 400,
      value: _valorSlider,
    );
  }
  
  Widget _crearImagen () {
    return Image(
      width: _valorSlider,
      fit: BoxFit.contain,
      image: NetworkImage("https://www.seeedstudio.site/media/catalog/product/cache/ef3164306500b1080e8560b2e8b5cc0f/h/t/httpsstatics3.seeedstudio.comseeedfile2017-08bazaar549177_1.jpg"),
    );
  }
}