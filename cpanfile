# Catmandu core
requires 'Catmandu', '0.9206',

# Useful additions
requires 'Catmandu::Fix::cmd', '0.0201',
requires 'Catmandu::Fix::Date', '0.0121',
requires 'Catmandu::Cmd::repl', '0.01',
requires 'Catmandu::Store::CHI', '0.02',
requires 'Catmandu::Fix::get_json', '0.40',
requires 'Catmandu::Exporter::Table', '0.2.1',
requires 'Catmandu::Exporter::Template', '0.05',
requires 'Catmandu::Serializer::storable', '0.0102',
requires 'Catmandu::Validator::JSONSchema', '0.1',

# Data structuring languages
requires 'Catmandu::XML', '0.14',
requires 'Catmandu::RDF', '0.18',

feature 'databases', 'Databases' => sub {
  requires 'Catmandu::Store::DBI', '0.012',
  requires 'Catmandu::Store::MongoDB', '0.0303',
  requires 'Catmandu::Store::CouchDB', '0.01',
};

feature 'search_servers', 'Search servers' => sub {
  requires 'Catmandu::Store::ElasticSearch', '0.0206',
  requires 'Catmandu::Store::Solr', '0.0204',
  requires 'Catmandu::Store::Lucy', '0.0101',
};

# Bibliographic formats
requires 'Catmandu::MARC', '0.205',
requires 'Catmandu::PICA', '0.15',
requires 'Catmandu::MAB2', '0.07',
requires 'Catmandu::BibTeX', '0.06',
requires 'Catmandu::MODS', '0.2',

feature 'bibliographic_databases', 'Bibliographic importers' => sub {
  requires 'Catmandu::CrossRef', '0.006',
  requires 'Catmandu::PubMed', '0.01',
  requires 'Catmandu::ArXiv', '0.021',
  requires 'Catmandu::PLoS', '0.01',
  requires 'Catmandu::Inspire', '0.265',
  requires 'Catmandu::ArXiv', '0.021',
  requires 'Catmandu::OCLC', '0.005',
};

feature 'fedora', 'FedoraCommons store' => sub {
  requires 'Catmandu::FedoraCommons', '0.271',
};

# Atom importer and exporter
requires 'Catmandu::Atom', '0.02',

# OAI importer
requires 'Catmandu::OAI', '0.06',

# SRU importer
requires 'Catmandu::SRU', '0.037',

feature 'z3950', 'Z39.50 importer' => sub {
  requires 'Catmandu::Z3950', '0.04',
};

# Twitter importer
requires 'Catmandu::Importer::Twitter', '0.03',

# Wikidata importer
requires 'Catmandu::Wikidata', '0.06',

feature 'europmc', 'EuroPMC' => sub {
  requires 'Catmandu::EuropePMC', '0.15',
};

# LDAP importer
requires 'Catmandu::LDAP', '0.0103',

# Excel .xls and .xlsx files
requires 'Catmandu::XLS', '0.04',

feature 'alephx', 'Aleph-X services' => sub {
  requires 'Catmandu::AlephX', '1.065',
};

feature 'mediamosa', 'MediaMosa' => sub {
  requires 'Catmandu::MediaMosa', '0.279',
};

feature 'activiti', 'Activiti' => sub {
  requires 'Catmandu::Activiti', '0.11',
};

feature 'cpan', 'Perl recent releases' => sub {
  requires 'Catmandu::Importer::CPAN', '0.03',
};

feature 'psgi', 'PSGI integration' => sub {
  requires 'Plack::Session::Store::Catmandu', '0.02',
};

feature 'dancer', 'Dancer integration' => sub {
  requires 'Dancer::Session::Catmandu', '0.02',
  requires 'Dancer::Plugin::Catmandu::OAI', '0.0305',
  requires 'Dancer::Plugin::Catmandu::SRU', '0.03',
};

