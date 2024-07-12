# Linux Alass batch generator
A linux bash script that uses alass to correct subtitles in batch.

> [!IMPORTANT]
> Please note that you need linux to run this script or run it in WSL.
> If you run it in WSL you will still need the <b>linux</b> `alass` binary.

## Installation
### Download the binary
Download the <b>linux</b> `alass` binary from https://github.com/kaegi/alass/releases.

### Clone the project
```bash
git clone https://github.com/Sitolam/alass-batch_generator
cd alass-batch_generator
```
Put the `alass` binary in the cloned directory.

## Usage
```bash
usage: ./batch.sh <movieDir> <sourceDirSubs> <movieExtension> <optional:alassDir>
```
> [!CAUTION]
> Don't put a slash after the `<movieDir>` and `<sourceDirSubs>`!
> Don't put quotation mark around the directories!
