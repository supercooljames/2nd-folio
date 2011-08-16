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
 File: mod.member_categories.php
-----------------------------------------------------
 Purpose: Assign categories to site members
=====================================================
*/


if ( ! defined('EXT'))
{
    exit('Invalid file request');
}


class Member_categories {

    var $return_data	= ''; 						// Bah!
    
    var $settings 		= array();    
    

    /** ----------------------------------------
    /**  Constructor
    /** ----------------------------------------*/

    function __construct()
    {        
    	$this->EE =& get_instance(); 

        $this->EE->lang->loadfile('member_categories');  
        
        $query = $this->EE->db->query("SELECT settings FROM exp_modules WHERE module_name='Member_categories' LIMIT 1");
        $this->settings = unserialize($query->row('settings'));      
    }
    /* END */
    
    function members($category_id='')
    {
        if ($category_id=='')
        {
            if ($this->EE->TMPL->fetch_param('category_id')!='')
            {
                $category_id = $this->EE->TMPL->fetch_param('category_id');
            }
            else if ($this->EE->TMPL->fetch_param('category_url_title')!='')
            {
                $this->EE->db->select('cat_id');
                $this->EE->db->where('cat_url_title', $this->EE->TMPL->fetch_param('category_url_title'));
                $q = $this->EE->db->get('categories');
                if ($q->num_rows()==0)
                {
                    if ($this->EE->TMPL->fetch_param('errors')=='off' || $this->EE->TMPL->fetch_param('errors')=='no')
                    {
                        return;
                    }
                    return $this->EE->output->show_user_error('general', array($this->EE->lang->line('category_does_not_exist')));
                }
                $category_id = $q->row('cat_id');
            }
            else
            {
                if ($this->EE->TMPL->fetch_param('errors')=='off' || $this->EE->TMPL->fetch_param('errors')=='no')
                {
                    return;
                }
                return $this->EE->output->show_user_error('general', array($this->EE->lang->line('no_category_provided')));
            }
        }
        
        if ($this->EE->TMPL->fetch_param('custom_field')=='yes')
        {
            $custom_fields = array();
            $this->EE->db->select('m_field_id, m_field_name');
            $q = $this->EE->db->get('member_fields');
            foreach ($q->result() as $obj)
            {
                $custom_fields[$obj->m_field_id] = $obj->m_field_name;
            }
        }
        
        $what = 'exp_members.*';
        if ($this->EE->TMPL->fetch_param('custom_fields')=='yes') 
        {
            $what .= 'exp_member_data.*';
        }
        $this->EE->db->select($what);
        $this->EE->db->from('exp_category_members');
        $this->EE->db->join('exp_members', 'exp_category_members.member_id=exp_members.member_id', 'left');
        if ($this->EE->TMPL->fetch_param('custom_fields')=='yes') 
        {
            $this->EE->db->join('exp_member_data', 'exp_members.member_id=exp_member_data.member_id', 'left');
        }
        $this->EE->db->where('cat_id', $category_id);
        $q = $this->EE->db->get();
        if ($q->num_rows()==0)
        {
            return $this->EE->TMPL->no_results();
        }
        
        $tagdata_orig = $this->EE->TMPL->swap_var_single('total_results', $q->num_rows(), $this->EE->TMPL->tagdata);
        $out = '';
        $i = 0;
        
        foreach ($q->result_array() as $row)
        {
            $i++;
            $tagdata = $tagdata_orig;
            $tagdata = $this->EE->TMPL->swap_var_single('count', $i, $tagdata);
            $tagdata = $this->EE->TMPL->swap_var_single('member_id', $row['member_id'], $tagdata);
            $tagdata = $this->EE->TMPL->swap_var_single('group_id', $row['group_id'], $tagdata);
            $tagdata = $this->EE->TMPL->swap_var_single('username', $row['username'], $tagdata);
            $tagdata = $this->EE->TMPL->swap_var_single('screen_name', $row['screen_name'], $tagdata);
            $tagdata = $this->EE->TMPL->swap_var_single('email', $row['email'], $tagdata);
            $tagdata = $this->EE->TMPL->swap_var_single('url', $row['url'], $tagdata);
            $tagdata = $this->EE->TMPL->swap_var_single('location', $row['location'], $tagdata);
            $tagdata = $this->EE->TMPL->swap_var_single('occupation', $row['occupation'], $tagdata);
            $tagdata = $this->EE->TMPL->swap_var_single('interests', $row['interests'], $tagdata);
            $tagdata = $this->EE->TMPL->swap_var_single('aol_im', $row['aol_im'], $tagdata);
            $tagdata = $this->EE->TMPL->swap_var_single('yahoo_im', $row['yahoo_im'], $tagdata);
            $tagdata = $this->EE->TMPL->swap_var_single('msn_im', $row['msn_im'], $tagdata);
            $tagdata = $this->EE->TMPL->swap_var_single('icq', $row['icq'], $tagdata);
            $tagdata = $this->EE->TMPL->swap_var_single('bio', $row['bio'], $tagdata);
            $tagdata = $this->EE->TMPL->swap_var_single('signature', $row['signature'], $tagdata);
            
            if ($this->EE->session->userdata('display_avatars') == 'n' || $row['avatar_filename'] == '')
			{			
				$tagdata = $this->EE->TMPL->swap_var_single('avatar_url', '', $tagdata);
				$tagdata = $this->EE->TMPL->swap_var_single('avatar_image_width', '', $tagdata);
				$tagdata = $this->EE->TMPL->swap_var_single('avatar_image_height', '', $tagdata);
			}
			else
			{
				$tagdata = $this->EE->TMPL->swap_var_single('avatar_url', $this->EE->config->item('avatar_url').$row['avatar_filename'], $tagdata);
				$tagdata = $this->EE->TMPL->swap_var_single('avatar_image_width', $q->row('avatar_width'), $tagdata);
				$tagdata = $this->EE->TMPL->swap_var_single('avatar_image_height', $q->row('avatar_height'), $tagdata);						
			}
            if ($this->EE->session->userdata('display_photos') == 'n' || $row['photo_filename'] == '')
			{			
				$tagdata = $this->EE->TMPL->swap_var_single('photo_url', '', $tagdata);
				$tagdata = $this->EE->TMPL->swap_var_single('photo_image_width', '', $tagdata);
				$tagdata = $this->EE->TMPL->swap_var_single('photo_image_height', '', $tagdata);
			}
			else
			{
				$tagdata = $this->EE->TMPL->swap_var_single('photo_url', $this->EE->config->item('photo_url').$row['photo_filename'], $tagdata);
				$tagdata = $this->EE->TMPL->swap_var_single('photo_image_width', $q->row('photo_width'), $tagdata);
				$tagdata = $this->EE->TMPL->swap_var_single('photo_image_height', $q->row('photo_height'), $tagdata);						
			}
            if ($this->EE->session->userdata('display_signatures') == 'n' || $row['sig_img_filename'] == '')
			{			
				$tagdata = $this->EE->TMPL->swap_var_single('signature_image_url', '', $tagdata);
				$tagdata = $this->EE->TMPL->swap_var_single('signature_image_width', '', $tagdata);
				$tagdata = $this->EE->TMPL->swap_var_single('signature_image_height', '', $tagdata);
			}
			else
			{
				$tagdata = $this->EE->TMPL->swap_var_single('signature_image_url', $this->EE->config->item('sig_img_url').$row['sig_img_filename'], $tagdata);
				$tagdata = $this->EE->TMPL->swap_var_single('signature_image_width', $q->row('sig_img_width'), $tagdata);
				$tagdata = $this->EE->TMPL->swap_var_single('signature_image_height', $q->row('sig_img_height'), $tagdata);						
			}
            
            $birthday = '';
			if ($row['bday_m'] != '' AND $row['bday_m'] != 0)
			{
				$month = (strlen($row['bday_m']) == 1) ? '0'.$row['bday_m'] : $row['bday_m'];

				$m = $this->EE->localize->localize_month($month);

				$birthday .= $this->EE->lang->line($m['1']);

				if ($row['bday_d'] != '' AND $row['bday_d'] != 0)
				{
					$birthday .= ' '.$row['bday_d'];
				}
			}
			if ($row['bday_y'] != '' AND $row['bday_y'] != 0)
			{
				if ($birthday != '')
				{
					$birthday .= ', ';
				}

				$birthday .=$row['bday_y'];
			}
			$this->EE->TMPL->tagdata = $this->EE->TMPL->swap_var_single('birthday', $birthday, $tagdata);
            
            $tagdata = $this->EE->TMPL->swap_var_single('ip_address', $row['ip_address'], $tagdata);
            
            if (preg_match_all("#".LD."join_date format=[\"|'](.+?)[\"|']".RD."#", $tagdata, $matches))
    		{
    			foreach ($matches['1'] as $match)
    			{
    				$this->EE->TMPL->tagdata = preg_replace("#".LD."join_date format=.+?".RD."#", $this->EE->localize->decode_date($match, $row['join_date']), $tagdata, true);
    			}
    		}
            if (preg_match_all("#".LD."last_visit format=[\"|'](.+?)[\"|']".RD."#", $tagdata, $matches))
    		{
    			foreach ($matches['1'] as $match)
    			{
    				$this->EE->TMPL->tagdata = preg_replace("#".LD."last_visit format=.+?".RD."#", $this->EE->localize->decode_date($match, $row['last_visit']), $tagdata, true);
    			}
    		}
            if (preg_match_all("#".LD."last_activity format=[\"|'](.+?)[\"|']".RD."#", $tagdata, $matches))
    		{
    			foreach ($matches['1'] as $match)
    			{
    				$this->EE->TMPL->tagdata = preg_replace("#".LD."last_activity format=.+?".RD."#", $this->EE->localize->decode_date($match, $row['last_activity']), $tagdata, true);
    			}
    		}
            
            
            if ($this->EE->TMPL->fetch_param('custom_fields')=='yes')
            {
                foreach ($custom_fields as $field_id=>$field_name)
                {
                    $tagdata = $this->EE->TMPL->swap_var_single($field_name, $row['m_field_id_'.$field_id], $tagdata);
                }
            } 
            
            $out .= $tagdata;
             
        }
        
        $out = trim($out);
        
        if ($this->EE->TMPL->fetch_param('backspace')!='')
        {
            $backspace = intval($this->EE->TMPL->fetch_param('backspace'));
            $out = substr($out, 0, - $backspace);
        }
        
        return $out;
    }
    
