<?php

/*
=========================================================
 This Extension is intended for use with ExpressionEngine.
 ExpressionEngine is Copyright (c) pMachine, Inc.
 http://www.pmachine.com/
=========================================================
 THIS IS COPYRIGHTED SOFTWARE
 ALL RIGHTS RESERVED
 Written by: Travis Smith
 Copyright (c) 2007 Hop Studios
 http://www.hopstudios.com/
--------------------------------------------------------
 Please do not distribute this extension or any modified
 version of it without written consent from the author.
========================================================
Files:	ext.publishimprove.php
		lang.publishimprove.php
		README.txt
========================================================
*/

if ( ! defined('EXT'))
{
    exit('Invalid file request');
}

class Publishimprove
{
	var $settings			= array();
	
	var $name				= 'Publish Page Improvements';
	var $version			= '2.0.1';
	var $description		= 'Makes many handy improvements to the admin interface. You must click SETTINGS to choose which ones you want enabled.';
	var $settings_exist		= 'y';
	var $docs_url			= 'http://www.hopstudios.com/software/publish_improve/';
	
	var $working			= '';
	var $url_title			= '';
	var $query				= ''; 
		
	// -------------------------------
	//   Constructor - Extensions use this for settings
	// -------------------------------
	
	function Publishimprove($settings='')
	{
		global $LANG;
		$LANG->fetch_language_file('publishimprove');

		$this->settings = $settings;

	}
	// END





		
	function change_upload_button()
	{ 
		// most of this is just to fetch the right variables for the upload window link...
		global $DSP, $IN, $FNS, $SESS, $DB, $LANG; // $IN contains the $field_group, $FNS and $SESS contain the $weblog_id in some cases

		$assigned_weblogs = $FNS->fetch_assigned_weblogs();

		if ( ! $weblog_id = $IN->GBL('weblog_id', 'GP'))
		{
			// Does the user have their own blog?
			
			if ($SESS->userdata['weblog_id'] != 0)
			{
				$weblog_id = $SESS->userdata['weblog_id'];
			}
			elseif (sizeof($assigned_weblogs) == 1)
			{
				$weblog_id = $assigned_weblogs['0'];
			}
			else
			{
				$query = $DB->query("SELECT weblog_id from exp_weblogs WHERE is_user_blog = 'n'");
	  
				if ($query->num_rows == 1)
				{
					$weblog_id = $query->row['weblog_id'];
				}
				else
				{
					return false;
				}
			}
		}

		$query = $DB->query("SELECT * FROM  exp_weblogs WHERE weblog_id = '$weblog_id'");     
				
		foreach ($query->row as $key => $val)
		{
			$$key = $val;
		}
		
		// here's where the link text is actually changed
		$up_img = '<img src="'.PATH_CP_IMG.'upload_file.gif" border="0" align="absmiddle" width="16" height="16" alt="'.$LANG->line('file_upload').'" />';

		if(isset($this->settings['change_upload_button']) && $this->settings['change_upload_button'] == "yes" && isset($this->settings['text_for_upload_button']))
		{
			if ( $this->settings['text_for_upload_button'] != '')
			{
				return $DSP->anchorpop(BASE.AMP.'C=publish'.AMP.'M=file_upload_form'.AMP.'field_group='.$field_group.AMP.'Z=1', $this->settings['text_for_upload_button']." $up_img", '520', '600');
			}
		}
		else
		{
			return $DSP->anchorpop(BASE.AMP.'C=publish'.AMP.'M=file_upload_form'.AMP.'field_group='.$field_group.AMP.'Z=1', "$up_img", '520', '600');
		}
	}
	
	
	


