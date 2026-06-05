# Masko for Claude

This repository is the Claude plugin marketplace for Masko.

## Install

In Claude, open **Customize** > **Plugins** > **+** > **Add marketplace**, then add:

```text
masko-ai/masko-claude-plugin
```

Install **Masko for Claude** from the marketplace.

## What It Does

The plugin forwards Claude Cowork lifecycle hooks to Masko Desktop so your mascot can react while you work.

It currently listens for:

- `SessionStart`
- `UserPromptSubmit`
- `Stop`

## Requirements

- Masko Desktop installed and running
- Claude Cowork

Claude normal chat can install plugins, but hooks run in Claude Cowork.

## Privacy

The hook script forwards Claude hook payloads to the local Masko Desktop listener on your machine. It does not include any Masko secrets or API keys.

If Masko Desktop is not installed or the local hook sender is missing, the hook exits without doing anything.
