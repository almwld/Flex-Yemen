import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'providers/theme_manager.dart';
import 'providers/auth_provider.dart';
import 'services/connection_checker.dart';
import 'services/cache/local_storage_service.dart';
import 'theme/app_theme.dart';

// Screens
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/main_navigation.dart';
import 'screens/home_screen.dart';
import 'screens/search_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/all_ads_screen.dart';
import 'screens/ad_detail_screen.dart';
import 'screens/add_ad_screen.dart';
import 'screens/offers_screen.dart';
import 'screens/auctions_screen.dart';
import 'screens/wallet/wallet_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/chat_detail_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/account_info_screen.dart';
import 'screens/my_ads_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/my_orders_screen.dart';
import 'screens/order_detail_screen.dart';
import 'screens/product_review_screen.dart';
import 'screens/report_ad_screen.dart';
import 'screens/live_support_screen.dart';
import 'screens/faq_screen.dart';
import 'screens/contact_us_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/seller_profile_screen.dart';
import 'screens/seller/seller_dashboard.dart';
import 'screens/changelog_screen.dart';
import 'screens/following_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/settings/notifications_settings_screen.dart';
import 'screens/settings/security_settings_screen.dart';
import 'screens/settings/language_screen.dart';
import 'screens/settings/payment_methods_screen.dart';
import 'screens/settings/about_screen.dart';
import 'screens/settings/help_support_screen.dart';
import 'screens/garden_screen.dart';
import 'screens/map/interactive_map_screen.dart';
import 'screens/map/nearby_stores_screen.dart';

// Wallet Screens
import 'screens/wallet/deposit_screen.dart';
import 'screens/wallet/withdraw_screen.dart';
import 'screens/wallet/transfer_screen.dart';
import 'screens/wallet/payments_screen.dart';
import 'screens/wallet/transactions_screen.dart';
import 'screens/wallet/transfer_network_screen.dart';
import 'screens/wallet/entertainment_services_screen.dart';
import 'screens/wallet/games_screen.dart';
import 'screens/wallet/apps_screen.dart';
import 'screens/wallet/gift_cards_screen.dart';
import 'screens/wallet/amazon_gift_cards_screen.dart';
import 'screens/wallet/banks_wallets_screen.dart';
import 'screens/wallet/money_transfers_screen.dart';
import 'screens/wallet/government_payments_screen.dart';
import 'screens/wallet/jib_screen.dart';
import 'screens/wallet/cash_withdrawal_screen.dart';
import 'screens/wallet/universities_screen.dart';
import 'screens/wallet/recharge_payment_screen.dart';
import 'screens/wallet/recharge_credit_screen.dart';
import 'screens/wallet/pay_bundles_screen.dart';
import 'screens/wallet/internet_landline_screen.dart';
import 'screens/wallet/receive_transfer_request_screen.dart';

// Policy Screens
import 'screens/policy/privacy_policy_screen.dart';
import 'screens/policy/security_policy_screen.dart';
import 'screens/policy/terms_screen.dart';
import 'screens/policy/vendor_terms_screen.dart';

// Additional Screens
import 'screens/checkout_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/add_address_screen.dart';
import 'screens/payment_method_screen.dart';
import 'screens/track_order_screen.dart';
import 'screens/invoice_screen.dart';
import 'screens/pick_location_screen.dart';
import 'screens/order_success_screen.dart';
import 'screens/seller_products_screen.dart';
import 'screens/seller_orders_screen.dart';
import 'screens/seller_analytics_screen.dart';
import 'screens/seller_reviews_screen.dart';
import 'screens/seller_payouts_screen.dart';
import 'screens/followers_screen.dart';
import 'screens/reviews_screen.dart';
import 'screens/share_app_screen.dart';
import 'screens/invite_friends_screen.dart';
import 'screens/support_tickets_screen.dart';
import 'screens/report_problem_screen.dart';
import 'screens/ad_stats_screen.dart';
import 'screens/earnings_screen.dart';
import 'screens/spending_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/walkthrough_screen.dart';
import 'screens/change_password_screen.dart';
import 'screens/two_factor_screen.dart';
import 'screens/biometric_auth_screen.dart';
import 'screens/connected_devices_screen.dart';
import 'screens/login_history_screen.dart';
import 'screens/privacy_settings_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // تهيئة التخزين المحلي فوراً
  await LocalStorageService.init();

  // تحميل متغيرات البيئة
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    debugPrint('Warning: .env file not found');
  }

  // تهيئة Supabase في الخلفية بعد 10 ثواني
  _initSupabaseDelayed();

  // إعدادات النظام
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

