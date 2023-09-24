import 'package:flutter/services.dart';
import 'package:news_app/res/constants.dart';
import 'package:news_app/res/theme/light_theme.dart';
import 'package:news_app/utils/routes/routes.dart';
import 'package:news_app/utils/routes/routes_barrel_file.dart';
import 'package:news_app/view/view_barrel_file.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  //setting app orientation in portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        title: applicationName,
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        initialRoute: RouteName.splashScreen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
