import 'package:news_app/view/view_barrel_file.dart';

class DashboardScreen extends StatefulWidget {
  // final Animation<double> animation;
  final animation;
  const DashboardScreen({super.key, this.animation});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  final controler = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScren() {
    return const [
      HomeScreen(),
      ExploreScreen(),
      SavedScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItem() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/icons/house_fill.svg',
          height: 26,
          width: 26,
          // color: Colors.white,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        inactiveIcon: SvgPicture.asset(
          'assets/icons/house.svg',
          height: 26,
          width: 26,
          // color: Colors.white,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        activeColorPrimary: AppColors.alertColor,
        inactiveColorPrimary: AppColors.whiteColor,
        activeColorSecondary: AppColors.primaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.explore,
          size: 26,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        activeColorPrimary: AppColors.alertColor,
        inactiveColorPrimary: AppColors.whiteColor,
        activeColorSecondary: AppColors.primaryColor,
        inactiveIcon: Icon(
          Icons.explore_outlined,
          size: 26,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.bookmark,
          size: 26,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        activeColorPrimary: AppColors.alertColor,
        inactiveColorPrimary: AppColors.whiteColor,
        activeColorSecondary: AppColors.primaryColor,
        inactiveIcon: Icon(
          Icons.bookmark_border,
          size: 26,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
    ];
  }

  bool visible = false;
  bool selected = false;
  @override
  void initState() {
    super.initState();
    widget.animation.addListener(() {
      if (widget.animation.value > .3) {
        setState(() {
          visible = true;
        });
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        selected = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScren(),
      items: _navBarItem(),
      controller: controler,
      // backgroundColor: Colors.grey.shade900,
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(0.0),
        colorBehindNavBar: AppColors.iconBlueColor,
      ),
      navBarStyle: NavBarStyle.style3,
    );
  }
}
