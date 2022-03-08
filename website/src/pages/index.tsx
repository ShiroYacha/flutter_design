import React from 'react';
import Layout from '@theme/Layout';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import { Banner } from "../components/Banner";
import { Feature } from "../components/Feature";
import { Highlight } from "../components/Highlight";
import { features } from "../data/features";
import { highlights } from "../data/highlights";
import ReactBreakpoints from 'react-breakpoints'

const breakpoints = {
  mobile: 320,
  mobileLandscape: 480,
  tablet: 768,
  tabletLandscape: 1024,
  desktop: 1200,
  desktopLarge: 1500,
  desktopWide: 1920,
}

export default function Home(): JSX.Element {
  const { siteConfig } = useDocusaurusContext();
  return (
    <ReactBreakpoints breakpoints={breakpoints}>
      <Layout
        title={`${siteConfig.title}`}
        description="Supercharge your Flutter UX development">
        <Banner />
        <main>
          <section>
            <div className="highlight__container">
              {highlights.map((props, index) => (
                <Highlight key={`highlight-${index}`} {...props} />
              ))}
            </div>
          </section>

          <section>
            {features.map((props, index) => (
              <Feature
                key={`feature-${index}`}
                {...props}
                direction={index % 2 == 0 ? "normal" : "reverse"}
              />
            ))}
          </section>
        </main>
      </Layout>
    </ReactBreakpoints>
  );
}
