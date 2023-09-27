import 'package:news_app/view/view_barrel_file.dart';
import 'package:news_app/view_model/controllers/home_controller/home_controller.dart';

class HomeEntertainmentTab extends StatefulWidget {
  const HomeEntertainmentTab({super.key});

  @override
  State<HomeEntertainmentTab> createState() => _HomeEntertainmentTabState();
}

class _HomeEntertainmentTabState extends State<HomeEntertainmentTab> {
  @override
  void initState() {
    super.initState();
    var provider = Provider.of<HomeController>(context, listen: false);
    if (provider.entertainment.data == null) {
      provider.getEntertainmentHeadlinesApi();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height * 1;
    double width = MediaQuery.sizeOf(context).width * 1;
    return Consumer<HomeController>(
      builder: (context, provider, child) {
        switch (provider.entertainment.status!) {
          case Status.loading:
            return const LoadingWidget(
              color: AppColors.primaryColor,
            );
          case Status.error:
            return Text(
              'Try again${provider.entertainment.message}',
              style: TextStyle(color: Colors.black),
            );
          case Status.completed:
            return SizedBox(
              height: height * .5,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: provider.entertainment.data!.articles!.length,
                  itemBuilder: (context, index) {
                    var articleData = provider.entertainment.data!.articles![index];
                    return ShowNewsCardWidget(articleData: articleData);
                  }),
            );
        }
      },
    );
  }
}
