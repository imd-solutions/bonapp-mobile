import 'package:flutter/material.dart';

class CartItems extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String name;

  CartItems(this.id, this.productId, this.price, this.quantity, this.name);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction) {},
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            child: FittedBox(
              child: Image.asset(
                'assets/images/logo.png',
                height: 100.0,
                width: 100.0,
              ),
            ),
          ),
          title: Text(name),
          subtitle: Text('Total: £${(price * quantity).toStringAsFixed(2)}'),
          trailing: Text('x $quantity '),
        ),
      ),
    );
  }
}
