<!--PHP入門-->
<!--PHPの書き方-->
<html>
  <head>
    <title>テスト</title>
  </head>
  <body>
	<form method="POST" action="PHP02.php">
	<input type="text" name="mode">
	<input type="button"value="click">
	</form>
	<?php if ($mode == 1) { ?>
			<h1>AAA</h1>
	<?php } else{ ?>
	 		<h1>BBB</h1>
	<?php } ?>
  </body>
</html>

