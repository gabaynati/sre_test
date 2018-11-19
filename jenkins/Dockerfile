FROM jenkins/jenkins:alpine
# Start jenkins unlocked
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
USER root

# adding plugins, docker and pip-tox
RUN /usr/local/bin/install-plugins.sh \
    git:3.0.5 \
    github:1.26.0 \
    docker-plugin:1.1.5 && \
    apk update && apk add docker \
    python \
    python-dev \
    py-pip \
    build-base && \
    pip install tox