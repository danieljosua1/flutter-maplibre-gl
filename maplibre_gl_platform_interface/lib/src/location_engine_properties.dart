part of '../maplibre_gl_platform_interface.dart';

/// A class representing the properties for the location engine.
@immutable
class LocationEngineProperties {
  /// The interval in milliseconds for location updates.
  final int interval;

  /// The minimum displacement in meters for location updates.
  final int displacement;

  /// The priority for location accuracy and power usage.
  final LocationPriority priority;

  /// Creates a new instance of [LocationEngineProperties].
  ///
  /// All parameters are required.
  const LocationEngineProperties({
    required this.interval,
    required this.displacement,
    required this.priority,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocationEngineProperties &&
          runtimeType == other.runtimeType &&
          interval == other.interval &&
          displacement == other.displacement &&
          priority == other.priority);

  @override
  int get hashCode => interval.hashCode ^ displacement.hashCode ^ priority.hashCode;

  @override
  String toString() {
    return 'LocationEngineProperties{ interval: $interval, displacement: $displacement, locationPriority: $priority,}';
  }

  /// Creates a copy of this [LocationEngineProperties] but with the given fields replaced with the new values.
  LocationEngineProperties copyWith({
    int? interval,
    int? displacement,
    LocationPriority? priority,
  }) {
    return LocationEngineProperties(
      interval: interval ?? this.interval,
      displacement: displacement ?? this.displacement,
      priority: priority ?? this.priority,
    );
  }

  /// Converts this [LocationEngineProperties] to a map.
  Map<String, dynamic> toMap() {
    return {
      'interval': interval,
      'displacement': displacement,
      'priority': priority.index,
    };
  }

  /// Creates a new instance of [LocationEngineProperties] from a map.
  ///
  /// The map must contain the keys 'interval', 'displacement', and 'locationPriority'.
  factory LocationEngineProperties.fromMap(Map<String, dynamic> map) {
    return LocationEngineProperties(
      interval: map['interval'] as int,
      displacement: map['displacement'] as int,
      priority: LocationPriority.values[ map['locationPriority']],
    );
  }
}

/// An enum representing the priority for location accuracy and power usage.
enum LocationPriority {
  highAccuracy,
  balanced,
  lowPower,
  noPower,
}