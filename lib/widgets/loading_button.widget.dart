import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  final bool busy;
  final bool invert;
  final VoidCallback func;
  final String text;

  const LoadingButton({
    super.key,
    required this.busy,
    required this.invert,
    required this.func,
    required this.text,
  });

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  Color _borderColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return widget.busy
        ? Container(
            alignment: Alignment.center,
            height: 50.0,
            child: const CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          )
        : Container(
            margin: const EdgeInsets.all(30.0),
            height: 60.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: widget.invert
                  ? Theme.of(context).primaryColor
                  : Colors.white.withOpacity(0.8),
              border: Border.all(
                color: _borderColor,
                style: BorderStyle.solid,
                strokeAlign: BorderSide.strokeAlignOutside,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(60.0),
            ),
            child: TextButton(
              onPressed: widget.func,
              onFocusChange: (value) {
                setState(() {
                  _borderColor = (value && !widget.invert)
                      ? Colors.pink
                      : Colors.transparent;
                });
              },
              child: Text(
                widget.text.toUpperCase(),
                style: TextStyle(
                  color: widget.invert
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                  fontSize: 25.0,
                  fontFamily: "Big Shoulders Display",
                ),
              ),
            ),
          );
  }
}
