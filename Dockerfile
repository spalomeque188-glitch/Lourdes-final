
FROM alpine:latest

RUN apk add --no-cache ffmpeg

ENV YT_RTMP=rtmp://a.rtmp.youtube.com/live2

CMD ["sh", "-c", "exec ffmpeg -reconnect 1 -reconnect_at_eof 1 -reconnect_streamed 1 -reconnect_delay_max 15 -i 'https://l1b1-lourdes-france.com/ingest/cam_grotte/playlist.m3u8' -c:v copy -c:a aac -b:a 128k -f flv \"$YT_RTMP/$YOUTUBE_STREAM_KEY\""]

