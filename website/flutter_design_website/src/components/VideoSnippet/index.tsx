import React from "react";
import GifPlayer from "react-gif-player";

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
          <GifPlayer gif={url} autoplay />
        </div>
      </div>
    </div>
  );
};
