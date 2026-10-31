# PS4 Dashboard — modular build

This branch introduces a small module layout while keeping `Ps4_v2.lua` as the entry point.

## Layout

- `Ps4_v2.lua` — dashboard entry point and feature orchestration
- `modules/Colors.lua` — color palette
- `modules/Buttons.lua` — PlayStation face-button image IDs and tint setting
- `modules/Sounds.lua` — sound asset IDs
- `modules/Settings.lua` — default user settings
- `modules/UIFactory.lua` — shared UI constructors

## Loading

The entry point fetches modules from this branch's `modules/` directory. Keep the branch path in the module URL in sync if the branch is renamed.

## Security note

Discord webhook URLs were removed from the client script. Posting is disabled until a private server-side endpoint is configured. Any webhook that was previously committed publicly must be regenerated in Discord; deleting it from the latest file does not invalidate the old URL or erase Git history.

## Compatibility

The existing standalone script on the `main` branch and the original `Dreamhacker-Fear/Ps4` project have not been changed by this modular branch.
