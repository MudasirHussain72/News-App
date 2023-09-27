import 'package:news_app/view/view_barrel_file.dart';
import 'package:news_app/view_model/controllers/home_controller/home_controller.dart';

class HomeGeneralTab extends StatefulWidget {
  const HomeGeneralTab({super.key});

  @override
  State<HomeGeneralTab> createState() => _HomeGeneralTabState();
}

class _HomeGeneralTabState extends State<HomeGeneralTab> {
  @override
  void initState() {
    super.initState();
    var provider = Provider.of<HomeController>(context, listen: false);
    if (provider.general.data == null) {
      provider.getGeneralHeadlinesApi();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height * 1;
    double width = MediaQuery.sizeOf(context).width * 1;
    return Consumer<HomeController>(
      builder: (context, provider, child) {
        switch (provider.general.status!) {
          case Status.loading:
            return const LoadingWidget(
              color: AppColors.primaryColor,
            );
          case Status.error:
            return Text(
              'Try again${provider.general.message}',
              style: TextStyle(color: Colors.black),
            );
          case Status.completed:
            return SizedBox(
              height: height * .5,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: provider.general.data!.articles!.length,
                  itemBuilder: (context, index) {
                    var articleData = provider.general.data!.articles![index];
                    return ShowNewsCardWidget(articleData: articleData);
                  }),
            );
        }
      },
    );
  }
}
