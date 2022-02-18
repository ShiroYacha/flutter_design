import useBaseUrl from '@docusaurus/useBaseUrl';
import React from 'react';
import clsx from 'clsx';
import styles from './HomepageFeatures.module.css';

type FeatureItem = {
  title: string;
  image: string;
  description: JSX.Element;
};

const FeatureList: FeatureItem[] = [
  {
    title: 'Easy to Use',
    image: '/img/illustration_easy.svg',
    description: (
      <>
        Easily setup your workflow to allow you to fully focus on your design.
      </>
    ),
  },
  {
    title: 'Minimum boilerplate',
    image: '/img/illustration_build.svg',
    description: (
      <>
        Seamlessly integrate your widgets into the design system catalog with code generation.
      </>
    ),
  },
  {
    title: 'Powerful interactive viewer',
    image: '/img/illustration_debug.svg',
    description: (
      <>
        Design, experiment, debug your design implementation in all scenarios and data models.
      </>
    ),
  },
];

function Feature({ title, image, description }: FeatureItem) {
  return (
    <div className={clsx('col col--4')}>
      <div className="text--center">
        <img
          className={styles.featureSvg}
          alt={title}
          src={useBaseUrl(image)}
        />
      </div>
      <div className="text--center padding-horiz--md">
        <h3>{title}</h3>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures(): JSX.Element {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}
