<!DOCTYPE HTML">
<html>
	<head>
		<title>Download Playing Cards | 2nd Folio</title>
		
		{embed="includes/head"}
		
	</head>
	<body>
		{embed="includes/header"}
		<div class="container">
			<div class="page-top"></div>
			<div class="page-mid">			
					
					
					
					
				{if logged_in}
				<div class="span-24">
					<div class="span-18">
					{exp:weblog:entries entry_id="65"}
						<h1 class="stencil">{title}</h1>
						<p class="intro">{intro}</p>
						{body}
					<a href="#">DOWNDLOAD BUTTON</a>
					{/exp:weblog:entries}
					
					</div>
				</div>
				{if:else}
					<div class="span-24">
						<div class="span-15">
							{exp:weblog:entries entry_id="63"}		
								<h1 class="stencil">{title}</h1>
								<p class="intro">{intro}</p>
								{body}					
						</div>
						<div class="span-8 push-1 last prepend-top">	
							<h3>Network member login</h3>
								{exp:member:login_form return="cards/"}
									<label class="stencil">Username</label><br />
									<input type="text" name="username" value="" class="span-5 text"/> <br />
									
									<label class="stencil">Password</label><br />
									<input type="password" name="password" value="" class="span-5 text" /></p>
								
									<p>
										<input type="submit" name="submit" value="Login" />
									</p>
								{/exp:member:login_form}
							{/exp:weblog:entries}
						</div>
					</div>
				{/if}			
					
				
				<div class="clear"></div>
			</div>
			<div class="page-bottom"></div>
		</div>
		{embed="includes/footer"}
	</body>
</html>
