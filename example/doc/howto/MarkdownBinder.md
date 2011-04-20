# App::MarkdownBinder

App::MarkdownBinder は備忘録を公開するのに適したドキュメントビューアーです。

    # app.psgi
    use strict;
    use App::MarkdownBinder;

    my $app = App::MarkdownBinder->new(
        root => $ENV{'HOME'}.'/Dropbox/doc',
        suffix => '.md',
        base_url => '/',
        title => 'The Document of Aska'
    );
