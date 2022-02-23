import 'package:flutter_design/flutter_design.dart';

const docPages = [
  ViewerDocumentPage(
    id: 'intro',
    namespace: ['get_started'],
    title: 'Introduction',
    subtitle:
        'Wanda is Wonderflow\'s open-source design system built for products and digital experiences.',
    description:
        'Example text and design copied from https://design.wonderflow.ai/. ',
    sections: [
      ViewerSectionUnion.paragraph(
        id: 'overview',
        title: 'Overview',
        description: '''
A Design System is the single source of truth which groups all the elements that will allow teams to build digital products.
\n
We, as diverse humans, have our own unique way to think about problems and we walk different roads to find solutions. Usually, that is celebrated, but when cooperating to build products, that could lead to an uncoordinated user experience. Wanda aims to provide a solid guidance for designers and developers, to reduce the risks of divergence.
                    ''',
      ),
      ViewerSectionUnion.paragraph(
        id: 'principle',
        title: 'Principles',
        description: '''''',
        contents: [
          [
            ViewerImageCollectionItem(
              style: ViewerImageCollectionItemStyle.imageOnLeft,
              title: 'Accessibility',
              description:
                  '''In 2016 the UN declared Internet access as a human right. We, as builder of web technologies, have a responsibility to [create products that are accessible](/get_started/accessibility) to the highest number of people, just like an architect tries to eliminate architectural barrier when designing public building.''',
              width: 300,
              height: 300,
              url:
                  'https://images.pexels.com/photos/7434255/pexels-photo-7434255.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
            ),
            ViewerImageCollectionItem(
              style: ViewerImageCollectionItemStyle.imageOnLeft,
              title: 'Form follows function',
              description:
                  '''When time or resources are limited, what design trade-offs would least harm the design’s success? Wanda approach aims to serve human needs while carefully considering human behaviour. Our Design Language aspire to create beauty as a byproduct of functionality, rather than mere decoration.''',
              width: 300,
              height: 300,
              url:
                  'https://images.pexels.com/photos/9999717/pexels-photo-9999717.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
            ),
            ViewerImageCollectionItem(
              style: ViewerImageCollectionItemStyle.imageOnLeft,
              title: 'Progress over perfections',
              description:
                  '''Wanda is a constantly evolving product that represent our best shot at a Design system yet. We're sure that our future selves will have a lot to disagree about decision that we took today — and that's perfectly ok: done is better than perfect.''',
              width: 300,
              height: 300,
              url:
                  'https://images.pexels.com/photos/10611115/pexels-photo-10611115.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
            ),
          ]
        ],
      ),
    ],
  ),
  ViewerDocumentPage(
    id: 'accessibility',
    namespace: ['get_started'],
    title: 'Accessibility',
    subtitle:
        'Wanda is Wonderflow\'s open-source design system built for products and digital experiences.',
    sections: [
      ViewerSectionUnion.paragraph(
        id: 'overview',
        title: 'Overview',
        description: '''
Wanda follows the WAI-ARIA authoring practices guidelines and are tested in a wide selection of modern browsers and commonly used assistive technologies.
                    ''',
      ),
      ViewerSectionUnion.paragraph(
        id: 'wai_aria',
        title: 'WAI-ARIA',
        description:
            '''[WAI-ARIA](https://www.w3.org/TR/wai-aria-1.2/), published and maintained by the W3C, specifies the semantics for many common UI patterns that show up in Wanda's components. This is designed to provide meaning for controls that aren't built using elements provided by the browser. For example, if you use a div instead of a button element to create a button, there are attributes you need to add to the div in order to convey that it's a button for screen readers or voice recognition tools, and this is why should use a button in these situations.\n
In addition to semantics, there are behaviors that are expected from different types of components. A button element is going to respond to certain interactions in ways that a div will not, so it's up to the developer to reimplement those interactions with JavaScript. The [WAI-ARIA authoring practices](https://www.w3.org/TR/wai-aria-practices-1.2/) provide additional guidance for implementing behaviors for various controls that come with Wanda's components.''',
      ),
      ViewerSectionUnion.paragraph(
        id: 'accessible_labels',
        title: 'Accessible labels',
        description:
            '''With many built-in form controls, the native HTML `label` element is designed to provide semantic meaning and context for corresponding input elements. For non-form control elements, or for custom controls like those provided by Wanda, WAI-ARIA [provides a specification](https://www.w3.org/TR/wai-aria-1.2/#namecalculation) for how to provide accessible names and descriptions to those contols.\n
Where possible, Wanda's components include abstractions to make labelling our controls simple. The `label` primitive is designed to work with many of our controls. Ultimately it's up to you to provide those labels so that users have the proper context when navigating your application.''',
      ),
    ],
  ),
  ViewerDocumentPage(
    id: 'brand',
    namespace: ['design'],
    title: 'Brand',
    description: 'Wonderflow\'s digital identity',
  ),
  // ViewerDocumentPage(
  //   id: 'colors',
  //   namespace: ['design', 'foundations'],
  //   title: 'Colors',
  // ),
  // ViewerDocumentPage(
  //   id: 'typography',
  //   namespace: ['design', 'foundations'],
  //   title: 'Typography',
  // ),
  // ViewerDocumentPage(
  //   id: 'elevations',
  //   namespace: ['design', 'foundations'],
  //   title: 'Elevations',
  // ),
  // ViewerDocumentPage(
  //   id: 'iconography',
  //   namespace: ['design'],
  //   title: 'Iconography',
  // ),
  // ViewerDocumentPage(
  //   id: 'themes',
  //   namespace: ['design'],
  //   title: 'Themes',
  // ),
  // ViewerDocumentPage(
  //   id: 'buttons',
  //   namespace: ['design', 'recipes'],
  //   title: 'Buttons',
  // ),
  // ViewerDocumentPage(
  //   id: 'dropdown',
  //   namespace: ['design', 'recipes'],
  //   title: 'Dropdown',
  // ),
];
