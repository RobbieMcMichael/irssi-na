use strict;

use Irssi;
use LWP::UserAgent;

sub naAlert {
  my ($server, $msg, $nick, $addr, $target) = @_;
  my $title = ("$target" eq "" ? "$nick to $server->{nick}" : "$nick to $target");
  my $token = Irssi::settings_get_str("pushover_app_token");
  my $user  = Irssi::settings_get_str("pushover_user_token");
  my $url   = Irssi::settings_get_str("pushover_url");

  if ($token eq "") {
    print "pushover_app_token not set";
  }
  else {
    if ($user eq "") {
      print "pushover_user_token not set";
    }
    else {
      if (($msg =~ $server->{nick}) || ("$target" eq "")) {
        LWP::UserAgent->new()->post(
          "https://api.pushover.net/1/messages.json", [
            "token"   => $token,
            "user"    => $user,
            "message" => $msg,
            "title"   => $title,
            "url"     => $url,
           ]);
      }
    }
  }
};


Irssi::settings_add_str("pushover", "pushover_url", "");
Irssi::settings_add_str("pushover", "pushover_app_token", "");
Irssi::settings_add_str("pushover", "pushover_user_token", "");

Irssi::signal_add_last("message public", 'naAlert');
Irssi::signal_add_last("message private", 'naAlert');
