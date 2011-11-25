$(function() {
	$('.add-team-trigger').click(function(e){
		e.preventDefault();
		$('#add-team').show();
	});
	
	$('body').supersleight();

	
/*-------------------------------------------    
LOAD FONTS BEFORE PAGE OR WAIT 3 SECONDS
-------------------------------------------*/

		(function(){
		  // if firefox 3.5+, hide content till load (or 3 seconds) to prevent FOUT
		  var d = document, e = d.documentElement, s = d.createElement('style');
		  if (e.style.MozTransform === ''){ // gecko 1.9.1 inference
		    s.textContent = 'body{visibility:hidden}';
		    e.firstChild.appendChild(s);
		    function f(){ s.parentNode && s.parentNode.removeChild(s); }
		    addEventListener('load',f,false);
		    setTimeout(f,3000); 
		  }
		})();	
	
	
	/*-------------------------------------------    
	FORMS:
	Add initial value to fields with .filled class
	-------------------------------------------*/

	var filled = $('input.filled');

	if(filled.length > 0){
		for(var i = 0; i < filled.length; i++){


			$(filled[i]).addClass('empty');
			filled[i].initialValue = filled[i].value;

			filled[i].onclick = filled[i].onfocus = function(){
				$(this).removeClass('empty');
				$(this).addClass('filled');
				if(this.value == this.initialValue){
					this.value= '';
				}
			}

			filled[i].onblur = function(){
				if(this.value == this.initialValue || this.value == ''){
					$(this).addClass('empty');
					$(this).removeClass('filled');
					this.value = this.initialValue;
				}else{
					$(this).addClass('empty');
					$(this).removeClass('filled');
				}
			}
		}
	}
	else
	{
		return; 
	}






});