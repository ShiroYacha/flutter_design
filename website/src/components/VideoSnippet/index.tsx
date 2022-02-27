import React from "react";
import ExecutionEnvironment from '@docusaurus/ExecutionEnvironment';
import BrowserOnly from '@docusaurus/BrowserOnly';

var GifPlayer;
if (ExecutionEnvironment.canUseDOM) {
  GifPlayer = require('react-gif-player');
}

interface VideoSnippetProps {
  title?: string;
  url: string;
}

export const VideoSnippet: React.FC<VideoSnippetProps> = ({ url, title }) => {
  return (
    <div className="vidsnippet">
      <div className="vidsnippet__title_bar">
        <div className="vidsnippet__dots">
          <div className="vidsnippet__dot"></div>
          <div className="vidsnippet__dot"></div>
          <div className="vidsnippet__dot"></div>
        </div>
        <div className="vidsnippet__title">{title}</div>
      </div>
      <div className="vidplayer_container">
        <div className="vidplayer">
          <BrowserOnly>
            {() => <GifPlayer className="gifplayer" gif={url} autoplay />}
          </BrowserOnly>
        </div>
      </div>
    </div>
  );
};
