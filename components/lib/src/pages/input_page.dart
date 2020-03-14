import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = '';
  String _email = '';
  String _date = '';

  TextEditingController _inputFieldDate = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPass(),
          Divider(),
          _createDate(context),
          Divider(),
          _createPerson()
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          counter: Text('Letters ${_name.length}'),
          hintText: 'Person name',
          labelText: 'Name',
          helperText: 'Just your name',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (value) {
        setState(() {});
        _name = value;
      },
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('Name is: $_name'),
      subtitle: Text('Email: $_email'),
    );
  }

  Widget _createEmail() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            hintText: 'Email',
            labelText: 'Email',
            suffixIcon: Icon(Icons.alternate_email),
            icon: Icon(Icons.email)),
        onChanged: (value) => setState(() {
              _email = value;
            }));
  }

  Widget _createPass() {
    return TextField(
        obscureText: true,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            hintText: 'Password',
            labelText: 'Password',
            suffixIcon: Icon(Icons.lock),
            icon: Icon(Icons.lock)),
        onChanged: (value) => setState(() {}));
  }

  Widget _createDate(BuildContext context) {
    return TextField(
        enableInteractiveSelection: false,
        controller: _inputFieldDate,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            hintText: 'Birth Date',
            labelText: 'Birth Date',
            suffixIcon: Icon(Icons.calendar_today),
            icon: Icon(Icons.calendar_today)),
            onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
                _selectDate(context);
                            });
                  }
                
                   _selectDate(BuildContext context) async {
                     DateTime picked =  await showDatePicker(
                       context: context,
                       initialDate: new DateTime.now(),
                       firstDate: new DateTime(2018),
                       lastDate: new DateTime(2030),
                       locale: Locale('es', 'AR')

                     );

                     if(picked != null) {
                       setState(() {
                         _date = picked.toString();
                         _inputFieldDate.text = _date;
                       });
                     }
                  }
}
