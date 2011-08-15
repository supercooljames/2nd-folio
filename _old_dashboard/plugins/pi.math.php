<?php

/*
=====================================================
 File: pi.math.php
-----------------------------------------------------
 Purpose: Mathematical operations plugin
=====================================================
 Feel free to modify and use this file (including usage in commercial applications), as long as author inforamtion is kept intact
*/


$plugin_info = array(
						'pi_name'			=> 'Mathematical operations',
						'pi_version'		=> '0.1',
						'pi_author'			=> 'Yuriy Salimovskiy',
						'pi_author_url'		=> 'http://runner.od.ua/',
						'pi_description'	=> 'Enable use of basic mathematical (arithmetic) operations (e.g. + - * / )',
						'pi_usage'			=> Math::usage()
					);


class Math {

    
    /** ----------------------------------------
    /**  	Add subtract multiply divide
    /** ----------------------------------------*/

    function add($num1 = '0', $num2 = '0')
    {
        global $TMPL;
                        
		$num1 = ($TMPL->fetch_param('num1')) ? $TMPL->fetch_param('num1') :  $num1;
		$num2 = ($TMPL->fetch_param('num2')) ? $TMPL->fetch_param('num2') :  $num2;
          
 		return $num1+$num2;
    }
    
    /** ----------------------------------------
    /**  	Subtract
    /** ----------------------------------------*/

    function subtract($num1 = '0', $num2 = '0')
    {
        global $TMPL;
                        
		$num1 = ($TMPL->fetch_param('num1')) ? $TMPL->fetch_param('num1') :  $num1;
		$num2 = ($TMPL->fetch_param('num2')) ? $TMPL->fetch_param('num2') :  $num2;
          
 		return $num1-$num2;
    }
    
    /** ----------------------------------------
    /**  	Multiply
    /** ----------------------------------------*/

    function multiply($num1 = '0', $num2 = '0')
    {
        global $TMPL;
                        
		$num1 = ($TMPL->fetch_param('num1')) ? $TMPL->fetch_param('num1') :  $num1;
		$num2 = ($TMPL->fetch_param('num2')) ? $TMPL->fetch_param('num2') :  $num2;
          
 		return $num1*$num2;
    }
    
    /** ----------------------------------------
    /**  	Divide
    /** ----------------------------------------*/

    function divide($num1 = '0', $num2 = '0')
    {
        global $TMPL;
                        
		$num1 = ($TMPL->fetch_param('num1')) ? $TMPL->fetch_param('num1') :  $num1;
		$num2 = ($TMPL->fetch_param('num2')) ? $TMPL->fetch_param('num2') :  $num2;
          
 		return $num1/$num2;
    }
    
    
// ----------------------------------------
//  Plugin Usage
// ----------------------------------------

// This function describes how the plugin is used.
//  Make sure and use output buffering

function usage()
{
ob_start(); 
?>
The plugin takes 2 parameter, num1 and num2, which are the numbers you want to do something with

Call

{exp:math:add num1="10" num2="2"} to add 2 and 10
{exp:math:subtract num1="10" num2="2"} to subtract 2 from 10
{exp:math:multiply num1="10" num2="2"} to multiply 10 and 2
{exp:math:divide num1="10" num2="2"} to divide 10 by 2


<?php
$buffer = ob_get_contents();
	
ob_end_clean(); 

return $buffer;
}
/* END */


}
// END CLASS
?>