import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = '';
  String _email = '';
  String _date = '';
  String _optionSelected = 'Fly';
  List<String> _powers = ['Fly', 'X Ray', 'Force'];

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
          _createDropDown(),
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
      trailing: Text(_optionSelected),
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
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2030),
        locale: Locale('es', 'AR'));

    if (picked != null) {
      setState(() {
        _date = picked.toString();
        _inputFieldDate.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>> getDropDownOptions() {
    List<DropdownMenuItem<String>> list = new List();

    _powers.forEach((power) =>
        {list.add(DropdownMenuItem(value: power, child: Text(power)))});

    return list;
  }

  Widget _createDropDown() {
    return Row(children: <Widget>[
      Icon(Icons.select_all),
      SizedBox(
        width: 30.0,
      ),
      Expanded(
              child: DropdownButton(
            value: _optionSelected,
            items: getDropDownOptions(),
            onChanged: (opt) {
              setState(() {
                _optionSelected = opt;
              });
            }),
      )
    ]);
  }
}
