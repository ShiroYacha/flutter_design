# Widget design

## Overview

**Widget design** is at the core of the design system. It has the following features:

- **Variant**: supports independent variants configuration
- **Combination**: supports widget combination and reuse
- **Extension**: supports widget extension and reuse
- **Adaptive design**: supports variant configuration based on the widget's current context, e.g. adaptive design based on screen breakpoints, theme configuration, etc.

You can declare widgets in a yaml file with the `.design.yaml` extension. 

The widget design system uses a **builder** pattern. The widget builders mixins will be generated with the `.design.dart` extension in respective directories based on the `package` property. If the file is newly created, a part file with `.dart` extension will also be created with a basic scaffold so you can write the actual implementation of the widget builder.

Here is a minimalist example of the empty `test_widget` with https://riverpod.dev/ as the state-management library:

```yaml
# widgets.design.yaml
widgets:
	test_widget:
		package: common.test
```

will generate the following 2 files under `libs/widgets/design_system/common/test/`:

- `test_widget.dart`

```dart
part 'test_widget.design.dart';

@design
class TestWidget extends HookConsumerWidget with _$TestWidget {
   @override
   Widget build(BuildContext context, WidgetRef ref) {
     // TODO: implement the widget
     throw UnimplementedError();
   }
}
```

- `test_widget.design.dart`

```dart
mixin _$TestWidget on TestWidget {}

class TestWidgetBuilder extends FlutterDesignWidgetBuilder {
  @override
  Widget build() {
    return TestWidget();
  }
}
```

You can then create the `test_widget` in the following way:

```dart
var testWidget = TestWidgetBuilder().build(); // you will see the benefit of the builder later when variants/alias are introduced
// or
testWidget = TestWidget();
```

## Variant

You can declare independent variant properties for each widget. Consider variant as more **high-level properties** of the widget. The main difference of a variant (e.g. `variantMaxLines` on `BasicText` widget) vs. a concrete property (e.g. `maxLines` on a `Text` widget) is that the variant is more abstract and tailored to a specific usecase in the design system. 

You can declare  **`variants`** with the following fields:

- `id`: unique ID of the variant (use *camalCase*).
- `description`: user description.
- `type`: type of the variant field. If not specified, will either use type of the generated `enums` or use the type of the `use` field. If the specified type doesn't match or cannot be automatically converted, a `convertVariant${id.pascalCase}` method will be generated as has to be overriden by the user.
- `use`: to reuse existing variant definition
- `enums`: define a set of enumeration values for the variant

Sometimes it's also practical to declare **`alias`** to combine certain variants that are commonly used so the user don't have to explicitely configure each variant separately.

Here is an example of `basic_text` widget which has 2 basic variants:

```yaml
widgets:
  basic_text:
  	package: common.typography
    variants:	
      - id: fontStyle
      	description:
      	use: common.value.font_style # use the common widget font style previously defined
     	- id: maxLines
     		description:
     		type: int? # indicates that the generated variant should use the primitive `int?` type
     		enums: [1, 2, 3, 5, null] # enum values of the variant. Can be automatically converted to `int?`.
    alias:
  		- id: header
  			variants:
  				fontStyle: common.value.font_style.heading1PrimaryBold
  				maxLines: 1
      - id: paragraph
      	variants:
      		fontStyle: common.value.font_style.paragraphPrimaryNormal
      		maxLines: null
```

By doing so, you can access the variant fields via the generated base class:

```dart
@design
class BasicText extends HookConsumerWidget with _$BasicText {
  /// You created this field and constructor and the codegen will adjust the constructor of the builder respectively
  final String text; 
  const BasicTextBuilder({
    required this.text,
  });
    
  @override
  Widget build(BuildContext context, WidgetRef ref) {
		return Text(
      text: text,
      style: variantFontStyle,
      maxLines: variantMaxLines,
    );
  }
}
```

Finally you can create the widget in the following way:

```dart
// You can configure the widget variants explicitely as follows:
final text1 = BasicTextBuilder(
  	text: 'Heading text',
	).fontStyle(fontStyleHeading1PrimaryBold)
   .maxLines1
   .build();

// You can also use the alias as follows:
final text2 = BasicTextBuilder(
  	text: 'Heading text',
	).asHeader
   .build();
final text3 = BasicTextBuilder(
  	text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
	).asParagraph
   .build();

// You can also use the default configuration which uses for each variant:
//  - if the adaptive condition is met, use that variant
//  - otherwise, use the first enum 
var text4 = BasicTextBuilder(
  	text: 'This is some dynamic text',
	).build();
// or simply the constructor directly
text4 = BasicText(text: 'This is some dynamic text');
```

