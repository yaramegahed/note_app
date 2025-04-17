import 'package:flutter/material.dart';

class SearchConditions extends StatelessWidget {
  final String conditionText;

  const SearchConditions({
    super.key,
    required this.conditionText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        children: [
          Text(
            "Notes",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Text(
            "Try typing to search",
            style: TextStyle(fontSize: 16,color: Color(0xFFFF8383)),
          ),
        ],
      ),
    );
  }
}