String htmlModel(String link) {
  return '''
<html>
<head>
<style>
h1 {text-align: center;}
h3 {text-align: center;}
div {text-align: center;}
</style>
</head>
<body>

<h1>Link Result</h1>
<h3>$link</h3>
<div class="container">
  <div class="vertical-center">
<button title="button title" class="action primary tocart" onclick=" window.open('$link', '_blank'); return false;">Open Link</button>
  </div>
</div>

</body>
</html>

''';
}

String mainHtml() {
  return ''' <h1>
  Welcome the server
</h1>
<h2>
  Basic shorten link service
  
</h2>''';
}
