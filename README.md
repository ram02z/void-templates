A collection of templates for Void Linux, to be used with xbps-src.

| Package             | Status              |
| ------------------- | ----------------    |
| Stylua              | PR in progress      |
| lua-language-server | Broken template     |
| ncspot              | PR in progress      |
| rbw                 | PR in progress      |
| rofi-rbw            | PR in progress      |
| rofi-wayland        | Waiting on upstream |
| swayr               | PR in progress      |
| swaywsr             | Waiting on upstream |

To add repository:

```
# echo 'repository=https://ram02z.github.io/void-templates/$LIBC' > /etc/xbps.d/11-mytemplates.conf
```

> where $LIBC is either musl or glibc
