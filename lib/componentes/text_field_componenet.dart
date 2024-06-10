import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);

class TextFormComponenet extends StatefulWidget {
  String labelText;
  TextInputType keyboardType;
  var controller = TextEditingController();
  bool isPassword;
  Validator validator;

  TextFormComponenet({
    required this.labelText,
    required this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    required this.validator,
  });

  @override
  State<TextFormComponenet> createState() => _TextFormComponenetState();
}

class _TextFormComponenetState extends State<TextFormComponenet> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    //var myProvider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        obscureText: passwordVisible,
        decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: passwordVisible == true
                        ? Icon(
                            Icons.visibility_off) //Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  )
                : null,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(width: 4, color: Colors.black12)),
            labelText: widget.labelText,
            labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith()),
      ),
    );
  }
// void onPressed()
// {
//   if(_formKey.currentState!.validate())
//     {
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Processing Data')));
//     }
// }
}
