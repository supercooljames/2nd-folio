<!DOCTYPE HTML">
<html>
	<head>
		<title>{exp:weblog:entries weblog="quotes" limit="1" dynamic="on" orderby="random"}{title} | Quotes | {/exp:weblog:entries}2nd Folio</title>
		
		{embed="includes/head"}
		
	</head>
	<body>
		{embed="includes/header"}
		<div class="container">
			<div class="page-top"></div>
			<div class="page-mid">			
				<div class="span-24">
					{if segment_2 == ""}
						{exp:weblog:entries weblog="quotes" limit="1" dynamic="on" orderby="random"}				
					{if:else}
						{exp:weblog:entries weblog="quotes" limit="1" dynamic="on"}
					{/if}
					<div class="span-8 colborder prepend-top">
						<h1 class="stencil">{title}</h1>
						<p class="intro">{quote-intro}</p>
						{quote-body}
					</div>
					<div class="span-15 last prepend-top">
					
						{quote-media}
						<div class="span-15 last append-bottom border-bottom">
							<h2>{heading}</h2>
							<div class="prepend-top append-bottom">
								{if embed != ""}
								<object width="590" height="490"><param name="movie" value="http://www.youtube.com/v/{exp:replace find="http://www.youtube.com/watch?v=" replace=""}{embed}{/exp:replace}?fs=1&amp;hl=en_US"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="http://www.youtube.com/v/{exp:replace find="http://www.youtube.com/watch?v=" replace=""}{embed}{/exp:replace}?fs=1&amp;hl=en_US" type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true" width="590" height="490"></embed></object>
								{/if}
								{if vimeo != ""}
								<iframe src="http://player.vimeo.com/video/{exp:replace find="http://vimeo.com/" replace=""}{vimeo}{/exp:replace}?portrait=0&amp;color=ffffff" width="590" height="490" frameborder="0"></iframe>
								{/if}

							</div>
							{if description != ""}{description}{/if}
						</div>
						{/quote-media}
					
					</div>
					{/exp:weblog:entries}
				</div>
					<div class="clear"></div>
				</div>
				<div class="page-bottom"></div>
		</div>
		{embed="includes/footer"}
	</body>
</html>
