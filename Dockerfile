FROM kalilinux/kali-rolling

RUN apt update && apt install -y \
    xfce4 xfce4-goodies \
    novnc net-tools \
    tightvncserver dbus-x11 \
    firefox-esr

RUN mkdir -p ~/.vnc && echo "kali123" | vncpasswd -f > ~/.vnc/passwd && chmod 600 ~/.vnc/passwd

RUN apt clean

EXPOSE 5901 6080

CMD bash -c "vncserver :1 -geometry 1280x720 -depth 24 && /usr/share/novnc/utils/launch.sh --vnc localhost:5901 --listen 6080"
