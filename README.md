# Uberspace 7 Manual

Welcome to our manual! :tada:

This is where we host the source code of the official version over at
<https://manual.uberspace.de>. Changes are mainly done by the team as new
features are added and bugs are fixed, but you are more than welcome to
contribute!

## Development

Pushing for each and every change is fun, but can take some time. To speed up
your development process, the manual can be built locally.

### Initial Setup

```
make setup
```

### Building

```
$ source .venv/bin/activate
$ make html
```

The HTML views are now present in `build/html`. To build automatically on each
change execute use `sphinx-autobuild`:

```
$ make serve
```

This will start a local webserver on <http://127.0.0.1:8000>, which always
serves the most recent version.

## License

All text and code in this repository is licensed under [CC-BY-NC-SA 4.0][].

[cc-by-nc-sa 4.0]: https://creativecommons.org/licenses/by-nc-sa/4.0/
