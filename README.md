# Mute

> A command-line utility to enable or disable "Do Not Disturb" on macOS

## Motivation

I want to automatically toggle "Do Not Disturb" at multiple times during the day.   macOS' System Preferences does provide for this.  I can couple this with user agents via `launchd`.

Also I wanted to try to do something with swift.  It's pretty cool, but Core Foundation isn't.

## Install

Given that I don't know anything about code signing, packaging, nor distribution of a macOS app, you're going to have to:

1. Install XCode, etc.
1. Clone this repo and navigate to your working copy
1. Run this to build:

    ```bash
    $ swift build -c release -Xswiftc -static-stdlib
    ```
1. Copy resulting `.build/release/mute` to somewhere in your `$PATH`, e.g.:

    ```bash
    $ cp .build/release/mute /usr/local/bin/
    ```

## Usage

### Enable "Do Not Disturb"

```bash
$ mute
```

### Disable "Do Not Disturb"

```bash
$ mute off
```

## Prior Art

- [Building a command line tool using the Swift Package Manager](https://www.swiftbysundell.com/posts/building-a-command-line-tool-using-the-swift-package-manager)
- [Is it possible to turn on/off "do not disturb" for OS X programmatically?](https://stackoverflow.com/questions/25210120/is-it-possible-to-turn-on-off-do-not-disturb-for-os-x-programmatically)

## License

© 2018 Christopher Hiller.  Licensed MIT
