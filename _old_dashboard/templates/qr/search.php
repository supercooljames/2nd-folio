<!DOCTYPE HTML">
<html>
	<head>
		<title>Search results for "{exp:search:keywords}" | 2nd Folio</title>
		
		{embed="includes/head"}
		
	</head>
	<body>
		{embed="includes/header"}
		<div class="container">
			<div class="page-top"></div>
			<div class="page-mid">			
				<div class="span-24">
							
				
				<div class="span-15">
					<h1 class="stencil">Search results for "{exp:search:keywords}"</h1>
				

					<ul class="search-results">
						{exp:search:search_results}
						<li>
							<small>{weblog}</small>
							<p><a href="{auto_path}">{title}</a></p>
						</li>
						{/exp:search:search_results}
					</ul>
				</div>
					
					{exp:search:simple_form result_page="qr/search" weblog="quotes|tasks" where="all" search_in="everywhere"}
						<div class="span-7 push-1 last search-box">
						<h3>Search again</h3>
						<input type="text" name="keywords" class="filled" value="keywords ...">
						<button class="nice-button">Search</button>
						</div>
					{/exp:search:simple_form}
					
					
					
				</div>
				<div class="clear"></div>
			</div>
			<div class="page-bottom"></div>
		</div>
		{embed="includes/footer"}
	</body>
</html>
