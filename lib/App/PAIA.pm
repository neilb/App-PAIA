#ABSTRACT: Patrons Account Information API command line client
package App::PAIA;
use base 'App::Cmd';
use v5.14;
#VERSION

sub run {
    my ($self) = @_;
    $self = $self->new unless ref $self;

    my @argv = $self->prepare_args();
    if (grep { $_ eq '--version' } @argv) {
        printf "paia (App::PAIA) version %s (%s)\n", $App::PAIA::VERSION, $self->full_arg0;
    } else {
        App::Cmd::run(@_);
    }
}

sub global_opt_spec {
    ['base|b=s'    => "base URL of PAIA server"],
    ['auth=s'      => "base URL of PAIA auth server"],
    ['core=s'      => "base URL of PAIA core server"],
    ['insecure|k'  => "disable verification of SSL certificates"],
    ['config|c=s'  => "configuration file (default: ./paia.json)"],
    ['session|s=s' => "session file (default: ./.paia_session)"],
    ['verbose|v'   => "show what's going on internally"],
    ['token|t=s'   => "explicit access_token"],
    ["username:s"  => "username for login"],
    ["password:s"  => "password for login"],
    ["scope:s"     => "comma-separated list of scopes for login"],
    ["version"     => "show client version", { shortcircuit => 1 } ];
}

1;

=head1 SYNOPSIS

    paia patron --base http://example.org/ --username alice --password 12345

Run C<paia help> or C<perldoc paia> for more commands and options.

=head1 WARNING

B<The current version only supports read-only access. Methods 'request',
'renew', 'cancel', and 'change' are not supported yet.>

=head1 DESCRIPTION

The Patrons Account Information API (PAIA) is a HTTP based API to access
library patron information, such as loans, reservations, and fees. This client
can be used to access PAIA servers via command line.

=head1 USAGE

See the documentation of of L<paia> command.

=head1 IMPLEMENTATION

The client is implemented using L<App::Cmd>. There is a module for each command
in the App::PAIA::Command:: namespace and common functionality implemented in
L<App::PAIA::Command>.

=head1 RESOURCES

=over

=item L<http://gbv.github.io/paia/>

PAIA specification

=item L<https://github.com/gbv/App-PAIA>

Code repository and issue tracker

=back

=cut
