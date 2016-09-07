github_changelog_generator
==========================

Dockerfile for github_changelog_generator.

See https://github.com/skywinder/github-changelog-generator


Invoke using compose:
```
docker-compose run changelog --version
Starting dockergithubchangeloggenerator_data_1
Version: 1.13.1
```

Invoke using docker run:
```
docker run --rm \
           --interactive \
           --tty \
           --net "host" \
           -v "$(pwd):$(pwd)" \
           -w $(pwd) \
           -it muccg/github-changelog-generator --help
```
