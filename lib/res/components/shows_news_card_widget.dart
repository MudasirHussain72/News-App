import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/models/hesdlines_model/headlines_model.dart';
import 'package:news_app/view/dashboard/news_detail/news_detail_Screen.dart';
import 'package:news_app/view/view_barrel_file.dart';
import 'package:timeago/timeago.dart' as timeago;

class ShowNewsCardWidget extends StatelessWidget {
  Articles articleData;
  ShowNewsCardWidget({
    super.key,
    required this.articleData,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height * 1;
    double width = MediaQuery.sizeOf(context).width * 1;
    return GestureDetector(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(context,
            screen: NewsDetailScreen(articleData: articleData),
            withNavBar: false);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(bottom: 10),
        height: height * .23,
        width: double.infinity,
        decoration: BoxDecoration(
            // color: AppColors.alertColor,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CachedNetworkImage(
              imageUrl: articleData.urlToImage != null
                  ? articleData.urlToImage.toString()
                  : '',
              imageBuilder: (context, imageProvider) => Container(
                height: height * .08,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      // colorFilter: ColorFilter.mode(
                      //     Colors.red, BlendMode.colorBurn),
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
              ),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Container(
              padding: EdgeInsets.all(12),
              height: height * .15,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.primaryLightColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // 'Apple unveils iPhone 15 Pro and iPhone 15 Pro Max',
                    articleData.title != null
                        ? articleData.title.toString()
                        : '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'by ',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontWeight: FontWeight.normal, fontSize: 12),
                      ),
                      Text(
                        // 'Apple',
                        articleData.source!.name != null
                            ? articleData.source!.name.toString()
                            : '',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 12),
                      ),
                      SizedBox(width: width * .2),
                      Text(
                        // '18 months ago',
                        articleData.publishedAt != null
                            ? timeago.format(DateTime.parse(
                                articleData.publishedAt.toString()))
                            : '',

                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontWeight: FontWeight.normal, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
