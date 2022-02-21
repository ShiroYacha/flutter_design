import React from "react";
import Translate, { translate } from "@docusaurus/Translate";
import { IHighlightProps } from "../components/Highlight";

export const highlights: IHighlightProps[] = [
  {
    imageUrl: "img/highlights/illustration_easy.svg",
    title: translate({
      id: "homepage.easy_to_use_title",
      message: "Easy to Use",
    }),
    description: (
      <Translate
        id="homepage.easy_to_use_body"
      >
        {`Easily setup your workflow to allow you to fully focus on your design & fine tune it to perfection.`}
      </Translate>
    ),
  },
  {
    imageUrl: "img/highlights/illustration_build.svg",
    title: translate({
      id: "homepage.minimum_boilerplate_title",
      message: "Minimum boilerplate",
    }),
    description: (
      <Translate id="homepage.minimum_boilerplate_body">
        Seamlessly integrate your widgets into the design system catalog with code generation.
      </Translate>
    ),
  },
  {
    imageUrl: "img/highlights/illustration_debug.svg",
    title: translate({
      id: "homepage.interactive_viewer_title",
      message: "Powerful interactive designer",
    }),
    description: (
      <Translate
        id="homepage.interactive_viewer_body"
      >
        Design, experiment, debug your design implementation in all scenarios and data models using the cross-platform designer tool.
      </Translate>
    ),
  },
];
