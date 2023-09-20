# get_radio_version_plugin

A plugin to get radio version from native code (Android).

## Features

 - get the `radioVersion`

## Getting started

To use this package, add `get_radio_version_plugin` as a dependency in your pubspec.yaml file.

## Usage

Example:

Declare variable:
```dart

    String _radioVersion = 'Unknown';

```

Create Function `initradioVersionState`:

```dart

    Future<void> initRadioVersionState() async {
        String radioVersion;
        try {

          radioVersion = await GetRadioVersionPlugin.radioVersion ?? 'Unknown radio version';

        } on PlatformException {

          radioVersion = 'Failed to get radio version.';

        }
        if (!mounted) return;
    
        setState(() {
          _radioVersion = radioVersion;
        });
    }
```

Call into initState:

```dart

    void initState() {
      super.initState();
      initRadioVersionState();
    }

```
