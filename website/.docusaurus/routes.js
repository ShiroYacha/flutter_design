
import React from 'react';
import ComponentCreator from '@docusaurus/ComponentCreator';

export default [
  {
    path: '/blog/archive',
    component: ComponentCreator('/blog/archive','f4c'),
    exact: true
  },
  {
    path: '/docs',
    component: ComponentCreator('/docs','36e'),
    routes: [
      {
        path: '/docs/codegen/annotation',
        component: ComponentCreator('/docs/codegen/annotation','7a1'),
        exact: true,
        'sidebar': "Sidebar"
      },
      {
        path: '/docs/codegen/generators',
        component: ComponentCreator('/docs/codegen/generators','767'),
        exact: true,
        'sidebar': "Sidebar"
      },
      {
        path: '/docs/codegen/overview',
        component: ComponentCreator('/docs/codegen/overview','d3f'),
        exact: true,
        'sidebar': "Sidebar"
      },
      {
        path: '/docs/concepts',
        component: ComponentCreator('/docs/concepts','fe4'),
        exact: true,
        'sidebar': "Sidebar"
      },
      {
        path: '/docs/designer/data_builder',
        component: ComponentCreator('/docs/designer/data_builder','38d'),
        exact: true,
        'sidebar': "Sidebar"
      },
      {
        path: '/docs/designer/overview',
        component: ComponentCreator('/docs/designer/overview','178'),
        exact: true,
        'sidebar': "Sidebar"
      },
      {
        path: '/docs/designer/pages',
        component: ComponentCreator('/docs/designer/pages','644'),
        exact: true,
        'sidebar': "Sidebar"
      },
      {
        path: '/docs/designer/widget_designer',
        component: ComponentCreator('/docs/designer/widget_designer','4a6'),
        exact: true,
        'sidebar': "Sidebar"
      },
      {
        path: '/docs/faq',
        component: ComponentCreator('/docs/faq','9cc'),
        exact: true,
        'sidebar': "Sidebar"
      },
      {
        path: '/docs/get_started',
        component: ComponentCreator('/docs/get_started','661'),
        exact: true,
        'sidebar': "Sidebar"
      },
      {
        path: '/docs/official_examples/demo_example',
        component: ComponentCreator('/docs/official_examples/demo_example','20b'),
        exact: true,
        'sidebar': "Sidebar"
      },
      {
        path: '/docs/roadmap',
        component: ComponentCreator('/docs/roadmap','98c'),
        exact: true,
        'sidebar': "Sidebar"
      }
    ]
  },
  {
    path: '/',
    component: ComponentCreator('/','f49'),
    exact: true
  },
  {
    path: '*',
    component: ComponentCreator('*')
  }
];
