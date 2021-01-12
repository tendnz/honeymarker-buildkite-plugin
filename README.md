# Honeycomb Honeymarker Buildkite Plugin

A [Buildkite plugin](https://buildkite.com/docs/agent/v3/plugins) to add a marker in Honeycomb when you do something in Buildkite

Based heavily on [Git Commit](https://github.com/thedyrt/git-commit-buildkite-plugin).

Uses Honeymarker under the hood:

https://docs.honeycomb.io/working-with-your-data/customizing-your-query/markers/

## Example

```yml
steps:
  - command: make
    plugins:
      - tendnz/honeymarker#v1.0.0:
          message: "v1.0.0-prod" 
          writekey: $HONEYCOMB_WRITE_KEY
          dataset: tend-dev-testing
```

With all options customized:

```yml
steps:
  - command: make
    plugins:
      - tendnz/git-tag#v1.0.7:
          message: "v1.0.0-prod"
          writekey: $HONEYCOMB_WRITE_KEY
          dataset: tend-dev-testing
          url: https://buildite.com/somewhere
          type: prod-deploys
```

## Configuration

- **message** (required))

    The message for the marker.

- **writekey** (required)

    Your honeycomb write key. Put the actual values in your secrets and use the ENV name. 

    ```
      writekey: $YOUR_ENV_NAME
    ```

    DONT put it into the YML!

- **dataset** (required)

    The name of the Honeycomb dataset to write to.

- **url** (optional)

  The URL to attach to the marker

- **type** (optional)

  The type. Freeform, but the same type will have the same color. Defaults to "deploy"

- **update** (optional)

  Should we update? set to "true" if so (default to false) (has to have a false be run first!)

  Note that update uses a key from the previous "create", which is stored in a meta-data variable. If you want overlapping markers, include a update key

- **updatekey** (optional)

  The key to use for overlapping markers. Means we can work out which marker to close when we update.



## Tests / Linting

you can try it out with

```bash
WRITEKEY=xxxxxxxx DATASET=your-dataset-name MESSAGE="Hello World" tests/quicktest.sh
```

To run the tests of this plugin, run

```sh
docker-compose run --rm tests
```

To run the [Buildkite Plugin Linter](https://github.com/buildkite-plugins/buildkite-plugin-linter), run

```sh
docker-compose run --rm lint
```

## License

MIT (see [LICENSE](LICENSE))
