import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class loader extends StatelessWidget {
  final double scale;
  const loader({super.key, this.scale = 1});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: CircularProgressIndicator(
        color: Colors.black,
        semanticsLabel: 'Circular progress bar',
      ),
    );
  }
}
