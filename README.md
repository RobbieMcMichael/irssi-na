# irssi-na

Pushover integration for irssi.

## Getting Started

Copy the `na.pl` script into your `~/.irssi/scripts/` directory.

You will need the following perl libraries

    perl-libwww-perl-6.13
    perl-LWP-Protocol-https-6.04


Get an account at https://pushover.net and create a new
application token.

In irssi

    /set pushover_app_token <token>
    /set pushover_user_token <token>
    /run na
    /nadebug test message

You will now get a pushover notification when someone mentions you
or sends you a private message.

You can also optionally associate a URL with the notifications so
that you can launch an SSH client.

    /set pushover_url ssh://example.org

This works well with JuiceSSH which seems to just bring up an already
active connection instead of launching a new one if it can.
