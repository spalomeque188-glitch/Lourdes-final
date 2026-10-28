FROM jrottenberg/ffmpeg:4.4-ubuntu2004
RUN apt-get update && apt-get install -y python3
ENTRYPOINT []
CMD ["sh","-c","python3 -m http.server 7860 & exec ffmpeg -re -i https://l1b1-lourdes-france.com/ingest/cam_grotte/playlist.m3u8 -c:v libx264 -preset veryfast -b:v 2000k -c:a aac -f flv rtmp://a.rtmp.youtube.com/live2/$YOUTUBE_KEY"]
