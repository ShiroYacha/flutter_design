

# Examples

## Basic

```yaml
--- # file: myapp_design.yaml (to be configured in pubspec.yaml)
# this design is based on Material Design https://material.io/design/
# however it is possible to use another design language or even create your own
# 
schema: default
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

