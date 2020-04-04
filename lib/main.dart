import 'package:flutter/material.dart';
import 'package:quitandadoseuze/pages/listadecompras.dart';
import 'dart:async';

void main() {
  runApp(Inicial());
}

class Inicial extends StatefulWidget {
  @override
  _InicialState createState() => _InicialState();
}

class _InicialState extends State<Inicial> {
  _logo() async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => Logo()));
  }

  _InicialState() {
    _logo();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Logo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Logo extends StatefulWidget {
  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  bool _isStart = true;
  String _stopwatchText = '0';
  final _stopWatch = new Stopwatch();
  final _timeout = const Duration(seconds: 1);

  _LogoState() {
    _stopWatch.start();
    _startTimeout();
  }

  void _startTimeout() {
    new Timer(_timeout, _handleTimeout);
  }

  Future<void> _handleTimeout() async {
    if (int.parse('$_stopwatchText') >= 2) {
      // _stopWatch.stop();
      // Navigator.pop(context);
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => ListaCompras()));
    }

    _startTimeout();

    _setStopwatchText();
  }

  void _startStopButtonPressed() {
    setState(() {
      _isStart = false;
      _stopWatch.start();
      _startTimeout();
    });
  }

  void _setStopwatchText() {
    _stopwatchText =
        (_stopWatch.elapsed.inSeconds % 60).toString().padLeft(2, '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Text(
          //   _stopwatchText,
          //   style: TextStyle(fontSize: 72),
          // ),
          // Center(child: Text("data")),
          Image.asset('images/logo.jpg')
        ],
      ),
    );
  }
}
