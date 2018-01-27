# Dockerized Firefox

## Why?

Because an ephemeral filesystem makes sense in my threat model.

## Installation

Read `deploy.sh` and `firefox` and maybe change `INSTALL_PREFIX` and `WORKDIR` respectively.

Run `./deploy.sh`.

## Usage

`firefox` should now be in your $PATH. So, run `firefox` from a terminal or dmenu et al (or make a firefox.desktop shortcut).

## Dependencies

Docker, sudo, sakura (terminal for --no-interaction), X, alsa for sound(?).

Customize to your needs.

## Tips

This Docker setup assumes your user is not in the docker-group, and you are not root. It will try to use sudo to elevate your privileges - you can give your user NOPASSWD sudo access to the `firefox` script. This should be "safe" since it takes no actual user input.

## Contributing

If you want to contribute, feel free to make a pull request on [Github](https://github.com/Xiaogrill/docker-firefox), please read [CONTRIBUTING](CONTRIBUTING) and [the license](UNLICENSE) first.
