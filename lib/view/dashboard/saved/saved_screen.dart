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
                  // return ShowNewsCardWidget();
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
