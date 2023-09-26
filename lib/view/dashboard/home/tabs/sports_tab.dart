import 'package:news_app/view/view_barrel_file.dart';
import 'package:news_app/view_model/controllers/home_controller/home_controller.dart';

class HomeSportsTab extends StatefulWidget {
  const HomeSportsTab({super.key});

  @override
  State<HomeSportsTab> createState() => _HomeSportsTabState();
}

class _HomeSportsTabState extends State<HomeSportsTab> {
  @override
  void initState() {
    super.initState();
    var provider = Provider.of<HomeController>(context, listen: false);
    if (provider.sports.data == null) {
      provider.getSportsHeadlinesApi();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height * 1;
    double width = MediaQuery.sizeOf(context).width * 1;
    return Consumer<HomeController>(
      builder: (context, provider, child) {
        switch (provider.sports.status!) {
          case Status.loading:
            return const LoadingWidget(
              color: AppColors.primaryColor,
            );
          case Status.error:
            return Text(
              'Try again${provider.sports.message}',
              style: TextStyle(color: Colors.black),
            );
          case Status.completed:
            return SizedBox(
              height: height * .5,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: provider.sports.data!.articles!.length,
                  itemBuilder: (context, index) {
                    var articleData = provider.sports.data!.articles![index];
                    return ShowNewsCardWidget(articleData: articleData);
                  }),
            );
        }
      },
    );
  }
}
