<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/*
========================================================
Plugin GET_POST_Var
--------------------------------------------------------
Copyright: Ingo Wedler
License: Freeware
http://ingowedler.com/
--------------------------------------------------------
This addon may be used free of charge. Should you
employ it in a commercial project of a customer or your
own I'd appreciate a small donation.
========================================================
File: pi.get_post_var.php
--------------------------------------------------------
Purpose: GET_POST_Var provides some helper functions for fetching data like GET, POST, User IP, User Agent, Cookies, Server Variables (see PHP_Info).
========================================================
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF
ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
OR OTHER DEALINGS IN THE SOFTWARE.
========================================================
*/


$plugin_info = array(  'pi_name' => 'GET_POST_Var',
	'pi_version' => '1.0',
	'pi_author' => 'Ingo Wedler',
	'pi_author_url' => 'http://ingowedler.com/',
	'pi_description' => 'GET_POST_Var provides some helper functions for fetching data like GET, POST, User IP, User Agent, Cookies, Server Variables (see PHP_Info).',
	'pi_usage' => get_post_var::usage());

class GET_POST_Var
{
	var $return_data;

	function GET_POST_Var()
	{
		$this->EE =& get_instance();

		$text = $this->EE->TMPL->tagdata;

		$type = $this->EE->TMPL->fetch_param('type', '');
		$var = $this->EE->TMPL->fetch_param('var', '');

		if ($type == 'user_ip') {
			$text = $this->EE->input->ip_address();
		} elseif ($type == 'user_agent') {
			$text = $this->EE->input->user_agent();
		} elseif ($type == 'server') {
			$text = $this->EE->input->server($var);
		} elseif ($type == 'cookie') {
			$text = $this->EE->input->cookie($var);
		} elseif ($type == 'post') {
			$text = $this->EE->input->post($var);
		} elseif ($type == 'get') {
			$text = $this->EE->input->get($var);
		} else {
			$text = $this->EE->input->get_post($var, TRUE);
		}

		$text = trim($text);

		$this->return_data = $text;
	}

	// ----------------------------------------
	// Plugin Usage
	// ----------------------------------------
	// This function describes how the plugin is used.
	// Make sure and use output buffering
	function usage()
	{
		ob_start();
		?>
Example:
----------------

{exp:get_post_var type='get' var='variable_name'}


Supported Types/Pairs:

					- type='get' var='variable_name'

					- type='post' var='variable_name'

					- type='get_post' var='variable_name'
						looks in both GET and POST

					- type='cookie' var='variable_name'
						reads cookies, [Note: For EE default cookies, you don't need the cookie prefix (i.e. exp_)]

					- type='server' var='SERVER_VARIABLE' (like 'SERVER_SOFTWARE')
						see PHP INFO (CP Home -> Tools -> Utilities -> PHP Info) for more variables

					- type='user_agent'
						no var='' supported

					- type='user_ip'
						no var='' supported

----------------
CHANGELOG:

1.0
* 1st version for EE 2.x
		<?php
		$buffer = ob_get_contents();
		ob_end_clean();
		return $buffer;
	}
	  /* END */

}
/* END Class */
/* End of file pi.strip_html.php */
/* Location: ./system/expressionengine/third_party/get_post_var/pi.get_post_var.php */