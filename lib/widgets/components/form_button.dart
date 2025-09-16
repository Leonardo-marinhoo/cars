import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool showProgress;

  const FormButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.showProgress = false,
  });

  @override
  Widget build(BuildContext context) {
    return showProgress
        ? Center(child: CircularProgressIndicator())
        : SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                textStyle: TextStyle(fontSize: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(text),
            ),
          );
  }
}
