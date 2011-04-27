# DocLife

Document Viewer written in Perl, to run under Plack.

- DocLife::Pod is Pod Viewer
- DocLife::Markdown  is Markdown Viewer

enjoy document life!

## INSTALL

    cpanm DocLife

## RUN

    plackup -MDocLife::Pod -e 'DocLife::Pod->new( root => "./lib" )->to_app'

## Screenshot

<img src="http://dl.dropbox.com/u/11475683/screen/doclife001.png">

## SUPPORT AND DOCUMENTATION

- github: <https://github.com/s-aska/DocLife>
- cpan: <http://search.cpan.org/dist/DocLife/>
- perldoc: perldoc -t DocLife

## LICENSE AND COPYRIGHT

Copyright (C) Shinichiro Aska

This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself.
