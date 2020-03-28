import 'package:ambrosino/UI/WIDGETS/appBar.dart';
import 'package:flutter/material.dart';

class RadioPage extends StatefulWidget {
  @override
  _RadioPageState createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  final TextEditingController _currencyController = new TextEditingController();
  int _radioValue = 0;

  static const EURO_MUL = 0.86;
  static const POUND_MUL = 0.75;
  static const YEN_MUL = 110.63;
  double _result = 0.0;
  String _textResult = '';
  String chunk = 'AVANCE';

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          echo = 'CASH';
          chunk = 'CASH';
          _result = _currencyCalculate(_currencyController.text, EURO_MUL);
          if (_result > -1.0) {
            _textResult = '${_currencyController.text} USD = ${_result.toStringAsFixed(3)} Euro';
          } else {
            _textResult = 'Cannot convert USD to Euro\nPlease check the Amount!';
          }
          break;
        case 1:
          echo = 'AVANCE';
          chunk = 'AVANCE';
          _result = _currencyCalculate(_currencyController.text, POUND_MUL);
          if (_result > -1.0) {
            _textResult = '${_currencyController.text} USD = ${_result.toStringAsFixed(3)} Pound';
          } else {
            _textResult = 'Cannot convert USD to Pound\nPlease check the Amount!';
          }
          break;
        case 2:
          echo = 'CREDIT';
          chunk = 'CREDIT';
          _result = _currencyCalculate(_currencyController.text, YEN_MUL);
          if (_result > -1.0) {
            _textResult = '${_currencyController.text} USD = ${_result.toStringAsFixed(3)} Yen';
          } else {
            _textResult = 'Cannot convert USD to Yen\nPlease check the Amount!';
          }
          break;
      }
      print('echo: $echo');
      print('chunk: $chunk');
    });
  }
var echo;
  void _handleCurrencyAmountChange(String amount) {
    setState(() {
      switch (_radioValue) {
        case 0:
          _result = _currencyCalculate(amount, EURO_MUL);
          if (_result > -1.0) {
            _textResult = '$amount USD = ${_result.toStringAsFixed(3)} Euro';
          } else {
            _textResult = 'Cannot convert USD to Euro\nPlease check the Amount!';
          }
          break;
        case 1:
          _result = _currencyCalculate(amount, POUND_MUL);
          if (_result > -1.0) {
            _textResult = '$amount USD = ${_result.toStringAsFixed(3)} Pound';
          } else {
            _textResult = 'Cannot convert USD to Pound\nPlease check the Amount!';
          }
          break;
        case 2:
          _result = _currencyCalculate(amount, YEN_MUL);
          if (_result > -1.0) {
            _textResult = '$amount USD = ${_result.toStringAsFixed(3)} Yen';
          } else {
            _textResult = 'Cannot convert USD to Yen\nPlease check the Amount!';
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    AllBar _bar = new AllBar(context);
    return Scaffold(
      appBar: _bar.myappBar(Colors.lightGreen, Colors.lightGreen.shade100,
          'CHECK BOX TAST', Icons.home),
      body: Container(
          alignment: Alignment.center,
          child: new ListView(
            padding: const EdgeInsets.all(25.0),
            children: <Widget>[
              new Image.asset(
                'images/currencies.png',
                height: 150.0,
                width: 150.0,
              ),
              new Container(
                margin: const EdgeInsets.all(3.0),
                alignment: Alignment.center,
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      controller: _currencyController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        labelText: 'Amount',
                        hintText: 'in USD',
                        icon: new Icon(Icons.account_balance),
                      ),
                      onChanged: _handleCurrencyAmountChange,
                    ),
                    new Padding(padding: new EdgeInsets.all(5.0)),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio(
                          value: 0,
                          groupValue: _radioValue,
                          onChanged: _handleRadioValueChange,
                        ),
                        new Text('Euro'),
                        new Radio(
                          value: 1,
                          groupValue: _radioValue,
                          onChanged: _handleRadioValueChange,
                        ),
                        new Text('Pound'),
                        new Radio(
                          value: 2,
                          groupValue: _radioValue,
                          onChanged: _handleRadioValueChange,
                        ),
                        new Text('Yen'),
                      ],
                    ),
                    new Padding(padding: new EdgeInsets.all(15.0)),
                    new Text(
                      _currencyController.text.isEmpty ? 'Please enter the Amount!' : _textResult,
                      style: new TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 20.0,
                      ),
                    ),
                    new Text(echo == 'AVANCE'? 'AVANCE':echo=='CASH'?'CASH':'CREDIT')
                  ],
                ),
              )
            ],
          )),

    );
  }
  double _currencyCalculate(String amount, double multiplier) {
    double _amount = amount.isNotEmpty ? double.parse(amount) : 0.0;

    if (_amount.toString().isNotEmpty && _amount > 0) {
      return _amount * multiplier;
    } else {
      return -1.0;
    }
  }
}
