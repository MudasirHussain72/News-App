import 'package:news_app/view/view_barrel_file.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    //calling function to check if user is already widget or in splash screen
    splashServices.splashService(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: // Load a Lottie file from your assets
            Lottie.asset(
          ImageAssets.splashAnimatedLogo,
          // height: 100, width: 100,
        ),
      ),
    );
  }
}
