import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'configs/environment.dart';
import 'models/authentication/authenticated_user.dart';
import 'routes.dart';
import 'services/authmanager/authmanager.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
  };

  //Initialize hive for local storage
  await Hive.initFlutter();

  Environment.fileName(await PackageInfo.fromPlatform());

  //loading environment variables.
  await dotenv.load();

  //Set orientation as potrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // final AuthenticatedUser? user =
  //     await AuthManager.instance.getAuthenticatedUser();

  runApp(const RestorationScope(
    restorationId: 'ng.sendme.farmer',
    child: ProviderScope(
      child: MyApp(
          //TODO: uncomment user if needed.
          // user: user,
          ),
    ),
  ));

  FlutterNativeSplash.remove();
}

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthenticatedUser?>(
      // initialData: user,
      stream: AuthManager.instance.streamActiveUser(),
      builder: (context, userSnapshot) {
        return ScreenUtilInit(
          //TODO update screen util sizes for given app.
          designSize: const Size(414, 896),
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Skeleton App',
              theme: theme(),
              navigatorObservers: [
                routeObserver,
              ],
              initialRoute: '/',
              routes: routes(user: userSnapshot.data),
              onGenerateRoute: generateRoutes,
            );
          },
        );
      },
    );
  }
}
