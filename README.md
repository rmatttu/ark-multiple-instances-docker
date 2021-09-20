# ark-multiple-instances-docker
ARK: Survival Evolved multiple instances server dockerfile.

## Usage

## Requirements

## Installation

### Setup

Build directories.

```bash
mkdir -p share/ark/ARK-Backups
mkdir -p share/ark/instances/{main,sub}
mkdir -p share/ark/log/arktools
echo \* >> share/.gitignore
```

Instances settings.

```bash
cp arkmanager.cfg share/
mkdir -p share/instances
cp main.cfg share/instances/
cp Game.ini share/instances/main.Game.ini
cp sub.cfg share/instances/
cp Game.ini share/instances/sub.Game.ini
```

### Start

Run container and exec bash.

```bash
docker-compose up -d
docker-compose exec ark bash

whoami
# steam
```

Run arkmanager

```bash
arkmanager install
# ... That will take some time.
```

Run ARK instances.

```bash
arkmanager start @main
# ... Wait 10 minutes.
arkmanager status @main
# OK

arkmanager start @sub
# ... Wait 10 minutes.
arkmanager status @sub
# OK
```

※ `arkmanager start @all` command did not work my machine...
