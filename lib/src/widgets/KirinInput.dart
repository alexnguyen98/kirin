import 'package:flutter/material.dart';
import 'package:kirin/src/constants/KirinTextConstants.dart';

// https://api.flutter.dev/flutter/widgets/Text-class.html

class KirinInput extends StatefulWidget {
  final String placeholder;
  final String label;

  KirinInput({this.placeholder, this.label, Key key}) : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<KirinInput> {
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
      child: Column(
        children: [
          if (widget.label != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.label,
                  style: TextStyle(
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w500,
                    fontSize: FontSize.large,
                  ),
                ),
              ),
            ),
          Container(
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(6.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300.withOpacity(0.4),
                      offset: Offset(0, 2),
                      blurRadius: 2,
                      spreadRadius: 0.2)
                ]),
            child: TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                fillColor: FontColor.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide(
                    width: 1,
                    color: FontColor.lightGrey,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide(
                    width: 1,
                    color: FontColor.lightGrey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide(
                    width: 1,
                    color: FontColor.lightGrey,
                  ),
                ),
                hintText: widget.placeholder,
                suffixIcon: _controller.text.isNotEmpty
                    ? IconButton(
                        onPressed: () => _controller.clear(),
                        icon: Icon(Icons.clear, color: FontColor.grey),
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
