import 'package:go_router/go_router.dart';
import '../features/auth/welcome_screen.dart';
import '../features/auth/signin_screen.dart';
import '../features/dashboard/presentation/dashboard_screen.dart';
import 'routes/app_routes.dart';

final consumerRouter = GoRouter(
  initialLocation: AppRoutes.welcome,
  routes: [
    GoRoute(
      path: AppRoutes.welcome,
      builder: (context, _) => const WelcomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.signIn,
      builder: (context, _) => const SignInScreen(),
    ),
    GoRoute(
      path: AppRoutes.dashboard,
      builder: (context, _) => const DashboardScreen(),
    ),
  ],
);
