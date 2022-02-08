FROM python:3.7-slim
ARG VERSION
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8
ENV TZ=Asia/Shanghai
ENV debug=true
COPY . /opt/dongtai/baseimagetest
WORKDIR /opt/dongtai/baseimagetest
RUN pip install pytest PyMySQL

CMD ["pytest"]
