import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';

class GardenScreen extends StatefulWidget {
  const GardenScreen({super.key});

  @override
  State<GardenScreen> createState() => _GardenScreenState();
}

class _GardenScreenState extends State<GardenScreen> {
  int _points = 1250;
  int _streakDays = 5;

  final List<Map<String, dynamic>> _dailyTasks = [
    {'title': 'سجل دخولك اليوم', 'reward': 10, 'completed': false},
    {'title': 'شارك منتجاً مع صديق', 'reward': 25, 'completed': false},
    {'title': 'أضف تقييماً لمنتج', 'reward': 50, 'completed': false},
    {'title': 'دعوة صديق للتطبيق', 'reward': 200, 'completed': false},
    {'title': 'أكمل عملية شراء', 'reward': 100, 'completed': false},
  ];

  final List<Map<String, dynamic>> _rewards = [
    {'name': 'كوبون 5000 ر.ي', 'cost': 1000, 'icon': Icons.local_offer},
    {'name': 'توصيل مجاني', 'cost': 500, 'icon': Icons.local_shipping},
    {'name': 'خصم 10%', 'cost': 800, 'icon': Icons.percent},
    {'name': 'باقة إنترنت 1GB', 'cost': 1200, 'icon': Icons.wifi},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'حديقة فلكس'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            const Text('مهام اليوم', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ..._dailyTasks.map((task) => _buildTaskCard(task)),
            const SizedBox(height: 24),
            const Text('متجر الجوائز', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: _rewards.length,
              itemBuilder: (context, index) {
                final reward = _rewards[index];
                return _buildRewardCard(reward);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF4CAF50), Color(0xFF2E7D32)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('نقاطي', style: TextStyle(color: Colors.white, fontSize: 14)),
              Text('$_points', style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text('سلسلة الأيام', style: TextStyle(color: Colors.white, fontSize: 14)),
              Text('$_streakDays أيام', style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTaskCard(Map<String, dynamic> task) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.getCardColor(context),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.goldColor.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(
            task['completed'] ? Icons.check_circle : Icons.radio_button_unchecked,
            color: task['completed'] ? Colors.green : AppTheme.goldColor,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('+${task['reward']} نقطة', style: const TextStyle(color: Colors.green, fontSize: 12)),
              ],
            ),
          ),
          if (!task['completed'])
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _points += task['reward'];
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('حصلت على +${task['reward']} نقطة!')),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: AppTheme.goldColor),
              child: const Text('إنجاز'),
            ),
        ],
      ),
    );
  }

  Widget _buildRewardCard(Map<String, dynamic> reward) {
    final canAfford = _points >= reward['cost'];
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.getCardColor(context),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.goldColor.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(reward['icon'], size: 40, color: AppTheme.goldColor),
          const SizedBox(height: 8),
          Text(reward['name'], textAlign: TextAlign.center),
          Text('${reward['cost']} نقطة', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: canAfford
                ? () {
                    setState(() {
                      _points -= reward['cost'];
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('تم استبدال ${reward['name']} بنجاح!')),
                    );
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: canAfford ? AppTheme.goldColor : Colors.grey,
            ),
            child: Text(canAfford ? 'استبدال' : 'نقاط غير كافية'),
          ),
        ],
      ),
    );
  }
}
