<!DOCTYPE HTML">
<html>
	<head>
		<title>	{exp:weblog:entries weblog="rules" limit="1" sort="asc" dynamic="on"}{title} | {/exp:weblog:entries}2nd Folio</title>
		
		{embed="includes/head"}
		
	</head>
	<body>
		{embed="includes/header"}
		<div class="container">
			<div class="page-top"></div>
			<div class="page-mid">
			<div class="span-24">
				<div class="span-15">
				{exp:weblog:entries weblog="rules" limit="1" sort="asc" dynamic="on"}
					<h1 class="stencil">{title}</h1>
					<p class="intro">{intro}</p>
					{body}
				{/exp:weblog:entries}
				</div>

				<div class="span-7 push-2 last prepend-top">
			{!--
					<h3 class="static">Rules</h3>
					<ul class="sub-list">
					{exp:weblog:entries weblog="rules" sort="asc" dynamic="off"}
						<li><a href="{title_permalink="rules/"}">{title}</a></li>
					{/exp:weblog:entries}
					</ul>
		
--}				</div>
			</div>
				<div class="clear"></div>
			</div>
			<div class="page-bottom"></div>
		</div>
		{embed="includes/footer"}
	</body>
</html>
