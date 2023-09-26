import 'package:news_app/view/dashboard/home/tabs/bussiness_tab.dart';
import 'package:news_app/view/dashboard/home/tabs/entertainment_tab.dart';
import 'package:news_app/view/dashboard/home/tabs/general_tab.dart';
import 'package:news_app/view/dashboard/home/tabs/health_tab.dart';
import 'package:news_app/view/dashboard/home/tabs/science_tab.dart';
import 'package:news_app/view/dashboard/home/tabs/sports_tab.dart';
import 'package:news_app/view/dashboard/home/tabs/technology_tab.dart';
import 'package:news_app/view_model/controllers/home_controller/home_controller.dart';

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
  void initState() {
    super.initState();
    var provider = Provider.of<HomeController>(context, listen: false);
    if (provider.headlines.data == null) {
      provider.getHeadlinesApi();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height * 1;
    double width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Consumer<HomeController>(
          builder: (context, value, child) => Column(
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
                child: SizedBox(height: 36, child: CategoryTabsWidget()),
              ),
              SizedBox(height: height * .02),
              if (value.selectedTapOption == value.tabText[0])
                HomeBussinessTab(),
              if (value.selectedTapOption == value.tabText[1])
                HomeEntertainmentTab(),
              if (value.selectedTapOption == value.tabText[2]) HomeGeneralTab(),
              if (value.selectedTapOption == value.tabText[3]) HomeHealthTab(),
              if (value.selectedTapOption == value.tabText[4]) HomeScienceTab(),
              if (value.selectedTapOption == value.tabText[5]) HomeSportsTab(),
              if (value.selectedTapOption == value.tabText[6])
                HomeTechnologyTab(),
            ],
          ),
        ),
      )),
    );
  }
}
