import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/view/dashboard/news_detail/news_detail_screen.dart';
import 'package:news_app/view/view_barrel_file.dart';
import 'package:news_app/view_model/controllers/home_controller/home_controller.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class BreakingNewsContainerWidget extends StatelessWidget {
  const BreakingNewsContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height * 1;
    double width = MediaQuery.sizeOf(context).width * 1;
    return Consumer<HomeController>(builder: (context, value, child) {
      switch (value.headlines.status!) {
        case Status.loading:
          return const LoadingWidget(
            color: AppColors.primaryColor,
          );
        case Status.error:
          return Text(
            'Try again${value.headlines.message}',
            style: TextStyle(color: Colors.black),
          );
        case Status.completed:
          return GestureDetector(
            onTap: () {
              PersistentNavBarNavigator.pushNewScreen(context,
                  screen: NewsDetailScreen(
                      articleData: value.headlines.data!.articles![0]),
                  withNavBar: false);
            },
            child: CachedNetworkImage(
              // imageUrl:
              //     "https://www.apple.com/newsroom/images/2023/09/apple-unveils-iphone-15-pro-and-iphone-15-pro-max/article/Apple-iPhone-15-Pro-lineup-hero-230912_Full-Bleed-Image.jpg.xlarge_2x.jpg",
              imageUrl:
                  value.headlines.data!.articles![0].urlToImage.toString(),
              imageBuilder: (context, imageProvider) => Container(
                padding: EdgeInsets.all(20),
                height: height * .26,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    colorFilter:
                        ColorFilter.mode(Colors.black, BlendMode.color),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // 'Apple unveils iPhone 15 Pro and iPhone 15 Pro Max',
                      value.headlines.data!.articles![0].title.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 16, color: AppColors.whiteColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'by ',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  color: AppColors.whiteColor),
                        ),
                        Text(
                          // 'Apple',
                          value.headlines.data!.articles![0].author.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 12, color: AppColors.whiteColor),
                        ),
                        // SizedBox(width: width * .2),
                        // Text(
                        //   '18 months ago',
                        //   style: Theme.of(context)
                        //       .textTheme
                        //       .titleMedium!
                        //       .copyWith(
                        //           fontWeight: FontWeight.normal,
                        //           fontSize: 12,
                        //           color: AppColors.whiteColor),
                        // ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // 'Sep 12 2023',
                          // value.headlines.data!.articles![0].publishedAt
                          //     .toString(),
                          DateFormat('MMM d y')
                              .format(DateTime.parse(value
                                  .headlines.data!.articles![0].publishedAt
                                  .toString()))
                              .toString(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  color: AppColors.whiteColor),
                        ),
                        SizedBox(width: width * .05),
                        Text(
                          // '1 Hour ago',
                          timeago.format(DateTime.parse(value
                              .headlines.data!.articles![0].publishedAt
                              .toString())),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 12, color: AppColors.whiteColor),
                        ),
                        SizedBox(width: width * .05),
                        Text(
                          // 'Technology',
                          value.headlines.data!.articles![0].source!.name
                              .toString(),
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  color: AppColors.whiteColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              placeholder: (context, url) => Center(child: LoadingWidget()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          );
      }
    });
  }
}
