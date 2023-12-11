import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:stripe_app/models/cart.dart';
import 'package:stripe_app/utils/custem_theme.dart';

class ListCard extends StatelessWidget {
  final Cart cart;
  const ListCard({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
      decoration: CustemTheme.getCardDecoration(),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: cart.image,
                fit: BoxFit.cover,
              ),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(cart.title)),
                          Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text("QTY : " + cart.count.toString())),
                          Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "\$" + cart.price.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ],
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