	function change_full_control_panel_page($data)
	{ 
		// make sure you're playing well with other extensions

		global $EXT, $DSP, $IN, $FNS, $SESS, $DB, $LANG;

		if($EXT->last_call !== false)
		{
		  $data = $EXT->last_call;
		}

		// this has to be done before we replace the SAVE buttons
		if(isset($this->settings['add_view_live_version_link']) && $this->settings['add_view_live_version_link'] == "yes")
		{
	
			// if this is the edit form
			if (($IN->GBL('M')) == "edit_entry")
			{
				// orig save buttons
				$look_for = $DSP->qdiv('itemTitle', $LANG->line('url_title', 'url_title'));
		
				if ( $entry_id = $IN->GBL('entry_id', 'GP'))
				{
					// get the url_title from the database, yes, it's overkill this way...
					$entry_id = $IN->GBL('entry_id', 'GET');
					$sql = "SELECT t.*
							FROM   exp_weblog_titles AS t
							WHERE  t.entry_id	= '$entry_id'"; 
					$result = $DB->query($sql);
					foreach ($result->row as $key => $val)
					{
						$$key = $val;
					}

					$query = $DB->query("SELECT * FROM  exp_weblogs WHERE weblog_id = '$weblog_id'");     
							
					foreach ($query->row as $key => $val)
					{
						$$key = $val;
					}
	
					//make the link
					$working  = '<small><a href="'.$search_results_url.$url_title.'" ';
					$working .= 'onclick="window.open(\''.$search_results_url.$url_title.'\',\'preview\');return false;">';
					$working .= $LANG->line('view_live_version_link_text').'</a></small>';
	
					// new save buttons
					$replace_with = $DSP->qdiv('itemTitle',$LANG->line('url_title', 'url_title') .NBS.NBS.$working);
		
					$data = str_replace($look_for, $replace_with, $data);
				}

		
			}
		}


		// this has to be done before we replace the SAVE buttons
		if(isset($this->settings['add_copy_checkbox']) && $this->settings['add_copy_checkbox'] == "yes")
		{
	
			// if this is the edit form
			if (($IN->GBL('M')) == "edit_entry")
			{
				// orig save buttons
				$look_for = $DSP->div('submitBox').$DSP->input_submit($LANG->line('preview'), 'preview').NBS.$DSP->input_submit($LANG->line('quick_save'), 'save').NBS;
				$look_for .= ($IN->GBL('C') == 'publish') ? $DSP->input_submit($LANG->line('submit'), 'submit') : $DSP->input_submit($LANG->line('update'), 'submit');
		
				// new save buttons
				$replace_with = $look_for;
				$replace_with .= <<<EOT
				<script type="text/javascript">
				function clickbox(mycheckbox) {
					if (mycheckbox.value>0)
					{
						mycheckbox.form.entry_id.value=mycheckbox.value;
						mycheckbox.value=0
					}
					else
					{
						mycheckbox.value=mycheckbox.form.entry_id.value;
						mycheckbox.form.entry_id.value='';
					}
				}
				</script>
EOT;
				$replace_with .= '&nbsp;<label><input type="checkbox" id="copy_checkbox" value="" onclick="clickbox(this);" />'. $LANG->line('copy_checkbox').'</label>';
	
				$data = str_replace($look_for, $replace_with, $data);
		
			}
		}


		if(isset($this->settings['change_email_button_behavior']) && $this->settings['change_email_button_behavior'] == "yes")
		{
	
			// original button script
			$look_for = <<<EOT
                if (!Title || Title == "")
                    Title = Email;
            
            	var Link = '{' + 'encode="' + Email + '" title="' + Title + '"}';
EOT;
			// new button script
			$replace_with = <<<EOT
                if (!Title || Title == "")
                {
                    var Link = '{' + 'encode="' + Email + '"}';
                }
                else
                {
                    var Link = '{' + 'encode="' + Email + '" title="' + Title + '"}';
                }
EOT;

			$data = str_replace($look_for, $replace_with, $data);
	
		}


		if(isset($this->settings['remove_image_button']) && $this->settings['remove_image_button'] == "yes")
		{
			$LANG->fetch_language_file('publish');	
			
			$imagetext = $LANG->line('image');
			
			// original image button
			$look_for = <<<EOT
<td  class='htmlButtonOuter' >

<div class='htmlButtonInner' >

<div class='htmlButtonA' id='image'  >
<a href='javascript:promptTag("image");' >$imagetext</a>
</div>

</div>

</td>

EOT;
			// replace it with nothin'
			$replace_with = "";

			$data = str_replace($look_for, $replace_with, $data);
	
		}


		if(isset($this->settings['remove_date_cruft']) && $this->settings['remove_date_cruft'] == "yes")
		{
			
			$imagetext = $LANG->line('image');
			
			// This is just a style sheet trick that hides the additional menus
			$look_for = '</style>';
			$replace_with = <<<EOT
.itemWrapper .lightLinks {
	visibility:hidden;
	position:absolute;
}
</style>

EOT;
			$data = str_replace($look_for, $replace_with, $data);
	
		}


		if(isset($this->settings['change_title_behavior']) && $this->settings['change_title_behavior'] == "yes")
		{
			
			// Step 1: Remove the onload property, if it's there
			$look_for = 'onload="document.forms[0].title.focus();';
			$replace_with = 'onload="';
			$data = str_replace($look_for, $replace_with, $data);
	
			// Step 2: Add a script below the URL title
			$look_for = " size='20' maxlength='75' class='input'  />";
			$replace_with = <<<EOT
 size='20' maxlength='75' class='input'  />
 
		<script tyle="text/javascript"><!-- //
		if (document.forms[0].url_title.value == '')
			document.forms[0].title.focus();
		--></script>

EOT;
			$data = str_replace($look_for, $replace_with, $data);
	
		}


		if(isset($this->settings['add_date_to_url_title']) && ($this->settings['add_date_to_url_title'] == "Before" || $this->settings['add_date_to_url_title'] == "After") )
		{
			
			// Add to the Javascript that builds the url_title
			$look_for = "			NewText = NewText.replace(/^-/g,'');";
			$replace_with = <<<EOT
			NewText = NewText.replace(/^-/g,'');
			
			myDate = new Date();
			// Add 1900 to the year for a 4 digit value
			myDateString = "" + (myDate.getYear()+1900)
			// Add "0" in front of months 0-8 (month[9] is Oct.)
			myDateString = myDateString + (myDate.getMonth() <= 8? "0" : "" ) + (myDate.getMonth()+1);
			// Add "0" in front of days 1-9
			myDateString = myDateString +  (myDate.getDate() <= 9? "0" : "" )  + myDate.getDate();
EOT;
			if ($this->settings['add_date_to_url_title'] == "Before") {
			$replace_with .= "NewText = myDateString + separator + NewText;\r";
			}
			else
			{
			$replace_with .= "NewText = NewText + separator + myDateString;\r";
			}
			

			$data = str_replace($look_for, $replace_with, $data);
	
		}


		if(isset($this->settings['remove_tab_my_account']) && $this->settings['remove_tab_my_account'] == "yes" )
		{
		
			$imagetext = $LANG->line('display');
			
			// Add to the Javascript that builds the url_title
			$js = ' onclick="navjump(\''.BASE.AMP.'C=myaccount'.'\');" onmouseover="navTabOn(\'my_account\');" onmouseout="navTabOff(\'my_account\');" ';
			$look_for = "#";
			$look_for .= "<td class='navCell' width='[^%]+%' ".$js.">";
					$str = str_replace(' ', NBS, $LANG->line('my_account'));
					$str = str_replace('"', '&quot;', $str);
					$str = str_replace("'", "&#39;", $str);
			$div = $DSP->div('cpNavOff', '', 'my_account').$str.$DSP->div_c();
			$look_for .= $DSP->anchor(BASE.AMP.'C=myaccount', $div);
			$look_for .= $DSP->td_c();
			$look_for .= "#";
			$look_for = str_replace("?","\?", $look_for);
			$look_for = str_replace("(","\(", $look_for);
			$look_for = str_replace(")","\)", $look_for);
					
			$replace_with = "";

			$data = preg_replace($look_for, $replace_with, $data);

		}


		if(isset($this->settings['remove_tab_modules']) && $this->settings['remove_tab_modules'] == "yes" )
		{
		
			$imagetext = $LANG->line('display');
			
			// Add to the Javascript that builds the url_title
			$js = ' onclick="navjump(\''.BASE.AMP.'C=modules'.'\');" onmouseover="navTabOn(\'modules\');" onmouseout="navTabOff(\'modules\');" ';
			$look_for = "#";
			$look_for .= "<td class='navCell' width='[^%]+%' ".$js.">";
					$str = str_replace(' ', NBS, $LANG->line('modules'));
					$str = str_replace('"', '&quot;', $str);
					$str = str_replace("'", "&#39;", $str);
			$div = $DSP->div('cpNavOff', '', 'modules').$str.$DSP->div_c();
			$look_for .= $DSP->anchor(BASE.AMP.'C=modules', $div);
			$look_for .= $DSP->td_c();
			$look_for .= "#";
			$look_for = str_replace("?","\?", $look_for);
			$look_for = str_replace("(","\(", $look_for);
			$look_for = str_replace(")","\)", $look_for);
					
			$replace_with = "";

			$data = preg_replace($look_for, $replace_with, $data);

		}


		if( (isset($this->settings['change_save_button'])      && $this->settings['change_save_button']      == "yes") ||
			(isset($this->settings['change_quicksave_button']) && $this->settings['change_quicksave_button'] == "yes") ||
			(isset($this->settings['change_preview_button'])   && $this->settings['change_preview_button']   == "yes") )
		{
	
			// if this is the edit form
			if ((($IN->GBL('M')) == "edit_entry") OR (($IN->GBL('M')) == "entry_form") OR (($IN->GBL('M')) == "new_entry") OR (($IN->GBL('C')) == "publish"))
			{
				// orig save buttons
				$look_for  = $DSP->div('submitBox').$DSP->input_submit($LANG->line('preview'), 'preview').NBS.$DSP->input_submit($LANG->line('quick_save'), 'save').NBS;
				$look_for .= ($IN->GBL('C') == 'publish') ? $DSP->input_submit($LANG->line('submit'), 'submit') : $DSP->input_submit($LANG->line('update'), 'submit');
		
				// new save buttons
				$replace_with  = $DSP->div('submitBox');
					
				if (isset($this->settings['change_preview_button']) &&
					$this->settings['change_preview_button'] == "yes" &&
					isset($this->settings['text_for_preview_button']) )
				{
					if (isset($this->settings['text_for_preview_button']) && $this->settings['text_for_preview_button']    != "")
					{
						$replace_with .= $DSP->input_submit('&nbsp;&nbsp;'.$this->settings['text_for_preview_button'].'&nbsp;&nbsp;', 'preview').NBS;
					}
				}
				else
				{
				$replace_with .= $DSP->input_submit($LANG->line('preview'), 'preview').NBS;
				}

				if (isset($this->settings['change_quicksave_button']) &&
				    $this->settings['change_quicksave_button'] == "yes" &&
				    isset($this->settings['text_for_quicksave_button']) )
				{
					if (isset($this->settings['text_for_quicksave_button']) && $this->settings['text_for_quicksave_button']    != "")
					{
						$replace_with .= $DSP->input_submit('&nbsp;&nbsp;'.$this->settings['text_for_quicksave_button'].'&nbsp;&nbsp;', 'save').NBS;
					}
				}
				else
				{
				$replace_with .= $DSP->input_submit($LANG->line('quick_save'), 'save').NBS;
				}

				if (isset($this->settings['change_save_button']) &&
				    $this->settings['change_save_button'] == "yes" &&
				    isset($this->settings['text_for_save_button']) )
				{
					if (isset($this->settings['text_for_save_button']) && $this->settings['text_for_save_button']    != "")
					{
						$replace_with .= $DSP->input_submit('&nbsp;&nbsp;'.$this->settings['text_for_save_button'].'&nbsp;&nbsp;', 'submit').NBS;
					}
				}
				else
				{
				$replace_with .= ($IN->GBL('C') == 'publish') ? $DSP->input_submit($LANG->line('submit'), 'submit') : $DSP->input_submit($LANG->line('update'), 'submit');
				}

				$data = str_replace($look_for, $replace_with, $data);
		
			}
		}




		if(isset($this->settings['change_template_tab_behavior']) && $this->settings['change_template_tab_behavior'] == "yes")
		{
		
			// if this is the template form
			if ((($IN->GBL('M')) == "edit_template") OR (($IN->GBL('M')) == "update_template"))
			{
				$data .= <<<EOT
	<script type="text/javascript"> 
	//<![CDATA[
	
	function getCharTab(e) {
	
		// IE and Firefox
		// tab => 9
		// return => 13
		// up => 38
		// down => 40
		
		if (window.event)
		{
			e = window.event;
		}
	
		var charCode = (!e.which || e.which == 0) ? e.keyCode : e.which;
		
		if (charCode != 9) return true;
		
		addTab();
	
		return false;
	}
	
	function addTab()
	{
		var theField = document.getElementById('template_data');
		var theInsert = "\t";
		
		// Is this a Windows user?  If so, add tags around selection
	
		if (document.selection) 
		{
			theField.focus();
		
			document.selection.createRange().text = theInsert;
			
			theField.blur();
			theField.focus();
		}
		else if ( ! isNaN(theField.selectionEnd))
		{
			var selLength = theField.textLength;
			var selStart = theField.selectionStart;
			var selEnd = theField.selectionEnd;
			if (selEnd <= 2)
				selEnd = selLength;
	
			var s1 = (theField.value).substring(0,selStart);
			var s2 = (theField.value).substring(selStart, selEnd)
			var s3 = (theField.value).substring(selEnd, selLength);
			
			var newStart = selStart + theInsert.length;
			
			theField.value = s1 + theInsert + s3;
			
			theField.focus();
			theField.selectionStart = newStart;
			theField.selectionEnd = newStart;
		}
	}
	
	
	document.onkeypress = getCharTab;
	
	//]]>
	</script>
	
	
EOT;
			
			}
		}
		
		
		
		
		
		if(isset($this->settings['change_admin_home_page']) && $this->settings['change_admin_home_page'] == "yes")
		{
		
			// if this is the main page form
			if (($IN->GBL('C')) == "")
			{
				$look_for = "<td  class='breadcrumbRight'  style='width:270px;' valign='bottom' align='right'>";
				$replace_with = "<td  class='breadcrumbRight'  style='width:150px;' valign='bottom' align='right'><a href='".BASE.AMP."C=myaccount".AMP."M=homepage' ><div class='crumblinksR' id='rcrumb2'  onClick=\"navjump('index.php?S=0&amp;C=myaccount".AMP."M=homepage');\"  onMouseover=\"if (document.getElementById('rcrumb2').className == 'crumblinksR') { document.getElementById('rcrumb2').className = 'crumblinksRHover';}\" onMouseout=\"if (document.getElementById('rcrumb2').className == 'crumblinksRHover') { document.getElementById('rcrumb2').className = 'crumblinksR';};\" >".$LANG->line('modify_this_page')."</div></a></td>".$look_for;
	
				$data = str_replace($look_for, $replace_with, $data);
	
			}
		}
		
		
		
		
		return $data;
	}



	 



