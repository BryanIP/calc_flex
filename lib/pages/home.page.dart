import 'package:calc_flex/widgets/logo.widget.dart';
import 'package:calc_flex/widgets/submit_form.dart';
import 'package:calc_flex/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.deepPurple;
  var _etnCtrl = MoneyMaskedTextController();
  var _gasCtrl = MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _resultText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: const Duration(
          milliseconds: 1200,
        ),
        color: _color,
        child: ListView(
          children: [
            const Logo(),
            _completed
                ? Success(
                    result: _resultText,
                    reset: reset,
                  )
                : SubmitForm(
                    etnCtrl: _etnCtrl,
                    gasCtrl: _gasCtrl,
                    busy: _busy,
                    submitFunc: calculate,
                  )
          ],
        ),
      ),
    );
  }

  Future calculate() async {
    double etn =
        double.parse(_etnCtrl.text.replaceAll(RegExp(r"[,.]"), "")) / 100;

    double gas =
        double.parse(_gasCtrl.text.replaceAll(RegExp(r"[,.]"), "")) / 100;

    double res = etn / gas;

    setState(() {
      _color = Colors.deepPurpleAccent;
      _busy = true;
      _completed = false;
    });

    return Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _resultText = "Compensa utilizar ";

        if (res >= 0.7) {
          _resultText += "Gasolina!";
        } else {
          _resultText += "Etanol!";
        }

        _busy = false;
        _completed = true;
      });
    });
  }

  reset() {
    setState(() {
      _etnCtrl = MoneyMaskedTextController();
      _gasCtrl = MoneyMaskedTextController();
      _color = Colors.deepPurple;
      _busy = false;
      _completed = false;
    });
  }
}
