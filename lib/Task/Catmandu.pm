package Task::Catmandu;

use strict;
use 5.008_001;
our $VERSION = '0.0102';
use ExtUtils::MakeMaker;

sub dependencies {
    return (
        'repl (interactive environment)', 1, [
            [ 'Catmandu::Cmd::repl' ],
        ],
        'MongoDB store', 1, [
            [ 'Catmandu::Store::MongoDB' ],
        ],
        'ElasticSearch store', 1, [
            [ 'Catmandu::Store::ElasticSearch' ],
        ],
        'Solr store', 1, [
            [ 'Catmandu::Store::Solr' ],
        ],
        'FedoraCommons store', 1, [
            [ 'Catmandu::FedoraCommons' ],
        ],
        'MARC importer and MARC fixes', 1, [
            [ 'Catmandu::MARC' ],
        ],
        'bibliographic importers', 1, [
            [ 'Catmandu::PubMed' ],
            [ 'Catmandu::ArXiv' ],
            [ 'Catmandu::PLoS' ],
        ],
        'OAI importer', 1, [
            [ 'Catmandu::OAI' ],
        ],
        'SRU importer', 1, [
            [ 'Catmandu::SRU' ],
        ],
        'Z39.50 importer', 0, [
            [ 'Catmandu::Z3950' ],
        ],
        'Twitter importer', 0, [
            [ 'Catmandu::Importer::Twitter' ],
        ],
        'LDAP importer', 0, [
            [ 'Catmandu::LDAP' ],
        ],
        'Dancer integration', 0, [
            [ 'Dancer::Session::Catmandu' ],
            [ 'Dancer::Plugin::Catmandu::OAI' ],
            [ 'Dancer::Plugin::Catmandu::SRU' ],
        ],
    );
}

sub has_module {
    my $file = shift;
    $file =~ s!::!/!g;
    scalar grep -e "$_/$file.pm", @INC;
}

sub iter_deps {
    my($class, $cb) = @_;
    my @deps = $class->dependencies;
    while (my($name, $cond, $deps) = splice @deps, 0, 3) {
        $cb->($name, $cond, $deps);
    }
}

sub makefile_pl {
    my $class = shift;
    my $fh = shift;

    $class->iter_deps(sub {
        my($name, $cond, $deps) = @_;
        my @modules = grep defined, map $_->[0], @$deps;
        $fh->print("feature '$name', -default => $cond,\n");
        for my $module (@modules) {
            $fh->print("  '$module', '", version_for($module), "',\n");
        }
        $fh->print(";\n");
    });
}

sub version_for {
    my $dist = shift;

    (my $module = $dist) =~ s/-/::/g;
    my $info = `cpanm --info $module ` or return;
    return ($info =~ /-([\d\.]+)\.tar\.gz/)[0];
}

1;
__END__

=encoding utf-8

=for stopwords

=head1 NAME

Task::Catmandu - Catmandu bundle

=head1 SYNOPSIS

  cpanm --interactive Task::Catmandu

=head1 AUTHOR

Nicolas Steenlant <lt>nicolas.steenlant@ugent.be<gt>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<http://librecat.org/>

=head1 ACKNOWLEDGEMENTS

Module code is taken from L<Task::Plack>.

=cut
