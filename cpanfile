requires 'Path::Class';
requires 'Plack';
requires 'Pod::Simple::XHTML';
requires 'Text::Markdown';

on build => sub {
    requires 'ExtUtils::MakeMaker', '6.42';
    requires 'Test::More';
};
