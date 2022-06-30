A collection of templates for Void Linux, to be used with xbps-src.

| Package             | Status              |
| ------------------- | ----------------    |
| lua-language-server | From @gbrlsnchs repo|
| ncspot              | PR in progress      |
| rofi-wayland        | PR in progress      |
| swayr               | PR in progress      |
| swaywsr             | Waiting on upstream |
| battop              | Applied patches     |
| lean-community      | PR in progress      |

To add repository:

```
# echo 'repository=https://ram02z.github.io/void-templates/$LIBC' > /etc/xbps.d/11-mytemplates.conf
```

> where $LIBC is either musl or glibc
