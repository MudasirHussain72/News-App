import 'package:news_app/view/view_barrel_file.dart';
import 'package:news_app/view_model/controllers/home_controller/home_controller.dart';

class ViewAllHeadlinesScreen extends StatefulWidget {
  const ViewAllHeadlinesScreen({super.key});

  @override
  State<ViewAllHeadlinesScreen> createState() => _ViewAllHeadlinesScreenState();
}

class _ViewAllHeadlinesScreenState extends State<ViewAllHeadlinesScreen> {
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
            body: Consumer<HomeController>(
              builder: (context, provider, child) {
                switch (provider.headlines.status!) {
                  case Status.loading:
                    return const LoadingWidget(
                      color: AppColors.primaryColor,
                    );
                  case Status.error:
                    return Text(
                      'Try again${provider.headlines.message}',
                      style: TextStyle(color: Colors.black),
                    );
                  case Status.completed:
                    return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: provider.headlines.data!.articles!.length,
                        itemBuilder: (context, index) {
                          var articleData =
                              provider.headlines.data!.articles![index];
                          return ShowNewsCardWidget(articleData: articleData);
                        });
                }
              },
            ), // Repleace ListView
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
                                'Breaking News!',
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
