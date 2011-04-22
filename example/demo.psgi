use strict;
use Plack::Builder;
use Plack::App::File;
use DocLife;
use DocLife::Pod;
use DocLife::Markdown;
use App::MarkdownBinder;
use App::MarkdownDiary;

my $pod_app = DocLife::Pod->new(
    root => '../lib',
    base_url => '/pod/'
);

my $doc_app = DocLife::Markdown->new(
    root => './doc',
    suffix => '.md',
    base_url => '/doc/'
);

my $wiki_app = App::MarkdownBinder->new(
    root => './doc',
    suffix => '.md',
    base_url => '/wiki/',
    title => 'App::MarkdownBinder'
);

my $blog_app = App::MarkdownDiary->new(
    root => './blog',
    suffix => '.md',
    base_url => '/blog/',
    title => 'App::MarkdownDiary',
    footer => '&copy; ',
    rss_url => 'http://example.com'
);

builder {
    enable 'Static',
        path => qr!^/static/!, root => './htdocs/';
    enable 'Static',
        path => qr!^/(?:favicon.ico|robots.txt)$!, root => './htdocs/';
    mount '/pod' => $pod_app;
    mount '/doc' => $doc_app;
    mount '/wiki' => $wiki_app;
    mount '/blog' => $blog_app;
    mount '/' => Plack::App::File->new(file => './htdocs/index.html');
};
