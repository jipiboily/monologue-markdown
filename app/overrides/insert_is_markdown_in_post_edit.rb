Deface::Override.new(:virtual_path => "monologue/admin/posts/edit",
                     :name => "insert_is_markdown_in_post_edit",
                     :insert_before => "h1",
                     :partial => "monologue-markdown/overrides/is_markdown")