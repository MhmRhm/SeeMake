# Inspired by https://github.com/devcontainers/images/tree/main/src/cpp
ARG VARIANT=ubuntu-24.04
FROM mcr.microsoft.com/devcontainers/base:${VARIANT}
USER root

# Install needed packages. Use a separate RUN statement to add your own dependencies.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install git cmake build-essential gdb \
    doxygen graphviz clang-format valgrind gawk cppcheck lcov \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*
