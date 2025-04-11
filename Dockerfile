FROM n8nio/n8n:latest

USER root

RUN apk add --no-cache \
    ffmpeg \
    python3 \
    py3-pip \
    bash \
    curl \
    unzip \
    groff \
    less

# Tạo virtualenv và cài awscli trong đó
RUN python3 -m venv /opt/awscli-env \
    && . /opt/awscli-env/bin/activate \
    && pip install awscli

# Thêm alias để tiện gọi aws từ shell
ENV PATH="/opt/awscli-env/bin:$PATH"

USER node