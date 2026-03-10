import 'dart:async';

import 'package:app_settings/app_settings.dart';
import 'package:geolocator/geolocator.dart';

class CustomLocationHelper {
  static Future<bool> isServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  static Future<bool> isServiceHavePermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    return permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always;
  }

  static Future<LocationPermissionStatus> requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      return LocationPermissionStatus.deniedForever;
    } else if (permission == LocationPermission.denied) {
      return LocationPermissionStatus.denied;
    } else {
      return LocationPermissionStatus.granted;
    }
  }

  static Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw LocationException('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw LocationPermissionException('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw LocationPermissionException(
        'Location permissions are permanently denied',
        isPermanentlyDenied: true,
      );
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  static Future<void> openAppSettings() async {
    await AppSettings.openAppSettings(type: AppSettingsType.settings);
  }
}

class LocationException implements Exception {
  final String message;
  LocationException(this.message);

  @override
  String toString() => 'LocationException: $message';
}

class LocationPermissionException implements Exception {
  final String message;
  final bool isPermanentlyDenied;

  LocationPermissionException(this.message, {this.isPermanentlyDenied = false});

  @override
  String toString() => 'LocationPermissionException: $message';
}

enum LocationPermissionStatus { granted, denied, deniedForever }
