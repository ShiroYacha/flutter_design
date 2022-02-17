<p align="center">
  <img width="200" height="200" src="/assets/branding/logo_readme.png">
  <br /><br />
  <span>Provide powerfull tools to help you build your design system.</span>
</p>

---

## About

`flutter_design` contains packages to help you bootstrap your design system with a well defined framework and code generation/CLI toolchain. It also contains a powerful design system viewer to let you visualize and interact with your design system.

There are mainly 3 packages you need to depend on:
- Your production/design package:
  - [flutter_design](https://pub.dev/packages/flutter_design): provide basic annotation & framework to integrate with the design ecosystem.
  - [flutter_design_codegen](https://pub.dev/packages/flutter_design_codegen): code generator used to generate design code.
- Your design viewer app:
  - [flutter_design_viewer](https://pub.dev/packages/flutter_design_viewer): viewer ux and utilities to bootstrap your design viewer app.


## Demo

Checkout the generated viewer app  https://flutter-design-7b479.web.app/ using the [example code](https://github.com/ShiroYacha/flutter_design/tree/main/packages/flutter_design_viewer/example). 

<p align="center">
  <img src="/assets/branding/screenshot_readme.png">
</p>

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

For more information, please check out the documentation at https://flutter-design.gitbook.io/design-docs/.

The UX and design is inspired by [Wanda Design System](https://design.wonderflow.ai/).


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

Then you would need to annotate the widgets you want to integrate in the design system viewer using the `@design` annotation. Yes, it's that easy!  

```dart
@design
class SpecialWidget extends StatelessWidget {
  ...
}
```

After running `flutter packages pub run build_runner build --delete-conflicting-outputs` the catalogs will be generated:
- `/lib/**/*.design.dart`: generated widget catalogs for the partial file.
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
setPathUrlStrategy(); // Recommended to make history browser work better in web
runApp(
    DesignSystemViewerApp(
      settings: ViewerSettings(
        enabledLocales: {
          'en-US': const Locale('en', 'US'),
        },
        enabledThemes: {
          'light': ThemeData.light(),
          'dark': ThemeData.dark(),
        },
      ),
      pageGroups: buildComponentPageTree(componentPages: generatedComponentPages),
    ),
);
```

That's it! You can then run your designer app on any supported platform :v:. You can checkout some of the screenshots below or rather check the demo app :P 