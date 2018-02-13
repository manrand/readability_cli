FROM node:9.5.0-slim

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# transfer scripts
COPY *.bash /usr/src/app/

# transfer config data
COPY package.json /usr/src/app/

# setup the image (install tools, etc.)
RUN ./install_dependencies.bash

# transfer code
COPY . /usr/src/app

CMD ["bash"]

