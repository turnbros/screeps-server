FROM node:latest

ARG screeps_version=4.2.12
ARG screeps_mods="screepsmod-mongo screepsmod-auth screepsmod-tickrate screepsmod-admin-utils screepsmod-features"

RUN apt-get update && \
    apt-get install -y \
      python \
      g++ \
      build-essential \
      net-tools \
      nano \
      dos2unix
RUN echo $(python -V)

WORKDIR /app

# RUN npm install isolated-vm
RUN npm install screeps@${screeps_version}
RUN npm install ${screeps_mods}

EXPOSE 21025
EXPOSE 21026

HEALTHCHECK CMD netstat -an | grep 21025 > /dev/null; if [ 0 != $? ]; then exit 1; fi;

ENTRYPOINT [ "/usr/bin/screeps" ]
CMD ["start"]
