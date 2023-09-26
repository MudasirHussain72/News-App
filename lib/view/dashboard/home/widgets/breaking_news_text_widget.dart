import 'package:flutter/material.dart';
import 'package:news_app/view/dashboard/home/view_all_headlines_screen.dart';
import 'package:news_app/view/view_barrel_file.dart';

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
          GestureDetector(
            onTap: () {
              PersistentNavBarNavigator.pushNewScreen(context,
                  screen: ViewAllHeadlinesScreen(), withNavBar: false);
            },
            child: Text(
              'View All',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
