<?php

/*
=====================================================
 Member categories
-----------------------------------------------------
 http://www.intoeetive.com/
-----------------------------------------------------
 Copyright (c) 2011 Yuri Salimovskiy
=====================================================
 This software is based upon and derived from
 ExpressionEngine software protected under
 copyright dated 2004 - 2011. Please see
 http://expressionengine.com/docs/license.html
=====================================================
 File: upd.member_categories.php
-----------------------------------------------------
 Purpose: Assign categories to site members
=====================================================
*/

if ( ! defined('EXT'))
{
    exit('Invalid file request');
}



class Member_categories_upd {

    var $version = '1.1.0';
    
    function __construct() { 
        // Make a local reference to the ExpressionEngine super object 
        $this->EE =& get_instance(); 
        $this->EE->lang->loadfile('member_categories');  
    } 
    
    function install() { 
        
        $this->EE->load->dbforge(); 
        
        //----------------------------------------
		// EXP_MODULES
		// The settings column, Ellislab should have put this one in long ago.
		// No need for a seperate preferences table for each module.
		//----------------------------------------
		if ($this->EE->db->field_exists('settings', 'modules') == FALSE)
		{
			$this->EE->dbforge->add_column('modules', array('settings' => array('type' => 'TEXT') ) );
		}
        
        $sql[] = "CREATE TABLE IF NOT EXISTS `exp_category_members` (
              `member_id` int(10) unsigned NOT NULL,
              `cat_id` int(10) unsigned NOT NULL,
              PRIMARY KEY  (`member_id`,`cat_id`)
            )";
            
                
        foreach ($sql as $qstr)
        {
            $this->EE->db->query($qstr);
        }
        
        $settings = array();
        $this->EE->db->select('site_id');
        $q = $this->EE->db->get('sites');
        foreach ($q->result() as $obj)
        {
            $settings[$obj->site_id]['category_groups']=array();
            $settings[$obj->site_id]['assign_parent'] = 'y';
        }
        
        $data = array( 'module_name' => 'Member_categories' , 'module_version' => $this->version, 'has_cp_backend' => 'y', 'has_publish_fields' => 'n', 'settings'=> serialize($settings) ); 
        $this->EE->db->insert('modules', $data); 
    
        return TRUE; 
        
    } 
    
    function uninstall() { 
        
        $this->EE->load->dbforge(); 
        
        $this->EE->db->select('module_id'); 
        $query = $this->EE->db->get_where('modules', array('module_name' => 'Member_categories')); 
        
        $this->EE->db->where('module_id', $query->row('module_id')); 
        $this->EE->db->delete('module_member_groups'); 
        
        $this->EE->db->where('module_name', 'Member_categories'); 
        $this->EE->db->delete('modules'); 
        
        $this->EE->db->where('class', 'Member_categories'); 
        $this->EE->db->delete('actions'); 
        
        $this->EE->db->query("DROP TABLE exp_category_members");
        
        return TRUE; 
    } 
    
    function update($current='') { 

        if ($current < 3.0) { 
            // Do your 3.0 v. update queries 
        } 
        return TRUE; 
    } 
	

}
/* END */
?>