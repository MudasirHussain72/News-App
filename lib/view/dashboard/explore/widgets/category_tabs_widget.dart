import 'package:flutter/material.dart';
import 'package:news_app/res/color/color.dart';
import 'package:news_app/view/view_barrel_file.dart';
import 'package:news_app/view_model/controllers/home_controller/home_controller.dart';

class CategoryTabsWidget extends StatefulWidget {
  const CategoryTabsWidget({super.key});

  @override
  State<CategoryTabsWidget> createState() => _CategoryTabsWidgetState();
}

class _CategoryTabsWidgetState extends State<CategoryTabsWidget> {
  // int selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   length: 4,
    //   child: TabBar(
    //       labelPadding: EdgeInsets.all(0),
    //       // padding: EdgeInsets.all(0),
    //       onTap: (selectedIndex) {
    //         print(selectedIndex);
    //         selectedTab = selectedIndex;
    //         setState(() {});
    //       },
    //       indicatorColor: Colors.transparent,
    //       isScrollable: true,
    //       tabs: [
    //         Tab(
    //             child: Container(
    //                 padding: EdgeInsets.all(10),
    //                 margin: EdgeInsets.only(right: 10),
    //                 decoration: BoxDecoration(
    //                   border: Border.all(
    //                       color: selectedTab == 0
    //                           ? AppColors.primaryColor
    //                           : AppColors.secondarydarkColor,
    //                       width: 1),
    //                   borderRadius: BorderRadius.circular(20),
    //                   color: selectedTab == 0
    //                       ? AppColors.primaryColor
    //                       : Colors.transparent,
    //                 ),
    //                 child: Text(
    //                   'All Category',
    //                   style: Theme.of(context).textTheme.bodySmall!.copyWith(
    //                         color: selectedTab == 0
    //                             ? AppColors.secondaryColor
    //                             : AppColors.secondarydarkColor,
    //                       ),
    //                 ))),
    //         Tab(
    //             child: Container(
    //                 padding: EdgeInsets.all(10),
    //                 margin: EdgeInsets.only(right: 10),
    //                 decoration: BoxDecoration(
    //                   border: Border.all(
    //                       color: selectedTab == 1
    //                           ? AppColors.primaryColor
    //                           : AppColors.secondarydarkColor,
    //                       width: 1),
    //                   borderRadius: BorderRadius.circular(20),
    //                   color: selectedTab == 1
    //                       ? AppColors.primaryColor
    //                       : Colors.transparent,
    //                 ),
    //                 child: Text(
    //                   'Technology',
    //                   style: Theme.of(context).textTheme.bodySmall!.copyWith(
    //                         color: selectedTab == 1
    //                             ? AppColors.secondaryColor
    //                             : AppColors.secondarydarkColor,
    //                       ),
    //                 ))),
    //         Tab(
    //             child: Container(
    //                 padding: EdgeInsets.all(10),
    //                 margin: EdgeInsets.only(right: 10),
    //                 decoration: BoxDecoration(
    //                   border: Border.all(
    //                       color: selectedTab == 2
    //                           ? AppColors.primaryColor
    //                           : AppColors.secondarydarkColor,
    //                       width: 1),
    //                   borderRadius: BorderRadius.circular(20),
    //                   color: selectedTab == 2
    //                       ? AppColors.primaryColor
    //                       : Colors.transparent,
    //                 ),
    //                 child: Text(
    //                   'Gaming',
    //                   style: Theme.of(context).textTheme.bodySmall!.copyWith(
    //                         color: selectedTab == 2
    //                             ? AppColors.secondaryColor
    //                             : AppColors.secondarydarkColor,
    //                       ),
    //                 ))),
    //         Tab(
    //             child: Container(
    //                 padding: EdgeInsets.all(10),
    //                 decoration: BoxDecoration(
    //                   border: Border.all(
    //                       color: selectedTab == 3
    //                           ? AppColors.primaryColor
    //                           : AppColors.secondarydarkColor,
    //                       width: 1),
    //                   borderRadius: BorderRadius.circular(20),
    //                   color: selectedTab == 3
    //                       ? AppColors.primaryColor
    //                       : Colors.transparent,
    //                 ),
    //                 child: Text(
    //                   'Bussiness',
    //                   style: Theme.of(context).textTheme.bodySmall!.copyWith(
    //                         color: selectedTab == 3
    //                             ? AppColors.secondaryColor
    //                             : AppColors.secondarydarkColor,
    //                       ),
    //                 ))),
    //       ]),
    // );
    return Consumer<HomeController>(
      builder: (context, value, child) => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: value.tabText.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                value.setSelectedTabOption(value.tabText[index]);
              },
              child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: value.selectedTapOption == value.tabText[index]
                            ? AppColors.primaryColor
                            : AppColors.secondarydarkColor,
                        width: 1),
                    borderRadius: BorderRadius.circular(20),
                    color: value.selectedTapOption == value.tabText[index]
                        ? AppColors.primaryColor
                        : Colors.transparent,
                  ),
                  child: Text(
                    value.tabText[index],
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: value.selectedTapOption == value.tabText[index]
                              ? AppColors.secondaryColor
                              : AppColors.secondarydarkColor,
                        ),
                  )),
            );
          }),
    );
  }
}
