import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.svgPath,
      required this.hint,
      required this.obsecrue,
      this.validator,
      this.onFieldSubmitted,
      this.onChanged,
      this.keyboardType});

  final String svgPath;
  final String hint;
  final bool obsecrue;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool passwordInVisible=true;

  @override
  void initState() {
    passwordInVisible=widget.obsecrue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // bool passwordInVisible = false;

    return TextFormField(
      keyboardType: widget.keyboardType,
      obscureText: passwordInVisible,
      cursorColor: Colors.white,
      validator: widget.validator,
      onChanged: widget.onChanged,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.72,
      ),
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 0.20,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Color(0xFFDAE7E7),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: widget.hint,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontFamily: 'Century Gothic',
            fontWeight: FontWeight.w400,
            height: 0.07,
            letterSpacing: 0.72,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(
              widget.svgPath,
              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
          ),
          suffixIcon: Visibility(
            visible: widget.obsecrue,
            child: IconButton(
              icon: Icon(
                passwordInVisible ? Icons.visibility_off : Icons.visibility,
                //change icon based on boolean value
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  passwordInVisible =
                      !passwordInVisible; //change boolean value
                });
              },
            ),
          )),
    );
  }
}
