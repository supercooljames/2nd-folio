<!DOCTYPE HTML">
<html>
	<head>
		<title>QR Reader | 2nd Folio</title>
		
		{embed="includes/head"}
		
	</head>
	<body>
		{embed="includes/header"}
		<div class="container">
			<div class="page-top"></div>
			<div class="page-mid">			
				<div class="span-24">
					<div class="span-16">
					{exp:weblog:entries entry_id="62"}
						<h1 class="stencil">{title}</h1>
						<p class="intro">{intro}</p>
						{body}
					{/exp:weblog:entries}
					</div>
					
					{exp:search:simple_form result_page="qr/search" weblog="quotes|tasks" where="all" search_in="everywhere"}
						<div class="span-7 push-1 last search-box">
						<h3>Search</h3>
						<p>If you're having problems with the QR Reader, search for your quote or task here ...</p>
						<input type="text" name="keywords" class="filled" value="keywords ...">
						<button class="nice-button">Search</button>
					{/exp:search:simple_form}
					
					</div>
					
					
				</div>
				<div class="clear"></div>
			</div>
			<div class="page-bottom"></div>
		</div>
		{embed="includes/footer"}
	</body>
</html>
