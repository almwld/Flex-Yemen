import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../theme/app_theme.dart';
import '../../models/store_model.dart';
import '../../widgets/simple_app_bar.dart';

class InteractiveMapScreen extends StatefulWidget {
  const InteractiveMapScreen({super.key});

  @override
  State<InteractiveMapScreen> createState() => _InteractiveMapScreenState();
}

class _InteractiveMapScreenState extends State<InteractiveMapScreen> {
  final MapController _mapController = MapController();
  final LatLng _sanaaLocation = const LatLng(15.3694, 44.1910);
  StoreModel? _selectedStore;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'الخريطة التفاعلية'),
      body: Stack(
        children: [
          // Map
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _sanaaLocation,
              initialZoom: 14,
              onTap: (_, __) => setState(() => _selectedStore = null),
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.flexyemen.app',
              ),
              MarkerLayer(
                markers: sampleStores.map((store) {
                  return Marker(
                    point: LatLng(store.lat, store.lng),
                    width: 50,
                    height: 50,
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedStore = store),
                      child: Container(
                        decoration: BoxDecoration(
                          color: _selectedStore?.id == store.id
                              ? AppTheme.goldColor
                              : AppTheme.goldDark,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.store,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),

          // Nearby Stores Button
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Container(
              decoration: BoxDecoration(
                color: isDark ? AppTheme.darkSurface : AppTheme.lightSurface,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppTheme.goldColor, AppTheme.goldLight],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.store, color: Colors.black),
                ),
                title: const Text('المتاجر القريبة'),
                subtitle: Text('${sampleStores.length} متجر في المنطقة'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () => Navigator.pushNamed(context, '/nearby_stores'),
              ),
            ),
          ),

          // Selected Store Card
          if (_selectedStore != null)
            Positioned(
              bottom: 100,
              left: 16,
              right: 16,
              child: _buildStoreCard(_selectedStore!),
            ),

          // Current Location FAB
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: () {
                _mapController.move(_sanaaLocation, 14);
              },
              backgroundColor: AppTheme.goldColor,
              child: const Icon(Icons.my_location, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoreCard(StoreModel store) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.getSurfaceColor(context),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppTheme.goldColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.store, color: AppTheme.goldColor, size: 32),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      store.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppTheme.getTextColor(context),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber.shade600, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '${store.rating}',
                          style: TextStyle(
                            color: AppTheme.getSecondaryTextColor(context),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: store.isOpen ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            store.isOpen ? 'مفتوح' : 'مغلق',
                            style: TextStyle(
                              fontSize: 10,
                              color: store.isOpen ? Colors.green : Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.location_on, size: 16, color: AppTheme.getSecondaryTextColor(context)),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  store.address,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppTheme.getSecondaryTextColor(context),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.directions_walk, size: 16, color: AppTheme.getSecondaryTextColor(context)),
              const SizedBox(width: 4),
              Text(
                '${store.distance.toInt()} متر',
                style: TextStyle(
                  fontSize: 12,
                  color: AppTheme.getSecondaryTextColor(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/seller_profile'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.goldColor,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('عرض المتجر'),
            ),
          ),
        ],
      ),
    );
  }
}
