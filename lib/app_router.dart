import 'package:go_router/go_router.dart';
import 'package:uttam_toys/providers/user_data_provider.dart';
import 'package:uttam_toys/views/screens/add_age_screen.dart';
import 'package:uttam_toys/views/screens/add_brand_screen.dart';
import 'package:uttam_toys/views/screens/add_sub_category_screen.dart';
import 'package:uttam_toys/views/screens/age_screen.dart';
import 'package:uttam_toys/views/screens/brand_screen.dart';
import 'package:uttam_toys/views/screens/dashboard_screen.dart';
import 'package:uttam_toys/views/screens/error_screen.dart';
import 'package:uttam_toys/views/screens/personal_profile_screen.dart';
import 'package:uttam_toys/views/screens/login_screen.dart';
import 'package:uttam_toys/views/screens/logout_screen.dart';
import 'package:uttam_toys/views/screens/my_profile_screen.dart';
import 'package:uttam_toys/views/screens/requirement_screen.dart';
import 'package:uttam_toys/views/screens/category_screen.dart';
import 'package:uttam_toys/views/screens/sub_category_screen.dart';
import 'package:uttam_toys/views/screens/user_story_screen.dart';
import 'package:uttam_toys/views/screens/view_booking_screen.dart';
import 'package:uttam_toys/views/screens/view_product_service.dart';
import 'package:uttam_toys/views/screens/view_profile_details_personal.dart';

import 'views/screens/add_category_screen.dart';

class RouteUri {
  static const String home = '/';
  static const String dashboard = '/dashboard';
  static const String myProfile = '/my-profile';
  static const String logout = '/logout';
  static const String error404 = '/404';
  static const String login = '/login';
  static const String addCategory = '/Category';
  static const String age = '/Age';
  static const String brand = '/Brand';
  static const String SubCategory = '/SubCategory';
  static const String personalprofile = '/personalprofile';
  static const String userRequirement = '/userRequirement:userId';
  static const String userProductService = '/userProductService:userId';
  static const String userProfile = '/userProfile:userId';
  static const String addCatgeoryScreen = '/addCatgeoryScreen';
  static const String addBrandScreen = '/addBrandScreen';
  static const String addAgeScreen = '/addAgeScreen';
  static const String addSubCatgeoryScreen = '/addSubCatgeoryScreen';
  static const String requirementdetails = '/requirementdetails:userId';
  static const String userStory = '/userStory:userId';

}

const List<String> unrestrictedRoutes = [
  RouteUri.error404,
  RouteUri.logout,
  RouteUri.login, // Remove this line for actual authentication flow.
];

const List<String> publicRoutes = [
  // RouteUri.login, // Enable this line for actual authentication flow.
  // RouteUri.register, // Enable this line for actual authentication flow.
];

GoRouter appRouter(UserDataProvider userDataProvider) {
  return GoRouter(
    initialLocation: RouteUri.home,
    errorPageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const ErrorScreen(),
    ),
    routes: [
      GoRoute(
        path: RouteUri.home,
        redirect: (context, state) => RouteUri.dashboard,
      ),
      GoRoute(
        path: RouteUri.dashboard,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const DashboardScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.myProfile,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const MyProfileScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.logout,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const LogoutScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.addCategory,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const CategoryScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.age,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const AgeScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.brand,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const BrandScreen(),
        ),
      ),

      GoRoute(
        path: RouteUri.SubCategory,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const SubCategoryScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.personalprofile,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const PersonalProfile(),
        ),
      ),
      GoRoute(
        name: "userRequirement",
        path: RouteUri.userRequirement,
        builder: (context, state) => RequirementScreen(
          userId: state.pathParameters["userId"]!,
        ),
      ),
      GoRoute(
        name: "userProductService",
        path: RouteUri.userProductService,
        builder: (context, state) => ViewProductService(
          userId: state.pathParameters["userId"]!,
        ),
      ),
      GoRoute(
        name: "userProfile",
        path: RouteUri.userProfile,
        builder: (context, state) => ViewProfileDetails(
          userId: state.pathParameters["userId"]!,
        ),
      ),
      GoRoute(
        name: "requirementdetails",
        path: RouteUri.requirementdetails,
        builder: (context, state) => ViewBookingScreen(
          userId: state.pathParameters["userId"]!,
        ),
      ),
      GoRoute(
        name: "addCatgeoryScreen",
        path: RouteUri.addCatgeoryScreen,
        builder: (context, state) => AddCatgeoryScreen(),
      ),
      GoRoute(
        name: "addBrandScreen",
        path: RouteUri.addBrandScreen,
        builder: (context, state) => AddBrandScreen(),
      ),
      GoRoute(
        name: "addAgeScreen",
        path: RouteUri.addAgeScreen,
        builder: (context, state) => AddAgeScreen(),
      ),
      GoRoute(
        name: "addSubCatgeoryScreen",
        path: RouteUri.addSubCatgeoryScreen,
        builder: (context, state) => AddSubCatgeoryScreen(),
      ),
      GoRoute(
        name: "userStory",
        path: RouteUri.userStory,
        builder: (context, state) => UserStoryScreen(
          userId: state.pathParameters["userId"]!,
        ),
      ),
      GoRoute(
        path: RouteUri.login,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const LoginScreen(),
        ),
      ),
    ],
    redirect: (context, state) {
      if (unrestrictedRoutes.contains(state.matchedLocation)) {
        return null;
      } else if (publicRoutes.contains(state.matchedLocation)) {
        // Is public route.
        if (userDataProvider.isUserLoggedIn()) {
          // User is logged in, redirect to home page.
          return RouteUri.home;
        }
      } else {
        // Not public route.
        if (!userDataProvider.isUserLoggedIn()) {
          // User is not logged in, redirect to login page.
          return RouteUri.login;
        }
      }

      return null;
    },
  );
}
