# The Broken Thrones (Android)

The game is `www/index.html`. Every push to `main` builds the Android app on GitHub
and posts `TheBrokenThrones.apk` under **Releases → latest**.

To update the game: replace `www/index.html` and push.

## Updates
`www/index.html` is a small loader. It runs the newest game it has: the bundled
`www/game.html`, or a newer copy downloaded through **Check for updates** on the
title screen (kept on the phone; saves are untouched).

To ship a game update: `tools/release.sh path/to/game.html "What changed"`, then
commit and push. Phones pick it up from `www/version.json` + `www/game.html`
on the `main` branch. A new APK is only needed for app-level changes.