Future<void> _initSupabaseDelayed() async {
  await Future.delayed(const Duration(seconds: 10));
  try {
    final url = dotenv.env['SUPABASE_URL'];
    final anonKey = dotenv.env['SUPABASE_ANON_KEY'];
    if (url != null && anonKey != null) {
      await Supabase.initialize(url: url, anonKey: anonKey);
      debugPrint('Supabase initialized successfully');
    }
  } catch (e) {
    debugPrint('Supabase initialization error: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeManager()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ConnectionChecker()),
      ],
      child: Consumer<ThemeManager>(
        builder: (context, themeManager, child) {
          return MaterialApp(
            title: 'Flex Yemen',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeManager.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            locale: const Locale('ar', 'YE'),
            builder: (context, child) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: child!,
              );
            },
            initialRoute: '/',
            routes: {
              // Main Routes
              '/': (context) => const SplashScreen(),
              '/login': (context) => const LoginScreen(),
              '/register': (context) => const RegisterScreen(),
              '/main': (context) => const MainNavigation(),
              '/home': (context) => const HomeScreen(),
              '/search': (context) => const SearchScreen(),
              '/notifications': (context) => const NotificationsScreen(),
              '/all_ads': (context) => const AllAdsScreen(),
              '/ad_detail': (context) => const AdDetailScreen(),
              '/add_ad': (context) => const AddAdScreen(),
              '/offers': (context) => const OffersScreen(),
              '/auctions': (context) => const AuctionsScreen(),
              '/wallet': (context) => const WalletScreen(),
              '/chat': (context) => const ChatScreen(),
              '/chat_detail': (context) => const ChatDetailScreen(),
              '/profile': (context) => const ProfileScreen(),
              '/account_info': (context) => const AccountInfoScreen(),
              '/my_ads': (context) => const MyAdsScreen(),
              '/favorites': (context) => const FavoritesScreen(),
              '/my_orders': (context) => const MyOrdersScreen(),
              '/order_detail': (context) => const OrderDetailScreen(),
              '/product_review': (context) => const ProductReviewScreen(),
              '/report_ad': (context) => const ReportAdScreen(),
              '/live_support': (context) => const LiveSupportScreen(),
              '/faq': (context) => const FaqScreen(),
              '/contact_us': (context) => const ContactUsScreen(),
              '/categories': (context) => const CategoriesScreen(),
              '/seller_profile': (context) => const SellerProfileScreen(),
              '/seller_dashboard': (context) => const SellerDashboard(),
              '/changelog': (context) => const ChangelogScreen(),
              '/following': (context) => const FollowingScreen(),
              '/settings': (context) => const SettingsScreen(),
              '/notifications_settings': (context) => const NotificationsSettingsScreen(),
              '/security_settings': (context) => const SecuritySettingsScreen(),
              '/language': (context) => const LanguageScreen(),
              '/payment_methods': (context) => const PaymentMethodsScreen(),
              '/about': (context) => const AboutScreen(),
              '/garden': (context) => const GardenScreen(),
              '/map': (context) => const InteractiveMapScreen(),
              '/nearby_stores': (context) => const NearbyStoresScreen(),

              // Wallet Routes
              '/deposit': (context) => const DepositScreen(),
              '/withdraw': (context) => const WithdrawScreen(),
              '/transfer': (context) => const TransferScreen(),
              '/payments': (context) => const PaymentsScreen(),
              '/transactions': (context) => const TransactionsScreen(),
              '/transfer_network': (context) => const TransferNetworkScreen(),
              '/entertainment': (context) => const EntertainmentServicesScreen(),
              '/games': (context) => const GamesScreen(),
              '/apps': (context) => const AppsScreen(),
              '/gift_cards': (context) => const GiftCardsScreen(),
              '/amazon_gift_cards': (context) => const AmazonGiftCardsScreen(),
              '/banks_wallets': (context) => const BanksWalletsScreen(),
              '/money_transfers': (context) => const MoneyTransfersScreen(),
              '/government_payments': (context) => const GovernmentPaymentsScreen(),
              '/jib': (context) => const JibScreen(),
              '/cash_withdrawal': (context) => const CashWithdrawalScreen(),
              '/universities': (context) => const UniversitiesScreen(),
              '/recharge_payment': (context) => const RechargePaymentScreen(),
              '/recharge_credit': (context) => const RechargeCreditScreen(),
              '/pay_bundles': (context) => const PayBundlesScreen(),
              '/internet_landline': (context) => const InternetLandlineScreen(),
              '/receive_transfer': (context) => const ReceiveTransferRequestScreen(),

              // Policy Routes
              '/privacy_policy': (context) => const PrivacyPolicyScreen(),
              '/security_policy': (context) => const SecurityPolicyScreen(),
              '/terms': (context) => const TermsScreen(),
              '/vendor_terms': (context) => const VendorTermsScreen(),

              // Additional Routes
              '/checkout': (context) => const CheckoutScreen(),
              '/cart': (context) => const CartScreen(),
              '/add_address': (context) => const AddAddressScreen(),
              '/payment_method': (context) => const PaymentMethodScreen(),
              '/track_order': (context) => const TrackOrderScreen(),
              '/invoice': (context) => const InvoiceScreen(),
              '/pick_location': (context) => const PickLocationScreen(),
              '/order_success': (context) => const OrderSuccessScreen(),
              '/seller_products': (context) => const SellerProductsScreen(),
              '/seller_orders': (context) => const SellerOrdersScreen(),
              '/seller_analytics': (context) => const SellerAnalyticsScreen(),
              '/seller_reviews': (context) => const SellerReviewsScreen(),
              '/seller_payouts': (context) => const SellerPayoutsScreen(),
              '/followers': (context) => const FollowersScreen(),
              '/reviews': (context) => const ReviewsScreen(),
              '/share_app': (context) => const ShareAppScreen(),
              '/invite_friends': (context) => const InviteFriendsScreen(),
              '/support_tickets': (context) => const SupportTicketsScreen(),
              '/report_problem': (context) => const ReportProblemScreen(),
              '/ad_stats': (context) => const AdStatsScreen(),
              '/earnings': (context) => const EarningsScreen(),
              '/spending': (context) => const SpendingScreen(),
              '/onboarding': (context) => const OnboardingScreen(),
              '/walkthrough': (context) => const WalkthroughScreen(),
              '/change_password': (context) => const ChangePasswordScreen(),
              '/two_factor': (context) => const TwoFactorScreen(),
              '/biometric_auth': (context) => const BiometricAuthScreen(),
              '/connected_devices': (context) => const ConnectedDevicesScreen(),
              '/login_history': (context) => const LoginHistoryScreen(),
              '/privacy_settings': (context) => const PrivacySettingsScreen(),
            },
          );
        },
      ),
    );
  }
}
