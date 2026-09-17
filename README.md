# claudeskills

## Plugins

The [`code-review`](https://github.com/anthropics/claude-code/tree/main/plugins/code-review)
plugin from the `claude-code-plugins` marketplace (`anthropics/claude-code`) is enabled for
this project in `.claude/settings.json`. It adds a `/code-review:code-review` command that
runs parallel review agents over a PR and filters findings below an 80 confidence score.

Marketplaces declared in project settings are added automatically once you trust the folder,
but a plugin from an external source is not auto-installed. If Claude Code reports it as not
installed, run:

```bash
claude plugin install code-review@claude-code-plugins
```
