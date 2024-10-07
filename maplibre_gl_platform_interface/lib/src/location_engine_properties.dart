part of '../maplibre_gl_platform_interface.dart';

///IOS is not supported at the moment
@immutable
class LocationEnginePlatforms {
  /// The properties for the Android platform.
  final LocationEngineAndroidProperties androidPlatform;

  const LocationEnginePlatforms({
    this.androidPlatform = LocationEngineAndroidProperties.defaultProperties,
  });
  static const LocationEnginePlatforms defaultPlatform = LocationEnginePlatforms();

  List<int> toList() {
   if(Platform.isAndroid) return androidPlatform.toList();
   return [];
  }
}

/// A class representing the properties for the location engine.
@immutable
class LocationEngineAndroidProperties {
  /// The interval in milliseconds for location updates.
  final int interval;

  /// The minimum displacement in meters for location updates.
  final int displacement;

  /// The priority for location accuracy and power usage.
  final LocationPriority priority;

  /// Creates a new instance of [LocationEngineAndroidProperties].
  ///
  /// All parameters are required.
  const LocationEngineAndroidProperties({
    required this.interval,
    required this.displacement,
    required this.priority,
  });

  static const LocationEngineAndroidProperties defaultProperties = LocationEngineAndroidProperties(
    interval: 1000,
    displacement: 0,
    priority: LocationPriority.balanced,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocationEngineAndroidProperties &&
          runtimeType == other.runtimeType &&
          interval == other.interval &&
          displacement == other.displacement &&
          priority == other.priority);

  @override
  int get hashCode => interval.hashCode ^ displacement.hashCode ^ priority.hashCode;

  @override
  String toString() {
    return 'LocationEngineProperties{ interval: $interval, displacement: $displacement, locationPriority: $priority}';
  }

  /// Creates a copy of this [LocationEngineProperties] but with the given fields replaced with the new values.
  LocationEngineAndroidProperties copyWith({
    int? interval,
    int? displacement,
    LocationPriority? priority,
  }) {
    return LocationEngineAndroidProperties(
      interval: interval ?? this.interval,
      displacement: displacement ?? this.displacement,
      priority: priority ?? this.priority,
    );
  }

  List<int> toList() {
    return [
      interval,
      priority.index,
      displacement,
    ];
  }
}

/// An enum representing the priority for location accuracy and power usage.
enum LocationPriority {
  highAccuracy,
  balanced,
}