    function categories($member_id='')
    {
        if ($member_id=='')
        {
            if ($this->EE->TMPL->fetch_param('member_id')!='')
            {
                $member_id = $this->EE->TMPL->fetch_param('member_id');
            }
            else if ($this->EE->TMPL->fetch_param('username')!='')
            {
                $this->EE->db->select('member_id');
                $this->EE->db->where('username', $this->EE->TMPL->fetch_param('username'));
                $q = $this->EE->db->get('members');
                if ($q->num_rows()==0)
                {
                    if ($this->EE->TMPL->fetch_param('errors')=='off' || $this->EE->TMPL->fetch_param('errors')=='no')
                    {
                        return;
                    }
                    return $this->EE->output->show_user_error('general', array($this->EE->lang->line('member_does_not_exist')));
                }
                $member_id = $q->row('member_id');
            }
            else if ($this->EE->session->userdata('member_id')!=0)
            {
                $member_id = $this->EE->session->userdata('member_id');
            }
            else
            {
                if ($this->EE->TMPL->fetch_param('errors')=='off' || $this->EE->TMPL->fetch_param('errors')=='no')
                {
                    return;
                }
                return $this->EE->output->show_user_error('general', array($this->EE->lang->line('no_member_provided')));
            }
        }
        
        if ($this->EE->TMPL->fetch_param('custom_field')=='yes')
        {
            $custom_fields = array();
            $this->EE->db->select('field_id, field_name');
            $q = $this->EE->db->get('category_fields');
            foreach ($q->result() as $obj)
            {
                $custom_fields[$obj->field_id] = $obj->field_name;
            }
        }
        
        $what = 'exp_categories.*';
        if ($this->EE->TMPL->fetch_param('custom_fields')=='yes') 
        {
            $what .= 'exp_category_field_data.*';
        }
        $this->EE->db->select($what);
        $this->EE->db->from('exp_category_members');
        $this->EE->db->join('exp_categories', 'exp_category_members.cat_id=exp_categories.cat_id', 'left');
        if ($this->EE->TMPL->fetch_param('custom_fields')=='yes') 
        {
            $this->EE->db->join('exp_category_field_data', 'exp_categories.cat_id=exp_category_field_data.cat_id', 'left');
        }
        $this->EE->db->where('member_id', $member_id);
        $q = $this->EE->db->get();
        if ($q->num_rows()==0)
        {
            return $this->EE->TMPL->no_results();
        }
        
        $tagdata_orig = $this->EE->TMPL->swap_var_single('total_results', $q->num_rows(), $this->EE->TMPL->tagdata);
        $out = '';
        $i = 0;
        
        foreach ($q->result_array() as $row)
        {
            $i++;
            $tagdata = $tagdata_orig;
            $tagdata = $this->EE->TMPL->swap_var_single('count', $i, $tagdata);
            $tagdata = $this->EE->TMPL->swap_var_single('category_id', $row['cat_id'], $tagdata);
            $tagdata = $this->EE->TMPL->swap_var_single('category_name', $row['cat_name'], $tagdata);
            $tagdata = $this->EE->TMPL->swap_var_single('category_url_title', $row['cat_url_title'], $tagdata);
            $tagdata = $this->EE->TMPL->swap_var_single('category_image', $row['cat_image'], $tagdata);
            $tagdata = $this->EE->TMPL->swap_var_single('category_description', $row['cat_description'], $tagdata);
            $tagdata = $this->EE->TMPL->swap_var_single('parent_id', $row['parent_id'], $tagdata);            
            
            if ($this->EE->TMPL->fetch_param('custom_fields')=='yes')
            {
                foreach ($custom_fields as $field_id=>$field_name)
                {
                    $tagdata = $this->EE->TMPL->swap_var_single($field_name, $row['m_field_id_'.$field_id], $tagdata);
                }
            } 
            
            $out .= $tagdata;
        }
        
        $out = trim($out);
        
        if ($this->EE->TMPL->fetch_param('backspace')!='')
        {
            $backspace = intval($this->EE->TMPL->fetch_param('backspace'));
            $out = substr($out, 0, - $backspace);
        }
        return $out;
    }
    
