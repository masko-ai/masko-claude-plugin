# Masko for Claude

This plugin forwards selected Claude Cowork lifecycle hooks to Masko Desktop so your mascot can react while you work.

## Requirements

- Masko Desktop running locally
- `$HOME/.masko-desktop/hooks/hook-sender` installed by Masko Desktop
- Claude Cowork

## Hooks

- `SessionStart`
- `UserPromptSubmit`
- `PreToolUse`
- `PermissionRequest`
- `PostToolUse`
- `PostToolUseFailure`
- `Stop`
- `StopFailure`
- `PreCompact`
- `PostCompact`
- `TaskCompleted`

## Behavior

Each hook calls the local Masko hook sender:

```bash
$HOME/.masko-desktop/hooks/hook-sender --source claude-cowork
```

If Masko Desktop is not installed, the hook exits successfully without blocking Claude Cowork.

`PermissionRequest` is intentionally synchronous so Masko can test returning an
allow or deny decision to Cowork. All other hooks run asynchronously.
