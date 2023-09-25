import 'package:news_app/view/view_barrel_file.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height * 1;
    double width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
            floatHeaderSlivers: true,
            physics: ClampingScrollPhysics(),
            body: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 100,
                itemBuilder: (context, index) {
                  return ShowNewsCardWidget();
                }), // Repleace ListView
            headerSliverBuilder: (BuildContext context,
                    bool innerBoxIsScrolled) =>
                [
                  SliverAppBar(
                      expandedHeight: height * .18,
                      // backgroundColor: Colors.white,
                      automaticallyImplyLeading: false,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: height * .02),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Saved News',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(fontSize: 24),
                              ),
                            ),
                            SizedBox(height: height * .02),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormFieldWidget(
                                hintText: 'Search for saved news',
                                controller: controller,
                                focusNode: focusNode,
                                showSuffixIcon: true,
                                suffixIconWidget: Icon(Icons.search),
                                onFiledSubmittedValue: (newValue) {},
                              ),
                            ),
                            SizedBox(height: height * .02),
                          ],
                        ),
                        // Repleace Widget
                      ))
                ]),
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage>
//     with SingleTickerProviderStateMixin {
//   TabController? _tabController;
//   ScrollController? _scrollViewController;
//   int selectedTab = 0;

//   TextEditingController controller = TextEditingController();
//   FocusNode focusNode = FocusNode();
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(vsync: this, length: 2);
//     _scrollViewController = ScrollController(initialScrollOffset: 0.0);
//   }

//   @override
//   void dispose() {
//     _tabController!.dispose();
//     _scrollViewController!.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.sizeOf(context).height * 1;
//     double width = MediaQuery.sizeOf(context).width * 1;
//     return Scaffold(
//       body: SafeArea(
//         child: NestedScrollView(
//           controller: _scrollViewController,
//           headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
//             return <Widget>[
//               SliverAppBar(
//                 expandedHeight: 180,
//                 flexibleSpace: FlexibleSpaceBar(
//                   background: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: Text(
//                           'Saved News',
//                           style: Theme.of(context)
//                               .textTheme
//                               .titleLarge!
//                               .copyWith(fontSize: 24),
//                         ),
//                       ),
//                       SizedBox(height: height * .02),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: TextFormFieldWidget(
//                           hintText: 'Search for saved news',
//                           controller: controller,
//                           focusNode: focusNode,
//                           showSuffixIcon: true,
//                           suffixIconWidget: Icon(Icons.search),
//                           onFiledSubmittedValue: (newValue) {},
//                         ),
//                       ),
//                       SizedBox(height: height * .02),
//                     ],
//                   ),
//                   // Repleace Widget
//                 ),
//                 pinned: true,
//                 floating: true,
//                 forceElevated: boxIsScrolled,
//                 bottom: TabBar(
//                   indicatorColor: Colors.transparent,
//                   labelPadding:
//                       EdgeInsets.only(left: 20, bottom: 0, right: 0, top: 0),
//                   isScrollable: true,
//                   onTap: (selectedIndex) {
//                     print(selectedIndex);
//                     selectedTab = selectedIndex;
//                     setState(() {});
//                   },
//                   tabs: [
//                     Tab(
//                         child: Container(
//                             padding: EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                   color: selectedTab == 0
//                                       ? AppColors.primaryColor
//                                       : AppColors.secondarydarkColor,
//                                   width: 1),
//                               borderRadius: BorderRadius.circular(20),
//                               color: selectedTab == 0
//                                   ? AppColors.primaryColor
//                                   : Colors.transparent,
//                             ),
//                             child: Text(
//                               'All Category',
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodySmall!
//                                   .copyWith(
//                                     color: selectedTab == 0
//                                         ? AppColors.secondaryColor
//                                         : AppColors.secondarydarkColor,
//                                   ),
//                             ))),
//                     Tab(
//                         child: Container(
//                             padding: EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                   color: selectedTab == 1
//                                       ? AppColors.primaryColor
//                                       : AppColors.secondarydarkColor,
//                                   width: 1),
//                               borderRadius: BorderRadius.circular(20),
//                               color: selectedTab == 1
//                                   ? AppColors.primaryColor
//                                   : Colors.transparent,
//                             ),
//                             child: Text(
//                               'Technology',
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodySmall!
//                                   .copyWith(
//                                     color: selectedTab == 1
//                                         ? AppColors.secondaryColor
//                                         : AppColors.secondarydarkColor,
//                                   ),
//                             ))),
//                     Tab(
//                         child: Container(
//                             padding: EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                   color: selectedTab == 2
//                                       ? AppColors.primaryColor
//                                       : AppColors.secondarydarkColor,
//                                   width: 1),
//                               borderRadius: BorderRadius.circular(20),
//                               color: selectedTab == 2
//                                   ? AppColors.primaryColor
//                                   : Colors.transparent,
//                             ),
//                             child: Text(
//                               'Gaming',
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodySmall!
//                                   .copyWith(
//                                     color: selectedTab == 2
//                                         ? AppColors.secondaryColor
//                                         : AppColors.secondarydarkColor,
//                                   ),
//                             ))),
//                     Tab(
//                         child: Container(
//                             padding: EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                   color: selectedTab == 3
//                                       ? AppColors.primaryColor
//                                       : AppColors.secondarydarkColor,
//                                   width: 1),
//                               borderRadius: BorderRadius.circular(20),
//                               color: selectedTab == 3
//                                   ? AppColors.primaryColor
//                                   : Colors.transparent,
//                             ),
//                             child: Text(
//                               'Bussiness',
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodySmall!
//                                   .copyWith(
//                                     color: selectedTab == 3
//                                         ? AppColors.secondaryColor
//                                         : AppColors.secondarydarkColor,
//                                   ),
//                             ))),
//                   ],
//                   controller: _tabController,
//                 ),
//               )
//             ];
//           },
//           body: TabBarView(
//             children: <Widget>[
//               PageOne(),
//               PageTwo(),
//             ],
//             controller: _tabController,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class PageOne extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemExtent: 250.0,
//       itemBuilder: (context, index) => Container(
//         padding: EdgeInsets.all(10.0),
//         child: Material(
//           elevation: 4.0,
//           borderRadius: BorderRadius.circular(5.0),
//           color: index % 2 == 0 ? Colors.cyan : Colors.deepOrange,
//           child: Center(
//             child: Text(index.toString()),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class PageTwo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         physics: BouncingScrollPhysics(),
//         itemCount: 10,
//         itemBuilder: (context, index) {
//           return ShowNewsCardWidget();
//         });
//   }
// }
