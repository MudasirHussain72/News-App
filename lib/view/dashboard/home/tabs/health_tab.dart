import 'package:news_app/view/view_barrel_file.dart';
import 'package:news_app/view_model/controllers/home_controller/home_controller.dart';

class HomeHealthTab extends StatefulWidget {
  const HomeHealthTab({super.key});

  @override
  State<HomeHealthTab> createState() => _HomeHealthTabState();
}

class _HomeHealthTabState extends State<HomeHealthTab> {
  @override
  void initState() {
    super.initState();
    var provider = Provider.of<HomeController>(context, listen: false);
    if (provider.health.data == null) {
      provider.getHealthHeadlinesApi();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height * 1;
    double width = MediaQuery.sizeOf(context).width * 1;
    return Consumer<HomeController>(
      builder: (context, provider, child) {
        switch (provider.health.status!) {
          case Status.loading:
            return const LoadingWidget(
              color: AppColors.primaryColor,
            );
          case Status.error:
            return Text(
              'Try again${provider.health.message}',
              style: TextStyle(color: Colors.black),
            );
          case Status.completed:
            return SizedBox(
              height: height * .5,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: provider.health.data!.articles!.length,
                  itemBuilder: (context, index) {
                    var articleData = provider.health.data!.articles![index];
                    return ShowNewsCardWidget(articleData: articleData);
                  }),
            );
        }
      },
    );
  }
}
