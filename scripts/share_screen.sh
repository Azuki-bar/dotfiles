ffmpeg -f x11grab -video_size 1920_1080 -i :0.0+0,0 -vf 'scale=1920:-1' -framerate 30 -preset superfast -tune zerolatency -f mpegts 'srt://192.168.0.4:30000'
