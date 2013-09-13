# Monologue: markdown edition

This is a simple extension that will change [Monologue](https://github.com/jipiboily/monologue)'s default editor to EpicEditor which will let you use Markdown instead of a WYSIWYG edit.

IMPORTANT: this README is for Monologue 0.3.X

## Install on a brand new Monologue installation

This is simple, you just have to add this file to your `Gemfile` after Monologue:

    gem "monologue-markdown", :git => "git@github.com:jipiboily/monologue-markdown.git"

Then run this:

    bundle exec rake monologue_markdown:install:migrations
    bundle exec rake db:migrate

### For Code Highlighting

sudo easy_install Pygments

## Install on an already existing Monologue installation

You do the same as for a new Monologue installation, but, keep in mind that only new posts will have EpicEditor enabled. All the posts that existed before will still be using the WYSIWYG editor.


## Notes

There are [Deface](https://github.com/railsdog/deface/) overrides with this project. You might want to (read: "should") turn it off on production. If you do, you can add a Capistrano task to precompile them or precompile them locally.

[Read more about this here.](https://github.com/railsdog/deface/#production--precompiling)