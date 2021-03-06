import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:officecafeteria/providers/changeNotifiers/cartProvider.dart';
import 'package:officecafeteria/utilities/colors.dart';
import 'package:officecafeteria/views/screens/paymentScreen/paymentScreen.dart';
import 'package:provider/provider.dart';

import 'components/deleteIcon.dart';
import 'components/shoppingCartCard.dart';

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, _) => Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Scaffold(
          backgroundColor: AppColors.homeScreenColor,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.secondaryColor,
              ),
              onPressed: () {
                Future.delayed(Duration.zero, () {
                  Navigator.pop(context);
                });
              },
            ),
            elevation: 0,
            title: Text(
              "My Tray",
              style: TextStyle(color: Colors.black),
            ),
            actions: [cartItemList.length != 0 ? ClearCartIcon() : Container()],
            backgroundColor: AppColors.homeScreenColor,
          ),
          body: Stack(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: cartItemList.length,
                itemBuilder: (context, index) => ShoppingCartCard(
                  cartItem: cartItemList[index],
                ),
              ),
              cartItemList.length != 0
                  ? Column(
                      children: [
                        Spacer(),
                        CheckoutRow(),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 3,
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: SvgPicture.asset("assets/nothing.svg"),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Nothing's here !!",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Text(
                              "Order Something",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Color(0xffF56F64),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class CheckoutRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 30,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: Consumer<CartProvider>(
        builder: (context, cartProvider, _) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                text: "Total:\n",
                children: [
                  TextSpan(
                    text: "₹ ${cartProvider.totalAmount}",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 190,
              child: DefaultButton(
                text: "Check Out",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