    // --------------------------------
    //  Depreciated Calls
    // --------------------------------
	function add_textarea_resizer($data) // removed in 1.7.0
	{
		// make sure you're playing well with other extensions
		global $EXT;
		if($EXT->last_call !== false)
		{
		  $data = $EXT->last_call;
		}
		return $data;
	}

	function change_save_buttons($data)
	{ 
	}
	
	function add_copy_checkbox($data)
	{ 
		// make sure you're playing well with other extensions
		global $EXT;
		if($EXT->last_call !== false)
		{
		  $data = $EXT->last_call;
		}
		return $data;
	}
	
	function change_admin_home_page($data)
	{ 
		// make sure you're playing well with other extensions
		global $EXT;
		if($EXT->last_call !== false)
		{
		  $data = $EXT->last_call;
		}
		return $data;
	}
	
	function change_template_tab_behavior($data)
	{ 
		// make sure you're playing well with other extensions
		global $EXT;
		if($EXT->last_call !== false)
		{
		  $data = $EXT->last_call;
		}
		return $data;
	}
	

    // --------------------------------
    //  Activate Extension
    // --------------------------------
    
    function activate_extension()
    {
    	global $DB, $PREFS;
    	
		// FILE UPLOAD page hook
	   	$DB->query($DB->insert_string('exp_extensions',
    								  array('extension_id'	=> '',
    										'class'			=> __CLASS__,
    										'method'		=> "change_upload_button",
    										'hook'			=> "publish_form_upload_link",
    										'settings'		=> '',
    										'priority'		=> 10,
    										'version'		=> $this->version,
    										'enabled'		=> "y"
    										)
    								 )
    			   );

		// PUBLISH/EDIT page hook; CP HOME page hook; TEMPLATE page hook
    	$DB->query($DB->insert_string('exp_extensions',
    								  array('extension_id'	=> '',
    										'class'			=> __CLASS__,
    										'method'		=> "change_full_control_panel_page",
    										'hook'			=> "show_full_control_panel_end",
    										'settings'		=> '',
    										'priority'		=> 20, 
    										'version'		=> $this->version,
    										'enabled'		=> "y"
    										)
    								 )
    			   );

/*    	$DB->query($DB->insert_string('exp_extensions',
    								  array('extension_id'	=> '',
    										'class'			=> __CLASS__,
    										'method'		=> "foo",
    										'hook'			=> "bar",
    										'settings'		=> '',
    										'priority'		=> 10,
    										'version'		=> $this->version,
    										'enabled'		=> "y"
    										)
    								 )
    			   );
*/
    }
    // END
    
    
    // --------------------------------
    //  Update Extension
    // --------------------------------  
    
