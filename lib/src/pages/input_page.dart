import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = "";
  String _email = "";
  String _fecha = "";
  String _opcionSeleccionada = "Volar";
  List<String> _poderes = ["Volar", "Rayos-X", "Super Aliento", "Super Fuerza"];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text Inputs"),),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        children: <Widget>[
          _creatInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],),
    );
  }
  Widget _creatInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(  
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        counter: Text("Letras ${_nombre.length}"),
        hintText: "Nombre de la persona",
        labelText: "Nombre",
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
        helperText: "Solo primer nombre"
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text("Nombre es $_nombre"),
      subtitle: Text("Email es $_email"),
      trailing: Text(_opcionSeleccionada),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(  
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        hintText: "Correo electrónico",
        labelText: "Email",
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(  
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        hintText: "Contraseña",
        labelText: "Contraseña",
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
      ),
    );
  }

  Widget _crearFecha (BuildContext context) {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(  
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        hintText: "Fecha de nacimiento",
        labelText: "Fecha de nacimiento",
        suffixIcon: Icon(Icons.calendar_today),
        icon: Icon(Icons.perm_contact_calendar),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode ());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async{
    DateTime timePicked  = await showDatePicker(
      context: context,
      locale: Locale("es", "ES"),
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025)
    );

    if (timePicked != null) {
      setState(() {
        _fecha = timePicked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> _getOpcionesDrowpdown () {
    List<DropdownMenuItem<String>> lista =  new List();
    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem (
          child: Text(poder),
          value: poder,
      ));
    });
    return lista;
  }

  Widget _crearDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0,),
        Expanded(
            child: DropdownButton(
            value: _opcionSeleccionada,
            items: _getOpcionesDrowpdown(),
            onChanged: (option) {
              setState(() {
                _opcionSeleccionada = option;
              });
            },
          ),
        )
      ],
    );
  }

  

}