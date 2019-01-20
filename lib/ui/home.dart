import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _radioValor = 0;
  var _nomePlaneta = "";
  var _resultadoPeso = 0.0;
  var _pesoController = TextEditingController();
  var _gravidadeSuperficial = 0.0;
  var _resposta = "";

  @override
  void initState() {
    super.initState();
    pegaValorRadio(_radioValor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[400],
      appBar: AppBar(
        centerTitle: true,
        title: Text("Planeta X"),
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset(
                'images/planeta.png',
                height: 133.0,
                width: 200.0,
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _pesoController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Seu peso na terra:",
                          hintText: "Kg",
                          icon: Icon(Icons.accessibility)),
                    ),
                    Row(
                      children: <Widget>[
                        Radio<int>(
                            activeColor: Colors.brown,
                            value: 0,
                            groupValue: _radioValor,
                            onChanged: pegaValorRadio),
                        Expanded(
                          child: Text(
                            "Plutão",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Radio<int>(
                            activeColor: Colors.red,
                            value: 1,
                            groupValue: _radioValor,
                            onChanged: pegaValorRadio),
                        Expanded(
                            child: Text(
                          "Marte",
                          style: TextStyle(color: Colors.white),
                        )),
                        Radio<int>(
                            activeColor: Colors.orangeAccent,
                            value: 2,
                            groupValue: _radioValor,
                            onChanged: pegaValorRadio),
                        Expanded(
                            child: Text(
                          "Vênus",
                          style: TextStyle(color: Colors.white),
                        )),
                      ],
                    ),
                    Text(
                      _resposta,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(children: <Widget>[
                          Expanded(
                              child: RaisedButton(
                            child: Text("Calcular"),
                            onPressed: calcularPeso,
                          )),
                        ]),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void pegaValorRadio(int value) {
    setState(() {
      _radioValor = value;
      switch (_radioValor) {
        case 0:
          _nomePlaneta = "Plutão";
          _gravidadeSuperficial = 0.06;
          break;
        case 1:
          _nomePlaneta = "Marte";
          _gravidadeSuperficial = 0.38;
          break;
        case 2:
          _nomePlaneta = "Vênus";
          _gravidadeSuperficial = 0.91;
          break;
      }
    });
  }

  void calcularPeso() {
    setState(() {
      if (_pesoController.text.isNotEmpty) {
        double peso = double.parse(_pesoController.text);
        if (peso > 0) {
          _resultadoPeso = peso * _gravidadeSuperficial;
          _resposta =
              "O meu peso no planeta $_nomePlaneta é $_resultadoPeso Kg";
        } else {
          _resposta = "";
        }
      } else {
        _resposta = "";
      }
    });
  }
}
