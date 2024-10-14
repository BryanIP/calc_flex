import 'package:calc_flex/widgets/loading_button.widget.dart';
import 'package:calc_flex/widgets/input.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class SubmitForm extends StatelessWidget {
  final MoneyMaskedTextController etnCtrl;
  final MoneyMaskedTextController gasCtrl;
  final bool busy;
  final VoidCallback submitFunc;

  const SubmitForm({
    super.key,
    required this.etnCtrl,
    required this.gasCtrl,
    required this.busy,
    required this.submitFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
            right: 30.0,
          ),
          child: Input(
            label: "Etanol",
            ctrl: etnCtrl,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
            right: 30.0,
          ),
          child: Input(
            label: "Gasolina",
            ctrl: gasCtrl,
          ),
        ),
        const SizedBox(
          height: 25.0,
        ),
        LoadingButton(
          busy: busy,
          invert: false,
          func: submitFunc,
          text: "Calcular",
        ),
      ],
    );
  }
}
