/// Flexi TargetPlatform library.
library flexi_platform_flutter;

import 'package:flutter/foundation.dart' as _delegate
    show kIsWeb, TargetPlatform, defaultTargetPlatform;

/// The platform that user interaction should adapt to target.
///
/// The [defaultTargetPlatform] getter returns the current platform.
enum TargetPlatform {
  /// Android: <https://www.android.com/>
  android,

  /// Fuchsia: <https://fuchsia.googlesource.com/>
  fuchsia,

  /// iOS: <http://www.apple.com/ios/>
  iOS,

  /// macOS: <http://www.apple.com/macos>
  macOS,

  /// Web
  web,
}

TargetPlatform _defaultTargetPlatform;
bool _initialized = false;

/// The [TargetPlatform] that matches the platform of the flutter environment.
TargetPlatform get defaultTargetPlatform => _defaultTargetPlatform;

/// Check if the [defaultTargetPlatform] has been initialized.
bool get initialized => _initialized;

/// Initialize the [defaultTargetPlatform].
void initializePlatform() {
  if (!initialized) {
    _defaultTargetPlatform =
        _delegate.defaultTargetPlatform.toFlexiTargetPlatform();
    _initialized = true;
  }
}

extension ToFlexiTargetPlatform on _delegate.TargetPlatform {
  /// Convert Flutter's [_delegate.TargetPlatform] to [TargetPlatfrom].
  TargetPlatform toFlexiTargetPlatform() {
    if (_delegate.kIsWeb) {
      return TargetPlatform.web;
    }

    switch (this) {
      case _delegate.TargetPlatform.android:
        return TargetPlatform.android;
      case _delegate.TargetPlatform.fuchsia:
        return TargetPlatform.fuchsia;
      case _delegate.TargetPlatform.iOS:
        return TargetPlatform.iOS;
      case _delegate.TargetPlatform.macOS:
        return TargetPlatform.macOS;
      default:
        throw UnimplementedError();
    }
  }
}

extension ToFlutterTargetPlatform on TargetPlatform {
  _delegate.TargetPlatform toFlutterTargetPlatform() {
    switch (this) {
      case TargetPlatform.android:
        return _delegate.TargetPlatform.android;
      case TargetPlatform.fuchsia:
        return _delegate.TargetPlatform.fuchsia;
      case TargetPlatform.iOS:
        return _delegate.TargetPlatform.iOS;
      case TargetPlatform.macOS:
        return _delegate.TargetPlatform.macOS;
      default:
        return _delegate.defaultTargetPlatform;
    }
  }
}
