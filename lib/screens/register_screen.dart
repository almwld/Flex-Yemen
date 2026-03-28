import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import '../services/supabase_service.dart';
import '../services/location_service.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../providers/auth_provider.dart';
import 'main_navigation.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  
  String? _selectedCity;
  String _userType = 'customer';
  bool _acceptTerms = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;
    if (!_acceptTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يرجى الموافقة على الشروط والأحكام'),
          backgroundColor: AppTheme.error,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final response = await SupabaseService.signUpWithEmail(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        fullName: _nameController.text.trim(),
        phone: _phoneController.text.trim(),
        userType: _userType,
        city: _selectedCity,
      );

      if (response.user != null) {
        final user = UserModel(
          id: response.user!.id,
          fullName: _nameController.text.trim(),
          email: _emailController.text.trim(),
          phone: _phoneController.text.trim(),
          userType: _userType,
          city: _selectedCity,
        );
        
        await context.read<AuthProvider>().login(user);
        
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/main');
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('فشل إنشاء الحساب: $e'),
            backgroundColor: AppTheme.error,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cities = LocationService.getCities();

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppTheme.getTextColor(context)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'إنشاء حساب جديد',
                  style: TextStyle(
                    fontFamily: 'Changa',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.getTextColor(context),
                  ),
                ).animate().fadeIn().slideX(begin: -0.2),
                const SizedBox(height: 8),
                Text(
                  'أدخل بياناتك لإنشاء حساب جديد',
                  style: TextStyle(
                    fontFamily: 'Changa',
                    fontSize: 14,
                    color: AppTheme.getSecondaryTextColor(context),
                  ),
                ).animate().fadeIn(delay: 100.ms),
                const SizedBox(height: 32),
                CustomTextField(
                  label: 'الاسم الكامل',
                  hint: 'محمد أحمد',
                  controller: _nameController,
                  prefixIcon: const Icon(Icons.person_outline),
                  validator: (value) => value?.isEmpty == true ? 'يرجى إدخال الاسم الكامل' : null,
                ).animate().fadeIn(delay: 200.ms),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'البريد الإلكتروني',
                  hint: 'example@email.com',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email_outlined),
                  validator: (value) {
                    if (value?.isEmpty == true) return 'يرجى إدخال البريد الإلكتروني';
                    if (!value!.contains('@')) return 'يرجى إدخال بريد إلكتروني صحيح';
                    return null;
                  },
                ).animate().fadeIn(delay: 300.ms),
                const SizedBox(height: 16),
                PhoneTextField(
                  controller: _phoneController,
                  validator: (value) {
                    if (value?.isEmpty == true) return 'يرجى إدخال رقم الهاتف';
                    if (value!.length < 9) return 'رقم الهاتف غير صحيح';
                    return null;
                  },
                ).animate().fadeIn(delay: 400.ms),
                const SizedBox(height: 16),
                PasswordTextField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value?.isEmpty == true) return 'يرجى إدخال كلمة المرور';
                    if (value!.length < 6) return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
                    return null;
                  },
                ).animate().fadeIn(delay: 500.ms),
                const SizedBox(height: 16),
                PasswordTextField(
                  label: 'تأكيد كلمة المرور',
                  hint: 'أعد إدخال كلمة المرور',
                  controller: _confirmPasswordController,
                  validator: (value) {
                    if (value?.isEmpty == true) return 'يرجى تأكيد كلمة المرور';
                    if (value != _passwordController.text) return 'كلمتا المرور غير متطابقتين';
                    return null;
                  },
                ).animate().fadeIn(delay: 600.ms),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedCity,
                  decoration: InputDecoration(
                    labelText: 'المدينة',
                    prefixIcon: const Icon(Icons.location_city),
                    filled: true,
                    fillColor: isDark ? AppTheme.darkCard : AppTheme.lightCard,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  ),
                  items: cities.map((city) => DropdownMenuItem(value: city, child: Text(city))).toList(),
                  onChanged: (value) => setState(() => _selectedCity = value),
                ).animate().fadeIn(delay: 700.ms),
                const SizedBox(height: 16),
                CheckboxListTile(
                  value: _acceptTerms,
                  onChanged: (value) => setState(() => _acceptTerms = value ?? false),
                  title: Row(
                    children: [
                      Text('أوافق على ', style: TextStyle(fontFamily: 'Changa', fontSize: 13, color: AppTheme.getTextColor(context))),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/terms'),
                        child: const Text('الشروط والأحكام', style: TextStyle(fontFamily: 'Changa', fontSize: 13, color: AppTheme.goldColor, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: AppTheme.goldColor,
                ).animate().fadeIn(delay: 800.ms),
                const SizedBox(height: 24),
                CustomButton(
                  text: 'إنشاء حساب',
                  onPressed: _register,
                  isLoading: _isLoading,
                ).animate().fadeIn(delay: 900.ms).scale(),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('لديك حساب بالفعل؟', style: TextStyle(fontFamily: 'Changa', color: AppTheme.getSecondaryTextColor(context))),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('تسجيل الدخول', style: TextStyle(fontFamily: 'Changa', color: AppTheme.goldColor, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ).animate().fadeIn(delay: 1000.ms),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
