import 'package:flutter/material.dart';
import 'package:news_app/res/color/color.dart';
import 'package:news_app/res/components/shows_news_card_widget.dart';
import 'package:news_app/res/components/text_formfield_widget.dart';
import 'package:news_app/view/dashboard/explore/widgets/category_tabs_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height * 1;
    double width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * .02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Discover News',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 24),
              ),
            ),
            SizedBox(height: height * .02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormFieldWidget(
                hintText: 'Search for news',
                controller: controller,
                focusNode: focusNode,
                showSuffixIcon: true,
                suffixIconWidget: Icon(Icons.search),
                onFiledSubmittedValue: (newValue) {},
              ),
            ),
            SizedBox(height: height * .02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CategoryTabsWidget(),
            ),
            SizedBox(height: height * .02),
            Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ShowNewsCardWidget();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
