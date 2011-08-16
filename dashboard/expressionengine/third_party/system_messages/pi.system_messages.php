<?php

if (! defined('CSM_VERSION'))
{
    // get the version from config.php
    require PATH_THIRD.'system_messages/config.php';
    define('CSM_VERSION', $config['version']);
    define('CSM_NAME', $config['name']);
    define('CSM_DESCRIPTION', $config['description']);
}

/**
 * ExpressionEngine 2.x Custom System Messages Plugin
 *
 * @package     ExpressionEngine
 * @subpackage  Extensions
 * @category    Custom System Messages
 * @author      Brian Litzinger
 * @copyright   Copyright 2010 - Boldminded / Brian Litzinger
 * @link        http://boldminded.com/add-ons/csm/
 */

$plugin_info = array(
    'pi_name'       => CSM_NAME,
    'pi_version'    => CSM_VERSION,
    'pi_description'=> CSM_DESCRIPTION,
    'pi_author_url' => 'http://boldminded.com/add-ons/csm/',
    'pi_description'=> 'Adds jQuery to the page for loading CSM messages in jQuery UI Dialog window.',
    'pi_usage'      => System_messages::usage()
);


class System_messages {

    public $return_data;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->EE =& get_instance();
    }
    
    public function form()
    {
        $tagdata = $this->EE->TMPL->tagdata;
        
        $params = array(
            'close_button' => $this->EE->TMPL->fetch_param('close_button', 'Close'),
            'width' => $this->EE->TMPL->fetch_param('width', '600'),
            
            'modal_container' => $this->EE->TMPL->fetch_param('modal_container', 'modal_container'),
            'message_container' => $this->EE->TMPL->fetch_param('message_container', ''),
            
            // Show the message on a successful form submission.
            'message_on_success' => $this->EE->TMPL->fetch_param('message_on_success', 'yes'),
            
            // Show message, then redirect on a successful form submission
            'redirect_on_success' => $this->EE->TMPL->fetch_param('redirect_on_success', 'yes'),
            
            // Custom text displayed after the message used to indicate to the user that a redirect is about to happen
            'redirect_link_text' => $this->EE->TMPL->fetch_param('redirect_link_text', ''),
            
            // Override form's built in redirect method if needed
            'redirect_to' => $this->EE->TMPL->fetch_param('redirect_to', ''),
            
            // Params to change the HTML elements used in the message display
            'message_container_tag' => $this->EE->TMPL->fetch_param('message_container_tag', 'section'),
            'message_header_tag' => $this->EE->TMPL->fetch_param('message_header_tag', 'h3'),
            'message_error_tag' =>$this->EE->TMPL->fetch_param('message_error_tag', 'div')
        );
        
        $tag_params = '';
        
        foreach($params as $param => $value)
        {
            $tag_params .= 'data-'. str_replace('_', '-', $param) .'="'. $value .'"';
        }
        
        // add our parameters so the JS below can use them
        $this->return_data = '<div class="system_messages_form" data-is-ajax="yes"'. $tag_params .'>'. $tagdata .'</div>';
        
        return $this->return_data;
    }
    
    public function js()
    {
        $include_ui_css = $this->EE->TMPL->fetch_param('include_ui_css', false);
        $jq_version = $this->EE->TMPL->fetch_param('jq_version', '1.5.2');
        $ui_version = $this->EE->TMPL->fetch_param('ui_version', '1.8.12');
        $redirect_timeout = $this->EE->TMPL->fetch_param('redirect_timeout', '4000');
        $load_jquery = $this->EE->TMPL->fetch_param('load_jquery', 'yes');
        
        $this->return_data = '';
        
        if($include_ui_css == 'yes')
        {
            $this->return_data .= '<link type="text/css" rel="stylesheet" href="'. $this->EE->config->slash_item('theme_folder_url') .'cp_themes/default/css/jquery-ui-1.7.2.custom.css" />';
        }
        
        $this->return_data .= '
        <!-- BEGIN: Custom System Messages script -->
        <script type="text/javascript">

        var csm_jq_loaded = false;
        var csm_ui_loaded = false;
        
        function init_csm() {

            if( typeof(jQuery) == "undefined" || !jQuery.ui) 
            {
                if(!csm_jq_loaded && typeof(jQuery) == "undefined" && "'. $load_jquery .'" != "no") 
                {
                    csm_jq_loaded = true;

                    var s = document.createElement("script");
                    s.setAttribute("src", "http://ajax.googleapis.com/ajax/libs/jquery/'. $jq_version .'/jquery.min.js");
                    s.setAttribute("type", "text/javascript");
                    document.getElementsByTagName("head")[0].appendChild(s);
                }

                if(!csm_ui_loaded && typeof(jQuery) == "function" && !jQuery.ui && "'. $load_jquery .'" != "no") 
                {
                    csm_ui_loaded = true;

                    var s = document.createElement("script");
                    s.setAttribute("src", "https://ajax.googleapis.com/ajax/libs/jqueryui/'. $ui_version .'/jquery-ui.min.js");
                    s.setAttribute("type", "text/javascript");
                    document.getElementsByTagName("head")[0].appendChild(s);
                }
                
                setTimeout("init_csm()", 50);
            } 
            else 
            {
                jQuery(function(){
                    EEAction.init();
                });
            }
        }
        
        init_csm();
        
        var EEAction = {
            init: function() {
                jQuery("div.system_messages_form").each(function()
                {
                    var form = jQuery(this);
                    var action = form.find("input[name=\'ACT\']").val();
                    
                    if (typeof(csm_form_hook) !== "undefined" && typeof(csm_form_hook) === "function") {
                        form = csm_form_hook(form);
                    }

                    if(action)
                    {
                        var params = {
                            is_ajax: form.data("is-ajax") || form.attr("data-is-ajax") || "no",
                            
                            close_button: form.data("close-button") || form.attr("data-close-button") || "",
                            width: form.data("width") || form.attr("data-width") || "",
                            
                            modal_container: form.data("modal-container") || form.attr("data-modal-container") || "modal_container",
                            message_container: form.data("message-container") || form.attr("data-message-container") || "",
                            message_on_success: form.data("message-on-success") || form.attr("data-message-on-success") || "no",
                            
                            redirect_on_success: form.data("redirect-on-success") || form.attr("data-redirect-on-success") || "yes",
                            redirect_link_text: form.data("redirect-link-text") || form.attr("data-redirect-link-text") || "",
                            redirect_to: form.data("redirect-to") || form.attr("data-redirect-to") || form.find("input[name=\'RET\']").val(),
                            
                            message_container_tag: form.data("message-container-tag") || form.attr("data-message-container-tag") || "section",
                            message_header_tag: form.data("message-header-tag") || form.attr("data-message-header-tag") || "h3",
                            message_error_tag: form.data("message-error-tag") || form.attr("data-message-error-tag") || "div"
                        };
                        
                        if(params.is_ajax == "yes") 
                        {
                            if (typeof(csm_pre_submit_hook) !== "undefined" && typeof(csm_pre_submit_hook) === "function") {
                                params = csm_pre_submit_hook(params);
                            }
                            
                            form.bind("submit", function(event){
                                var data = form.find("form").serialize();
                                var success = false;
                                var return_data = "";
                                
                                if (typeof(csm_post_submit_hook) !== "undefined" && typeof(csm_post_submit_hook) === "function") {
                                    data = csm_post_submit_hook(data);
                                }

                                jQuery.ajax({
                                    type: "POST",
                                    url: "'. $this->EE->config->slash_item('site_url') .'?ACT=" + action,
                                    data: data,
                                    async: false,
                                    error : function(jqXHR, textStatus, errorThrown)
                                    {
                                        var return_data = {
                                            heading: "AJAX Error: " + errorThrown,
                                            content: "Please contact administrator or try again later."
                                        };
                                        
                                        if(jQuery(params.message_container).length > 0)
                                        {
                                            EEMessageHandler.showMessage(form, return_data, params);
                                        }
                                        else
                                        { 
                                            EEMessageHandler.openModal(form, return_data, params);
                                        }
                                        
                                        event.preventDefault();
                                    },
                                    success: function(data, textStatus, jqXHR){
                                        
                                        return_data = data;
                                        
                                        if( return_data.success == true || (return_data.success == false && return_data.content != "") ) {
                                            success = true;
                                            
                                            if(return_data.success == false || params.message_on_success != "no")
                                            {
                                                if (typeof(csm_success_hook) !== "undefined" && typeof(csm_success_hook) === "function") {
                                                    return_data = csm_success_hook(return_data);
                                                }
                                                
                                                if(params.redirect_link_text != "" && return_data.success == true)
                                                {
                                                    return_data.content += params.redirect_link_text;
                                                }
                                                
                                                if(jQuery(params.message_container).length > 0)
                                                {
                                                    EEMessageHandler.showMessage(form, return_data, params);
                                                }
                                                else
                                                { 
                                                    EEMessageHandler.openModal(form, return_data, params);
                                                }
                                            }
                                        }
                                    }
                                });
                                
                                if(success){
                                    event.preventDefault();

                                    if(return_data.success == true && params.redirect_on_success == "yes")
                                    {
                                        var timeout = (return_data.content == "" || params.message_on_success == "no") ? 0 : '. $redirect_timeout .';
                                        
                                        setTimeout({
                                            run: function() {
                                                window.location = params.redirect_to;
                                            }
                                        }.run, timeout);
                                    }
                                }
                            });
                        }
                    }
                });
            }
        };

        var EEMessageHandler = {
            showMessage: function(form, data, params) {
                if(jQuery(params.message_container).length > 0)
                {
                    var modalHtml = \'<\'+ params.message_container_tag +\'> \
                                        <\'+ params.message_header_tag +\'>\'+ data.heading +\'</\'+ params.message_header_tag +\'> \
                                        <\'+ params.message_error_tag +\'>\'+ data.content +\'</\'+ params.message_error_tag +\'> \
                                    </\'+ params.message_container_tag +\'>\';
                    
                    if (typeof(csm_show_message_hook) !== "undefined" && typeof(csm_show_message_hook) === "function") {
                        modalHtml = csm_show_message_hook(modalHtml);
                    }
                                    
                    jQuery(params.message_container).html(modalHtml);
                }
            },
            openModal: function(form, data, params) {
                var modalHtml = \'<\'+ params.message_container_tag +\'> \
                                    <\'+ params.message_header_tag +\'>\'+ data.heading +\'</\'+ params.message_header_tag +\'> \
                                    <\'+ params.message_error_tag +\'>\'+ data.content +\'</\'+ params.message_error_tag +\'> \
                                    <a href="#" class="csm-close">\'+ params.close_button +\'</a> \
                                </\'+ params.message_container_tag +\'>\';
                
                if (typeof(csm_show_modal_hook) !== "undefined" && typeof(csm_show_modal_hook) === "function") {
                    modalHtml = csm_show_modal_hook(modalHtml);
                }

                if (!jQuery("div."+ params.modal_container).length) 
                {
                    jQuery("body").append(\'<div class="\'+ params.modal_container +\'"></div>\');                    
                }      

                jQuery("div."+ params.modal_container).dialog({
                    autoOpen: true,
                    width: params.width,
                    position: "middle",
                    modal: true,
                    resizable: false,
                    closeOnEscape: true,
                    draggable: true,
                    open: function() {
                        jQuery(this).html(modalHtml);
                    }
                });

                jQuery("a.csm-close").live("click", function(){
                    jQuery("div."+ params.modal_container).remove();
                    $(form).find("form")[0].reset();
                    event.preventDefault();
                });
            },
        }
        </script>
        <!-- END: Custom System Messages script -->';
        
        // return $this->return_data;
        return preg_replace("/\s+/", " ", $this->return_data);
    }

    /**
     * Plugin Usage
     */
    public static function usage()
    {
        ob_start();
?>

See http://boldminded.com/docs/csm

<?php
    $buffer = ob_get_contents();
    ob_end_clean();
    return $buffer;
    }
}