package Plack::App::Document::Markdown;

use strict;
use warnings;
use parent 'Plack::App::Document';
use Plack::Util::Accessor qw(tm);
use Text::Markdown;

sub prepare_app {
    my ($self, $env) = @_;
    $self->SUPER::prepare_app($env);
    my $tm = Text::Markdown->new;
    $self->tm($tm);
}

sub format {
    my ($self, $req, $res, $file) = @_;
    my $text = $file->slurp;
    my ($title) = $text=~m|^#\s(.*)|;
    unless ($title) {
        $title = $file->basename;
        my $suffix = $self->suffix;
        $title=~s|\Q$suffix\E$||;
    }
    my $body = $self->html_header($title);
    $body.= $self->tm->markdown($text);
    $body.= $self->html_footer;
    $res->body($body);
}

sub html_header {
my ($self, $title) = @_;
$title ||= 'Index';
my $top = $self->base_url;
<<"EOF"
<!DOCTYPE html>
<html>
<head>
<title>$title</title>
<style>
*{ margin:0; padding:0; font-family: arial,sans-serif; }
body{ margin: 0 auto; width: 920px; padding: 0 0 30px; font-size: 14px; line-height: 23px; overflow-y: scroll; }
a{ color: #4183C4; text-decoration: none; }
header {margin: 15px 0 5px; border-bottom: 1px solid #ccc;}
header h1{font-size: 33px; line-height: normal;}
header nav{text-align: center;}
article p{margin:16px 0 0;padding:0;}
article h1{font-size:33px;line-height:normal;margin:0;padding:.08em 0 0 0;width:65%;}
article h2{border-top:4px solid #ccc;font-size:22px;line-height:normal;margin:22px 0 0;padding:7px 0 0;}
article h3{font-size:16px;line-height:26px;padding:26px 0 0;}
article h4{font-size:14px;line-height:26px;padding:18px 0 4px;font-weight:bold;text-transform:uppercase;}
article h5{font-size:13px;line-height:26px;margin-bottom:-19px;padding:14px 0 0;font-weight:bold;text-transform:uppercase;}
article h6{color:#666;font-size:14px;line-height:26px;margin-bottom:-19px;padding:18px 0 0;font-weight:normal;font-variant:italic;}
article>h2:first-child,article>h1:first-child,article>h1:first-child+h2{border:0;margin:12px 0 0;padding:10px 0 0;}
article>h3:first-child,article>h4:first-child,article>h5:first-child,article>h6:first-child{margin:13px 0 0 0;padding:0;}
article>h1:first-child{display:none;}
article h4+p,article h5+p,article h6+p{margin-top:0;}
article ul,ol{margin:0 0 0 1.5em;padding:20px 0 0;}
article li{ line-height: 1.4em; }
article ul li ul, ol li ol, ul li ol, ol li ul, ul ul, ol ol{padding:0 0 0 14px;}
article dl{margin:0;padding:20px 0 0;}
article dl dt{font-size:14px;font-weight:bold;line-height:normal;margin:0;padding:20px 0 0;}
article dl dt:first-child {padding:0;}
article dl dd{font-size:13px;margin:0;padding:3px 0 0;}
article code{background-color:#f8f8f8;border:1px solid #dedede;font-size:13px;padding:0 4px;-moz-border-radius:3px;-webkit-border-radius:3px;border-radius:3px;}
article .highlight pre,pre{background-color:#f8f8f8;border:1px solid #ccc;font-size:13px;line-height:19px;overflow:auto;padding:6px;-moz-border-radius:3px;-webkit-border-radius:3px;border-radius:3px;}
article pre code{background-color:transparent;border:none;}
</style>
</head>
<body>
<header>
<nav><a href="$top">TOP</a></nav>
<h1>$title</h1>
</header>
<article>
EOF
}

sub html_footer {
<<"EOF"
</article>
</body>
</html>
EOF
}

=head1 NAME

Plack::App::Document::Markdown - Markdown Viewer.

=head1 SYNOPSIS

    # app.psgi
    use Plack::App::Document::Markdown;
    Plack::App::Document::Markdown->new( root => "./doc", suffix => ".md" );

    # one-liner
    plackup -MPlack::App::Document::Markdown -e 'Plack::App::Document::Markdown->new( root => "./doc" )->to_app'

=head1 SEE ALSO

L<Plack::App::Document>, L<Text::Markdown>

=cut

1;
