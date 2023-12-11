import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:stripe_app/components/grid_card.dart';
import 'package:stripe_app/components/loader.dart';
import 'package:stripe_app/models/product.dart';
import 'package:stripe_app/screens/login.dart';
import 'package:stripe_app/screens/product.dart';
import 'package:stripe_app/utils/firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Product>>? products;

  @override
  void initState() {
    super.initState();
    products = FirestoreUtils.getProducts([]);
  }

  @override
  Widget build(BuildContext context) {
    onCardPress(Product product) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductScreen(product: product),
          ));
    }

    return FutureBuilder<List<Product>>(
        future: products,
        builder: (context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return GridView.builder(
                itemCount: snapshot.data?.length,
                padding: const EdgeInsets.symmetric(vertical: 30),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30),
                itemBuilder: (BuildContext context, int index) {
                  return GridCard(
                    product: snapshot.data![index],
                    index: index,
                    onPress: () {
                      onCardPress(snapshot.data![index]);
                    },
                  );
                });
          } else {
            return const Center(child: loader());
          }
        });
  }
}
