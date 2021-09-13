# docker build --rm --force-rm -t testudinal_haskell:latest .

# docker run -it --rm -v $PWD:/home/jovyan/pwd --name testudinal_haskell testudinal_haskell:latest bash

# docker run --privileged --rm --net=host --env DISPLAY=':0' -v $PWD:/home/jovyan/pwd --name testudinal_haskell testudinal_haskell:latest


FROM ghcr.io/jamesdbrock/ihaskell-notebook:master

# RUN apt-get update && apt-get install -yq --no-install-recommends \

USER root

# https://code.visualstudio.com/docs/setup/linux#_debian-and-ubuntu-based-distributions

# RUN \
#      sh -c 'wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg' \
#   && install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/ \
# #  && ls -l /etc/apt/trusted.gpg.d/ \
#   && sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list' \
# #  sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /var/lib/apt/lists/vscode.list' \
# #  && ls -l /var/lib/apt/lists/ \
#   && rm -f packages.microsoft.gpg \
#   && apt-get install -yq apt-transport-https \
#   && apt-get update \
#   && apt-get install -yq code \
#   && rm -rf /var/lib/apt/lists/*

# # https://code.visualstudio.com/docs/setup/linux#_installing-rpm-package-manually
# RUN \
#      curl -sSL --output code.deb https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64 \
#   && 

# https://code.visualstudio.com/docs/editor/portable

# https://stevenklambert.com/writing/comprehensive-guide-building-packaging-electron-app/

# https://daksh-jain00.medium.com/running-gui-app-vscode-in-a-docker-container-9162a8822c63

RUN apt-get update && apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg \
        --no-install-recommends

RUN curl -sSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor  | apt-key add -

RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list

RUN apt-get update && apt-get -y install \
        code git \
        libasound2 \
        libatk1.0-0 \
        libcairo2 \
        libcups2 \
        libexpat1 \
        libfontconfig1 \
        libfreetype6 \
#        libgtk2.0-0 \
        libgtk-3-0 \
        libpango-1.0-0 \
        libx11-xcb1 \
        libxcomposite1 \
        libxcursor1 \
        libxdamage1 \
        libxext6 \
        libxfixes3 \
        libxi6 \
        libxrandr2 \
        libxrender1 \
        libxss1 \
        libxtst6 \
        libxshmfence-dev\
        openssh-client \
        --no-install-recommends \
        && rm -rf /var/lib/apt/lists/*

# Switch back to jovyan user
USER $NB_UID

RUN code --install-extension ms-toolsai.jupyter@2021.8.2041215044
RUN code --install-extension justusadam.language-haskell

# RUN mkdir ~/codedata
# CMD [ "/usr/bin/code","--user-data-dir=/~/codedata","--verbose" ]
# CMD [ "/usr/bin/code","--verbose","~/pwd" ]
# CMD [ "/usr/bin/code","--user-data-dir=~/codedata","--verbose","~/pwd" ]
CMD [ "/usr/bin/code","--disable-gpu","--verbose","~/pwd" ]

