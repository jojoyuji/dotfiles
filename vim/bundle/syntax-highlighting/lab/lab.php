<?php 
$thisPage="index";
include "inc/config.php";
include "inc/head.php";
include "inc/nav.php";
include "inc/header.php";
include "inc/output.php";
include "inc/footer.php";
?>

      <!--Modal box voor extra info --> 
      <!-- A modal with its content -->
      <section class="semantic-content" id="modal-infotext"
      tabindex="-1" role="dialog" aria-labelledby="modal-label--info" aria-hidden="true">

      <div class="modal-inner">
        <header>
        <h2 id="modal-label--info">Info</h2>
        </header>

        <div class="modal-content"> 
          <pre><code class="language-javascript">/* External links  
 * [A more extensive Lab with Sass variables on CodePen](http://codepen.io/atelierbram/pen/JnbIt)
 * [syntax-highlighting demo's on Github](http://atelierbram.github.io/syntax-highlighting/) 
 * [syntax-highlighting repo on Github](http://github.com/atelierbram/syntax-highlighting/) 
 *
 * &copy; 2013 [Bram de Haan](http://atelierbramdehaan.nl/)
 */<code class="language-markdown"> 
</code>
</code></pre> 
        </div> 
        <footer>
          <p><a href="http://atelierbram.mit-license.org">Releases under MIT License</a></p>
        </footer>
      </div>

      <!-- Use Hash-Bang to maintain scroll position when closing modal -->
      <a href="#!" class="modal-close" title="Close this modal"
        data-dismiss="modal">&times;</a>
      </section> 

      <!--Modal box voor Sass code--> 
      <!-- A modal with its content -->
      <section class="semantic-content" id="modal-sasstext"
      tabindex="-1" role="dialog" aria-labelledby="modal-label--sass" aria-hidden="true">

      <div class="modal-inner">
        <header>
        <h2 id="modal-label--sass">SCSS</h2>
        </header>

        <div class="modal-content">
          <!-- <p>Content.</p> -->
<pre><code class="language-css">
/* Sass variables: 
 * Edit the sixteen color-values, and create your own 
 * syntax highlighter colorscheme 
 * with [Base16 Builder](https://github.com/chriskempson/base16-builder)
 */

$base00: hsl(50, 5%, 12%);  
$base01: hsl(50, 6%, 15%);  
$base02: hsl(50, 8%, 40%);  
$base03: hsl(50, 9%, 45%);  
$base04: hsl(50, 11%, 55%); 
$base05: hsl(50, 13%, 60%); 
$base06: hsl(50, 35%, 86%); 
$base07: hsl(50, 87%, 96%); 
$base08: hsl(0, 67%, 53%);  
$base09: hsl(25, 83%, 39%); 
$base0A: hsl(50, 80%, 45%); 
$base0B: hsl(100, 50%, 45%);
$base0C: hsl(162, 70%, 40%);
$base0D: hsl(225, 67%, 64%);
$base0E: hsl(287, 60%, 58%);
$base0F: hsl(349, 65%, 52%);

$red:     $base08;
$orange:  $base09;
$yellow:  $base0A;
$green:   $base0B;
$cyan:    $base0C;
$blue:    $base0D;
$violet:  $base0E;
$magenta: $base0F; 

</code></pre>
          </div>

          <footer>
          <p><a href="http://codepen.io/atelierbram/pen/JnbIt">Colorscheme Lab with Sass variables on CodePen</a></p>
          </footer>
        </div>

        <!-- Use Hash-Bang to maintain scroll position when closing modal -->
        <a href="#!" class="modal-close" title="Close this modal"
          data-dismiss="modal">&times;</a>
        </section>


