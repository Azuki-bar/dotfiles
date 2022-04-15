ffmpeg -f x11grab -video_size 1920_1080 -i :0.0+0,0 -vf 'scale=1920:-1' -framerate 30 -preset superfast -tune zerolatency -f mpegts 'srt://100.79.38.70:30000'
