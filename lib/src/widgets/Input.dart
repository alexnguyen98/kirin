import 'package:flutter/material.dart';

//https://api.flutter.dev/flutter/widgets/Text-class.html

class Input extends StatefulWidget {
  final String placeholder;

  Input({this.placeholder, Key key}) : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onChange);
  }

  @override
  void dispose() {
    _controller.removeListener(_onChange);
    super.dispose();
  }

  void _onChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: TextFormField(
          controller: _controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(width: 1, color: Colors.grey.shade400),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(width: 1, color: Colors.grey.shade400),
            ),
            hintText: widget.placeholder,
            suffixIcon: _controller.text.isNotEmpty
                ? IconButton(
                    onPressed: () => _controller.clear(),
                    icon: Icon(Icons.clear, color: Colors.grey.shade400),
                  )
                : null,
          ),
        ));
  }
}
