FROM alpine:latest
RUN  mkdir /code && \ 
  mkdir ~/.ssh && \
  chmod 0700 ~/.ssh && \
  apk update && \
  apk add --no-cache openssh libffi-dev libc-dev openssl-dev gcc python3-dev py-pip && \
  rm -rf /tmp/* && \
  rm -rf /var/cache/apk/* 
WORKDIR /code
COPY requirements.txt .
RUN pip install -r /code/requirements.txt
ENV SSH_AUTH_SOCK "/ssh-agent"
