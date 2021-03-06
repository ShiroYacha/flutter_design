[![pub package](https://img.shields.io/pub/v/flutter_design.svg)](https://pub.dartlang.org/packages/flutter_design) [![License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

<p align="center">
  <img width="200" src="https://github.com/ShiroYacha/flutter_design/blob/main/assets/branding/logo_readme.png?raw=true">
  <br /><br />
  <span>Provide powerfull tools to help you build your design system.</span>
</p>

---

## About


`flutter_design` contains packages to help you bootstrap your design system with a well defined framework and code generation/CLI toolchain. It also contains a powerful design system viewer to let you visualize and interact with your design system.

> Please checkout the [Official website](https://flutterdesign.io) for more information. :rocket:

There are mainly 3 packages you need to depend on:
- Your production/design package:
  - [flutter_design](https://pub.dev/packages/flutter_design): provide basic annotation & framework to integrate with the design ecosystem.
  - [flutter_design_codegen](https://pub.dev/packages/flutter_design_codegen): code generator used to generate design code.
- Your design viewer app:
  - [flutter_design_viewer](https://pub.dev/packages/flutter_design_viewer): viewer ux and utilities to bootstrap your design viewer app.


---

## Demo

Checkout the generated viewer app  https://flutter-design-7b479.web.app/ using the [example code](https://github.com/ShiroYacha/flutter_design/tree/main/packages/flutter_design_viewer/example). 

<p align="center">
  <img src="https://github.com/ShiroYacha/flutter_design/blob/main/assets/branding/screenshot_readme.jpg?raw=true">
</p>


---

## Features

Here are the key objectives of the project:
- Provide tools to create a design system and a simple workflow to document/visualize it
  - Provide a guideline/classes to build the system
  - Provide a code generator to reduce boilerplates
  - Provide a CLI to speed up and organize widgets (TBD)
- Provide a powerful design viewer with the following core features
  - Cross-platform: visualize on web/desktop/mobile
  - Complete design documentation system 
  - Book-like structure & fully integrated search (currently only supporting in-memory search, with an interface inspired by https://www.algolia.com/ref/docsearch/) 
  - Visualize UX in multiple synchronized frames (user interaction such as scroll, tap, drag is propagated) across
    - Different device frames
    - Different theme frames
    - Different locale frames
  - Runtime data configuration: you can easily "try-out" different data in runtime, e.g. Color, Values, or even Widget! It is also possible to create your own data generator.

The UX and design is inspired by [Wanda Design System](https://design.wonderflow.ai/).


---

## Basic integration

First, on your code base (where you will implement your design system/widgets) you have to add the following dependencies to your `pubspec.yaml`: 

```yaml
dependencies:
  #...
  flutter_design:

dev_dependencies:
  #...
  build_runner:
  flutter_design_codegen:
```

Note that you might need to add this to the `pubspec.yaml` file (I'm working on a fix to avoid needing this override):

```yaml
dependency_overrides:
  analyzer: ^3.2.0
  dart_style: ^2.2.1
```

If you see errors like: 
```
class ToSourceIgnoringDesignAnnotationsVisitor implements AstVisitor {
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
../../../Dev/flutter/.pub-cache/hosted/pub.dartlang.org/analyzer-3.3.1/lib/dart/ast/ast.dart:405:6: Context: 'AstVisitor.visitConstructorSelector' is defined here.
```

Then you would need to annotate the widgets you want to integrate in the design system viewer using the `@design` annotation. Yes, it's that easy!  

```dart
@design
class SpecialWidget extends StatelessWidget {
  ...
}
```

After running `flutter packages pub run build_runner build --delete-conflicting-outputs` the catalogs will be generated:
- `/lib/**/*.design.dart`: generated widget component pagesfor the partial file.
- `lib/page_factory.design.dart`: this contains the aggregated `generatedComponentPages` that can be directly pass to the DesignSystemViewerApp described later.

Finally you can create a flutter designer app (currently supporting Android, iOS, Web, macOS, Windows) to host the design system viewer by adding the following dependencies to the `pubspec.yaml`

```yaml
dependencies:
  #...
  your_package:
  flutter_design:
  flutter_design_viewer:
```

Then you need to basically setup the design system viewer in your app using the `generatedComponentPages` along with some other settings you might want to configure:
- `enabledLocales` the locales your design system supports
- `enabledThemes` the `ThemeData` your design system supports

You can also customize the pages by creating static or dynamic contents. For more information, please check the docs.

```dart
setPathUrlStrategy(); // Recommended to make history browsing work better in web
runApp(
    DesignSystemViewerApp(
      settings: ViewerSettings(
        enabledLocales: {
          'en-US': const Locale('en', 'US'),
        },
        enabledThemes: {
          'light': DesignTheme(materialTheme: ThemeData.light()),
          'dark': DesignTheme(materialTheme: ThemeData.dark()),
        },
      ),
      pageGroups: buildComponentPageTree(componentPages: generatedComponentPages),
    ),
);
```

That's it! You can then run your designer app on any supported platform :v:. You can checkout some of the screenshots below or rather check the demo app :P 