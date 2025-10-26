/// Google Maps Address Picker Widget
/// Allows users to pick delivery addresses using Google Maps
library;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';

class AddressPickerWidget extends StatefulWidget {
  final LatLng? initialPosition;
  final Function(AddressData) onAddressSelected;

  const AddressPickerWidget({
    super.key,
    this.initialPosition,
    required this.onAddressSelected,
  });

  @override
  State<AddressPickerWidget> createState() => _AddressPickerWidgetState();
}

class _AddressPickerWidgetState extends State<AddressPickerWidget> {
  GoogleMapController? _mapController;
  LatLng _currentPosition = const LatLng(3.848, 11.5021); // Yaoundé default
  String _currentAddress = 'Récupération de l\'adresse...';
  bool _isLoading = false;
  bool _locationPermissionGranted = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialPosition != null) {
      _currentPosition = widget.initialPosition!;
    }
    _initializeLocation();
  }

  Future<void> _initializeLocation() async {
    setState(() => _isLoading = true);

    // Request location permission
    final permissionStatus = await Permission.location.request();
    _locationPermissionGranted = permissionStatus.isGranted;

    if (_locationPermissionGranted) {
      try {
        // Get current location
        final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        _currentPosition = LatLng(position.latitude, position.longitude);
        await _getAddressFromLatLng(_currentPosition);
      } catch (e) {
        debugPrint('Error getting current location: $e');
      }
    } else {
      // Use initial position or default
      if (widget.initialPosition != null) {
        _currentPosition = widget.initialPosition!;
      }
      await _getAddressFromLatLng(_currentPosition);
    }

    setState(() => _isLoading = false);
  }

  Future<void> _getAddressFromLatLng(LatLng position) async {
    try {
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        setState(() {
          _currentAddress = _formatAddress(place);
        });
      }
    } catch (e) {
      debugPrint('Error getting address: $e');
      setState(() {
        _currentAddress = 'Adresse non disponible';
      });
    }
  }

  String _formatAddress(Placemark place) {
    final parts = <String>[];

    if (place.street != null && place.street!.isNotEmpty) {
      parts.add(place.street!);
    }
    if (place.subLocality != null && place.subLocality!.isNotEmpty) {
      parts.add(place.subLocality!);
    }
    if (place.locality != null && place.locality!.isNotEmpty) {
      parts.add(place.locality!);
    }
    if (place.administrativeArea != null && place.administrativeArea!.isNotEmpty) {
      parts.add(place.administrativeArea!);
    }

    return parts.isNotEmpty ? parts.join(', ') : 'Adresse non disponible';
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _mapController?.animateCamera(
      CameraUpdate.newLatLng(_currentPosition),
    );
  }

  void _onCameraMove(CameraPosition position) {
    _currentPosition = position.target;
  }

  Future<void> _onCameraIdle() async {
    await _getAddressFromLatLng(_currentPosition);
  }

  Future<void> _getCurrentLocation() async {
    if (!_locationPermissionGranted) {
      final status = await Permission.location.request();
      if (!status.isGranted) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Permission de localisation refusée'),
            ),
          );
        }
        return;
      }
      _locationPermissionGranted = true;
    }

    setState(() => _isLoading = true);

    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      _currentPosition = LatLng(position.latitude, position.longitude);

      _mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(_currentPosition, 15),
      );

      await _getAddressFromLatLng(_currentPosition);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur: ${e.toString()}')),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _confirmAddress() {
    widget.onAddressSelected(
      AddressData(
        latitude: _currentPosition.latitude,
        longitude: _currentPosition.longitude,
        formattedAddress: _currentAddress,
      ),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choisir l\'adresse'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          // Google Map
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _currentPosition,
              zoom: 15,
            ),
            onCameraMove: _onCameraMove,
            onCameraIdle: _onCameraIdle,
            myLocationEnabled: _locationPermissionGranted,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
          ),

          // Center Pin
          Center(
            child: Icon(
              Icons.location_pin,
              size: 50,
              color: Theme.of(context).primaryColor,
            ),
          ),

          // Address Card
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(
                              _currentAddress,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Confirm Button
          Positioned(
            bottom: 24,
            left: 16,
            right: 16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Get Current Location Button
                FloatingActionButton(
                  onPressed: _getCurrentLocation,
                  heroTag: 'location_btn',
                  child: const Icon(Icons.my_location),
                ),
                const SizedBox(height: 16),
                // Confirm Address Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _currentAddress != 'Récupération de l\'adresse...' &&
                            _currentAddress != 'Adresse non disponible'
                        ? _confirmAddress
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                    ),
                    child: const Text(
                      'Confirmer cette adresse',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }
}

/// Address Data Model
class AddressData {
  final double latitude;
  final double longitude;
  final String formattedAddress;

  const AddressData({
    required this.latitude,
    required this.longitude,
    required this.formattedAddress,
  });

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'address': formattedAddress,
    };
  }
}
