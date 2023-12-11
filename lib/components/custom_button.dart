import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:stripe_app/components/loader.dart';
import 'package:stripe_app/utils/custem_theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onPress;
  final bool loading;
  const CustomButton({
    super.key,
    required this.text,
    this.loading = false,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
          color: CustemTheme.yellow,
          borderRadius: BorderRadius.circular(35),
          boxShadow: CustemTheme.buttonShadow),
      child: MaterialButton(
          onPressed: loading ? null : onPress,
          child: loading
              ? loader()
              : Text(
                  text,
                  style: Theme.of(context).textTheme.titleSmall,
                )),
    );
  }
}
