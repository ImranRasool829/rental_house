import 'package:go_router/go_router.dart';
import 'package:rental_house_land_app/main.dart';
import 'package:rental_house_land_app/screens/auth/forget_password.dart';
import 'package:rental_house_land_app/screens/auth/registration.dart';
import 'package:rental_house_land_app/screens/dashboard/home.dart';
import 'package:rental_house_land_app/screens/setting/profile.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const LoginScreen()),
      GoRoute(path: '/dashboard', builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/forget_password',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: '/registration',
        builder: (context, state) => const RegistrationScreen(),
      ),



    ],
  );
}
