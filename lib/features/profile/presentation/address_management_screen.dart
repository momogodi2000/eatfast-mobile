import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as google_maps;
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:lottie/lottie.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/widgets.dart';
import '../domain/models.dart';
import '../providers/profile_provider.dart';

class AddressManagementScreen extends ConsumerStatefulWidget {
  const AddressManagementScreen({super.key});

  @override
  ConsumerState<AddressManagementScreen> createState() =>
      _AddressManagementScreenState();
}

class _AddressManagementScreenState
    extends ConsumerState<AddressManagementScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeInAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _animationController.forward();
    
    // Load addresses when screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileProvider.notifier).loadAddresses();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Mes adresses',
          style: AppTextStyles.h2.copyWith(color: AppColors.onPrimary),
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => _showAddAddressSheet(context),
            icon: const Icon(Icons.add_location_outlined),
            tooltip: 'Ajouter une adresse',
          ),
        ],
      ),
      body: FadeTransition(
        opacity: _fadeInAnimation,
        child: profileState.when(
          data: (state) => _buildAddressList(context, state.addresses),
          loading: () => const Center(
            child: AppLoadingIndicator(),
          ),
          error: (error, stack) => _buildErrorState(context, error.toString()),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddAddressSheet(context),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        icon: const Icon(Icons.add_location_outlined),
        label: const Text('Nouvelle adresse'),
      ),
    );
  }

  Widget _buildAddressList(BuildContext context, List<Address> addresses) {
    if (addresses.isEmpty) {
      return _buildEmptyState(context);
    }

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(profileProvider.notifier).loadAddresses();
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          final address = addresses[index];
          return _buildAddressCard(context, address);
        },
      ),
    );
  }

  Widget _buildAddressCard(BuildContext context, Address address) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _showEditAddressSheet(context, address),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: address.isDefault
                          ? AppColors.primary.withValues(alpha: 0.1)
                          : AppColors.gray.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.location_on_outlined,
                      color: address.isDefault
                          ? AppColors.primary
                          : AppColors.gray,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              address.label,
                              style: AppTextStyles.h3,
                            ),
                            if (address.isDefault) ...[
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  'Par défaut',
                                  style: AppTextStyles.caption.copyWith(
                                    color: AppColors.onPrimary,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          address.fullAddress,
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.gray,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (value) => _handleAddressAction(
                      context,
                      value,
                      address,
                    ),
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'edit',
                        child: Row(
                          children: [
                            Icon(Icons.edit_outlined),
                            SizedBox(width: 8),
                            Text('Modifier'),
                          ],
                        ),
                      ),
                      if (!address.isDefault)
                        const PopupMenuItem(
                          value: 'default',
                          child: Row(
                            children: [
                              Icon(Icons.star_outline),
                              SizedBox(width: 8),
                              Text('Définir par défaut'),
                            ],
                          ),
                        ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Row(
                          children: [
                            Icon(Icons.delete_outline, color: Colors.red),
                            SizedBox(width: 8),
                            Text('Supprimer', style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/animations/empty_addresses.json',
            width: 200,
            height: 200,
            repeat: true,
          ),
          const SizedBox(height: 24),
          Text(
            'Aucune adresse enregistrée',
            style: AppTextStyles.h2.copyWith(color: AppColors.gray),
          ),
          const SizedBox(height: 8),
          Text(
            'Ajoutez votre première adresse pour\nfaciliter vos commandes',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.gray),
          ),
          const SizedBox(height: 32),
          AppButton(
            onPressed: () => _showAddAddressSheet(context),
            text: 'Ajouter une adresse',
            style: AppButtonStyle.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 64,
            color: AppColors.error,
          ),
          const SizedBox(height: 16),
          Text(
            'Erreur de chargement',
            style: AppTextStyles.h2.copyWith(color: AppColors.error),
          ),
          const SizedBox(height: 8),
          Text(
            error,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.gray),
          ),
          const SizedBox(height: 24),
          AppButton(
            onPressed: () {
              ref.read(profileProvider.notifier).loadAddresses();
            },
            text: 'Réessayer',
            style: AppButtonStyle.primary,
          ),
        ],
      ),
    );
  }

  void _showAddAddressSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const AddAddressSheet(),
    );
  }

  void _showEditAddressSheet(BuildContext context, Address address) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddAddressSheet(address: address),
    );
  }

  void _handleAddressAction(BuildContext context, String action, Address address) {
    switch (action) {
      case 'edit':
        _showEditAddressSheet(context, address);
        break;
      case 'default':
        ref.read(profileProvider.notifier).setDefaultAddress(address.id);
        break;
      case 'delete':
        _showDeleteConfirmation(context, address);
        break;
    }
  }

  void _showDeleteConfirmation(BuildContext context, Address address) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Supprimer l\'adresse'),
        content: Text(
          'Êtes-vous sûr de vouloir supprimer l\'adresse "${address.label}" ?\n\n'
          'Cette action est irréversible.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ref.read(profileProvider.notifier).deleteAddress(address.id);
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );
  }
}

