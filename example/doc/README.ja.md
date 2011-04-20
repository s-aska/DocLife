# README

## 概要

Plackで動作するドキュメントビューワです。

PODを表示したければ以下の一行で十分です。

    plackup -MPlack::App::Document::Pod -e 'Plack::App::Document::Pod->new( { root => "./lib" } )->to_app'

PODと同時にMarkdown形式のドキュメントを書いている場合、以下の様なapp.psgiで同時に配信できます。

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

## 拡張

更に手を加えることで、BlogやWikiとして使用することも出来ます。

- Demo: <http://pad.demo.7kai.org>

Dropboxと連携する事で、WebUIを必要としないBlogやWikiを実現しています。

サンプルアプリケーションですが、個人のblogやwikiとして十分な性能を持っています。

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
