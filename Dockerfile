FROM jetpackio/devbox:latest

# Installing your devbox project
WORKDIR /code
USER ${DEVBOX_USER}:${DEVBOX_USER}
COPY --chown=${DEVBOX_USER}:${DEVBOX_USER} devbox.json devbox.json
COPY --chown=${DEVBOX_USER}:${DEVBOX_USER} devbox.lock devbox.lock
RUN devbox run -- echo "Installed Packages."

COPY --chown=${DEVBOX_USER}:${DEVBOX_USER} myblog ./myblog
COPY --chown=${DEVBOX_USER}:${DEVBOX_USER} process-compose.yml .

EXPOSE 8080

RUN devbox run generate
CMD ["devbox", "run", "serve"]
