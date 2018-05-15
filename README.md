# jimeh's Dockerfiles

Small collection of Docker and Docker Compose files I use to run stuff on my
personal laptop.

Additionally I also have a few shell aliases for Docker that make my life
easier:
[docker.sh](https://github.com/jimeh/dotfiles/blob/master/shell/docker.sh)

## Notes

- The `elasticsearch`, `mysql`, `rabbitmq` containers store their data in a
  named volume instead of a directory mounted from the host. This is due to a
  [bug](https://forums.docker.com/t/posix-fallocate-issues/11370) in Docker for
  Mac.
