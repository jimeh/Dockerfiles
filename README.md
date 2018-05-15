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

## License

```
        DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                    Version 2, December 2004

 Copyright (C) 2018 Jim Myhrberg

 Everyone is permitted to copy and distribute verbatim or modified
 copies of this license document, and changing it is allowed as long
 as the name is changed.

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

  0. You just DO WHAT THE FUCK YOU WANT TO.
```
