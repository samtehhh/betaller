import 'package:flutter/foundation.dart';

/// Whether the build may show the developer switches — flipping premium on,
/// loading and unloading the demo data.
///
/// Those switches unlock every paid screen with a tap, so they must not reach
/// the App Store: a build that ships them is a build that gives the
/// subscription away. They are on in debug, and in a local build handed
/// `--dart-define=DEV_TOOLS=true`. codemagic.yaml never passes it, on any
/// branch, so neither the App Store nor TestFlight carries them.
const bool kDevTools =
    kDebugMode || bool.fromEnvironment('DEV_TOOLS', defaultValue: false);
