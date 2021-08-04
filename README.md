# flutter_design

The goal of `flutter_design` is to provide a more structured mechanism to create and integrate design systems for your apps via code generation with dart builder.

## Features

#### Design declaration

Instead of creating theme/styles files with constants, declare your design in `yaml` files and let the builder automatically generate all the themes/styles/widgets for you. 

Here is a quick example for a minimal app design declaration (you can always break the designs into multiple files as shown in further sections):

```yaml
--- # file: myapp_design.yaml (to be configured in pubspec.yaml)
# this design is based on Material Design https://material.io/design/
# however it is possible to use another design language or even create your own
# 
based_on: material_default # based on the default Flutter Material UI design
builder: # builder configurations
  generate_single_file: true
themes:
  light:
  darkmode:
  darkmode_special:
    based_on: darkmode
color:
  chili:
    50: 0xFFF2F2
    #...
    900: 0x660000
  #...
palette:
  grayscale:  
      offblack: 
        light: cool[900] # use the color system
        darkmode: cool[200]
      ash: cool[600] # indifferent to theme
      #...
  primary:
    default: 
      light: 0xFFD8041D # use a specific hex color
      darkmode: 0xFFFF5D66
      darkmode_special: 0xFFFF3D26
    dark: 
      light: 0xFF980101
    #...
  background:
    special:
      light: 0xFFD8041D
  accent:
    #...
  error:
    #...
  #...
size:
  padding:
    ph: 96
    lg: 32
    md: 24
    #...
text:
  h1:
    color: grayscale.offblack # this is the default color, all color variation will be generated
    size: 96
    weight: bold
  #...
icon:
  lg:
    size: 24

variants:
  themed:
    based_on: flutter_design.themed
    options: [light, darkmode]

widgets:
  button:
    variants:
      type: [raised, outlined, text]
      size: [huge, large, medium, small]
      icon: [none, left, right, only]
      radius: [pill, semi-rounded]
      theme: 
        use: themed

  card:
    variants:
      type: [commerce, blog, product, social, category, photo]
      size: [large, medium, small]
      theme: [light, darkmode]

  badge_tag:
    variants:
      type: [solid, outline]
      color: [default, info, success, warning, error, custom]
      dismissable: [true, false]
      size: [large, small]
      theme: [light, darkmode]
#...
```

and after running the builder `flutter packages pub run build_runner build --delete-conflicting-outputs`, you can use the code in Dart, such as the following (for further detail check the API docs):

using **extension methods**

```dart
AppBar(
  title: "This is an example".h1.primaryDefault, // override with specific color
  leading: Icons.arrow_back.md.padLeftMd(), // add margin
  backgroundColor: Palette.backgroundSpecial // this is an alias that you created
)
```

or using **static methods**

```dart
AppBar(
  title: d.text("This is an example").h1.primaryDefault, // override with specific color
  leading: d.icon(Icons.arrow_back).md.padLeftMd(), // add margin
  backgroundColor: Palette.backgroundSpecial // this is an alias that you created
)
```

instead of

```dart
final theme = Theme.of(context);
//...
AppBar(
  title: Text("This is an example", style: theme.textTheme!.heading1!.copyWith(color: theme.primaryColor)), 
  leading: Padding(padding: paddingLeftMd, child: Icon(Icons.arrow_black, size: iconSizeMd)), // add margin
  backgroundColor: theme.brightness === Brightness.light ? 
    backgroundSpecialLightColor : backgroundSpecialDarkColor // sometimes you need another themed color but it's not possible
)
```

```dart
///
extension test on Text {
  Text get md => this..style = TextStyle(this.style.copyWith(fontSize: 15));

}
///
```


#### Theme modes

By defining the basic theme modes (e.g. `light`, `dark`, etc.), the builder automatically generates all widgets with according themes. You can also bootstrap the theme configuration easily which is synchronized to the device or can be configured programmatically. 

#### Autoscaling (vNext)

...


#### Design system

You can also define the entier design system in YAML and generate the classes for implementation. For each widget you can define multiple variant properties and sometimes impl. each aspect of them independently, using mixins, and reuse them across different wigdets.

```dart
/*
  button:
    variants:
      type: [raised, outlined, text]
      size: [huge, large, medium, small]
      icon: [none, left, right, only]
      radius: [pill, semi-rounded]
      theme: [light, darkmode]
*/



class MyButton = _MyButton with _$MyButton;

abstract class _MyButton with HookDesignElement {

}
```





This is obsolete ... 

```yaml
--- # file: myapp_design.yaml (to be configured in pubspec.yaml)
# this design is based on Material Design https://material.io/design/
# however it is possible to use another design language or even create your own
# 
color:
  palette:
    grayscale:
      offblack: 0xFF14142B
      ash: 0xFF373448
      #...
    primary:
      default: 0xFFD8041D
      dark: 0xFF980101
      darkmode: 0xFFFF5D66
      #...
    accent:
      #...
    error:
      #...
    #...
sizes:
  font:
    based_on: material_default
    spec:
      h1: 96
      h2: 60
      h3: 48
      h4: 34
      h5: 24
      h6: 20
      subtitle1: 16
      subtitle2: 14
      body1: 16
      body2: 14
      button: 14
      caption: 12
      overline: 10
  icon:
    spec:
      lg: 28 
      md: 24
      sm: 20
      ty: 16
```

