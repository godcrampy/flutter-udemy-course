import 'package:flutter/material.dart';

class AddressTag extends StatelessWidget {
  final String address;
  AddressTag(this.address);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0),
        child: Text(
          address,
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ));
  }
}
