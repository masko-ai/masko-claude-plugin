# Masko for Claude

This plugin forwards selected Claude Cowork lifecycle hooks to Masko Desktop so your mascot can react while you work.

## Requirements

- Masko Desktop running locally
- `$HOME/.masko-desktop/hooks/hook-sender` installed by Masko Desktop
- Claude Cowork

## Hooks

- `SessionStart`
- `UserPromptSubmit`
- `Stop`

## Behavior

Each hook calls the local Masko hook sender:

```bash
$HOME/.masko-desktop/hooks/hook-sender --source claude-cowork
```

If Masko Desktop is not installed, the hook exits successfully without blocking Claude Cowork.
