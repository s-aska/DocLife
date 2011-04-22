use inc::Module::Install;

name 'DocLife';
all_from 'lib/DocLife.pm';
requires 'Path::Class';
requires 'Plack';
requires 'Pod::Simple::XHTML';
requires 'Text::Markdown';
build_requires 'Test::More';
license 'perl';

WriteAll;
