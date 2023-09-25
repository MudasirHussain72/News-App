import 'package:flutter/material.dart';
import 'package:news_app/res/assets_name/image_assets.dart';
import 'package:news_app/res/color/color.dart';

class WelcomeUsernameTextWidget extends StatelessWidget {
  const WelcomeUsernameTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        leading:
            CircleAvatar(backgroundImage: AssetImage(ImageAssets.userIamge)),
        title: Text(
          'Welcome',
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: AppColors.secondarydarkColor),
        ),
        subtitle: Text(
          'Mudasir Hussain',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16),
        ),
      ),
    );
  }
}
