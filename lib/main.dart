import 'package:Hotelino/bootstrap.dart';
import 'package:Hotelino/core/theme/app_theme.dart';
import 'package:Hotelino/core/theme/theme_provider.dart';
import 'package:Hotelino/features/booking/presentation/booking_provider.dart';
import 'package:Hotelino/features/home/data/repositories/hotel_repository.dart';
import 'package:Hotelino/features/home/data/repositories/profile_repository.dart';
import 'package:Hotelino/features/home/presentation/provider/favorite_item_provider.dart';
import 'package:Hotelino/features/home/presentation/provider/home_provider.dart';
import 'package:Hotelino/features/home/presentation/provider/profile_provider.dart';
import 'package:Hotelino/features/onboarding/data/repositories/onboarding_repository.dart';
import 'package:Hotelino/features/onboarding/presentation/onboarding_provider.dart';
import 'package:Hotelino/routes/app_route.dart';
import 'package:Hotelino/shared/services/json_data_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:provider/provider.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await lazyBootStrap();
  FlutterNativeSplash.remove();
 
  final hotelRepository = HotelRepository(jsonDataService: JsonDataService());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(
            WidgetsBinding.instance.platformDispatcher.platformBrightness,
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => OnboardingProvider(OnboardingRepository()),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeProvider(hotelRepository)),
          ChangeNotifierProvider(
            create: (_)=>ProfileProvider(ProfileRepository(),hotelRepository)),
            ChangeNotifierProvider(
              create: (_)=>FavoriteItemProvider(hotelRepository)),
            ChangeNotifierProvider(
              create: (_)=>BookingProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();

    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    Provider.of<ThemeProvider>(
      context,
      listen: false,
    ).updateBrightness(brightness);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeModeProvidr, child) {
        return MaterialApp(
          title: 'Hotelino',
          locale: const Locale("fa", "IR"),
      supportedLocales: const [
        Locale("fa", "IR"),
        Locale("en", "US"),
      ],
      localizationsDelegates: const [
        PersianMaterialLocalizations.delegate,
        PersianCupertinoLocalizations.delegate,
      ],
          theme: themeModeProvidr.brightness == Brightness.light
              ? AppTheme.LightTheme
              : AppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          routes: AppRoute.routes,
          initialRoute: AppRoute.onboarding,
        );
      },
    );
  }
}
