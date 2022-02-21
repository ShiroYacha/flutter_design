import React from "react";
import Link from "@docusaurus/Link";
import Translate, { translate } from "@docusaurus/Translate";
import useDocusaurusContext from "@docusaurus/useDocusaurusContext";
import useBaseUrl from "@docusaurus/useBaseUrl";
import { CodeSnippet } from "../CodeSnippet";
import { VideoSnippet } from "../VideoSnippet";
import DesignSampleCode from '!!raw-loader!/static/snippets/buttons.dart';


export const Banner: React.FC = () => {
  const { siteConfig } = useDocusaurusContext();

  return (
    <header className="banner">
      <div className="banner__content">
        <h1 className="banner__logo">
          <img src="img/logo.png" alt="flutter_design" />
          {siteConfig.title}
        </h1>

        <h1 className="banner__headline">
          <Translate id="home.tagline">
            Supercharge Flutter UX development
          </Translate>
        </h1>

        <div>
          <Link className="banner__cta" to={useBaseUrl("docs/get_started")}>
            <Translate id="home.get_started">Get Started</Translate>
          </Link>
          <Link className="banner__ctb" to="https://flutter-design-7b479.web.app/">
            <Translate id="home.demo">Play with demo 🚀</Translate>
          </Link>
        </div>
      </div>
      <div className="banner__content">
        <CodeSnippet
          title={translate({
            id: "home.annotate_design_widget",
            message: "Annotate your widget",
          })}
          snippet={DesignSampleCode}
        ></CodeSnippet>
      </div>
      <div className="banner__content">
        <VideoSnippet
          title={translate({
            id: "home.debug_design_widget",
            message: "Debug your widget",
          })}
          url='/vids/widget_viewer.gif'
        ></VideoSnippet>
      </div>
    </header>
  );
};