    function check($member_id='', $category_id='')
    {

        if ($member_id=='')
        {
            if ($this->EE->TMPL->fetch_param('member_id')!='')
            {
                $member_id = $this->EE->TMPL->fetch_param('member_id');
            }
            else if ($this->EE->TMPL->fetch_param('username')!='')
            {
                $this->EE->db->select('member_id');
                $this->EE->db->where('username', $this->EE->TMPL->fetch_param('username'));
                $q = $this->EE->db->get('members');
                if ($q->num_rows()==0)
                {
                    if ($this->EE->TMPL->fetch_param('errors')=='off' || $this->EE->TMPL->fetch_param('errors')=='no')
                    {
                        return;
                    }
                    return $this->EE->output->show_user_error('general', array($this->EE->lang->line('member_does_not_exist')));
                }
                $member_id = $q->row('member_id');
            }
            else if ($this->EE->session->userdata('member_id')!=0)
            {
                $member_id = $this->EE->session->userdata('member_id');
            }
            else
            {
                if ($this->EE->TMPL->fetch_param('errors')=='off' || $this->EE->TMPL->fetch_param('errors')=='no')
                {
                    return;
                }
                return $this->EE->output->show_user_error('general', array($this->EE->lang->line('no_member_provided')));
            }
        }
        
        if ($category_id=='')
        {
            if ($this->EE->TMPL->fetch_param('category_id')!='')
            {
                $category_id = $this->EE->TMPL->fetch_param('category_id');
            }
            else if ($this->EE->TMPL->fetch_param('category_url_title')!='')
            {
                $this->EE->db->select('cat_id');
                $this->EE->db->where('cat_url_title', $this->EE->TMPL->fetch_param('category_url_title'));
                $q = $this->EE->db->get('categories');
                if ($q->num_rows()==0)
                {
                    if ($this->EE->TMPL->fetch_param('errors')=='off' || $this->EE->TMPL->fetch_param('errors')=='no')
                    {
                        return;
                    }
                    return $this->EE->output->show_user_error('general', array($this->EE->lang->line('category_does_not_exist')));
                }
                $category_id = $q->row('cat_id');
            }
            else
            {
                if ($this->EE->TMPL->fetch_param('errors')=='off' || $this->EE->TMPL->fetch_param('errors')=='no')
                {
                    return;
                }
                return $this->EE->output->show_user_error('general', array($this->EE->lang->line('no_category_provided')));
            }
        }
        
        $this->EE->db->select('*');
        $this->EE->db->from('exp_category_members');
        if (strpos($category_id, '|')===FALSE)
        {
            $this->EE->db->where('cat_id', $category_id);
        }
        else
        {
            $category_id_a = explode("|", $category_id);
            $this->EE->db->where_in('cat_id', $category_id_a);
        }
        $this->EE->db->where('member_id', $member_id);
        $q = $this->EE->db->get();
        if ($q->num_rows()==0)
        {
            return $this->EE->TMPL->no_results();
        }
        return $this->EE->TMPL->tagdata;
    }

}
/* END */

?>