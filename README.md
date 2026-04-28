<p align="center">
<a href="https://github.com/martinschumann/bash-profile-rc/actions"><img src="https://github.com/martinschumann/bash-profile-rc/actions/workflows/ci.yaml/badge.svg" alt></a>
</p>

# bash-profile-rc

Comforting on a machine.

## Installation

Download repo.

```bash
git clone git@github.com:martinschumann/bash-profile-rc.git

cd bash-profile-rc
```

Link repo's `.bash_profile` as start up file.

```bash
./link-bash-profile.sh
```

Enable all run command files.

```bash
./enable-rc.sh all
```

Enable only a specific command.

```bash
./enable-rc.sh outgoing-ip
```

Disable all run command files.

```bash
./enable-rc.sh all
```
