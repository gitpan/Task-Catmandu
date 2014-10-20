package Task::Catmandu;

use strict;
use warnings;

our $VERSION = '0.104';

use ExtUtils::MakeMaker;

use base qw(Exporter);
our @EXPORT = qw(cpanfile);

sub dependencies {
    return (
        'Catmandu core', 1, [
            'Catmandu',
        ],
        'Useful additions', 1, [
            'Catmandu::Fix::cmd',
            'Catmandu::Fix::Date',
            'Catmandu::Cmd::repl',
            'Catmandu::Store::CHI',
            'Catmandu::Fix::get_json',
            'Catmandu::Exporter::Table',
            'Catmandu::Exporter::Template',
            'Catmandu::Serializer::storable', # ?
            'Catmandu::Validator::JSONSchema',
        ],
        'Data structuring languages', 1, [
            'Catmandu::XML',
            'Catmandu::RDF',
        ],
        'Databases', 0, [
            'Catmandu::Store::DBI',
            'Catmandu::Store::MongoDB',
            'Catmandu::Store::CouchDB',
        ],
        'Search servers', 0, [
            'Catmandu::Store::ElasticSearch',
            'Catmandu::Store::Solr',
            'Catmandu::Store::Lucy',
        ],
        'Bibliographic formats', 1, [
            'Catmandu::MARC',
            'Catmandu::PICA',
            'Catmandu::MAB2',
            'Catmandu::BibTeX',
            'Catmandu::MODS',
        ],
        'Bibliographic importers', 'bibliographic_databases', [
            'Catmandu::CrossRef',
            'Catmandu::PubMed',
            'Catmandu::ArXiv',
            'Catmandu::PLoS',
            'Catmandu::Inspire',
            'Catmandu::ArXiv',
            'Catmandu::OCLC',
        ],
        'FedoraCommons store', 'fedora', [
            'Catmandu::FedoraCommons',
        ],
        'Atom importer and exporter', 1, [
            'Catmandu::Atom',
        ],
        'OAI importer', 1, [
            'Catmandu::OAI',
        ],
        'SRU importer', 1, [
            'Catmandu::SRU',
        ],
        'Z39.50 importer', 'z3950', [
            'Catmandu::Z3950',
        ],
        'Twitter importer', 1, [
            'Catmandu::Importer::Twitter',
        ],
        'Wikidata importer', 1, [
            'Catmandu::Wikidata'
        ],
        'EuroPMC', 0, [
            'Catmandu::EuropePMC'
        ],
        'LDAP importer', 1, [
            'Catmandu::LDAP',
        ],
        'Excel .xls and .xlsx files', 1, [
            'Catmandu::XLS',
        ],
        'Aleph-X services', 'alephx', [
            'Catmandu::AlephX',
        ],
        'MediaMosa', 0, [
            'Catmandu::MediaMosa',
        ],
        'Activiti', 0, [
            'Catmandu::Activiti',
        ],
        'Perl recent releases', 'cpan', [
            'Catmandu::Importer::CPAN',
        ],
        'PSGI integration', 'psgi', [
            'Plack::Session::Store::Catmandu',
        ],
        'Dancer integration', 'dancer', [
            'Dancer::Session::Catmandu',
            'Dancer::Plugin::Catmandu::OAI',
            'Dancer::Plugin::Catmandu::SRU',
        ],
    );
}

sub iter_deps {
    my $cb = shift;
    my @deps = dependencies();
    while (my($name, $feature, $deps) = splice @deps, 0, 3) {
        $cb->($name, $feature, $deps);
    }
}

sub cpanfile {
    my $fh = shift || *STDOUT;

    iter_deps(sub {
        my($name, $feature, $modules) = @_;
        if ($feature eq 1) {
            $fh->print("# $name\n");
            for my $module (@$modules) {
                $fh->print("requires '$module', '", version_for($module), "',\n");
            }
        } else {
            (my $ident = $name) =~ s/[^A-Za-z_]+/_/g;
            $feature ||= lc($ident);
            $fh->print("feature '", $feature, "', '$name' => sub {\n");
            for my $module (@$modules) {
                $fh->print("  requires '$module', '", version_for($module), "',\n");
            }
            $fh->print("};\n");
        }
        $fh->print("\n");
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

  # Update cpanfile to most recent versions
  > perl -MTask::Catmandu -e cpanfile > cpanfile

=head1 AUTHOR

Nicolas Steenlant E<lt>nicolas.steenlant@ugent.beE<gt>

=head1 CONTRIBUTORS

Jakob Voss E<lt>jakob.voss@gbv.deE<gt>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<http://librecat.org/>

The main code of this module is taken from L<Task::Plack>.

=cut
