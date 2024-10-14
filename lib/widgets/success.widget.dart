import 'package:calc_flex/widgets/loading_button.widget.dart';
import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  var result = "";
  VoidCallback reset;

  Success({
    super.key,
    required this.result,
    required this.reset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 30.0,
          ),
          Text(
            result,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 40.0,
              fontFamily: "Big Shoulders Display",
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          LoadingButton(
            busy: false,
            invert: true,
            func: reset,
            text: "Calcular novamente",
          ),
        ],
      ),
    );
  }
}
