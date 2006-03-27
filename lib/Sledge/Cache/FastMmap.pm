package Sledge::Cache::FastMmap;
use strict;
use warnings;
use base 'Sledge::Cache';
our $VERSION = '0.03';
use Cache::FastMmap;

sub _init {
    my ($self, $page) = @_;
    my $opts = eval {$page->create_config->cache_fastmmap_opts} || ();
    $self->{_fmm} = Cache::FastMmap->new(%$opts);
}

sub _get {
    my ($self, $key) = @_;
    return $self->{_fmm}->get($key);
}

sub _set {
    my ($self, $key, $val) = @_;
    $self->{_fmm}->set($key, $val);
}

sub _remove {
    my ($self, $key) = @_;
    $self->{_fmm}->remove($key);
}

1;
__END__

=head1 NAME

Sledge::Cache::FastMmap - fastmmap plugin for sledge

=head1 SYNOPSIS

    package Your::Config;
    use vars qw(%C);
    *Config = \%C;
    $C{CACHE_FASTMMAP_OPTS} = {raw_values => 1};

    package Your::Pages;
    use Sledge::Plugin::Cache;
    use Sledge::Cache::FastMmap;
    sub create_cache { Sledge::Cache::FastMmap->new(shift) }

=head1 DESCRIPTION

Sledge::Cache::FastMmap is FastMmap subclass of Sledge::Cache.

=head1 AUTHOR

MATSUNO Tokuhiro E<lt>tokuhiro at mobilefactory.jpE<gt>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<Sledge::Cache>, L<Bundle::Sledge>

=cut
