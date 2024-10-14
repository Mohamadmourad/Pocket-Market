import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final TextEditingController? controller;
  final String label;
  final String error;
  final VoidCallback? onTap; // Added onTap callback

  const InputField({super.key, this.controller, required this.label, required this.error, this.onTap});

  @override
  // ignore: library_private_types_in_public_api
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onTap: () {
              if (widget.onTap != null) {
                widget.onTap!();
              }
            },
            controller: widget.controller,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              labelText: widget.label,
              labelStyle: const TextStyle(color: Color.fromARGB(255, 123, 123, 123)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: widget.error.isEmpty ? const Color.fromARGB(255, 58, 58, 58) : Colors.red,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
            style: const TextStyle(
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.error,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
