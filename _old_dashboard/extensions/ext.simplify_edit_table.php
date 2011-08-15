<?php

/*
=========================================================
 This Extension is intended for use with ExpressionEngine.
 ExpressionEngine is Copyright (c) 2003 pMachine, Inc.
 http://www.pmachine.com/
=========================================================
 THIS IS COPYRIGHTED SOFTWARE
 All RIGHTS RESERVED
 Written by: Derek Jones
 Copyright (c) 2006 Koru Productions
 http://ee.koruproductions.com/
--------------------------------------------------------
 Please do not distribute this extension without written
 consent from the author.
========================================================
 Files:	ext.simplify_edit_table.php
--------------------------------------------------------
 Purpose: 	Remove Comments and Trackbacks columns
			from the Edit entries table listing.
========================================================
*/

if ( ! defined('EXT'))
{
    exit('Invalid file request');
}

class Simplify_edit_table
{
	var $settings = array();
	var $name = 'Simplify Edit Table';
	var $version = '1.1.2';
	var $description = 'Removes the Comments and Trackbacks columns from the table on the control panel Edit page';
	var $settings_exist = 'n';
	var $docs_url = '';
	
	// CONSTRUCTOR
	
	function Simplify_edit_table($settings='')
	{
		$this->settings = $settings;
	}
	
	function remove_column_header($o)
	{
		global $EXT, $LANG;
		
		if ($EXT->last_call !== FALSE)
		{
			$o = $EXT->last_call;
		}

		$comment_header = "<td  class='tableHeadingAlt' >\n".$LANG->line('comments')."\n</td>";
		$trackback_header = "<td  class='tableHeadingAlt' >\n".$LANG->line('trackbacks')."\n</td>";
				
		$o = str_replace($comment_header, '', $o);
		$o = str_replace($trackback_header, '', $o);
		
		return $o;
	}
	
	function remove_column_row($tr)
	{
		global $EXT;
		
		if ($EXT->last_call !== FALSE)
		{
			$tr = $EXT->last_call;
		}
		
		// Ugliest preg_replace evar!!!!!1111
		$tr = preg_replace("#<td  class='(tableCellTwo|tableCellOne)' >\n+<(span|div) class='lightLinks'\s*>(.*)\n(.*)\n</td>#", "", $tr);
		
		return $tr;
	}
	
	function activate_extension()
	{
		global $DB;
		
		$DB->query($DB->insert_string('exp_extensions',
				array(
				'extension_id'	=> '',
				'class'			=> "Simplify_edit_table",
				'method'		=> "remove_column_header",
				'hook'			=> "edit_entries_modify_tableheader",
				'settings'		=> "",
				'priority'		=> 10,
				'version'		=> $this->version,
				'enabled'		=> "y"
				)
			)
		);
		
		$DB->query($DB->insert_string('exp_extensions',
				array(
				'extension_id'	=> '',
				'class'			=> "Simplify_edit_table",
				'method'		=> "remove_column_row",
				'hook'			=> "edit_entries_modify_tablerow",
				'settings'		=> "",
				'priority'		=> 10,
				'version'		=> $this->version,
				'enabled'		=> "y"
				)
			)
		);
		
	}
		
	function disable_extension()
	{
		global $DB;
		
		$DB->query("DELETE FROM exp_extensions WHERE class = 'Simplify_edit_table'");
		
	}
	
}
?>