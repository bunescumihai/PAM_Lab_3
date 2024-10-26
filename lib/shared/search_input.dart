import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  SearchInput({super.key});
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 14),
      child: Row(
        children: [
          Expanded(child: Container(
            height: 45,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Color(0xFFF1F3F4), // Light background color
              borderRadius: BorderRadius.circular(6), // Rounded corners
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                controller: _controller,
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Color(0xFF8D8DAA)), // Search icon
                  hintText: "Search barber's, haircut services...", // Placeholder text
                  hintStyle: TextStyle(color: Color(0xFF8D8DAA), fontSize: 14), // Placeholder text style
                  border: InputBorder.none, // Remove default border
                  contentPadding: EdgeInsets.only(top:10)
                ),
              ),
            ),
          )),
          Container(
            height: 45,
            width: 45,
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Color.fromRGBO(54, 48, 98, 1), // Button background color
              borderRadius: BorderRadius.circular(6), // Rounded corners
            ),
            child: IconButton(
              icon: Icon(Icons.tune, color: Colors.white, size: 20,), // Filter icon
              onPressed: () {
                // Action for filter button
              },
            ),
          ),
        ],
      ),
    );
  }
}
