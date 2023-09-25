import '../../view_barrel_file.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height * 1;
    double width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomeUsernameTextWidget(),
            SizedBox(height: height * .02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormFieldWidget(
                hintText: 'Search for news',
                controller: controller,
                focusNode: focusNode,
                showSuffixIcon: true,
                suffixIconWidget: Icon(Icons.search),
                onFiledSubmittedValue: (newValue) {},
              ),
            ),
            SizedBox(height: height * .01),
            BreakingNewsTextWidget(),
            SizedBox(height: height * .02),
            BreakingNewsContainerWidget(),
            SizedBox(height: height * .01),
            TrendingNowTextWidget(),
            SizedBox(height: height * .02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CategoryTabsWidget(),
            ),
            SizedBox(height: height * .02),
            SizedBox(
              height: 500,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ShowNewsCardWidget();
                  }),
            )
          ],
        ),
      )),
    );
  }
}