## Combination

Each widget could define a set of **independent variant** designs. 

Here is a basic example of a `glyph_text` widget's variant definition:

```yaml
widgets:
  glyph_text:
  	package: common.label
    combine:
  		- id: label
  		  ref: common.typography.basic_text
      - id: glyph
      	ref: common.glyph.basic_glyph
    variants:
      - id: layout
        description:
        enums: [horizontal, vertical]
      - id: display
      	description:
      	enums: [both, text_only, glyph_only]
    alias:
  		- id: header
  			variants:
  				layout: horizontal
  				display: both
  			combineAlias:
  				label: header
  				glyph: logo
      - id: tag
      	variants:
  				layout: horizontal
          display: both
  			combineAlias:
  				label: tag
  				glyph: badge
```

By doing so, you can access the variant enums via the generated base class:

```dart
@design
class GlyphText extends HookConsumerWidget with _$GlyphText {
  final String? text;
  final GlyphData? glyph;
  const GlyphText({
    this.text,
    this.glyph,
  }) : assert(text != null || glphy != null);
    
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textWidget = text != null ? buildBasicText(
      text, 
    ) : null;
    final glyphWidget = glyph != null ? buildBasicGlyph(
      glyph
    ) : null;
    final showGlyph = variantDisplay != GlyphTextDisplay.textOnly && glyphWidget != null;
    final showText = variantDisplay != GlyphTextDisplay.glyphOnly && textWidget != null;
    switch(variantLayout) {
        case GlyphTextVariantLayout.horizontal:
        	return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if(showGlyph)
                glyphWidget,
              if(showText)
                textWidget,
            ]
          );
       	case GlyphTextVariantLayout.vertical:
        	return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if(showGlyph)
                glyphWidget,
              if(showText)
                textWidget,
            ]
          );
    }
    throw UnsupportedError('unsupported variantLayout = $variantLayout');
  }
}
```

Then you can use the widget as follows:

```dart
// You can configure the widget variants explicitely as follows:
final text1 = GlyphTextBuilder(
  	text: 'Heading text',
  	glyph: GlyphData.icon(Icons.star),
	).layoutHorizontal
   .displayBoth
   .withBasicText.asHeader
   .withBasicGlyph.asLogo
   .build();

// You can also use the alias as follows:
final text2 = GlyphTextBuilder(
  	text: 'Heading text',
  	glyph: unionGlyphData,
	).asHeader
   .build();
final text3 = GlyphTextBuilder(
  	text: 'Tag text',
  	glyph: unionGlyphData,
	).asTag
   .build();

// You can also use the default configuration which uses for each variant:
//  - if the adaptive condition is met, use that variant
//  - otherwise, use the first enum 
var text4 = GlyphTextBuilder(
  	text: 'This is some dynamic text',
  	glyph: unionGlyphData,
	).build();
// or simply the constructor directly
text4 = GlyphText(
  	text: 'This is some dynamic text',
  	glyph: unionGlyphData,
	);
```



## Extension

Expanding on the `glyph_text` example, let's see how can we extend it to use in a domain specific context as `product_category_label`.

```yaml
widgets:
  product_category_label:
  	package: product.label
    basedOn: common.common.label.glyph_text
```

Then you can create the domain specific constructor as follows:

```dart
@design
class ProductCategoryLabel extends HookConsumerWidget with _$ProductCategoryLabel {
  final Product product;
  const ProductCategoryLabel({
    required this.product,
  });
    
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return buildGlyphText(text: product.name, icon: product.icon);
  }
}
```

Finally you can use it as follows:

```dart
```



## Adaptive design

Although you can configure explicitely the variants or use an alias, sometimes it is useful to make the design **adaptive to the context of the widget**. A typical example is **screensize adaptive design** where the widget takes different forms based on the current screensize and the breakpoint configuration.

You can achieve this using the **`adapters`** property.

Using the same `basic_text` example, let's see how to configure it to be adaptive based on the screen breakpoints.

```yaml

```

