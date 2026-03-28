import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_button.dart';
import '../providers/auth_provider.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreeToTerms = false;

  Future<void> _register() async {
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى ملء جميع الحقول')),
      );
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('كلمتا المرور غير متطابقتين')),
      );
      return;
    }

    if (!_agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى الموافقة على الشروط والأحكام')),
      );
      return;
    }

    setState(() => _isLoading = true);

    // Simulate registration
    await Future.delayed(const Duration(seconds: 2));

    final userData = {
      'name': _nameController.text,
      'email': _emailController.text,
      'phone': _phoneController.text,
      'avatar': null,
    };

    if (!mounted) return;

    await context.read<AuthProvider>().login(userData);

    Navigator.pushReplacementNamed(context, '/main');
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppTheme.getTextColor(context)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title
              Text(
                'إنشاء حساب جديد',
                style: TextStyle(
                  fontFamily: 'Changa',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.getTextColor(context),
                ),
              )
                  .animate()
                  .fadeIn()
                  .slideY(begin: 0.2, end: 0),

              const SizedBox(height: 8),

              Text(
                'أنشئ حساباً للوصول إلى جميع الميزات',
                style: TextStyle(
                  fontSize: 14,
                  color: AppTheme.getSecondaryTextColor(context),
                ),
              )
                  .animate()
                  .fadeIn(delay: 100.ms),

              const SizedBox(height: 32),

              // Name Field
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'الاسم الكامل',
                  prefixIcon: const Icon(Icons.person_outline),
                  filled: true,
                  fillColor: AppTheme.getCardColor(context),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              )
                  .animate()
                  .fadeIn(delay: 200.ms)
                  .slideX(begin: -0.2, end: 0, delay: 200.ms),

              const SizedBox(height: 16),

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
                  .fadeIn(delay: 300.ms)
                  .slideX(begin: 0.2, end: 0, delay: 300.ms),

              const SizedBox(height: 16),

              // Phone Field
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'رقم الهاتف',
                  prefixIcon: const Icon(Icons.phone_outlined),
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

              const SizedBox(height: 16),

              // Confirm Password Field
              TextField(
                controller: _confirmPasswordController,
                obscureText: _obscureConfirmPassword,
                decoration: InputDecoration(
                  labelText: 'تأكيد كلمة المرور',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
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
                  .fadeIn(delay: 600.ms)
                  .slideX(begin: -0.2, end: 0, delay: 600.ms),

              const SizedBox(height: 16),

              // Terms Checkbox
              Row(
                children: [
                  Checkbox(
                    value: _agreeToTerms,
                    onChanged: (value) => setState(() => _agreeToTerms = value ?? false),
                    activeColor: AppTheme.goldColor,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          'أوافق على ',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppTheme.getSecondaryTextColor(context),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/terms'),
                          child: const Text(
                            'الشروط والأحكام',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppTheme.goldColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
                  .animate()
                  .fadeIn(delay: 700.ms),

              const SizedBox(height: 24),

              // Register Button
              CustomButton(
                text: 'إنشاء حساب',
                onPressed: _register,
                isLoading: _isLoading,
              )
                  .animate()
                  .fadeIn(delay: 800.ms)
                  .slideY(begin: 0.2, end: 0, delay: 800.ms),

              const SizedBox(height: 24),

              // Login Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'لديك حساب بالفعل؟',
                    style: TextStyle(color: AppTheme.getSecondaryTextColor(context)),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'تسجيل الدخول',
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
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