    function update_extension($current='')
    {
		global $DB;

    	if ($current == '' OR $current == $this->version)
    	{
    		return FALSE;
    	}
    	
    	if ($current < '1.7.0')
    	{
    		// Reset the extension calls for 1.7.0
			global $DB;
			$DB->query("DELETE FROM exp_extensions WHERE class = '".__CLASS__."'");
			$this->activate_extension();

			$DB->query("UPDATE exp_extensions SET version = '".
			$DB->escape_str($this->version).
			"' WHERE class = '".__CLASS__."'");
    	}
    	
    }
    // END
		

	// --------------------------------
	//  Settings
	// --------------------------------  

	function settings()
	{

		global $LANG, $PREFS;
		
		$settings = array();
		
		// FILE UPLOAD settings
		$settings['change_upload_button']       = array('r', array('yes'=>'yes', 'no'=>'no'), 'yes');
		$settings['text_for_upload_button']     = 'Upload File: ';

		// PUBLISH/EDIT page settings
		$settings['change_save_button']         = array('r', array('yes'=>'yes', 'no'=>'no'), 'yes');
		$settings['text_for_save_button']       = 'Save';
		$settings['change_quicksave_button']    = array('r', array('yes'=>'yes', 'no'=>'no'), 'yes');
		$settings['text_for_quicksave_button']  = '';
		$settings['change_preview_button']      = array('r', array('yes'=>'yes', 'no'=>'no'), 'yes');
		$settings['text_for_preview_button']    = 'Preview';
		$settings['add_copy_checkbox']          = array('r', array('yes'=>'yes', 'no'=>'no'), 'yes');
		$settings['add_view_live_version_link'] = array('r', array('yes'=>'yes', 'no'=>'no'), 'yes');
		$settings['change_email_button_behavior'] = array('r', array('yes'=>'yes', 'no'=>'no'), 'yes');
		$settings['remove_image_button']        = array('r', array('yes'=>'yes', 'no'=>'no'), 'yes');
		$settings['remove_date_cruft']          = array('r', array('yes'=>'yes', 'no'=>'no'), 'yes');
		$settings['change_title_behavior']  = array('r', array('yes'=>'yes', 'no'=>'no'), 'yes');
		$settings['add_date_to_url_title']      = array('r', array($LANG->line('before')=>'before', $LANG->line('after')=>'after', 'no'=>'no'), 'no');
		$settings['remove_tab_my_account']      = array('r', array('yes'=>'yes', 'no'=>'no'), 'no');
		$settings['remove_tab_modules']         = array('r', array('yes'=>'yes', 'no'=>'no'), 'no');

		// CP HOME page settings
		$settings['change_admin_home_page']     = array('r', array('yes'=>'yes', 'no'=>'no'), 'yes');

		// TEMPLATE page settings
		$settings['change_template_tab_behavior'] = array('r', array('yes'=>'yes', 'no'=>'no'), 'yes');

		// OTHER settings
		$settings['paid'] = array('r', array('yes' => 'yes', 'no' => 'no'), 'no');

		return $settings;
	}
	// END
		
	function disable_extension()
	{
		global $DB;
		$DB->query("DELETE FROM exp_extensions WHERE class = '".__CLASS__."'");
	}
	

    
}
// END Class

?>