# jimeh's Dockerfiles

Small collection of Docker and Docker Compose files I use to run stuff on my
personal laptop.

Additionally I also have a few shell aliases for Docker that make my life
easier:
[docker.sh](https://github.com/jimeh/dotfiles/blob/master/shell/docker.sh)

## Notes

- The `mysql` compose file uses a named volume, instead of mounting a directory
  on the host. This is due to a
  [bug](https://forums.docker.com/t/posix-fallocate-issues/11370) in the OS X
  Beta version of Docker. Once the bug is resolved, I'll be mounting a host
  directory instead.
