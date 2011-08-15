<?php

/*
=====================================================
 ExpressionEngine - by pMachine
-----------------------------------------------------
 http://www.pmachine.com/
=====================================================
 This plugin was created by Lodewijk Schutte
 - lodewijk@gmail.com
 - http://loweblog.com/
 This work is licensed under a
 Creative Commons Attribution-ShareAlike 2.5 License.
 - http://creativecommons.org/licenses/by-sa/2.5/
=====================================================
 File: pi.replace.php
-----------------------------------------------------
 Purpose: Find and Replace plugin
=====================================================

*/


$plugin_info = array(
                 'pi_name'          => 'Find and Replace',
                 'pi_version'       => '1.3',
                 'pi_author'        => 'Lodewijk Schutte',
                 'pi_author_url'    => 'http://loweblog.com/',
                 'pi_description'   => 'Finds and replaces characters in some text, like the php str_replace() function',
                 'pi_usage'         => replace::usage()
               );


class Replace {

    var $return_data;

    
    // ----------------------------------------
    //  Find and Replace
    // ----------------------------------------

    function Replace()
    {
        global $TMPL;
                        
        // fetch params
        $caseinsens = ($TMPL->fetch_param('casesensitive') == 'no') ? true : false;
        $multiple   = ($TMPL->fetch_param('multiple') == 'yes') ? true : false;
        $regex      = ($TMPL->fetch_param('regex') == 'yes') ? true : false;
        $needle     = $TMPL->fetch_param('find');
        $replace    = $TMPL->fetch_param('replace');
        $haystack   = $TMPL->tagdata;
        
        // clean up params
        $dirty      = array('SPACE','QUOTE',SLASH);
        $clean      = array(' ','"','/');
        $needle     = str_replace($dirty,$clean,$needle);
        $replace    = str_replace($dirty,$clean,$replace);
        $haystack   = str_replace(SLASH,"/",$haystack);
        
        // regular expression replace
        if ($regex)
        {
          // check needle for first and last character
          if (substr($needle,0,1)  != "/") { $needle  = "/".$needle; }
          if (substr($needle,-1,1) != "/") { $needle .= "/"; }
          
          // add case insensitive flag
          if ($caseinsens) { $needle .= "i"; }
          
          $this->return_data = preg_replace($needle,$replace,$haystack);
        }
        // normal str_replace
        else
        {
          if ($multiple)
          {
            // convert needle to array
            $needle  = explode("|", $needle);
            
            // convert replace to array if vertical bar is found
            $replace = (substr_count($replace,"|") == 0) ? $replace : explode("|", $replace);
          }
        
          // perform str_replace
          if ($caseinsens && function_exists('str_ireplace'))
          {
            $this->return_data = str_ireplace($needle, $replace, $haystack);
          }
          else
          {
            $this->return_data = str_replace($needle, $replace, $haystack);
          }
        }
    }
    // END
    
    
// ----------------------------------------
//  Plugin Usage
// ----------------------------------------

// This function describes how the plugin is used.

function usage()
{
ob_start(); 
?>
This plugin works pretty much the same as the php str_replace() function:
http://www.php.net/manual/en/function.str-replace.php and the preg_replace() function:
http://www.php.net/manual/en/function.preg-replace.php

ExpressionEngine strips the white space from the beginning and the end of each parameter. Because of this,
if you want to replace something with a space, use the string "SPACE" instead.
If you want to use a double quote in a parameter value, use the string "QUOTE" instead.

*** EXAMPLES ***

# Replace A with B:

{exp:replace find="you" replace="we"}
  text you want processed
{/exp:replace}

Result: text we want processed


# Replace A with a space:

{exp:replace find="o" replace="SPACE"}
  text you want processed
{/exp:replace}

Result: text y u want pr cessed


# Replace a space with nothing

{exp:replace find="SPACE"}
  text you want processed
{/exp:replace}

Result: textyouwantprocessed


# Replace A, B and C with D:

{exp:replace find="a|e|i|o|u" replace="X" multiple="yes"}
  text you want processed
{/exp:replace}

Result: tXxt yXX wXnt prXcXssXd


# Replace A, B and C with X, Y and Z:

{exp:replace find="text|you|want" replace="words|we|have" multiple="yes"}
  text you want processed
{/exp:replace}

Result: words we have processed

# Regular Expression find and replace:

{exp:replace find="\w+" replace="*" regex="yes"}
  text you want processed
{/exp:replace}

Result: * * * *

# Regular Expression find and replace with backreference:

{exp:replace find="<a[^>]*href=QUOTE(.+)QUOTE[^>]*>(.*)<\/a>" replace="$2 ($1)" regex="yes"}
  <a href="http://www.foo.com/">text</a> you want <a href="http://www.bar.com/">processed</a>
{/exp:replace}

Result: text (http://www.foo.com/) you want processed (http://www.bar.com/)

Note: if you want to replace something with nothing, best is to omit the replace parameter altogether.
If you want to find multiple strings, always use the multiple="yes" parameter, or else it will search
for the literal string, including vertical bars. The multiple parameter has no effect when using a
regular expression find and replace.

This function is case sensitive by default. Use the parameter casesensitive="no" to ignore case, both
for a normal as for a regular expression find and replace.

When using regex="yes" it is recommended that you set your Debug Preference (Admin > System Preferences
> Output and Debugging Preferences) to 1, so Super Admins can make sure their regular expressions
aren't generating server errors.

<?php
$buffer = ob_get_contents();
	
ob_end_clean(); 

return $buffer;
}
// END

}
// END CLASS




// str_ireplace for php < 5.0    

// +----------------------------------------------------------------------+
// | PHP Version 4                                                        |
// +----------------------------------------------------------------------+
// | Copyright (c) 1997-2004 The PHP Group                                |
// +----------------------------------------------------------------------+
// | This source file is subject to version 3.0 of the PHP license,       |
// | that is bundled with this package in the file LICENSE, and is        |
// | available at through the world-wide-web at                           |
// | http://www.php.net/license/3_0.txt.                                  |
// | If you did not receive a copy of the PHP license and are unable to   |
// | obtain it through the world-wide-web, please send a note to          |
// | license@php.net so we can mail you a copy immediately.               |
// +----------------------------------------------------------------------+
// | Authors: Aidan Lister <aidan@php.net>                                |
// +----------------------------------------------------------------------+
//
// $Id: str_ireplace.php,v 1.18 2005/01/26 04:55:13 aidan Exp $


/**
 * Replace str_ireplace()
 *
 * @category    PHP
 * @package     PHP_Compat
 * @link        http://php.net/function.str_ireplace
 * @author      Aidan Lister <aidan@php.net>
 * @version     $Revision: 1.18 $
 * @since       PHP 5
 * @require     PHP 4.0.0 (user_error)
 * @note        count not by returned by reference, to enable
 *              change '$count = null' to '&$count'
 */
if (!function_exists('str_ireplace')) {
    function str_ireplace($search, $replace, $subject, $count = null)
    {
        // Sanity check
        if (is_string($search) && is_array($replace)) {
            user_error('Array to string conversion', E_USER_NOTICE);
            $replace = (string) $replace;
        }

        // If search isn't an array, make it one
        if (!is_array($search)) {
            $search = array ($search);
        }
        $search = array_values($search);

        // If replace isn't an array, make it one, and pad it to the length of search
        if (!is_array($replace)) {
            $replace_string = $replace;

            $replace = array ();
            for ($i = 0, $c = count($search); $i < $c; $i++) {
                $replace[$i] = $replace_string;
            }
        }
        $replace = array_values($replace);

        // Check the replace array is padded to the correct length
        $length_replace = count($replace);
        $length_search = count($search);
        if ($length_replace < $length_search) {
            for ($i = $length_replace; $i < $length_search; $i++) {
                $replace[$i] = '';
            }
        }

        // If subject is not an array, make it one
        $was_array = false;
        if (!is_array($subject)) {
            $was_array = true;
            $subject = array ($subject);
        }

        // Loop through each subject
        $count = 0;
        foreach ($subject as $subject_key => $subject_value) {
            // Loop through each search
            foreach ($search as $search_key => $search_value) {
                // Split the array into segments, in between each part is our search
                $segments = explode(strtolower($search_value), strtolower($subject_value));

                // The number of replacements done is the number of segments minus the first
                $count += count($segments) - 1;
                $pos = 0;

                // Loop through each segment
                foreach ($segments as $segment_key => $segment_value) {
                    // Replace the lowercase segments with the upper case versions
                    $segments[$segment_key] = substr($subject_value, $pos, strlen($segment_value));
                    // Increase the position relative to the initial string
                    $pos += strlen($segment_value) + strlen($search_value);
                }

                // Put our original string back together
                $subject_value = implode($replace[$search_key], $segments);
            }

            $result[$subject_key] = $subject_value;
        }

        // Check if subject was initially a string and return it as a string
        if ($was_array === true) {
            return $result[0];
        }

        // Otherwise, just return the array
        return $result;
    }
}
    



?>