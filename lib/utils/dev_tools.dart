import 'package:flutter/foundation.dart';

/// Whether the build may show the developer switches — flipping premium on,
/// loading and unloading the demo data.
///
/// Those switches unlock every paid screen with a tap, so they must not reach
/// the App Store: a build that ships them is a build that gives the
/// subscription away. They are on in debug, and in any build handed
/// `--dart-define=DEV_TOOLS=true` — which is what the `ios-testflight`
/// workflow in codemagic.yaml does, and what the release workflow deliberately
/// does not.
const bool kDevTools =
    kDebugMode || bool.fromEnvironment('DEV_TOOLS', defaultValue: false);
