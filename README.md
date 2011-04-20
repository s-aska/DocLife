# Plack::App::Document

Document Viewer written in Perl, to run under Plack.

- Local Pod Viewer
- Local Markdown Viewer

## Author's Message (Japanese)

CPAN Authorであれば皆ローカルに似たような物を作っていそうですが、標準化できそうな部分を切り出して公開することにしました。

Markdownはgithubに上げる前の下書きを少し意識しましたが、github独自の拡張記法は一切ケアしていません。

App::MarkdownBinder, App::MarkdownDiary という拡張アプリの実装例がexampleに同梱されています、作者が実際に利用しています。（以下DEMO参照）

Plack::Builderのmount機能がVirtualHostも兼ねているので上げ落としも楽です、またコンテンツはDropboxで管理しているのでローカルのエディタで更新しています。

enjoy document life!

## INSTALL

    cpanm https://github.com/s-aska/plack-app-document/tarball/master

## RUN

    plackup -MPlack::App::Document::Pod -e 'Plack::App::Document::Pod->new( root => "./lib" )->to_app'

## DEMO

- demo: <http://pad.demo.7kai.org/>
- author's blog: <http://blog.7kai.org/doc/> powered by App::MarkdownDiary
- author's wiki: <http://doc.7kai.org/doc/> powered by App::MarkdownBinder

## SUPPORT AND DOCUMENTATION

- github: <https://github.com/s-aska/plack-app-document>
- perldoc `perldoc Plack::App::Document`

## LICENSE AND COPYRIGHT

Copyright (C) Shinichiro Aska

This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself.