<?php include "inc/scripts.php";?>
<script> 
(function() {

  // Base template
  var base_tpl =
    "<!doctype html>\n" +
    "<html>\n\t" +
    "<head>\n\t\t" +
    "<meta charset=\"utf-8\">\n\t\t" +
    "<title>Test</title>\n\n\t\t\n\t" +
    // "\x3Cscript src=\"..\x2Fassets\x2Fjs\x2Fvendor\x2Fjquery.js\"\x3E\x3C\x2Fscript\x3E" +
    "</head>\n\t" +
    "<body>\n\t\n\t" +
    "</body>\n" +
    "</html>";

  var prepareSource = function() {
    var html = html_editor.getValue(),
      css = css_editor.getValue(),
              // js = js_editor.getValue(),
              src = '';

              // HTML
              src = base_tpl.replace('</body>', html + '</body>');

          // CSS
          css = '<style>' + css + '</style>';
          src = src.replace('</head>', css + '</head>');

      // Javascript
      // js = '<script>' + js + '<\/script>';
        // src = src.replace('</body>', js + '</body>');

    return src;
  };

  var render = function() {
    var source = prepareSource();

    var iframe = document.querySelector('#output iframe'),
    iframe_doc = iframe.contentDocument;

    iframe_doc.open();
    iframe_doc.write(source);
    iframe_doc.close();
  };


  // EDITORS

  // CM OPTIONS
  var cm_opt = {
    mode: 'text/html', 
    theme: 'solarized light',
    //    tabMode: 'indent',
    gutter: true,
    lineNumbers: true,
  };

  // HTML EDITOR
  var html_box = document.querySelector('#html textarea');
  var html_editor = CodeMirror.fromTextArea(html_box, cm_opt);

  html_editor.on('change', function (inst, changes) {
    render();
  });

  // CSS EDITOR
  cm_opt.mode = 'css';
  var css_box = document.querySelector('#css textarea');
  var css_editor = CodeMirror.fromTextArea(css_box, cm_opt);

  css_editor.on('change', function (inst, changes) {
    render();
  });

  // JAVASCRIPT EDITOR
  // cm_opt.mode = 'javascript';
  // var js_box = document.querySelector('#js textarea');
  // var js_editor = CodeMirror.fromTextArea(js_box, cm_opt);

  // js_editor.on('change', function (inst, changes) {
  //   render();
  // });

  // SETTING CODE EDITORS INITIAL CONTENT
  html_editor.setValue('<h3 id="demo-tiles">Sixteen colors</h3>\n<div class="sh-c">\n<div class="unit base00-background sh-c-light">base00 </div>\n<div class="unit base01-background sh-c-light">base01 </div>\n<div class="unit base02-background">base02 </div>\n<div class="unit base03-background">base03 </div>\n<div class="unit base04-background">base04 </div>\n<div class="unit base05-background">base05 </div>\n<div class="unit base06-background">base06 </div>\n<div class="unit base07-background">base07 </div>\n<div class="unit yellow-background">yellow </div>\n<div class="unit orange-background">orange </div>\n<div class="unit red-background">red </div>\n<div class="unit magenta-background">magenta </div>\n<div class="unit violet-background">violet </div>\n<div class="unit blue-background">blue </div>\n<div class="unit cyan-background">cyan </div>\n<div class="unit green-background">green </div>\n</div>\n<pre class="base00-background">\n<code>\n<span class="base00">$base00  - Lorem ipsum dolor sit amet</span>\n<span class="base01">$base01  - Lorem ipsum dolor sit amet</span>\n<span class="base02">$base02  - Lorem ipsum dolor sit amet</span>\n<span class="base03">$base03  - Lorem ipsum dolor sit amet</span>\n<span class="base04">$base04  - Lorem ipsum dolor sit amet</span>\n<span class="base05">$base05  - Lorem ipsum dolor sit amet</span>\n<span class="base06">$base06  - Lorem ipsum dolor sit amet</span>\n<span class="base07">$base07  - Lorem ipsum dolor sit amet</span>\n<span class="red">$red     - Lorem ipsum dolor sit amet</span>\n<span class="orange">$orange  - Lorem ipsum dolor sit amet</span>\n<span class="yellow">yellow   - Lorem ipsum dolor sit amet</span>\n<span class="green">$green   - Lorem ipsum dolor sit amet</span>\n<span class="cyan">$cyan    - Lorem ipsum dolor sit amet</span>\n<span class="blue">$blue    - Lorem ipsum dolor sit amet</span>\n<span class="violet">$violet  - Lorem ipsum dolor sit amet</span>\n<span class="magenta">$magenta - Lorem ipsum dolor sit amet</span>\n</code></pre>\n<pre class="base07-background border"><code>\n<span class="class="base00">$base00  - Lorem ipsum dolor sit amet</span>\n<span class="base01">$base01  - Lorem ipsum dolor sit amet</span>\n<span class="base02">$base02  - Lorem ipsum dolor sit amet</span>\n<span class="base03">$base03  - Lorem ipsum dolor sit amet</span>\n<span class="base04">$base04  - Lorem ipsum dolor sit amet</span>\n<span class="base05">$base05  - Lorem ipsum dolor sit amet</span>\n<span class="base06">$base06  - Lorem ipsum dolor sit amet</span>\n<span class="base07">$base07  - Lorem ipsum dolor sit amet</span>\n<span class="red">$red     - Lorem ipsum dolor sit amet</span>\n<span class="orange">$orange  - Lorem ipsum dolor sit amet</span>\n<span class="yellow">yellow   - Lorem ipsum dolor sit amet</span>\n<span class="green">$green   - Lorem ipsum dolor sit amet</span>\n<span class="cyan">$cyan    - Lorem ipsum dolor sit amet</span>\n<span class="blue">$blue    - Lorem ipsum dolor sit amet</span>\n<span class="violet">$violet  - Lorem ipsum dolor sit amet</span>\n<span class="magenta">$magenta - Lorem ipsum dolor sit amet</span>\n</code>\n</pre>\n');
  css_editor.setValue('.base00-background {\n  background-color: hsl(50, 5%, 12%);\n }\n.base01-background {\n  background-color: hsl(50, 6%, 15%);\n }\n.base02-background {\n  background-color: hsl(50, 8%, 40%);\n }\n.base03-background {\n  background-color: hsl(50, 9%, 45%);\n }\n.base04-background {\n  background-color: hsl(50, 11%, 55%);\n }\n.base05-background {\n  background-color: hsl(50, 13%, 60%);\n }\n.base06-background {\n  background-color: hsl(50, 35%, 86%);\n }\n.base07-background {\n  background-color: hsl(50, 87%, 96%);\n }\n.red-background {\n  background-color: hsl(0, 67%, 53%);\n }\n.orange-background {\n  background-color: hsl(25, 83%, 39%);\n }\n.yellow-background {\n  background-color: hsl(50, 80%, 45%);\n }\n.green-background {\n  background-color: hsl(100, 50%, 45%);\n }\n.cyan-background {\n  background-color: hsl(162, 70%, 40%);\n }\n.blue-background {\n  background-color: hsl(225, 67%, 64%);\n }\n.violet-background {\n  background-color: hsl(287, 60%, 58%);\n }\n.magenta-background {\n  background-color: hsl(349, 65%, 52%);\n } \n  .base00 {\n  color: hsl(50, 5%, 12%);\n }\n.base01 {\n  color: hsl(50, 6%, 15%);\n }\n.base02 {\n  color: hsl(50, 8%, 40%);\n }\n.base03 {\n  color: hsl(50, 9%, 45%);\n }\n.base04 {\n  color: hsl(50, 11%, 55%);\n }\n.base05 {\n  color: hsl(50, 13%, 60%);\n }\n.base06 {\n  color: hsl(50, 35%, 86%);\n }\n.base07 {\n  color: hsl(50, 87%, 96%);\n }\n.red {\n  color: hsl(0, 67%, 53%);\n }\n.orange {\n  color: hsl(25, 83%, 39%);\n }\n.yellow {\n  color: hsl(50, 80%, 45%);\n }\n.green {\n  color: hsl(100, 50%, 45%);\n }\n.cyan {\n  color: hsl(162, 70%, 40%);\n }\n.blue {\n  color: hsl(225, 67%, 64%);\n }\n.violet {\n  color: hsl(287, 60%, 58%);\n }\n.magenta {\n  color: hsl(349, 65%, 52%);\n } \n  .sh-c {\n  overflow: auto;\n color: #1b1918 !important;\n}\n.sh-c-light {\n  color: #a8a19f !important;\n}\n.unit {\n  float: left;\n  width: 25%;\n  padding: 4em 0;\n  text-align: center;\n}\nH3 {\n  margin: 0 0 .5em 1.5em;\n  color: #444;\n}\npre, \npre span {\n  padding: 1em;\n  line-height:1.4;\n  font-size: 14px;\n  font-family: Consolas, monospace;\n}\n.border {\n  border: 1px solid #ccc;\n}\nbody {\n  font-family: Corbel,"Lucida Grande", sans-serif;\n}\n');
  // js_editor.setValue('');


  // RENDER CALL ON PAGE LOAD
  // NOT NEEDED ANYMORE, SINCE WE RELY
  // ON CODEMIRROR'S onChange OPTION THAT GETS
  // TRIGGERED ON setValue
  // render();


  // NOT SO IMPORTANT - IF YOU NEED TO DO THIS
  // THEN THIS SHOULD GO TO CSS

  /*
  Fixing the Height of CodeMirror.
  You might want to do this in CSS instead
  of JS and override the styles from the main
  codemirror.css
  */
  var cms = document.querySelectorAll('.CodeMirror');
  for (var i = 0; i < cms.length; i++) { 

    cms[i].style.position = 'absolute';
    cms[i].style.top = '30px';
    cms[i].style.bottom = '0';
    cms[i].style.left = '0';
    cms[i].style.right = '0';
    cms[i].style.height = '100%';
  }
  /*cms = document.querySelectorAll('.CodeMirror-scroll');
  for (i = 0; i < cms.length; i++) {
    cms[i].style.height = '100%';
  }*/

}());
</script> 
<?php include "inc/trigger-scripts.php";?> 

  </body>
</html>
