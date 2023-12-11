import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:stripe_app/components/custom_button.dart';
import 'package:stripe_app/components/list_card.dart';
import 'package:stripe_app/components/loader.dart';
import 'package:stripe_app/models/cart.dart';
import 'package:stripe_app/utils/application_state.dart';
import 'package:stripe_app/utils/custem_theme.dart';
import 'package:stripe_app/utils/firestore.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final card = ["1", "2"];

  Future<List<Cart>>? carts;

  bool _checkouButtonLoading = false;

  @override
  void initState() {
    super.initState();
    carts = FirestoreUtils.getCart(
        Provider.of<ApplicationState>(context, listen: false).user);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Cart>>(
      future: carts,
      builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
        if (snapshot.hasData &&
            snapshot.data != null &&
            snapshot.data!.isNotEmpty) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data?.length,
                  padding: EdgeInsets.symmetric(vertical: 30),
                  itemBuilder: (context, index) {
                    return ListCard(cart: snapshot.data![index]);
                  },
                ),
                priceFooter(snapshot.data!),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: CustomButton(
                    text: "CHECKOUT",
                    onPress: () {},
                  ),
                )
              ],
            ),
          );
        } else if (snapshot.data?.length != null && snapshot.data!.isEmpty) {
          return const Center(
            child: Icon(
              Icons.add_shopping_cart_sharp,
              color: CustemTheme.yellow,
              size: 150,
            ),
          );
        }
        return Center(
          child: loader(),
        );
      },
    );
  }
}

priceFooter(List<Cart> carts) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 30),
    child: Column(
      children: [
        Divider(
          color: Colors.grey,
          thickness: 2,
          height: 2,
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total"),
            Text(
              "\$ " + FirestoreUtils.getCartTotal(carts).toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        )
      ],
    ),
  );
}
