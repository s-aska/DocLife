# README

Document Viewer written in Perl, to run under Plack.

Pod Viewer

    plackup -MPlack::App::Document::Pod -e 'Plack::App::Document::Pod->new( { root => "./lib" } )->to_app'

Pod and Markdown Viewer

    use strict;
    use Plack::Builder;
    use Plack::App::Document::Pod;
    use Plack::App::Document::Markdown;

    my $pod_app = Plack::App::Document::Pod->new(
        root => './lib',
        base_url => '/pod/'
    );

    my $doc_app = Plack::App::Document::Markdown->new(
        root => './doc',
        suffix => '.md',
        base_url => '/doc/'
    );

    builder {
        mount '/doc' => $md_app;
        mount '/pod' => $pod_app;
    };

- Demo: <http://pad.demo.7kai.org>

Blog and Wiki with Dropbox.

    use strict;
    use Plack::Builder;
    use App::MarkdownBinder;
    use App::MarkdownDiary;

    my $doc_app = App::MarkdownBinder->new(
        root => $ENV{'HOME'}.'/Dropbox/doc',
        suffix => '.md',
        base_url => '/',
        title => 'The Document of Aska'
    );

    my $blog_app = App::MarkdownDiary->new(
        root => $ENV{'HOME'}.'/Dropbox/blog',
        suffix => '.md',
        base_url => '/',
        title => 'The Diary of Aska',
        footer => '&copy; 七階',
        rss_url => 'http://blog.7kai.org'
    );

    builder {
        enable 'Static',
            path => qr!^/static/!, root => './htdocs/';
        enable 'Static',
            path => qr!^/(?:favicon.ico|robots.txt)$!, root => './htdocs/';
        mount 'http://doc.7kai.org/' => $doc_app;
        mount 'http://blog.7kai.org/' => $blog_app;
    };
