#!/bin/sh

if [[ $1 = "--fvm" ]]; then
    echo "Using FVM\n"
fi

# Prepare pubspec.yaml
mv pubspec.yaml pubspec.yaml.origin
cat pubspec.yaml.origin | grep -v 'assets/json/api/ruejai-chat/' > pubspec.yaml

# Run build runner (and flutter gen).
if [[ $1 = "--fvm" ]]; then
    fvm flutter pub get
    fvm flutter pub run build_runner build --delete-conflicting-outputs
else
    flutter pub get
    dart run build_runner build --delete-conflicting-outputs
fi

# Tear down.
mv pubspec.yaml.origin pubspec.yaml
rm pubspec.yaml.origin

if [[ $1 = "--fvm" ]]; then
    fvm flutter pub get
else
    flutter pub get
fi
