#!/bin/bash

# Re-generate localization files
#
# Example:
# ./gen.sh
if hash fvm 2>/dev/null; then
  # for fvm
  fvm flutter pub run build_runner build --delete-conflicting-outputs
  # for lib/translations/locale_keys.g.dart
  fvm flutter pub run easy_localization:generate -S "assets/translations" -O "lib/translations" -o "locale_keys.g.dart" -f keys
else
  # for flutter
  flutter pub run build_runner build --delete-conflicting-outputs
  # for lib/translations/locale_keys.g.dart
  flutter pub run easy_localization:generate -S "assets/translations" -O "lib/translations" -o "locale_keys.g.dart" -f keys
fi
