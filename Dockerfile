# 本体
#
# VERSION               0.0.1
FROM gendosu/ruby-node:ruby-2.6.3-node-12.1.0
ENV PATH "/products/node_modules/.bin:$PATH"
ADD . /app
WORKDIR /app
RUN apt-get update \
  && apt-get install -y locales \
  && locale-gen ja_JP.UTF-8 \
  && echo "export LANG=ja_JP.UTF-8" >> ~/.bashrc
ENV LANG C.UTF-8
# RUN yarn
RUN gem install bundler:2.0.2
RUN bundle
ENTRYPOINT ["./entrypoint.sh"]
