

process
  - scope all sass to the name of the component


http://localhost:8080/posts/if_only_coffeescript_was_popular.html


_build/posts/if_only_coffeescript_was_popular.html

<!DOCTYPE html>
<html>
  <head>
    <title>My Blog</title>

    <style>
      ### insert all compiled / scopped css here
    </style>
  </head>
  <body>
    <header></header>
    <content></content>
    <footer></footer>

    <script>
      ### insert all compiled / concat js files
    </script>
  </body>
</html>

1. run through all sass, scope to element name, compile, generate css
2. run through all .coffee, compile to js, concat all, inject into body
3. 