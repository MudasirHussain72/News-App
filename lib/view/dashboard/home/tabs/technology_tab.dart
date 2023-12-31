import 'package:news_app/view/view_barrel_file.dart';
import 'package:news_app/view_model/controllers/home_controller/home_controller.dart';

class HomeTechnologyTab extends StatefulWidget {
  const HomeTechnologyTab({super.key});

  @override
  State<HomeTechnologyTab> createState() => _HomeTechnologyTabState();
}

class _HomeTechnologyTabState extends State<HomeTechnologyTab> {
  @override
  void initState() {
    super.initState();
    var provider = Provider.of<HomeController>(context, listen: false);
    if (provider.technology.data == null) {
      provider.getTechnologyHeadlinesApi();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height * 1;
    double width = MediaQuery.sizeOf(context).width * 1;
    return Consumer<HomeController>(
      builder: (context, provider, child) {
        switch (provider.technology.status!) {
          case Status.loading:
            return const LoadingWidget(
              color: AppColors.primaryColor,
            );
          case Status.error:
            return Text(
              'Try again${provider.technology.message}',
              style: TextStyle(color: Colors.black),
            );
          case Status.completed:
            return SizedBox(
              height: height * .5,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: provider.technology.data!.articles!.length,
                  itemBuilder: (context, index) {
                    var articleData =
                        provider.technology.data!.articles![index];
                    return ShowNewsCardWidget(articleData: articleData);
                  }),
            );
        }
      },
    );
  }
}
