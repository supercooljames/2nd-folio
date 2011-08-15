<!DOCTYPE HTML">
<html>
	<head>
		<title>The League | 2nd Folio</title>
		
		{embed="includes/head"}
		
	</head>
	<body>
		{embed="includes/header"}
		<div class="container">
			<div class="page-top"></div>
			<div class="page-mid">			
				<div class="span-24">
				{exp:weblog:entries weblog="league" limit="1"}
					<div class="span-8 colborder prepend-top">
						<h1 class="stencil">The League</h1>
						<p class="intro">{league-body}</p>
					</div>
					<div class="span-15 last prepend-top">

					<table class="league">
						<thead>
							<td class="team">Team
							</td>
							<td class="played">Played<br /><small>[Number of rounds]</small>
							</td>
							<td played="average">Average<br /><small>[Points scored]</small>
							</td>
							<td class="total">Total
							</td>
						</thead>
						{league orderby="points" sort="desc"}
							<tr class="{switch="odd|tother"}">
								<td class="team">{team}</td>
								<td class="played">{rounds}</td>
								<td class="average">
								{exp:simple_math calculate="round({points} / {rounds},0)"}
								 </td>
								<td class="total">{points}</td>
							</tr>
						{/league}

					</table>
				



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
