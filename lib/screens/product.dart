import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:stripe_app/components/custom_button.dart';
import 'package:stripe_app/models/product.dart';
import 'package:stripe_app/utils/application_state.dart';
import 'package:stripe_app/utils/firestore.dart';

class ProductScreen extends StatefulWidget {
  final Product product;
  const ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool addButtonLoad = false;

  void addToCart() async {
    setState(() {
      addButtonLoad = true;
    });
    await FirestoreUtils.addToCart(
        Provider.of<ApplicationState>(context, listen: false).user,
        widget.product.id);
    setState(() {
      addButtonLoad = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 500,
                    width: double.infinity,
                    child: CachedNetworkImage(
                      imageUrl: widget.product.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(widget.product.title),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text("\$" + widget.product.price.toString()),
                  ),
                  CustomButton(
                    text: "Add To Cart",
                    onPress: addToCart,
                    loading: addButtonLoad,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      widget.product.description,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                top: 35,
                left: 30,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      icon: Icon(Icons.arrow_back)),
                )),
          ],
        ),
      ),
    );
  }
}
