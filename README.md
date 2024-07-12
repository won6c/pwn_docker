#How to build docker for pwn with Dockerfile
---
1. docker build -t [image name]:[tag] or docker build . (if you have Dockerfile)
2. docker run -it -d --name [container name] [imagename]:[tag]
3. docker exec -it [container name] /bin/bash

#To attach gdb at poc.py
---
1. apt-get install tmux
2. $tmux
3. attach to poc.py -> context.terminal = ["tmux","splitw","-h"]
4. run poc.py in the tmux

-> apt-get install tmux로 tmux설치

-> poc.py에 context.terminal = ["tmux","splitw","-h"] 추가

-> tmux실행

-> tmux를 실행하여 들어온 상태로 poc.py 실행

-> 창을 전환하는 방법 : ctrl + b를 누르고 땐 후 방향키를 통하여 조작
