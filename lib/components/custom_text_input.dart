import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:stripe_app/utils/custem_theme.dart';

class CustomTextInput extends StatelessWidget {
  final String label;
  final String placeholder;
  final IconData icon;
  final TextEditingController textEditingController;
  final bool password;
  const CustomTextInput(
      {super.key,
      required this.label,
      required this.placeholder,
      required this.icon,
      required this.textEditingController,
      this.password = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 20),
            child: Text(
              label,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          SizedBox(
            height: 55,
            child: TextField(
              controller: textEditingController,
              obscureText: password,
              enableSuggestions: !password,
              autocorrect: !password,
              decoration: InputDecoration(
                  prefixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(start: 22, end: 20),
                      child: Icon(
                        icon,
                        color: Colors.black,
                        size: 24,
                      )),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                      borderSide: BorderSide(width: 1, color: Colors.black)),
                  filled: true,
                  hintStyle: TextStyle(color: CustemTheme.grey),
                  hintText: placeholder,
                  fillColor: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
