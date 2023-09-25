import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/res/color/color.dart';

class BreakingNewsContainerWidget extends StatelessWidget {
  const BreakingNewsContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height * 1;
    double width = MediaQuery.sizeOf(context).width * 1;
    return CachedNetworkImage(
      imageUrl:
          "https://www.apple.com/newsroom/images/2023/09/apple-unveils-iphone-15-pro-and-iphone-15-pro-max/article/Apple-iPhone-15-Pro-lineup-hero-230912_Full-Bleed-Image.jpg.xlarge_2x.jpg",
      imageBuilder: (context, imageProvider) => Container(
        padding: EdgeInsets.all(20),
        height: height * .26,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black, BlendMode.color),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Apple unveils iPhone 15 Pro and iPhone 15 Pro Max',
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
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: AppColors.whiteColor),
                ),
                Text(
                  'Apple',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 12, color: AppColors.whiteColor),
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
                  'Sep 12 2023',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: AppColors.whiteColor),
                ),
                SizedBox(width: width * .05),
                Text(
                  '1 Hour ago',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 12, color: AppColors.whiteColor),
                ),
                SizedBox(width: width * .05),
                Text(
                  'Technology',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: AppColors.whiteColor),
                ),
              ],
            ),
          ],
        ),
      ),
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
