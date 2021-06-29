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
palette:
  grayscale:  
      offblack: 
        light: 0xFF14142B
      ash: 0xFF373448
      #...
  primary:
    default: 
      light: 0xFFD8041D
      darkmode: 0xFFFF5D66
      darkmode_special: 0xFFFF3D26
    dark: 
      light: 0xFF980101
    #...
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
#...
```

and after running the builder `flutter packages pub run build_runner build --delete-conflicting-outputs`, you can use the code in Dart, such as the following (for further detail check the API docs):

```dart
AppBar(
  title: "This is an example".h1.primaryDefault(), // override with specific color
  leading: Icons.arrow_back.md().padLeftMd(), // add margin
  backgroundColor: Palette.primaryLight()
)
```

#### Theme modes

By defining the basic theme modes (e.g. `light`, `dark`, etc.), the builder automatically generates all widgets with according themes. You can also bootstrap the theme configuration easily which is synchronized to the device or can be configured programmatically.

#### Autoscaling (vNext)

...







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

