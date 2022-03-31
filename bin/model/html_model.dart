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
    <button onClick = "">Go to Link</button>
  </div>
</div>

</body>
</html>

''';
}
