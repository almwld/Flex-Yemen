import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_button.dart';
import '../providers/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

  Future<void> _login() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى إدخال البريد الإلكتروني وكلمة المرور')),
      );
      return;
    }

    setState(() => _isLoading = true);

    // Simulate login
    await Future.delayed(const Duration(seconds: 2));

    final userData = {
      'name': 'أحمد محمد',
      'email': _emailController.text,
      'avatar': null,
      'phone': '777123456',
    };

    if (!mounted) return;

    await context.read<AuthProvider>().login(userData);

    Navigator.pushReplacementNamed(context, '/main');
  }

  Future<void> _loginAsGuest() async {
    setState(() => _isLoading = true);

    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;

    await context.read<AuthProvider>().loginAsGuest();

    Navigator.pushReplacementNamed(context, '/main');
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // Logo
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppTheme.goldColor, AppTheme.goldLight],
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(Icons.shopping_bag, size: 50, color: Colors.black),
              )
                  .animate()
                  .scale(duration: 600.ms, curve: Curves.easeOutBack),

              const SizedBox(height: 32),

              // Title
              Text(
                'تسجيل الدخول',
                style: TextStyle(
                  fontFamily: 'Changa',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.getTextColor(context),
                ),
              )
                  .animate()
                  .fadeIn(delay: 200.ms)
                  .slideY(begin: 0.2, end: 0, delay: 200.ms),

              const SizedBox(height: 8),

              Text(
                'أهلاً بعودتك! سجل دخول للمتابعة',
                style: TextStyle(
                  fontSize: 14,
                  color: AppTheme.getSecondaryTextColor(context),
                ),
              )
                  .animate()
                  .fadeIn(delay: 300.ms),

              const SizedBox(height: 40),

              // Email Field
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'البريد الإلكتروني',
                  prefixIcon: const Icon(Icons.email_outlined),
                  filled: true,
                  fillColor: AppTheme.getCardColor(context),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              )
                  .animate()
                  .fadeIn(delay: 400.ms)
                  .slideX(begin: -0.2, end: 0, delay: 400.ms),

              const SizedBox(height: 16),

              // Password Field
              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'كلمة المرور',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                  ),
                  filled: true,
                  fillColor: AppTheme.getCardColor(context),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              )
                  .animate()
                  .fadeIn(delay: 500.ms)
                  .slideX(begin: 0.2, end: 0, delay: 500.ms),

              const SizedBox(height: 12),

              // Forgot Password
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'نسيت كلمة المرور؟',
                    style: TextStyle(color: AppTheme.goldColor),
                  ),
                ),
              )
                  .animate()
                  .fadeIn(delay: 600.ms),

              const SizedBox(height: 24),

              // Login Button
              CustomButton(
                text: 'تسجيل الدخول',
                onPressed: _login,
                isLoading: _isLoading,
              )
                  .animate()
                  .fadeIn(delay: 700.ms)
                  .slideY(begin: 0.2, end: 0, delay: 700.ms),

              const SizedBox(height: 16),

              // Guest Login Button
              CustomButton(
                text: 'الدخول كضيف',
                onPressed: _loginAsGuest,
                isOutlined: true,
                isLoading: _isLoading,
              )
                  .animate()
                  .fadeIn(delay: 800.ms),

              const SizedBox(height: 32),

              // Register Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ليس لديك حساب؟',
                    style: TextStyle(color: AppTheme.getSecondaryTextColor(context)),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/register'),
                    child: const Text(
                      'إنشاء حساب',
                      style: TextStyle(
                        color: AppTheme.goldColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
                  .animate()
                  .fadeIn(delay: 900.ms),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
