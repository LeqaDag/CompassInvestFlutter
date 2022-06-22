// ignore_for_file: curly_braces_in_flow_control_structures, sized_box_for_whitespace, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, unnecessary_const

import 'package:flutter/material.dart';

class OrderFormField extends StatelessWidget {
  final String text;
  final IconData icon;
  final String name;

  const OrderFormField(this.text, this.icon, this.name);

  @override
  Widget build(BuildContext context) {
    double width;
    if (name == "web")
      width = 400;
    else
      width = 300;
    return Container(
      width: width,
      height: 45,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 2, color: Colors.black54))),
              child: TextField(
                decoration: InputDecoration(
                  hintText: text,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Icon(icon, color: const Color(0xffFF5E28)),
          ),
        ],
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  final BuildContext context;
  final String text;
  AddButton(this.context, this.text);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Container(
            width: 120,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              shape: BoxShape.rectangle,
              color: const Color(0xffFF5E28),
            ),
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )));
  }
}

class SearchContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        shape: BoxShape.rectangle,
        color: Color(0xffE9ECF5),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: "Search",
          border: InputBorder.none,
          hintStyle: const TextStyle(color: Colors.black45),
          prefixIcon: Icon(Icons.search),
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
