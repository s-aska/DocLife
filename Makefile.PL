use inc::Module::Install;

name 'Plack-App-Document';
all_from 'lib/Plack/App/Document.pm';
requires 'Path::Class';
requires 'Plack';
requires 'Pod::Simple::XHTML';
requires 'Text::Markdown';
build_requires 'Test::More';
license 'perl';

WriteAll;