import 'package:flutter/material.dart';

class BreakingNewsTextWidget extends StatelessWidget {
  const BreakingNewsTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'Breaking News!',
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20),
          ),
          Text(
            'View All',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
          ),
        ],
      ),
    );
  }
}