class AddAddressSheet extends ConsumerStatefulWidget {
  final Address? address;

  const AddAddressSheet({
    super.key,
    this.address,
  });

  @override
  ConsumerState<AddAddressSheet> createState() => _AddAddressSheetState();
}

class _AddAddressSheetState extends ConsumerState<AddAddressSheet>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  
  final _formKey = GlobalKey<FormState>();
  final _labelController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _countryController = TextEditingController();
  
  google_maps.GoogleMapController? _mapController;
  google_maps.LatLng? _selectedLocation;
  bool _isDefault = false;
  bool _isLoadingLocation = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    
    _animationController.forward();
    
    // Initialize form with existing address data
    if (widget.address != null) {
      final address = widget.address!;
      _labelController.text = address.label;
      _streetController.text = address.street;
      _cityController.text = address.city;
      _postalCodeController.text = address.postalCode;
      _countryController.text = address.country;
      _isDefault = address.isDefault;
      
      if (address.latitude != null && address.longitude != null) {
        _selectedLocation = google_maps.LatLng(address.latitude!, address.longitude!);
      }
    } else {
      // Set default country for new addresses
      _countryController.text = 'Cameroun';
      _getCurrentLocation();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _labelController.dispose();
    _streetController.dispose();
    _cityController.dispose();
    _postalCodeController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.address != null;
    
    return SlideTransition(
      position: _slideAnimation,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            // Handle
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: AppColors.gray.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            
            // Header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                  Expanded(
                    child: Text(
                      isEditing ? 'Modifier l\'adresse' : 'Nouvelle adresse',
                      style: AppTextStyles.h2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 48), // Balance the close button
                ],
              ),
            ),
            
            Expanded(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Map
                    Expanded(
                      flex: 2,
                      child: _buildMap(),
                    ),
                    
                    // Form
                    Expanded(
                      flex: 3,
                      child: _buildForm(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMap() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            google_maps.GoogleMap(
              initialCameraPosition: google_maps.CameraPosition(
                target: _selectedLocation ?? const google_maps.LatLng(3.848, 11.502), // Yaoundé
                zoom: 15,
              ),
              onMapCreated: (controller) => _mapController = controller,
              onTap: _onMapTap,
              markers: _selectedLocation != null
                  ? {
                      google_maps.Marker(
                        markerId: const google_maps.MarkerId('selected_location'),
                        position: _selectedLocation!,
                        infoWindow: const google_maps.InfoWindow(
                          title: 'Adresse sélectionnée',
                        ),
                      ),
                    }
                  : {},
              mapType: google_maps.MapType.normal,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
            ),
            
            // Current location button
            Positioned(
              top: 16,
              right: 16,
              child: FloatingActionButton.small(
                onPressed: _getCurrentLocation,
                backgroundColor: Colors.white,
                foregroundColor: AppColors.primary,
                child: _isLoadingLocation
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.my_location),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextFormField(
            controller: _labelController,
            decoration: const InputDecoration(
              labelText: 'Nom de l\'adresse *',
              hintText: 'Ex: Maison, Bureau, Chez maman',
              prefixIcon: Icon(Icons.label_outlined),
            ),
            validator: (value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Veuillez saisir un nom pour cette adresse';
              }
              return null;
            },
          ),
          
          const SizedBox(height: 16),
          
          TextFormField(
            controller: _streetController,
            decoration: const InputDecoration(
              labelText: 'Rue/Quartier *',
              hintText: 'Ex: Rue 1.234, Bastos',
              prefixIcon: Icon(Icons.location_on_outlined),
            ),
            validator: (value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Veuillez saisir la rue ou le quartier';
              }
              return null;
            },
          ),
          
          const SizedBox(height: 16),
          
          Row(
            children: [
              Expanded(
                flex: 2,
                child: TextFormField(
                  controller: _cityController,
                  decoration: const InputDecoration(
                    labelText: 'Ville *',
                    hintText: 'Ex: Yaoundé',
                    prefixIcon: Icon(Icons.location_city_outlined),
                  ),
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Ville requise';
                    }
                    return null;
                  },
                ),
              ),
              
              const SizedBox(width: 12),
              
              Expanded(
                child: TextFormField(
                  controller: _postalCodeController,
                  decoration: const InputDecoration(
                    labelText: 'Code postal',
                    hintText: '00237',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          TextFormField(
            controller: _countryController,
            decoration: const InputDecoration(
              labelText: 'Pays *',
              prefixIcon: Icon(Icons.public_outlined),
            ),
            validator: (value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Pays requis';
              }
              return null;
            },
          ),
          
          const SizedBox(height: 16),
          
          SwitchListTile(
            title: const Text('Adresse par défaut'),
            subtitle: const Text('Utiliser cette adresse par défaut pour les livraisons'),
            value: _isDefault,
            onChanged: (value) => setState(() => _isDefault = value),
            activeColor: AppColors.primary,
          ),
          
          const SizedBox(height: 24),
          
          SizedBox(
            width: double.infinity,
            child: AppButton(
              onPressed: _saveAddress,
              text: widget.address != null ? 'Modifier' : 'Ajouter',
              style: AppButtonStyle.primary,
            ),
          ),
        ],
      ),
    );
  }

  void _onMapTap(google_maps.LatLng location) {
    setState(() {
      _selectedLocation = location;
    });
    _reverseGeocode(location);
  }

  Future<void> _getCurrentLocation() async {
    setState(() => _isLoadingLocation = true);
    
    try {
      final hasPermission = await _handleLocationPermission();
      if (!hasPermission) return;

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      
      final location = google_maps.LatLng(position.latitude, position.longitude);
      
      setState(() {
        _selectedLocation = location;
      });
      
      _mapController?.animateCamera(
        google_maps.CameraUpdate.newLatLngZoom(location, 15),
      );
      
      await _reverseGeocode(location);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur lors de l\'obtention de la position: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      setState(() => _isLoadingLocation = false);
    }
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Les services de localisation sont désactivés'),
          ),
        );
      }
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Permission de localisation refusée'),
            ),
          );
        }
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Permission de localisation refusée définitivement'),
          ),
        );
      }
      return false;
    }

    return true;
  }

  Future<void> _reverseGeocode(google_maps.LatLng location) async {
    try {
      final placemarks = await placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      );
      
      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        setState(() {
          _streetController.text = '${place.street ?? ''} ${place.subLocality ?? ''}'.trim();
          _cityController.text = place.locality ?? '';
          _countryController.text = place.country ?? '';
        });
      }
    } catch (e) {
      // Handle silently
    }
  }

  void _saveAddress() {
    if (!_formKey.currentState!.validate()) return;
    
    if (_selectedLocation == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez sélectionner une position sur la carte'),
        ),
      );
      return;
    }
    
    final now = DateTime.now();
    final address = Address(
      id: widget.address?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
      label: _labelController.text.trim(),
      street: _streetController.text.trim(),
      city: _cityController.text.trim(),
      postalCode: _postalCodeController.text.trim(),
      country: _countryController.text.trim(),
      latitude: _selectedLocation!.latitude,
      longitude: _selectedLocation!.longitude,
      isDefault: _isDefault,
      createdAt: widget.address?.createdAt ?? now,
      updatedAt: now,
    );
    
    if (widget.address != null) {
      ref.read(profileProvider.notifier).updateAddress(address);
    } else {
      ref.read(profileProvider.notifier).addAddress(address);
    }
    
    Navigator.of(context).pop();
  }
}
