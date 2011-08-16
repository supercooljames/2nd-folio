<!DOCTYPE HTML">
<html>
	<head>
		<title>Submit | 2nd Folio</title>
		
		{embed="includes/head"}
		
	</head>
	<body>
		{embed="includes/header"}
		<div class="container">
			<div class="page-top"></div>
			<div class="page-mid">			
			<div class="span-24">
			
			{if segment_2 == "thankyou"}
				<div class="span-18">
					<h1 class="stencil">Thank you for your suggestion</h1> 
					<p>You will recieve an email shortly confirming your submission.</p>				
				</div>
			{if:else}
				<div class="span-12">
				{exp:weblog:entries entry_id="8"}
					<h1 class="stencil">{title}</h1>
					<p class="intro">{intro}</p>
					{body}
				{/exp:weblog:entries}
				</div>
				

				{exp:freeform:form
				   collection="Submit Form"
				   required="name|email|message"
				   return="submit/thankyou"
				   notify="james@supercooldesign.co.uk, paul.sutton@candt.org"
				   template="submission-notification"
				   send_user_email="yes"
				   user_email_template="submission-success"
				   file_upload="Main Upload Directory"
				   }
					<div class="span-9 last push-2 prepend-top">
					<form class="span-9 last suggestion-form">
						<label class="stencil">Name</label><br />
						<input type="text" name="name" class="span-9 title">
	
						<label class="stencil">Email</label><br />
						<input type="text" name="email" class="span-9 title">
	
						<label class="stencil">Suggestion</label><br />
						<textarea type="text" name="message" class="span-9 title"></textarea>
						<p>
							<button type="reset" class="nice-button">Reset</button>
							<button type="submit" class="nice-button">Submit</button>
						</p>
					</form>
					</div>
				{/exp:freeform:form}						
			{/if}
			</div>

				<div class="clear"></div>
			</div>
			
			
			
			<div class="page-bottom"></div>

		</div>
		{embed="includes/footer"}
	</body>
</html>
