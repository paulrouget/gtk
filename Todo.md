Todo:

- the window control function `get_size/draw` seem to be public. Why?
- *todo_4*: after popup is dissmissed, window lose focus
- window is moved to random location after double click after double click (yes, twice)
- arrow popup has a weird background
- hamburger menu > keyboard shortcuts > new popup has no close button
- Dark/Light switch is inconsistent
- the `_tileTitlebarAndRedisplay` hack doesn't seem to work
- The font seems wrong
- fullscreen buttons are cropped (see `PROP_FULLSCREENED` message)
- figure out when to send back events to NSApp
- The window controls size is only known when window is up. We send a fake message for re-layout (`PROP_ICON_NAME`).
- support accent color
- [WIP] Sidebar blur

See:
    https://gitlab.gnome.org/GNOME/gtk-mac-integration

Macos C headers:
    /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/System/Library/Frameworks/AppKit.framework/Versions/C/Headers

Libadwaita CSS:
    sassc ~/git/libadwaita/src/stylesheet/base.scss /tmp/adwaita.css
