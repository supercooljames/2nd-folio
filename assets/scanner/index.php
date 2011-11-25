<html>
	<head>
		<title>ActSmart | After school drama club</title>
		
		<?php include '../common/head.php' ?>

		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.webcamqrcode.js"></script>

		
	</head>
	<body class="kids">
		<?php include '../common/header.php' ?>




		<div class="wrapper">
			<div class="content">


				<h1>Scan you card here</h1>
				<script>
				(function($){
					$('document').ready(function(){
						$('#qrcodebox').WebcamQRCode({
							onQRCodeDecode: function( p_data ){
									$('#qrcode_result').html( p_data );
									window.location.replace(p_data);
							}
						});

						$('#btn_start').click(function(){
							$('#qrcodebox').WebcamQRCode().start();
						});

						$('#btn_stop').click(function(){
							$('#qrcodebox').WebcamQRCode().stop();
						});
					});
				})(jQuery);
				</script>

				<div style="width: 500px; height: 500px;margin: 30px 250px" id="qrcodebox">
				</div>
				<input type="button" value="Start" class="" /> 
				<input type="button" value="Stop" id="btn_stop" />
				<p>
				Last QRCode value: <span id="qrcode_result">none</span>
				</p>

				

			<?php include '../common/badges.php' ?>



				<?php include '../common/footer.php' ?>
			</div>			
<div class="clear"></div>
		</div>
	</body>
</html>
