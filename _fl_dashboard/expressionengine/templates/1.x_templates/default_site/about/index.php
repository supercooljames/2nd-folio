<!DOCTYPE HTML">
<html>
	<head>
		<title>About | 2nd Folio</title>
		
		{embed="includes/head"}
		
	</head>
	<body>
		{embed="includes/header"}
		<div class="container">
			<div class="page-top"></div>
			<div class="page-mid">			
				<div class="span-24">
					<div class="span-18">
					{exp:weblog:entries entry_id="2"}
						<h1 class="stencil">{title}</h1>
						<p class="intro">{intro}</p>
						{body}
					{/exp:weblog:entries}
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="page-bottom"></div>
		</div>
		{embed="includes/footer"}
	</body>
</html>
