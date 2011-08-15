<!DOCTYPE HTML">
<html>
	<head>
		<title>{if segment_2 != ""}{exp:weblog:entries weblog="characters" dynamic="on"}{title}{/exp:weblog:entries} | {/if}Characters | 2nd Folio</title>
		
		{embed="includes/head"}
		
	</head>
	<body>
		{embed="includes/header"}
		<div class="container">
			<div class="page-top"></div>
			<div class="page-mid">
				<div class="span-24">

					{if segment_2 == ""}
						{!--MAIN PAGE--}

						<h1 class="stencil">Points System</h1>
						<div class="span-24">
						{exp:weblog:entries weblog="characters"}
						<a href="{title_permalink="characters/"}" class="character-box">
								{exp:imgsizer:size src="{character-image}" width="220"}
								<h3>{title}</h3>
								<p>{character-point} points</p>
						</a>
						{/exp:weblog:entries}
						</div>
					{if:else}
					
						{!--ENTRY PAGE--}
						<div class="span-24">
						{exp:weblog:entries weblog="characters"}
							<div class="span-15">
								<h1 class="stencil">{title}</h1>
								<p>Worth: {character-point} points</p>								
								<p class="intro">{character-intro}</p>
								{character-body}
							</div>
								<large><a href="{path="characters"}">« BACK</a></large>
								
							<div class="prepend-top push-1 last span-6">
								{exp:imgsizer:size src="{character-image}" width="230"}
							</div>

						{/exp:weblog:entries}					
						</div>
					{/if}
					</div>
				<div class="clear"></div>
			</div>
			<div class="page-bottom"></div>

		</div>
		{embed="includes/footer"}
	</body>
</html>
