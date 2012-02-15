-- phpMyAdmin SQL Dump
-- version 3.4.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 15, 2012 at 09:11 AM
-- Server version: 5.1.44
-- PHP Version: 5.3.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `second-folio`
--

-- --------------------------------------------------------

--
-- Table structure for table `exp_accessories`
--

CREATE TABLE `exp_accessories` (
  `accessory_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(75) NOT NULL DEFAULT '',
  `member_groups` varchar(255) NOT NULL,
  `controllers` text,
  `accessory_version` varchar(12) NOT NULL,
  PRIMARY KEY (`accessory_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_accessories`
--

INSERT INTO `exp_accessories` (`accessory_id`, `class`, `member_groups`, `controllers`, `accessory_version`) VALUES
(1, 'Expressionengine_info_acc', '1|5', 'addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_files_modal|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities', '1.0');

-- --------------------------------------------------------

--
-- Table structure for table `exp_actions`
--

CREATE TABLE `exp_actions` (
  `action_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `exp_actions`
--

INSERT INTO `exp_actions` (`action_id`, `class`, `method`) VALUES
(1, 'Comment', 'insert_new_comment'),
(2, 'Comment_mcp', 'delete_comment_notification'),
(3, 'Mailinglist', 'insert_new_email'),
(4, 'Mailinglist', 'authorize_email'),
(5, 'Mailinglist', 'unsubscribe'),
(6, 'Member', 'registration_form'),
(7, 'Member', 'register_member'),
(8, 'Member', 'activate_member'),
(9, 'Member', 'member_login'),
(10, 'Member', 'member_logout'),
(11, 'Member', 'retrieve_password'),
(12, 'Member', 'reset_password'),
(13, 'Member', 'send_member_email'),
(14, 'Member', 'update_un_pw'),
(15, 'Member', 'member_search'),
(16, 'Member', 'member_delete'),
(24, 'Channel', 'smiley_pop'),
(18, 'Channel', 'insert_new_entry'),
(19, 'Search', 'do_search'),
(20, 'Freeform', 'insert_new_entry'),
(21, 'Freeform', 'retrieve_entries'),
(22, 'Freeform', 'delete_freeform_notification'),
(25, 'Channel', 'filemanager_endpoint'),
(26, 'Comment', 'comment_subscribe'),
(27, 'Comment', 'edit_comment'),
(28, 'Safecracker', 'submit_entry'),
(29, 'Safecracker', 'combo_loader');

-- --------------------------------------------------------

--
-- Table structure for table `exp_captcha`
--

CREATE TABLE `exp_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=211 ;

--
-- Dumping data for table `exp_captcha`
--

INSERT INTO `exp_captcha` (`captcha_id`, `date`, `ip_address`, `word`) VALUES
(210, 1329039520, '159.224.130.96', 'asked66'),
(208, 1329006436, '159.224.130.96', 'elements86'),
(209, 1329039520, '159.224.130.96', 'beyond46'),
(207, 1329006436, '159.224.130.96', 'probably31'),
(206, 1329003846, '66.249.72.107', 'left78'),
(202, 1328910228, '193.105.210.123', 'written83'),
(199, 1328904192, '159.224.130.46', 'result41'),
(203, 1328919266, '159.224.130.96', 'south21'),
(204, 1328972342, '159.224.130.96', 'forms76'),
(205, 1328984680, '159.224.130.46', 'father74'),
(201, 1328910227, '193.105.210.123', 'written85'),
(200, 1328910226, '193.105.210.123', 'means53');

-- --------------------------------------------------------

--
-- Table structure for table `exp_categories`
--

CREATE TABLE `exp_categories` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `parent_id` int(4) unsigned NOT NULL,
  `cat_name` varchar(100) NOT NULL,
  `cat_url_title` varchar(75) NOT NULL,
  `cat_description` text,
  `cat_image` varchar(120) DEFAULT NULL,
  `cat_order` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `group_id` (`group_id`),
  KEY `cat_name` (`cat_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `exp_categories`
--

INSERT INTO `exp_categories` (`cat_id`, `site_id`, `group_id`, `parent_id`, `cat_name`, `cat_url_title`, `cat_description`, `cat_image`, `cat_order`) VALUES
(4, 1, 2, 0, 'Bout One', 'bout-one', 'From February to July 2012 test your mettle across the atlantic!\n', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_fields`
--

CREATE TABLE `exp_category_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `field_label` varchar(50) NOT NULL DEFAULT '',
  `field_type` varchar(12) NOT NULL DEFAULT 'text',
  `field_list_items` mediumtext NOT NULL,
  `field_maxl` smallint(3) NOT NULL DEFAULT '128',
  `field_ta_rows` tinyint(2) NOT NULL DEFAULT '8',
  `field_default_fmt` varchar(40) NOT NULL DEFAULT 'none',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`field_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_field_data`
--

CREATE TABLE `exp_category_field_data` (
  `cat_id` int(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_category_field_data`
--

INSERT INTO `exp_category_field_data` (`cat_id`, `site_id`, `group_id`) VALUES
(4, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_groups`
--

CREATE TABLE `exp_category_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `sort_order` char(1) NOT NULL DEFAULT 'a',
  `field_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `can_edit_categories` text,
  `can_delete_categories` text,
  `is_user_blog` char(1) NOT NULL DEFAULT 'n',
  `exclude_group` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exp_category_groups`
--

INSERT INTO `exp_category_groups` (`group_id`, `site_id`, `group_name`, `sort_order`, `field_html_formatting`, `can_edit_categories`, `can_delete_categories`, `is_user_blog`, `exclude_group`) VALUES
(2, 1, 'members', 'a', 'all', '', '', 'n', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_members`
--

CREATE TABLE `exp_category_members` (
  `member_id` int(10) unsigned NOT NULL,
  `cat_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`member_id`,`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exp_category_members`
--

INSERT INTO `exp_category_members` (`member_id`, `cat_id`) VALUES
(1, 5),
(2, 4),
(3, 4),
(4, 4),
(6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_posts`
--

CREATE TABLE `exp_category_posts` (
  `entry_id` int(10) unsigned NOT NULL,
  `cat_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry_id`,`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_category_posts`
--

INSERT INTO `exp_category_posts` (`entry_id`, `cat_id`) VALUES
(56, 4),
(58, 4),
(60, 4);

-- --------------------------------------------------------

--
-- Table structure for table `exp_channels`
--

CREATE TABLE `exp_channels` (
  `channel_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_name` varchar(40) NOT NULL,
  `channel_title` varchar(100) NOT NULL,
  `channel_url` varchar(100) NOT NULL,
  `channel_description` varchar(225) DEFAULT NULL,
  `channel_lang` varchar(12) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `cat_group` varchar(225) DEFAULT NULL,
  `status_group` int(4) unsigned DEFAULT NULL,
  `deft_status` varchar(50) NOT NULL DEFAULT 'open',
  `field_group` int(4) unsigned DEFAULT NULL,
  `search_excerpt` int(4) unsigned DEFAULT NULL,
  `deft_category` varchar(60) DEFAULT NULL,
  `deft_comments` char(1) NOT NULL DEFAULT 'y',
  `channel_require_membership` char(1) NOT NULL DEFAULT 'y',
  `channel_max_chars` int(5) unsigned DEFAULT NULL,
  `channel_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `channel_allow_img_urls` char(1) NOT NULL DEFAULT 'y',
  `channel_auto_link_urls` char(1) NOT NULL DEFAULT 'y',
  `channel_notify` char(1) NOT NULL DEFAULT 'n',
  `channel_notify_emails` varchar(255) DEFAULT NULL,
  `comment_url` varchar(80) DEFAULT NULL,
  `comment_system_enabled` char(1) NOT NULL DEFAULT 'y',
  `comment_require_membership` char(1) NOT NULL DEFAULT 'n',
  `comment_use_captcha` char(1) NOT NULL DEFAULT 'n',
  `comment_moderate` char(1) NOT NULL DEFAULT 'n',
  `comment_max_chars` int(5) unsigned DEFAULT '5000',
  `comment_timelock` int(5) unsigned NOT NULL DEFAULT '0',
  `comment_require_email` char(1) NOT NULL DEFAULT 'y',
  `comment_text_formatting` char(5) NOT NULL DEFAULT 'xhtml',
  `comment_html_formatting` char(4) NOT NULL DEFAULT 'safe',
  `comment_allow_img_urls` char(1) NOT NULL DEFAULT 'n',
  `comment_auto_link_urls` char(1) NOT NULL DEFAULT 'y',
  `comment_notify` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_authors` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_emails` varchar(255) DEFAULT NULL,
  `comment_expiration` int(4) unsigned NOT NULL DEFAULT '0',
  `search_results_url` varchar(80) DEFAULT NULL,
  `ping_return_url` varchar(80) DEFAULT NULL,
  `show_button_cluster` char(1) NOT NULL DEFAULT 'y',
  `rss_url` varchar(80) DEFAULT NULL,
  `enable_versioning` char(1) NOT NULL DEFAULT 'n',
  `max_revisions` smallint(4) unsigned NOT NULL DEFAULT '10',
  `default_entry_title` varchar(100) NOT NULL,
  `url_title_prefix` varchar(80) NOT NULL,
  `live_look_template` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`channel_id`),
  KEY `cat_group` (`cat_group`),
  KEY `status_group` (`status_group`),
  KEY `field_group` (`field_group`),
  KEY `site_id` (`site_id`),
  KEY `channel_name` (`channel_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `exp_channels`
--

INSERT INTO `exp_channels` (`channel_id`, `site_id`, `channel_name`, `channel_title`, `channel_url`, `channel_description`, `channel_lang`, `total_entries`, `total_comments`, `last_entry_date`, `last_comment_date`, `cat_group`, `status_group`, `deft_status`, `field_group`, `search_excerpt`, `deft_category`, `deft_comments`, `channel_require_membership`, `channel_max_chars`, `channel_html_formatting`, `channel_allow_img_urls`, `channel_auto_link_urls`, `channel_notify`, `channel_notify_emails`, `comment_url`, `comment_system_enabled`, `comment_require_membership`, `comment_use_captcha`, `comment_moderate`, `comment_max_chars`, `comment_timelock`, `comment_require_email`, `comment_text_formatting`, `comment_html_formatting`, `comment_allow_img_urls`, `comment_auto_link_urls`, `comment_notify`, `comment_notify_authors`, `comment_notify_emails`, `comment_expiration`, `search_results_url`, `ping_return_url`, `show_button_cluster`, `rss_url`, `enable_versioning`, `max_revisions`, `default_entry_title`, `url_title_prefix`, `live_look_template`) VALUES
(2, 1, 'quotes', 'Quotes', '/quotes', '', 'en', 31, 0, 1282839879, 0, '2', 1, 'open', 2, 10, '', 'n', 'y', 0, 'all', 'y', 'n', 'n', '', '/quotes', 'n', 'n', 'n', 'n', 0, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', '', 0, '/quotes', '', 'n', '', 'n', 10, '', '', 0),
(3, 1, 'tasks', 'Tasks', '/tasks', '', 'en', 18, 0, 1282842807, 0, '2', 1, 'open', 3, 14, '', 'n', 'y', 0, 'all', 'y', 'n', 'n', '', '/tasks', 'n', 'n', 'n', 'n', 0, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', '', 0, '/tasks', '', 'n', '', 'n', 10, '', '', 0),
(4, 1, 'characters', 'Characters', 'http://2ndfolio.local/index.php', '', 'en', 12, 0, 1283861971, 0, '', 1, 'open', 4, 0, '', 'n', 'y', 0, 'all', 'y', 'n', 'n', '', '', 'n', 'n', 'n', 'n', 0, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', '', 0, '', '', 'n', '', 'n', 10, '', '', 0),
(5, 1, 'rules', 'Rules', 'http://2ndfolio.local/index.php', '', 'en', 1, 0, 1282673571, 0, '', 1, 'open', 5, 0, '', 'n', 'y', 0, 'all', 'y', 'n', 'n', '', '', 'n', 'n', 'n', 'n', 0, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', '', 0, '', '', 'n', '', 'n', 10, '', '', 0),
(6, 1, 'other', 'Other Pages', 'http://2ndfolio.local/index.php', '', 'en', 5, 0, 1283266498, 0, NULL, 1, 'open', 5, 0, '', 'n', 'y', 0, 'all', 'y', 'n', 'n', '', '', 'n', 'n', 'n', 'n', 0, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', '', 0, '', '', 'n', '', 'n', 10, '', '', 0),
(7, 1, 'league', 'League', 'http://2ndfolio.local/index.php', '', 'en', 1, 0, 1282919126, 0, '', 1, 'open', 6, 0, '', 'n', 'y', 0, 'all', 'y', 'n', 'n', '', '', 'n', 'n', 'n', 'n', 0, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', '', 0, '', '', 'n', '', 'n', 10, '', '', 0),
(8, 1, 'comments', 'Comments', 'http://2ndfolio.local/', NULL, 'en', 0, 0, 0, 0, '', 0, 'open', 7, NULL, NULL, 'y', 'y', NULL, 'all', 'y', 'y', 'n', NULL, NULL, 'y', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', NULL, 0, NULL, NULL, 'y', NULL, 'n', 10, '', '', 0),
(9, 1, 'team', 'Team', 'http://2ndfolio.local/', NULL, 'en', 0, 0, 0, 0, NULL, 1, 'open', 8, NULL, NULL, 'y', 'y', NULL, 'all', 'y', 'y', 'n', NULL, NULL, 'y', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', NULL, 0, NULL, NULL, 'y', NULL, 'n', 10, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data`
--

CREATE TABLE `exp_channel_data` (
  `entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `field_id_4` text,
  `field_ft_4` text,
  `field_id_5` text,
  `field_ft_5` text,
  `field_id_6` text,
  `field_ft_6` text,
  `field_id_7` text,
  `field_ft_7` text,
  `field_id_8` text,
  `field_ft_8` text,
  `field_id_9` text,
  `field_ft_9` text,
  `field_id_10` text,
  `field_ft_10` text,
  `field_id_11` text,
  `field_ft_11` text,
  `field_id_12` text,
  `field_ft_12` text,
  `field_id_13` text,
  `field_ft_13` text,
  `field_id_14` text,
  `field_ft_14` text,
  `field_id_15` text,
  `field_ft_15` text,
  `field_id_16` text,
  `field_ft_16` text,
  `field_id_17` text,
  `field_ft_17` text,
  `field_id_18` text,
  `field_ft_18` text,
  `field_id_19` text,
  `field_ft_19` text,
  `field_id_20` text,
  `field_ft_20` tinytext,
  `field_id_21` text,
  `field_ft_21` tinytext,
  `field_id_22` text,
  `field_ft_22` tinytext,
  `field_id_23` text,
  `field_ft_23` tinytext,
  `field_id_24` float DEFAULT '0',
  `field_ft_24` tinytext,
  `field_id_25` float DEFAULT '0',
  `field_ft_25` tinytext,
  PRIMARY KEY (`entry_id`),
  KEY `site_id` (`site_id`),
  KEY `channel_id` (`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_channel_data`
--

INSERT INTO `exp_channel_data` (`entry_id`, `site_id`, `channel_id`, `field_id_4`, `field_ft_4`, `field_id_5`, `field_ft_5`, `field_id_6`, `field_ft_6`, `field_id_7`, `field_ft_7`, `field_id_8`, `field_ft_8`, `field_id_9`, `field_ft_9`, `field_id_10`, `field_ft_10`, `field_id_11`, `field_ft_11`, `field_id_12`, `field_ft_12`, `field_id_13`, `field_ft_13`, `field_id_14`, `field_ft_14`, `field_id_15`, `field_ft_15`, `field_id_16`, `field_ft_16`, `field_id_17`, `field_ft_17`, `field_id_18`, `field_ft_18`, `field_id_19`, `field_ft_19`, `field_id_20`, `field_ft_20`, `field_id_21`, `field_ft_21`, `field_id_22`, `field_ft_22`, `field_id_23`, `field_ft_23`, `field_id_24`, `field_ft_24`, `field_id_25`, `field_ft_25`) VALUES
(2, 1, 6, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '<p>2nd Folio is a new and exciting Shakespearian card game that brings the Bard into the 21st Century!</p>\n\n<p>Using QR Code technologies students play in teams, undertaking drama and literacy tasks that enable them to interrogate some of Shakespeare’s most famous lines: uncovering new meanings, creating new interpretations, and making Shakespeare their own.</p>\n\n<p>Each task is worth points and students themselves get to make critical judgements as to which of their peers deserves the greatest reward!  2nd Folio can be played again and again, the durable packs of cards serving as an excellent resources for de-mystifying Shakespeare.</p>\n\n<p>However, the magic of 2nd Folio does not end there.  The game can be played online, drawing on a powerful database of video and media clips to enrich students’ learning.  What’s more students themselves can add their own work to this growing, living resource, helping to build an accessible and engaging learning resource for all.  The QR codes embedded in each card make this use of ICT a fun and contemporary way to learn.</p>\n\n<p>Finally, you don’t have to play alone!  Schools can join Bouts: playing alongside other schools and young people all over the world!  We have 2nd Folio players across the UK, in New York, Washington DC and in Kenya with more joining every week! </p>\n\n<p>Order your 2n Folio cards (you get 10 packs per order) online and re-invent Shakespeare in your classroom!</p>\n', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(3, 1, 4, 'Romeo is a handsome young Montague who is a proficient sword fighter . Ruled by his emotions, He rapidly falls passionately in and out of love with women, eventually leading to his mistaken grief causing his suicide. Romeo is worth 15 points.', 'none', '', 'none', '{filedir_2}romeo.png', 'none', '15', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(4, 1, 4, 'Puck is a mischievous and sprightly fairy. He delights in the power he wields but can often get confused and make mistakes, because of this Puck''s value is decided by the witches using the card. Puck can be worth the value of any of the other cards. From 10 up to 40, The witches must decide...', 'none', '', 'none', '{filedir_2}puck.png', 'none', '?', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(5, 1, 5, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '<h3><strong>You will need:</strong></h3>\n<p>- 2nd Folio cards<br />- A large room to play in<br />- An online computer with web cam<br />- QR Reader<br />- Paper and pens<br />- A clock/timer.</p>\n<ul>\n</ul>\n<h3><strong>How to play:</strong><strong>&nbsp;</strong></h3>\n<p>- The group choose Three Witches. They will be the referees for the game. (You can have one Witch if your group is small).</p>\n<p>- The rest of the group divides into competing teams of approx 4-5 players.</p>\n<p>- Set out your two packs of 2<sup>nd</sup> Folio cards. The Quote Cards (featuring a Shakespeare quote on one side and the 2<sup>nd</sup> Folio logo on the other) and the Task Cards (featuring an illustration of a Shakespearian character).</p>\n<p>- Shuffle each pack.</p>\n<p>- In each round, each team takes a Quote Card from the pack.&nbsp;</p>\n<p>- The Three Witches take a Task Card and read it out.</p>\n<p>- Each Task Card, features a character illustration. Each character has a total points value that the witches can distribute.</p>\n<p><strong></strong>- The teams are given by the Three Witches a fixed amount of time to undertake the task and start the clock.</p>\n<p>- The teams devise their response to the task using their Quote Card as their starting point.&nbsp;</p>\n<p>- The QR code on both the Quote and Task Cards can be used by players to help them research and prepare their response.</p>\n<p>- When time is up, the teams perform or demonstrate their response to the Task Card to the Three Witches.&nbsp; When the Witches have seen them all they distribute points from the Task Card as they see fit. So for example, if a Task Card has a points value of 30 and four teams are playing, the witches might award 15 points to the best group, 8 points to the team who came second 6 points to the third&nbsp; and 1 to the last. The total points awarded must not exceed the total available for that character/card.</p>\n<p>- Play as many rounds as you want to, repeating the above process.</p>\n<p>- The winning team is the one with the highest score.</p>\n<ul>\n</ul>\n<p>You can play 2<sup>nd</sup> Folio over any number of days or dates and remember you can submit and update team scores to the 2<sup>nd</sup> Folio website. The 2<sup>nd</sup> Folio League means that teams can play against others wherever they might be.</p>', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(8, 1, 6, '', NULL, '', NULL, '', NULL, '', NULL, 'So if you''ve already begun playing 2nd Folio, we hope you''ve enjoyed it - and maybe even won a round or two. But it doesn''t stop there!', 'none', '<p>It you''ve got any suggestions for other tasks or further Shakespearean quotes let us know and they might just feature in the next edition of cards we publish.</p>', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(62, 1, 6, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '<p>To play 2<sup>nd</sup> Folio online you will need to use QR codes printed on each card, which means you will need to download and use a QR reader.&nbsp;</p>\n<p>QR codes are similar to bar codes.&nbsp; They contain a tremendous amount of information in a coded, digital graphic form.&nbsp; Hold a QR code up to a QR reader and it will scan it, decode it and link you to vast quantaties of information, process dates or perform tasks and actions. They are used in industry, marketing, airports &ndash; and now in theatre.</p>\n<h3><strong>Here&rsquo;s how it works</strong></h3>\n<p>1. Make sure you have a computer with a webcam or an attached, enabled camera.</p>\n<p>2. Make sure you are online.</p>\n<p>3. Download and run the free QR Reader: See the instructions at the bottom of this page. &nbsp;</p>\n<p>4. As you play 2<sup>nd</sup> Folio, use the QR codes printed on each card to enrich the way you and your teams approach each quote and task.</p>\n<p>5. Hold a QR code up to the on-screen reader.&nbsp; Make sure the code is flat, still, and fits between the onscreen markers.</p>\n<p>6. When the QR reader has successfully scanned the code it will link you to the 2<sup>nd</sup> Folio database: a growing resource of videos, links and materials designed to enrich players'' understanding of each quote and task. Each code links to a unique page for that quote or task, with advice from actors and directors, clips from performances and films or advice and tips from previous players of the game.</p>\n<ol> </ol> \n<ul>\n</ul>\n<p>And players can submit ideas for new contributions to the database via the submit page.</p>\n<h3><strong>Getting the QR Code Reader <br />(Windows, Mac, Linux compatible)</strong></h3>\n<p><strong>&nbsp;</strong>1. You need to install Adobe Air v1.5*<br />Download it for&nbsp;<a href="http://dl.dropbox.com/u/60723/AdobeAIR.dmg">Mac</a>, <a href="http://www.versiondownload.com/getFile.php?fid=adobe-air&amp;version=1.5">PC</a>, <a href="http://get.adobe.com/air/">Linux</a></p>\n<p>2. Download the QR code reader&nbsp;<a href="http://dansl.net/QRreader.air">here</a>. (156Kb)</p>\n<p>3. Run <strong><em>QRreader.air</em></strong>. The install window will not know the publisher - click Install, then Continue. The QR Reader should now be running.</p>\n<p>&nbsp;</p>\n<p>*The QR Reader works with Adobe Air Version 1.5. If you have a later version installed, you will need to use the supplied Uninstaller to be able install v1.5&nbsp;</p>', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(63, 1, 6, '', NULL, '', NULL, '', NULL, '', NULL, 'We''ll let you know when more playing cards have been made available and you''ll be able to download them from here.', 'none', '<p>TO download cards you''ll need to be a member of the C&amp;T schools network. To find out more about ground-breaking work C&amp;T does and how your school can be part of it, go to <a href="http://www.candt.org">our website</a>.</p>', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(65, 1, 6, '', NULL, '', NULL, '', NULL, '', NULL, 'There are currently no cards available to download.', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(12, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16728445', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(13, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16732959', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(14, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16733760\nhttp://vimeo.com/16726000', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(15, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16732002\nhttp://vimeo.com/16725907', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(16, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://www.youtube.com/watch?v=UwuQSqrMgJg\nhttp://vimeo.com/16733250\nhttp://www.youtube.com/watch?v=Blm05WewlBY\nhttp://vimeo.com/16725977', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(17, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16733493\nhttp://vimeo.com/16726016', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(18, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16732451\nhttp://vimeo.com/16725987', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(19, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16732324\nhttp://vimeo.com/16725936', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(20, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16733077\nhttp://vimeo.com/16725957', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(21, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16733335', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(22, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(23, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(24, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16725797', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(25, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16725811', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(26, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16725844', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(27, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16725775', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(28, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16725858', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(29, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16725725', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(30, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16725750', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(31, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16725830', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(32, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16690400', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(33, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16690729', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(34, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16690685', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(35, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16690032', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(36, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(37, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16690056', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(38, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16689963', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(39, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16690704', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(40, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16690447', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(41, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16690078', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(42, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16690814', 'none', '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(43, 1, 3, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16726029', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(44, 1, 3, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16726029', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(45, 1, 3, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16726029', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(46, 1, 3, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16726029', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(47, 1, 3, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16726029', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(48, 1, 3, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16726029', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(49, 1, 3, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16726029', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(50, 1, 3, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16726107', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(51, 1, 3, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16730932\nhttp://vimeo.com/16729203\nhttp://vimeo.com/16726216', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(52, 1, 3, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16731491\nhttp://vimeo.com/16729283\nhttp://vimeo.com/16726161', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(53, 1, 3, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16726254', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(54, 1, 3, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16731665\nhttp://vimeo.com/16729636\nhttp://vimeo.com/16726097\n', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(55, 1, 3, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16726078', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(56, 1, 3, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16726146\n', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(57, 1, 3, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(58, 1, 3, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16726090\n', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(59, 1, 3, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16733760\n', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(60, 1, 3, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', 'http://vimeo.com/16726134\n', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(66, 1, 4, 'Macbeth is a Scottish noble and a valiant military man. He commits regicide and lives in anxiety and fear thereafter, unable to rest or to trust his nobles. Macbeth is eventually slain after his reign of terror. Macbeth is easily manipulated by his wife however and is thus worth 20 points.', 'none', '', 'none', '{filedir_2}macbeth.png', 'none', '20', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(61, 1, 7, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '<p>You don&rsquo;t just have to play 2<sup>nd</sup> Folio with those around you!&nbsp; You can play against teams across the world!</p>\n<p>Witches can submit scores for each team (make sure they&rsquo;ve got a name) &ndash; Number of rounds played and points total &ndash; via the Submit page and the website will do the rest! See how well you can play against the very best!</p>\n<p>And how do you rate success? Total points scored or your average score per round? &nbsp;&nbsp;</p>', 'none', 'Facial Hairs\n3\n17\nFlying Caliban\n1\n6\nJuliet''s Pink Undies\n3\n24\nMalmspeare\n3\n26\nShakespeare''s Shoes\n3\n15\nShake that Malmesbury\n3\n38\nMalmesbury or not to be\n3\n40\nThe Malmesbury Globetrotters\n2\n36\nTremendous Tempest\n2\n24\nTeam Juliets (Bishop Perowne)\n2\n13\nMacbeth & Tragedy (Bishop Perowne)\n2\n8\nPunky Pucks (Bishop Perowne)\n1\n15\nTeam Second Folio (Bishop Perowne)\n2\n2\nPuck''s Bottom (Bishop Perowne)\n2\n5\nTeam Macbethio (Bishop Perowne)\n2\n10\nDaggers & War (Bishop Perowne)\n1\n5\nThe Lovers (Boroughbridge High School)\n3\n21\nThe Poisoners (Boroughbridge High School)\n3\n24\nThe Brawlers (Boroughbridge High School)\n3\n31\nThe Friars (Boroughbridge High School)\n3\n18\nShake-Laurence\n1\n10\nMore in St. Laurence than in anger\n1\n5\nSt.-Shakespeare\n1\n2\nSt.-Laurence-speare\n1\n11\nSt. Laurence Shaking Spears\n1\n5\nGeorgio and Jamiet AND David! (St. L)\n1\n7\nThe Juliets (St L.)\n2\n5\nThe Shakespearian Pigeons (St. L)\n2\n11\nSt Laurence Horn Beasts\n2\n10\nLaurencespeare\n2\n10\nThe Fair Maidens (St. L)\n2\n14\nThe Wacky Shacks (St. L)\n2\n6\nThou art lol (St. L)\n2\n9\nThe Plums (St. L)\n2\n7\nThe Juliets who need no Romeo (St. L)\n2\n26\nShake that speare (St. L)\n2\n21', 'none', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(69, 1, 4, 'A very young and beautiful girl, Juliet falls madly in love with Romeo at first sight. She defies her fathers will when forced to marry Paris and goes to great lengths to be with her love, her tragic suicide means she is worth 18 points.', 'none', '', 'none', '{filedir_2}juliet.png', 'none', '18', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(67, 1, 4, 'Hamlet is a Prince of Denmark, his emotions wildly swing from overwhelming grief to seething rage. He is a very intelligent man and an exceptional sword fighter. Hamlet eventually triumphs in his revenge but is mortally wounded in the process, Hamlet is worth 35 points.', 'none', '', 'none', '{filedir_2}hamlet.png', 'none', '35', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(68, 1, 4, 'Bottom is a foolish and clumsy actor that is the laughing stock of all who know him. This is only worsened by the fact he believes himself to be a misunderstood thespian of great talent, Bottom''s stupidity makes him worth only 10 points.', 'none', '', 'none', '{filedir_2}bottom.png', 'none', '10', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(70, 1, 4, 'King Hamlet was once a proud warrior, he led Denmark''s forces to victory against Norway, and personally defeated its King in hand-to-hand combat. Now an immortal ghost plaguing his son to avenge him, Ghost of King Hamlet is worth 30 points', 'none', '', 'none', '{filedir_2}kind-hamlet.png', 'none', '30', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(71, 1, 4, 'A young noblewoman of Denmark, she is a potential wife of Hamlet but her lack of willpower leads to her becoming mad and committing suicide. Since she is such a weak character she is worth only 12 points.', 'none', '', 'none', '{filedir_2}ophelia.png', 'none', '12', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(72, 1, 4, 'Devious and scheming, Lady Macbeth is an influential and ambitious woman. She does not baulk at the idea of murder and relishes in having power over others. This means she is worth 28 points.', 'none', '', 'none', '{filedir_2}lady-macbeth.png', 'none', '28', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(73, 1, 4, 'Titania is a Goddess of the woods, her eldritch power is near unmatched and she has cohorts of fairies as servants. Titania is the most valuable card at a whopping 40 points! Her favour can win you the game in one fell swoop.', 'none', '', 'none', '{filedir_2}titania.png', 'none', '40', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(74, 1, 4, 'A young and violent Capulet, known as the Prince of Cats due to his sly nature. He is deadly with a sword and a sworn enemy of all Montagues. His evil nature means this card is worth 24 points.', 'none', '', 'none', '{filedir_2}tybalt.png', 'none', '24', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(75, 1, 4, 'The witches are macabre and fickle, they control the movements of the other characters without their knowledge. They have great wisdom and with this great power. This is why they are the judges and referees of 2nd Folio.', 'none', '', 'none', '{filedir_2}witch.png', 'none', '0', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', 0, 'none', 0, 'none'),
(84, 1, 9, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Max''s Team', 'xhtml', 5, 'none', 25, 'none'),
(85, 1, 9, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'xhtml', 0, 'none', 0, 'none');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_entries_autosave`
--

CREATE TABLE `exp_channel_entries_autosave` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pentry_id` int(10) NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(16) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) NOT NULL DEFAULT 'y',
  `sticky` varchar(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `dst_enabled` varchar(1) NOT NULL DEFAULT 'n',
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  `entry_data` text,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_fields`
--

CREATE TABLE `exp_channel_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL,
  `field_label` varchar(50) NOT NULL,
  `field_instructions` text,
  `field_type` varchar(50) NOT NULL DEFAULT 'text',
  `field_list_items` mediumtext NOT NULL,
  `field_pre_populate` char(1) NOT NULL DEFAULT 'n',
  `field_pre_channel_id` int(6) unsigned DEFAULT NULL,
  `field_pre_field_id` int(6) unsigned DEFAULT NULL,
  `field_related_to` varchar(12) NOT NULL DEFAULT 'channel',
  `field_related_id` int(6) unsigned NOT NULL,
  `field_related_orderby` varchar(12) NOT NULL DEFAULT 'date',
  `field_related_sort` varchar(4) NOT NULL DEFAULT 'desc',
  `field_related_max` smallint(4) NOT NULL,
  `field_ta_rows` tinyint(2) DEFAULT '8',
  `field_maxl` smallint(3) DEFAULT NULL,
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_search` char(1) NOT NULL DEFAULT 'n',
  `field_is_hidden` char(1) NOT NULL DEFAULT 'n',
  `field_fmt` varchar(40) NOT NULL DEFAULT 'xhtml',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_order` int(3) unsigned NOT NULL,
  `ff_settings` mediumtext NOT NULL,
  `field_content_type` varchar(20) NOT NULL DEFAULT 'any',
  `field_settings` text,
  PRIMARY KEY (`field_id`),
  KEY `group_id` (`group_id`),
  KEY `site_id` (`site_id`),
  KEY `field_type` (`field_type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `exp_channel_fields`
--

INSERT INTO `exp_channel_fields` (`field_id`, `site_id`, `group_id`, `field_name`, `field_label`, `field_instructions`, `field_type`, `field_list_items`, `field_pre_populate`, `field_pre_channel_id`, `field_pre_field_id`, `field_related_to`, `field_related_id`, `field_related_orderby`, `field_related_sort`, `field_related_max`, `field_ta_rows`, `field_maxl`, `field_required`, `field_text_direction`, `field_search`, `field_is_hidden`, `field_fmt`, `field_show_fmt`, `field_order`, `ff_settings`, `field_content_type`, `field_settings`) VALUES
(4, 1, 4, 'character-intro', 'Introduction', '', 'textarea', '', 'n', 0, 0, 'channel', 0, 'title', 'desc', 0, 2, 128, 'n', 'ltr', 'y', 'n', 'none', 'n', 1, '', 'any', 'YTo1OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToieSI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJ5IjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToieSI7czozMjoiZmllbGRfZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToieSI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6InkiO30='),
(5, 1, 4, 'character-body', 'Body', '', 'textarea', '', '0', 0, 0, 'channel', 4, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'y', 'n', 'none', 'n', 2, 'a:16:{s:10:"field_type";s:7:"TinyMCE";s:19:"markitup_set_folder";s:4:"html";s:11:"config_file";s:10:"article.js";s:11:"preferences";s:1:"1";s:11:"folder_type";s:5:"image";s:18:"root_extra_folders";s:0:"";s:18:"root_except_groups";s:0:"";s:13:"extra_folders";s:0:"";s:12:"thumbquality";s:2:"80";s:12:"imagequality";s:2:"80";s:9:"thumbsize";s:2:"80";s:12:"resize_width";s:0:"";s:13:"resize_height";s:0:"";s:10:"crop_width";s:0:"";s:11:"crop_height";s:0:"";s:14:"crop_size_type";s:1:"0";}', 'any', 'YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(6, 1, 4, 'character-image', 'Image of Character', '', 'file', '', '0', 0, 0, 'channel', 4, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 3, 'a:14:{s:10:"field_type";s:11:"stand_alone";s:11:"preferences";s:1:"2";s:11:"folder_type";s:5:"image";s:18:"root_extra_folders";s:0:"";s:18:"root_except_groups";s:0:"";s:13:"extra_folders";s:0:"";s:12:"thumbquality";s:2:"80";s:12:"imagequality";s:2:"80";s:9:"thumbsize";s:2:"80";s:12:"resize_width";s:0:"";s:13:"resize_height";s:0:"";s:10:"crop_width";s:0:"";s:11:"crop_height";s:0:"";s:14:"crop_size_type";s:1:"0";}', 'any', 'YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(7, 1, 4, 'character-point', 'Points', '', 'textarea', '', '0', 0, 0, 'channel', 4, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 4, 'a:1:{s:7:"options";a:12:{i:0;s:1:"0";i:10;s:2:"10";i:12;s:2:"12";i:15;s:2:"15";i:18;s:2:"18";i:20;s:2:"20";i:24;s:2:"24";i:28;s:2:"28";i:30;s:2:"30";i:35;s:2:"35";i:40;s:2:"40";s:1:"?";s:1:"?";}}', 'any', 'YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(8, 1, 5, 'intro', 'Introduction', '', 'textarea', '', 'n', 0, 0, 'channel', 0, 'title', 'desc', 0, 2, 128, 'n', 'ltr', 'y', 'n', 'none', 'n', 5, '', 'any', 'YTo1OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToieSI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJ5IjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToieSI7czozMjoiZmllbGRfZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToieSI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6InkiO30='),
(9, 1, 5, 'body', 'Body', '', 'textarea', '', '0', 0, 0, 'channel', 4, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'y', 'n', 'none', 'n', 6, 'a:16:{s:10:"field_type";s:7:"TinyMCE";s:19:"markitup_set_folder";s:4:"html";s:11:"config_file";s:10:"article.js";s:11:"preferences";s:1:"1";s:11:"folder_type";s:4:"file";s:18:"root_extra_folders";s:0:"";s:18:"root_except_groups";s:0:"";s:13:"extra_folders";s:0:"";s:12:"thumbquality";s:2:"80";s:12:"imagequality";s:2:"80";s:9:"thumbsize";s:2:"80";s:12:"resize_width";s:0:"";s:13:"resize_height";s:0:"";s:10:"crop_width";s:0:"";s:11:"crop_height";s:0:"";s:14:"crop_size_type";s:1:"0";}', 'any', 'YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(10, 1, 2, 'quote-intro', 'Introduction', '', 'textarea', '', 'n', 0, 0, 'channel', 0, 'title', 'desc', 0, 2, 128, 'n', 'ltr', 'y', 'n', 'none', 'n', 7, '', 'any', 'YTo1OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToieSI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJ5IjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToieSI7czozMjoiZmllbGRfZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToieSI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6InkiO30='),
(11, 1, 2, 'quote-body', 'Body', '', 'textarea', '', 'n', 0, 0, 'channel', 0, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'y', 'n', 'none', 'n', 8, 'a:16:{s:10:"field_type";s:7:"TinyMCE";s:19:"markitup_set_folder";s:4:"html";s:11:"config_file";s:10:"article.js";s:11:"preferences";s:1:"1";s:11:"folder_type";s:4:"file";s:18:"root_extra_folders";s:0:"";s:18:"root_except_groups";s:0:"";s:13:"extra_folders";s:0:"";s:12:"thumbquality";s:2:"80";s:12:"imagequality";s:2:"80";s:9:"thumbsize";s:2:"80";s:12:"resize_width";s:0:"";s:13:"resize_height";s:0:"";s:10:"crop_width";s:0:"";s:11:"crop_height";s:0:"";s:14:"crop_size_type";s:1:"0";}', 'any', NULL),
(12, 1, 2, 'quote-media', 'Media', '', 'matrix', '', 'n', 0, 0, 'channel', 4, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'y', 'n', 'none', 'n', 9, '', 'any', 'YToyOntzOjg6Im1heF9yb3dzIjtzOjA6IiI7czo3OiJjb2xfaWRzIjthOjA6e319'),
(13, 1, 2, 'quote-qr', 'QR Code', '', 'textarea', '', 'n', 0, 0, 'channel', 0, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 10, 'a:14:{s:10:"field_type";s:11:"stand_alone";s:11:"preferences";s:1:"3";s:11:"folder_type";s:5:"image";s:18:"root_extra_folders";s:0:"";s:18:"root_except_groups";s:0:"";s:13:"extra_folders";s:0:"";s:12:"thumbquality";s:2:"80";s:12:"imagequality";s:2:"80";s:9:"thumbsize";s:2:"80";s:12:"resize_width";s:0:"";s:13:"resize_height";s:0:"";s:10:"crop_width";s:0:"";s:11:"crop_height";s:0:"";s:14:"crop_size_type";s:1:"0";}', 'any', NULL),
(14, 1, 3, 'task-intro', 'Introduction', '', 'textarea', '', 'n', 0, 0, 'channel', 0, 'title', 'desc', 0, 2, 128, 'n', 'ltr', 'y', 'n', 'none', 'n', 11, '', 'any', 'YTo1OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToieSI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJ5IjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToieSI7czozMjoiZmllbGRfZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToieSI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6InkiO30='),
(15, 1, 3, 'task-body', 'Body', '', 'textarea', '', 'n', 0, 0, 'channel', 0, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'y', 'n', 'none', 'n', 12, 'a:15:{s:10:"field_type";s:7:"TinyMCE";s:11:"config_file";s:10:"article.js";s:11:"preferences";s:1:"1";s:11:"folder_type";s:4:"file";s:18:"root_extra_folders";s:0:"";s:18:"root_except_groups";s:0:"";s:13:"extra_folders";s:0:"";s:12:"thumbquality";s:2:"80";s:12:"imagequality";s:2:"80";s:9:"thumbsize";s:2:"80";s:12:"resize_width";s:0:"";s:13:"resize_height";s:0:"";s:10:"crop_width";s:0:"";s:11:"crop_height";s:0:"";s:14:"crop_size_type";s:1:"0";}', 'any', NULL),
(16, 1, 3, 'task-media', 'Media', '', 'matrix', '', '0', 0, 0, 'channel', 4, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'y', 'n', 'none', 'n', 13, '', 'any', 'YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(17, 1, 3, 'task-qr', 'QR Code', '', 'textarea', '', 'n', 0, 0, 'channel', 0, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 14, 'a:14:{s:10:"field_type";s:11:"stand_alone";s:11:"preferences";s:1:"3";s:11:"folder_type";s:5:"image";s:18:"root_extra_folders";s:0:"";s:18:"root_except_groups";s:0:"";s:13:"extra_folders";s:0:"";s:12:"thumbquality";s:2:"80";s:12:"imagequality";s:2:"80";s:9:"thumbsize";s:2:"80";s:12:"resize_width";s:0:"";s:13:"resize_height";s:0:"";s:10:"crop_width";s:0:"";s:11:"crop_height";s:0:"";s:14:"crop_size_type";s:1:"0";}', 'any', NULL),
(18, 1, 6, 'league-body', 'Body', '', 'textarea', '', 'n', 0, 0, 'channel', 4, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'y', 'y', 'none', 'n', 15, 'a:16:{s:10:"field_type";s:7:"TinyMCE";s:19:"markitup_set_folder";s:4:"html";s:11:"config_file";s:10:"article.js";s:11:"preferences";s:1:"1";s:11:"folder_type";s:5:"image";s:18:"root_extra_folders";s:0:"";s:18:"root_except_groups";s:0:"";s:13:"extra_folders";s:0:"";s:12:"thumbquality";s:2:"80";s:12:"imagequality";s:2:"80";s:9:"thumbsize";s:2:"80";s:12:"resize_width";s:0:"";s:13:"resize_height";s:0:"";s:10:"crop_width";s:0:"";s:11:"crop_height";s:0:"";s:14:"crop_size_type";s:1:"0";}', 'any', NULL),
(19, 1, 6, 'league', 'League', 'To add a new team click "Add Row"\nTo remove a team just dealte all info from the row.\nDon''t worry about the order, it will reorder on the website.\n\nREMEMBER: Click "Update" at the top of this page to SAVE', 'matrix', '', 'n', 0, 0, 'channel', 4, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'y', 'n', 'none', 'n', 16, '', 'any', 'YToyOntzOjg6Im1heF9yb3dzIjtzOjA6IiI7czo3OiJjb2xfaWRzIjthOjA6e319'),
(20, 1, 7, 'video_url', 'Video URL', '', 'text', '', '0', 0, 0, 'channel', 4, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'xhtml', 'n', 1, '', 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(21, 1, 7, 'comment_parent', 'Comment Parent', '', 'text', '', '0', 0, 0, 'channel', 4, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'xhtml', 'n', 2, '', 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(22, 1, 7, 'comment_body', 'Body', '', 'textarea', '', '0', 0, 0, 'channel', 4, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'xhtml', 'n', 3, '', 'any', 'YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(23, 1, 8, 'team_description', 'Description', '', 'textarea', '', '0', 0, 0, 'channel', 4, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'xhtml', 'n', 1, '', 'any', 'YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(24, 1, 8, 'team_games_played', 'Games Played', '', 'text', '', '0', 0, 0, 'channel', 4, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 2, '', 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NzoibnVtZXJpYyI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),
(25, 1, 8, 'team_total_points', 'Total Points', '', 'text', '', '0', 0, 0, 'channel', 4, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 3, '', 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NzoibnVtZXJpYyI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_member_groups`
--

CREATE TABLE `exp_channel_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `channel_id` int(6) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_channel_member_groups`
--

INSERT INTO `exp_channel_member_groups` (`group_id`, `channel_id`) VALUES
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(5, 6),
(5, 7),
(6, 7),
(7, 9);

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_titles`
--

CREATE TABLE `exp_channel_titles` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pentry_id` int(10) NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(16) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) NOT NULL DEFAULT 'y',
  `sticky` varchar(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `dst_enabled` varchar(1) NOT NULL DEFAULT 'n',
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`),
  KEY `channel_id` (`channel_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=86 ;

--
-- Dumping data for table `exp_channel_titles`
--

INSERT INTO `exp_channel_titles` (`entry_id`, `site_id`, `channel_id`, `author_id`, `pentry_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `dst_enabled`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`) VALUES
(2, 1, 6, 1, 0, 0, '127.0.0.1', 'About 2nd Folio', 'about_2nd_folio', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282672145, 'n', '2010', '08', '24', 0, 0, 20111125143211, 0, 0),
(3, 1, 4, 1, 0, 0, '127.0.0.1', 'Romeo', 'romeo', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282672204, 'n', '2010', '08', '24', 0, 0, 20110816092405, 0, 0),
(4, 1, 4, 1, 0, 0, '127.0.0.1', 'Puck', 'puck', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282672556, 'n', '2010', '08', '24', 0, 0, 20110816092357, 0, 0),
(5, 1, 5, 1, 0, 0, '193.62.51.5', 'These are the Rules', 'this_is_the_main_rules_page', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282673571, 'n', '2010', '08', '24', 0, 0, 20100903104153, 0, 0),
(8, 1, 6, 1, 0, 0, '86.173.132.165', 'Submit your suggestions', 'submit_your_suggestions', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282673903, 'n', '2010', '08', '24', 0, 0, 20100916103424, 0, 0),
(62, 1, 6, 1, 0, 0, '193.62.51.5', 'The QR Reader', 'qr-reader', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1283263276, 'n', '2010', '08', '31', 0, 0, 20101125142217, 0, 0),
(63, 1, 6, 1, 0, 0, '86.173.132.165', 'Playing Cards', 'playing-cards', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1283263351, 'n', '2010', '08', '31', 0, 0, 20100916102632, 0, 0),
(12, 1, 2, 2, 0, 0, '193.62.51.5', 'Is love a tender thing? It is too rough, too rude, too boisterous, and it pricks like a thorn', 'romeo-and-juliet-1', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282743986, 'n', '2010', '08', '25', 0, 0, 20101217104227, 0, 0),
(13, 1, 2, 2, 0, 0, '193.62.51.5', 'love is a smoke made with the fume of sighs; being purged a fire sparkling in lover’s eyes', 'romeo-and-juliet-2', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282835749, 'n', '2010', '08', '26', 0, 0, 20101217104250, 0, 0),
(14, 1, 2, 2, 0, 0, '193.62.51.5', 'O true apothecary!  Thy drugs are quick, thus with a kiss I die', 'romeo-and-juliet-3', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282835902, 'n', '2010', '08', '26', 0, 0, 20101217104623, 0, 0),
(15, 1, 2, 2, 0, 0, '193.62.51.5', 'A plague a’both your houses! Zounds, a dog, a rat, a mouse, a cat to scratch a man to death', 'romeo-and-juliet-4', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282836592, 'n', '2010', '08', '26', 0, 0, 20101217104653, 0, 0),
(16, 1, 2, 2, 0, 0, '137.205.52.106', 'Parting is such sweet sorrow that I shall say Good night till it be morrow', 'romeo-and-juliet-5', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282836674, 'n', '2010', '08', '26', 0, 0, 20101123204715, 0, 0),
(17, 1, 2, 2, 0, 0, '193.62.51.5', 'What’s in a name? That which we call a rose would by any other name smell as sweet.', 'romeo-and-juliet-6', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282836677, 'n', '2010', '08', '26', 0, 0, 20101217104718, 0, 0),
(18, 1, 2, 2, 0, 0, '193.62.51.5', 'What, drawn and talk of peace? I hate the word as I hate hell, all Montagues and thee', 'romeo-and-juliet-7', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282836938, 'n', '2010', '08', '26', 0, 0, 20101217104739, 0, 0),
(19, 1, 2, 2, 0, 0, '193.62.51.5', 'From ancient grudge break to new mutiny, Where Civil blood makes civil hand unclean', 'romeo-and-juliet-8', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282837757, 'n', '2010', '08', '26', 0, 0, 20101217104818, 0, 0),
(20, 1, 2, 2, 0, 0, '193.62.51.5', 'O happy dagger this is thy sheath; there rust, and let me die', 'romeo-and-juliet-9', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282837843, 'n', '2010', '08', '26', 0, 0, 20101217104844, 0, 0),
(21, 1, 2, 2, 0, 0, '193.62.51.5', 'Thank me no thankings, nor proud me no prouds', 'romeo-and-juliet-10', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282837872, 'n', '2010', '08', '26', 0, 0, 20101217104913, 0, 0),
(22, 1, 2, 2, 0, 0, '193.62.51.5', 'O that your frowns would teach my smiles such skill', 'midsummer-nights-dream-1', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282838003, 'n', '2010', '08', '26', 0, 0, 20100826155624, 0, 0),
(23, 1, 2, 2, 0, 0, '193.62.51.5', 'The lunatic, the lover and the poet are of imagination all compact', 'midsummer-nights-dream-2', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282838198, 'n', '2010', '08', '26', 0, 0, 20100826155840, 0, 0),
(24, 1, 2, 2, 0, 0, '193.62.51.5', 'Love looks not with the eyes, but with the mind and therefore is winged cupid painted blind', 'midsummer-nights-dream-3', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282838279, 'n', '2010', '08', '26', 0, 0, 20101217105000, 0, 0),
(25, 1, 2, 2, 0, 0, '193.62.51.5', 'The course of true love never did run smooth', 'midsummer-nights-dream-4', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282838391, 'n', '2010', '08', '26', 0, 0, 20101217105052, 0, 0),
(26, 1, 2, 2, 0, 0, '193.62.51.5', 'Now am I dead, now am I fled, my soul is in the sky, tongue, lose thy light; moon, take thy flight', 'midsummer-nights-dream-5', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282838506, 'n', '2010', '08', '26', 0, 0, 20101217105347, 0, 0),
(27, 1, 2, 2, 0, 0, '193.62.51.5', 'Lord, what fools these mortals be', 'midsummer-nights-dream-6', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282838587, 'n', '2010', '08', '26', 0, 0, 20101217105408, 0, 0),
(28, 1, 2, 2, 0, 0, '193.62.51.5', 'What thou seest when thou dost wake, do it for thy true love take; love and languish for his sake', 'midsummer-nights-dream-7', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282838663, 'n', '2010', '08', '26', 0, 0, 20101217105424, 0, 0),
(29, 1, 2, 2, 0, 0, '193.62.51.5', 'I’ll follow thee, and make a heaven of a hell, to die upon the hand I love so well.', 'midsummer-nights-dream-8', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282838750, 'n', '2010', '08', '26', 0, 0, 20101217105451, 0, 0),
(30, 1, 2, 2, 0, 0, '193.62.51.5', 'If we shadows have offended, think but this and all is mended. That you have but slumbered here,', 'midsummer-nights-dream-9', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282838825, 'n', '2010', '08', '26', 0, 0, 20101217105506, 0, 0),
(31, 1, 2, 2, 0, 0, '193.62.51.5', 'The iron tongue of midnight have told twelve', 'midsummer-nights-dream-10', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282838904, 'n', '2010', '08', '26', 0, 0, 20101217105525, 0, 0),
(32, 1, 2, 2, 0, 0, '193.62.51.5', 'life’s but a walking shadow, a poor player that struts and frets his hour upon the stage', 'macbeth-1', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282839048, 'n', '2010', '08', '26', 0, 0, 20101217105549, 0, 0),
(33, 1, 2, 2, 0, 0, '193.62.51.5', 'Come, you spirits that tend on mortal thoughts, unsex me here, and fill me from the crown', 'macbeth-2', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282839123, 'n', '2010', '08', '26', 0, 0, 20101217105604, 0, 0),
(34, 1, 2, 2, 0, 0, '193.62.51.5', 'So foul and fair a day I hath not seen', 'macbeth-3', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282839259, 'n', '2010', '08', '26', 0, 0, 20101217105620, 0, 0),
(35, 1, 2, 2, 0, 0, '193.62.51.5', 'Away, and mock the time with fairest show: False face must hide what false heart doth know', 'macbeth-4', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282839336, 'n', '2010', '08', '26', 0, 0, 20101217105637, 0, 0),
(36, 1, 2, 2, 0, 0, '193.62.51.5', 'Look like the time, bear welcome in your eye, your hand, your tongue, look like the innocent flower', 'macbeth-5', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282839410, 'n', '2010', '08', '26', 0, 0, 20101217105651, 0, 0),
(37, 1, 2, 2, 0, 0, '193.62.51.5', 'Give sorrow words: the grief that does not speak whispers the o’erfraught heart and bids it break', 'macbeth-6', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282839484, 'n', '2010', '08', '26', 0, 0, 20101217105705, 0, 0),
(38, 1, 2, 2, 0, 0, '193.62.51.5', 'be bloody, bold and resolute; laugh to scorn the power of man', 'macbeth-7', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282839566, 'n', '2010', '08', '26', 0, 0, 20101217105727, 0, 0),
(39, 1, 2, 2, 0, 0, '193.62.51.5', 'Avaunt, and quit my sight! Let the earth hide thee! Thy bones are marrowless, thy blood is cold', 'macbeth-8', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282839718, 'n', '2010', '08', '26', 0, 0, 20101217105759, 0, 0),
(40, 1, 2, 2, 0, 0, '193.62.51.5', 'Naught’s had, all’s spent, where our desire is got without content', 'macbeth-9', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282839792, 'n', '2010', '08', '26', 0, 0, 20101217105813, 0, 0),
(41, 1, 2, 2, 0, 0, '193.62.51.5', 'Is this a dagger which I see before me, the handle towards my hand? Come, let me clutch thee', 'macbeth-10', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282839865, 'n', '2010', '08', '26', 0, 0, 20101217105826, 0, 0),
(42, 1, 2, 2, 0, 0, '193.62.51.5', 'When shall we three meet again? In thunder lightning or in rain?', 'macbeth-11', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282839879, 'n', '2010', '08', '26', 0, 0, 20101217105840, 0, 0),
(43, 1, 3, 2, 0, 0, '193.62.51.5', 'Use any and all means possible to stage your quote as an insult', 'task-1', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282842150, 'n', '2010', '08', '26', 0, 0, 20101217105931, 0, 0),
(44, 1, 3, 2, 0, 0, '193.62.51.5', 'Use any and all means possible to stage your quote as a compliment', 'task-2', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282842161, 'n', '2010', '08', '26', 0, 0, 20101217105943, 0, 0),
(45, 1, 3, 2, 0, 0, '193.62.51.5', 'Use any and all means possible to stage your quote to increase status', 'task-3', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282842236, 'n', '2010', '08', '26', 0, 0, 20101217105957, 0, 0),
(46, 1, 3, 2, 0, 0, '193.62.51.5', 'Use any and all means possible to stage your quote to demonstrate wit', 'task-4', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282842263, 'n', '2010', '08', '26', 0, 0, 20101217110025, 0, 0),
(47, 1, 3, 2, 0, 0, '193.62.51.5', 'Use any and all means possible to stage your quote to seduce', 'task-5', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282842250, 'n', '2010', '08', '26', 0, 0, 20101217110011, 0, 0),
(48, 1, 3, 2, 0, 0, '193.62.51.5', 'Use any and all means possible to stage your quote to illustrate intelligence', 'task-6', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282842327, 'n', '2010', '08', '26', 0, 0, 20101217110428, 0, 0),
(49, 1, 3, 2, 0, 0, '137.205.52.106', 'Use any and all means possible to stage your quote so as to threaten', 'task-7', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282842343, 'n', '2010', '08', '26', 0, 0, 20101123212344, 0, 0),
(50, 1, 3, 2, 0, 0, '193.62.51.5', 'In your group invent a scenario that explains why someone might be provoked to say these words.', 'task-8', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282842345, 'n', '2010', '08', '26', 0, 0, 20101217110447, 0, 0),
(51, 1, 3, 2, 0, 0, '193.62.51.5', 'Improvise a scene that uses all the nouns, adjectives, verbs and adverbs from your quote', 'task-9', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282842465, 'n', '2010', '08', '26', 0, 0, 20101217110546, 0, 0),
(52, 1, 3, 2, 0, 0, '193.62.51.5', 'Create a still image that reflects or illustrates the themes and ideas in your quote', 'task-10', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282842441, 'n', '2010', '08', '26', 0, 0, 20101217110522, 0, 0),
(53, 1, 3, 2, 0, 0, '193.62.51.5', 'Make a wordle-style poster that weights the more important words in your quote as bigger', 'task-11', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282842509, 'n', '2010', '08', '26', 0, 0, 20101217110630, 0, 0),
(54, 1, 3, 2, 0, 0, '127.0.0.1', 'Communicate the meaning of your quote through gesture and action', 'task-12', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282842568, 'n', '2010', '08', '26', 0, 0, 20110816163929, 0, 0),
(55, 1, 3, 2, 0, 0, '193.62.51.5', 'Your quote is a title of a film. Improvise a trailer for that film', 'task-13', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282842691, 'n', '2010', '08', '26', 0, 0, 20101217110832, 0, 0),
(56, 1, 3, 2, 0, 0, '127.0.0.1', 'Improvise a scene that demonstrates the opposite of the quote', 'task-14', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282842699, 'n', '2010', '08', '26', 0, 0, 20110816163940, 0, 0),
(57, 1, 3, 2, 0, 0, '193.62.51.5', 'Everybody in the group says a sentence that puts into words what the character is thinking', 'task-15', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282842694, 'n', '2010', '08', '26', 0, 0, 20101217110735, 0, 0),
(58, 1, 3, 2, 0, 0, '127.0.0.1', 'Who in the world or in history would this have been good advice for and why?', 'task-16', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282842725, 'n', '2010', '08', '26', 0, 0, 20110816163906, 0, 0),
(59, 1, 3, 2, 0, 0, '127.0.0.1', 'Use your quote to create an ‘elevator pitch’ for the character', 'task-17', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282842774, 'n', '2010', '08', '26', 0, 0, 20110816163855, 0, 0),
(60, 1, 3, 2, 0, 0, '127.0.0.1', 'If your quote was a headline in a newspaper, what would the story be? Perform it', 'task-18', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282842807, 'n', '2010', '08', '26', 0, 0, 20110816163828, 0, 0),
(61, 1, 7, 1, 0, 0, '109.148.66.229', 'League', 'league', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1282919126, 'n', '2010', '08', '27', 0, 0, 20110531115328, 0, 0),
(65, 1, 6, 1, 0, 0, '127.0.0.1', 'Download playing cards', 'download-playing-cards-logged-in', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1283266498, 'n', '2010', '08', '31', 0, 0, 20120215091059, 0, 0),
(66, 1, 4, 1, 0, 0, '127.0.0.1', 'Macbeth', 'macbeth', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1283860246, 'n', '2010', '09', '07', 0, 0, 20110816092347, 0, 0),
(67, 1, 4, 1, 0, 0, '127.0.0.1', 'Hamlet', 'hamlet', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1283860295, 'n', '2010', '09', '07', 0, 0, 20110816092337, 0, 0),
(68, 1, 4, 1, 0, 0, '127.0.0.1', 'Bottom', 'bottom', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1283860282, 'n', '2010', '09', '07', 0, 0, 20110816092323, 0, 0),
(69, 1, 4, 1, 0, 0, '127.0.0.1', 'Juliet', 'juliet', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1283860372, 'n', '2010', '09', '07', 0, 0, 20110816092253, 0, 0),
(70, 1, 4, 1, 0, 0, '127.0.0.1', 'King Hamlet', 'king-hamlet', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1283860324, 'n', '2010', '09', '07', 0, 0, 20110816092305, 0, 0),
(71, 1, 4, 1, 0, 0, '127.0.0.1', 'Ophelia', 'ophelia', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1283860407, 'n', '2010', '09', '07', 0, 0, 20110816092228, 0, 0),
(72, 1, 4, 1, 0, 0, '127.0.0.1', 'Lady Macbeth', 'lady-macbeth', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1283860415, 'n', '2010', '09', '07', 0, 0, 20110816092236, 0, 0),
(73, 1, 4, 1, 0, 0, '127.0.0.1', 'Titania', 'titania', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1283860456, 'n', '2010', '09', '07', 0, 0, 20110816092217, 0, 0),
(74, 1, 4, 1, 0, 0, '127.0.0.1', 'Tybalt', 'tybalt', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1283860445, 'n', '2010', '09', '07', 0, 0, 20110816092206, 0, 0),
(75, 1, 4, 1, 0, 0, '127.0.0.1', 'Witch', 'witch', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1283861971, 'n', '2010', '09', '07', 0, 0, 20110815161132, 0, 0),
(84, 1, 9, 2, 0, NULL, '193.62.51.5', 'Max', 'max', 'closed', 'y', 0, 0, 0, 0, 'n', 'n', 1324298174, 'n', '2011', '12', '19', 0, 0, 20111219123816, 0, 0),
(85, 1, 9, 2, 0, NULL, '193.62.51.5', 'max', 'max1', 'closed', 'y', 0, 0, 0, 0, 'n', 'n', 1324303805, 'n', '2011', '12', '19', 0, 0, 20111219141106, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_comments`
--

CREATE TABLE `exp_comments` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(4) unsigned NOT NULL DEFAULT '1',
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT 'o',
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `url` varchar(75) NOT NULL,
  `location` varchar(50) NOT NULL,
  `ip_address` varchar(16) NOT NULL,
  `comment_date` int(10) NOT NULL,
  `edit_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` mediumtext NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `entry_id` (`entry_id`),
  KEY `author_id` (`author_id`),
  KEY `status` (`status`),
  KEY `site_id` (`site_id`),
  KEY `comment_date_idx` (`comment_date`),
  KEY `channel_id` (`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_comment_subscriptions`
--

CREATE TABLE `exp_comment_subscriptions` (
  `subscription_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `member_id` int(10) DEFAULT '0',
  `email` varchar(50) DEFAULT NULL,
  `subscription_date` varchar(10) DEFAULT NULL,
  `notification_sent` char(1) DEFAULT 'n',
  `hash` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`subscription_id`),
  KEY `entry_id` (`entry_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_cp_log`
--

CREATE TABLE `exp_cp_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `username` varchar(32) NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `act_date` int(10) NOT NULL,
  `action` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=198 ;

--
-- Dumping data for table `exp_cp_log`
--

INSERT INTO `exp_cp_log` (`id`, `site_id`, `member_id`, `username`, `ip_address`, `act_date`, `action`) VALUES
(1, 1, 1, 'jamescv6', '127.0.0.1', 1282657318, 'Logged in'),
(2, 1, 1, 'jamescv6', '127.0.0.1', 1282658747, 'Weblog Deleted:&nbsp;&nbsp;Default Site Weblog'),
(3, 1, 1, 'jamescv6', '127.0.0.1', 1282658772, 'Category Group Deleted:&nbsp;&nbsp;Default Category Group'),
(4, 1, 1, 'jamescv6', '127.0.0.1', 1282658778, 'Field group Deleted:&nbsp;&nbsp;Default Field Group'),
(5, 1, 1, 'jamescv6', '127.0.0.1', 1282662210, 'Field Group Created:&nbsp;&nbsp;Quotes'),
(6, 1, 1, 'jamescv6', '127.0.0.1', 1282662220, 'Field Group Created:&nbsp;&nbsp;Tasks'),
(7, 1, 1, 'jamescv6', '127.0.0.1', 1282662230, 'Field Group Created:&nbsp;&nbsp;Characters'),
(8, 1, 1, 'jamescv6', '127.0.0.1', 1282664384, 'Field Group Created:&nbsp;&nbsp;Other Pages'),
(9, 1, 1, 'jamescv6', '127.0.0.1', 1282666034, 'Weblog Created:&nbsp;&nbsp;Quotes'),
(10, 1, 1, 'jamescv6', '127.0.0.1', 1282666116, 'Weblog Created:&nbsp;&nbsp;Tasks'),
(11, 1, 1, 'jamescv6', '127.0.0.1', 1282666141, 'Weblog Created:&nbsp;&nbsp;Characters'),
(12, 1, 1, 'jamescv6', '127.0.0.1', 1282666210, 'Weblog Created:&nbsp;&nbsp;Rules'),
(13, 1, 1, 'jamescv6', '127.0.0.1', 1282666232, 'Weblog Created:&nbsp;&nbsp;Other Pages'),
(14, 1, 1, 'jamescv6', '127.0.0.1', 1282729683, 'Member Group Updated:&nbsp;&nbsp;Admin'),
(15, 1, 1, 'jamescv6', '127.0.0.1', 1282729683, 'Member Group Updated:&nbsp;&nbsp;Admin'),
(16, 1, 1, 'jamescv6', '127.0.0.1', 1282729902, 'Member profile created:&nbsp;&nbsp;maxa'),
(17, 1, 1, 'jamescv6', '86.176.24.194', 1282734330, 'Logged in'),
(18, 1, 2, 'maxa', '193.62.51.5', 1282742482, 'Logged in'),
(19, 1, 1, 'jamescv6', '86.176.24.194', 1282743009, 'Logged in'),
(20, 1, 1, 'jamescv6', '86.176.29.184', 1282831989, 'Logged in'),
(21, 1, 2, 'maxa', '193.62.51.5', 1282835370, 'Logged in'),
(22, 1, 1, 'jamescv6', '86.178.97.186', 1282918111, 'Weblog Created:&nbsp;&nbsp;League'),
(23, 1, 1, 'jamescv6', '86.178.97.186', 1282918127, 'Field Group Created:&nbsp;&nbsp;League'),
(24, 1, 2, 'maxa', '193.62.51.5', 1282922175, 'Logged in'),
(25, 1, 1, 'jamescv6', '86.178.97.186', 1282923827, 'Member Group Updated:&nbsp;&nbsp;Admin'),
(26, 1, 1, 'jamescv6', '82.36.108.7', 1282931513, 'Logged in'),
(27, 1, 1, 'jamescv6', '90.196.111.209', 1283246238, 'Logged in'),
(28, 1, 1, 'jamescv6', '86.185.90.76', 1283248192, 'Logged in'),
(29, 1, 1, 'jamescv6', '82.36.108.7', 1283363457, 'Logged in'),
(30, 1, 2, 'maxa', '193.62.51.5', 1283508770, 'Logged in'),
(31, 1, 2, 'maxa', '193.62.51.5', 1283510581, 'Logged out'),
(32, 1, 2, 'maxa', '193.62.51.5', 1283771238, 'Logged in'),
(33, 1, 2, 'maxa', '193.62.51.5', 1283782023, 'Logged in'),
(34, 1, 1, 'jamescv6', '86.173.132.160', 1283851256, 'Logged in'),
(35, 1, 1, 'jamescv6', '86.173.132.160', 1283859103, 'Logged in'),
(36, 1, 1, 'jamescv6', '86.173.132.160', 1283859156, 'Logged in'),
(37, 1, 2, 'maxa', '193.62.51.5', 1283863503, 'Logged in'),
(38, 1, 2, 'maxa', '193.62.51.5', 1283871484, 'Logged in'),
(39, 1, 2, 'maxa', '193.62.51.5', 1283950458, 'Logged in'),
(40, 1, 2, 'maxa', '193.62.51.5', 1284026933, 'Logged in'),
(41, 1, 2, 'maxa', '193.62.51.5', 1284030789, 'Logged in'),
(42, 1, 2, 'maxa', '193.62.51.5', 1284125975, 'Logged in'),
(43, 1, 1, 'jamescv6', '86.182.238.237', 1284388386, 'Logged in'),
(44, 1, 1, 'jamescv6', '82.36.108.7', 1284501691, 'Logged in'),
(45, 1, 1, 'jamescv6', '86.173.132.165', 1284549452, 'Logged in'),
(46, 1, 1, 'jamescv6', '86.173.132.165', 1284630615, 'Member Group Updated:&nbsp;&nbsp;Guests'),
(47, 1, 1, 'jamescv6', '86.173.132.165', 1284630624, 'Logged out'),
(48, 1, 1, 'jamescv6', '86.173.132.165', 1284630678, 'Logged in'),
(49, 1, 1, 'jamescv6', '86.173.132.165', 1284630708, 'Member Group Updated:&nbsp;&nbsp;Guests'),
(50, 1, 1, 'jamescv6', '86.173.132.165', 1284630734, 'Member Group Updated:&nbsp;&nbsp;Admin'),
(51, 1, 2, 'maxa', '193.62.51.5', 1285670626, 'Logged in'),
(52, 1, 2, 'maxa', '193.62.51.5', 1285672432, 'Logged in'),
(53, 1, 1, 'jamescv6', '86.182.93.115', 1285672881, 'Logged in'),
(54, 1, 2, 'maxa', '193.62.51.5', 1285672990, 'Logged in'),
(55, 1, 2, 'maxa', '193.62.51.5', 1285758477, 'Logged in'),
(56, 1, 2, 'maxa', '193.62.51.5', 1285759593, 'Logged in'),
(57, 1, 2, 'maxa', '193.62.51.5', 1287412091, 'Logged in'),
(58, 1, 1, 'jamescv6', '86.182.56.17', 1287412670, 'Logged in'),
(59, 1, 1, 'jamescv6', '86.178.103.4', 1289903841, 'Logged in'),
(60, 1, 1, 'jamescv6', '86.178.103.4', 1289904391, 'Member Group Created:&nbsp;&nbsp;Animateurs'),
(61, 1, 1, 'jamescv6', '86.178.103.4', 1289904430, 'Member profile created:&nbsp;&nbsp;animateur'),
(62, 1, 1, 'jamescv6', '86.178.103.4', 1289904442, 'Logged out'),
(63, 1, 3, 'animateur', '86.178.103.4', 1289904448, 'Logged in'),
(64, 1, 3, 'animateur', '86.178.103.4', 1289904539, 'Logged out'),
(65, 1, 1, 'jamescv6', '86.178.103.4', 1289904545, 'Logged in'),
(66, 1, 1, 'jamescv6', '86.178.103.4', 1289904873, 'Member Group Updated:&nbsp;&nbsp;Animateurs'),
(67, 1, 1, 'jamescv6', '86.178.103.4', 1289904875, 'Logged out'),
(68, 1, 3, 'animateur', '86.178.103.4', 1289904881, 'Logged in'),
(69, 1, 2, 'maxa', '87.114.251.150', 1290343432, 'Logged in'),
(70, 1, 1, 'jamescv6', '90.196.111.69', 1290427473, 'Logged in'),
(71, 1, 1, 'jamescv6', '90.196.111.69', 1290439709, 'Logged in'),
(72, 1, 2, 'maxa', '137.205.52.106', 1290460563, 'Logged in'),
(73, 1, 2, 'maxa', '137.205.52.106', 1290546388, 'Logged in'),
(74, 1, 2, 'maxa', '193.62.51.5', 1290697988, 'Logged in'),
(75, 1, 2, 'maxa', '193.62.51.5', 1290698597, 'Logged out'),
(76, 1, 2, 'maxa', '193.62.51.5', 1291641369, 'Logged in'),
(77, 1, 3, 'animateur', '62.171.194.12', 1291835720, 'Logged in'),
(78, 1, 3, 'animateur', '62.171.194.13', 1292331715, 'Logged in'),
(79, 1, 2, 'maxa', '193.62.51.5', 1292586118, 'Logged in'),
(80, 1, 3, 'animateur', '193.62.51.5', 1292605815, 'Logged in'),
(81, 1, 2, 'maxa', '193.62.51.5', 1297947172, 'Logged in'),
(82, 1, 2, 'maxa', '193.62.51.5', 1297947506, 'Logged out'),
(83, 1, 3, 'animateur', '80.193.72.130', 1299671048, 'Logged in'),
(84, 1, 3, 'animateur', '79.77.5.152', 1300693249, 'Logged in'),
(85, 1, 3, 'animateur', '46.60.252.85', 1305213348, 'Logged in'),
(86, 1, 3, 'animateur', '46.60.252.99', 1306495330, 'Logged in'),
(87, 1, 3, 'animateur', '109.148.66.229', 1306842668, 'Logged in'),
(88, 1, 2, 'maxa', '193.62.51.5', 1311696289, 'Logged in'),
(89, 1, 2, 'maxa', '193.62.51.5', 1312550003, 'Logged in'),
(90, 1, 1, 'jamescv6', '127.0.0.1', 1313420368, 'Logged in'),
(91, 1, 1, 'jamescv6', '127.0.0.1', 1313418285, 'Logged in'),
(92, 1, 1, 'jamescv6', '127.0.0.1', 1313482730, 'Logged in'),
(93, 1, 1, 'jamescv6', '127.0.0.1', 1313482763, 'Member profile created:&nbsp;&nbsp;josh'),
(94, 1, 1, 'jamescv6', '127.0.0.1', 1313482808, 'Screen name was changed to:&nbsp;&nbsp;Super Admin 2'),
(95, 1, 1, 'jamescv6', '127.0.0.1', 1313485894, 'Logged out'),
(96, 1, 4, 'josh', '127.0.0.1', 1313486180, 'Logged in'),
(97, 1, 4, 'josh', '127.0.0.1', 1313488961, 'Logged in'),
(98, 1, 4, 'josh', '127.0.0.1', 1313500467, 'Logged in'),
(99, 1, 4, 'josh', '127.0.0.1', 1313500515, 'Logged in'),
(100, 1, 4, 'josh', '127.0.0.1', 1313502862, 'Logged out'),
(101, 1, 4, 'josh', '127.0.0.1', 1313502868, 'Logged in'),
(102, 1, 4, 'josh', '127.0.0.1', 1313503093, 'Logged out'),
(103, 1, 4, 'josh', '127.0.0.1', 1313503141, 'Logged in'),
(104, 1, 4, 'josh', '127.0.0.1', 1313503143, 'Logged out'),
(105, 1, 4, 'josh', '127.0.0.1', 1313503169, 'Logged in'),
(106, 1, 4, 'josh', '127.0.0.1', 1313503277, 'Logged out'),
(107, 1, 4, 'josh', '127.0.0.1', 1313503306, 'Logged in'),
(108, 1, 4, 'josh', '127.0.0.1', 1313504118, 'Logged out'),
(109, 1, 4, 'josh', '127.0.0.1', 1313505089, 'Logged in'),
(110, 1, 4, 'josh', '127.0.0.1', 1313505659, 'Logged in'),
(111, 1, 4, 'josh', '127.0.0.1', 1313506105, 'Category Group Created:&nbsp;&nbsp;members'),
(112, 1, 4, 'josh', '127.0.0.1', 1313506639, 'Logged in'),
(113, 1, 4, 'josh', '127.0.0.1', 1313508922, 'Logged in'),
(114, 1, 4, 'josh', '213.120.146.160', 1313510150, 'Logged in'),
(115, 1, 4, 'josh', '213.120.146.160', 1314028322, 'Logged in'),
(116, 1, 4, 'josh', '127.0.0.1', 1314028562, 'Logged in'),
(117, 1, 4, 'josh', '127.0.0.1', 1314028576, 'Field Group Created:&nbsp;Comments'),
(118, 1, 4, 'josh', '127.0.0.1', 1314028646, 'Channel Created:&nbsp;&nbsp;Comments'),
(119, 1, 4, 'josh', '127.0.0.1', 1314029018, 'Logged in'),
(120, 1, 4, 'josh', '127.0.0.1', 1314029369, 'Logged out'),
(121, 1, 4, 'josh', '127.0.0.1', 1314029457, 'Logged in'),
(122, 1, 4, 'josh', '127.0.0.1', 1314030143, 'Logged out'),
(123, 1, 4, 'josh', '127.0.0.1', 1314030215, 'Logged in'),
(124, 1, 4, 'josh', '127.0.0.1', 1314276345, 'Logged in'),
(125, 1, 4, 'josh', '127.0.0.1', 1314277489, 'Logged out'),
(126, 1, 4, 'josh', '127.0.0.1', 1314277590, 'Logged in'),
(127, 1, 4, 'josh', '127.0.0.1', 1314277641, 'Logged out'),
(128, 1, 4, 'josh', '127.0.0.1', 1314279352, 'Logged in'),
(129, 1, 4, 'josh', '127.0.0.1', 1314284934, 'Logged out'),
(130, 1, 4, 'josh', '127.0.0.1', 1314284964, 'Logged in'),
(131, 1, 4, 'josh', '127.0.0.1', 1314285161, 'Logged out'),
(132, 1, 4, 'josh', '127.0.0.1', 1314285177, 'Logged in'),
(133, 1, 4, 'josh', '127.0.0.1', 1314288860, 'Logged in'),
(134, 1, 4, 'josh', '127.0.0.1', 1314347011, 'Logged in'),
(135, 1, 4, 'josh', '127.0.0.1', 1314347120, 'Logged out'),
(136, 1, 4, 'josh', '127.0.0.1', 1314347147, 'Logged in'),
(137, 1, 4, 'josh', '127.0.0.1', 1314347772, 'Member Group Created:&nbsp;&nbsp;Members'),
(138, 1, 4, 'josh', '127.0.0.1', 1314347924, 'Logged in'),
(139, 1, 4, 'josh', '127.0.0.1', 1314347938, 'Logged out'),
(140, 1, 4, 'josh', '127.0.0.1', 1314347979, 'Logged in'),
(141, 1, 4, 'josh', '127.0.0.1', 1314348132, 'Logged in'),
(142, 1, 4, 'josh', '127.0.0.1', 1314348563, 'Logged in'),
(143, 1, 4, 'josh', '127.0.0.1', 1314350437, 'Logged in'),
(144, 1, 4, 'josh', '127.0.0.1', 1314350487, 'Member Group Updated:&nbsp;&nbsp;Members'),
(145, 1, 4, 'josh', '127.0.0.1', 1314350529, 'Logged in'),
(146, 1, 4, 'josh', '127.0.0.1', 1314350547, 'Member Group Updated:&nbsp;&nbsp;Members'),
(147, 1, 4, 'josh', '127.0.0.1', 1314352919, 'Channel Created:&nbsp;&nbsp;Team'),
(148, 1, 4, 'josh', '127.0.0.1', 1314352944, 'Field Group Created:&nbsp;Teams'),
(149, 1, 4, 'josh', '127.0.0.1', 1314357504, 'Logged in'),
(150, 1, 4, 'josh', '127.0.0.1', 1314357568, 'Member Group Updated:&nbsp;&nbsp;Members'),
(151, 1, 6, 'tester3', '127.0.0.1', 1314357626, 'Logged out'),
(152, 1, 4, 'josh', '127.0.0.1', 1314357628, 'Logged in'),
(153, 1, 4, 'josh', '127.0.0.1', 1314358477, 'Logged out'),
(154, 1, 4, 'josh', '127.0.0.1', 1314358498, 'Logged out'),
(155, 1, 4, 'josh', '127.0.0.1', 1314358619, 'Logged in'),
(156, 1, 4, 'josh', '127.0.0.1', 1314358625, 'Logged in'),
(157, 1, 4, 'josh', '127.0.0.1', 1314367297, 'Logged in'),
(158, 1, 4, 'josh', '127.0.0.1', 1314371958, 'Logged in'),
(159, 1, 4, 'josh', '127.0.0.1', 1314372079, 'Logged in'),
(160, 1, 4, 'josh', '127.0.0.1', 1314373190, 'Logged in'),
(161, 1, 1, 'jamescv6', '213.120.146.160', 1316085319, 'Logged in'),
(162, 1, 2, 'maxa', '193.62.51.5', 1316085608, 'Logged in'),
(163, 1, 1, 'jamescv6', '127.0.0.1', 1322224580, 'Logged in'),
(164, 1, 1, 'jamescv6', '127.0.0.1', 1322224684, 'Logged in'),
(165, 1, 1, 'jamescv6', '127.0.0.1', 1322231356, 'Logged in'),
(166, 1, 1, 'jamescv6', '90.214.8.4', 1322238378, 'Logged in'),
(167, 1, 1, 'jamescv6', '90.214.8.4', 1322238442, 'Member profile created:&nbsp;&nbsp;paulsutton'),
(168, 1, 1, 'jamescv6', '90.214.8.4', 1322648157, 'Logged in'),
(169, 1, 1, 'jamescv6', '213.120.146.160', 1324292623, 'Logged in'),
(170, 1, 1, 'jamescv6', '213.120.146.160', 1324292767, 'Logged out'),
(171, 1, 1, 'jamescv6', '213.120.146.160', 1324298072, 'Logged in'),
(172, 1, 1, 'jamescv6', '213.120.146.160', 1328001170, 'Logged in'),
(173, 1, 4, 'josh', '213.120.146.160', 1328001178, 'Logged in'),
(174, 1, 4, 'josh', '213.120.146.160', 1328001251, 'Logged in'),
(175, 1, 4, 'josh', '213.120.146.160', 1328001347, 'Logged in'),
(176, 1, 4, 'josh', '213.120.146.160', 1328001393, 'Logged in'),
(177, 1, 1, 'jamescv6', '90.214.166.184', 1328525448, 'Logged in'),
(178, 1, 7, 'paulsutton', '213.120.146.160', 1328525870, 'Logged in'),
(179, 1, 1, 'jamescv6', '90.214.166.184', 1328526080, 'Logged in'),
(180, 1, 1, 'jamescv6', '90.214.166.184', 1328526106, 'Member Group Updated:&nbsp;&nbsp;Admin'),
(181, 1, 1, 'jamescv6', '90.214.166.184', 1328526355, 'Member Group Updated:&nbsp;&nbsp;Admin'),
(182, 1, 7, 'paulsutton', '213.120.146.160', 1328526546, 'Logged out'),
(183, 1, 4, 'josh', '213.120.146.160', 1328526558, 'Logged in'),
(184, 1, 4, 'josh', '213.120.146.160', 1328526679, 'Member Group Updated:&nbsp;&nbsp;Admin'),
(185, 1, 4, 'josh', '213.120.146.160', 1328526714, 'SuperAdmin Logging In as User:&nbsp;paulsutton'),
(186, 1, 7, 'paulsutton', '213.120.146.160', 1328526736, 'Logged out'),
(187, 1, 4, 'josh', '213.120.146.160', 1328526755, 'Logged in'),
(188, 1, 4, 'josh', '213.120.146.160', 1328526799, 'Member Group Updated:&nbsp;&nbsp;Admin'),
(189, 1, 4, 'josh', '213.120.146.160', 1328526825, 'SuperAdmin Logging In as User:&nbsp;paulsutton'),
(190, 1, 1, 'jamescv6', '90.214.166.184', 1328526994, 'Member Group Updated:&nbsp;&nbsp;Admin'),
(191, 1, 1, 'jamescv6', '90.214.166.184', 1328527088, 'Member Group Updated:&nbsp;&nbsp;Admin'),
(192, 1, 1, 'jamescv6', '90.214.166.184', 1328527112, 'Logged out'),
(193, 1, 7, 'paulsutton', '90.214.166.184', 1328527132, 'Logged in'),
(194, 1, 7, 'paulsutton', '193.62.51.5', 1328723229, 'Logged in'),
(195, 1, 4, 'josh', '127.0.0.1', 1329296104, 'Logged in'),
(196, 1, 4, 'josh', '127.0.0.1', 1329296699, 'Logged in'),
(197, 1, 4, 'josh', '127.0.0.1', 1329296843, 'Logged in');

-- --------------------------------------------------------

--
-- Table structure for table `exp_cp_search_index`
--

CREATE TABLE `exp_cp_search_index` (
  `search_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `controller` varchar(20) DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `access` varchar(50) DEFAULT NULL,
  `keywords` text,
  PRIMARY KEY (`search_id`),
  FULLTEXT KEY `keywords` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache`
--

CREATE TABLE `exp_email_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `total_sent` int(6) unsigned NOT NULL,
  `from_name` varchar(70) NOT NULL,
  `from_email` varchar(70) NOT NULL,
  `recipient` mediumtext NOT NULL,
  `cc` mediumtext NOT NULL,
  `bcc` mediumtext NOT NULL,
  `recipient_array` longtext NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` longtext NOT NULL,
  `plaintext_alt` longtext NOT NULL,
  `mailinglist` char(1) NOT NULL DEFAULT 'n',
  `mailtype` varchar(6) NOT NULL,
  `text_fmt` varchar(40) NOT NULL,
  `wordwrap` char(1) NOT NULL DEFAULT 'y',
  `priority` char(1) NOT NULL DEFAULT '3',
  PRIMARY KEY (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache_mg`
--

CREATE TABLE `exp_email_cache_mg` (
  `cache_id` int(6) unsigned NOT NULL,
  `group_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache_ml`
--

CREATE TABLE `exp_email_cache_ml` (
  `cache_id` int(6) unsigned NOT NULL,
  `list_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`list_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_console_cache`
--

CREATE TABLE `exp_email_console_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `member_id` int(10) unsigned NOT NULL,
  `member_name` varchar(50) NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `recipient` varchar(70) NOT NULL,
  `recipient_name` varchar(50) NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_tracker`
--

CREATE TABLE `exp_email_tracker` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email_date` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_ip` varchar(16) NOT NULL,
  `sender_email` varchar(75) NOT NULL,
  `sender_username` varchar(50) NOT NULL,
  `number_recipients` int(4) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`email_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_entry_ping_status`
--

CREATE TABLE `exp_entry_ping_status` (
  `entry_id` int(10) unsigned NOT NULL,
  `ping_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry_id`,`ping_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_entry_versioning`
--

CREATE TABLE `exp_entry_versioning` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `version_date` int(10) NOT NULL,
  `version_data` longtext NOT NULL,
  PRIMARY KEY (`version_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_extensions`
--

CREATE TABLE `exp_extensions` (
  `extension_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL DEFAULT '',
  `method` varchar(50) NOT NULL DEFAULT '',
  `hook` varchar(50) NOT NULL DEFAULT '',
  `settings` mediumtext NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '10',
  `version` varchar(10) NOT NULL DEFAULT '',
  `enabled` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `exp_extensions`
--

INSERT INTO `exp_extensions` (`extension_id`, `class`, `method`, `hook`, `settings`, `priority`, `version`, `enabled`) VALUES
(1, 'Cp_jquery', 'add_js', 'show_full_control_panel_end', 'a:2:{s:10:"jquery_src";s:63:"http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js";s:13:"jquery_ui_src";s:68:"http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.min.js";}', 1, '1.1.1', 'n'),
(2, 'Ez_edit_menu', 'add_menu', 'show_full_control_panel_end', '', 8, '1.0.2', 'n'),
(3, 'Fieldframe', 'sessions_start', 'sessions_start', 'a:3:{s:14:"fieldtypes_url";s:54:"http://2ndfolio.local/dashboard/extensions/fieldtypes/";s:15:"fieldtypes_path";s:60:"/Users/imac1/Sites/2ndfolio/dashboard/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"y";}', 1, '1.4.5', 'n'),
(4, 'Fieldframe', 'publish_admin_edit_field_type_pulldown', 'publish_admin_edit_field_type_pulldown', 'a:3:{s:14:"fieldtypes_url";s:54:"http://2ndfolio.local/dashboard/extensions/fieldtypes/";s:15:"fieldtypes_path";s:60:"/Users/imac1/Sites/2ndfolio/dashboard/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"y";}', 10, '1.4.5', 'n'),
(5, 'Fieldframe', 'publish_admin_edit_field_type_cellone', 'publish_admin_edit_field_type_cellone', 'a:3:{s:14:"fieldtypes_url";s:54:"http://2ndfolio.local/dashboard/extensions/fieldtypes/";s:15:"fieldtypes_path";s:60:"/Users/imac1/Sites/2ndfolio/dashboard/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"y";}', 10, '1.4.5', 'n'),
(6, 'Fieldframe', 'publish_admin_edit_field_type_celltwo', 'publish_admin_edit_field_type_celltwo', 'a:3:{s:14:"fieldtypes_url";s:54:"http://2ndfolio.local/dashboard/extensions/fieldtypes/";s:15:"fieldtypes_path";s:60:"/Users/imac1/Sites/2ndfolio/dashboard/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"y";}', 10, '1.4.5', 'n'),
(7, 'Fieldframe', 'publish_admin_edit_field_extra_row', 'publish_admin_edit_field_extra_row', 'a:3:{s:14:"fieldtypes_url";s:54:"http://2ndfolio.local/dashboard/extensions/fieldtypes/";s:15:"fieldtypes_path";s:60:"/Users/imac1/Sites/2ndfolio/dashboard/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"y";}', 10, '1.4.5', 'n'),
(8, 'Fieldframe', 'publish_admin_edit_field_format', 'publish_admin_edit_field_format', 'a:3:{s:14:"fieldtypes_url";s:54:"http://2ndfolio.local/dashboard/extensions/fieldtypes/";s:15:"fieldtypes_path";s:60:"/Users/imac1/Sites/2ndfolio/dashboard/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"y";}', 10, '1.4.5', 'n'),
(9, 'Fieldframe', 'publish_admin_edit_field_js', 'publish_admin_edit_field_js', 'a:3:{s:14:"fieldtypes_url";s:54:"http://2ndfolio.local/dashboard/extensions/fieldtypes/";s:15:"fieldtypes_path";s:60:"/Users/imac1/Sites/2ndfolio/dashboard/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"y";}', 10, '1.4.5', 'n'),
(10, 'Fieldframe', 'show_full_control_panel_start', 'show_full_control_panel_start', 'a:3:{s:14:"fieldtypes_url";s:54:"http://2ndfolio.local/dashboard/extensions/fieldtypes/";s:15:"fieldtypes_path";s:60:"/Users/imac1/Sites/2ndfolio/dashboard/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"y";}', 10, '1.4.5', 'n'),
(11, 'Fieldframe', 'show_full_control_panel_end', 'show_full_control_panel_end', 'a:3:{s:14:"fieldtypes_url";s:54:"http://2ndfolio.local/dashboard/extensions/fieldtypes/";s:15:"fieldtypes_path";s:60:"/Users/imac1/Sites/2ndfolio/dashboard/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"y";}', 10, '1.4.5', 'n'),
(12, 'Fieldframe', 'publish_form_field_unique', 'publish_form_field_unique', 'a:3:{s:14:"fieldtypes_url";s:54:"http://2ndfolio.local/dashboard/extensions/fieldtypes/";s:15:"fieldtypes_path";s:60:"/Users/imac1/Sites/2ndfolio/dashboard/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"y";}', 10, '1.4.5', 'n'),
(13, 'Fieldframe', 'submit_new_entry_start', 'submit_new_entry_start', 'a:3:{s:14:"fieldtypes_url";s:54:"http://2ndfolio.local/dashboard/extensions/fieldtypes/";s:15:"fieldtypes_path";s:60:"/Users/imac1/Sites/2ndfolio/dashboard/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"y";}', 10, '1.4.5', 'n'),
(14, 'Fieldframe', 'submit_new_entry_end', 'submit_new_entry_end', 'a:3:{s:14:"fieldtypes_url";s:54:"http://2ndfolio.local/dashboard/extensions/fieldtypes/";s:15:"fieldtypes_path";s:60:"/Users/imac1/Sites/2ndfolio/dashboard/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"y";}', 10, '1.4.5', 'n'),
(15, 'Fieldframe', 'publish_form_start', 'publish_form_start', 'a:3:{s:14:"fieldtypes_url";s:54:"http://2ndfolio.local/dashboard/extensions/fieldtypes/";s:15:"fieldtypes_path";s:60:"/Users/imac1/Sites/2ndfolio/dashboard/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"y";}', 10, '1.4.5', 'n'),
(16, 'Fieldframe', 'weblog_standalone_form_start', 'weblog_standalone_form_start', 'a:3:{s:14:"fieldtypes_url";s:54:"http://2ndfolio.local/dashboard/extensions/fieldtypes/";s:15:"fieldtypes_path";s:60:"/Users/imac1/Sites/2ndfolio/dashboard/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"y";}', 10, '1.4.5', 'n'),
(17, 'Fieldframe', 'weblog_standalone_form_end', 'weblog_standalone_form_end', 'a:3:{s:14:"fieldtypes_url";s:54:"http://2ndfolio.local/dashboard/extensions/fieldtypes/";s:15:"fieldtypes_path";s:60:"/Users/imac1/Sites/2ndfolio/dashboard/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"y";}', 10, '1.4.5', 'n'),
(18, 'Fieldframe', 'weblog_entries_tagdata', 'weblog_entries_tagdata', 'a:3:{s:14:"fieldtypes_url";s:54:"http://2ndfolio.local/dashboard/extensions/fieldtypes/";s:15:"fieldtypes_path";s:60:"/Users/imac1/Sites/2ndfolio/dashboard/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"y";}', 1, '1.4.5', 'n'),
(19, 'Fieldframe', 'lg_addon_update_register_source', 'lg_addon_update_register_source', 'a:3:{s:14:"fieldtypes_url";s:54:"http://2ndfolio.local/dashboard/extensions/fieldtypes/";s:15:"fieldtypes_path";s:60:"/Users/imac1/Sites/2ndfolio/dashboard/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"y";}', 10, '1.4.5', 'n'),
(20, 'Fieldframe', 'lg_addon_update_register_addon', 'lg_addon_update_register_addon', 'a:3:{s:14:"fieldtypes_url";s:54:"http://2ndfolio.local/dashboard/extensions/fieldtypes/";s:15:"fieldtypes_path";s:60:"/Users/imac1/Sites/2ndfolio/dashboard/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"y";}', 10, '1.4.5', 'n'),
(21, 'mx_title_control', 'show_full_control_panel_end', 'show_full_control_panel_end', 'a:1:{i:1;a:1:{s:13:"multilanguage";s:1:"n";}}', 10, '0.0.3', 'n'),
(30, 'Fieldframe', 'forward_hook:show_full_control_panel_end:99', 'show_full_control_panel_end', 'a:3:{s:14:"fieldtypes_url";s:54:"http://2ndfolio.local/dashboard/extensions/fieldtypes/";s:15:"fieldtypes_path";s:60:"/Users/imac1/Sites/2ndfolio/dashboard/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"y";}', 99, '1.4.5', 'n'),
(31, 'Fieldframe', 'forward_hook:sessions_start:99', 'sessions_start', 'a:3:{s:14:"fieldtypes_url";s:54:"http://2ndfolio.local/dashboard/extensions/fieldtypes/";s:15:"fieldtypes_path";s:60:"/Users/imac1/Sites/2ndfolio/dashboard/extensions/fieldtypes/";s:17:"check_for_updates";s:1:"y";}', 99, '1.4.5', 'n'),
(34, 'Matrix_ext', 'channel_entries_tagdata', 'channel_entries_tagdata', '', 10, '2.2.2.1', 'y'),
(37, 'System_messages_ext', 'output_show_message', 'output_show_message', 'a:1:{i:1;a:6:{s:11:"enable_ajax";s:1:"y";s:19:"submission_template";s:17:"home/notification";s:16:"general_template";s:17:"home/notification";s:13:"accessibility";s:7:"default";s:7:"actions";a:1:{i:0;s:0:"";}s:16:"action_templates";a:1:{i:0;s:0:"";}}}', 1, '2.2.2', 'y'),
(38, 'System_messages_ext', 'extend_output_class', 'sessions_start', 'a:1:{i:1;a:6:{s:11:"enable_ajax";s:1:"y";s:19:"submission_template";s:17:"home/notification";s:16:"general_template";s:17:"home/notification";s:13:"accessibility";s:7:"default";s:7:"actions";a:1:{i:0;s:0:"";}s:16:"action_templates";a:1:{i:0;s:0:"";}}}', 1, '2.2.2', 'y'),
(39, 'Safecracker_ext', 'form_declaration_modify_data', 'form_declaration_modify_data', 'a:2:{s:15:"override_status";a:1:{i:1;a:7:{i:4;s:1:"0";i:8;s:1:"0";i:7;s:1:"0";i:6;s:1:"0";i:2;s:1:"0";i:5;s:1:"0";i:3;s:1:"0";}}s:14:"license_number";b:0;}', 10, '2.1', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_ff_fieldtypes`
--

CREATE TABLE `exp_ff_fieldtypes` (
  `fieldtype_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL DEFAULT '',
  `version` varchar(10) NOT NULL DEFAULT '',
  `settings` mediumtext NOT NULL,
  `enabled` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`fieldtype_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `exp_ff_fieldtypes`
--

INSERT INTO `exp_ff_fieldtypes` (`fieldtype_id`, `class`, `version`, `settings`, `enabled`) VALUES
(1, 'ff_checkbox', '1.4.5', 'a:0:{}', 'y'),
(2, 'mx_universal_editor', '1.0.2', 'a:35:{s:14:"tinymce_enable";s:1:"1";s:11:"tinymce_url";s:97:"http://2ndfolio.net/dashboard/extensions/fieldtypes/mx_universal_editor/scripts/editors/tiny_mce/";s:12:"script_block";s:176:"<script type=\\''text/javascript\\''src=\\''http://2ndfolio.net/dashboard/extensions/fieldtypes/mx_universal_editor/scripts/editors/tiny_mce/tiny_mce.js\\'' charset=\\''utf-8\\''></script>";s:15:"markitup_enable";s:1:"1";s:11:"markitup_js";s:115:"http://2ndfolio.net/dashboard/extensions/fieldtypes/mx_universal_editor/scripts/editors/markitup/jquery.markitup.js";s:18:"markitup_skin_path";s:110:"http://2ndfolio.net/dashboard/extensions/fieldtypes/mx_universal_editor/scripts/editors/markitup/skins/simple/";s:17:"markitup_skin_css";s:9:"style.css";s:16:"markitup_set_css";s:9:"style.css";s:15:"markitup_set_js";s:6:"set.js";s:17:"linklist_url_type";s:14:"url_title_path";s:13:"path_settings";s:8:"blog_url";s:10:"livesearch";s:1:"1";s:13:"cleanfilename";s:1:"0";s:9:"flt_image";s:27:"*.jpg, *.jpeg, *.gif, *.png";s:14:"flt_image_size";s:5:"10240";s:9:"flt_media";s:121:"*.swf, *.dcr, *.mov, *.qt, *.mpg, *.mp3, *.mp4, *.mpeg, *.avi, *.wmv, *.wm, *.asf, *.asx, *.wmx, *.wvx, *.rm, *.ra, *.ram";s:14:"flt_media_size";s:5:"10240";s:8:"flt_file";s:3:"*.*";s:13:"flt_file_size";s:5:"10240";s:12:"thumbquality";s:2:"80";s:12:"imagequality";s:2:"80";s:9:"thumbsize";s:2:"80";s:12:"resize_width";s:0:"";s:13:"resize_height";s:0:"";s:10:"pagination";s:1:"0";s:10:"image_view";s:5:"thumb";s:16:"watermark_enable";s:1:"0";s:11:"watermark_h";s:5:"right";s:11:"watermark_v";s:6:"bottom";s:17:"watermark_padding";s:2:"10";s:17:"watermark_opacity";s:3:"100";s:14:"watermark_path";s:0:"";s:12:"c_tab_enable";s:1:"0";s:11:"config_file";s:10:"article.js";s:11:"preferences";s:1:"1";}', 'y'),
(3, 'ff_select', '1.4.5', 'a:0:{}', 'y'),
(4, 'ff_matrix', '1.3.5', 'a:0:{}', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_ff_fieldtype_hooks`
--

CREATE TABLE `exp_ff_fieldtype_hooks` (
  `hook_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL DEFAULT '',
  `hook` varchar(50) NOT NULL DEFAULT '',
  `method` varchar(50) NOT NULL DEFAULT '',
  `priority` int(2) NOT NULL DEFAULT '10',
  PRIMARY KEY (`hook_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `exp_ff_fieldtype_hooks`
--

INSERT INTO `exp_ff_fieldtype_hooks` (`hook_id`, `class`, `hook`, `method`, `priority`) VALUES
(1, 'mx_universal_editor', 'show_full_control_panel_end', 'show_full_control_panel_end', 99),
(2, 'mx_universal_editor', 'sessions_start', 'search_form', 99),
(3, 'mx_universal_editor', 'lg_addon_update_register_source', 'lg_addon_update_register_source', 10),
(4, 'mx_universal_editor', 'lg_addon_update_register_addon', 'lg_addon_update_register_addon', 10);

-- --------------------------------------------------------

--
-- Table structure for table `exp_fieldtypes`
--

CREATE TABLE `exp_fieldtypes` (
  `fieldtype_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `version` varchar(12) NOT NULL,
  `settings` text,
  `has_global_settings` char(1) DEFAULT 'n',
  PRIMARY KEY (`fieldtype_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `exp_fieldtypes`
--

INSERT INTO `exp_fieldtypes` (`fieldtype_id`, `name`, `version`, `settings`, `has_global_settings`) VALUES
(1, 'select', '1.0', 'YTowOnt9', 'n'),
(2, 'text', '1.0', 'YTowOnt9', 'n'),
(3, 'textarea', '1.0', 'YTowOnt9', 'n'),
(4, 'date', '1.0', 'YTowOnt9', 'n'),
(5, 'file', '1.0', 'YTowOnt9', 'n'),
(6, 'multi_select', '1.0', 'YTowOnt9', 'n'),
(7, 'checkboxes', '1.0', 'YTowOnt9', 'n'),
(8, 'radio', '1.0', 'YTowOnt9', 'n'),
(9, 'rel', '1.0', 'YTowOnt9', 'n'),
(10, 'pt_checkboxes', '1.1', 'YTowOnt9', 'n'),
(11, 'pt_dropdown', '1.1', 'YTowOnt9', 'n'),
(12, 'pt_multiselect', '1.1', 'YTowOnt9', 'n'),
(13, 'pt_radio_buttons', '1.1', 'YTowOnt9', 'n'),
(14, 'matrix', '2.2.2.1', 'YTowOnt9', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_field_formatting`
--

CREATE TABLE `exp_field_formatting` (
  `formatting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned NOT NULL,
  `field_fmt` varchar(40) NOT NULL,
  PRIMARY KEY (`formatting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `exp_field_formatting`
--

INSERT INTO `exp_field_formatting` (`formatting_id`, `field_id`, `field_fmt`) VALUES
(1, 6, 'xhtml'),
(2, 6, 'br'),
(3, 6, 'none'),
(4, 5, 'xhtml'),
(5, 5, 'br'),
(6, 5, 'none'),
(7, 4, 'xhtml'),
(8, 4, 'br'),
(9, 4, 'none'),
(10, 7, 'none'),
(11, 7, 'br'),
(12, 7, 'xhtml'),
(13, 8, 'none'),
(14, 8, 'br'),
(15, 8, 'xhtml'),
(16, 9, 'none'),
(17, 9, 'br'),
(18, 9, 'xhtml'),
(19, 10, 'none'),
(20, 10, 'br'),
(21, 10, 'xhtml'),
(22, 11, 'none'),
(23, 11, 'br'),
(24, 11, 'xhtml'),
(25, 12, 'none'),
(26, 12, 'br'),
(27, 12, 'xhtml'),
(28, 13, 'none'),
(29, 13, 'br'),
(30, 13, 'xhtml'),
(31, 14, 'none'),
(32, 14, 'br'),
(33, 14, 'xhtml'),
(34, 15, 'none'),
(35, 15, 'br'),
(36, 15, 'xhtml'),
(37, 16, 'none'),
(38, 16, 'br'),
(39, 16, 'xhtml'),
(40, 17, 'none'),
(41, 17, 'br'),
(42, 17, 'xhtml'),
(43, 18, 'none'),
(44, 18, 'br'),
(45, 18, 'xhtml'),
(46, 19, 'none'),
(47, 19, 'br'),
(48, 19, 'xhtml'),
(49, 20, 'none'),
(50, 20, 'br'),
(51, 20, 'xhtml'),
(52, 21, 'none'),
(53, 21, 'br'),
(54, 21, 'xhtml'),
(55, 22, 'none'),
(56, 22, 'br'),
(57, 22, 'xhtml'),
(58, 23, 'none'),
(59, 23, 'br'),
(60, 23, 'xhtml'),
(61, 24, 'none'),
(62, 24, 'br'),
(63, 24, 'xhtml'),
(64, 25, 'none'),
(65, 25, 'br'),
(66, 25, 'xhtml');

-- --------------------------------------------------------

--
-- Table structure for table `exp_field_groups`
--

CREATE TABLE `exp_field_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `exp_field_groups`
--

INSERT INTO `exp_field_groups` (`group_id`, `site_id`, `group_name`) VALUES
(2, 1, 'Quotes'),
(3, 1, 'Tasks'),
(4, 1, 'Characters'),
(5, 1, 'Other Pages'),
(6, 1, 'League'),
(7, 1, 'Comments'),
(8, 1, 'Teams');

-- --------------------------------------------------------

--
-- Table structure for table `exp_files`
--

CREATE TABLE `exp_files` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `title` varchar(255) DEFAULT NULL,
  `upload_location_id` int(4) unsigned DEFAULT '0',
  `rel_path` varchar(255) DEFAULT NULL,
  `status` char(1) DEFAULT 'o',
  `mime_type` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` int(10) DEFAULT '0',
  `field_1` text,
  `field_1_fmt` tinytext,
  `field_2` text,
  `field_2_fmt` tinytext,
  `field_3` text,
  `field_3_fmt` tinytext,
  `field_4` text,
  `field_4_fmt` tinytext,
  `field_5` text,
  `field_5_fmt` tinytext,
  `field_6` text,
  `field_6_fmt` tinytext,
  `metadata` mediumtext,
  `uploaded_by_member_id` int(10) unsigned DEFAULT '0',
  `upload_date` int(10) DEFAULT NULL,
  `modified_by_member_id` int(10) unsigned DEFAULT '0',
  `modified_date` int(10) DEFAULT NULL,
  `file_hw_original` varchar(20) DEFAULT NULL,
  `caption` text,
  PRIMARY KEY (`file_id`),
  KEY `upload_location_id` (`upload_location_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `exp_files`
--

INSERT INTO `exp_files` (`file_id`, `site_id`, `title`, `upload_location_id`, `rel_path`, `status`, `mime_type`, `file_name`, `file_size`, `field_1`, `field_1_fmt`, `field_2`, `field_2_fmt`, `field_3`, `field_3_fmt`, `field_4`, `field_4_fmt`, `field_5`, `field_5_fmt`, `field_6`, `field_6_fmt`, `metadata`, `uploaded_by_member_id`, `upload_date`, `modified_by_member_id`, `modified_date`, `file_hw_original`, `caption`) VALUES
(1, 1, 'index.html', 1, '/Users/imac1/Sites/2ndfolio/images/uploads/index.html', 'o', 'text/html', 'index.html', 135, NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 1, 1313418927, 1, 1313418927, ' ', NULL),
(2, 1, 'dummy-qr.jpg', 3, '/Users/imac1/Sites/2ndfolio/images/qr-codes/dummy-qr.jpg', 'o', 'image/jpeg', 'dummy-qr.jpg', 20436, NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 1, 1313418954, 1, 1313419110, '324 324', NULL),
(3, 1, 'macbeth.png', 2, '/Users/imac1/Sites/2ndfolio/images/uploads/characters/macbeth.png', 'o', 'image/png', 'macbeth.png', 32707, NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 1, 1313419080, 1, 1313419080, '342 232', NULL),
(4, 1, 'bottom.png', 2, '/Users/imac1/Sites/2ndfolio/images/uploads/characters/bottom.png', 'o', 'image/png', 'bottom.png', 31643, NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 1, 1313419080, 1, 1313419080, '342 232', NULL),
(5, 1, 'hamlet.png', 2, '/Users/imac1/Sites/2ndfolio/images/uploads/characters/hamlet.png', 'o', 'image/png', 'hamlet.png', 34152, NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 1, 1313419080, 1, 1313419080, '342 232', NULL),
(6, 1, 'ophelia.png', 2, '/Users/imac1/Sites/2ndfolio/images/uploads/characters/ophelia.png', 'o', 'image/png', 'ophelia.png', 30400, NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 1, 1313419080, 1, 1313419080, '342 232', NULL),
(7, 1, 'juliet.png', 2, '/Users/imac1/Sites/2ndfolio/images/uploads/characters/juliet.png', 'o', 'image/png', 'juliet.png', 33334, NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 1, 1313419080, 1, 1313419080, '342 232', NULL),
(8, 1, 'puck.png', 2, '/Users/imac1/Sites/2ndfolio/images/uploads/characters/puck.png', 'o', 'image/png', 'puck.png', 34488, NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 1, 1313419080, 1, 1313419080, '342 232', NULL),
(9, 1, 'kind-hamlet.png', 2, '/Users/imac1/Sites/2ndfolio/images/uploads/characters/kind-hamlet.png', 'o', 'image/png', 'kind-hamlet.png', 34640, NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 1, 1313419080, 1, 1313419080, '342 232', NULL),
(10, 1, 'romeo.png', 2, '/Users/imac1/Sites/2ndfolio/images/uploads/characters/romeo.png', 'o', 'image/png', 'romeo.png', 32893, NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 1, 1313419080, 1, 1313419080, '342 232', NULL),
(11, 1, 'lady-macbeth.png', 2, '/Users/imac1/Sites/2ndfolio/images/uploads/characters/lady-macbeth.png', 'o', 'image/png', 'lady-macbeth.png', 33070, NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 1, 1313419080, 1, 1313419080, '342 232', NULL),
(12, 1, 'titania.png', 2, '/Users/imac1/Sites/2ndfolio/images/uploads/characters/titania.png', 'o', 'image/png', 'titania.png', 32448, NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 1, 1313419080, 1, 1313419080, '342 232', NULL),
(13, 1, 'tybalt.png', 2, '/Users/imac1/Sites/2ndfolio/images/uploads/characters/tybalt.png', 'o', 'image/png', 'tybalt.png', 33280, NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 1, 1313419080, 1, 1313419080, '342 232', NULL),
(14, 1, 'witch.png', 2, '/Users/imac1/Sites/2ndfolio/images/uploads/characters/witch.png', 'o', 'image/png', 'witch.png', 35191, NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 'xhtml', NULL, 1, 1313419080, 1, 1313419080, '342 232', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_categories`
--

CREATE TABLE `exp_file_categories` (
  `file_id` int(10) unsigned DEFAULT NULL,
  `cat_id` int(10) unsigned DEFAULT NULL,
  `sort` int(10) unsigned DEFAULT '0',
  `is_cover` char(1) DEFAULT 'n',
  KEY `file_id` (`file_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_dimensions`
--

CREATE TABLE `exp_file_dimensions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `upload_location_id` int(4) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `short_name` varchar(255) DEFAULT '',
  `resize_type` varchar(50) DEFAULT '',
  `width` int(10) DEFAULT '0',
  `height` int(10) DEFAULT '0',
  `watermark_id` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_location_id` (`upload_location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_watermarks`
--

CREATE TABLE `exp_file_watermarks` (
  `wm_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `wm_name` varchar(80) DEFAULT NULL,
  `wm_type` varchar(10) DEFAULT 'text',
  `wm_image_path` varchar(100) DEFAULT NULL,
  `wm_test_image_path` varchar(100) DEFAULT NULL,
  `wm_use_font` char(1) DEFAULT 'y',
  `wm_font` varchar(30) DEFAULT NULL,
  `wm_font_size` int(3) unsigned DEFAULT NULL,
  `wm_text` varchar(100) DEFAULT NULL,
  `wm_vrt_alignment` varchar(10) DEFAULT 'top',
  `wm_hor_alignment` varchar(10) DEFAULT 'left',
  `wm_padding` int(3) unsigned DEFAULT NULL,
  `wm_opacity` int(3) unsigned DEFAULT NULL,
  `wm_x_offset` int(4) unsigned DEFAULT NULL,
  `wm_y_offset` int(4) unsigned DEFAULT NULL,
  `wm_x_transp` int(4) DEFAULT NULL,
  `wm_y_transp` int(4) DEFAULT NULL,
  `wm_font_color` varchar(7) DEFAULT NULL,
  `wm_use_drop_shadow` char(1) DEFAULT 'y',
  `wm_shadow_distance` int(3) unsigned DEFAULT NULL,
  `wm_shadow_color` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`wm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_attachments`
--

CREATE TABLE `exp_freeform_attachments` (
  `attachment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `pref_id` int(10) unsigned NOT NULL,
  `entry_date` int(10) NOT NULL,
  `server_path` varchar(150) NOT NULL,
  `filename` varchar(150) NOT NULL,
  `extension` varchar(7) NOT NULL,
  `filesize` int(10) NOT NULL,
  `emailed` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`attachment_id`),
  KEY `entry_id` (`entry_id`),
  KEY `pref_id` (`pref_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_entries`
--

CREATE TABLE `exp_freeform_entries` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `weblog_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `form_name` varchar(50) NOT NULL,
  `template` varchar(150) NOT NULL,
  `entry_date` int(10) NOT NULL,
  `edit_date` int(10) NOT NULL,
  `status` char(10) NOT NULL DEFAULT 'open',
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `message` varchar(3000) NOT NULL,
  PRIMARY KEY (`entry_id`),
  KEY `author_id` (`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_fields`
--

CREATE TABLE `exp_freeform_fields` (
  `field_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_order` int(10) NOT NULL DEFAULT '0',
  `field_type` varchar(50) NOT NULL DEFAULT 'text',
  `field_length` int(3) NOT NULL DEFAULT '150',
  `form_name` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `name_old` varchar(50) NOT NULL,
  `label` varchar(100) NOT NULL,
  `weblog_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `entry_date` int(10) NOT NULL,
  `edit_date` int(10) NOT NULL,
  `editable` char(1) NOT NULL DEFAULT 'y',
  `status` char(10) NOT NULL DEFAULT 'open',
  PRIMARY KEY (`field_id`),
  KEY `name` (`name`),
  KEY `author_id` (`author_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `exp_freeform_fields`
--

INSERT INTO `exp_freeform_fields` (`field_id`, `field_order`, `field_type`, `field_length`, `form_name`, `name`, `name_old`, `label`, `weblog_id`, `author_id`, `entry_date`, `edit_date`, `editable`, `status`) VALUES
(16, 3, 'text', 3000, '', 'message', '', 'Message', 0, 0, 0, 0, 'y', 'open'),
(15, 2, 'text', 200, '', 'email', '', 'Email', 0, 0, 0, 0, 'y', 'open'),
(14, 1, 'text', 200, '', 'name', '', 'Name', 0, 0, 0, 0, 'y', 'open');

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_params`
--

CREATE TABLE `exp_freeform_params` (
  `params_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_date` int(10) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`params_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=502 ;

--
-- Dumping data for table `exp_freeform_params`
--

INSERT INTO `exp_freeform_params` (`params_id`, `entry_date`, `data`) VALUES
(501, 1328694460, 'a:22:{s:15:"require_captcha";s:2:"no";s:9:"form_name";s:11:"Submit Form";s:10:"require_ip";s:0:"";s:11:"ee_required";s:18:"name|email|message";s:9:"ee_notify";s:50:"james@supercooldesign.co.uk, paul.sutton@candt.org";s:18:"allowed_file_types";s:0:"";s:8:"reply_to";b:0;s:20:"reply_to_email_field";s:0:"";s:19:"reply_to_name_field";s:0:"";s:10:"recipients";s:1:"n";s:15:"recipient_limit";s:2:"10";s:17:"static_recipients";b:0;s:22:"static_recipients_list";a:0:{}s:18:"recipient_template";s:16:"default_template";s:13:"discard_field";s:0:"";s:15:"send_attachment";s:0:"";s:15:"send_user_email";s:3:"yes";s:20:"send_user_attachment";s:0:"";s:19:"user_email_template";s:18:"submission-success";s:8:"template";s:23:"submission-notification";s:20:"prevent_duplicate_on";s:0:"";s:11:"file_upload";s:21:"Main Upload Directory";}');

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_preferences`
--

CREATE TABLE `exp_freeform_preferences` (
  `preference_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `preference_name` varchar(80) NOT NULL,
  `preference_value` text NOT NULL,
  PRIMARY KEY (`preference_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_templates`
--

CREATE TABLE `exp_freeform_templates` (
  `template_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `enable_template` char(1) NOT NULL DEFAULT 'y',
  `wordwrap` char(1) NOT NULL DEFAULT 'y',
  `html` char(1) NOT NULL DEFAULT 'n',
  `template_name` varchar(150) NOT NULL,
  `template_label` varchar(150) NOT NULL,
  `data_from_name` varchar(150) NOT NULL,
  `data_from_email` varchar(200) NOT NULL,
  `data_title` varchar(80) NOT NULL,
  `template_data` text NOT NULL,
  PRIMARY KEY (`template_id`),
  KEY `template_name` (`template_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `exp_freeform_templates`
--

INSERT INTO `exp_freeform_templates` (`template_id`, `enable_template`, `wordwrap`, `html`, `template_name`, `template_label`, `data_from_name`, `data_from_email`, `data_title`, `template_data`) VALUES
(1, 'y', 'y', 'n', 'default_template', 'Default Template', '', '', 'Someone has posted to Freeform', '\nSomeone has posted to Freeform. Here are the details:  \n			 		\nEntry Date: {entry_date}\n{all_custom_fields}'),
(2, 'y', 'y', 'n', 'submission-success', 'Submission Success', '2nd Folio ', 'noreply@2ndfolio.net', 'Submission Successful', 'Thank you \n\nYour submission has been successfully received by the 2nd Folio team who will consider it for the next batch of playing cards\n\nNote: You were sent this email, because you submitted information to http://www.2ndfolio.net. If this is incorrect, please ignore this email. If you like to report this message as spam please email info@candt.org\n\n2nd Folio\nDevised by C&T Theatre Company.'),
(3, 'y', 'n', 'n', 'submission-notification', 'Admin Notification', '2nd Folio', 'noreply@2ndfolio.net', '2nd Folio Submission', 'Someone has posted a suggestion from the 2nd Folio Website\n\nDetails:\n\nEntry Date: {entry_date}\n\nName: {name}\nEmail: {email}\n\nMessage:\n{message}\n\n\n\n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_user_email`
--

CREATE TABLE `exp_freeform_user_email` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `email_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`email_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_global_variables`
--

CREATE TABLE `exp_global_variables` (
  `variable_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `variable_name` varchar(50) NOT NULL,
  `variable_data` mediumtext NOT NULL,
  PRIMARY KEY (`variable_id`),
  KEY `variable_name` (`variable_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_html_buttons`
--

CREATE TABLE `exp_html_buttons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `tag_name` varchar(32) NOT NULL,
  `tag_open` varchar(120) NOT NULL,
  `tag_close` varchar(120) NOT NULL,
  `accesskey` varchar(32) NOT NULL,
  `tag_order` int(3) unsigned NOT NULL,
  `tag_row` char(1) NOT NULL DEFAULT '1',
  `classname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `exp_html_buttons`
--

INSERT INTO `exp_html_buttons` (`id`, `site_id`, `member_id`, `tag_name`, `tag_open`, `tag_close`, `accesskey`, `tag_order`, `tag_row`, `classname`) VALUES
(7, 1, 0, 'blockquote', '<blockquote>', '</blockquote>', 'q', 3, '1', 'btn_blockquote'),
(6, 1, 0, 'i', '<em>', '</em>', 'i', 2, '1', 'btn_i'),
(5, 1, 0, 'b', '<strong>', '</strong>', 'b', 1, '1', 'btn_b'),
(8, 1, 0, 'a', '<a href="[![Link:!:http://]!]"(!( title="[![Title]!]")!)>', '</a>', 'a', 4, '1', 'btn_a'),
(9, 1, 0, 'img', '<img src="[![Link:!:http://]!]" alt="[![Alternative text]!]" />', '', '', 5, '1', 'btn_img');

-- --------------------------------------------------------

--
-- Table structure for table `exp_layout_publish`
--

CREATE TABLE `exp_layout_publish` (
  `layout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_group` int(4) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(4) unsigned NOT NULL DEFAULT '0',
  `field_layout` text,
  PRIMARY KEY (`layout_id`),
  KEY `site_id` (`site_id`),
  KEY `member_group` (`member_group`),
  KEY `channel_id` (`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_mailing_list`
--

CREATE TABLE `exp_mailing_list` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `list_id` int(7) unsigned NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL,
  `authcode` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `list_id` (`list_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_mailing_lists`
--

CREATE TABLE `exp_mailing_lists` (
  `list_id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `list_name` varchar(40) NOT NULL,
  `list_title` varchar(100) NOT NULL,
  `list_template` mediumtext NOT NULL,
  PRIMARY KEY (`list_id`),
  KEY `list_name` (`list_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_mailing_lists`
--

INSERT INTO `exp_mailing_lists` (`list_id`, `list_name`, `list_title`, `list_template`) VALUES
(1, 'default', 'Default Mailing List', '{message_text}\n\nTo remove your email from this mailing list, click here:\n{if html_email}<a href="{unsubscribe_url}">{unsubscribe_url}</a>{/if}\n{if plain_email}{unsubscribe_url}{/if}');

-- --------------------------------------------------------

--
-- Table structure for table `exp_mailing_list_queue`
--

CREATE TABLE `exp_mailing_list_queue` (
  `queue_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `list_id` int(7) unsigned NOT NULL DEFAULT '0',
  `authcode` varchar(10) NOT NULL,
  `date` int(10) NOT NULL,
  PRIMARY KEY (`queue_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_matrix_cols`
--

CREATE TABLE `exp_matrix_cols` (
  `col_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `field_id` int(6) unsigned DEFAULT NULL,
  `col_name` varchar(32) DEFAULT NULL,
  `col_label` varchar(50) DEFAULT NULL,
  `col_instructions` text,
  `col_type` varchar(50) DEFAULT 'text',
  `col_required` char(1) DEFAULT 'n',
  `col_search` char(1) DEFAULT 'n',
  `col_order` int(3) unsigned DEFAULT NULL,
  `col_width` varchar(4) DEFAULT NULL,
  `col_settings` text,
  PRIMARY KEY (`col_id`),
  KEY `site_id` (`site_id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `exp_matrix_cols`
--

INSERT INTO `exp_matrix_cols` (`col_id`, `site_id`, `field_id`, `col_name`, `col_label`, `col_instructions`, `col_type`, `col_required`, `col_search`, `col_order`, `col_width`, `col_settings`) VALUES
(1, 1, 12, 'heading', 'Heading', NULL, 'text', 'n', 'y', 1, NULL, 'YTozOntzOjQ6Im1heGwiO3M6MzoiMTI4IjtzOjQ6InNpemUiO3M6MDoiIjtzOjk6Im11bHRpbGluZSI7czoxOiJuIjt9'),
(2, 1, 12, 'description', 'description', NULL, 'text', 'n', 'y', 2, NULL, 'YToxNjp7czoxMDoiZmllbGRfdHlwZSI7czo3OiJUaW55TUNFIjtzOjE5OiJtYXJraXR1cF9zZXRfZm9sZGVyIjtzOjQ6Imh0bWwiO3M6MTE6ImNvbmZpZ19maWxlIjtzOjEwOiJhcnRpY2xlLmpzIjtzOjExOiJwcmVmZXJlbmNlcyI7czoxOiIxIjtzOjExOiJmb2xkZXJfdHlwZSI7czo0OiJmaWxlIjtzOjE4OiJyb290X2V4dHJhX2ZvbGRlcnMiO3M6MDoiIjtzOjE4OiJyb290X2V4Y2VwdF9ncm91cHMiO3M6MDoiIjtzOjEzOiJleHRyYV9mb2xkZXJzIjtzOjA6IiI7czoxMjoidGh1bWJxdWFsaXR5IjtzOjI6IjgwIjtzOjEyOiJpbWFnZXF1YWxpdHkiO3M6MjoiODAiO3M6OToidGh1bWJzaXplIjtzOjI6IjgwIjtzOjEyOiJyZXNpemVfd2lkdGgiO3M6MDoiIjtzOjEzOiJyZXNpemVfaGVpZ2h0IjtzOjA6IiI7czoxMDoiY3JvcF93aWR0aCI7czowOiIiO3M6MTE6ImNyb3BfaGVpZ2h0IjtzOjA6IiI7czoxNDoiY3JvcF9zaXplX3R5cGUiO3M6MToiMCI7fQ=='),
(3, 1, 12, 'embed', 'You Tube', NULL, 'text', 'n', 'y', 3, NULL, 'YTozOntzOjQ6InJvd3MiO3M6MToiMiI7czo0OiJzaXplIjtzOjA6IiI7czo5OiJtdWx0aWxpbmUiO3M6MToieSI7fQ=='),
(4, 1, 12, 'vimeo', 'Vimeo', NULL, 'text', 'n', 'y', 4, NULL, 'YTozOntzOjQ6Im1heGwiO3M6MzoiMzAwIjtzOjQ6InNpemUiO3M6MDoiIjtzOjk6Im11bHRpbGluZSI7czoxOiJuIjt9'),
(5, 1, 16, 'heading', 'Heading', '', 'text', 'n', 'y', 0, '', 'YTozOntzOjQ6Im1heGwiO3M6MzoiMTI4IjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjc6ImNvbnRlbnQiO3M6MzoiYWxsIjt9'),
(6, 1, 16, 'description', 'Description', NULL, 'text', 'n', 'y', 2, NULL, 'YToxNjp7czoxMDoiZmllbGRfdHlwZSI7czo3OiJUaW55TUNFIjtzOjE5OiJtYXJraXR1cF9zZXRfZm9sZGVyIjtzOjQ6Imh0bWwiO3M6MTE6ImNvbmZpZ19maWxlIjtzOjEwOiJhcnRpY2xlLmpzIjtzOjExOiJwcmVmZXJlbmNlcyI7czoxOiIxIjtzOjExOiJmb2xkZXJfdHlwZSI7czo0OiJmaWxlIjtzOjE4OiJyb290X2V4dHJhX2ZvbGRlcnMiO3M6MDoiIjtzOjE4OiJyb290X2V4Y2VwdF9ncm91cHMiO3M6MDoiIjtzOjEzOiJleHRyYV9mb2xkZXJzIjtzOjA6IiI7czoxMjoidGh1bWJxdWFsaXR5IjtzOjI6IjgwIjtzOjEyOiJpbWFnZXF1YWxpdHkiO3M6MjoiODAiO3M6OToidGh1bWJzaXplIjtzOjI6IjgwIjtzOjEyOiJyZXNpemVfd2lkdGgiO3M6MDoiIjtzOjEzOiJyZXNpemVfaGVpZ2h0IjtzOjA6IiI7czoxMDoiY3JvcF93aWR0aCI7czowOiIiO3M6MTE6ImNyb3BfaGVpZ2h0IjtzOjA6IiI7czoxNDoiY3JvcF9zaXplX3R5cGUiO3M6MToiMCI7fQ=='),
(7, 1, 16, 'embed', 'YouTube', NULL, 'text', 'n', 'y', 3, NULL, 'YTozOntzOjQ6InJvd3MiO3M6MToiMiI7czo0OiJzaXplIjtzOjA6IiI7czo5OiJtdWx0aWxpbmUiO3M6MToieSI7fQ=='),
(8, 1, 16, 'vimeo', 'Vimeo', NULL, 'text', 'n', 'y', 4, NULL, 'YTozOntzOjQ6Im1heGwiO3M6MzoiMzAwIjtzOjQ6InNpemUiO3M6MDoiIjtzOjk6Im11bHRpbGluZSI7czoxOiJuIjt9'),
(9, 1, 19, 'team', 'Team Name', NULL, 'text', 'n', 'y', 1, NULL, 'YTozOntzOjQ6Im1heGwiO3M6MzoiMjAwIjtzOjQ6InNpemUiO3M6MDoiIjtzOjk6Im11bHRpbGluZSI7czoxOiJuIjt9'),
(10, 1, 19, 'rounds', 'Rounds Played', NULL, 'text', 'n', 'y', 2, NULL, 'YTozOntzOjQ6Im1heGwiO3M6MzoiMTI4IjtzOjQ6InNpemUiO3M6MDoiIjtzOjk6Im11bHRpbGluZSI7czoxOiJuIjt9'),
(11, 1, 19, 'points', 'Total Points', NULL, 'text', 'n', 'y', 3, NULL, 'YTozOntzOjQ6Im1heGwiO3M6MzoiMTI4IjtzOjQ6InNpemUiO3M6MDoiIjtzOjk6Im11bHRpbGluZSI7czoxOiJuIjt9');

-- --------------------------------------------------------

--
-- Table structure for table `exp_matrix_data`
--

CREATE TABLE `exp_matrix_data` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `entry_id` int(10) unsigned DEFAULT NULL,
  `field_id` int(6) unsigned DEFAULT NULL,
  `row_order` int(4) unsigned DEFAULT NULL,
  `col_id_1` text,
  `col_id_2` text,
  `col_id_3` text,
  `col_id_4` text,
  `col_id_5` text,
  `col_id_6` text,
  `col_id_7` text,
  `col_id_8` text,
  `col_id_9` text,
  `col_id_10` text,
  `col_id_11` text,
  PRIMARY KEY (`row_id`),
  KEY `site_id` (`site_id`),
  KEY `entry_id` (`entry_id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=95 ;

--
-- Dumping data for table `exp_matrix_data`
--

INSERT INTO `exp_matrix_data` (`row_id`, `site_id`, `entry_id`, `field_id`, `row_order`, `col_id_1`, `col_id_2`, `col_id_3`, `col_id_4`, `col_id_5`, `col_id_6`, `col_id_7`, `col_id_8`, `col_id_9`, `col_id_10`, `col_id_11`) VALUES
(1, 1, 12, 12, 1, '', '', '', 'http://vimeo.com/16728445', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 13, 12, 1, '', '', '', 'http://vimeo.com/16732959', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 1, 14, 12, 1, '', '', '', 'http://vimeo.com/16733760', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 1, 14, 12, 2, '', '', '', 'http://vimeo.com/16726000', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 1, 15, 12, 1, '', '', '', 'http://vimeo.com/16732002', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 1, 15, 12, 2, '', '', '', 'http://vimeo.com/16725907', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 1, 16, 12, 1, '', '', 'http://www.youtube.com/watch?v=UwuQSqrMgJg', 'http://vimeo.com/16733250', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 1, 16, 12, 2, '', '', 'http://www.youtube.com/watch?v=Blm05WewlBY', 'http://vimeo.com/16725977', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 1, 17, 12, 1, '', '', '', 'http://vimeo.com/16733493', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 1, 17, 12, 2, '', '', '', 'http://vimeo.com/16726016', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 1, 18, 12, 1, '', '', '', 'http://vimeo.com/16732451', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 1, 18, 12, 2, '', '', '', 'http://vimeo.com/16725987', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 1, 19, 12, 1, '', '', '', 'http://vimeo.com/16732324', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 1, 19, 12, 2, '', '', '', 'http://vimeo.com/16725936', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 1, 20, 12, 1, '', '', '', 'http://vimeo.com/16733077', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 1, 20, 12, 2, '', '', '', 'http://vimeo.com/16725957', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 1, 21, 12, 1, '', '', '', 'http://vimeo.com/16733335', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 1, 24, 12, 1, '', '', '', 'http://vimeo.com/16725797', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 1, 25, 12, 1, '', '', '', 'http://vimeo.com/16725811', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 1, 26, 12, 1, '', '', '', 'http://vimeo.com/16725844', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 1, 27, 12, 1, '', '', '', 'http://vimeo.com/16725775', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 1, 28, 12, 1, '', '', '', 'http://vimeo.com/16725858', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 1, 29, 12, 1, '', '', '', 'http://vimeo.com/16725725', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 1, 30, 12, 1, '', '', '', 'http://vimeo.com/16725750', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 1, 31, 12, 1, '', '', '', 'http://vimeo.com/16725830', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 1, 32, 12, 1, '', '', '', 'http://vimeo.com/16690400', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 1, 33, 12, 1, '', '', '', 'http://vimeo.com/16690729', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 1, 34, 12, 1, '', '', '', 'http://vimeo.com/16690685', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 1, 35, 12, 1, '', '', '', 'http://vimeo.com/16690032', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 1, 37, 12, 1, '', '', '', 'http://vimeo.com/16690056', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 1, 38, 12, 1, '', '', '', 'http://vimeo.com/16689963', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 1, 39, 12, 1, '', '', '', 'http://vimeo.com/16690704', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 1, 40, 12, 1, '', '', '', 'http://vimeo.com/16690447', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 1, 41, 12, 1, '', '', '', 'http://vimeo.com/16690078', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 1, 42, 12, 1, '', '', '', 'http://vimeo.com/16690814', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 1, 43, 16, 1, NULL, NULL, NULL, NULL, '', '', '', 'http://vimeo.com/16726029', NULL, NULL, NULL),
(37, 1, 44, 16, 1, NULL, NULL, NULL, NULL, '', '', '', 'http://vimeo.com/16726029', NULL, NULL, NULL),
(38, 1, 45, 16, 1, NULL, NULL, NULL, NULL, '', '', '', 'http://vimeo.com/16726029', NULL, NULL, NULL),
(39, 1, 46, 16, 1, NULL, NULL, NULL, NULL, '', '', '', 'http://vimeo.com/16726029', NULL, NULL, NULL),
(40, 1, 47, 16, 1, NULL, NULL, NULL, NULL, '', '', '', 'http://vimeo.com/16726029', NULL, NULL, NULL),
(41, 1, 48, 16, 1, NULL, NULL, NULL, NULL, '', '', '', 'http://vimeo.com/16726029', NULL, NULL, NULL),
(42, 1, 49, 16, 1, NULL, NULL, NULL, NULL, '', '', '', 'http://vimeo.com/16726029', NULL, NULL, NULL),
(43, 1, 50, 16, 1, NULL, NULL, NULL, NULL, '', '', '', 'http://vimeo.com/16726107', NULL, NULL, NULL),
(44, 1, 51, 16, 1, NULL, NULL, NULL, NULL, '', '', '', 'http://vimeo.com/16730932', NULL, NULL, NULL),
(45, 1, 51, 16, 2, NULL, NULL, NULL, NULL, '', '', '', 'http://vimeo.com/16729203', NULL, NULL, NULL),
(46, 1, 51, 16, 3, NULL, NULL, NULL, NULL, '', '', '', 'http://vimeo.com/16726216', NULL, NULL, NULL),
(47, 1, 52, 16, 1, NULL, NULL, NULL, NULL, '', '', '', 'http://vimeo.com/16731491', NULL, NULL, NULL),
(48, 1, 52, 16, 2, NULL, NULL, NULL, NULL, '', '', '', 'http://vimeo.com/16729283', NULL, NULL, NULL),
(49, 1, 52, 16, 3, NULL, NULL, NULL, NULL, '', '', '', 'http://vimeo.com/16726161', NULL, NULL, NULL),
(50, 1, 53, 16, 1, NULL, NULL, NULL, NULL, '', '', '', 'http://vimeo.com/16726254', NULL, NULL, NULL),
(51, 1, 54, 16, 0, NULL, NULL, NULL, NULL, '', '', '', 'http://vimeo.com/16731665', NULL, NULL, NULL),
(52, 1, 54, 16, 1, NULL, NULL, NULL, NULL, '', '', '', 'http://vimeo.com/16729636', NULL, NULL, NULL),
(53, 1, 54, 16, 2, NULL, NULL, NULL, NULL, '', '', '', 'http://vimeo.com/16726097', NULL, NULL, NULL),
(54, 1, 55, 16, 1, NULL, NULL, NULL, NULL, '', '', '', 'http://vimeo.com/16726078', NULL, NULL, NULL),
(55, 1, 56, 16, 0, NULL, NULL, NULL, NULL, '', '', '', 'http://vimeo.com/16726146', NULL, NULL, NULL),
(56, 1, 58, 16, 0, NULL, NULL, NULL, NULL, '', '', '', 'http://vimeo.com/16726090', NULL, NULL, NULL),
(57, 1, 59, 16, 0, NULL, NULL, NULL, NULL, '', '', '', 'http://vimeo.com/16733760', NULL, NULL, NULL),
(58, 1, 60, 16, 0, NULL, NULL, NULL, NULL, '', '', '', 'http://vimeo.com/16726134', NULL, NULL, NULL),
(59, 1, 61, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Facial Hairs', '3', '17'),
(60, 1, 61, 19, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Flying Caliban', '1', '6'),
(61, 1, 61, 19, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Juliet''s Pink Undies', '3', '24'),
(62, 1, 61, 19, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Malmspeare', '3', '26'),
(63, 1, 61, 19, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Shakespeare''s Shoes', '3', '15'),
(64, 1, 61, 19, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Shake that Malmesbury', '3', '38'),
(65, 1, 61, 19, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Malmesbury or not to be', '3', '40'),
(66, 1, 61, 19, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'The Malmesbury Globetrotters', '2', '36'),
(67, 1, 61, 19, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Tremendous Tempest', '2', '24'),
(68, 1, 61, 19, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team Juliets (Bishop Perowne)', '2', '13'),
(69, 1, 61, 19, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Macbeth & Tragedy (Bishop Perowne)', '2', '8'),
(70, 1, 61, 19, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Punky Pucks (Bishop Perowne)', '1', '15'),
(71, 1, 61, 19, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team Second Folio (Bishop Perowne)', '2', '2'),
(72, 1, 61, 19, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Puck''s Bottom (Bishop Perowne)', '2', '5'),
(73, 1, 61, 19, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team Macbethio (Bishop Perowne)', '2', '10'),
(74, 1, 61, 19, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Daggers & War (Bishop Perowne)', '1', '5'),
(75, 1, 61, 19, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'The Lovers (Boroughbridge High School)', '3', '21'),
(76, 1, 61, 19, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'The Poisoners (Boroughbridge High School)', '3', '24'),
(77, 1, 61, 19, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'The Brawlers (Boroughbridge High School)', '3', '31'),
(78, 1, 61, 19, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'The Friars (Boroughbridge High School)', '3', '18'),
(79, 1, 61, 19, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Shake-Laurence', '1', '10'),
(80, 1, 61, 19, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'More in St. Laurence than in anger', '1', '5'),
(81, 1, 61, 19, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'St.-Shakespeare', '1', '2'),
(82, 1, 61, 19, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'St.-Laurence-speare', '1', '11'),
(83, 1, 61, 19, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'St. Laurence Shaking Spears', '1', '5'),
(84, 1, 61, 19, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Georgio and Jamiet AND David! (St. L)', '1', '7'),
(85, 1, 61, 19, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'The Juliets (St L.)', '2', '5'),
(86, 1, 61, 19, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'The Shakespearian Pigeons (St. L)', '2', '11'),
(87, 1, 61, 19, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'St Laurence Horn Beasts', '2', '10'),
(88, 1, 61, 19, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Laurencespeare', '2', '10'),
(89, 1, 61, 19, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'The Fair Maidens (St. L)', '2', '14'),
(90, 1, 61, 19, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'The Wacky Shacks (St. L)', '2', '6'),
(91, 1, 61, 19, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Thou art lol (St. L)', '2', '9'),
(92, 1, 61, 19, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'The Plums (St. L)', '2', '7'),
(93, 1, 61, 19, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'The Juliets who need no Romeo (St. L)', '2', '26'),
(94, 1, 61, 19, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Shake that speare (St. L)', '2', '21');

-- --------------------------------------------------------

--
-- Table structure for table `exp_members`
--

CREATE TABLE `exp_members` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` smallint(4) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `password` varchar(128) DEFAULT NULL,
  `unique_id` varchar(40) NOT NULL,
  `crypt_key` varchar(40) DEFAULT NULL,
  `authcode` varchar(10) DEFAULT NULL,
  `email` varchar(72) NOT NULL,
  `url` varchar(150) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `occupation` varchar(80) DEFAULT NULL,
  `interests` varchar(120) DEFAULT NULL,
  `bday_d` int(2) DEFAULT NULL,
  `bday_m` int(2) DEFAULT NULL,
  `bday_y` int(4) DEFAULT NULL,
  `aol_im` varchar(50) DEFAULT NULL,
  `yahoo_im` varchar(50) DEFAULT NULL,
  `msn_im` varchar(50) DEFAULT NULL,
  `icq` varchar(50) DEFAULT NULL,
  `bio` text,
  `signature` text,
  `avatar_filename` varchar(120) DEFAULT NULL,
  `avatar_width` int(4) unsigned DEFAULT NULL,
  `avatar_height` int(4) unsigned DEFAULT NULL,
  `photo_filename` varchar(120) DEFAULT NULL,
  `photo_width` int(4) unsigned DEFAULT NULL,
  `photo_height` int(4) unsigned DEFAULT NULL,
  `sig_img_filename` varchar(120) DEFAULT NULL,
  `sig_img_width` int(4) unsigned DEFAULT NULL,
  `sig_img_height` int(4) unsigned DEFAULT NULL,
  `ignore_list` text,
  `private_messages` int(4) unsigned NOT NULL DEFAULT '0',
  `accept_messages` char(1) NOT NULL DEFAULT 'y',
  `last_view_bulletins` int(10) NOT NULL DEFAULT '0',
  `last_bulletin_date` int(10) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `join_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visit` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `total_entries` smallint(5) unsigned NOT NULL DEFAULT '0',
  `total_comments` smallint(5) unsigned NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_email_date` int(10) unsigned NOT NULL DEFAULT '0',
  `in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `accept_admin_email` char(1) NOT NULL DEFAULT 'y',
  `accept_user_email` char(1) NOT NULL DEFAULT 'y',
  `notify_by_default` char(1) NOT NULL DEFAULT 'y',
  `notify_of_pm` char(1) NOT NULL DEFAULT 'y',
  `display_avatars` char(1) NOT NULL DEFAULT 'y',
  `display_signatures` char(1) NOT NULL DEFAULT 'y',
  `parse_smileys` char(1) NOT NULL DEFAULT 'y',
  `smart_notifications` char(1) NOT NULL DEFAULT 'y',
  `language` varchar(50) NOT NULL,
  `timezone` varchar(8) NOT NULL,
  `daylight_savings` char(1) NOT NULL DEFAULT 'n',
  `localization_is_site_default` char(1) NOT NULL DEFAULT 'n',
  `time_format` char(2) NOT NULL DEFAULT 'us',
  `cp_theme` varchar(32) DEFAULT NULL,
  `profile_theme` varchar(32) DEFAULT NULL,
  `forum_theme` varchar(32) DEFAULT NULL,
  `tracker` text,
  `template_size` varchar(2) NOT NULL DEFAULT '28',
  `notepad` text,
  `notepad_size` varchar(2) NOT NULL DEFAULT '18',
  `quick_links` text,
  `quick_tabs` text,
  `show_sidebar` char(1) NOT NULL DEFAULT 'n',
  `pmember_id` int(10) NOT NULL DEFAULT '0',
  `salt` varchar(128) NOT NULL DEFAULT '',
  `remember_me` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`member_id`),
  KEY `group_id` (`group_id`),
  KEY `unique_id` (`unique_id`),
  KEY `password` (`password`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `exp_members`
--

INSERT INTO `exp_members` (`member_id`, `group_id`, `username`, `screen_name`, `password`, `unique_id`, `crypt_key`, `authcode`, `email`, `url`, `location`, `occupation`, `interests`, `bday_d`, `bday_m`, `bday_y`, `aol_im`, `yahoo_im`, `msn_im`, `icq`, `bio`, `signature`, `avatar_filename`, `avatar_width`, `avatar_height`, `photo_filename`, `photo_width`, `photo_height`, `sig_img_filename`, `sig_img_width`, `sig_img_height`, `ignore_list`, `private_messages`, `accept_messages`, `last_view_bulletins`, `last_bulletin_date`, `ip_address`, `join_date`, `last_visit`, `last_activity`, `total_entries`, `total_comments`, `total_forum_topics`, `total_forum_posts`, `last_entry_date`, `last_comment_date`, `last_forum_post_date`, `last_email_date`, `in_authorlist`, `accept_admin_email`, `accept_user_email`, `notify_by_default`, `notify_of_pm`, `display_avatars`, `display_signatures`, `parse_smileys`, `smart_notifications`, `language`, `timezone`, `daylight_savings`, `localization_is_site_default`, `time_format`, `cp_theme`, `profile_theme`, `forum_theme`, `tracker`, `template_size`, `notepad`, `notepad_size`, `quick_links`, `quick_tabs`, `show_sidebar`, `pmember_id`, `salt`, `remember_me`) VALUES
(1, 1, 'jamescv6', 'Super Admin', '2fe2bca3fdc9cbb5d5f1687e12697e2b45ca4e1ca6702baef3a6946dd1c495e832b8f6796af0782481d3979d15592954be624497539dcbb6b1bd4a7ff5b26efe', '08f748af9919d8fce2b546346b83696a15d5969a', '60232b6ee85f2596b4b9291f2a7d4bd8bb616f39', '', 'james@supercooldesign.co.uk', '', 'Birmingham', '', '', NULL, NULL, NULL, '', '', '', '', 'The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. ', '', '', 0, 0, '', 0, 0, '', 0, 0, '', 0, 'y', 0, 0, '127.0.0.1', 1282653626, 1328001170, 1328529449, 19, 0, 0, 0, 1316086488, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'n', 'n', 'y', 'y', 'english', 'UTC', 'n', 'n', 'us', '', '', '', '', '28', '', '18', 'My Site|http://supercool.dnsalias.com/second-folio/index.php|1', '', 'n', 0, '!fLeB6-o=\\\\l?Bc18#^vx@b!w''\\rsl3>OX(0(]N*M+bqr#Vj#>"2ZjqB_PjF8+q5C;X!Z?avx<8X=k)5,y`?@Q}7"S4^#Q1JG6FA@w$9um@5u-3n~_E96"b2*mf:m-"D', ''),
(2, 7, 'maxa', 'Max Allsup', 'd310578e1702a3960353db56c99c8897e2cd9eca40c16e727f50638e7a58cc2b5507d323775dcab2934f8daeb0ec034197b8eba16d8aeff19dcce3ece72a15cc', 'e5b7fa9b17dbf10690d6d913b4a7e0053e521086', 'a55808f2ed2f8bdaca1d25df796b758952d103a7', '', 'max.allsup@candt.org', '', 'C&T Worcester', '', '', NULL, NULL, NULL, '', '', '', '', 'Max Allsup,\nAssistant Director of C&T and Super Admin of Second Folio', '', '', 0, 0, '', 0, 0, '', 0, 0, '', 0, 'y', 0, 0, '127.0.0.1', 1282729902, 1316086838, 1324303854, 51, 0, 0, 0, 1324303854, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'n', 'n', 'y', 'y', '', '', 'n', 'n', 'us', '', '', '', '', '28', '', '18', '', '', 'y', 0, '5O1<$OZb)h''xmi*xG$3p*Os_R&VEv?O@N%''6$QsYCVV6*Lmm1[#KT8A_WA`&2`.G5t!9z\\FH"ud5Q85B:)S[2bSKRv=eci|=)+092R*EBV\\GC=]9+CM!k|#Rpn<s:rO=', ''),
(3, 6, 'animateur', 'Animateur', 'b00a13aee13a2287a4e70c10ec0fc1a84a9a98de', '173e207a8ad6c009c278c0e38cd5f2724ba1c406', NULL, '', 'animateur@candt.org', '', '', '', '', 0, 0, 0, '', '', '', '', '', '', '', 0, 0, '', 0, 0, '', 0, 0, '', 0, 'y', 0, 0, '86.178.103.4', 1289904430, 1306495330, 1306842668, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'n', 'n', 'y', 'y', '', '', 'n', 'n', 'us', '', '', '', '', '28', '', '18', '', '', 'y', 0, '', ''),
(4, 1, 'josh', 'Super Admin 2', '432cb67d7ccfd744ae7542aecdf527f7a0fdae140e157cfa5e0d56417c23a1cc2f00bb65a7f2efeb3ed3c33a55a77e32f68fc31c14381d9d667398f86a4976d2', 'b296477947655869eccea71daaf656a8ec2d1b7b', '7cfe92a5f6837cfceba332f330d59b1bc7b11c4f', NULL, 'josh@supercooldesign.co.uk', '', 'Birmingham, UK', '', '', NULL, NULL, NULL, '', '', '', '', 'Josh''s bio bio bio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '127.0.0.1', 1313482763, 1328526559, 1329296798, 0, 0, 0, 0, 1314359434, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'n', 'n', 'y', 'y', 'english', 'UTC', 'n', 'n', 'us', NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, NULL, 'n', 0, '7CJg?%OFR&pQuXgWE)EvLt}+O<[z4ng<DW94=!(}zXrW+Yp,56[ItNDn#aXD''[3m!8"a(y7(v*=~''yg1?fWa%!aP%2auga(q5%X}@L=o)%36:[syW.<+j%k{[,J:q#d3', ''),
(5, 5, 'tester', 'tester1', '4de2cd1690f71bdbe0873ef325fcfcd5a87404ecd6bcee3364ad8356dc9e9c68691ba75a5516acc4f68d1d23b08ce6be5d092cd4374486890daca1709aa6f652', '3508e91abc4f5cca506bf51f5c1ff48e02064a1a', 'e6cf270c9ddece836bc82e168bd8a962c18c50f2', 'SJK1RPaB1i', 'test@test.com', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '127.0.0.1', 1314277555, 1314277646, 1314279352, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'n', 'n', 'y', 'y', 'english', 'UTC', 'n', 'n', 'us', NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, NULL, 'n', 0, '_#na]R4FAasHI<gcT)7$!Sn3~h=}]R/Z5RxZ`lX''VE9j/"&wL!o(M^R"=;Pv2-=k,d*RW.F''&s.0<_6tff}D~8re@~hk261X}iO/f{9P|2kWP67h\\qDF,uUf''T-pEvTD', 'c133a191eed3616bd708f5f8513598ea'),
(6, 7, 'tester3', 'tester3', '70983681bc387bfe9e65ce9b0d9cf35cdda3548e452e5b2bc6626a7a93443bb40799fa0d1d404beb724d56a99442e09ce98b25ec816288e830b2ac897ef3d191', 'abcb57077a9441c310a42efa07ff2ffca59c23d7', '97a9cc4e358728b5e972f13a568ee95766b99a67', 'Co1fNZEKZf', 'tester@test.com', '', 'in the world', '', '', NULL, NULL, NULL, '', '', '', '', 'tester 3 has a bio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '127.0.0.1', 1314347910, 1314359869, 1314372800, 0, 0, 0, 0, 1314367752, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'n', 'n', 'y', 'y', 'english', 'UTC', 'n', 'n', 'us', NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, NULL, 'n', 0, 'Qad{cN]O.)mz@2:OH-5JsE?XR?xl.B\\&d3["`RXX0+M*WsnA1wm>1>x\\]wi2hv5A/*}3z=!wFA+OR2;8]pWxH!6pc?}My*JM(H.[/zg4)KI1gri`6k\\VAZ}1h4k8B00t', 'ae7b77dbb0495bf4a5a87f8c848129d3'),
(7, 5, 'paulsutton', 'Paul Sutton', 'fd2432ec310309d4ec7f3b9f41763c168745f9809fbaf280522f67e962ece144cceff7114bd6173327b1b138b475e06e91a37ad77e6c895a6d5e5fd79971fa34', '44b2988327df5f99266821a8268ba99d5703b9ab', '1eac5e024d3abfe8bf27a21c6505f7b235cd8e5c', NULL, 'paul.sutton@candt.org', '', 'C&T Team 1', '', '', NULL, NULL, NULL, '', '', '', '', 'I''m Artistic Director of C&T.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '90.214.8.4', 1322238442, 1328529367, 1328723229, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'UTC', 'n', 'n', 'us', NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, 'Manage Members|index.php?S=2f0534920e27968b8a1a2cf2bd39d3c40dcc75f6&amp;D=cp&amp;C=addons_modules&M=show_module_cp&module=member_categories|1\nManage Bouts|index.php?S=16084953bc64d6366c4cebed324ca61b2b551c2e&amp;D=cp&amp;C=admin_content&M=category_editor&group_id=2|2', 'n', 0, 'h-wo83}LF;bjQ]3LM[kS1Ab_/EtrN?]u$@IrP+)*bG#[3l,:[%@Y:SrS6mx(c1uK05sjCny542a8#A<;[ZCYXP?v1SiISO8:P2rQh@fkynku#-hIu@9h`BrO7};@.ku9', ''),
(8, 7, 'gbertndalv', 'gbertndalv', 'aa5a6c9a97e225ed26f4b967ef4bd749b1a6fa7f', 'c0bcad94e34f84329803b2273dbcbc87d8e07f71', NULL, '', '1212new@dietreviewers.com', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '173.254.207.13', 1324069534, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'UTC', 'n', 'n', 'us', NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, NULL, 'n', 0, '', ''),
(9, 7, 'flowshower', 'flowshower', 'e543559ae17714fb0af54222a700a71ab065bd3775e303cbac1ab5a67c12adaf34dda495e2b028d7acad35a0145e7c6a58178e58c8b8385fb152c1418093f2f2', 'f8868785df7a95fbde297cfd6e46ba1d8bffe87b', '82782b4c91c8bccd91b037a1811534bd4e8513d4', '', 'flowshower@yahoo.com', '', '', '', '', NULL, NULL, NULL, '', '', '', '', '<a href=''http://www.floshowers.com''>India flower delivery</a>\n<a href=''http://www.floshowers.com''>Send flowers to india</a>\n<a href=''http://www.floshowers.com/bangalore-flowers''>Flower Delivery Bangalore</a>\nhttp://roundersnetwork.com/blog/index.php/member/37976/\nhttp://www.ibelong.ca/index.php/member/178\nhttp://www.newbeginningsgrace.com/?/member/2001\nhttp://www.livingdownstream.com/forums/member/2039/\nhttp://www.crafts-beautiful.com/index.php/member/208300/\nhttp://www.bodywayonline.com/i/member/12724/\nhttp://ctrlaltdeltraining.com/index.php/member/32643/\nhttp://www.cybersecurityinstitute.com/index.php/member/5303\nhttp://www.techtipsblog.com/index.php/member/119402/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '182.177.166.84', 1324900861, 1324902586, 1324902889, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'UTC', 'n', 'n', 'us', NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, NULL, 'n', 0, 'Hv9aY&|t-;''n{g$o*Hu9.G,%Fdi)I}DnA;t,:C@''&ZLKz&iutSr0&A$I^**@;gb.@u]?8dyV''qGc,8rG`|''vkMAQ04<^};?2^UyuIiL{JY-RT{PZx0v}4_ExFA6l3vX8', 'be90a718976f69bee06d1d188d29716a'),
(10, 4, 'yannedyx99', 'yannedyx99', '9d2dbd7d78cbecc4adefdc7883f1b29d8e076a23', '72176b0ad808df53de7fccfb1b9c7b44e40b94be', NULL, 'q9D7pRE6q4', 'kevinhaber412@hotmail.com', 'http://{http://www.vacationhomerentals.com/61869|http://www.vacationhomerentals.com/62138|http://www.vacationhomerentals.com/62139|http://www.4beachnu', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '173.234.158.93', 1324948546, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'UTC', 'n', 'n', 'us', NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, NULL, 'n', 0, '', ''),
(11, 7, 'alfredcarlos', 'alfredcarlos', '0499a0ccd6542335e5bdea2fe94b94afc8384b6736d70db38c5dd4bb0c82b68995781d86b75f0de4dbde5f40d2ddf049b6af3ba83ce5326f89eccf254e6f1efb', '35ae709c0468ed92a39f2013e7903c07185f062c', '7dd515c4fdf22b5d897411fe1d376082871326a5', '', 'alfredcarlos83@yahoo.co.uk', 'http://www.scalextreme.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '182.177.246.185', 1325071444, 1325094366, 1325094366, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'UTC', 'n', 'n', 'us', NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, NULL, 'n', 0, '3b?tY4D8|xnJrkX0>YZO\\dW"J6WA''DKx\\c:dE?jh`rJ/Arhiq^2dWNa+Xp!_:1[<?z-l+WVvQ;2DIu.qh{J7NThLuo>*X@1&(qfj2?rbpA<ri54>k/7W#B}af%2E\\m(s', 'fcbf70db267e07da2e6c3abb133af50a'),
(12, 4, 'LaurenBsmith', 'LaurenBsmith', '5228bc593d84ecd77e3cc7f801887b474e524ee0', 'ad4111ca34c8a761782f2e559cc00e09e1a363c2', NULL, 'rLW5DxqPPJ', 'nakshatranamish@gmail.com', 'http://lojra.it', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '173.234.29.107', 1325517112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'UTC', 'n', 'n', 'us', NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, NULL, 'n', 0, '', ''),
(13, 7, 'flowshower11', 'flowshower11', '707ea8e718fd52adf85d513416dc6cfc85e1723eba53e4573925b485dd8465fcd971409754ec9a9f89a86fdc851b5e12c85e818a84a3229a950f4c514c3b2aac', '17e391166b60a2b4cf1396249671780b1dcd910c', 'bdd088a4d77164bc97204f4a660ceb3aaf7f16c4', '', 'flowshower11@yahoo.com', '', '', '', '', NULL, NULL, NULL, '', '', '', '', '<a href=''http://www.floshowers.com''>India flower delivery</a>\n<a href=''http://www.floshowers.com''>Send flowers to india</a>\n<a href=''http://www.floshowers.com/bangalore-flowers''>Flower Delivery Bangalore</a>\nhttp://www.repoa.or.tz/index.php/member/3237/\nhttp://www.gjsentinel.com/members/108670\nhttp://www.specialityfoodmagazine.com/site/index.php/member/8496/\nhttp://www.cartoonity.com/member/43781/\nhttp://codelaboratories.com/member/57442/\nhttp://dern.org.au/index.php/member/78011/\nhttp://www.mysa.com.au/S=40072fe3d3a66b37272afb441dae6c0e05905376/member/3714\nhttp://www.livingdownstream.com/forums/member/2229/\nhttp://www.dead-frog.com/member/10917\nhttp://www.kimberlybaker.com/member/3402/\nhttp://www.wipconnector.com/member/2205\nhttp://www.newformant.com/index.php/member/23911/\nhttp://www.bhavanasociety.org/member/11149/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '182.177.137.72', 1325586814, 1325588970, 1325589664, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'UTC', 'n', 'n', 'us', NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, NULL, 'n', 0, '~3.<"4u<kF*#qIMlCL~&?_r-?s^o`xnT\\jka~vAh;Uk5K5"s7[?Xpt(:jaOybL]"E<@JJws/YQlT#nU`#FB^Tt*Qkoyn2_c;EopXcMy$G8[w@}4WxijQ/!N&}!<rfZ[q', '7d01de57798fbaafd7822f11a814e439'),
(14, 7, 'dawdmijae', 'dawdmijae', '15f1d022ad592388f80d34d52174491052883723d08280eed67e5a3b4868d4a624990bd2d315e7113ea5e5dfc8b530e0bbecdbbcf70b4209a0e2baae839a5ff5', '175d5347ad7c170fdb78a4f52bd1e19fe1d585cd', 'bde5c22866cf274c01d227521ddd2a740a38bd55', '', 'alekmerol1@wkime.pl', 'http://graj-online.pl', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '178.73.44.4', 1326039548, 1326039606, 1326133944, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'UTC', 'n', 'n', 'us', NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, NULL, 'n', 0, '\\t@SP0d\\g!~9:B[X?k<5sfwgW5-)~WV+.2DGu$3X_BHa>0\\T>`)w0$bAMQ1''/>pi`(%QAc@>0Ot~+"m={x$w#*c<?{6mC|$*;K#R3^|/m[SW4XO*q}&|Y^9EOEZd7:-''', 'c13a98fa89b38dba33b0ddb69aa38364'),
(15, 7, 'rprouty', 'SHSDrama', 'f705b980422acd35f2cd0e66acaf13b4d00e0059d00fdd412c960fcfb6427b753e86aa676415ec0ffa65d6b41402b2d9795ac6f566834d9f23d556ef95467a95', '855ad366f29b82e3e12f87e3daaa0c7f582993a0', 'b12aed88a08447377ff2c7c371b73859248b9de9', '', 'rprouty@shschools.org', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '67.111.218.66', 1326318472, 1326319139, 1328201642, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'UTC', 'n', 'n', 'us', NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, NULL, 'n', 0, 'kGo";h1E.dD,qjuJ6Jxpo=mA0<''UXn}#CJ),7RW{A\\`Ri,pLUoE<P"AjeIhFQcv2;mvj&g~YZ6}''Wg1piuAo{V2m_/XJZ''=RbBiZu''pAz&ZOJN!U@zDb4%)|_yTsD;\\%', ''),
(16, 4, 'BafMypeweally', 'BafMypeweally', '6757cf1c13b42df70619465d6346e87a150ab6b1', 'cb44389a69a5d81f3d25063cea5de365d71382e1', NULL, 'UaxwR6zPwg', 'nikifordimon@gmail.com', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '159.224.130.96', 1326444722, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'UTC', 'n', 'n', 'us', NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, NULL, 'n', 0, '', ''),
(17, 7, 'LemnPriemia', 'LemnPriemia', '879a1d0193abd2bdfc350b43c0b8b71e982604a92183b1f0701fd6f85fa5dc9400e0bd44fa89b1c3246f017e5a48ee3fb76bb8d98ea53b7bca23cea7d3c729c4', 'f0cc61c4bfe204ec830d26308d04a6d0b6309ccc', '094d564abd050033986f0b0a4b7c3c8065395e8e', '', 'omekrjdk@wkime.pl', '', 'Costa Rica', '', '', NULL, NULL, NULL, '', '', '', '', 'gry [url=http://gryyonline.pl]gry online[/url] lal la a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '178.73.44.4', 1326445077, 1326445109, 1326445109, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'UTC', 'n', 'n', 'us', NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, NULL, 'n', 0, '8}ItwZ]LaCZ,z98Y#{5CvuF\\:IL6Txxe&0&#}Y1xHr&H3qRtF8kry2STMP$8c:[[2X:k(PIrI^bkeZWl9`C}kuJi\\si$h8IHoRkO8mA0>dl[`9$hjgQHOdO)f0*3O9=*', ''),
(18, 7, 'matunekeod', 'matunekeod', 'a4d3f8241ec3157b86adfe5ab4280bb1116498aff49924e19bf7c7540357a907f7cdda1b03218d05c1c1fe6bacf606598855de2a0a55cbc9f0f3279f181cf602', '53a45cebb445ee5f09157c4a94fe5280572fe39e', '964aa197993225b410e5329d9a020e01dfd3e1b1', '', 'popeowpqwo@wkime.pl', 'http://graj-online.pl', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '178.73.44.4', 1326487694, 1326490675, 1326490675, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'UTC', 'n', 'n', 'us', NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, NULL, 'n', 0, '0qg`-4CB1dQRq7e\\{&AC2?~^T''Nk(8^:43_|t7}Na]+g2f(t~Aslxd=+C\\d)AG|DV4Cy63]euN"FCn8,D&u*/5`vPHVe''j(zOaGee>rmq:`+`Qpu@<4E'';\\k=EBGO9iI', '010d81b5aaf72d212b92c192155d6b37'),
(19, 7, 'ecosorlerie', 'ecosorlerie', 'b362b79e5362b6a87edab626de0acca7d31599ec2b3064ae7f096cb8d4db60967bf552a4ae7041be6cf58e40f0d227664b2ed1e2599fe51c2d1a4b94b29b40f7', 'c7e9d5cfc3372996246535b4564b96e1336779db', '7a5a064c343c8d7e676519f2d6969c85583d5f7b', '', 'parav.ozidet@gmail.com', 'http://arabio.tk', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '159.224.130.96', 1328637051, 1328688694, 1328701577, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'UTC', 'n', 'n', 'us', NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, NULL, 'n', 0, 'Yd&c9IH\\SDH*wAF-QX7`:X_ra*PCg7;1]YN`u21v4]~[K?&.ql$`RXh$1_n3!:tI7?"W/!Q?%ExpV3Z9/A\\&K3<Gb|.Q]_4MTVbas*atod=@;i&Rs%WxT4|A]7wK3{$}', ''),
(20, 7, 'jcaseylane', 'theatrelane', 'c3167167a728e65c186b23394c43416b30c74ed9c567645739a2dd485d8814fc266fcc928a1aefcf91370839d89dd8ac91e3d9feb903435d2537589c8f8e92e7', '4c86ed16d95d38547855290b827296b656cc9996', '424a95c9a1a4745a36ec4fe497a95a75128ada85', '', 'calane@natickps.org', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '209.6.3.150', 1328639985, 1328640022, 1328881294, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'UTC', 'n', 'n', 'us', NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, NULL, 'n', 0, 'rO04[Z{8!{);Z|0@@#irq%B#O=i3{.mu<#uiABF9Wu.|UQ0eab,.s<G[=I@ag+e4oW<Hmhu-tzY]t1v>/T%w33Gp^H(,eWzv8Ucf"nS!`N_/C~eG={oM?316;&(:<er2', ''),
(21, 4, 'EstastBindVit', 'EstastBindVit', '66e1f322670c063125c361c410fdcb4719c97815', '74682912aa4c75a8c29d14a5c203e42b6c04405b', NULL, 'yQraeuXzfx', 'sresiuerew@gmail.com', 'http://luxokna.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '159.224.130.96', 1328787386, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'UTC', 'n', 'n', 'us', NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, NULL, 'n', 0, '', ''),
(22, 7, 'durkeepepper', 'durkeepepper', 'a5f83b06efce3e40e8d0e4833bcacc05473a1849a0817c63fed09bf81164a3795326fc73fa8a56c136197d78fe9a565a0d7d34703a66888a941338de93aa4351', 'bbbbdc2aaf90e442e14df3bca1fe0d40ffa441c4', 'f06cc9710ecda4981a7764d4ec8888ce17de0123', '', 'durkeepepper@aol.com', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '165.155.192.78', 1328794110, 1328794500, 1328794500, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'UTC', 'n', 'n', 'us', NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, NULL, 'n', 0, '<c9m`_8VVWX,&/GdJB-wK;tW[ACou5Sno0d5~~on!#u[|@%<:}7NUP6)E5RegF9gnefj>88JCZ]'']jSY''=DqO|Ir9yl[=]rH[vCGlcLdX$OQ`qUdC8)$''6LK@`~KQita', ''),
(23, 7, 'Unreriwoowl', 'Unreriwoowl', '072daa606e2e118d60e3994fa37febde85619465c143a660f944bdc8f4ca16ceabe2fbe7c8fc4c9d5233aeaf483f81d6bde8ef785e296b16a3376b1bf4b5a29a', '67dd3393171240ad8c752b19fd094501eefc73ca', 'c9579f591c209508ed6369ff806a4ce7030390f2', '', 'nasgerbaevs@gmail.com', 'http://luxdoska.ru', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '159.224.130.46', 1328799869, 1328803332, 1328803332, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'UTC', 'n', 'n', 'us', NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, NULL, 'n', 0, '*O[O~zS|[@,d*n69}:,1AePD!$}6]jAQ;CA?E?3@)fu(~09;D,]*oh|hI|\\v0]Uf@s^fagr|vMg"ssYuS&|=0/YZUw_)0tz"WC+&$DW2zu$"m:|4]l\\^Fz(&[fb6RON_', ''),
(24, 4, 'Chris718', 'Hartmann', 'b55d0b81fc735d50d3a132fd43925bafe426cb7f', '76057e6473fabadd494834e111cfbc1909ed3d5f', NULL, 'hYLEJcVVw0', 'CJHartmann718@aol.com', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '24.90.183.160', 1328826262, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'UTC', 'n', 'n', 'us', NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, NULL, 'n', 0, '', ''),
(25, 7, 'Serclove', 'Serclove', '6a17e64ef2d8f70a5eb00e21b5d4688e6f787237555275738ff3fd51c1b9e56d697b8eb7f43b7620dab15c9ce1dab5f0c36f2c3e20219ddb3556bd618a41e081', '857e274efa7414b6a95be139ad07ca8661ad3444', '48dd35414f7f379298313307580b335d356a77c1', '', 'Serclove@yahoo.com', '', '', '', '', NULL, NULL, NULL, '', '', '', '', '<a href="http://www.redbottomheels-sale.com/">red sole shoes</a>\n<a href="http://www.redbottomheels-sale.com/">red bottom shoes</a>\n<a href="http://www.cheap-beatsbydrdreoutlet.com/">Cheap Dr Dre Beats</a> \n<a href="http://www.cheap-beatsbydrdreoutlet.com/">Dre Beats Outlet</a>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '59.58.136.209', 1328857917, 1328858191, 1328858191, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'UTC', 'n', 'n', 'us', NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, NULL, 'n', 0, 'NK:S;t$Ik(G:Dq,H''qCx?uVCiz-f>[{5!Y#viQu?d''}:4w%Yt;R==Poh^1)Fy1v"b?<<ovtQlUXXeVNX5q]1|9x4Igr_=m5>bM3fkx<K&@y5ug&U3;g9ys6]nl0ACUjo', 'f26586afd522ded04a5b468a2288d765');

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_bulletin_board`
--

CREATE TABLE `exp_member_bulletin_board` (
  `bulletin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL,
  `bulletin_group` int(8) unsigned NOT NULL,
  `bulletin_date` int(10) unsigned NOT NULL,
  `hash` varchar(10) NOT NULL DEFAULT '',
  `bulletin_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `bulletin_message` mediumtext NOT NULL,
  PRIMARY KEY (`bulletin_id`),
  KEY `sender_id` (`sender_id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_data`
--

CREATE TABLE `exp_member_data` (
  `member_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_member_data`
--

INSERT INTO `exp_member_data` (`member_id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(22),
(23),
(24),
(25);

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_fields`
--

CREATE TABLE `exp_member_fields` (
  `m_field_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `m_field_name` varchar(32) NOT NULL,
  `m_field_label` varchar(50) NOT NULL,
  `m_field_description` mediumtext NOT NULL,
  `m_field_type` varchar(12) NOT NULL DEFAULT 'text',
  `m_field_list_items` mediumtext NOT NULL,
  `m_field_ta_rows` tinyint(2) DEFAULT '8',
  `m_field_maxl` smallint(3) NOT NULL,
  `m_field_width` varchar(6) NOT NULL,
  `m_field_search` char(1) NOT NULL DEFAULT 'y',
  `m_field_required` char(1) NOT NULL DEFAULT 'n',
  `m_field_public` char(1) NOT NULL DEFAULT 'y',
  `m_field_reg` char(1) NOT NULL DEFAULT 'n',
  `m_field_cp_reg` char(1) NOT NULL DEFAULT 'n',
  `m_field_fmt` char(5) NOT NULL DEFAULT 'none',
  `m_field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`m_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_groups`
--

CREATE TABLE `exp_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_title` varchar(100) NOT NULL,
  `group_description` mediumtext NOT NULL,
  `is_locked` char(1) NOT NULL DEFAULT 'y',
  `can_view_offline_system` char(1) NOT NULL DEFAULT 'n',
  `can_view_online_system` char(1) NOT NULL DEFAULT 'y',
  `can_access_cp` char(1) NOT NULL DEFAULT 'y',
  `can_access_content` char(1) NOT NULL DEFAULT 'n',
  `can_access_publish` char(1) NOT NULL DEFAULT 'n',
  `can_access_edit` char(1) NOT NULL DEFAULT 'n',
  `can_access_files` char(1) NOT NULL DEFAULT 'n',
  `can_access_fieldtypes` char(1) NOT NULL DEFAULT 'n',
  `can_access_design` char(1) NOT NULL DEFAULT 'n',
  `can_access_addons` char(1) NOT NULL DEFAULT 'n',
  `can_access_modules` char(1) NOT NULL DEFAULT 'n',
  `can_access_extensions` char(1) NOT NULL DEFAULT 'n',
  `can_access_accessories` char(1) NOT NULL DEFAULT 'n',
  `can_access_plugins` char(1) NOT NULL DEFAULT 'n',
  `can_access_members` char(1) NOT NULL DEFAULT 'n',
  `can_access_comm` char(1) NOT NULL DEFAULT 'n',
  `can_access_utilities` char(1) NOT NULL DEFAULT 'n',
  `can_access_data` char(1) NOT NULL DEFAULT 'n',
  `can_access_logs` char(1) NOT NULL DEFAULT 'n',
  `can_access_admin` char(1) NOT NULL DEFAULT 'n',
  `can_access_sys_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_access_content_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_access_tools` char(1) NOT NULL DEFAULT 'n',
  `can_admin_channels` char(1) NOT NULL DEFAULT 'n',
  `can_admin_upload_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_admin_design` char(1) NOT NULL DEFAULT 'n',
  `can_admin_members` char(1) NOT NULL DEFAULT 'n',
  `can_delete_members` char(1) NOT NULL DEFAULT 'n',
  `can_admin_mbr_groups` char(1) NOT NULL DEFAULT 'n',
  `can_admin_mbr_templates` char(1) NOT NULL DEFAULT 'n',
  `can_ban_users` char(1) NOT NULL DEFAULT 'n',
  `can_admin_modules` char(1) NOT NULL DEFAULT 'n',
  `can_admin_templates` char(1) NOT NULL DEFAULT 'n',
  `can_edit_categories` char(1) NOT NULL DEFAULT 'n',
  `can_delete_categories` char(1) NOT NULL DEFAULT 'n',
  `can_view_other_entries` char(1) NOT NULL DEFAULT 'n',
  `can_edit_other_entries` char(1) NOT NULL DEFAULT 'n',
  `can_assign_post_authors` char(1) NOT NULL DEFAULT 'n',
  `can_delete_self_entries` char(1) NOT NULL DEFAULT 'n',
  `can_delete_all_entries` char(1) NOT NULL DEFAULT 'n',
  `can_view_other_comments` char(1) NOT NULL DEFAULT 'n',
  `can_edit_own_comments` char(1) NOT NULL DEFAULT 'n',
  `can_delete_own_comments` char(1) NOT NULL DEFAULT 'n',
  `can_edit_all_comments` char(1) NOT NULL DEFAULT 'n',
  `can_delete_all_comments` char(1) NOT NULL DEFAULT 'n',
  `can_moderate_comments` char(1) NOT NULL DEFAULT 'n',
  `can_send_email` char(1) NOT NULL DEFAULT 'n',
  `can_send_cached_email` char(1) NOT NULL DEFAULT 'n',
  `can_email_member_groups` char(1) NOT NULL DEFAULT 'n',
  `can_email_mailinglist` char(1) NOT NULL DEFAULT 'n',
  `can_email_from_profile` char(1) NOT NULL DEFAULT 'n',
  `can_view_profiles` char(1) NOT NULL DEFAULT 'n',
  `can_edit_html_buttons` char(1) NOT NULL DEFAULT 'n',
  `can_delete_self` char(1) NOT NULL DEFAULT 'n',
  `mbr_delete_notify_emails` varchar(255) DEFAULT NULL,
  `can_post_comments` char(1) NOT NULL DEFAULT 'n',
  `exclude_from_moderation` char(1) NOT NULL DEFAULT 'n',
  `can_search` char(1) NOT NULL DEFAULT 'n',
  `search_flood_control` mediumint(5) unsigned NOT NULL,
  `can_send_private_messages` char(1) NOT NULL DEFAULT 'n',
  `prv_msg_send_limit` smallint(5) unsigned NOT NULL DEFAULT '20',
  `prv_msg_storage_limit` smallint(5) unsigned NOT NULL DEFAULT '60',
  `can_attach_in_private_messages` char(1) NOT NULL DEFAULT 'n',
  `can_send_bulletins` char(1) NOT NULL DEFAULT 'n',
  `include_in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `include_in_memberlist` char(1) NOT NULL DEFAULT 'y',
  `include_in_mailinglists` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`group_id`,`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_member_groups`
--

INSERT INTO `exp_member_groups` (`group_id`, `site_id`, `group_title`, `group_description`, `is_locked`, `can_view_offline_system`, `can_view_online_system`, `can_access_cp`, `can_access_content`, `can_access_publish`, `can_access_edit`, `can_access_files`, `can_access_fieldtypes`, `can_access_design`, `can_access_addons`, `can_access_modules`, `can_access_extensions`, `can_access_accessories`, `can_access_plugins`, `can_access_members`, `can_access_comm`, `can_access_utilities`, `can_access_data`, `can_access_logs`, `can_access_admin`, `can_access_sys_prefs`, `can_access_content_prefs`, `can_access_tools`, `can_admin_channels`, `can_admin_upload_prefs`, `can_admin_design`, `can_admin_members`, `can_delete_members`, `can_admin_mbr_groups`, `can_admin_mbr_templates`, `can_ban_users`, `can_admin_modules`, `can_admin_templates`, `can_edit_categories`, `can_delete_categories`, `can_view_other_entries`, `can_edit_other_entries`, `can_assign_post_authors`, `can_delete_self_entries`, `can_delete_all_entries`, `can_view_other_comments`, `can_edit_own_comments`, `can_delete_own_comments`, `can_edit_all_comments`, `can_delete_all_comments`, `can_moderate_comments`, `can_send_email`, `can_send_cached_email`, `can_email_member_groups`, `can_email_mailinglist`, `can_email_from_profile`, `can_view_profiles`, `can_edit_html_buttons`, `can_delete_self`, `mbr_delete_notify_emails`, `can_post_comments`, `exclude_from_moderation`, `can_search`, `search_flood_control`, `can_send_private_messages`, `prv_msg_send_limit`, `prv_msg_storage_limit`, `can_attach_in_private_messages`, `can_send_bulletins`, `include_in_authorlist`, `include_in_memberlist`, `include_in_mailinglists`) VALUES
(1, 1, 'Super Admins', '', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', '', 'y', 'y', 'y', 0, 'y', 20, 60, 'y', 'y', 'y', 'y', 'y'),
(2, 1, 'Banned', '', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', '', 'n', 'n', 'n', 60, 'n', 20, 60, 'n', 'n', 'n', 'n', 'n'),
(3, 1, 'Guests', '', 'y', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'n', 'n', '', 'y', 'n', 'y', 2, 'n', 20, 60, 'n', 'n', 'n', 'n', 'n'),
(4, 1, 'Pending', '', 'y', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'n', 'n', '', 'y', 'n', 'y', 15, 'n', 20, 60, 'n', 'n', 'n', 'n', 'n'),
(5, 1, 'Admin', '', 'y', 'n', 'y', 'y', 'y', 'y', 'y', 'n', 'n', 'n', 'y', 'y', 'n', 'n', 'n', 'y', 'n', 'n', 'n', 'n', 'y', 'y', 'y', 'n', 'y', 'n', 'n', 'y', 'y', 'y', 'y', 'y', 'n', 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'n', 'n', 'n', 'n', 'y', 'y', 'y', 'y', '', 'n', 'n', 'y', 1, 'n', 20, 60, 'y', 'n', 'y', 'y', 'y'),
(6, 1, 'Animateurs', '', 'y', 'n', 'y', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'n', '', 'y', 'n', 'y', 2, 'n', 20, 60, 'n', 'n', 'n', 'n', 'n'),
(7, 1, 'Members', '', 'n', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'n', 'n', '', 'y', 'n', 'y', 2, 'n', 20, 60, 'n', 'n', 'n', 'n', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_homepage`
--

CREATE TABLE `exp_member_homepage` (
  `member_id` int(10) unsigned NOT NULL,
  `recent_entries` char(1) NOT NULL DEFAULT 'l',
  `recent_entries_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_comments` char(1) NOT NULL DEFAULT 'l',
  `recent_comments_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_members` char(1) NOT NULL DEFAULT 'n',
  `recent_members_order` int(3) unsigned NOT NULL DEFAULT '0',
  `site_statistics` char(1) NOT NULL DEFAULT 'r',
  `site_statistics_order` int(3) unsigned NOT NULL DEFAULT '0',
  `member_search_form` char(1) NOT NULL DEFAULT 'n',
  `member_search_form_order` int(3) unsigned NOT NULL DEFAULT '0',
  `notepad` char(1) NOT NULL DEFAULT 'r',
  `notepad_order` int(3) unsigned NOT NULL DEFAULT '0',
  `bulletin_board` char(1) NOT NULL DEFAULT 'r',
  `bulletin_board_order` int(3) unsigned NOT NULL DEFAULT '0',
  `pmachine_news_feed` char(1) NOT NULL DEFAULT 'n',
  `pmachine_news_feed_order` int(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_member_homepage`
--

INSERT INTO `exp_member_homepage` (`member_id`, `recent_entries`, `recent_entries_order`, `recent_comments`, `recent_comments_order`, `recent_members`, `recent_members_order`, `site_statistics`, `site_statistics_order`, `member_search_form`, `member_search_form_order`, `notepad`, `notepad_order`, `bulletin_board`, `bulletin_board_order`, `pmachine_news_feed`, `pmachine_news_feed_order`) VALUES
(1, 'l', 1, 'l', 2, 'n', 0, 'r', 1, 'n', 0, 'r', 2, 'r', 0, 'l', 0),
(2, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0),
(3, 'n', 0, 'n', 0, 'n', 0, 'n', 0, 'n', 0, 'n', 0, 'n', 0, 'n', 0),
(4, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0),
(5, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0),
(6, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0),
(7, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0),
(8, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0),
(9, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0),
(10, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0),
(11, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0),
(12, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0),
(13, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0),
(14, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0),
(15, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0),
(16, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0),
(17, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0),
(18, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0),
(19, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0),
(20, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0),
(21, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0),
(22, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0),
(23, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0),
(24, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0),
(25, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_search`
--

CREATE TABLE `exp_member_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `search_date` int(10) unsigned NOT NULL,
  `keywords` varchar(200) NOT NULL,
  `fields` varchar(200) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL,
  `total_results` int(8) unsigned NOT NULL,
  `query` mediumtext NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `member_id` (`member_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_member_search`
--

INSERT INTO `exp_member_search` (`search_id`, `site_id`, `search_date`, `keywords`, `fields`, `member_id`, `ip_address`, `total_results`, `query`) VALUES
('118b3e177fba8973342fa9b8ea89aeff', 1, 1324902870, 'flowshower', 'Screen Name', 9, '182.177.166.84', 1, 'SELECT m.member_id FROM exp_members m\n					WHERE m.group_id NOT IN (''3'', ''4'',''2'') AND m.screen_name LIKE ''%flowshower%'' '),
('f20871ee6842e3a881f18d87ea86eb35', 1, 1325589689, 'flowshower11', 'Screen Name', 13, '182.177.137.72', 1, 'SELECT m.member_id FROM exp_members m\n					WHERE m.group_id NOT IN (''3'', ''4'',''2'') AND m.screen_name LIKE ''%flowshower11%'' ');

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_attachments`
--

CREATE TABLE `exp_message_attachments` (
  `attachment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_name` varchar(50) NOT NULL DEFAULT '',
  `attachment_hash` varchar(40) NOT NULL DEFAULT '',
  `attachment_extension` varchar(20) NOT NULL DEFAULT '',
  `attachment_location` varchar(150) NOT NULL DEFAULT '',
  `attachment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_size` int(10) unsigned NOT NULL DEFAULT '0',
  `is_temp` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`attachment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_copies`
--

CREATE TABLE `exp_message_copies` (
  `copy_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `recipient_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_received` char(1) NOT NULL DEFAULT 'n',
  `message_read` char(1) NOT NULL DEFAULT 'n',
  `message_time_read` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_downloaded` char(1) NOT NULL DEFAULT 'n',
  `message_folder` int(10) unsigned NOT NULL DEFAULT '1',
  `message_authcode` varchar(10) NOT NULL DEFAULT '',
  `message_deleted` char(1) NOT NULL DEFAULT 'n',
  `message_status` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`copy_id`),
  KEY `message_id` (`message_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_data`
--

CREATE TABLE `exp_message_data` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_date` int(10) unsigned NOT NULL DEFAULT '0',
  `message_subject` varchar(255) NOT NULL DEFAULT '',
  `message_body` mediumtext NOT NULL,
  `message_tracking` char(1) NOT NULL DEFAULT 'y',
  `message_attachments` char(1) NOT NULL DEFAULT 'n',
  `message_recipients` varchar(200) NOT NULL DEFAULT '',
  `message_cc` varchar(200) NOT NULL DEFAULT '',
  `message_hide_cc` char(1) NOT NULL DEFAULT 'n',
  `message_sent_copy` char(1) NOT NULL DEFAULT 'n',
  `total_recipients` int(5) unsigned NOT NULL DEFAULT '0',
  `message_status` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_folders`
--

CREATE TABLE `exp_message_folders` (
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `folder1_name` varchar(50) NOT NULL DEFAULT 'InBox',
  `folder2_name` varchar(50) NOT NULL DEFAULT 'Sent',
  `folder3_name` varchar(50) NOT NULL DEFAULT '',
  `folder4_name` varchar(50) NOT NULL DEFAULT '',
  `folder5_name` varchar(50) NOT NULL DEFAULT '',
  `folder6_name` varchar(50) NOT NULL DEFAULT '',
  `folder7_name` varchar(50) NOT NULL DEFAULT '',
  `folder8_name` varchar(50) NOT NULL DEFAULT '',
  `folder9_name` varchar(50) NOT NULL DEFAULT '',
  `folder10_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_message_folders`
--

INSERT INTO `exp_message_folders` (`member_id`, `folder1_name`, `folder2_name`, `folder3_name`, `folder4_name`, `folder5_name`, `folder6_name`, `folder7_name`, `folder8_name`, `folder9_name`, `folder10_name`) VALUES
(1, 'InBox', 'Sent', '', '', '', '', '', '', '', ''),
(4, 'InBox', 'Sent', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_listed`
--

CREATE TABLE `exp_message_listed` (
  `listed_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_member` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_description` varchar(100) NOT NULL DEFAULT '',
  `listed_type` varchar(10) NOT NULL DEFAULT 'blocked',
  PRIMARY KEY (`listed_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_modules`
--

CREATE TABLE `exp_modules` (
  `module_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) NOT NULL,
  `module_version` varchar(12) NOT NULL,
  `has_cp_backend` char(1) NOT NULL DEFAULT 'n',
  `has_publish_fields` char(1) NOT NULL DEFAULT 'n',
  `settings` text,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `exp_modules`
--

INSERT INTO `exp_modules` (`module_id`, `module_name`, `module_version`, `has_cp_backend`, `has_publish_fields`, `settings`) VALUES
(1, 'Comment', '2.2', 'y', 'n', NULL),
(2, 'Emoticon', '1.0', 'n', 'n', NULL),
(3, 'Mailinglist', '3.0', 'y', 'n', NULL),
(4, 'Member', '1.3', 'n', 'n', NULL),
(5, 'Query', '1.0', 'n', 'n', NULL),
(6, 'Referrer', '2.0', 'y', 'n', NULL),
(7, 'Rss', '1.0', 'n', 'n', NULL),
(8, 'Stats', '2.0', 'n', 'n', NULL),
(10, 'Channel', '2.0.1', 'n', 'n', NULL),
(11, 'Search', '2.1', 'n', 'n', NULL),
(12, 'Deeploy_helper', '1.1.3', 'y', 'n', NULL),
(13, 'Freeform', '3.1.0', 'y', 'n', NULL),
(16, 'Jquery', '1.0', 'n', 'n', NULL),
(17, 'Member_categories', '1.1.0', 'y', 'n', 'a:1:{i:1;a:2:{s:13:"assign_parent";s:1:"y";s:15:"category_groups";a:1:{i:0;s:1:"2";}}}'),
(18, 'Safecracker', '2.1', 'y', 'n', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exp_module_member_groups`
--

CREATE TABLE `exp_module_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `module_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_module_member_groups`
--

INSERT INTO `exp_module_member_groups` (`group_id`, `module_id`) VALUES
(5, 17);

-- --------------------------------------------------------

--
-- Table structure for table `exp_online_users`
--

CREATE TABLE `exp_online_users` (
  `online_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `in_forum` char(1) NOT NULL DEFAULT 'n',
  `name` varchar(50) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `anon` char(1) NOT NULL,
  PRIMARY KEY (`online_id`),
  KEY `date` (`date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3172 ;

--
-- Dumping data for table `exp_online_users`
--

INSERT INTO `exp_online_users` (`online_id`, `site_id`, `member_id`, `in_forum`, `name`, `ip_address`, `date`, `anon`) VALUES
(3171, 1, 4, 'n', 'Super Admin 2', '127.0.0.1', 1329297075, 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_password_lockout`
--

CREATE TABLE `exp_password_lockout` (
  `lockout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login_date` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`lockout_id`),
  KEY `login_date` (`login_date`),
  KEY `ip_address` (`ip_address`),
  KEY `user_agent` (`user_agent`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=62 ;

--
-- Dumping data for table `exp_password_lockout`
--

INSERT INTO `exp_password_lockout` (`lockout_id`, `login_date`, `ip_address`, `user_agent`, `username`) VALUES
(61, 1328723221, '193.62.51.5', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/534.53.11 (KHTML, like Gecko) Version/5.1.3 Safari/534.53.10', 'paul sutton'),
(60, 1328723211, '193.62.51.5', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/534.53.11 (KHTML, like Gecko) Version/5.1.3 Safari/534.53.10', 'paul sutton'),
(59, 1328723207, '193.62.51.5', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/534.53.11 (KHTML, like Gecko) Version/5.1.3 Safari/534.53.10', 'paul sutton'),
(58, 1328526073, '90.214.166.184', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:9.0.1) Gecko/20100101 Firefox/9.0.1', 'jamescv6'),
(57, 1328526065, '90.214.166.184', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:9.0.1) Gecko/20100101 Firefox/9.0.1', 'jamescv6'),
(56, 1328525333, '90.214.166.184', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:9.0.1) Gecko/20100101 Firefox/9.0.1', 'jamescv6'),
(55, 1328525311, '90.214.166.184', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:9.0.1) Gecko/20100101 Firefox/9.0.1', 'jamescv6'),
(54, 1328453998, '92.28.194.134', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_2) AppleWebKit/534.52.7 (KHTML, like Gecko) Version/5.1.2 Safari/534.52.7', 'paul sutton'),
(53, 1328453986, '92.28.194.134', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_2) AppleWebKit/534.52.7 (KHTML, like Gecko) Version/5.1.2 Safari/534.52.7', 'paulsutton'),
(52, 1328453977, '92.28.194.134', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_2) AppleWebKit/534.52.7 (KHTML, like Gecko) Version/5.1.2 Safari/534.52.7', 'paul sutton'),
(51, 1328137643, '31.184.236.63', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; WOW64; Trident/5.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .N', 'Yolanda35Vang');

-- --------------------------------------------------------

--
-- Table structure for table `exp_ping_servers`
--

CREATE TABLE `exp_ping_servers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `server_name` varchar(32) NOT NULL,
  `server_url` varchar(150) NOT NULL,
  `port` varchar(4) NOT NULL DEFAULT '80',
  `ping_protocol` varchar(12) NOT NULL DEFAULT 'xmlrpc',
  `is_default` char(1) NOT NULL DEFAULT 'y',
  `server_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_referrers`
--

CREATE TABLE `exp_referrers` (
  `ref_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `ref_from` varchar(150) NOT NULL,
  `ref_to` varchar(120) NOT NULL,
  `ref_ip` varchar(16) NOT NULL DEFAULT '0',
  `ref_date` int(10) unsigned NOT NULL DEFAULT '0',
  `ref_agent` varchar(100) NOT NULL,
  PRIMARY KEY (`ref_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=433 ;

--
-- Dumping data for table `exp_referrers`
--

INSERT INTO `exp_referrers` (`ref_id`, `site_id`, `ref_from`, `ref_to`, `ref_ip`, `ref_date`, `ref_agent`) VALUES
(1, 1, 'http://webmail.names.co.uk/webmail/message.php5?id=215&mid=ac99e4c3581eec9ed7ff716fc9dead9b&uid=52131&folder=INBOX', 'http://www.2ndfolio.net/', '193.62.51.5', 1282742259, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-us) AppleWebKit/533.17.8 (KHTML, like Gecko) Ve'),
(2, 1, 'http://webmail.names.co.uk/webmail/message.php5?id=215&mid=ac99e4c3581eec9ed7ff716fc9dead9b&uid=52131&folder=INBOX', 'http://www.2ndfolio.net/', '193.62.51.5', 1282742475, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-us) AppleWebKit/533.17.8 (KHTML, like Gecko) Ve'),
(3, 1, 'http://webmail.names.co.uk/webmail/message.php5?id=40&mid=26f6c62c6b38c7a13e7f98dd4a000ea4&uid=2764&folder=INBOX', 'http://www.2ndfolio.net/', '193.62.51.5', 1282742531, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-us) AppleWebKit/533.17.8 (KHTML, like Gecko) Ve'),
(4, 1, 'http://webmail.names.co.uk/webmail/message.php5?id=40&mid=26f6c62c6b38c7a13e7f98dd4a000ea4&uid=2764&folder=INBOX', 'http://www.2ndfolio.net/', '193.62.51.5', 1282742620, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-us) AppleWebKit/533.17.8 (KHTML, like Gecko) Ve'),
(5, 1, 'http://webmail.names.co.uk/webmail/message.php5?id=40&mid=26f6c62c6b38c7a13e7f98dd4a000ea4&uid=2764&folder=INBOX', 'http://www.2ndfolio.net/', '193.62.51.5', 1282742771, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-us) AppleWebKit/533.17.8 (KHTML, like Gecko) Ve'),
(6, 1, 'http://webmail.names.co.uk/webmail/message.php5?id=40&mid=26f6c62c6b38c7a13e7f98dd4a000ea4&uid=2764&folder=INBOX', 'http://www.2ndfolio.net/', '193.62.51.5', 1282743496, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-us) AppleWebKit/533.17.8 (KHTML, like Gecko) Ve'),
(7, 1, 'http://webmail.names.co.uk/webmail/message.php5?id=40&mid=26f6c62c6b38c7a13e7f98dd4a000ea4&uid=2764&folder=INBOX', 'http://www.2ndfolio.net/', '193.62.51.5', 1282744651, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-us) AppleWebKit/533.17.8 (KHTML, like Gecko) Ve'),
(8, 1, 'http://www.baidu.com', 'http://www.2ndfolio.net/', '61.187.94.226', 1283371408, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;)'),
(9, 1, 'http://www.google.co.uk/search?hl=en&client=safari&rls=en&q=2nd+folio&aq=f&aqi;=&aql;=&oq;=&gs;_rfai=', 'http://www.2ndfolio.net/', '193.62.51.5', 1283510648, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-us) AppleWebKit/533.17.8 (KHTML, like Gecko) Ve'),
(10, 1, 'http://www.google.co.uk/search?hl=en&client=safari&rls=en&q=2nd+folio&aq=f&aqi;=&aql;=&oq;=&gs;_rfai=', 'http://www.2ndfolio.net/', '193.62.51.5', 1283510660, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-us) AppleWebKit/533.17.8 (KHTML, like Gecko) Ve'),
(11, 1, 'http://www.google.co.uk/search?q=2ndfolio&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefox-a', 'http://www.2ndfolio.net/', '193.62.51.5', 1283515196, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.2.8) Gecko/20100722 Firefox/3.6.8'),
(12, 1, 'http://whois.domaintools.com/2ndfolio.net', 'http://www.2ndfolio.net/', '64.246.161.30', 1283535522, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(13, 1, 'http://www.google.co.uk/search?client=safari&rls=en&q=2nd+folio&ie=UTF-8&oe=UTF-8&redir;_esc=&ei=bnyGTObSF4i24QbF7YnSBA', 'http://www.2ndfolio.net/', '92.13.128.196', 1283885710, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-us) AppleWebKit/533.17.8 (KHTML, like Gecko) Ve'),
(14, 1, 'http://www.candt.org/', 'http://www.2ndfolio.net/', '193.62.51.5', 1284031783, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-us) AppleWebKit/533.17.8 (KHTML, like Gecko) Ve'),
(15, 1, 'http://bl150w.blu150.mail.live.com/mail/InboxLight.aspx?n=384368104', 'http://www.2ndfolio.net/', '81.159.147.82', 1284032328, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.1.12) Gecko/20100824 Firefox/3.5.12'),
(16, 1, 'http://ht.ly/2BCNi', 'http://www.2ndfolio.net/', '94.67.222.176', 1284036638, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.375'),
(17, 1, 'http://ht.ly/2BCNi', 'http://www.2ndfolio.net/', '94.67.222.176', 1284036638, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.375'),
(18, 1, 'http://ht.ly/2BCNi', 'http://www.2ndfolio.net/', '94.67.222.176', 1284036638, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.375'),
(19, 1, 'http://www.google.co.uk/search?client=safari&rls=en&q=2nd+folio&ie=UTF-8&oe=UTF-8&redir;_esc=&ei=6haJTKmXF4S84Aaj95jjAw', 'http://www.2ndfolio.net/', '77.102.93.47', 1284056317, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-us) AppleWebKit/533.17.8 (KHTML, like Gecko) Ve'),
(20, 1, 'http://www.candt.org/', 'http://www.2ndfolio.net/', '173.57.95.60', 1284076162, 'Mozilla/5.0 (iPad; U; CPU OS 3_2_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) V'),
(21, 1, 'http://www.candt.org/', 'http://www.2ndfolio.net/', '173.57.95.60', 1284076169, 'Mozilla/5.0 (iPad; U; CPU OS 3_2_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) V'),
(22, 1, 'http://www.google.co.uk/search?q=www.2ndfolio.net&ie=UTF-8&oe=UTF-8&hl=en&client=safari', 'http://www.2ndfolio.net/', '82.132.136.217', 1284220595, 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_0_2 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gec'),
(23, 1, 'http://www.macromedia.com/software/flash/about/installerRedirect.html', 'http://www.2ndfolio.net/', '86.182.238.237', 1284392916, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.9.2.9) Gecko/20100824 Firefox/3.6.9 ( .NET CLR '),
(24, 1, 'http://www.macromedia.com/software/flash/about/installerRedirect.html', 'http://www.2ndfolio.net/', '86.182.238.237', 1284392917, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.9.2.9) Gecko/20100824 Firefox/3.6.9 ( .NET CLR '),
(25, 1, 'http://www.macromedia.com/software/flash/about/installerRedirect.html', 'http://www.2ndfolio.net/', '86.182.238.237', 1284393098, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.9.2.9) Gecko/20100824 Firefox/3.6.9 ( .NET CLR '),
(26, 1, 'http://www.macromedia.com/software/flash/about/installerRedirect.html', 'http://www.2ndfolio.net/', '86.182.238.237', 1284393098, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.9.2.9) Gecko/20100824 Firefox/3.6.9 ( .NET CLR '),
(27, 1, 'http://www.macromedia.com/software/flash/about/installerRedirect.html', 'http://www.2ndfolio.net/', '86.182.238.237', 1284393154, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.9.2.9) Gecko/20100824 Firefox/3.6.9 ( .NET CLR '),
(28, 1, 'http://www.macromedia.com/software/flash/about/installerRedirect.html', 'http://www.2ndfolio.net/', '86.182.238.237', 1284393154, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.9.2.9) Gecko/20100824 Firefox/3.6.9 ( .NET CLR '),
(29, 1, 'http://whois.domaintools.com/2ndfolio.net', 'http://www.2ndfolio.net/', '64.246.165.150', 1284432447, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(30, 1, 'http://www.candt.org/', 'http://www.2ndfolio.net/', '193.62.51.5', 1284460846, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-us) AppleWebKit/533.18.1 (KHTML, like Gecko) Ve'),
(31, 1, 'http://www.supercooldesign.co.uk/', 'http://www.2ndfolio.net/', '86.173.132.165', 1284634742, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.2.9) Gecko/20100824 Firefox/3.6.9'),
(32, 1, 'http://www.supercooldesign.co.uk/', 'http://www.2ndfolio.net/', '86.173.132.165', 1284634765, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3'),
(33, 1, 'http://www.supercooldesign.co.uk/news/the-bard-cards-and-qr/', 'http://www.2ndfolio.net/', '82.36.214.156', 1284635904, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_5_8; en-us) AppleWebKit/533.17.8 (KHTML, like Gecko) Vers'),
(34, 1, 'http://www.supercooldesign.co.uk/news/the-bard-cards-and-qr/', 'http://www.2ndfolio.net/', '82.26.178.216', 1284636105, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.2.8) Gecko/20100722 Firefox/3.6.8'),
(35, 1, 'http://www.google.co.uk/search?q=2nd+folio.net&ie=UTF-8&oe=UTF-8&hl=en&client=safari', 'http://www.2ndfolio.net/', '212.183.140.0', 1284739651, 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 3_1_3 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML, like Ge'),
(36, 1, 'http://www.supercooldesign.co.uk/', 'http://www.2ndfolio.net/', '163.1.27.119', 1284995301, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.5) Gecko/20091102 Firefox/3.5.5 (.NET CLR 3'),
(37, 1, 'http://www.supercooldesign.co.uk/news/the-bard-cards-and-qr/', 'http://www.2ndfolio.net/', '94.8.86.103', 1285156407, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-GB; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10 ( .NET CL'),
(38, 1, 'http://www.supercooldesign.co.uk/news/the-bard-cards-and-qr/', 'http://www.2ndfolio.net/', '77.40.143.234', 1285157209, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.3 (KHTML, like Gecko) Chrome/6.0.472'),
(39, 1, 'http://www.supercooldesign.co.uk/', 'http://www.2ndfolio.net/', '71.236.226.61', 1285285295, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10'),
(40, 1, 'http://whois.domaintools.com/2ndfolio.net', 'http://www.2ndfolio.net/', '64.246.165.150', 1285336556, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(41, 1, 'http://www.baidu.com', 'http://www.2ndfolio.net/', '220.165.14.182', 1285413440, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR '),
(42, 1, 'http://linkband.de/?host=2ndfolio.net', 'http://www.2ndfolio.net/', '82.131.190.163', 1285559537, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; hu; rv:1.9.0.3) Gecko/2008092417 Firefox/3.0.3'),
(43, 1, 'http://www.google.com/search?q=qr+reader+online&hl=ru&client=opera&rls=ru&ei=oDqiTMWpBYbgOO2vjdID&start=50&sa=N', 'http://www.2ndfolio.net/qr/', '95.104.195.16', 1285704056, 'Opera/9.80 (Windows NT 5.1; U; ru) Presto/2.6.30 Version/10.62'),
(44, 1, 'http://www.2ndfifescouts.org.uk/news/jott2010.php', 'http://www.2ndfolio.net/', '213.89.143.77', 1285869291, 'Lynx/2.8.7pre.6 libwww-FM/2.14 SSL-MM/1.4.1'),
(45, 1, 'http://www.supercooldesign.co.uk/news/the-bard-cards-and-qr/', 'http://www.2ndfolio.net/', '82.46.180.118', 1286130318, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-GB; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10'),
(46, 1, 'http://whois.domaintools.com/2ndfolio.net', 'http://www.2ndfolio.net/', '64.246.165.170', 1286250063, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(47, 1, 'http://www.google.co.uk/search?client=firefox-a&rls=org.mozilla:en-US:official&channel=s&hl=en&source=hp&q=downloadable+', 'http://www.2ndfolio.net/cards/', '86.135.135.149', 1286270245, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.1.13) Gecko/20100914 Firefox/3.5.13 ( .NET CL'),
(48, 1, 'http://www.google.com.hk/search?q=QR+code+decoder+database&hl=zh-TW&prmd=b&ei=xyqsTM-DEIHBcZKmgPME&start=20&sa=N', 'http://www.2ndfolio.net/qr/', '203.80.118.166', 1286355202, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10'),
(49, 1, 'http://www.candt.org/', 'http://www.2ndfolio.net/', '80.193.72.130', 1286356261, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),
(50, 1, 'http://yandex.ru/yandsearch?text=?????????', 'http://www.2ndfolio.net/', '95.25.144.87', 1286491182, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),
(51, 1, 'http://www.google.com/search?q=folio+puck&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefox-a', 'http://www.2ndfolio.net/characters/puck/', '71.20.100.94', 1286491387, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.19) Gecko/2010031218 Firefox/3.0.19'),
(52, 1, 'http://www.google.com', 'http://www.2ndfolio.net/', '74.117.176.48', 1286507237, 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'),
(53, 1, 'http://www.candt.org/', 'http://www.2ndfolio.net/', '92.26.221.91', 1286646385, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6; .NET CLR 1.1.4322; UGES 1.4.9.'),
(54, 1, 'http://twitter.com/c_and_t/status/26878959314', 'http://www.2ndfolio.net/', '68.233.225.38', 1286664592, 'Jaxified Crawler 1.0a (+http://www.jaxified.com/)'),
(55, 1, 'http://hootsuite.com/dashboard', 'http://www.2ndfolio.net/', '24.85.41.100', 1286683082, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.13) Gecko/20100914 Firefox/3.5.13 ( .NET CL'),
(56, 1, 'http://twitter.com/', 'http://www.2ndfolio.net/', '70.79.165.117', 1286684169, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.2.8) Gecko/20100722 Firefox/3.6.8'),
(57, 1, 'http://twitter.com', 'http://www.2ndfolio.net/', '184.73.25.153', 1286684247, 'Mozilla/5.0 Gecko/20100914 Firefox/3.6.10'),
(58, 1, 'http://www.2ndfolio.net', 'http://www.2ndfolio.net/rules/', '74.82.68.32', 1286718050, 'BlackBerry8330m/4.5.0.169 Profile/MIDP-2.0 Configuration/CLDC-1.1 VendorID/189'),
(59, 1, 'http://candt.org/', 'http://www.2ndfolio.net/', '212.44.14.147', 1286879303, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.3 (KHTML, like Gecko) Chrome/6.0.472'),
(60, 1, 'http://candt.org/index.php/about/people-entry/barry-bulsara/', 'http://www.2ndfolio.net/', '212.44.14.147', 1286879695, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.3 (KHTML, like Gecko) Chrome/6.0.472'),
(61, 1, 'http://www.candt.org/', 'http://www.2ndfolio.net/', '82.46.174.124', 1286914027, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10'),
(62, 1, 'http://www.google.co.uk/search?q=download+playing+cards&hl=en&cr=countryUK|countryGB&rlz=1T4ADFA_enGB344&tbs=ctr:country', 'http://www.2ndfolio.net/cards/', '62.171.194.23', 1287140862, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6; .NET CLR 1.1.4322; .NET CLR 2.'),
(63, 1, 'http://whois.domaintools.com/2ndfolio.net', 'http://www.2ndfolio.net/', '64.246.165.170', 1287156195, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(64, 1, 'http://www.supercooldesign.co.uk/', 'http://www.2ndfolio.net/', '93.96.212.6', 1287177946, 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_1 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko'),
(65, 1, 'http://candt.org//index.php', 'http://www.2ndfolio.net/', '94.196.115.149', 1287237551, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; GTB0.0; SLCC2; .NET CLR 2.0.50727; .'),
(66, 1, 'http://candt.org//index.php', 'http://www.2ndfolio.net/', '94.196.115.149', 1287237552, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; GTB0.0; SLCC2; .NET CLR 2.0.50727; .'),
(67, 1, 'http://candt.org//index.php', 'http://www.2ndfolio.net/', '94.196.115.149', 1287237556, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; GTB0.0; SLCC2; .NET CLR 2.0.50727; .'),
(68, 1, 'http://www.google.co.uk/search?q=2nd+folio&sourceid=ie7&rls=com.microsoft:en-gb:IE-Address&ie;=&oe;=&redir;_esc=&ei=g0a7', 'http://www.2ndfolio.net/', '86.172.217.215', 1287345464, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .N'),
(69, 1, 'http://yandex.ru/yandsearch?text=????+??+?????', 'http://www.2ndfolio.net/', '95.26.89.39', 1287770115, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)'),
(70, 1, 'http://www.google.co.uk/search?client=safari&rls=en&q=2nd+folio&ie=UTF-8&oe=UTF-8&redir;_esc=&ei=ME_FTPDPOo_KjAez2_W5BQ', 'http://www.2ndfolio.net/', '193.62.51.5', 1288002883, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-us) AppleWebKit/533.18.1 (KHTML, like Gecko) Ve'),
(71, 1, 'http://www.supercooldesign.co.uk/work/entry/ct/', 'http://www.2ndfolio.net/', '217.41.36.219', 1288023563, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Chrome/7.0.517'),
(72, 1, 'http://whois.domaintools.com/2ndfolio.net', 'http://www.2ndfolio.net/', '216.145.11.94', 1288085893, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(73, 1, 'http://www.google.com/search?client=safari&rls=en&q=qrreader+air&ie=UTF-8&oe=UTF-8', 'http://www.2ndfolio.net/qr/', '72.90.78.10', 1288286330, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-us) AppleWebKit/533.18.1 (KHTML, like Gecko) Ve'),
(74, 1, 'http://www.google.com', 'http://www.2ndfolio.net/', '74.117.176.48', 1288398291, 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'),
(75, 1, 'http://www.google.com/search?client=safari&rls=en&q=qrreader.air&ie=UTF-8&oe=UTF-8', 'http://www.2ndfolio.net/qr/', '24.91.37.67', 1288879421, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-us) AppleWebKit/533.18.1 (KHTML, like Gecko) Ve'),
(76, 1, 'http://www.google.com/search?client=safari&rls=en&q=qrreader.air&ie=UTF-8&oe=UTF-8', 'http://www.2ndfolio.net/qr/', '24.91.37.67', 1288890501, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-us) AppleWebKit/533.18.1 (KHTML, like Gecko) Ve'),
(77, 1, 'http://www.google.co.id/search?q=qr+reader+for+linux&hl=id&client=firefox-a&rls=org.mozilla:en-US:official&ei=1R3TTMGrK5', 'http://www.2ndfolio.net/qr/', '180.241.126.13', 1288907930, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.2.12) Gecko/20101026 SUSE/3.6.12-1.1 Firefox/3.6.12'),
(78, 1, 'http://whois.domaintools.com/2ndfolio.net', 'http://www.2ndfolio.net/', '64.246.165.180', 1289039056, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(79, 1, 'http://twitter.com/c_and_t/status/1025725125623808', 'http://www.2ndfolio.net/', '68.233.225.38', 1289083127, 'Jaxified Bot (+http://www.jaxified.com/crawler/)'),
(80, 1, 'http://twitter.com/', 'http://www.2ndfolio.net/', '90.194.13.178', 1289083289, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Chrome/7.0.517'),
(81, 1, 'http://www.google.com', 'http://www.2ndfolio.net/', '74.117.176.48', 1289186797, 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'),
(82, 1, 'http://www.google.com/search?q=qrreader.air&sourceid=ie7&rls=com.microsoft:en-us:IE-SearchBox&ie;=&oe;=', 'http://www.2ndfolio.net/qr/', '204.74.159.2', 1289338183, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .N'),
(83, 1, 'http://www.google.com/search?q=mac+webcam+qr+reader&hl=en&client=safari&rls=en&ei=2lnaTL-DNpO6sQOp85DRBw&start=40&sa=N', 'http://www.2ndfolio.net/qr/', '76.90.68.184', 1289381893, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-us) AppleWebKit/533.18.1 (KHTML, like Gecko) Ve'),
(84, 1, 'http://www.google.bg/search?q=qr+reader+online&hl=bg&rlz=1G1GGLQ_BGBG248&ei=tEziTI6JHcaXOszY2WA&start=30&sa=N', 'http://www.2ndfolio.net/qr/', '78.130.226.100', 1289903028, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Chrome/7.0.517'),
(85, 1, 'http://whois.domaintools.com/2ndfolio.net', 'http://www.2ndfolio.net/', '64.246.165.190', 1289999231, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(86, 1, 'http://www.google.com/search?hl=en&q=qr+on+screen+reader', 'http://www.2ndfolio.net/qr/', '174.132.19.226', 1290051456, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; BOLT/2.310) AppleWebKit/530+ (KHTML, like Gecko) Ver'),
(87, 1, 'http://cp.pipeten.co.uk/psoft/servlet/psoft.hsphere.CP/supercooldesign/794123_0/psoft.hsphere.CP?template_name=quick/cho', 'http://www.2ndfolio.net/', '78.109.178.181', 1290078085, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-GB; rv:1.9.2.2) Gecko/20100316 Firefox/3.6.2 ( .NET CLR '),
(88, 1, 'http://candt.org/index.php/about/people-entry/barry-bulsara/', 'http://www.2ndfolio.net/', '89.213.100.226', 1290160777, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; GTB6.6; SLCC1; .NET CLR 2.0.50727; M'),
(89, 1, 'http://www.candt.org/', 'http://www.2ndfolio.net/', '212.159.59.38', 1290165933, 'Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Ubuntu/10.10 Chromium/'),
(90, 1, 'http://www.google.co.uk/search?client=safari&rls=en&q=2ndfolio&ie=UTF-8&oe=UTF-8&redir;_esc=&ei=iX7mTMXbI860hAeXh4yBDQ', 'http://www.2ndfolio.net/', '193.62.51.5', 1290177691, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-us) AppleWebKit/533.17.8 (KHTML, like Gecko) Ve'),
(91, 1, 'http://movieorca.com/', 'http://www.2ndfolio.net/qr/', '173.203.112.156', 1290242010, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; pl; rv:1.9.1.3) Gecko/20090824 Firefox/3.5.3'),
(92, 1, 'http://www.google.co.in/search?q=online+qr+reader&hl=en&ei=_avrTObOIMmecIfx2Z4P&start=40&sa=N', 'http://www.2ndfolio.net/qr/', '203.99.197.54', 1290517349, 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; In'),
(93, 1, 'http://www.google.es/search?q=online+qr+decoder&hl=es&client=firefox-a&rls=org.mozilla:es-ES:official&ei=uzvsTLHrAsSyhAf', 'http://www.2ndfolio.net/qr/', '84.126.121.53', 1290553915, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; es-ES; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12'),
(94, 1, 'http://www.google.co.nz/search?sourceid=chrome&ie=UTF-8&q=adobe+air+qr+reader&safe=strict', 'http://www.2ndfolio.net/qr/', '202.89.50.195', 1290634611, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_0; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chro'),
(95, 1, 'http://www.google.co.nz/search?sourceid=chrome&ie=UTF-8&q=adobe+air+qr+reader&safe=strict', 'http://www.2ndfolio.net/qr/', '202.89.50.195', 1290634612, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_0; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chro'),
(96, 1, 'http://www.google.co.nz/search?sourceid=chrome&ie=UTF-8&q=adobe+air+qr+reader&safe=strict', 'http://www.2ndfolio.net/qr/', '202.89.50.195', 1290634757, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_0; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chro'),
(97, 1, 'http://ph.search.yahoo.com/search?ei=utf-8&fr=slv1-msgr&p=titania character&ei=UTF-8&type;=', 'http://www.2ndfolio.net/characters/titania/', '112.203.79.1', 1290939840, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12'),
(98, 1, 'http://whois.domaintools.com/2ndfolio.net', 'http://www.2ndfolio.net/', '64.246.161.30', 1290961461, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(99, 1, 'http://candt.org/index.php/about/people-entry/barry-bulsara/', 'http://www.2ndfolio.net/', '93.157.223.254', 1291122370, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-us) AppleWebKit/533.18.1 (KHTML, like Gecko) Ve'),
(100, 1, 'http://yandex.ru/yandsearch?text=ll+let+you+know+when', 'http://www.2ndfolio.net/cards/', '89.178.141.73', 1291484644, 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET '),
(101, 1, 'http://www.google.com/search?source=ig&hl=en&rlz;=&q=folio+playing+cards&btnG=Google+Search&aq=f&oq;=', 'http://www.2ndfolio.net/cards/', '70.26.7.81', 1291494583, 'Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Ubuntu/10.10 Chromium/'),
(102, 1, 'http://yandex.ru/yandsearch?text=ll+let+you+know+when', 'http://www.2ndfolio.net/cards/', '93.80.107.13', 1291495856, 'Opera/9.27 (Windows NT 5.1; U; ru)'),
(103, 1, 'http://yandex.ru/yandsearch?text=Hamlet+was+once+a+proud+warrior', 'http://www.2ndfolio.net/characters/king-hamlet/', '95.24.225.154', 1291496121, 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.1'),
(104, 1, 'http://yandex.ru/yandsearch?text=and+played+across', 'http://www.2ndfolio.net/about/', '95.220.93.59', 1291501324, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.5072'),
(105, 1, 'http://yandex.ru/yandsearch?text=Hamlet+was+once+a+proud+warrior', 'http://www.2ndfolio.net/characters/king-hamlet/', '95.26.233.162', 1291522907, 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.2)'),
(106, 1, 'http://yandex.ru/yandsearch?text=and+played+across', 'http://www.2ndfolio.net/about/', '89.178.110.29', 1291523680, 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)'),
(107, 1, 'http://yandex.ru/yandsearch?text=and+played+across', 'http://www.2ndfolio.net/about/', '95.24.17.65', 1291541669, 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)'),
(108, 1, 'http://www.xxxportale.info/', 'http://www.2ndfolio.net/', '93.174.88.162', 1291659186, 'Mozilla/4.0 (compatible; MSIE 5.5; Windows 98)'),
(109, 1, 'http://www.ficktreffen.info/forum/message65.html', 'http://www.2ndfolio.net/', '93.174.88.162', 1291659188, 'Mozilla/4.0 (compatible; MSIE 5.5; Windows 98)'),
(110, 1, 'http://www.girlsdeluxe18.info/bulletin/4567.html', 'http://www.2ndfolio.net/', '93.174.88.162', 1291659189, 'Mozilla/4.0 (compatible; MSIE 5.5; Windows 98)'),
(111, 1, 'http://www.mehrkontakte.info/profiles/profil336.html', 'http://www.2ndfolio.net/', '93.174.88.162', 1291659190, 'Mozilla/4.0 (compatible; MSIE 5.5; Windows 98)'),
(112, 1, 'http://notify.bluecoat.com/notify-MainCompliancePage?http/2ndfolio.net/aHR0cDovLzJuZGZvbGlvLm5ldC8=', 'http://www.2ndfolio.net/', '80.249.57.49', 1291813664, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727; .NET CLR 1.1.4322)'),
(113, 1, 'http://whois.domaintools.com/2ndfolio.net', 'http://www.2ndfolio.net/', '64.246.165.200', 1291898216, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(114, 1, 'http://candt.org/index.php/about/people-entry/barry-bulsara/', 'http://www.2ndfolio.net/', '86.145.103.13', 1292064534, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-us) AppleWebKit/533.18.1 (KHTML, like Gecko) Ve'),
(115, 1, 'http://www.tvolymp.com', 'http://www.2ndfolio.net/', '92.61.155.10', 1292079741, 'Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0)'),
(116, 1, 'http://www.google.com', 'http://www.2ndfolio.net/', '74.117.176.30', 1292254834, 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'),
(117, 1, 'http://www.google.com', 'http://www.2ndfolio.net/', '74.117.176.30', 1292334686, 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'),
(118, 1, 'http://www.google.co.th/search?hl=th&client=firefox-a&hs=dZQ&rls=org.mozilla:en-US:official&&sa;=X&ei=KloITb_7DdGGrAex5K', 'http://www.2ndfolio.net/qr/', '113.53.225.10', 1292396617, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6 GTB7.1'),
(119, 1, 'http://www.google.com/search?hl=en&rlz=1W1RNTN_en&q=qrreader+adobe&aq=f&aqi;=&aql;=&oq;=&gs;_rfai=', 'http://www.2ndfolio.net/qr/', '93.172.136.190', 1292543194, 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB6.6; Mozilla/4.0 (compatible; MSIE 6.0; Window'),
(120, 1, 'http://whois.domaintools.com/2ndfolio.net', 'http://www.2ndfolio.net/', '64.246.165.170', 1292849118, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(121, 1, 'http://www.google.co.uk/search?q=2nd+folio&um=1&hl=en&biw=1669&bih=1090&source=lnms&ei=rWwPTePJK5KShAeP_PC3Dg&sa=X&oi=mo', 'http://www.2ndfolio.net/', '193.62.51.5', 1292860110, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_5; en-us) AppleWebKit/533.19.4 (KHTML, like Gecko) Ve'),
(122, 1, 'http://www.sitedossier.com/site/www.2ndfolio.net', 'http://www.2ndfolio.net/', '69.71.222.186', 1293130436, ''),
(123, 1, 'http://www.google.com/search?q=adobe+air+qr+reader&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefox-', 'http://www.2ndfolio.net/qr/', '74.72.62.167', 1293657668, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:2.0b8) Gecko/20100101 Firefox/4.0b8'),
(124, 1, 'http://whois.domaintools.com/2ndfolio.net', 'http://www.2ndfolio.net/', '216.145.11.94', 1293799579, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(125, 1, 'http://www.google.ca/search?q=QR+reader+for+computer&hl=en&client=firefox-a&rls=org.mozilla:en-US:official&prmd=ivns&ei=', 'http://www.2ndfolio.net/qr/', '208.124.194.174', 1294089332, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3'),
(126, 1, 'http://www.google.com', 'http://www.2ndfolio.net/', '74.117.176.30', 1294158611, 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'),
(127, 1, 'http://www.google.co.in/', 'http://www.2ndfolio.net/qr/', '203.109.80.140', 1294226646, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.450'),
(128, 1, 'http://www.google.com', 'http://www.2ndfolio.net/', '74.117.176.30', 1294232644, 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'),
(129, 1, 'http://www.google.com.my/search?q=qr+reader+folio&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-GB:official&client=firefox-a', 'http://www.2ndfolio.net/qr/', '182.62.32.199', 1294285086, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13 (.NET CLR'),
(130, 1, 'http://www.google.com', 'http://www.2ndfolio.net/', '74.117.176.30', 1294309456, 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'),
(131, 1, 'http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=qr+reader+air', 'http://www.2ndfolio.net/qr/', '71.54.47.161', 1294405938, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.55'),
(132, 1, 'http://www.candt.org/', 'http://www.2ndfolio.net/', '67.202.50.63', 1294583136, 'Mozilla/5.0 (compatible;picmole/1.0 +http://www.picmole.com)'),
(133, 1, 'http://whois.domaintools.com/2ndfolio.net', 'http://www.2ndfolio.net/', '64.246.165.50', 1294742309, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(134, 1, 'http://www.candt.org/', 'http://www.2ndfolio.net/', '86.173.74.57', 1294846319, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13'),
(135, 1, 'http://www.google.com', 'http://www.2ndfolio.net/', '74.117.176.30', 1294848717, 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'),
(136, 1, 'http://www.google.com/search?client=safari&rls=en&q=2ndfolio&ie=UTF-8&oe=UTF-8', 'http://www.2ndfolio.net/', '67.164.13.129', 1295049492, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_5; en-us) AppleWebKit/533.19.4 (KHTML, like Gecko) Ve'),
(137, 1, 'http://hk.search.yahoo.com/search;_ylt=A3xsaFjfrzFNPwQA0ozwzAt.?p=Folio+folio+QR+Code&fr2=sb-top&fr=FP-tab-web-t&rd=r1', 'http://www.2ndfolio.net/qr/', '203.218.231.86', 1295105871, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR '),
(138, 1, 'http://whois.domaintools.com/2ndfolio.net', 'http://www.2ndfolio.net/', '64.246.165.150', 1295690916, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(139, 1, 'http://www.google.co.kr/search?q=QRreader.air', 'http://www.2ndfolio.net/qr/', '115.91.186.211', 1295855384, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET '),
(140, 1, 'http://twitter.com/', 'http://www.2ndfolio.net/', '195.188.19.230', 1296142822, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13 ( .NET CL'),
(141, 1, 'http://twitter.com/', 'http://www.2ndfolio.net/', '81.141.247.224', 1296142857, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Win64; x64; Trident/4.0; .NET CLR 2.0.50727; SLCC'),
(142, 1, 'http://twitter.com/', 'http://www.2ndfolio.net/', '81.141.152.19', 1296142932, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-GB; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13 ( .NET CL'),
(143, 1, 'http://twitter.com/', 'http://www.2ndfolio.net/', '134.220.73.98', 1296142933, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.55'),
(144, 1, 'http://twitter.com/', 'http://www.2ndfolio.net/', '62.254.141.121', 1296142962, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-us) AppleWebKit/533.17.8 (KHTML, like Gecko) Ve'),
(145, 1, 'http://twitter.com/home', 'http://www.2ndfolio.net/', '217.158.132.157', 1296143039, 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3'),
(146, 1, 'http://twitter.com/', 'http://www.2ndfolio.net/', '94.185.151.218', 1296143082, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; GTB6.6; SLCC2; .NET CLR 2.0.50727; .'),
(147, 1, 'http://twitter.com/', 'http://www.2ndfolio.net/', '77.99.121.198', 1296143129, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Ubuntu/10.10 Chromi'),
(148, 1, 'http://twitter.com/BarnabyEdwards/status/30636185751650304', 'http://www.2ndfolio.net/', '81.2.88.198', 1296143149, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13'),
(149, 1, 'http://twitter.com/BarnabyEdwards/status/30636185751650304', 'http://www.2ndfolio.net/', '81.2.88.198', 1296143152, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13'),
(150, 1, 'http://twitter.com/BarnabyEdwards/status/30636185751650304', 'http://www.2ndfolio.net/', '81.2.88.198', 1296143158, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13'),
(151, 1, 'http://twitter.com/', 'http://www.2ndfolio.net/', '152.1.67.181', 1296143956, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13 ( .NET CL'),
(152, 1, 'http://api.twitter.com/', 'http://www.2ndfolio.net/', '81.101.226.253', 1296144640, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13'),
(153, 1, 'http://twitter.com/', 'http://www.2ndfolio.net/', '109.152.128.61', 1296144813, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; InfoPath.2; .NET'),
(154, 1, 'http://twitter.com/', 'http://www.2ndfolio.net/', '88.108.243.127', 1296146659, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_6; en-us) AppleWebKit/533.19.4 (KHTML, like Gecko) Ve'),
(155, 1, 'http://search.twitter.com/search?q=barnabyedwards', 'http://www.2ndfolio.net/', '112.205.80.198', 1296147743, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.045'),
(156, 1, 'http://twitter.com/', 'http://www.2ndfolio.net/', '72.95.165.53', 1296148739, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13'),
(157, 1, 'http://twitter.com/', 'http://www.2ndfolio.net/', '216.89.71.11', 1296148811, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13'),
(158, 1, 'http://twitter.com/', 'http://www.2ndfolio.net/', '81.174.165.104', 1296149990, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR '),
(159, 1, 'http://twitter.com/', 'http://www.2ndfolio.net/', '143.210.72.163', 1296150364, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.9.2.11) Gecko/20101012 Firefox/3.6.11'),
(160, 1, 'http://twitter.com/', 'http://www.2ndfolio.net/', '209.131.61.1', 1296157197, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.16) Gecko/20101130 Firefox/3.5.16 GTB7.1 ( '),
(161, 1, 'http://twitter.com/', 'http://www.2ndfolio.net/', '94.175.89.17', 1296168288, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13 (.NET CLR'),
(162, 1, 'http://www.google.ca/search?q=Lady+Macbeth+folio&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefox-a', 'http://www.2ndfolio.net/characters/lady-macbeth/', '68.144.52.150', 1296241884, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13'),
(163, 1, 'http://yandex.ru/yandsearch?text=2ndfolio.net', 'http://www.2ndfolio.net/', '95.25.35.105', 1296516163, 'Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0)'),
(164, 1, 'http://yandex.ru/yandsearch?text=2ndfolio.net', 'http://www.2ndfolio.net/', '95.220.251.208', 1296601521, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; ru; rv:1.9.2.12) Gecko/20101026 MRA 5.7 (build 03686) Firef'),
(165, 1, 'http://whois.domaintools.com/2ndfolio.net', 'http://www.2ndfolio.net/', '64.246.165.140', 1296655469, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(166, 1, 'http://yandex.ru/yandsearch?text=2ndfolio.net', 'http://www.2ndfolio.net/', '95.26.73.244', 1296748830, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; ru; rv:1.9.2.12) Gecko/20101026 MRA 5.7 (build 03686) Firef'),
(167, 1, 'http://www.google.ca/search?hl=en&client=firefox-a&hs=unO&rls=org.mozilla:en-US:official&channel=s&q=puck++folio&aq=f&aq', 'http://www.2ndfolio.net/characters/puck/', '70.50.240.150', 1296759043, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.2) Gecko/20090729 Firefox/3.5.2'),
(168, 1, 'http://www.google.co.uk/search?source=ig&hl=en&rlz=1G1GGLQ_ENUK276&q=2nd+folio&btnG=Google+Search', 'http://www.2ndfolio.net/', '212.44.14.147', 1296827627, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_6; en-US) AppleWebKit/534.13 (KHTML, like Gecko) Chro'),
(169, 1, 'http://www.seexie.com/wsearch.php?pt1=1&q=2ndfolio', 'http://www.2ndfolio.net/', '93.241.98.64', 1296835198, 'Mozilla/5.0 (compatible; seexie.com_bot/4.1; +http://www.seexie.com)'),
(170, 1, 'http://www.google.co.uk/search?sourceid=chrome&ie=UTF-8&q=qr+screen+reader+linux', 'http://www.2ndfolio.net/qr/', '87.113.7.25', 1296846415, 'Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/534.13 (KHTML, like Gecko) Chrome/9.0.597.84 Saf'),
(171, 1, 'http://yandex.ru/yandsearch?text=2ndfolio.net', 'http://www.2ndfolio.net/', '95.220.216.193', 1296938751, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)'),
(172, 1, 'http://www.google.com/search?q=QR+reader+for+Linux&hl=cs&client=opera&hs=qdC&rls=cs&prmd=ivns&ei=t0NQTY7vBIaMswaPr_iRDQ&', 'http://www.2ndfolio.net/qr/', '90.178.59.80', 1297109513, 'Opera/9.63 (Windows NT 5.1; U; cs) Presto/2.1.1'),
(173, 1, 'http://www.google.com/search?hl=en&biw=992&bih=530&q=hamlet+characters+folio&aq=f&aqi;=&aql=f&oq;=', 'http://www.2ndfolio.net/characters/hamlet/', '24.213.159.209', 1297271017, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13 ( .NET CL'),
(174, 1, 'http://whois.domaintools.com/2ndfolio.net', 'http://www.2ndfolio.net/', '216.145.17.190', 1297609200, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(175, 1, 'http://www.exalead.com/search/web/results/?q=qr+code+reader+linux&FORM=SMCRT&sourceid=Mozilla-search', 'http://www.2ndfolio.net/qr/', '78.148.194.141', 1297631184, 'Mozilla/5.0 (X11; U; Linux i686; en-GB; rv:1.9.2.13) Gecko/20101206 Ubuntu/10.10 (maverick) Firefox/'),
(176, 1, 'http://www.supercooldesign.co.uk/work/entry/ct', 'http://www.2ndfolio.net/', '82.46.181.29', 1298068513, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-GB; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13 (.NET CLR'),
(177, 1, 'http://www.google.com/search?q="QR+Reader"+Mac&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefox-a', 'http://www.2ndfolio.net/qr/', '72.172.29.155', 1298084315, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.4; en-US; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13'),
(178, 1, 'http://www.candt.org/', 'http://www.2ndfolio.net/', '184.72.178.145', 1298244578, 'Mozilla/5.0 (compatible;picmole/1.0 +http://www.picmole.com)'),
(179, 1, 'http://www.google.co.nz/search?hl=en&client=firefox-a&hs=rri&rls=org.mozilla:en-US:official&q=''qr+reader''+adobe+air&aq=f', 'http://www.2ndfolio.net/qr/', '202.49.48.180', 1298504431, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.2.6) Gecko/20100625 Firefox/3.6.6'),
(180, 1, 'http://whois.domaintools.com/2ndfolio.net', 'http://www.2ndfolio.net/', '64.246.165.150', 1298574816, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(181, 1, 'http://www.google.com.br/search?q=hamlet+second+folio&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:pt-BR:official&client=firef', 'http://www.2ndfolio.net/characters/hamlet/', '189.114.236.64', 1298589106, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; pt-BR; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13'),
(182, 1, 'http://www.google.com/search?client=safari&rls=en&q=how+is+romeo+ruled+by+his+emotions&ie=UTF-8&oe=UTF-8', 'http://www.2ndfolio.net/characters/romeo/', '96.24.61.133', 1298794885, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-us) AppleWebKit/531.21.8 (KHTML, like Gecko) Ve'),
(183, 1, 'http://yandex.ru/yandsearch?text=2ndfolio.net', 'http://www.2ndfolio.net/', '95.28.151.135', 1299282510, 'Opera/9.80 (Windows NT 5.1; U; ru) Presto/2.6.30 Version/10.63'),
(184, 1, 'http://www.seexie.com/wsearch.php?pt1=1&q=2ndfolio', 'http://www.2ndfolio.net/', '93.241.69.247', 1299420474, 'Mozilla/5.0 (compatible; seexie.com_bot/4.1; +http://www.seexie.com)'),
(185, 1, 'http://www.google.co.uk/search?q=QR+reader&ie=utf-8&oe=utf-8&meta=cr=countryUK|countryGB', 'http://www.2ndfolio.net/qr/', '46.208.53.143', 1299440129, 'Mozilla/5.0 (X11; U; Linux i686; en-GB; rv:1.9.2.13) Gecko/20101206 Ubuntu/10.10 (maverick) Firefox/'),
(186, 1, 'http://www.google.com/search?q=qr+scanner+for+mac&hl=en&safe=active&noj=1&prmd=ivnsfd&ei=EBV1TZXkKpLfgQfx-_FC&start=20&s', 'http://www.2ndfolio.net/qr/', '216.48.208.73', 1299522529, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_6; en-US) AppleWebKit/534.13 (KHTML, like Gecko) Chro'),
(187, 1, 'http://whois.domaintools.com/2ndfolio.net', 'http://www.2ndfolio.net/', '64.246.165.160', 1299542271, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(188, 1, 'http://www.google.co.uk/search?sourceid=navclient&aq=t&hl=en-GB&ie=UTF-8&rlz=1T4ADBF_en-GBGB302GB344&q=2nd+Folio', 'http://www.2ndfolio.net/', '91.195.183.205', 1299597835, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.5072'),
(189, 1, 'http://www.google.com/search?client=ubuntu&channel=fs&q=qrreader.air+how+to+use&ie=utf-8&oe=utf-8', 'http://www.2ndfolio.net/qr/', '200.54.168.130', 1299790799, 'Mozilla/5.0 (X11; U; Linux i686; es-CL; rv:1.9.2.15) Gecko/20110303 Ubuntu/10.10 (maverick) Firefox/'),
(190, 1, 'http://www.google.es/search?hl=es&client=opera&hs=C4R&rls=en&channel=suggest&q=2nd+folio&aq=f&aqi;=&aql;=&oq;=', 'http://www.2ndfolio.net/', '77.228.41.186', 1299869729, 'Opera/9.80 (Windows NT 6.0; U; en) Presto/2.7.62 Version/11.01'),
(191, 1, 'http://www.google.be/search?q=online+qr+reader&hl=nl&client=firefox-a&hs=v07&rlz=1R1GGLL_nl___BE402&prmd=ivns&ei=gKF7TYD', 'http://www.2ndfolio.net/qr/', '81.83.233.133', 1299951573, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; nl; rv:1.9.2.15) Gecko/20110303 Firefox/3.6.15 GTB7.1 ( .NE'),
(192, 1, 'http://www.google.com/search?q=qr+screen+reader&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefox-a', 'http://www.2ndfolio.net/qr/', '98.207.112.59', 1300044242, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.2.15) Gecko/20110303 Firefox/3.6.15'),
(193, 1, 'http://www.google.co.uk/search?sourceid=chrome&ie=UTF-8&q=2nd+folio+net', 'http://www.2ndfolio.net/', '86.53.204.8', 1300115659, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_6; en-US) AppleWebKit/534.16 (KHTML, like Gecko) Chro'),
(194, 1, 'http://www.google.com/', 'http://www.2ndfolio.net/qr/', '98.114.37.33', 1300133457, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; GTB6.4; SLCC2; .NET CLR 2.0.5'),
(195, 1, 'http://www.candt.org/', 'http://www.2ndfolio.net/', '66.65.96.36', 1300143340, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_6; en-us) AppleWebKit/533.20.25 (KHTML, like Gecko) V'),
(196, 1, 'http://www.candt.org/', 'http://www.2ndfolio.net/', '66.65.96.36', 1300143471, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_6; en-us) AppleWebKit/533.20.25 (KHTML, like Gecko) V'),
(197, 1, 'http://link.orangeworld.co.uk/10283/mobile?p=mobile&pt=portal&q=qr+reader&submit;.x=12&submit;.y=8&tab=main&type;=', 'http://www.2ndfolio.net/qr/', '193.35.132.28', 1300267196, 'Mozilla/5.0 (Linux; U; Android 1.6; en-gb; SonyEricssonX10i Build/R1FA014) AppleWebKit/528.5+ (KHTML'),
(198, 1, 'http://link.orangeworld.co.uk/10283/mobile?p=mobile&pt=portal&q=qr+reader&submit;.x=12&submit;.y=8&tab=main&type;=', 'http://www.2ndfolio.net/qr/', '193.35.132.16', 1300267211, 'Mozilla/5.0 (Linux; U; Android 1.6; en-gb; SonyEricssonX10i Build/R1FA014) AppleWebKit/528.5+ (KHTML'),
(199, 1, 'http://candt.org/', 'http://www.2ndfolio.net/', '69.64.222.98', 1300312823, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/534.16 (KHTML, like Gecko) Chrome/10.0.6'),
(200, 1, 'http://www.candt.org/', 'http://www.2ndfolio.net/', '80.6.155.186', 1300314791, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_6; en-us) AppleWebKit/533.20.25 (KHTML, like Gecko) V'),
(201, 1, 'http://www.google.co.uk/search?aq=f&sourceid=chrome&ie=UTF-8&q=2nd+folio', 'http://www.2ndfolio.net/', '78.148.125.9', 1300475099, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_6; en-US) AppleWebKit/534.16 (KHTML, like Gecko) Chro'),
(202, 1, 'http://whois.domaintools.com/2ndfolio.net', 'http://www.2ndfolio.net/', '64.246.165.160', 1300516554, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(203, 1, 'http://yandex.ru/yandsearch?text=2ndfolio.net', 'http://www.2ndfolio.net/', '95.25.116.206', 1300573465, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)'),
(204, 1, 'http://www.we-globe.net/Weblab/SiteCommonGraveReport/www.2ndfolio.net/', 'http://www.2ndfolio.net/', '62.219.132.115', 1300775240, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; fr; rv:1.9.0.8) Gecko/2009032609 Firefox/3.0.8'),
(205, 1, 'http://www.seexie.com/wsearch.php?pt1=1&q=2ndfolio', 'http://www.2ndfolio.net/', '93.241.127.91', 1300788520, 'Mozilla/5.0 (compatible; seexie.com_bot/4.1; +http://www.seexie.com)'),
(206, 1, 'http://candt.org/index.php/about/people-entry/barry-bulsara/', 'http://www.2ndfolio.net/', '217.43.134.239', 1300802237, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-us) AppleWebKit/533.18.1 (KHTML, like Gecko) Ve'),
(207, 1, 'http://www.google.co.uk/search?q=Playing+Card+Download&hl=en&cr=countryUK|countryGB&prmd=ivns&ei=0ByKTcmrF867hAeBltjHDg&', 'http://www.2ndfolio.net/cards/', '82.110.109.210', 1300900683, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),
(208, 1, 'http://www.google.es/search?q=linux+qr+code+reader&hl=es&client=firefox-a&hs=M4b&rls=org.mozilla:es-ES:official&prmd=ivn', 'http://www.2ndfolio.net/qr/', '80.34.11.223', 1301181545, 'Mozilla/5.0 (X11; U; Linux)'),
(209, 1, 'http://www.google.ru/search?q=qr+reader+online+windows&hl=ru&newwindow=1&prmd=ivns&ei=MZuRTaP9G8SCOrP36VA&start=10&sa=N', 'http://www.2ndfolio.net/qr/', '82.179.141.130', 1301391756, 'Opera/9.80 (Windows NT 5.1; U; ru) Presto/2.7.62 Version/11.01'),
(210, 1, 'http://candt.org/index.php/about/people-entry/barry-bulsara/', 'http://www.2ndfolio.net/', '86.145.97.163', 1301423149, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; GTB6.6; SLCC1; .NET CLR 2.0.50727; .'),
(211, 1, 'http://whois.domaintools.com/2ndfolio.net', 'http://www.2ndfolio.net/', '64.246.165.170', 1301492605, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(212, 1, 'http://www.google.co.th/search?q=qr+quote+reader&ie=utf-8&oe=utf-8&aq=t&rls=com.ubuntu:en-US:unofficial&client=firefox-a', 'http://www.2ndfolio.net/qr/', '203.148.253.18', 1301557618, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.8) Gecko/2009033100 Ubuntu/9.04 (jaunty) Firefox/3.'),
(213, 1, 'http://yandex.ru/yandsearch?text=2ndfolio.net', 'http://www.2ndfolio.net/', '95.26.242.171', 1301659508, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR '),
(214, 1, 'http://www.google.com/search?hl=is&client=safari&rls=en&q=on-screen+qr+code+scanner+mac&aq=f&aqi;=&aql;=&oq;=', 'http://www.2ndfolio.net/qr/', '213.167.137.106', 1301659631, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_6; is-is) AppleWebKit/533.19.4 (KHTML, like Gecko) Ve'),
(215, 1, 'http://yandex.ru/yandsearch?text=2ndfolio.net', 'http://www.2ndfolio.net/', '95.28.95.220', 1301746865, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; en) Opera 8.54'),
(216, 1, 'http://www.google.co.uk/search?q=qr+reader+pc+webcam&hl=en&prmd=ivns&ei=pqiZTfmXF4SbhQeU8qj9CA&start=40&sa=N', 'http://www.2ndfolio.net/qr/', '62.171.194.12', 1301919590, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.16 (KHTML, like Gecko) Chrome/10.0.6'),
(217, 1, 'http://www.google.gr/search?hl=el&client=firefox-a&rls=org.mozilla:en-GB:official&q="QR+Reader"+Database+Query&aq=f&aqi;', 'http://www.2ndfolio.net/qr/', '79.129.18.62', 1301921911, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.9.2.16) Gecko/20110319 Firefox/3.6.16 ( .NET CL'),
(218, 1, 'http://www.google.com/search?client=safari&rls=en&q=download+qr+code+for+mac+computers&ie=UTF-8&oe=UTF-8', 'http://www.2ndfolio.net/qr/', '41.215.233.146', 1301922771, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-us) AppleWebKit/533.18.1 (KHTML, like Gecko) Ve'),
(219, 1, 'http://www.google.ca/search?sourceid=chrome&ie=UTF-8&q=pc+attached+qr+scanner', 'http://www.2ndfolio.net/qr/', '99.225.147.39', 1301981669, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.16 (KHTML, like Gecko) Chrome/10.0.6'),
(220, 1, 'http://bl164w.blu164.mail.live.com/mail/InboxLight.aspx?n=1359927168', 'http://www.2ndfolio.net/', '86.167.45.144', 1301994129, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-us) AppleWebKit/533.18.1 (KHTML, like Gecko) Ve');
INSERT INTO `exp_referrers` (`ref_id`, `site_id`, `ref_from`, `ref_to`, `ref_ip`, `ref_date`, `ref_agent`) VALUES
(221, 1, 'http://www.google.co.in/', 'http://www.2ndfolio.net/qr/', '202.12.16.77', 1302152413, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR '),
(222, 1, 'http://yandex.ru/yandsearch?text=2ndfolio.net', 'http://www.2ndfolio.net/', '95.31.82.131', 1302357137, 'Mozilla/4.0 (compatible; MSIE 5.0; Windows 98; DigExt)'),
(223, 1, 'http://whois.domaintools.com/2ndfolio.net', 'http://www.2ndfolio.net/', '64.246.165.200', 1302472322, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(224, 1, 'http://www.google.co.in/#hl=en&biw=1270&bih=621&q=onscreen+qr+code+reader+for+pc&aq=f&aqi;=&aql;=&oq;=&fp=22b1d38897fc72', 'http://www.2ndfolio.net/qr/', '14.96.89.207', 1302543264, 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.045'),
(225, 1, 'http://yandex.ru/yandsearch?text=2ndfolio.net', 'http://www.2ndfolio.net/', '95.27.84.43', 1302557865, 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET '),
(226, 1, 'http://www.google.co.uk/search?client=safari&rls=en&q=2nd+folio&ie=UTF-8&oe=UTF-8&redir;_esc=&ei=AC-kTa63D8qChQeAleTACQ', 'http://www.2ndfolio.net/', '137.44.187.195', 1302609170, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_7; en-us) AppleWebKit/533.20.25 (KHTML, like Gecko) V'),
(227, 1, 'http://www.google.co.uk/search?client=safari&rls=en&q=free+qr+reader+for+mac&ie=UTF-8&oe=UTF-8&redir;_esc=&ei=SzCnTd2MKc', 'http://www.2ndfolio.net/qr/', '94.172.38.219', 1302806224, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_7; en-us) AppleWebKit/533.20.25 (KHTML, like Gecko) V'),
(228, 1, 'http://www.candt.org/', 'http://www.2ndfolio.net/', '77.98.43.173', 1302818286, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6.6; .NET CLR 1.1.4322; .NET CLR '),
(229, 1, 'http://www.google.com.my/search?hl=en&client=firefox-a&rls=org.mozilla:en-US:official&q=adobe+air++++qr+code+reader&btnG', 'http://www.2ndfolio.net/qr/', '175.140.191.3', 1303028910, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.16) Gecko/20110319 Firefox/3.6.16'),
(230, 1, 'http://www.google.com/m?q=folio+reader&client=ms-opera-mini&channel=new', 'http://www.2ndfolio.net/qr/', '82.145.209.71', 1303040298, 'Opera/9.80 (J2ME/MIDP; Opera Mini/6.0.24215/24.760; U; en) Presto/2.5.25 Version/10.54'),
(231, 1, 'http://www.google.es/search?um=1&hl=es&safe=off&biw=1366&bih=558&q=QRReader online&ie=UTF-8&sa=N&tab=iw', 'http://www.2ndfolio.net/qr/', '88.19.135.39', 1303235904, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; es-ES; rv:1.9.2.16) Gecko/20110319 Firefox/3.6.16 ( .NET CL'),
(232, 1, 'http://www.google.com/search?client=safari&rls=en&q=qr+reader+for+database&ie=UTF-8&oe=UTF-8', 'http://www.2ndfolio.net/qr/', '76.232.33.8', 1303388402, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_7; en-us) AppleWebKit/533.20.25 (KHTML, like Gecko) V'),
(233, 1, 'http://www.google.ca/search?q=install+QR+reader&btnG=Search&hl=en&client=firefox-a&hs=PcI&rls=org.mozilla:en-US:official', 'http://www.2ndfolio.net/qr/', '129.173.200.95', 1303408348, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.16) Gecko/20110319 Firefox/3.6.16'),
(234, 1, 'http://www.google.com/search?q=qr+reader+instructions&rls=com.microsoft:en-us&ie=UTF-8&oe=UTF-8&startIndex;=&startPage=1', 'http://www.2ndfolio.net/qr/', '71.9.109.237', 1303423947, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.5072'),
(235, 1, 'http://www.google.com/search?q=qr+reader+instructions&rls=com.microsoft:en-us&ie=UTF-8&oe=UTF-8&startIndex;=&startPage=1', 'http://www.2ndfolio.net/qr/', '71.9.109.237', 1303424779, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.5072'),
(236, 1, 'http://whois.domaintools.com/2ndfolio.net', 'http://www.2ndfolio.net/', '64.246.165.160', 1303452423, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(237, 1, 'http://www.google.com.my/search?q=mac+qr+code+reader+camera&hl=en&client=firefox-a&rls=org.mozilla:en-GB:official&channe', 'http://www.2ndfolio.net/qr/', '175.139.76.82', 1303487585, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:2.0) Gecko/20100101 Firefox/4.0'),
(238, 1, 'http://yandex.ru/yandsearch?text=2ndfolio.net', 'http://www.2ndfolio.net/', '95.220.254.194', 1303487592, 'Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0)'),
(239, 1, 'http://www.google.co.in/search?q=on+screen+qrdecoder&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefo', 'http://www.2ndfolio.net/qr/', '121.243.89.12', 1303720216, 'Mozilla/5.0 (Windows NT 5.1; rv:2.0) Gecko/20100101 Firefox/4.0'),
(240, 1, 'find1friend.com/search?q=mark+zuckerberg', 'http://www.2ndfolio.net/', '69.13.39.43', 1303724644, 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1)'),
(241, 1, 'http://www.candt.org/', 'http://www.2ndfolio.net/', '77.98.43.173', 1303724655, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; GTB6.6; SLCC1; .NET CLR 2.0.50727; M'),
(242, 1, 'http://www.google.com/search?q=mac+qr+reader&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefox-a', 'http://www.2ndfolio.net/qr/', '74.118.5.254', 1303747204, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12'),
(243, 1, 'http://www.sitedossier.com/site/2ndfolio.net', 'http://www.2ndfolio.net/', '69.71.222.186', 1303926375, ''),
(244, 1, 'http://www.google.com/search?sourceid=navclient&ie=UTF-8&rlz=1T4GGLL_enUS351US366&q=QR+Reader+Issues', 'http://www.2ndfolio.net/qr/', '72.43.167.138', 1303998545, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6.6; .NET CLR 1.1.4322; InfoPath.'),
(245, 1, 'http://yandex.ru/yandsearch?text=2ndfolio.net', 'http://www.2ndfolio.net/', '95.24.11.181', 1304005390, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.1)'),
(246, 1, 'http://yandex.ru/yandsearch?text=2ndfolio.net', 'http://www.2ndfolio.net/', '95.27.162.17', 1304057144, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows 98; Win 9x 4.90)'),
(247, 1, 'http://yandex.ru/yandsearch?text=DOWNLOAD+QR', 'http://www.2ndfolio.net/', '95.27.133.200', 1304111034, 'Opera/9.80 (Windows NT 5.1; U; ru) Presto/2.6.30 Version/10.63'),
(248, 1, 'http://yandex.ru/yandsearch?text=2ndfolio.net', 'http://www.2ndfolio.net/', '95.24.174.78', 1304153032, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),
(249, 1, 'http://www.google.co.in/search?q=hamlet+character+in+points&hl=en&biw=1003&bih=592&prmd=ivns&ei=r3-9TfXOH4HIrQfll_j5BQ&s', 'http://www.2ndfolio.net/characters/hamlet/', '117.199.187.79', 1304268525, 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET '),
(250, 1, 'http://www.google.com/search?q=free+qr+code+reader+-mobile+pc+-"free+downloads"+-"free+download"&hl=en&biw=1489&bih=963&', 'http://www.2ndfolio.net/qr/', '98.70.129.234', 1304277633, 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727)'),
(251, 1, 'http://yandex.ru/yandsearch?text=2ndfolio.net', 'http://www.2ndfolio.net/', '95.220.240.229', 1304353715, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)'),
(252, 1, 'http://www.google.com/search?sourceid=navclient&ie=UTF-8&rlz=1T4HPNN_enUS308US308&q=qr+reader+data+base', 'http://www.2ndfolio.net/qr/', '134.89.13.29', 1304358766, 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; GTB7.0; .NET CLR 1.1.4322; .NET CLR '),
(253, 1, 'http://scanapp.vt.eurid.eu/', 'http://www.2ndfolio.net/', '213.254.203.27', 1304416461, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.60 Safari'),
(254, 1, 'http://yandex.ru/yandsearch?text=2ndfolio.net', 'http://www.2ndfolio.net/', '95.26.229.225', 1304459498, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; MyIE2; .NET CLR 1.1.4322)'),
(255, 1, 'http://whois.domaintools.com/2ndfolio.net', 'http://www.2ndfolio.net/', '216.145.17.190', 1304483467, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(256, 1, 'http://www.google.pt/search?sourceid=chrome&ie=UTF-8&q=qr+code+reader+adobe+air', 'http://www.2ndfolio.net/qr/', '81.84.129.100', 1304534866, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.742.16 Safari/534.30'),
(257, 1, 'http://yandex.ru/yandsearch?text=2ndfolio.net', 'http://www.2ndfolio.net/', '95.220.223.155', 1304558133, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),
(258, 1, 'http://candt.org/index.php/about/people-entry/barry-bulsara/', 'http://www.2ndfolio.net/', '86.145.102.186', 1304622157, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-us) AppleWebKit/533.18.1 (KHTML, like Gecko) Ve'),
(259, 1, 'http://www.candt.org/', 'http://www.2ndfolio.net/', '86.145.102.186', 1304622258, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-us) AppleWebKit/533.18.1 (KHTML, like Gecko) Ve'),
(260, 1, 'http://yandex.ru/yandsearch?text=2ndfolio.net', 'http://www.2ndfolio.net/', '95.27.177.59', 1304655904, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),
(261, 1, 'http://www.google.com/search?sourceid=navclient&ie=UTF-8&rlz=1T4ADSA_enUS397US398&q=task+card+illustrations', 'http://www.2ndfolio.net/rules/', '71.14.112.15', 1304906961, 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)'),
(262, 1, 'http://dom-v-anape.ru/', 'http://www.2ndfolio.net/', '46.4.95.200', 1304963754, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3'),
(263, 1, 'http://www.google.co.uk/search?q=qrReader+air&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-GB:official&client=firefox-a&saf', 'http://www.2ndfolio.net/qr/', '212.219.204.110', 1304964891, 'Mozilla/5.0 (Windows NT 5.1; rv:2.0.1) Gecko/20100101 Firefox/4.0.1'),
(264, 1, 'http://dom-v-anape.ru/', 'http://www.2ndfolio.net/', '46.4.95.200', 1304976348, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .N'),
(265, 1, 'http://www.google.co.in/search?hl=en&client=firefox-a&hs=lIi&rls=org.mozilla:en-US:official&q=adobe+air+qr+code+reader&o', 'http://www.2ndfolio.net/qr/', '61.17.42.118', 1305027493, 'Mozilla/5.0 (Windows NT 5.1; rv:2.0.1) Gecko/20100101 Firefox/4.0.1'),
(266, 1, 'http://yandex.ru/yandsearch?text=2ndfolio.net', 'http://www.2ndfolio.net/', '89.178.54.97', 1305063888, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),
(267, 1, 'http://www.google.com/search?client=safari&rls=en&q=qr+reader+mac&ie=UTF-8&oe=UTF-8', 'http://www.2ndfolio.net/qr/', '208.49.109.2', 1305161514, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_6; en-us) AppleWebKit/533.19.4 (KHTML, like Gecko) Ve'),
(268, 1, 'http://www.google.com/search?hl=en&safe=active&rls=com.microsoft:en-us&q=qr+reader+adobe+air&aq=0&aqi=g1&aql=f&oq=qr+rea', 'http://www.2ndfolio.net/qr/', '216.81.94.69', 1305230169, 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3'),
(269, 1, 'http://www.google.ca/search?client=safari&rls=en&q=wr+reader+for+mac&ie=UTF-8&oe=UTF-8&redir;_esc=&ei=jUPMTdTVO-O_0AGh8a', 'http://www.2ndfolio.net/qr/', '99.241.216.24', 1305236689, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_6; en-us) AppleWebKit/533.19.4 (KHTML, like Gecko) Ve'),
(270, 1, 'http://www.google.ie/search?q=points+on+the+character+of+tybalt&ie=UTF-8&oe=UTF-8&hl=en-gb&client=safari', 'http://www.2ndfolio.net/characters/tybalt/', '86.46.213.180', 1305238075, 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_3_2 like Mac OS X; en-gb) AppleWebKit/533.17.9 (KHTML, like '),
(271, 1, 'http://www.google.co.uk/search?num=20&hl=en&safe=off&client=safari&rls=en&q=mac+qr+reader&aq=f&aqi=g2g-b4&aql;=&oq;=', 'http://www.2ndfolio.net/qr/', '87.75.138.250', 1305239916, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_4_11; en-us) AppleWebKit/533.19.4 (KHTML, like Gecko) Ver'),
(272, 1, 'http://www.google.ca/search?client=safari&rls=en&q=qr+reader+for+mac&ie=UTF-8&oe=UTF-8&redir;_esc=&ei=WPvMTcCMBMLL0QGkps', 'http://www.2ndfolio.net/qr/', '24.78.132.181', 1305283217, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_7; en-gb) AppleWebKit/533.21.1 (KHTML, like Gecko) Ve'),
(273, 1, 'http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=QRreader+works+with+Adobe+Air', 'http://www.2ndfolio.net/qr/', '66.64.241.98', 1305313808, 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.65 Safari/534.24'),
(274, 1, 'http://link.orangeworld.co.uk/10283/mobile?p=mobile&pt=portal&q=qr+reader&submit;.x=16&submit;.y=10&tab=main&type;=', 'http://www.2ndfolio.net/qr/', '193.35.132.46', 1305375180, 'Mozilla/5.0 (Linux; U; Android 2.1-update1; en-gb; GT-I9000 Build/ECLAIR) AppleWebKit/530.17 (KHTML,'),
(275, 1, 'http://www.google.co.uk/search?client=safari&rls=en&q=qr+reader+for+mac&ie=UTF-8&oe=UTF-8&redir;_esc=&ei=9qvOTYb8DIKw8QO', 'http://www.2ndfolio.net/qr/', '87.74.75.240', 1305393792, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_4_11; en) AppleWebKit/533.19.4 (KHTML, like Gecko) Versio'),
(276, 1, 'http://www.google.com/search?aq=f&sourceid=chrome&ie=UTF-8&q=qr+reader+mac', 'http://www.2ndfolio.net/qr/', '66.130.104.8', 1305501966, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_7) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.69'),
(277, 1, 'http://whois.domaintools.com/2ndfolio.net', 'http://www.2ndfolio.net/', '64.246.165.160', 1305533079, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(278, 1, 'http://link.orangeworld.co.uk/10283/mobile?q=qr+reader&submit;.x=0&submit;.y=0&tab=main&type;=', 'http://www.2ndfolio.net/qr/', '193.35.132.18', 1305636835, 'Mozilla/5.0 (Linux; U; Android 1.5; en-gb; MB200 Build/CUPCAKE) AppleWebKit/528.5+ (KHTML, like Geck'),
(279, 1, 'http://www.google.ca/search?q=adobe+qr+code+reader&hl=en&rlz=1R2DACA_en-GBCA390&prmd=ivnsfd&ei=2RjTTYfMOIKctwemy-S_Cg&st', 'http://www.2ndfolio.net/qr/', '65.94.106.84', 1305683850, 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB7.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .N'),
(280, 1, 'http://www.google.com.au/search?client=safari&rls=en&q=QR+READER+MAC&ie=UTF-8&oe=UTF-8&redir;_esc=&ei=J6PTTdfXKufbiALC6L', 'http://www.2ndfolio.net/qr/', '121.222.182.80', 1305719102, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_7; en-us) AppleWebKit/533.21.1 (KHTML, like Gecko) Ve'),
(281, 1, 'http://www.google.de/search?q=qr+quote+reader&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:de:official&client=firefox-a', 'http://www.2ndfolio.net/qr/', '213.168.96.222', 1305734488, 'Mozilla/5.0 (Windows NT 6.0; rv:2.0.1) Gecko/20100101 Firefox/4.0.1'),
(282, 1, 'http://www.google.com/search?client=safari&rls=en&q=qrreader+adobe+air&ie=UTF-8&oe=UTF-8', 'http://www.2ndfolio.net/qr/', '107.10.197.184', 1305857548, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-us) AppleWebKit/533.21.1 (KHTML, like Gecko) Ve'),
(283, 1, 'http://galstuk.net/Zaponki-4/Kak-Nosit-Zaponki-62/', 'http://www.2ndfolio.net/', '80.94.164.141', 1305975884, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.11) Firefox/2.0.0.11'),
(284, 1, 'http://galstuk.net/Zaponki-4/Kak-Nosit-Zaponki-62/', 'http://www.2ndfolio.net/home/', '80.94.164.141', 1305975884, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.11) Firefox/2.0.0.11'),
(285, 1, 'http://galstuk.net/Zaponki-4/Kak-Nosit-Zaponki-62/', 'http://www.2ndfolio.net/about/', '80.94.164.141', 1305975884, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.11) Firefox/2.0.0.11'),
(286, 1, 'http://galstuk.net/Zaponki-4/Kak-Nosit-Zaponki-62/', 'http://www.2ndfolio.net/characters/', '80.94.164.141', 1305975885, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.11) Firefox/2.0.0.11'),
(287, 1, 'http://galstuk.net/Zaponki-4/Kak-Nosit-Zaponki-62/', 'http://www.2ndfolio.net/rules/', '80.94.164.141', 1305975886, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.11) Firefox/2.0.0.11'),
(288, 1, 'http://galstuk.net/Zaponki-4/Kak-Nosit-Zaponki-62/', 'http://www.2ndfolio.net/submit/', '80.94.164.141', 1305975887, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.11) Firefox/2.0.0.11'),
(289, 1, 'http://galstuk.net/Zaponki-4/Kak-Nosit-Zaponki-62/', 'http://www.2ndfolio.net/qr/', '80.94.164.141', 1305975888, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.11) Firefox/2.0.0.11'),
(290, 1, 'http://galstuk.net/Zaponki-4/Kak-Nosit-Zaponki-62/', 'http://www.2ndfolio.net/cards/', '80.94.164.141', 1305975889, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.11) Firefox/2.0.0.11'),
(291, 1, 'http://galstuk.net/Zaponki-4/Kak-Nosit-Zaponki-62/', 'http://www.2ndfolio.net/league/', '80.94.164.141', 1305975890, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.11) Firefox/2.0.0.11'),
(292, 1, 'http://galstuk.net/Zaponki-4/Kak-Nosit-Zaponki-62/', 'http://www.2ndfolio.net/characters/witch/', '80.94.164.141', 1305975891, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.11) Firefox/2.0.0.11'),
(293, 1, 'http://galstuk.net/Zaponki-4/Kak-Nosit-Zaponki-62/', 'http://www.2ndfolio.net/characters/tybalt/', '80.94.164.141', 1305975892, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.11) Firefox/2.0.0.11'),
(294, 1, 'http://www.google.ca/search?q=adobe+air+qr+reader+mac&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firef', 'http://www.2ndfolio.net/qr/', '24.226.123.196', 1306113312, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:2.0.1) Gecko/20100101 Firefox/4.0.1'),
(295, 1, 'http://www.google.ca/search?q=adobe+air+qr+reader+mac&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firef', 'http://www.2ndfolio.net/qr/', '24.226.123.196', 1306113898, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:2.0.1) Gecko/20100101 Firefox/4.0.1'),
(296, 1, 'http://gajdusek.net/', 'http://www.2ndfolio.net/', '178.63.23.142', 1306137050, 'Opera/9.80 (X11; Linux x86_64; U; en) Presto/2.8.131 Version/11.10'),
(297, 1, 'http://www.google.ca/search?q=adobe+air+qr+reader+mac&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firef', 'http://www.2ndfolio.net/qr/', '24.226.123.196', 1306161334, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:2.0.1) Gecko/20100101 Firefox/4.0.1'),
(298, 1, 'http://yandex.ru/yandsearch?text=2ndfolio.net', 'http://www.2ndfolio.net/', '95.220.165.88', 1306209032, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.1.4322)'),
(299, 1, 'http://www.google.com/search?aq=f&sourceid=chrome&ie=UTF-8&q=qr+reader+mac', 'http://www.2ndfolio.net/qr/', '173.51.221.177', 1306212350, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_7; en-US) AppleWebKit/534.16 (KHTML, like Gecko) Chro'),
(300, 1, 'http://uk.ask.com/web?qsrc=1&o=0&l=dir&q=where+can+I+download+large+playing+cards&dm=ctry', 'http://www.2ndfolio.net/cards/', '82.10.252.23', 1306347454, 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; FunWebProducts; .NET CLR 1.1.4322; .'),
(301, 1, 'http://www.google.com/search?q=qr+reader+on+computer&hl=en&safe=active&client=firefox-a&hs=G00&rls=org.mozilla:en-US:off', 'http://www.2ndfolio.net/qr/', '205.125.43.143', 1306359298, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3'),
(302, 1, 'http://www.google.co.uk/search?hl=en&cr=countryUK|countryGB&biw=1519&bih=655&tbs=ctr:countryUK|countryGB&q=qr+code+reade', 'http://www.2ndfolio.net/qr/', '109.149.88.2', 1306452977, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:2.0.1) Gecko/20100101 Firefox/4.0.1'),
(303, 1, 'http://www.google.com/search?q=qr+code+reader+pc+free+download+-mobile+-iphone+-ipod&hl=en&biw=1680&bih=925&num=10&lr;=&', 'http://www.2ndfolio.net/qr/', '24.126.136.162', 1306560550, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.71 Safari'),
(304, 1, 'http://whois.domaintools.com/2ndfolio.net', 'http://www.2ndfolio.net/', '64.246.165.140', 1306582798, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(305, 1, 'http://www.google.com/search?aq=f&sourceid=chrome&ie=UTF-8&q=qr+reader+air', 'http://www.2ndfolio.net/qr/', '94.226.93.103', 1306741029, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.742.68 Safari'),
(306, 1, 'http://www.google.com/search?client=safari&rls=en&q=qr+reader+mac&ie=UTF-8&oe=UTF-8', 'http://www.2ndfolio.net/qr/', '76.169.93.168', 1306745267, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_7; en-us) AppleWebKit/533.21.1 (KHTML, like Gecko) Ve'),
(307, 1, 'http://www.google.ca/search?q=free+qr+card+reader+for+mac&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=f', 'http://www.2ndfolio.net/qr/', '206.116.249.146', 1306766795, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.2.17) Gecko/20110420 Firefox/3.6.17'),
(308, 1, 'http://candt.org/index.php/about/people-entry/barry-bulsara/', 'http://www.2ndfolio.net/', '86.26.192.202', 1306776578, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:2.0.1) Gecko/20100101 Firefox/4.0.1'),
(309, 1, 'http://www.google.com.hk/imglanding?q=lady macbeth&imgurl=http://edu.glogster.com/media/4/34/89/30/34893088.jpg&imgrefur', 'http://www.2ndfolio.net/characters/lady-macbeth/', '218.81.95.137', 1306782134, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; TencentTraveler 4.0; .NET CLR 2.0.50727; .NE'),
(310, 1, 'http://www.google.com/search?client=safari&rls=en&q=QRreader+mac&ie=UTF-8&oe=UTF-8', 'http://www.2ndfolio.net/qr/', '95.176.207.247', 1306833450, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_7; en-us) AppleWebKit/533.21.1 (KHTML, like Gecko) Ve'),
(311, 1, 'http://yandex.ru/yandsearch?text=2ndfolio.net', 'http://www.2ndfolio.net/', '89.178.37.18', 1306934335, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0; ru) Opera 8.50'),
(312, 1, 'http://www.supercooldesign.co.uk/work/entry/ct', 'http://www.2ndfolio.net/', '217.35.77.248', 1306949381, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_7; en-us) AppleWebKit/533.21.1 (KHTML, like Gecko) Ve'),
(313, 1, 'http://www.supercooldesign.co.uk/work/entry/ct', 'http://www.2ndfolio.net/', '217.35.77.248', 1306949445, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_7; en-us) AppleWebKit/533.21.1 (KHTML, like Gecko) Ve'),
(314, 1, 'http://www.muammar-gaddafi.info', 'http://www.2ndfolio.net/', '95.111.103.112', 1307066511, 'Mozilla/5.0 (compatible; DontTrackMe; +http://www.muammar-gaddafi.info)'),
(315, 1, 'http://www.google.com/search?client=safari&rls=en&q=adobe+air+qr+reader&ie=UTF-8&oe=UTF-8', 'http://www.2ndfolio.net/qr/', '72.179.51.221', 1307215841, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-us) AppleWebKit/533.21.1 (KHTML, like Gecko) Ve'),
(316, 1, 'http://candt.org/index.php/about/people-entry/paul-sutton/', 'http://www.2ndfolio.net/', '195.195.4.161', 1307358030, 'Mozilla/5.0 (Windows NT 6.0; rv:2.0.1) Gecko/20100101 Firefox/4.0.1'),
(317, 1, 'http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=mac+qr+reader&safe=active', 'http://www.2ndfolio.net/qr/', '208.29.163.248', 1307387632, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_7) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.69'),
(318, 1, 'http://www.google.com/search?q=QRreader.air+download&rls=com.microsoft:en-us&ie=UTF-8&oe=UTF-8&startIndex;=&startPage=1&', 'http://www.2ndfolio.net/qr/', '170.185.232.19', 1307474338, 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)'),
(319, 1, 'http://whois.domaintools.com/2ndfolio.net', 'http://www.2ndfolio.net/', '64.246.165.190', 1307620538, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(320, 1, 'http://www.we-globe.net/Weblab/SiteCommonGraveReport/www.2ndfolio.net/', 'http://www.2ndfolio.net/', '62.219.132.115', 1307626670, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; fr; rv:1.9.0.8) Gecko/2009032609 Firefox/3.0.8'),
(321, 1, 'http://www.google.si/search?hl=sl&client=firefox-a&hs=z9f&rls=org.mozilla:en-GB:official&sa=X&ei=48nwTa2cDcyhOqWQ_LgD&ve', 'http://www.2ndfolio.net/qr/', '89.212.20.146', 1307629562, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:2.0.1) Gecko/20100101 Firefox/4.0.1'),
(322, 1, 'http://www.google.de/search?q=linux+qr+decoder&hl=de&client=firefox-a&hs=VaW&rls=org.mozilla:en-US:unofficial&prmd=ivns&', 'http://www.2ndfolio.net/qr/', '138.246.2.108', 1307831341, 'Mozilla/5.0 (X11; Linux x86_64; rv:2.0) Gecko/20110324 Firefox/4.0'),
(323, 1, 'http://www.google.com/search?client=safari&rls=en&q=qr+reader+mac&ie=UTF-8&oe=UTF-8', 'http://www.2ndfolio.net/qr/', '70.90.96.242', 1307992568, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-us) AppleWebKit/533.21.1 (KHTML, like Gecko) Ve'),
(324, 1, 'http://www.google.com/search?q=qr+reader+download+mac&sourceid=ie7&rls=com.microsoft:en-us:IE-SearchBox&ie;=&oe;=', 'http://www.2ndfolio.net/qr/', '66.99.140.202', 1308159552, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .N'),
(325, 1, 'http://www.supercooldesign.co.uk/work/entry/ct', 'http://www.2ndfolio.net/', '174.129.89.147', 1308183140, 'Mozilla/5.0 (compatible;picmole/1.0 +http://www.picmole.com)'),
(326, 1, 'http://www.google.co.uk/', 'http://www.2ndfolio.net/qr/', '86.186.91.196', 1308241240, 'Opera/9.80 (X11; Linux i686; U; en-GB) Presto/2.8.131 Version/11.10'),
(327, 1, 'http://www.google.co.uk/', 'http://www.2ndfolio.net/qr/', '86.186.91.196', 1308243413, 'Opera/9.80 (X11; Linux i686; U; en-GB) Presto/2.8.131 Version/11.10'),
(328, 1, 'http://www.google.com.br/search?hl=pt-BR&q=qr+code+webcam+reader+adobe+air&oq=qr+code+webcam+reader+adobe+air&aq=f&aqi;=', 'http://www.2ndfolio.net/qr/', '200.175.61.62', 1308250727, 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)'),
(329, 1, 'http://www.google.ca/search?sourceid=navclient&ie=UTF-8&rlz=1T4OPIT_enCA329CA330&client=osd-intl-205937&q=Problems+with+', 'http://www.2ndfolio.net/qr/', '67.224.95.230', 1308251738, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.0; .NET CLR 2.0.50727; .NET CLR'),
(330, 1, 'http://www.google.com.sg/search?hl=en&rlz=1T4GGHP_enSG433SG433&q=scheming+lady+macbeth+quotes&oq=scheming+lady+macbeth+q', 'http://www.2ndfolio.net/characters/lady-macbeth/', '220.255.1.231', 1308311532, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; GTB7.0; SLCC2; .NET CLR 2.0.5'),
(331, 1, 'http://www.google.ca/search?q=adobe+air+qr+code+reader&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:fr:official&client=firefox', 'http://www.2ndfolio.net/qr/', '207.253.225.197', 1308345578, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:2.0.1) Gecko/20100101 Firefox/4.0.1'),
(332, 1, 'http://www.google.com/m?gl=fr&source=android-browser-type&client=ms-android-htc&hl=fr&aq=f&oq;=&aqi=-k0d0t0&fkt=77&fsdt=', 'http://www.2ndfolio.net/qr/', '96.22.246.97', 1308345796, 'Mozilla/5.0 (Linux; U; Android 2.2; fr-fr; Nexus One Build/FRF91) AppleWebKit/533.1 (KHTML, like Gec'),
(333, 1, 'http://www.google.co.uk/search?q=qr+reader+mac&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefox-a', 'http://www.2ndfolio.net/qr/', '82.153.245.9', 1308567093, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10.4; en-US; rv:1.9.2.17) Gecko/20110420 Firefox/3.6.17'),
(334, 1, 'http://www.google.co.uk/', 'http://www.2ndfolio.net/qr/', '86.164.94.140', 1308570606, 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)'),
(335, 1, 'http://www.google.com/cse?cx=partner-pub-9300639326172081:5191442144&ie=UTF-8&sa=Search&q=qr+reader+for+linux&hl=en', 'http://www.2ndfolio.net/qr/', '75.93.197.157', 1308613778, 'Mozilla/5.0 (X11; Linux i686; rv:2.0.1) Gecko/20100101 Firefox/4.0.1'),
(336, 1, 'http://hk.search.yahoo.com/search;_ylt=Axt7wJVLbABOBRQAz3izygt.?p=qr+reader&rd=r1&fr=FP-tab-web-t&fr2=sg-gac&xargs=0&pst', 'http://www.2ndfolio.net/qr/', '203.218.104.64', 1308654295, 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET '),
(337, 1, 'http://yandex.ru/yandsearch?text=2ndfolio.net', 'http://www.2ndfolio.net/', '95.28.80.173', 1308674778, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.1.4322)'),
(338, 1, 'http://www.google.co.uk/search?hl=en&source=hp&q=qr+reader+pc&btnG=Google+Search&meta=cr=countryUK|countryGB&aq=f&oq;=&s', 'http://www.2ndfolio.net/qr/', '213.235.0.105', 1308675527, 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0; Trident/5.0)'),
(339, 1, 'http://whois.domaintools.com/2ndfolio.net', 'http://www.2ndfolio.net/', '64.246.165.140', 1308682920, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(340, 1, 'http://www.google.co.uk/search?q=mac+qr+decoder&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefox-a', 'http://www.2ndfolio.net/qr/', '193.195.124.60', 1308752225, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:5.0) Gecko/20100101 Firefox/5.0'),
(341, 1, 'http://www.google.com/search?client=safari&rls=en&q=onscreen+qr+reader&ie=UTF-8&oe=UTF-8', 'http://www.2ndfolio.net/qr/', '69.74.239.162', 1308762347, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_6; en-us) AppleWebKit/533.19.4 (KHTML, like Gecko) Ve'),
(342, 1, 'http://www.google.com/search?client=safari&rls=en&q=onscreen+qr+reader&ie=UTF-8&oe=UTF-8', 'http://www.2ndfolio.net/qr/', '69.74.239.162', 1308762362, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_6; en-us) AppleWebKit/533.19.4 (KHTML, like Gecko) Ve'),
(343, 1, 'http://www.kvasir.no/alle?q=gratis+qrreader&partnerid=ABCstartsiden&source=startsiden.no', 'http://www.2ndfolio.net/qr/', '84.202.155.215', 1308832017, 'Mozilla/5.0 (Windows NT 6.1; rv:2.0.1) Gecko/20100101 Firefox/4.0.1'),
(344, 1, 'http://www.google.com/search?q=qr+codes+task+cards', 'http://www.2ndfolio.net/rules/', '96.18.83.90', 1308862301, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .N'),
(345, 1, 'http://moskva.tiu.ru/p1516162-zenslim.html', 'http://www.2ndfolio.net/', '195.54.163.122', 1309008666, 'Mozilla/4.0 (compatible; MSIE 5.0; Windows 3.1)'),
(346, 1, 'http://www.google.com/', 'http://www.2ndfolio.net/qr/', '64.202.238.18', 1309137325, 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Trident/5.0; SLCC1; .NET CLR 2.0.50727; .NET CLR '),
(347, 1, 'http://search.conduit.com/Results.aspx?q=on+screen+qr+reader&ctid=CT3038789&octid=CT3038789&SearchSource=1', 'http://www.2ndfolio.net/qr/', '90.214.208.238', 1309375812, 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)'),
(348, 1, 'http://search.conduit.com/Results.aspx?q=on+screen+qr+reader&ctid=CT3038789&octid=CT3038789&SearchSource=1', 'http://www.2ndfolio.net/qr/', '90.214.208.238', 1309375870, 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)'),
(349, 1, 'http://www.google.de/search?q=QR+reader+mac&hl=de&prmd=ivnsfd&ei=jIsLTtHTNceQswbMrOCkDg&start=10&sa=N', 'http://www.2ndfolio.net/qr/', '78.55.55.186', 1309383242, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:5.0) Gecko/20100101 Firefox/5.0'),
(350, 1, 'http://www.google.ru/search?q=linux+qr+decoder&hl=ru&safe=off&prmd=ivns&ei=GDMMTt_rOo_Eswbe_-HxDg&start=10&sa=N&biw=1280', 'http://www.2ndfolio.net/qr/', '213.79.103.170', 1309426354, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; ru; rv:1.9.2.18) Gecko/20110614 Firefox/3.6.18'),
(351, 1, 'http://www.google.it/search?aq=f&sourceid=chrome&ie=UTF-8&q=qr+reader+linux', 'http://www.2ndfolio.net/qr/', '109.53.75.134', 1309702544, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.742.100 Safari/53'),
(352, 1, 'http://search.avg.com/?p=2&q=download+"playing+cards.&d=4da8d4e7&v=7.005.030.004&tp=tb&l=en-US&i=26', 'http://www.2ndfolio.net/cards/', '64.233.154.25', 1309748074, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:2.0.1) Gecko/20100101 Firefox/4.0.1'),
(353, 1, 'http://whois.domaintools.com/2ndfolio.net', 'http://www.2ndfolio.net/', '64.246.178.34', 1309760855, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(354, 1, 'http://www.google.nl/search?hl=nl&q="QR+reader"+linux&oq;="QR+reader"+linux&aq=f&aqi=g1&aql=undefined&gs_sm=e&gs_upl=249', 'http://www.2ndfolio.net/qr/', '83.163.143.62', 1309784585, 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/534.26+ (KHTML, like Gecko) Version/5.0 Safari/534.26+ Ubu'),
(355, 1, 'http://yandex.ru/yandsearch?text=2ndfolio.net', 'http://www.2ndfolio.net/', '95.24.219.209', 1309815236, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)'),
(356, 1, 'http://www.google.com.au/', 'http://www.2ndfolio.net/qr/', '203.122.254.26', 1310015952, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR '),
(357, 1, 'http://www.google.com.sg/search?q=qr+code+reader+windows+webcam+download&hl=en&prmd=ivns&ei=qJIVTpTgNsPyrQfzycy6Dw&start', 'http://www.2ndfolio.net/qr/', '210.193.23.142', 1310043614, 'Mozilla/5.0 (Windows NT 5.1; rv:2.0.1) Gecko/20100101 Firefox/4.0.1'),
(358, 1, 'http://candt.org/', 'http://www.2ndfolio.net/', '86.176.74.24', 1310050956, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.9.2.18) Gecko/20110614 Firefox/3.6.18'),
(359, 1, 'http://www.google.com.sg/m?safe=off&client=ms-m1-sg&aq=f&oq;=&aqi=-k0d0t0&fkt=5773&fsdt=12987&cqt;=&rst;=&htf;=&his;=&ma', 'http://www.2ndfolio.net/qr/', '202.65.247.145', 1310102049, 'Mozilla/5.0 (SAMSUNG; SAMSUNG-GT-S8500/1.0; U; Bada/1.0; en-us) AppleWebKit/533.1 (KHTML, like Gecko'),
(360, 1, 'http://www.google.co.in/search?hl=&q=how+to+integrate+database+via+already+established+API+with+a+QR+code+generator&sour', 'http://www.2ndfolio.net/qr/', '59.90.168.120', 1310109229, 'Mozilla/5.0 (Windows NT 5.1; rv:5.0) Gecko/20100101 Firefox/5.0'),
(361, 1, 'http://www.google.com/search?aq=f&sourceid=chrome&ie=UTF-8&q=qr+reader+mac', 'http://www.2ndfolio.net/qr/', '38.124.26.163', 1310147498, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.74'),
(362, 1, 'http://www.scroogle.org/cgi-bin/nbbw.cgi', 'http://www.2ndfolio.net/qr/', '84.29.34.134', 1310172513, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.19) Gecko/2011050718 Iceweasel/3.0.6 (Debian-3.0.6-'),
(363, 1, 'http://yandex.ru/yandsearch?text=2ndfolio.net', 'http://www.2ndfolio.net/', '46.73.133.148', 1310373368, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),
(364, 1, 'http://www.google.com/search?hl=en&source=hp&biw=1582&bih=774&q=qr+reader+macintosh&aq=f&aqi=g-b1&aql;=&oq;=', 'http://www.2ndfolio.net/qr/', '74.94.57.250', 1310404987, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-us) AppleWebKit/533.21.1 (KHTML, like Gecko) Ve'),
(365, 1, 'http://www.google.com/search?client=safari&rls=en&q=qr+reader+mac&ie=UTF-8&oe=UTF-8', 'http://www.2ndfolio.net/qr/', '98.30.227.47', 1310426787, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_8; en-us) AppleWebKit/533.21.1 (KHTML, like Gecko) Ve'),
(366, 1, 'http://whois.domaintools.com/2ndfolio.net', 'http://www.2ndfolio.net/', '64.246.187.42', 1310828253, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(367, 1, 'http://www.google.com.au/search?client=safari&rls=en&q=qr+reader+on+mac&ie=UTF-8&oe=UTF-8&redir;_esc=&ei=fkIiTs7EL-GJmQW', 'http://www.2ndfolio.net/qr/', '220.236.197.169', 1310871795, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_8; en-us) AppleWebKit/533.21.1 (KHTML, like Gecko) Ve'),
(368, 1, 'http://www.google.com.au/search?hl=en&client=safari&rls=en&q=lady+macbeth+schemeing&oq=lady+macbeth+schemeing&aq=f&aqi;=', 'http://www.2ndfolio.net/characters/lady-macbeth/', '211.30.109.42', 1310885584, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_5_8; en-us) AppleWebKit/533.21.1 (KHTML, like Gecko) Vers'),
(369, 1, 'http://www.google.nl/search?hl=nl&client=firefox-a&hs=xPS&rls=org.mozilla:nl:official&sa=X&ei=SlElTr3gEciXOpeVrdQK&ved=0', 'http://www.2ndfolio.net/qr/', '188.204.133.126', 1311073209, 'Mozilla/5.0 (Windows NT 5.1; rv:5.0) Gecko/20100101 Firefox/5.0'),
(370, 1, 'http://www.google.com.au/search?num=100&hl=en&safe=off&client=firefox-a&rls=org.mozilla:en-GB:official&channel=np&q="qr+', 'http://www.2ndfolio.net/qr/', '122.149.91.249', 1311088256, 'Mozilla/5.0 (X11; Linux i686; rv:5.0) Gecko/20100101 Firefox/5.0'),
(371, 1, 'http://www.supercooldesign.co.uk/work/entry/ct', 'http://www.2ndfolio.net/', '94.192.83.194', 1311100078, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_7; en-us) AppleWebKit/533.21.1 (KHTML, like Gecko) Ve'),
(372, 1, 'http://www.supercooldesign.co.uk/work/entry/ct', 'http://www.2ndfolio.net/', '94.192.83.194', 1311100110, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_7; en-us) AppleWebKit/533.21.1 (KHTML, like Gecko) Ve'),
(373, 1, 'http://www.google.com.br/search?client=safari&rls=en&q=mac+qr+reader&ie=UTF-8&oe=UTF-8&redir;_esc=&ei=aKYnTvfpCqTx0gGH8q', 'http://www.2ndfolio.net/qr/', '186.212.49.130', 1311225212, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_8; en-us) AppleWebKit/533.21.1 (KHTML, like Gecko) Ve'),
(374, 1, 'http://uk.search.yahoo.com/search;_ylt=Aj6N1FR2r6SLyqB7jPmU9xI4hJp4;_ylc=X1MDMjAyMzM5MjMxMgRfcgMyBGZyA3lmcC10LTcwMgRuX2d', 'http://www.2ndfolio.net/cards/', '77.73.14.10', 1311247017, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; InfoPath.1; .NET CLR 2.0.50727; .NET'),
(375, 1, 'http://uk.search.yahoo.com/search;_ylt=Aj6N1FR2r6SLyqB7jPmU9xI4hJp4;_ylc=X1MDMjAyMzM5MjMxMgRfcgMyBGZyA3lmcC10LTcwMgRuX2d', 'http://www.2ndfolio.net/cards/', '77.73.14.10', 1311250300, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; InfoPath.1; .NET CLR 2.0.50727; .NET'),
(376, 1, 'http://www.google.com/search?q=qrcode+linux&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefox-a&sourc', 'http://www.2ndfolio.net/qr/', '85.18.64.81', 1311251224, 'Mozilla/5.0 (X11; Linux i686; rv:5.0) Gecko/20100101 Firefox/5.0'),
(377, 1, 'http://yandex.ru/yandsearch?text=2ndfolio.net', 'http://www.2ndfolio.net/', '95.26.183.182', 1311378924, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),
(378, 1, 'http://www.sitedossier.com/site/2ndfolio.net', 'http://www.2ndfolio.net/', '69.71.222.186', 1311392179, ''),
(379, 1, 'http://www.candt.org/', 'http://www.2ndfolio.net/', '60.39.94.141', 1311502984, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; GTB7.1; SLCC1; .NET CLR 2.0.50727; M'),
(380, 1, 'http://www.google.co.uk/search?client=safari&rls=en&q=qr+reader+mac&ie=UTF-8&oe=UTF-8&redir;_esc=&ei=8VAsTo2NFc23hAf88MC', 'http://www.2ndfolio.net/qr/', '86.24.91.185', 1311530774, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7) AppleWebKit/534.48.3 (KHTML, like Gecko) Version/5.1 Sa'),
(381, 1, 'http://www.google.co.uk/search?client=safari&rls=en&q=qr+reader+mac&ie=UTF-8&oe=UTF-8&redir;_esc=&ei=8VAsTo2NFc23hAf88MC', 'http://www.2ndfolio.net/qr/', '86.24.91.185', 1311530804, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7) AppleWebKit/534.48.3 (KHTML, like Gecko) Version/5.1 Sa'),
(382, 1, 'http://www.netcraft.com/survey/', 'http://www.2ndfolio.net/', '50.19.128.241', 1311619801, 'Mozilla/4.0 (compatible; Netcraft Web Server Survey)'),
(383, 1, 'http://www.google.com/search?client=ubuntu&channel=fs&q=linux+qr+decode+from+camera&ie=utf-8&oe=utf-8', 'http://www.2ndfolio.net/qr/', '62.165.251.56', 1311636031, 'Mozilla/5.0 (X11; Linux x86_64; rv:5.0) Gecko/20100101 Firefox/5.0'),
(384, 1, 'http://www.google.com/search?client=safari&rls=en&q=QR+reader+mac+computer&ie=UTF-8&oe=UTF-8', 'http://www.2ndfolio.net/qr/', '76.252.174.235', 1311654337, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_7; en-us) AppleWebKit/533.21.1 (KHTML, like Gecko) Ve'),
(385, 1, 'http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=qr+reader+for+mac', 'http://www.2ndfolio.net/qr/', '173.66.45.3', 1311655497, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/14.0.825.0 Safari/535.1'),
(386, 1, 'http://yandex.ru/yandsearch?text=2ndfolio.net', 'http://www.2ndfolio.net/', '95.221.77.192', 1311775311, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)'),
(387, 1, 'http://www.google.com/webhp', 'http://www.2ndfolio.net/qr/', '110.44.111.66', 1311816921, 'Mozilla/5.0 (X11; Linux i686; rv:2.0) Gecko/20100101 Firefox/4.0'),
(388, 1, 'http://www.google.com/search?q=2ndfolio.net&ie=UTF-8&oe=UTF-8&hl=en&client=safari', 'http://www.2ndfolio.net/', '174.253.1.188', 1311859356, 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_2_8 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like '),
(389, 1, 'http://www.google.com/search?q=qr+reader+mac&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefox-a', 'http://www.2ndfolio.net/qr/', '93.172.238.64', 1311876690, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.19) Gecko/2010031218 Firefox/3.0.19 '),
(390, 1, 'http://yandex.ru/yandsearch?text=2ndfolio.net', 'http://www.2ndfolio.net/', '95.27.152.167', 1311891747, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR '),
(391, 1, 'http://whois.domaintools.com/2ndfolio.net', 'http://www.2ndfolio.net/', '216.145.14.142', 1311911118, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(392, 1, 'http://www.google.com/search?q=mac+qr+reader&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefox-a', 'http://www.2ndfolio.net/qr/', '99.181.233.82', 1311968494, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3'),
(393, 1, 'http://candt.org/', 'http://www.2ndfolio.net/', '66.166.170.203', 1311983971, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:5.0) Gecko/20100101 Firefox/5.0'),
(394, 1, 'http://t.co/xVVffFf', 'http://www.2ndfolio.net/', '184.72.131.60', 1311984677, 'Mozilla/5.0 (compatible; PaperLiBot/2.1)'),
(395, 1, 'http://candt.org/', 'http://www.2ndfolio.net/', '217.42.173.184', 1312018977, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_5_8) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.74'),
(396, 1, 'http://t.co/xVVffFf', 'http://www.2ndfolio.net/', '184.72.94.177', 1312027895, 'Mozilla/5.0 (compatible; PaperLiBot/2.1)'),
(397, 1, 'http://t.co/xVVffFf', 'http://www.2ndfolio.net/', '184.72.167.56', 1312032365, 'Mozilla/5.0 (compatible; PaperLiBot/2.1)'),
(398, 1, 'http://t.co/xVVffFf', 'http://www.2ndfolio.net/', '184.73.30.153', 1312033359, 'Mozilla/5.0 (compatible; PaperLiBot/2.1)'),
(399, 1, 'http://t.co/xVVffFf', 'http://www.2ndfolio.net/', '184.73.3.155', 1312062935, 'Mozilla/5.0 (compatible; PaperLiBot/2.1)'),
(400, 1, 'http://www.google.co.uk/search?q=instructions+for+qr+reader&ie=UTF-8&oe=UTF-8&hl=en&client=safari', 'http://www.2ndfolio.net/qr/', '86.144.32.84', 1312099578, 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_2_1 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like '),
(401, 1, 'http://www.google.de/search?q=QR+reader+for+linux&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefox-a', 'http://www.2ndfolio.net/qr/', '91.8.39.125', 1312130039, 'Mozilla/5.0 (X11; Linux i686; rv:5.0.1) Gecko/20100101 Firefox/5.0.1'),
(402, 1, 'http://aolsearcht6.search.aol.com/aol/search?s_it=topsearchbox.search&v_t=tb50-ie-verizon-ab-en-us&q=2nd+Folio', 'http://www.2ndfolio.net/', '98.225.204.137', 1312144373, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.5072'),
(403, 1, 'http://www.google.com/search?q=problems+with+qr+reader&ie=UTF-8&oe=UTF-8&hl=en&client=safari', 'http://www.2ndfolio.net/qr/', '166.205.15.184', 1312175537, 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_1 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko'),
(404, 1, 'http://yandex.ru/yandsearch?text=2ndfolio.net', 'http://www.2ndfolio.net/', '46.73.80.169', 1312191689, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; MyIE2; .NET CLR 1.1.4322)'),
(405, 1, 'http://www.candt.org/', 'http://www.2ndfolio.net/', '165.155.110.2', 1312227257, 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.5072'),
(406, 1, 'http://www.google.com.mx/search?hl=es&client=firefox-a&hs=1il&rls=org.mozilla:es-ES:official&q=qr+decode+dos+windows&oq=', 'http://www.2ndfolio.net/qr/', '187.142.9.146', 1312258638, 'Mozilla/5.0 (Windows NT 5.1; rv:5.0) Gecko/20100101 Firefox/5.0'),
(407, 1, 'http://www.google.com.au/search?sourceid=chrome&ie=UTF-8&q=qr+reader+for+mac', 'http://www.2ndfolio.net/qr/', '58.96.63.10', 1312262367, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_6) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782'),
(408, 1, 'http://www.candt.org/', 'http://www.2ndfolio.net/', '90.183.77.10', 1312300960, 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.742.122 Safari/534.3'),
(409, 1, 'http://www.candt.org/', 'http://www.2ndfolio.net/', '162.119.68.249', 1312312872, 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.742.122 Safari/534.3'),
(410, 1, 'http://www.google.co.uk/search?hl=en&q=qr+codes+screen+reader&meta;=', 'http://www.2ndfolio.net/qr/', '85.11.220.75', 1312375284, 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.107 Safari'),
(411, 1, 'http://www.google.co.uk/m/search?oe=UTF-8&client=safari&q=Shakespeare+card+game&hl=en&start=10&sa=N', 'http://www.2ndfolio.net/about/', '82.132.136.220', 1312413083, 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 3_1_2 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML, like Ge'),
(412, 1, 'http://www.google.co.uk/m/search?oe=UTF-8&client=safari&q=Shakespeare+card+game&hl=en&start=10&sa=N', 'http://www.2ndfolio.net/about/', '82.132.139.76', 1312413236, 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 3_1_2 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML, like Ge'),
(413, 1, 'http://link.orangeworld.co.uk/10283/mobile?p=mobile&pt=portal&q=qr+reader&submit;.x=12&submit;.y=18&tab=main&type;=', 'http://www.2ndfolio.net/qr/', '193.35.132.7', 1312476936, 'Mozilla/5.0 (Linux; U; Android 2.1-update1; en-gb; SonyEricssonE10i-o Build/2.1.1.A.0.6) AppleWebKit'),
(414, 1, 'http://www.google.nl/search?client=safari&rls=en&q=qr+reader+mac&ie=UTF-8&oe=UTF-8&redir;_esc=&ei=X2M9TpGMIsqcOsnn9O4H', 'http://www.2ndfolio.net/qr/', '84.80.126.68', 1312649597, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7) AppleWebKit/534.48.3 (KHTML, like Gecko) Version/5.1 Sa'),
(415, 1, 'http://www.google.fr/search?client=safari&rls=en&q=qr+reader+mac&ie=UTF-8&oe=UTF-8&redir;_esc=&ei=gKA9Tu-jFY3oOZ2n3YYI', 'http://www.2ndfolio.net/qr/', '92.162.12.166', 1312665288, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-us) AppleWebKit/533.16 (KHTML, like Gecko) Vers'),
(416, 1, 'http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=qr+reader+mac', 'http://www.2ndfolio.net/qr/', '71.147.37.214', 1312775077, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782'),
(417, 1, 'http://www.we-globe.net/Weblab/SiteCommonGraveReport/www.2ndfolio.net/', 'http://www.2ndfolio.net/', '62.219.132.115', 1312801859, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; fr; rv:1.9.0.8) Gecko/2009032609 Firefox/3.0.8'),
(418, 1, 'http://candt.org/index.php/projects/entry/2nd-folio/', 'http://www.2ndfolio.net/', '137.166.4.42', 1312852783, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:5.0.1) Gecko/20100101 Firefox/5.0.1'),
(419, 1, 'http://candt.org/index.php/projects/entry/2nd-folio/', 'http://www.2ndfolio.net/', '137.166.4.42', 1312852785, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:5.0.1) Gecko/20100101 Firefox/5.0.1'),
(420, 1, 'http://www.google.com/search?client=safari&rls=en&q=QRreader+mac&ie=UTF-8&oe=UTF-8', 'http://www.2ndfolio.net/qr/', '195.159.127.2', 1312988729, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7) AppleWebKit/534.48.3 (KHTML, like Gecko) Version/5.1 Sa'),
(421, 1, 'http://candt.org/index.php/projects/entry/2nd-folio/', 'http://www.2ndfolio.net/', '217.138.10.162', 1312997424, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:5.0.1) Gecko/20100101 Firefox/5.0.1'),
(422, 1, 'http://whois.domaintools.com/2ndfolio.net', 'http://www.2ndfolio.net/', '64.246.165.140', 1313012921, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(423, 1, 'http://www.google.com.hk/#hl=zh-TW&source=hp&q=qr+adobe+air&oq=qr+adobe+air&aq=f&aqi;=&aql;=&gs_sm=e&gs_upl=456l5861l0l6', 'http://www.2ndfolio.net/qr/', '203.198.102.229', 1313039373, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/15.0.848.0 Safari/5'),
(424, 1, 'http://www.google.com/search?client=safari&rls=en&q=qr+reader+mac&ie=UTF-8&oe=UTF-8', 'http://www.2ndfolio.net/qr/', '92.241.92.92', 1313052824, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7) AppleWebKit/534.48.3 (KHTML, like Gecko) Version/5.1 Sa'),
(425, 1, 'http://www.google.co.th/search?q=qr+reader+and+database&ie=UTF-8&oe=UTF-8&hl=en&client=safari', 'http://www.2ndfolio.net/qr/', '125.26.116.112', 1313160966, 'Mozilla/5.0 (iPad; U; CPU OS 4_3_3 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Ve'),
(426, 1, 'http://www.tv-online-live.com', 'http://www.2ndfolio.net/qr/', '109.230.244.216', 1313177930, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; pl; rv:1.9.1.3) Gecko/20090824 Firefox/3.5.3'),
(427, 1, 'http://www.google.ru/search?client=opera&rls=ru&q=qr+reader+windows&sourceid=opera&ie=utf-8&oe=utf-8&channel=suggest', 'http://www.2ndfolio.net/qr/', '85.26.241.222', 1313318971, 'Opera/9.80 (Windows NT 6.1; U; ru) Presto/2.9.168 Version/11.50'),
(428, 1, 'http://www.google.ru/search?client=opera&rls=ru&q=qr+reader+windows&sourceid=opera&ie=utf-8&oe=utf-8&channel=suggest', 'http://www.2ndfolio.net/qr/', '85.26.241.222', 1313318985, 'Opera/9.80 (Windows NT 6.1; U; ru) Presto/2.9.168 Version/11.50'),
(429, 1, 'http://www.google.co.uk/search?hl=en&source=hp&biw=1024&bih=447&q=linux+qr+reader&oq=linux+qr&aq=2&aqi=g8&aql;=&gs_sm=e&', 'http://www.2ndfolio.net/qr/', '87.194.105.232', 1313341184, 'Mozilla/5.0 (X11; Linux i686; rv:5.0) Gecko/20100101 Firefox/5.0'),
(430, 1, 'http://www.google.com/search?q=qr+code+reader+for+pc+adobe+air&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&cli', 'http://www.2ndfolio.net/qr/', '206.53.89.57', 1313352888, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:5.0) Gecko/20100101 Firefox/5.0');
INSERT INTO `exp_referrers` (`ref_id`, `site_id`, `ref_from`, `ref_to`, `ref_ip`, `ref_date`, `ref_agent`) VALUES
(431, 1, 'http://www.google.com/cse?cx=partner-pub-9300639326172081:d9bbzbtli15&ie=UTF-8&sa=Search&q=software+qr-reader+linux&hl=e', 'http://www.2ndfolio.net/qr/', '80.134.136.46', 1313361426, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.2.18) Gecko/20110628 Ubuntu/10.04 (lucid) Firefox/3'),
(432, 1, 'http://www.google.com/search?hl=en&newwindow=1&safe=active&client=firefox-a&rls=org.mozilla:en-US:official&biw=1280&bih=', 'http://www.2ndfolio.net/qr/', '219.237.205.155', 1313377329, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3');

-- --------------------------------------------------------

--
-- Table structure for table `exp_relationships`
--

CREATE TABLE `exp_relationships` (
  `rel_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `rel_parent_id` int(10) NOT NULL DEFAULT '0',
  `rel_child_id` int(10) NOT NULL DEFAULT '0',
  `rel_type` varchar(12) NOT NULL,
  `rel_data` longtext NOT NULL,
  `reverse_rel_data` longtext NOT NULL,
  PRIMARY KEY (`rel_id`),
  KEY `rel_parent_id` (`rel_parent_id`),
  KEY `rel_child_id` (`rel_child_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_reset_password`
--

CREATE TABLE `exp_reset_password` (
  `reset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `resetcode` varchar(12) NOT NULL,
  `date` int(10) NOT NULL,
  PRIMARY KEY (`reset_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_reset_password`
--

INSERT INTO `exp_reset_password` (`reset_id`, `member_id`, `resetcode`, `date`) VALUES
(1, 2, 'mppMLbWL', 1316085572);

-- --------------------------------------------------------

--
-- Table structure for table `exp_revision_tracker`
--

CREATE TABLE `exp_revision_tracker` (
  `tracker_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `item_table` varchar(20) NOT NULL,
  `item_field` varchar(20) NOT NULL,
  `item_date` int(10) NOT NULL,
  `item_author_id` int(10) unsigned NOT NULL,
  `item_data` longtext NOT NULL,
  PRIMARY KEY (`tracker_id`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_search`
--

CREATE TABLE `exp_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `search_date` int(10) NOT NULL,
  `keywords` varchar(60) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL,
  `total_results` int(6) NOT NULL,
  `per_page` smallint(3) unsigned NOT NULL,
  `query` longtext,
  `custom_fields` longtext,
  `result_page` varchar(70) NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_search`
--

INSERT INTO `exp_search` (`search_id`, `site_id`, `search_date`, `keywords`, `member_id`, `ip_address`, `total_results`, `per_page`, `query`, `custom_fields`, `result_page`) VALUES
('39a7a2a6d551d3e58908b2655f766a1d', 1, 1313489477, 'stage', 4, '127.0.0.1', 8, 50, 's:1448:\\"SELECT DISTINCT(t.entry_id), t.entry_id, t.channel_id, t.forum_topic_id, t.author_id, t.ip_address, t.title, t.url_title, t.status, t.dst_enabled, t.view_count_one, t.view_count_two, t.view_count_three, t.view_count_four, t.allow_comments, t.comment_expiration_date, t.sticky, t.entry_date, t.year, t.month, t.day, t.entry_date, t.edit_date, t.expiration_date, t.recent_comment_date, t.comment_total, t.site_id as entry_site_id,\n						w.channel_title, w.channel_name, w.search_results_url, w.search_excerpt, w.channel_url, w.comment_url, w.comment_moderate, w.channel_html_formatting, w.channel_allow_img_urls, w.channel_auto_link_urls, w.comment_system_enabled, \n						m.username, m.email, m.url, m.screen_name, m.location, m.occupation, m.interests, m.aol_im, m.yahoo_im, m.msn_im, m.icq, m.signature, m.sig_img_filename, m.sig_img_width, m.sig_img_height, m.avatar_filename, m.avatar_width, m.avatar_height, m.photo_filename, m.photo_width, m.photo_height, m.group_id, m.member_id, m.bday_d, m.bday_m, m.bday_y, m.bio,\n						md.*,\n						wd.*\n				FROM MDBMPREFIXchannel_titles		AS t\n				LEFT JOIN MDBMPREFIXchannels 		AS w  ON t.channel_id = w.channel_id \n				LEFT JOIN MDBMPREFIXchannel_data	AS wd ON t.entry_id = wd.entry_id \n				LEFT JOIN MDBMPREFIXmembers		AS m  ON m.member_id = t.author_id \n				LEFT JOIN MDBMPREFIXmember_data	AS md ON md.member_id = m.member_id \n				WHERE t.entry_id IN (32,43,44,45,46,47,48,49)  ORDER BY entry_date  desc\\";', 'a:8:{s:11:\\"quote-intro\\";a:2:{i:0;s:2:\\"10\\";i:1;s:1:\\"y\\";}s:10:\\"quote-body\\";a:2:{i:0;s:2:\\"11\\";i:1;s:1:\\"y\\";}s:11:\\"quote-media\\";a:2:{i:0;s:2:\\"12\\";i:1;s:1:\\"y\\";}s:8:\\"quote-qr\\";a:2:{i:0;s:2:\\"13\\";i:1;s:1:\\"n\\";}s:10:\\"task-intro\\";a:2:{i:0;s:2:\\"14\\";i:1;s:1:\\"y\\";}s:9:\\"task-body\\";a:2:{i:0;s:2:\\"15\\";i:1;s:1:\\"y\\";}s:10:\\"task-media\\";a:2:{i:0;s:2:\\"16\\";i:1;s:1:\\"y\\";}s:7:\\"task-qr\\";a:2:{i:0;s:2:\\"17\\";i:1;s:1:\\"n\\";}}', 'qr/search');

-- --------------------------------------------------------

--
-- Table structure for table `exp_search_log`
--

CREATE TABLE `exp_search_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `search_date` int(10) NOT NULL,
  `search_type` varchar(32) NOT NULL,
  `search_terms` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=98 ;

--
-- Dumping data for table `exp_search_log`
--

INSERT INTO `exp_search_log` (`id`, `site_id`, `member_id`, `screen_name`, `ip_address`, `search_date`, `search_type`, `search_terms`) VALUES
(1, 1, 1, 'Super Admin', '86.173.132.160', 1283851097, 'site', 'romeo'),
(2, 1, 1, 'Super Admin', '86.173.132.160', 1283851342, 'site', 'shadow'),
(3, 1, 1, 'Super Admin', '86.173.132.160', 1283851374, 'site', 'stage'),
(4, 1, 1, 'Super Admin', '86.173.132.160', 1283851390, 'site', 'stage'),
(5, 1, 1, 'Super Admin', '86.173.132.160', 1283851580, 'site', 'stage'),
(6, 1, 1, 'Super Admin', '86.173.132.160', 1283851592, 'site', 'stage'),
(7, 1, 0, '', '193.62.51.5', 1283855698, 'site', 'love'),
(8, 1, 1, 'Super Admin', '86.173.132.160', 1283855703, 'site', 'love'),
(9, 1, 1, 'Super Admin', '86.173.132.160', 1283856253, 'site', 'love'),
(10, 1, 1, 'Super Admin', '86.173.132.160', 1283856332, 'site', 'love'),
(11, 1, 1, 'Super Admin', '86.173.132.160', 1283856358, 'site', 'love'),
(12, 1, 1, 'Super Admin', '86.173.132.160', 1283856368, 'site', 'love'),
(13, 1, 1, 'Super Admin', '86.173.132.160', 1283856395, 'site', 'love'),
(14, 1, 0, '', '193.62.51.5', 1283860332, 'site', 'love'),
(15, 1, 1, 'Super Admin', '86.173.132.160', 1283862231, 'site', 'love'),
(16, 1, 1, 'Super Admin', '86.173.132.160', 1283862364, 'site', 'love'),
(17, 1, 0, '', '82.36.108.7', 1284026883, 'site', 'love'),
(18, 1, 0, '', '82.36.108.7', 1284026965, 'site', 'juliet'),
(19, 1, 0, '', '91.194.220.7', 1284378099, 'site', 'macbeth'),
(20, 1, 0, '', '91.194.220.7', 1284378115, 'site', 'romeo'),
(21, 1, 0, '', '91.194.220.7', 1284378758, 'site', 'macbeth'),
(22, 1, 0, '', '91.194.220.7', 1284378779, 'site', 'love'),
(23, 1, 0, '', '193.62.51.5', 1284378784, 'site', 'love'),
(24, 1, 0, '', '91.194.220.7', 1284378810, 'site', 'scenario'),
(25, 1, 0, '', '193.62.51.5', 1284378812, 'site', 'noun'),
(26, 1, 0, '', '193.62.51.5', 1284378846, 'site', 'insult'),
(27, 1, 0, '', '91.194.220.7', 1284378848, 'site', 'insult'),
(28, 1, 0, '', '91.194.220.7', 1284378877, 'site', 'bloody'),
(29, 1, 0, '', '193.62.51.5', 1284378954, 'site', 'noun'),
(30, 1, 0, '', '86.173.132.165', 1284567991, 'site', 'titania'),
(31, 1, 0, '', '86.173.132.165', 1284630100, 'site', 'keywords'),
(32, 1, 0, '', '86.173.132.165', 1284630213, 'site', 'keywords'),
(33, 1, 0, '', '86.173.132.165', 1284630416, 'site', 'stage'),
(34, 1, 0, '', '86.173.132.165', 1284630446, 'site', 'stage'),
(35, 1, 0, '', '86.173.132.165', 1284630484, 'site', 'keywords'),
(36, 1, 0, '', '86.173.132.165', 1284630497, 'site', 'love'),
(37, 1, 0, '', '86.173.132.165', 1284630520, 'site', 'death'),
(38, 1, 0, '', '86.173.132.165', 1284630564, 'site', 'stage'),
(39, 1, 0, '', '86.173.132.165', 1284630637, 'site', 'keywords'),
(40, 1, 0, '', '86.173.132.165', 1284630643, 'site', 'stage'),
(41, 1, 0, '', '86.173.132.165', 1284630648, 'site', 'theatre'),
(42, 1, 0, '', '86.173.132.165', 1284630656, 'site', 'stage'),
(43, 1, 0, '', '86.173.132.165', 1284630669, 'site', 'love'),
(44, 1, 0, '', '91.194.220.7', 1285598125, 'site', 'romeo'),
(45, 1, 0, '', '91.194.220.7', 1285598183, 'site', 'love'),
(46, 1, 0, '', '212.44.14.147', 1285602906, 'site', 'love'),
(47, 1, 0, '', '86.178.103.4', 1289903762, 'site', 'love'),
(48, 1, 0, '', '86.178.103.4', 1289904095, 'site', 'newspaper'),
(49, 1, 0, '', '86.178.103.4', 1289904255, 'site', 'meet again'),
(50, 1, 0, '', '193.62.51.5', 1290177011, 'site', 'trailer'),
(51, 1, 0, '', '193.62.51.5', 1290177077, 'site', 'False Face'),
(52, 1, 0, '', '193.62.51.5', 1290177115, 'site', ' man  death'),
(53, 1, 0, '', '193.62.51.5', 1290177133, 'site', 'o true'),
(54, 1, 0, '', '193.62.51.5', 1290177162, 'site', ' love  tender thing'),
(55, 1, 0, '', '90.196.111.69', 1290439769, 'site', 'newspaper'),
(56, 1, 0, '', '90.196.111.69', 1290439771, 'site', 'newspaper'),
(57, 1, 0, '', '193.62.51.5', 1290513785, 'site', 'culminate'),
(58, 1, 0, '', '193.62.51.5', 1290513791, 'site', 'culminates'),
(59, 1, 0, '', '193.62.51.5', 1290513801, 'site', 'scenario'),
(60, 1, 0, '', '109.156.254.134', 1291118261, 'site', 'love'),
(61, 1, 0, '', '109.156.254.134', 1291118327, 'site', 'death'),
(62, 1, 0, '', '62.171.194.7', 1291304192, 'site', 'love'),
(63, 1, 0, '', '193.62.51.5', 1291999222, 'site', 'Love'),
(64, 1, 0, '', '212.44.14.147', 1296819478, 'site', 'love'),
(65, 1, 0, '', '212.44.14.147', 1296822408, 'site', 'true love'),
(66, 1, 0, '', '212.44.14.147', 1296826482, 'site', 'love'),
(67, 1, 0, '', '212.44.14.147', 1296827640, 'site', 'love'),
(68, 1, 0, '', '212.44.14.147', 1298890783, 'site', 'love'),
(69, 1, 0, '', '212.44.14.147', 1298891772, 'site', 'love'),
(70, 1, 0, '', '193.62.51.5', 1300107886, 'site', '&#39;s   name'),
(71, 1, 0, '', '193.62.51.5', 1300107891, 'site', 'name'),
(72, 1, 0, '', '193.62.51.5', 1300108047, 'site', 'compliment'),
(73, 1, 0, '', '193.62.51.5', 1300108203, 'site', 'opposite'),
(74, 1, 0, '', '193.62.51.5', 1300108571, 'site', 'provoked'),
(75, 1, 0, '', '193.62.51.5', 1300108998, 'site', 'opposite'),
(76, 1, 0, '', '193.62.51.5', 1300109053, 'site', 'compliment'),
(77, 1, 0, '', '83.249.129.55', 1302866586, 'site', 'databas'),
(78, 1, 0, '', '213.120.146.160', 1304442802, 'site', 'romeo'),
(79, 1, 0, '', '213.120.146.160', 1304442816, 'site', 'rose'),
(80, 1, 0, '', '193.62.51.5', 1309171155, 'site', 'name'),
(81, 1, 0, '', '72.17.212.154', 1309539726, 'site', 'keywords ... phone drops site'),
(82, 1, 1, 'Super Admin', '127.0.0.1', 1313483580, 'site', 'hello'),
(83, 1, 1, 'Super Admin', '127.0.0.1', 1313483588, 'site', 'macbeth'),
(84, 1, 1, 'Super Admin', '127.0.0.1', 1313483592, 'site', 'macbeth'),
(85, 1, 1, 'Super Admin', '127.0.0.1', 1313483878, 'site', 'wef'),
(86, 1, 1, 'Super Admin', '127.0.0.1', 1313483890, 'site', 'wef'),
(87, 1, 1, 'Super Admin', '127.0.0.1', 1313483892, 'site', 'wef'),
(88, 1, 1, 'Super Admin', '127.0.0.1', 1313483896, 'site', 'wef'),
(89, 1, 1, 'Super Admin', '127.0.0.1', 1313484019, 'site', 'wef'),
(90, 1, 1, 'Super Admin', '127.0.0.1', 1313484422, 'site', 'wef'),
(91, 1, 1, 'Super Admin', '127.0.0.1', 1313484453, 'site', 'wef'),
(92, 1, 1, 'Super Admin', '127.0.0.1', 1313484455, 'site', 'wef'),
(93, 1, 1, 'Super Admin', '127.0.0.1', 1313484487, 'site', 'wef'),
(94, 1, 1, 'Super Admin', '127.0.0.1', 1313484516, 'site', 'wef'),
(95, 1, 1, 'Super Admin', '127.0.0.1', 1313484568, 'site', 'wef'),
(96, 1, 1, 'Super Admin', '127.0.0.1', 1313485503, 'site', 'wef'),
(97, 1, 4, 'Super Admin 2', '127.0.0.1', 1313489477, 'site', 'stage');

-- --------------------------------------------------------

--
-- Table structure for table `exp_security_hashes`
--

CREATE TABLE `exp_security_hashes` (
  `hash_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `hash` varchar(40) NOT NULL,
  PRIMARY KEY (`hash_id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4584 ;

--
-- Dumping data for table `exp_security_hashes`
--

INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES
(4583, 1329297060, '127.0.0.1', 'aabc291aea164cd8e60e1e06055e462ab36ca302'),
(4582, 1329297059, '127.0.0.1', '2645802dada6ae83fac409c06ebce400b0d86511'),
(4581, 1329297043, '127.0.0.1', 'cf60d155431bb6d236f867cf808b6f95b0d2e749'),
(4580, 1329297043, '127.0.0.1', 'aa1532a6031488922edab45a10d715ba9f450a75'),
(4579, 1329297043, '127.0.0.1', 'db29bde34e3c3007569469632c09453e6da76f22'),
(4578, 1329297043, '127.0.0.1', '4c41395175c5a6613a4f80e7a4504ccc201d151a'),
(4577, 1329297042, '127.0.0.1', '4ef1538473de1416f882349ee624e5d9f984bd44'),
(4576, 1329297042, '127.0.0.1', '8e7ab49006635061a5053674597713d5ca021482'),
(4575, 1329296993, '127.0.0.1', '08e50a1ea6f193ad7e2ef149bcac9739f8af9bba'),
(4574, 1329296991, '127.0.0.1', 'e710b9c508300a795b2186a48590ac65570c3ae2'),
(4573, 1329296982, '127.0.0.1', 'b539d80a751d968f10e5feccef5e57de90fe6b69'),
(4572, 1329296982, '127.0.0.1', '49ea24df9f83c8b3100a08623226a4fc3996827e'),
(4571, 1329296982, '127.0.0.1', '08121835583e0729bec7c18d15121fd7460c96fc'),
(4570, 1329296982, '127.0.0.1', '8ca317d9c9735a3b4ffbd76e99fd61ffe8359788'),
(4569, 1329296966, '127.0.0.1', '198b8b3fe0ff9f8508bff66854e7ad2795b2d502'),
(4568, 1329296966, '127.0.0.1', '116492ae4a72c0773391e8cae2bdfb0e270ec11d'),
(4567, 1329296965, '127.0.0.1', 'f3bed2531353e654e9cd0f651138de71f43c2b6c'),
(4566, 1329296958, '127.0.0.1', 'ddef89dba50c9614afb917cdf2d6c198634a9278'),
(4565, 1329296957, '127.0.0.1', '9a8e3bfab824b67b67acd88b2997c66a067aaece'),
(4564, 1329296955, '127.0.0.1', '4e354346e68aae8a25fd22e1a2dafe548f214d6f'),
(4563, 1329296945, '127.0.0.1', '13e6298a04aae14ecb24c0e1602a6f710b7ae718'),
(4562, 1329296938, '127.0.0.1', 'fcd20e6156877dc98914382f0002c150a9131fe0'),
(4561, 1329296928, '127.0.0.1', '177311d37ed80afdd6681b5e61b18a80db8dfb98'),
(4560, 1329296925, '127.0.0.1', 'debe38d6b3ff4bcae5ae4945d08b93277ef20d36'),
(4559, 1329296897, '127.0.0.1', '11fc5becbda1bf08bdf47ba2ece7b282131bd914'),
(4558, 1329296896, '127.0.0.1', '67f396c22f52596cff2ec82c1db52f9a3f6ee53f'),
(4557, 1329296887, '127.0.0.1', 'a8ffcf340043d67e6475284f481a01e2bbcb6a7a'),
(4526, 1329296070, '127.0.0.1', '8e603011535df47892cb2a3c512a6e7894e8ac3d'),
(4527, 1329296101, '127.0.0.1', 'b7fbe57ece19c9749b087c338a45e5a3cc7e3950'),
(4528, 1329296104, '127.0.0.1', '5103343759c3e06c14871c14000c70b7e3d3dda7'),
(4529, 1329296106, '127.0.0.1', 'a7a629b00251ac12d50b3c0a213e75a9e213fe89'),
(4530, 1329296456, '127.0.0.1', '94e612ea4fecf20b8197257139634308f07a9741'),
(4531, 1329296508, '127.0.0.1', '4a68e05e5966f833f082dd9afbe6a3a84127efab'),
(4532, 1329296514, '127.0.0.1', 'f08b84524e9f521d6bf166fcdf7b1b0e27390597'),
(4533, 1329296575, '127.0.0.1', 'e9a74745425ce2cc757f1894b8660cb622c6417d'),
(4534, 1329296576, '127.0.0.1', '143e27dce2e88f8683ef94b7012a450d04e0ff44'),
(4535, 1329296577, '127.0.0.1', '04988ca34c68d33d925ba68ced36d3dda0bef40d'),
(4536, 1329296580, '127.0.0.1', '0c9e7cd931e1043d3a12da5f9ab0600c572ba275'),
(4537, 1329296594, '127.0.0.1', '4b43b22a901521bc5858867a8f7432d9da4e17f5'),
(4538, 1329296603, '127.0.0.1', 'f44c055c81fc4ee1be5e071f11c9e59566e4c988'),
(4539, 1329296606, '127.0.0.1', '7fede1f2d5326b7e1e4517df8fa9220edb4545c7'),
(4540, 1329296677, '127.0.0.1', '5b50c6f053d340bd649817c2f779d5ae5e57bc25'),
(4541, 1329296682, '127.0.0.1', 'd5f88e6019ca9da52176bdd8afcd5ca37117efcd'),
(4542, 1329296685, '127.0.0.1', '60d99ef49ec2094f5541fd065eff62650317157d'),
(4543, 1329296697, '127.0.0.1', 'baff17c809fb6ad0ba21de84f97686d268abe93f'),
(4544, 1329296699, '127.0.0.1', 'c3aceb0f4f1d4c6accc943428936b7b328a3016f'),
(4545, 1329296699, '127.0.0.1', '15c8c77d34c4077ca100a4dd7b49c0688b7951f3'),
(4546, 1329296704, '127.0.0.1', '3af366747d64861bc9290c94961d00d3c283ae22'),
(4547, 1329296814, '127.0.0.1', '23a5f4ee995e9b06639af92acb4dedf33f774a9e'),
(4548, 1329296817, '127.0.0.1', 'bf7d5f90a8c2197509a3abf6991bd7b0b79b5bd7'),
(4549, 1329296841, '127.0.0.1', '60fa796c8144e9acbefda3442bd9714acc3968bc'),
(4550, 1329296843, '127.0.0.1', '8f831ae940e40b1c5ed972e35b999e30d3037a16'),
(4551, 1329296843, '127.0.0.1', 'f968e6ab8081a56993804d96d1f190eb39382780'),
(4552, 1329296859, '127.0.0.1', '0801b0d9ac50450ae12050e43ca1a0d83130088f'),
(4553, 1329296861, '127.0.0.1', 'e712182339fe76d3eb8076add197ad666cc43a96'),
(4555, 1329296882, '127.0.0.1', '7b52c59b28985552a7582e10c702847c585d4be4');

-- --------------------------------------------------------

--
-- Table structure for table `exp_sessions`
--

CREATE TABLE `exp_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `admin_sess` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) DEFAULT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`),
  KEY `member_id` (`member_id`),
  KEY `site_id` (`site_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_sessions`
--

INSERT INTO `exp_sessions` (`session_id`, `site_id`, `member_id`, `admin_sess`, `ip_address`, `user_agent`, `last_activity`) VALUES
('5ec1ea2265c480e564703fac4f525e5e6f494d96', 1, 4, 0, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.46 Safari/535.11', 1329296699),
('77e31318070d2216886127120a1f02a442626b8d', 1, 4, 0, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.46 Safari/535.11', 1329296843),
('3cd1be64bfa53e7a83bff725a01bc46d9ad315c7', 1, 4, 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.46 Safari/535.11', 1329297075);

-- --------------------------------------------------------

--
-- Table structure for table `exp_sites`
--

CREATE TABLE `exp_sites` (
  `site_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `site_label` varchar(100) NOT NULL DEFAULT '',
  `site_name` varchar(50) NOT NULL DEFAULT '',
  `site_description` text,
  `site_system_preferences` mediumtext NOT NULL,
  `site_mailinglist_preferences` mediumtext NOT NULL,
  `site_member_preferences` mediumtext NOT NULL,
  `site_template_preferences` mediumtext NOT NULL,
  `site_channel_preferences` text NOT NULL,
  `site_bootstrap_checksums` text NOT NULL,
  PRIMARY KEY (`site_id`),
  KEY `site_name` (`site_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_sites`
--

INSERT INTO `exp_sites` (`site_id`, `site_label`, `site_name`, `site_description`, `site_system_preferences`, `site_mailinglist_preferences`, `site_member_preferences`, `site_template_preferences`, `site_channel_preferences`, `site_bootstrap_checksums`) VALUES
(1, '2nd Folio', 'default_site', '', 'YTo5ODp7czoxNToiZW5jcnlwdGlvbl90eXBlIjtzOjQ6InNoYTEiO3M6MTA6InNpdGVfaW5kZXgiO3M6MDoiIjtzOjk6InNpdGVfbmFtZSI7czo5OiIybmQgRm9saW8iO3M6ODoic2l0ZV91cmwiO3M6MjI6Imh0dHA6Ly8ybmRmb2xpby5sb2NhbC8iO3M6MTY6InRoZW1lX2ZvbGRlcl91cmwiO3M6Mjk6Imh0dHA6Ly8ybmRmb2xpby5sb2NhbC90aGVtZXMvIjtzOjE1OiJ3ZWJtYXN0ZXJfZW1haWwiO3M6Mjc6ImphbWVzQHN1cGVyY29vbGRlc2lnbi5jby51ayI7czoxNDoid2VibWFzdGVyX25hbWUiO3M6MDoiIjtzOjE5OiJ3ZWJsb2dfbm9tZW5jbGF0dXJlIjtzOjY6IndlYmxvZyI7czoxMDoibWF4X2NhY2hlcyI7czozOiIxNTAiO3M6MTE6ImNhcHRjaGFfdXJsIjtzOjM4OiJodHRwOi8vMm5kZm9saW8ubG9jYWwvaW1hZ2VzL2NhcHRjaGFzLyI7czoxMjoiY2FwdGNoYV9wYXRoIjtzOjQ0OiIvVXNlcnMvaW1hYzEvU2l0ZXMvMm5kZm9saW8vaW1hZ2VzL2NhcHRjaGFzLyI7czoxMjoiY2FwdGNoYV9mb250IjtzOjE6InkiO3M6MTI6ImNhcHRjaGFfcmFuZCI7czoxOiJ5IjtzOjIzOiJjYXB0Y2hhX3JlcXVpcmVfbWVtYmVycyI7czoxOiJuIjtzOjE3OiJlbmFibGVfZGJfY2FjaGluZyI7czoxOiJ5IjtzOjE4OiJlbmFibGVfc3FsX2NhY2hpbmciO3M6MToibiI7czoxODoiZm9yY2VfcXVlcnlfc3RyaW5nIjtzOjE6Im4iO3M6MTg6InRlbXBsYXRlX2RlYnVnZ2luZyI7czoxOiJuIjtzOjE1OiJpbmNsdWRlX3NlY29uZHMiO3M6MToibiI7czoxMzoiY29va2llX2RvbWFpbiI7czowOiIiO3M6MTE6ImNvb2tpZV9wYXRoIjtzOjA6IiI7czoxNzoidXNlcl9zZXNzaW9uX3R5cGUiO3M6MToiYyI7czoxODoiYWRtaW5fc2Vzc2lvbl90eXBlIjtzOjI6ImNzIjtzOjIxOiJhbGxvd191c2VybmFtZV9jaGFuZ2UiO3M6MToieSI7czoxODoiYWxsb3dfbXVsdGlfbG9naW5zIjtzOjE6InkiO3M6MTY6InBhc3N3b3JkX2xvY2tvdXQiO3M6MToieSI7czoyNToicGFzc3dvcmRfbG9ja291dF9pbnRlcnZhbCI7czoxOiIxIjtzOjIwOiJyZXF1aXJlX2lwX2Zvcl9sb2dpbiI7czoxOiJ5IjtzOjIyOiJyZXF1aXJlX2lwX2Zvcl9wb3N0aW5nIjtzOjE6InkiO3M6MTg6ImFsbG93X211bHRpX2VtYWlscyI7czoxOiJuIjtzOjI0OiJyZXF1aXJlX3NlY3VyZV9wYXNzd29yZHMiO3M6MToibiI7czoxOToiYWxsb3dfZGljdGlvbmFyeV9wdyI7czoxOiJ5IjtzOjIzOiJuYW1lX29mX2RpY3Rpb25hcnlfZmlsZSI7czowOiIiO3M6MTc6Inhzc19jbGVhbl91cGxvYWRzIjtzOjE6InkiO3M6MTU6InJlZGlyZWN0X21ldGhvZCI7czo4OiJyZWRpcmVjdCI7czo5OiJkZWZ0X2xhbmciO3M6NzoiZW5nbGlzaCI7czo4OiJ4bWxfbGFuZyI7czoyOiJlbiI7czo3OiJjaGFyc2V0IjtzOjU6InV0Zi04IjtzOjEyOiJzZW5kX2hlYWRlcnMiO3M6MToieSI7czoxMToiZ3ppcF9vdXRwdXQiO3M6MToibiI7czoxMzoibG9nX3JlZmVycmVycyI7czoxOiJ5IjtzOjEzOiJtYXhfcmVmZXJyZXJzIjtzOjM6IjUwMCI7czoxMToidGltZV9mb3JtYXQiO3M6MjoidXMiO3M6MTU6InNlcnZlcl90aW1lem9uZSI7czozOiJVVEMiO3M6MTM6InNlcnZlcl9vZmZzZXQiO3M6MDoiIjtzOjE2OiJkYXlsaWdodF9zYXZpbmdzIjtzOjE6Im4iO3M6MjE6ImRlZmF1bHRfc2l0ZV90aW1lem9uZSI7czowOiIiO3M6MTY6ImRlZmF1bHRfc2l0ZV9kc3QiO3M6MDoiIjtzOjE1OiJob25vcl9lbnRyeV9kc3QiO3M6MToieSI7czoxMzoibWFpbF9wcm90b2NvbCI7czo0OiJtYWlsIjtzOjExOiJzbXRwX3NlcnZlciI7czowOiIiO3M6MTM6InNtdHBfdXNlcm5hbWUiO3M6MDoiIjtzOjEzOiJzbXRwX3Bhc3N3b3JkIjtzOjA6IiI7czoxMToiZW1haWxfZGVidWciO3M6MToibiI7czoxMzoiZW1haWxfY2hhcnNldCI7czo1OiJ1dGYtOCI7czoxNToiZW1haWxfYmF0Y2htb2RlIjtzOjE6Im4iO3M6MTY6ImVtYWlsX2JhdGNoX3NpemUiO3M6MDoiIjtzOjExOiJtYWlsX2Zvcm1hdCI7czo1OiJwbGFpbiI7czo5OiJ3b3JkX3dyYXAiO3M6MToieSI7czoyMjoiZW1haWxfY29uc29sZV90aW1lbG9jayI7czoxOiI1IjtzOjIyOiJsb2dfZW1haWxfY29uc29sZV9tc2dzIjtzOjE6InkiO3M6ODoiY3BfdGhlbWUiO3M6NzoiZGVmYXVsdCI7czoyMToiZW1haWxfbW9kdWxlX2NhcHRjaGFzIjtzOjE6Im4iO3M6MTY6ImxvZ19zZWFyY2hfdGVybXMiO3M6MToieSI7czoxMjoic2VjdXJlX2Zvcm1zIjtzOjE6InkiO3M6MTk6ImRlbnlfZHVwbGljYXRlX2RhdGEiO3M6MToieSI7czoyNDoicmVkaXJlY3Rfc3VibWl0dGVkX2xpbmtzIjtzOjE6Im4iO3M6MTY6ImVuYWJsZV9jZW5zb3JpbmciO3M6MToibiI7czoxNDoiY2Vuc29yZWRfd29yZHMiO3M6MDoiIjtzOjE4OiJjZW5zb3JfcmVwbGFjZW1lbnQiO3M6MDoiIjtzOjEwOiJiYW5uZWRfaXBzIjtzOjA6IiI7czoxMzoiYmFubmVkX2VtYWlscyI7czowOiIiO3M6MTY6ImJhbm5lZF91c2VybmFtZXMiO3M6MDoiIjtzOjE5OiJiYW5uZWRfc2NyZWVuX25hbWVzIjtzOjA6IiI7czoxMDoiYmFuX2FjdGlvbiI7czo4OiJyZXN0cmljdCI7czoxMToiYmFuX21lc3NhZ2UiO3M6MzQ6IlRoaXMgc2l0ZSBpcyBjdXJyZW50bHkgdW5hdmFpbGFibGUiO3M6MTU6ImJhbl9kZXN0aW5hdGlvbiI7czoyMToiaHR0cDovL3d3dy55YWhvby5jb20vIjtzOjE2OiJlbmFibGVfZW1vdGljb25zIjtzOjE6InkiO3M6MTM6ImVtb3RpY29uX3BhdGgiO3M6Mzc6Imh0dHA6Ly8ybmRmb2xpby5sb2NhbC9pbWFnZXMvc21pbGV5cy8iO3M6MTk6InJlY291bnRfYmF0Y2hfdG90YWwiO3M6NDoiMTAwMCI7czoxMzoicmVtYXBfcG1fdXJscyI7czoxOiJuIjtzOjEzOiJyZW1hcF9wbV9kZXN0IjtzOjA6IiI7czoxNzoibmV3X3ZlcnNpb25fY2hlY2siO3M6MToieSI7czoyMDoicHVibGlzaF90YWJfYmVoYXZpb3IiO3M6NToiaG92ZXIiO3M6MTg6InNpdGVzX3RhYl9iZWhhdmlvciI7czo1OiJob3ZlciI7czoxNzoiZW5hYmxlX3Rocm90dGxpbmciO3M6MToibiI7czoxNzoiYmFuaXNoX21hc2tlZF9pcHMiO3M6MToieSI7czoxNDoibWF4X3BhZ2VfbG9hZHMiO3M6MjoiMTAiO3M6MTM6InRpbWVfaW50ZXJ2YWwiO3M6MToiOCI7czoxMjoibG9ja291dF90aW1lIjtzOjI6IjMwIjtzOjE1OiJiYW5pc2htZW50X3R5cGUiO3M6NzoibWVzc2FnZSI7czoxNDoiYmFuaXNobWVudF91cmwiO3M6MDoiIjtzOjE4OiJiYW5pc2htZW50X21lc3NhZ2UiO3M6NTA6IllvdSBoYXZlIGV4Y2VlZGVkIHRoZSBhbGxvd2VkIHBhZ2UgbG9hZCBmcmVxdWVuY3kuIjtzOjE3OiJlbmFibGVfc2VhcmNoX2xvZyI7czoxOiJ5IjtzOjE5OiJtYXhfbG9nZ2VkX3NlYXJjaGVzIjtzOjM6IjUwMCI7czoxNzoidGhlbWVfZm9sZGVyX3BhdGgiO3M6MzU6Ii9Vc2Vycy9pbWFjMS9TaXRlcy8ybmRmb2xpby90aGVtZXMvIjtzOjEwOiJpc19zaXRlX29uIjtzOjE6InkiO3M6MTM6InNob3dfcHJvZmlsZXIiO3M6MToibiI7fQ==', 'YTozOntzOjE5OiJtYWlsaW5nbGlzdF9lbmFibGVkIjtzOjE6InkiO3M6MTg6Im1haWxpbmdsaXN0X25vdGlmeSI7czoxOiJuIjtzOjI1OiJtYWlsaW5nbGlzdF9ub3RpZnlfZW1haWxzIjtzOjA6IiI7fQ==', 'YTo0NDp7czoxMDoidW5fbWluX2xlbiI7czoxOiI0IjtzOjEwOiJwd19taW5fbGVuIjtzOjE6IjUiO3M6MjU6ImFsbG93X21lbWJlcl9yZWdpc3RyYXRpb24iO3M6MToieSI7czoyNToiYWxsb3dfbWVtYmVyX2xvY2FsaXphdGlvbiI7czoxOiJuIjtzOjE4OiJyZXFfbWJyX2FjdGl2YXRpb24iO3M6NToiZW1haWwiO3M6MjM6Im5ld19tZW1iZXJfbm90aWZpY2F0aW9uIjtzOjE6Im4iO3M6MjM6Im1icl9ub3RpZmljYXRpb25fZW1haWxzIjtzOjA6IiI7czoyNDoicmVxdWlyZV90ZXJtc19vZl9zZXJ2aWNlIjtzOjE6InkiO3M6MjI6InVzZV9tZW1iZXJzaGlwX2NhcHRjaGEiO3M6MToieSI7czoyMDoiZGVmYXVsdF9tZW1iZXJfZ3JvdXAiO3M6MToiNyI7czoxNToicHJvZmlsZV90cmlnZ2VyIjtzOjY6Im1lbWJlciI7czoxMjoibWVtYmVyX3RoZW1lIjtzOjg6IjJuZGZvbGlvIjtzOjE0OiJlbmFibGVfYXZhdGFycyI7czoxOiJuIjtzOjIwOiJhbGxvd19hdmF0YXJfdXBsb2FkcyI7czoxOiJuIjtzOjEwOiJhdmF0YXJfdXJsIjtzOjM3OiJodHRwOi8vMm5kZm9saW8ubG9jYWwvaW1hZ2VzL2F2YXRhcnMvIjtzOjExOiJhdmF0YXJfcGF0aCI7czo0MzoiL1VzZXJzL2ltYWMxL1NpdGVzLzJuZGZvbGlvL2ltYWdlcy9hdmF0YXJzLyI7czoxNjoiYXZhdGFyX21heF93aWR0aCI7czozOiIxMDAiO3M6MTc6ImF2YXRhcl9tYXhfaGVpZ2h0IjtzOjM6IjEwMCI7czoxMzoiYXZhdGFyX21heF9rYiI7czoyOiI1MCI7czoxMzoiZW5hYmxlX3Bob3RvcyI7czoxOiJuIjtzOjk6InBob3RvX3VybCI7czo0MzoiaHR0cDovLzJuZGZvbGlvLmxvY2FsL2ltYWdlcy9tZW1iZXJfcGhvdG9zLyI7czoxMDoicGhvdG9fcGF0aCI7czo0OToiL1VzZXJzL2ltYWMxL1NpdGVzLzJuZGZvbGlvL2ltYWdlcy9tZW1iZXJfcGhvdG9zLyI7czoxNToicGhvdG9fbWF4X3dpZHRoIjtzOjM6IjEwMCI7czoxNjoicGhvdG9fbWF4X2hlaWdodCI7czozOiIxMDAiO3M6MTI6InBob3RvX21heF9rYiI7czoyOiI1MCI7czoxNjoiYWxsb3dfc2lnbmF0dXJlcyI7czoxOiJuIjtzOjEzOiJzaWdfbWF4bGVuZ3RoIjtzOjM6IjUwMCI7czoyMToic2lnX2FsbG93X2ltZ19ob3RsaW5rIjtzOjE6Im4iO3M6MjA6InNpZ19hbGxvd19pbWdfdXBsb2FkIjtzOjE6Im4iO3M6MTE6InNpZ19pbWdfdXJsIjtzOjUxOiJodHRwOi8vMm5kZm9saW8ubG9jYWwvaW1hZ2VzL3NpZ25hdHVyZV9hdHRhY2htZW50cy8iO3M6MTI6InNpZ19pbWdfcGF0aCI7czo1NzoiL1VzZXJzL2ltYWMxL1NpdGVzLzJuZGZvbGlvL2ltYWdlcy9zaWduYXR1cmVfYXR0YWNobWVudHMvIjtzOjE3OiJzaWdfaW1nX21heF93aWR0aCI7czozOiI0ODAiO3M6MTg6InNpZ19pbWdfbWF4X2hlaWdodCI7czoyOiI4MCI7czoxNDoic2lnX2ltZ19tYXhfa2IiO3M6MjoiMzAiO3M6MTk6InBydl9tc2dfdXBsb2FkX3BhdGgiO3M6NTA6Ii9Vc2Vycy9pbWFjMS9TaXRlcy8ybmRmb2xpby9pbWFnZXMvcG1fYXR0YWNobWVudHMvIjtzOjIzOiJwcnZfbXNnX21heF9hdHRhY2htZW50cyI7czoxOiIzIjtzOjIyOiJwcnZfbXNnX2F0dGFjaF9tYXhzaXplIjtzOjM6IjI1MCI7czoyMDoicHJ2X21zZ19hdHRhY2hfdG90YWwiO3M6MzoiMTAwIjtzOjE5OiJwcnZfbXNnX2h0bWxfZm9ybWF0IjtzOjQ6InNhZmUiO3M6MTg6InBydl9tc2dfYXV0b19saW5rcyI7czoxOiJ5IjtzOjE3OiJwcnZfbXNnX21heF9jaGFycyI7czo0OiI2MDAwIjtzOjE5OiJtZW1iZXJsaXN0X29yZGVyX2J5IjtzOjExOiJ0b3RhbF9wb3N0cyI7czoyMToibWVtYmVybGlzdF9zb3J0X29yZGVyIjtzOjQ6ImRlc2MiO3M6MjA6Im1lbWJlcmxpc3Rfcm93X2xpbWl0IjtzOjI6IjIwIjt9', 'YTo2OntzOjExOiJzdHJpY3RfdXJscyI7czoxOiJ5IjtzOjg6InNpdGVfNDA0IjtzOjg6ImhvbWUvNDA0IjtzOjE5OiJzYXZlX3RtcGxfcmV2aXNpb25zIjtzOjE6Im4iO3M6MTg6Im1heF90bXBsX3JldmlzaW9ucyI7czoxOiI1IjtzOjE1OiJzYXZlX3RtcGxfZmlsZXMiO3M6MToieSI7czoxODoidG1wbF9maWxlX2Jhc2VwYXRoIjtzOjY1OiIvVXNlcnMvaW1hYzEvU2l0ZXMvMm5kZm9saW8vZGFzaGJvYXJkL2V4cHJlc3Npb25lbmdpbmUvdGVtcGxhdGVzLyI7fQ==', 'YTo5OntzOjIxOiJpbWFnZV9yZXNpemVfcHJvdG9jb2wiO3M6MzoiZ2QyIjtzOjE4OiJpbWFnZV9saWJyYXJ5X3BhdGgiO3M6MDoiIjtzOjE2OiJ0aHVtYm5haWxfcHJlZml4IjtzOjU6InRodW1iIjtzOjE0OiJ3b3JkX3NlcGFyYXRvciI7czo0OiJkYXNoIjtzOjE3OiJ1c2VfY2F0ZWdvcnlfbmFtZSI7czoxOiJuIjtzOjIyOiJyZXNlcnZlZF9jYXRlZ29yeV93b3JkIjtzOjg6ImNhdGVnb3J5IjtzOjIzOiJhdXRvX2NvbnZlcnRfaGlnaF9hc2NpaSI7czoxOiJuIjtzOjIyOiJuZXdfcG9zdHNfY2xlYXJfY2FjaGVzIjtzOjE6InkiO3M6MjM6ImF1dG9fYXNzaWduX2NhdF9wYXJlbnRzIjtzOjE6InkiO30=', 'YToyOntzOjc6ImVtYWlsZWQiO2E6MDp7fXM6Mzc6Ii9Vc2Vycy9pbWFjMS9TaXRlcy8ybmRmb2xpby9pbmRleC5waHAiO3M6MzI6ImJhMmNkOWFmMGFmNWQyODM2MDg4NjMxZGU5ZDhhZDBmIjt9');

-- --------------------------------------------------------

--
-- Table structure for table `exp_snippets`
--

CREATE TABLE `exp_snippets` (
  `snippet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) NOT NULL,
  `snippet_name` varchar(75) NOT NULL,
  `snippet_contents` text,
  PRIMARY KEY (`snippet_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_specialty_templates`
--

CREATE TABLE `exp_specialty_templates` (
  `template_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `enable_template` char(1) NOT NULL DEFAULT 'y',
  `template_name` varchar(50) NOT NULL,
  `data_title` varchar(80) NOT NULL,
  `template_data` mediumtext NOT NULL,
  PRIMARY KEY (`template_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `exp_specialty_templates`
--

INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_data`) VALUES
(1, 1, 'y', 'offline_template', '', '<html>\n<head>\n\n<title>System Offline</title>\n\n<style type="text/css">\n\nbody { \nbackground-color:	#ffffff; \nmargin:				50px; \nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:              #330099;\nbackground-color:   transparent;\n}\n  \na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:    underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#999999 1px solid;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n</style>\n\n</head>\n\n<body>\n\n<div id="content">\n\n<h1>System Offline</h1>\n\n<p>This site is currently offline</p>\n\n</div>\n\n</body>\n\n</html>'),
(2, 1, 'y', 'message_template', '', '<!DOCTYPE HTML">\n<html>\n	<head>\n		<title>{title} | 2nd Folio</title>\n		\n		{embed="includes/head"}\n		\n		{meta_refresh}\n		\n	</head>\n	<body>\n		{embed="includes/header"}\n		<div class="container">\n			<div class="page-top"></div>\n			<div class="page-mid">			\n				<div class="span-24">\n					<div class="span-18">\n						<h1 class="stencil">{heading}</h1>\n						<p class="intro">{content}</p>\n						<p>{link}</p>\n\n					</div>\n				</div>\n				<div class="clear"></div>\n			</div>\n			<div class="page-bottom"></div>\n		</div>\n		{embed="includes/footer"}\n	</body>\n</html>\n'),
(3, 1, 'y', 'admin_notify_reg', 'Notification of new member registration', 'The following person has submitted a new member registration: {name}\n\nAt: {site_name}\n\nYour control panel URL: {control_panel_url}'),
(4, 1, 'y', 'admin_notify_entry', 'A new weblog entry has been posted', 'A new entry has been posted in the following weblog:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nPosted by: {name}\nEmail: {email}\n\nTo read the entry please visit: \n{entry_url}\n'),
(5, 1, 'y', 'admin_notify_mailinglist', 'Someone has subscribed to your mailing list', 'A new mailing list subscription has been accepted.\n\nEmail Address: {email}\nMailing List: {mailing_list}'),
(6, 1, 'y', 'admin_notify_comment', 'You have just received a comment', 'You have just received a comment for the following weblog:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nLocated at: \n{comment_url}\n\nPosted by: {name}\nEmail: {email}\nURL: {url}\nLocation: {location}\n\n{comment}'),
(9, 1, 'y', 'mbr_activation_instructions', 'Enclosed is your activation code', 'Thank you for your new member registration.\n\nTo activate your new account, please visit the following URL:\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}\n\n{site_url}'),
(10, 1, 'y', 'forgot_password_instructions', 'Login information', '{name},\n\nTo reset your password, please go to the following page:\n\n{reset_url}\n\nYour password will be automatically reset, and a new password will be emailed to you.\n\nIf you do not wish to reset your password, ignore this message. It will expire in 24 hours.\n\n{site_name}\n{site_url}'),
(11, 1, 'y', 'reset_password_notification', 'New Login Information', '{name},\n\nHere is your new login information:\n\nUsername: {username}\nPassword: {password}\n\n{site_name}\n{site_url}'),
(12, 1, 'y', 'validated_member_notify', 'Your membership account has been activated', '{name},\n\nYour membership account has been activated and is ready for use.\n\nThank You!\n\n{site_name}\n{site_url}'),
(13, 1, 'y', 'decline_member_validation', 'Your membership account has been declined', '{name},\n\nWe''re sorry but our staff has decided not to validate your membership.\n\n{site_name}\n{site_url}'),
(14, 1, 'y', 'mailinglist_activation_instructions', 'Email Confirmation', 'Thank you for joining the "{mailing_list}" mailing list!\n\nPlease click the link below to confirm your email.\n\nIf you do not want to be added to our list, ignore this email.\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}'),
(15, 1, 'y', 'comment_notification', 'Someone just responded to your comment', 'Someone just responded to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comment at the following URL:\n{comment_url}\n\n{comment}\n\nTo stop receiving notifications for this comment, click here:\n{notification_removal_url}'),
(19, 1, 'y', 'comments_opened_notification', 'New comments have been added', '\nResponses have been added to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comments at the following URL:\n{comment_url}\n\n{comments}\n{comment} \n{/comments}\n\nTo stop receiving notifications for this entry, click here:\n{notification_removal_url}'),
(17, 1, 'y', 'private_message_notification', 'Someone has sent you a Private Message', '\n{recipient_name},\n\n{sender_name} has just sent you a Private Message titled ''{message_subject}''.\n\nYou can see the Private Message by logging in and viewing your InBox at:\n{site_url}\n\nTo stop receiving notifications of Private Messages, turn the option off in your Email Settings.'),
(18, 1, 'y', 'pm_inbox_full', 'Your private message mailbox is full', '{recipient_name},\n\n{sender_name} has just attempted to send you a Private Message,\nbut your InBox is full, exceeding the maximum of {pm_storage_limit}.\n\nPlease log in and remove unwanted messages from your InBox at:\n{site_url}');

-- --------------------------------------------------------

--
-- Table structure for table `exp_stats`
--

CREATE TABLE `exp_stats` (
  `stat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `total_members` mediumint(7) NOT NULL DEFAULT '0',
  `recent_member_id` int(10) NOT NULL DEFAULT '0',
  `recent_member` varchar(50) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `most_visitors` mediumint(7) NOT NULL DEFAULT '0',
  `most_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_cache_clear` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`stat_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_stats`
--

INSERT INTO `exp_stats` (`stat_id`, `site_id`, `total_members`, `recent_member_id`, `recent_member`, `total_entries`, `total_forum_topics`, `total_forum_posts`, `total_comments`, `last_entry_date`, `last_forum_post_date`, `last_comment_date`, `last_visitor_date`, `most_visitors`, `most_visitor_date`, `last_cache_clear`) VALUES
(1, 1, 20, 25, 'Serclove', 68, 0, 0, 0, 1283861971, 0, 0, 1329297075, 26, 1296143634, 1329438900);

-- --------------------------------------------------------

--
-- Table structure for table `exp_statuses`
--

CREATE TABLE `exp_statuses` (
  `status_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `status` varchar(50) NOT NULL,
  `status_order` int(3) unsigned NOT NULL,
  `highlight` varchar(30) NOT NULL,
  PRIMARY KEY (`status_id`),
  KEY `group_id` (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `exp_statuses`
--

INSERT INTO `exp_statuses` (`status_id`, `site_id`, `group_id`, `status`, `status_order`, `highlight`) VALUES
(1, 1, 1, 'open', 1, '009933'),
(2, 1, 1, 'closed', 2, '990000'),
(3, 1, 1, 'deleted', 3, 'FFFFFF');

-- --------------------------------------------------------

--
-- Table structure for table `exp_status_groups`
--

CREATE TABLE `exp_status_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_status_groups`
--

INSERT INTO `exp_status_groups` (`group_id`, `site_id`, `group_name`) VALUES
(1, 1, 'Default Status Group');

-- --------------------------------------------------------

--
-- Table structure for table `exp_status_no_access`
--

CREATE TABLE `exp_status_no_access` (
  `status_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`status_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_templates`
--

CREATE TABLE `exp_templates` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `template_name` varchar(50) NOT NULL,
  `save_template_file` char(1) NOT NULL DEFAULT 'n',
  `template_type` varchar(16) NOT NULL DEFAULT 'webpage',
  `template_data` mediumtext,
  `template_notes` text,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  `last_author_id` int(10) NOT NULL DEFAULT '0',
  `cache` char(1) NOT NULL DEFAULT 'n',
  `refresh` int(6) unsigned NOT NULL DEFAULT '0',
  `no_auth_bounce` varchar(50) NOT NULL DEFAULT '',
  `enable_http_auth` char(1) NOT NULL DEFAULT 'n',
  `allow_php` char(1) NOT NULL DEFAULT 'n',
  `php_parse_location` char(1) NOT NULL DEFAULT 'o',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`template_id`),
  KEY `group_id` (`group_id`),
  KEY `site_id` (`site_id`),
  KEY `template_name` (`template_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=53 ;

--
-- Dumping data for table `exp_templates`
--

INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `save_template_file`, `template_type`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`) VALUES
(16, 1, 3, 'index', 'y', 'webpage', '<!DOCTYPE HTML">\n<html>\n	<head>\n		<title>2nd Folio</title>\n		\n		{embed="includes/head"}\n		\n	</head>\n	<body>\n		{embed="includes/header"}\n		<div class="container">			\n			<div class="page-top"></div>\n			<div class="page-mid">\n				<div class="span-24">\n\n\n		<a href="{site_url}images/shakespeare.flv"  \n			 style="display:block;width:960px;height:528px; background:transparent;"  \n			 id="player"> \n		</a> \n\n\n					<a href="{path="qr/"}" class="home-btn-qr">DOWNLOAD QR READER</a>\n					<a href="{path="cards/"}" class="home-btn-cards">GET MORE PLAYING CARDS</a>\n					<a href="{path="league/"}" class="home-btn-league">THE 2ND FOLIO LEAGUE TABLE</a>\n				</div>\n				<div class="clear"></div>\n			</div>\n			<div class="page-bottom"></div>\n		</div>\n		{embed="includes/footer"}\n	</body>\n</html>\n', '', 1313418443, 1, 'n', 0, '', 'n', 'n', 'o', 7724),
(17, 1, 3, '404', 'y', 'webpage', '<!DOCTYPE HTML">\n<html>\n	<head>\n		<title>Error: 404 | 2nd Folio</title>\n		\n		{embed="includes/head"}\n		\n	</head>\n	<body>\n		{embed="includes/header"}\n		<div class="container">\n			<div class="page-top"></div>\n			<div class="page-mid">\n				<div class="span-24">\n					<div class="span-18">\n						<h1 class="stencil">Error: 404</h1>\n						<p class="intro">Page not found</p>\n					</div>\n				</div>\n				<div class="clear"></div>\n			</div>\n			<div class="page-bottom"></div>\n		</div>\n		{embed="includes/footer"}\n	</body>\n</html>\n', '', 1313503349, 4, 'n', 0, '', 'n', 'n', 'o', 82),
(18, 1, 4, 'index', 'y', 'webpage', '<!DOCTYPE HTML">\n<html>\n	<head>\n		<title>About | 2nd Folio</title>\n		\n		{embed="includes/head"}\n		\n	</head>\n	<body>\n		{embed="includes/header"}\n		<div class="container">\n			<div class="page-top"></div>\n			<div class="page-mid">			\n				<div class="span-24">\n					<div class="span-18">\n					{exp:channel:entries entry_id="2"}\n						<h1 class="stencil">{title}</h1>\n						<p class="intro">{intro}</p>\n						{body}\n					{/exp:channel:entries}\n					</div>\n				</div>\n				<div class="clear"></div>\n			</div>\n			<div class="page-bottom"></div>\n		</div>\n		{embed="includes/footer"}\n	</body>\n</html>\n', '', 1313503349, 4, 'n', 0, '', 'n', 'n', 'o', 1163),
(19, 1, 5, 'index', 'y', 'webpage', '<!DOCTYPE HTML">\n<html>\n	<head>\n		<title>	{exp:channel:entries channel="rules" limit="1" sort="asc" dynamic="on"}{title} | {/exp:channel:entries}2nd Folio</title>\n		\n		{embed="includes/head"}\n		\n	</head>\n	<body>\n		{embed="includes/header"}\n		<div class="container">\n			<div class="page-top"></div>\n			<div class="page-mid">\n			<div class="span-24">\n				<div class="span-15">\n				{exp:channel:entries channel="rules" limit="1" sort="asc" dynamic="on"}\n					<h1 class="stencil">{title}</h1>\n					<p class="intro">{intro}</p>\n					{body}\n				{/exp:channel:entries}\n				</div>\n\n				<div class="span-7 push-2 last prepend-top">\n			{!--\n					<h3 class="static">Rules</h3>\n					<ul class="sub-list">\n					{exp:channel:entries channel="rules" sort="asc" dynamic="off"}\n						<li><a href="{title_permalink="rules/"}">{title}</a></li>\n					{/exp:channel:entries}\n					</ul>\n		\n--}				</div>\n			</div>\n				<div class="clear"></div>\n			</div>\n			<div class="page-bottom"></div>\n		</div>\n		{embed="includes/footer"}\n	</body>\n</html>\n', '', 1313418443, 1, 'n', 0, '', 'n', 'n', 'o', 846),
(21, 1, 6, 'index', 'y', 'webpage', '<!DOCTYPE HTML">\n<html>\n	<head>\n		<title>Submit | 2nd Folio</title>\n		\n		{embed="includes/head"}\n		\n	</head>\n	<body>\n		{embed="includes/header"}\n		<div class="container">\n			<div class="page-top"></div>\n			<div class="page-mid">			\n			<div class="span-24">\n			\n			{if segment_2 == "thankyou"}\n				<div class="span-18">\n					<h1 class="stencil">Thank you for your suggestion</h1> \n					<p>You will recieve an email shortly confirming your submission.</p>				\n				</div>\n			{if:else}\n				<div class="span-12">\n				{exp:channel:entries entry_id="8"}\n					<h1 class="stencil">{title}</h1>\n					<p class="intro">{intro}</p>\n					{body}\n				{/exp:channel:entries}\n				</div>\n				\n\n				{exp:freeform:form\n				   collection="Submit Form"\n				   required="name|email|message"\n				   return="submit/thankyou"\n				   notify="james@supercooldesign.co.uk, paul.sutton@candt.org"\n				   template="submission-notification"\n				   send_user_email="yes"\n				   user_email_template="submission-success"\n				   file_upload="Main Upload Directory"\n				   }\n					<div class="span-9 last push-2 prepend-top">\n					<form class="span-9 last suggestion-form">\n						<label class="stencil">Name</label><br />\n						<input type="text" name="name" class="span-9 title">\n	\n						<label class="stencil">Email</label><br />\n						<input type="text" name="email" class="span-9 title">\n	\n						<label class="stencil">Suggestion</label><br />\n						<textarea type="text" name="message" class="span-9 title"></textarea>\n						<p>\n							<button type="reset" class="nice-button">Reset</button>\n							<button type="submit" class="nice-button">Submit</button>\n						</p>\n					</form>\n					</div>\n				{/exp:freeform:form}						\n			{/if}\n			</div>\n\n				<div class="clear"></div>\n			</div>\n			\n			\n			\n			<div class="page-bottom"></div>\n\n		</div>\n		{embed="includes/footer"}\n	</body>\n</html>\n', '', 1313418443, 1, 'n', 0, '', 'n', 'n', 'o', 678),
(23, 1, 7, 'index', 'y', 'webpage', '<!DOCTYPE HTML">\n<html>\n	<head>\n		<title>{if segment_2 != ""}{exp:channel:entries channel="characters" dynamic="on"}{title}{/exp:channel:entries} | {/if}Characters | 2nd Folio</title>\n		\n		{embed="includes/head"}\n		\n	</head>\n	<body>\n		{embed="includes/header"}\n		<div class="container">\n			<div class="page-top"></div>\n			<div class="page-mid">\n				<div class="span-24">\n\n					{if segment_2 == ""}\n						{!--MAIN PAGE--}\n\n						<h1 class="stencil">Points System</h1>\n						<div class="span-24">\n						{exp:channel:entries channel="characters"}\n						<a href="{title_permalink="characters/"}" class="character-box">\n								{exp:imgsizer:size src="{character-image}" width="220"}\n								<h3>{title}</h3>\n								<p>{character-point} points</p>\n						</a>\n						{/exp:channel:entries}\n						</div>\n					{if:else}\n					\n						{!--ENTRY PAGE--}\n						<div class="span-24">\n						{exp:channel:entries channel="characters"}\n							<div class="span-15">\n								<h1 class="stencil">{title}</h1>\n								<p>Worth: {character-point} points</p>								\n								<p class="intro">{character-intro}</p>\n								{character-body}\n							</div>\n								<large><a href="{path="characters"}">« BACK</a></large>\n								\n							<div class="prepend-top push-1 last span-6">\n								{exp:imgsizer:size src="{character-image}" width="230"}\n							</div>\n\n						{/exp:channel:entries}					\n						</div>\n					{/if}\n					</div>\n				<div class="clear"></div>\n			</div>\n			<div class="page-bottom"></div>\n\n		</div>\n		{embed="includes/footer"}\n	</body>\n</html>\n', '', 1313418443, 1, 'n', 0, '', 'n', 'n', 'o', 3320),
(24, 1, 8, 'index', 'y', 'webpage', '<!DOCTYPE HTML">\n<html>\n	<head>\n		<title>{exp:channel:entries channel="tasks" limit="1" dynamic="on" orderby="random"}{title} | Quotes | {/exp:channel:entries}2nd Folio</title>\n		\n		{embed="includes/head"}\n		\n	</head>\n	<body>\n		{embed="includes/header"}\n		<div class="container">\n			<div class="page-top"></div>\n			<div class="page-mid">			\n				<div class="span-24">\n					{if segment_2 == ""}\n						{exp:channel:entries channel="tasks" limit="1" dynamic="on" orderby="random"}				\n					{if:else}\n						{exp:channel:entries channel="tasks" limit="1" dynamic="on"}\n					{/if}\n					<div class="span-8 colborder prepend-top">\n						<h1 class="stencil">{title}</h1>\n						<p class="intro">{task-intro}</p>\n						{task-body}\n						{exp:imgsizer:size src="{task-qr}" width="150" height="150"}\n					</div>\n					<div class="span-15 last prepend-top">\n						{task-media}\n						<div class="span-15 last append-bottom border-bottom">\n							{if heading != ""}<h2>{heading}</h2>{/if}\n							<div class="prepend-top append-bottom">\n								{if embed != ""}\n								<object width="590" height="490"><param name="movie" value="http://www.youtube.com/v/{exp:low_replace find="http://www.youtube.com/watch?v=" replace=""}{embed}{/exp:low_replace}?fs=1&amp;hl=en_US"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="http://www.youtube.com/v/{exp:low_replace find="http://www.youtube.com/watch?v=" replace=""}{embed}{/exp:low_replace}?fs=1&amp;hl=en_US" type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true" width="590" height="490"></embed></object>\n								{/if}\n								{if vimeo != ""}\n								<iframe src="http://player.vimeo.com/video/{exp:low_replace find="http://vimeo.com/" replace=""}{vimeo}{/exp:low_replace}?portrait=0&amp;color=ffffff" width="590" height="490" frameborder="0"></iframe>\n								{/if}\n							</div>\n							{if description != ""}{description}{/if}\n						</div>\n						{/task-media}\n						{/exp:channel:entries}\n						{embed="includes/comments"}\n					</div>\n				</div>\n				<div class="clear"></div>\n			</div>\n			<div class="page-bottom"></div>\n		</div>\n		{embed="includes/footer"}\n	</body>\n</html>\n', '', 1314028855, 4, 'n', 0, '', 'n', 'n', 'o', 331),
(25, 1, 9, 'index', 'y', 'webpage', '<!DOCTYPE HTML">\n<html>\n	<head>\n		<title>{exp:channel:entries channel="quotes" limit="1" dynamic="on" orderby="random"}{title} | Quotes | {/exp:channel:entries}2nd Folio</title>\n		\n		{embed="includes/head"}\n		\n	</head>\n	<body>\n		{embed="includes/header"}\n		<div class="container">\n			<div class="page-top"></div>\n			<div class="page-mid">			\n				<div class="span-24">\n					{if segment_2 == ""}\n						{exp:channel:entries channel="quotes" limit="1" dynamic="on" orderby="random"}\n					{if:else}\n						{exp:channel:entries channel="quotes" limit="1" dynamic="on"}\n					{/if}\n					<div class="span-8 colborder prepend-top">\n						<h1 class="stencil">{title}</h1>\n						<p class="intro">{quote-intro}</p>\n						{quote-body}\n					</div>\n					<div class="span-15 last prepend-top">\n						{quote-media}\n						<div class="span-15 last append-bottom border-bottom">\n							<h2>{heading}</h2>\n							<div class="prepend-top append-bottom">\n								{if embed != ""}\n								<object width="590" height="490"><param name="movie" value="http://www.youtube.com/v/{exp:low_replace find="http://www.youtube.com/watch?v=" replace=""}{embed}{/exp:low_replace}?fs=1&amp;hl=en_US"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="http://www.youtube.com/v/{exp:low_replace find="http://www.youtube.com/watch?v=" replace=""}{embed}{/exp:low_replace}?fs=1&amp;hl=en_US" type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true" width="590" height="490"></embed></object>\n								{/if}\n								{if vimeo != ""}\n								<iframe src="http://player.vimeo.com/video/{exp:low_replace find="http://vimeo.com/" replace=""}{vimeo}{/exp:low_replace}?portrait=0&amp;color=ffffff" width="590" height="490" frameborder="0"></iframe>\n								{/if}\n							</div>\n							{if description != ""}{description}{/if}\n						</div>\n						{/quote-media}\n						{/exp:channel:entries}\n						{embed="includes/comments"}\n					</div>\n				</div>\n				<div class="clear"></div>\n			</div>\n			<div class="page-bottom"></div>\n		</div>\n		{embed="includes/footer"}\n	</body>\n</html>\n', '', 1314028855, 4, 'n', 0, '', 'n', 'n', 'o', 619),
(26, 1, 10, 'index', 'n', 'webpage', '', '', 1282667328, 0, 'n', 0, '', 'n', 'n', 'o', 1),
(27, 1, 10, 'header', 'y', 'webpage', '<div class="top-black"></div>\n	<div class="container">\n			<div class="span-24">\n				<div class="span-7">\n					<h1 id="logo"><a href="{path="home"}" title="Go to homepage">2nd Folio</a></h1>\n				</div>\n				<div class="span-17 last">\n					<ul id="main-menu">\n						<li><a href="{path="home"}" title="Go to homepage">Introduction</a></li>\n						<li><a href="{path="about/"}" title="">About</a></li>\n						<li><a href="{path="characters/"}" title="">Points</a></li>\n						<li><a href="{path="rules/"}" title="">Rules</a></li>\n						<li><a href="{path="submit/"}" title="">Submit</a></li>\n						<li><a href="{path="shop"}" title="">Shop</a></li>\n						{if logged_in}<li><a href="{path="my-account"}" title="">My Account</a></li>{/if}\n						{if logged_out}<li><a href="{path="member/login"}" title="">Login</a></li>{/if}\n					</ul>\n				</div>\n			</div>\n	</div>', '', 1314351910, 4, 'n', 0, '', 'n', 'n', 'o', 0),
(28, 1, 10, 'head', 'y', 'webpage', '		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">\n		<meta name="description" content="2nd Folio is a Shakespearean card-based game developed and produced by innovative threatre company C&T" />\n		<meta name="keywords" content="2nd Folio, second, folio, second-folio, second folio, shakespeare, william, theatre, c&t, collor, tie, education, learning," />\n		<meta name="robots" content="all" />\n		<meta name="distribution" content="Global" />\n		<meta name="rating" content="General" />\n		<meta name="revisit-after" content="30days" />\n		<meta name="author" content="C&T" />\n		<meta name="author-URL" content="http://www.2ndfolio.net" />\n\n		<link rel="shortcut icon" type="image/x-icon" href="{site_url}images/favicon.ico">\n		<link rel=''stylesheet'' href="{site_url}themes/2ndfolio_assets/css/link-icons.css" type="text/css" media="screen, projection" />\n		<link rel=''stylesheet'' href="{site_url}themes/2ndfolio_assets/css/screen.css" type="text/css" media="screen, projection" />\n		<link rel=''stylesheet'' href="{site_url}themes/2ndfolio_assets/css/supercool.css" type="text/css" media="screen, projection" />\n		<link rel=''stylesheet'' href="{site_url}themes/2ndfolio_assets/css/print.css" type="text/css" media="print" />\n		<!--[if lt IE 7]><link rel="stylesheet" href="{site_url}themes/2ndfolio_assets/css/ie.css" type="text/css" media="screen, projection"><![endif]-->\n\n\n		<script src="{site_url}themes/2ndfolio_assets/js/1.4.jquery.min.js"></script>\n		<script src="{site_url}themes/2ndfolio_assets/js/1.8.jquery-ui.min.js"></script>\n\n		<script type="text/javascript" src="{site_url}themes/2ndfolio_assets/js/flowplayer-3.2.4.min.js"></script>\n\n\n		<script type="text/javascript" src="{site_url}themes/2ndfolio_assets/js/supersleight.plugin.js"></script>\n\n\n		<script type="text/javascript" src="http://use.typekit.com/ecf8kzk.js"></script>\n		<script type="text/javascript">try{Typekit.load();}catch(e){}</script>		', '', 1313503349, 4, 'n', 0, '', 'n', 'n', 'o', 0),
(29, 1, 10, 'footer', 'y', 'webpage', '	<div class="container">\n		<div class="span-24 last">\n			<a href="http://www.supercooldesign.co.uk" class="supercool" title="Site by Supercool">Supercool</a>\n			<a href="http://www.candt.org" class="candt-logo" title="A project devised and delivered by C&T Theatre Company">C&T</a>\n		</div>\n	</div>\n	\n	<script type="text/javascript" src="{site_url}themes/2ndfolio_assets/js/functions.js"></script>\n			\n			\n', '', 1313503349, 4, 'n', 0, '', 'n', 'n', 'o', 0),
(30, 1, 11, 'index', 'y', 'webpage', '<!DOCTYPE HTML">\n<html>\n	<head>\n		<title>The League | 2nd Folio</title>\n		\n		{embed="includes/head"}\n		\n	</head>\n	<body>\n		{embed="includes/header"}\n		<div class="container">\n			<div class="page-top"></div>\n			<div class="page-mid">			\n				<div class="span-24">\n				{exp:channel:entries channel="league" limit="1"}\n					<div class="span-8 colborder prepend-top">\n						<h1 class="stencil">The League</h1>\n						<p class="intro">{league-body}</p>\n					</div>\n					<div class="span-15 last prepend-top">\n\n					<table class="league">\n						<thead>\n							<td class="team">Team\n							</td>\n							<td class="played">Played<br /><small>[Number of rounds]</small>\n							</td>\n							<td played="average">Average<br /><small>[Points scored]</small>\n							</td>\n							<td class="total">Total\n							</td>\n						</thead>\n						{league orderby="points" sort="desc"}\n							<tr class="{switch="odd|tother"}">\n								<td class="team">{team}</td>\n								<td class="played">{rounds}</td>\n								<td class="average">\n								{exp:simple_math calculate="round({points} / {rounds},0)"}\n								 </td>\n								<td class="total">{points}</td>\n							</tr>\n						{/league}\n\n					</table>\n				\n\n\n\n					</div>\n					{/exp:channel:entries}\n				</div>\n					<div class="clear"></div>\n				</div>\n				<div class="page-bottom"></div>\n		</div>\n		{embed="includes/footer"}\n	</body>\n</html>\n', '', 1313503349, 4, 'n', 0, '', 'n', 'n', 'o', 758),
(31, 1, 12, 'index', 'y', 'webpage', '<!DOCTYPE HTML">\n<html>\n	<head>\n		<title>Download Playing Cards | 2nd Folio</title>\n		\n		{embed="includes/head"}\n		\n	</head>\n	<body>\n		{embed="includes/header"}\n		<div class="container">\n			<div class="page-top"></div>\n			<div class="page-mid">\n				{if logged_in}\n				<div class="span-24">\n					<div class="span-18">\n					{exp:channel:entries entry_id="65"}\n						<h1 class="stencil">{title}</h1>\n						<p class="intro">{intro}</p>\n						{body}\n					<a href="#">DOWNDLOAD BUTTON</a>\n					{/exp:channel:entries}\n					\n					</div>\n				</div>\n				{if:else}\n					<div class="span-24">\n						<div class="span-15">\n							{exp:channel:entries entry_id="63"}\n								<h1 class="stencil">{title}</h1>\n								<p class="intro">{intro}</p>\n								{body}\n							{/exp:channel:entries}\n						</div>\n						<div class="span-8 push-1 last prepend-top">\n							<h3>Network member login</h3>\n								{exp:member:login_form return="cards"}\n									<label class="stencil">Username</label><br />\n									<input type="text" name="username" value="" class="span-5 text"/> <br />\n									<label class="stencil">Password</label><br />\n									<input type="password" name="password" value="" class="span-5 text" /></p>\n									<p>\n										<input type="submit" name="submit" value="Login" />\n									</p>\n								{/exp:member:login_form}\n						</div>\n					</div>\n				{/if}\n				<div class="clear"></div>\n			</div>\n			<div class="page-bottom"></div>\n		</div>\n		{embed="includes/footer"}\n	</body>\n</html>\n', '', 1313503349, 4, 'n', 0, '', 'n', 'n', 'o', 605),
(32, 1, 13, 'index', 'y', 'webpage', '<!DOCTYPE HTML">\n<html>\n	<head>\n		<title>QR Reader | 2nd Folio</title>\n		\n		{embed="includes/head"}\n		\n	</head>\n	<body>\n		{embed="includes/header"}\n		<div class="container">\n			<div class="page-top"></div>\n			<div class="page-mid">\n				<div class="span-24">\n					<div class="span-16">\n					{exp:channel:entries entry_id="62"}\n						<h1 class="stencil">{title}</h1>\n						<p class="intro">{intro}</p>\n						{body}\n					{/exp:channel:entries}\n					</div>\n					{exp:search:simple_form result_page="qr/search" channel="quotes|tasks" where="all" search_in="everywhere"}\n						<div class="span-7 push-1 last search-box">\n						<h3>Search</h3>\n						<p>If you''re having problems with the QR Reader, search for your quote or task here ...</p>\n						<input type="text" name="keywords" class="filled" value="keywords ...">\n						<button class="nice-button">Search</button>\n					{/exp:search:simple_form}\n					</div>\n				</div>\n				<div class="clear"></div>\n			</div>\n			<div class="page-bottom"></div>\n		</div>\n		{embed="includes/footer"}\n	</body>\n</html>\n', '', 1313503349, 4, 'n', 0, '', 'n', 'n', 'o', 985),
(33, 1, 14, 'index', 'y', 'webpage', '', '', 1313418443, 1, 'n', 0, '', 'n', 'n', 'o', 8),
(34, 1, 13, 'search', 'y', 'webpage', '<!DOCTYPE HTML">\n<html>\n	<head>\n		<title>Search results for "{exp:search:keywords}" | 2nd Folio</title>\n		\n		{embed="includes/head"}\n		\n	</head>\n	<body>\n		{embed="includes/header"}\n		<div class="container">\n			<div class="page-top"></div>\n			<div class="page-mid">			\n				<div class="span-24">\n							\n				\n				<div class="span-15">\n					<h1 class="stencil">Search results for "{exp:search:keywords}"</h1>\n				\n\n					<ul class="search-results">\n						{exp:search:search_results}\n						<li>\n							<small>{channel}</small>\n							<p><a href="{auto_path}">{title}</a></p>\n						</li>\n						{/exp:search:search_results}\n					</ul>\n				</div>\n					\n					{exp:search:simple_form result_page="qr/search" channel="quotes|tasks" where="all" search_in="everywhere"}\n						<div class="span-7 push-1 last search-box">\n						<h3>Search again</h3>\n						<input type="text" name="keywords" class="filled" value="keywords ...">\n						<button class="nice-button">Search</button>\n						</div>\n					{/exp:search:simple_form}\n					\n					\n					\n				</div>\n				<div class="clear"></div>\n			</div>\n			<div class="page-bottom"></div>\n		</div>\n		{embed="includes/footer"}\n	</body>\n</html>\n', '', 1313418443, 1, 'n', 0, '', 'n', 'n', 'o', 110),
(35, 1, 3, 'notification', 'y', 'webpage', '<!DOCTYPE HTML">\n<html>\n	<head>\n		<title>{title} | 2nd Folio</title>\n		\n		{embed="includes/head"}\n		\n		{meta_refresh}\n		\n	</head>\n	<body>\n		{embed="includes/header"}\n		<div class="container">\n			<div class="page-top"></div>\n			<div class="page-mid">			\n				<div class="span-24">\n					<div class="span-18">\n						<h1 class="stencil">{heading}</h1>\n						<p class="intro">{content}</p>\n						<p>{link}</p>\n\n					</div>\n				</div>\n				<div class="clear"></div>\n			</div>\n			<div class="page-bottom"></div>\n		</div>\n		{embed="includes/footer"}\n	</body>\n</html>\n', '', 1313418443, 1, 'n', 0, '', 'n', 'n', 'o', 292),
(37, 1, 0, 'index', 'n', 'webpage', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" \n"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> \n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{lang}" lang="{lang}"> \n\n<head>\n<title>{lang:search}</title>\n\n<meta http-equiv="content-type" content="text/html; charset={charset}" />\n\n<link rel=''stylesheet'' type=''text/css'' media=''all'' href=''{stylesheet=search/search_css}'' /> \n<style type=''text/css'' media=''screen''>@import "{stylesheet=search/search_css}";</style>\n\n</head>\n<body>\n\n<div id="content">\n<div class=''header''><h1>{lang:search_engine}</h1></div>\n\n<table class=''breadcrumb'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''99%''>\n<tr>\n<td><span class="defaultBold">&nbsp; <a href="{homepage}">{site_name}</a>&nbsp;&#8250;&nbsp;&nbsp;{lang:search}</span></td>\n</tr>\n</table>\n\n<div class=''outerBorder''>\n<div class=''tablePad''>\n\n\n{exp:search:advanced_form result_page="search/results" }\n\n\n<table cellpadding=''4'' cellspacing=''6'' border=''0'' width=''100%''>\n<tr>\n<td>\n\n<fieldset class="fieldset">\n<legend>{lang:search_by_keyword}</legend>\n\n<input type="text" class="input" maxlength="100" size="40" name="keywords" style="width:100%;" />\n\n<div class="default">\n<select name="search_in">\n<option value="titles" selected="selected">{lang:search_in_titles}</option>\n<option value="entries" selected="selected">{lang:search_in_entries}</option>\n<option value="everywhere" >{lang:search_everywhere}</option>\n</select>\n\n</div>\n\n</fieldset>\n\n\n</td><td>\n\n<fieldset class="fieldset">\n<legend>{lang:search_by_member_name}</legend>\n\n<input type="text" class="input" maxlength="100" size="40" name="member_name" style="width:100%;" />\n<div class="default"><input type="checkbox" class="checkbox" name="exact_match" value="y"  /> {lang:exact_name_match}</div>\n\n</fieldset>\n\n</td>\n</tr>\n</table>\n\n\n<table cellpadding=''4'' cellspacing=''6'' border=''0'' width=''100%''>         \n<tr>\n<td valign="top" width="50%">\n\n\n<table cellpadding=''0'' cellspacing=''0'' border=''0''>         \n<tr>\n<td valign="top">\n\n<div class="defaultBold">{lang:weblogs}</div>\n\n<select id="weblog_id[]" name=''weblog_id[]'' class=''multiselect'' size=''12'' multiple=''multiple'' onchange=''changemenu(this.selectedIndex);''>\n{weblog_names}\n</select>\n\n</td>\n<td valign="top" width="16">&nbsp;</td>\n<td valign="top">\n\n<div class="defaultBold">{lang:categories}</div>\n\n<select name=''cat_id[]'' size=''12''  class=''multiselect'' multiple=''multiple''>\n<option value=''all'' selected="selected">{lang:any_category}</option>\n</select>\n\n</td>\n</tr>\n</table>\n\n\n</td>\n<td valign="top" width="50%">\n\n\n<fieldset class="fieldset">\n<legend>{lang:search_entries_from}</legend>\n				\n<select name="date" style="width:150px">\n<option value="0" selected="selected">{lang:any_date}</option>\n<option value="1" >{lang:today_and}</option>\n<option value="7" >{lang:this_week_and}</option>\n<option value="30" >{lang:one_month_ago_and}</option>\n<option value="90" >{lang:three_months_ago_and}</option>\n<option value="180" >{lang:six_months_ago_and}</option>\n<option value="365" >{lang:one_year_ago_and}</option>\n</select>\n\n<div class="default">\n<input type=''radio'' name=''date_order'' value=''newer'' class=''radio'' checked="checked" />&nbsp;{lang:newer}\n<input type=''radio'' name=''date_order'' value=''older'' class=''radio'' />&nbsp;{lang:older}\n</div>\n\n</fieldset>\n\n<div class="default"><br /></div>\n\n<fieldset class="fieldset">						\n<legend>{lang:sort_results_by}</legend>\n\n<select name="order_by">\n<option value="date" >{lang:date}</option>\n<option value="title" >{lang:title}</option>\n<option value="most_comments" >{lang:most_comments}</option>\n<option value="recent_comment" >{lang:recent_comment}</option>\n</select>\n\n<div class="default">\n<input type=''radio'' name=''sort_order'' class="radio" value=''desc'' checked="checked" /> {lang:descending}\n<input type=''radio'' name=''sort_order'' class="radio" value=''asc'' /> {lang:ascending}\n</div>\n\n</td>\n</tr>\n</table>\n\n\n</td>\n</tr>\n</table>\n\n\n<div class=''searchSubmit''>\n\n<input type=''submit'' value=''{lang:search}'' class=''submit'' />\n\n</div>\n\n{/exp:search:advanced_form}\n\n<div class=''copyright''><a href="http://expressionengine.com/">Powered by ExpressionEngine</a></div>\n\n\n</div>\n</div>\n</div>\n\n</body> \n</html>', NULL, 0, 0, 'n', 0, '', 'n', 'n', 'o', 0),
(38, 1, 0, 'results', 'n', 'webpage', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" \n"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> \n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{lang}" lang="{lang}"> \n\n<head>\n<title>{lang:search}</title>\n\n<meta http-equiv="content-type" content="text/html; charset={charset}" />\n\n<link rel=''stylesheet'' type=''text/css'' media=''all'' href=''{stylesheet=search/search_css}'' /> \n<style type=''text/css'' media=''screen''>@import "{stylesheet=search/search_css}";</style>\n\n</head>\n<body>\n\n<div id="content">\n<div class=''header''><h1>{lang:search_results}</h1></div>\n\n<table class=''breadcrumb'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''99%''>\n<tr>\n<td><span class="defaultBold">&nbsp; <a href="{homepage}">{site_name}</a>&nbsp;&#8250;&nbsp;&nbsp;<a href="{path=search/index}">{lang:search}</a>&nbsp;&#8250;&nbsp;&nbsp;{lang:search_results}</span></td>\n<td align="center"><span class="defaultBold">{lang:keywords} {exp:search:keywords}</span></td>\n<td align="right"><span class="defaultBold">{lang:total_search_results} {exp:search:total_results}</span></td>\n</tr>\n</table>\n\n<div class=''outerBorder''>\n<div class=''tablePad''>\n\n<table border="0" cellpadding="6" cellspacing="1" width="100%">\n<tr>\n<td class="resultHead">{lang:title}</td>\n<td class="resultHead">{lang:excerpt}</td>\n<td class="resultHead">{lang:author}</td>\n<td class="resultHead">{lang:date}</td>\n<td class="resultHead">{lang:total_comments}</td>\n<td class="resultHead">{lang:recent_comments}</td>\n</tr>\n\n{exp:search:search_results switch="resultRowOne|resultRowTwo"}\n\n<tr>\n<td class="{switch}" width="30%" valign="top"><b><a href="{auto_path}">{title}</a></b></td>\n<td class="{switch}" width="30%" valign="top">{excerpt}</td>\n<td class="{switch}" width="10%" valign="top"><a href="{member_path=member/index}">{author}</a></td>\n<td class="{switch}" width="10%" valign="top">{entry_date format="%m/%d/%y"}</td>\n<td class="{switch}" width="10%" valign="top">{comment_total}</td>\n<td class="{switch}" width="10%" valign="top">{recent_comment_date format="%m/%d/%y"}</td>\n</tr>\n\n{/exp:search:search_results}\n\n</table>\n\n\n{if paginate}\n\n<div class=''paginate''>\n\n<span class=''pagecount''>{page_count}</span>&nbsp; {paginate}\n\n</div>\n\n{/if}\n\n\n</td>\n</tr>\n</table>\n\n<div class=''copyright''><a href="http://expressionengine.com/">Powered by ExpressionEngine</a></div>\n\n</div>\n</div>\n</div>\n\n</body> \n</html>', NULL, 0, 0, 'n', 0, '', 'n', 'n', 'o', 0),
(39, 1, 0, 'search_css', 'n', 'css', 'body {\n margin:0;\n padding:0;\n font-family:Verdana, Geneva, Tahoma, Trebuchet MS, Arial, Sans-serif;\n font-size:11px;\n color:#000;\n background-color:#fff;\n}\n\na {\n text-decoration:none; color:#330099; background-color:transparent;\n}\na:visited {\n color:#330099; background-color:transparent;\n}\na:hover {\n color:#000; text-decoration:underline; background-color:transparent;\n}\n\n#content {\n left:				0px;\n right:				10px;\n margin:			10px 25px 10px 25px;\n padding:			8px 0 0 0;\n}\n\n.outerBorder {\n border:		1px solid #4B5388;\n}\n\n.header {\n margin:			0 0 14px 0;\n padding:			2px 0 2px 0;\n border:			1px solid #000770;\n background-color:	#797EB8;\n text-align:		center;\n}\n\nh1 {  \n font-family:		Georgia, Times New Roman, Times, Serif, Arial;\n font-size: 		20px;\n font-weight:		bold;\n letter-spacing:	.05em;\n color:				#fff;\n margin: 			3px 0 3px 0;\n padding:			0 0 0 10px;\n}\n\n\n.copyright {\n text-align:        center;\n font-family:       Verdana, Geneva, Tahoma, Trebuchet MS, Arial, Sans-serif;\n font-size:         9px;\n color:             #999;\n margin-top:        15px;\n margin-bottom:     15px;\n}\n\np {  \n font-family:	Verdana, Geneva, Tahoma, Trebuchet MS, Arial, Sans-serif;\n font-size:		11px;\n font-weight:	normal;\n color:			#000;\n background:	transparent;\n margin: 		6px 0 6px 0;\n}\n\n.searchSubmit {\n font-family:       Verdana, Geneva, Tahoma, Trebuchet MS, Arial, Sans-serif;\n font-size:         11px;\n color:             #000;\n text-align: center;\n padding:           6px 10px 6px 6px;\n border-top:        1px solid #4B5388;\n border-bottom:     1px solid #4B5388;\n background-color:  #C6C9CF;  \n}\n\n.fieldset {\n border:        1px solid #999;\n padding: 10px;\n}\n\n.breadcrumb {\n margin:			0 0 10px 0;\n background-color:	transparent;   \n font-family:		Verdana, Geneva, Tahoma, Trebuchet MS, Arial, Sans-serif;\n font-size:			10px; \n}\n\n.default, .defaultBold {\n font-family:		Verdana, Geneva, Tahoma, Trebuchet MS, Arial, Sans-serif;\n font-size:			11px;\n color:				#000;\n padding:			3px 0 3px 0;\n background-color:	transparent;  \n}\n\n.defaultBold {\n font-weight:		bold;\n}\n\n.paginate {\n font-family:		Verdana, Geneva, Tahoma, Trebuchet MS, Arial, Sans-serif;\n font-size:			12px;\n font-weight: 		normal;\n letter-spacing:	.1em;\n padding:			10px 6px 10px 4px;\n margin:			0;\n background-color:	transparent;  \n}\n\n.pagecount {\n font-family:		Verdana, Geneva, Tahoma, Trebuchet MS, Arial, Sans-serif;\n font-size:			10px;\n color:				#666;\n font-weight:		normal;\n background-color: transparent;  \n}\n\n.tablePad {\n padding:			3px 3px 5px 3px;\n background-color:	#fff;\n}\n\n.resultRowOne {\n font-family:		Verdana, Geneva, Tahoma, Trebuchet MS, Arial, Sans-serif;\n font-size:			11px;\n color:				#000;\n padding:           6px 6px 6px 8px;\n background-color:	#DADADD;  \n}\n\n.resultRowTwo {\n font-family:       Verdana, Geneva, Tahoma, Trebuchet MS, Arial, Sans-serif;\n font-size:         11px;\n color:             #000;\n padding:           6px 6px 6px 8px;\n background-color:  #eee;  \n}\n\n.resultHead {\n font-family:		Verdana, Geneva, Tahoma, Trebuchet MS, Arial, Sans-serif;\n font-size: 		11px;\n font-weight: 		bold;\n color:				#000;\n padding: 			8px 0 8px 8px;\n border-bottom:		1px solid #999;\n background-color:	transparent;  \n}\n\nform {\n margin:            0;\n}\n.hidden {\n margin:            0;\n padding:           0;\n border:            0;\n}\n.input {\n border-top:        1px solid #999999;\n border-left:       1px solid #999999;\n background-color:  #fff;\n color:             #000;\n font-family:       Verdana, Geneva, Tahoma, Trebuchet MS, Arial, Sans-serif;\n font-size:         11px;\n height:            1.6em;\n padding:           .3em 0 0 2px;\n margin-top:        6px;\n margin-bottom:     3px;\n} \n.textarea {\n border-top:        1px solid #999999;\n border-left:       1px solid #999999;\n background-color:  #fff;\n color:             #000;\n font-family:       Verdana, Geneva, Tahoma, Trebuchet MS, Arial, Sans-serif;\n font-size:         11px;\n margin-top:        3px;\n margin-bottom:     3px;\n}\n.select {\n background-color:  #fff;\n font-family:       Arial, Verdana, Sans-serif;\n font-size:         10px;\n font-weight:       normal;\n letter-spacing:    .1em;\n color:             #000;\n margin-top:        6px;\n margin-bottom:     3px;\n} \n.multiselect {\n border-top:        1px solid #999999;\n border-left:       1px solid #999999;\n background-color:  #fff;\n color:             #000;\n font-family:       Verdana, Geneva, Tahoma, Trebuchet MS, Arial, Sans-serif;\n font-size:         11px;\n margin-top:        3px;\n margin-bottom:     3px;\n} \n.radio {\n color:             #000;\n margin-top:        7px;\n margin-bottom:     4px;\n padding:           0;\n border:            0;\n background-color:  transparent;\n}\n.checkbox {\n background-color:  transparent;\n margin:            3px;\n padding:           0;\n border:            0;\n}\n.submit {\n background-color:  #fff;\n font-family:       Arial, Verdana, Sans-serif;\n font-size:         10px;\n font-weight:       normal;\n letter-spacing:    .1em;\n padding:           1px 3px 1px 3px;\n margin-top:        6px;\n margin-bottom:     4px;\n text-transform:    uppercase;\n color:             #000;\n}', NULL, 0, 0, 'n', 0, '', 'n', 'n', 'o', 0),
(40, 1, 3, 'test', 'y', 'webpage', '<!DOCTYPE HTML">\n<html>\n	<head>\n		<title>TEST PAGE | 2nd Folio</title>\n		\n		{embed="includes/head"}\n		\n	</head>\n	<body>\n		{embed="includes/header"}\n		<div class="container">\n			<div class="page-top"></div>\n			<div class="page-mid">\n				{if logged_in}\n				<div class="span-24">\n					<div class="span-18">\n						<ul>\n							{exp:channel:entries channel="tasks|quotes"}\n							<li><a href="{path=''{channel_short_name}''}/{url_title}">{channel}-{title}</a></li>\n							{/exp:channel:entries}\n						</ul>\n					<br /><br /><br /><br />\n					</div>\n					\n					<div class="span-18">\n					Hi {username}, you are logged in!\n					<a href="{path=''logout''}">Log Out</a>\n						<div>\n							{embed="includes/member-details"}\n						</div>\n					</div>\n				</div>\n				{if:else}\n					<div class="span-24">\n						<div class="span-15">\n							logged out\n						</div>\n						<div class="span-8 push-1 last prepend-top">\n								{exp:member:login_form return="home/test"}\n									<label class="stencil">Username</label><br />\n									<input type="text" name="username" value="" class="span-5 text"/> <br />\n									<label class="stencil">Password</label><br />\n									<input type="password" name="password" value="" class="span-5 text" /></p>\n									<p>\n										<input type="submit" name="submit" value="Login" />\n									</p>\n								{/exp:member:login_form}\n						</div>\n					</div>\n				{/if}\n				<div class="clear"></div>\n			</div>\n			<div class="page-bottom"></div>\n		</div>\n		{embed="includes/footer"}\n	</body>\n</html>', '', 1314028855, 4, 'n', 0, '', 'n', 'n', 'o', 10),
(41, 1, 10, 'bout-details', 'y', 'webpage', '					{exp:member_categories:categories username="{username}" backspace="1"}\n					<a href="{path=category/{category_url_title}}">{category_name}</a>,\n					{if no_results}none{/if}\n					{/exp:member_categories:categories}\n', '', 1314028855, 4, 'n', 0, '', 'n', 'n', 'o', 0),
(43, 1, 10, 'comment-wrangler', 'y', 'webpage', '{exp:channel:entries limit="1" dynamic="no" entry_id="{embed:eid}"}\n	{if ''{exp:member_categories:categories limit="1" member_id="{embed:aid}"}{category_id}{/exp:member_categories:categories}'' == ''{exp:member_categories:categories limit="1"}{category_id}{/exp:member_categories:categories}''}\n		vid_url: {video_url}\n		body: {comment_body}\n	{/if}\n{/exp:channel:entries}', NULL, 1314028740, 4, 'n', 0, '', 'n', 'n', 'o', 0),
(44, 1, 10, 'comments', 'y', 'webpage', '{if logged_in}\n	{exp:channel:entries channel="comments" search:comment_parent="{segment_2}" dynamic="no"}\n		{embed="includes/comment-wrangler" aid="{author_id}" eid="{entry_id}"}\n	{/exp:channel:entries}\n{/if}\n\n\n{if logged_out}\n<h1>Log in to comment</h1>\n{exp:member:login_form return="{segment_1}/{segment_2}"}\n	<label class="stencil">Username</label><br />\n	<input type="text" name="username" value="" class="span-5 text"/> <br />\n	<label class="stencil">Password</label><br />\n	<input type="password" name="password" value="" class="span-5 text" /></p>\n	<p>\n		<input type="submit" name="submit" value="Login" />\n	</p>\n{/exp:member:login_form}\n{/if}\n\n\n{if logged_in}\n<a href="{path=''logout''}">Logout</a>\n	{exp:safecracker channel="comments" return="{segment_1}/{segment_2}"}\n		<input type="hidden" name="title" id="title" value="{segment_2}-" size="50" maxlength="100" onkeyup="liveUrlTitle();" />\n\n		<input type="hidden" name="comment_parent" id="comment_parent" value="{segment_2}" size="50" maxlength="100" />\n\n		<label for="video_url">Video URL</label><br />\n		{field:video_url}<br />\n		<label for="comment_body">Comment</label><br />\n		{field:comment_body}\n		<input type="submit" value="Submit" />\n	{/exp:safecracker}\n{/if}', NULL, 1314028740, 4, 'n', 0, '', 'n', 'n', 'o', 0),
(45, 1, 16, 'index', 'y', 'webpage', '<!DOCTYPE HTML">\n<html>\n	<head>\n		<title>Shop | 2nd Folio</title>\n		\n		{embed="includes/head"}\n		\n	</head>\n	<body>\n		{embed="includes/header"}\n		<div class="container">\n			<div class="page-top"></div>\n			<div class="page-mid">\n				<div class="span-24">\n					<div class="span-18">\n						{if logged_out}\n						<h1 class="stencil">Buy a 2nd Folio bout</h1>\n						<p class="intro">If you already have an account please log in <a href="{path="member/login"}">here</a>, otherwise please register <a href="{path="member/register"}">here</a>.</p>\n						{/if}\n						\n						{if logged_in}\n						{redirect="shop/subscriptions"}\n						{/if}\n					</div>\n				</div>\n				<div class="clear"></div>\n			</div>\n			<div class="page-bottom"></div>\n		</div>\n		{embed="includes/footer"}\n	</body>\n</html>', NULL, 1314351910, 4, 'n', 0, '', 'n', 'n', 'o', 82),
(46, 1, 16, 'subscriptions', 'y', 'webpage', '<!DOCTYPE HTML">\n<html>\n	<head>\n		<title>Subscriptions | 2nd Folio</title>\n		\n		{embed="includes/head"}\n		\n	</head>\n	<body>\n		{embed="includes/header"}\n		<div class="container">\n			<div class="page-top"></div>\n			<div class="page-mid">\n				<div class="span-24">\n					<div class="span-18">\n						{if logged_in}\n						<h1 class="stencil">Buy a 2nd Folio bout</h1>\n						<p class="intro">Click the button to buy a bout</p>\n						<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">\n							<input type="hidden" name="cmd" value="_s-xclick">\n							<input type="hidden" name="hosted_button_id" value="YHY53KUYETNA4">\n							<input type="image" src="https://www.sandbox.paypal.com/en_US/GB/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal — The safer, easier way to pay online.">\n							<img alt="" border="0" src="https://www.sandbox.paypal.com/en_GB/i/scr/pixel.gif" width="1" height="1">\n						</form>\n						{/if}\n						{if logged_out}\n						<h1 class="stencil">You are not logged in.</h1>\n						<p class="intro">If you already have an account please log in <a href="{path="member/login"}">here</a>, otherwise please register <a href="{path="member/register"}">here</a>.</p>\n						{/if}\n					</div>\n				</div>\n				<div class="clear"></div>\n			</div>\n			<div class="page-bottom"></div>\n		</div>\n		{embed="includes/footer"}\n	</body>\n</html>', '', 1314351910, 4, 'n', 0, '', 'n', 'n', 'o', 18),
(47, 1, 16, 'success', 'y', 'webpage', '<!DOCTYPE HTML">\n<html>\n	<head>\n		<title>Subscriptions | 2nd Folio</title>\n		\n		{embed="includes/head"}\n		\n	</head>\n	<body>\n		{embed="includes/header"}\n		<div class="container">\n			<div class="page-top"></div>\n			<div class="page-mid">\n				<div class="span-24">\n					<div class="span-18">\n						{if logged_in}\n						<h1 class="stencil">Thankyou for purchasing a 2nd Folio Bout.</h1>						<p class="intro">Your transaction has been completed, and a receipt for your purchase has been emailed to you. You may log into your account at <a href="www.paypal.com">www.paypal.com</a> to view details of this transaction.</p>\n						<!-- <p>typical string to expect: ?tx=6D799135RF871022Y&st=Completed&amt=300.00&cc=GBP&cm=&item_number=</p> -->\n						\n						\n						\n						\n						\n						{embed="includes/paypal_mailer"}\n						{/if}\n					</div>\n				</div>\n				<div class="clear"></div>\n			</div>\n			<div class="page-bottom"></div>\n		</div>\n		{embed="includes/footer"}\n	</body>\n</html>\n', '', 1314351910, 4, 'n', 0, '', 'n', 'n', 'o', 9),
(49, 1, 10, 'paypal_mailer', 'y', 'webpage', '{exp:email_from_template to="josh@supercooldesign.co.uk" from="webmaster@2ndfolio.local" subject="2nd Folio Bout Payment" echo="off"}\n	{screen_name} has just bought a Bout through PayPal.\n	\n	Username: {username}\n	Member ID: {member_id}\n	Member group: {member_group}\n	Amount: {exp:get_post_var type=''get'' var=''amt''} {exp:get_post_var type=''get'' var=''cc''}\n	Transaction ID: {exp:get_post_var type=''get'' var=''tx''}\n	\n	Thanks,\n	\n	Your friendly Shakesperian Robot\n{/exp:email_from_template}', '', 1314351910, 4, 'n', 0, '', 'n', 'n', 'o', 0),
(50, 1, 17, 'index', 'y', 'webpage', '<!DOCTYPE HTML">\n<html>\n	<head>\n		<title>My Account | 2nd Folio</title>\n		\n		{embed="includes/head"}\n		\n	</head>\n	<body>\n		{embed="includes/header"}\n		<div class="container">\n			<div class="page-top"></div>\n			<div class="page-mid">\n				<div class="span-24">\n					<div class="span-18">\n						{if logged_in}\n						<h1 class="stencil">Hi {screen_name}</h1>\n						<p class="intro"><a href="{path="shop/subscriptions"}">buy another subscription</a> | <a href="{path="member/profile"}">manage profile</a></p>\n\n						<h2>Your Profile</h2>\n						<p>pull our profile stuff here</p>\n\n						<h2>Bout Info</h2>\n						<p>pull our bout info from category here</p>\n						{exp:member_categories:categories limit="1"}\n							<h4>{category_name}</h4>\n							<p>{category_description}</p>\n						{/exp:member_categories:categories}\n\n\n						<h2>Teams</h2>\n						<p>pull out all current teams created by this member, plus links to edit, delete and make a new one</p>\n						{/if}\n						{if logged_out}\n						<h1 class="stencil">You are not logged in.</h1>\n						<p class="intro">If you already have an account please log in <a href="{path="member/login"}">here</a>, otherwise please register <a href="{path="member/register"}">here</a>.</p>\n						{/if}\n					</div>\n				</div>\n				<div class="clear"></div>\n			</div>\n			<div class="page-bottom"></div>\n		</div>\n		{embed="includes/footer"}\n	</body>\n</html>', '', 1314351910, 4, 'n', 0, '', 'n', 'n', 'o', 38),
(51, 1, 10, 'ajax-team-info', 'y', 'webpage', 'ss', '', 1314373755, 4, 'n', 0, '', 'n', 'n', 'o', 9),
(52, 1, 18, 'index', 'y', 'webpage', '<!DOCTYPE HTML">\n<html>\n	<head>\n		<title>Login | 2nd Folio</title>\n		\n		{embed="includes/head"}\n		\n	</head>\n	<body>\n		{embed="includes/header"}\n		<div class="container">\n			<div class="page-top"></div>\n			<div class="page-mid">\n				<div class="span-24">\n					<div class="span-18">\n						{if logged_out}\n						{exp:member:login_form return="my-account"}\n							<label class="stencil">Username</label><br />\n							<input type="text" name="username" value="" class="span-5 text"/> <br />\n							<label class="stencil">Password</label><br />\n							<input type="password" name="password" value="" class="span-5 text" /></p>\n							<p>\n								<input type="submit" name="submit" value="Login" />\n							</p>\n						{/exp:member:login_form}\n						{/if}\n						{if logged_in}\n						{redirect="my-account"}\n						{/if}\n					</div>\n				</div>\n				<div class="clear"></div>\n			</div>\n			<div class="page-bottom"></div>\n		</div>\n		{embed="includes/footer"}\n	</body>\n</html>', NULL, 1316085461, 1, 'n', 0, '', 'n', 'n', 'o', 106);

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_groups`
--

CREATE TABLE `exp_template_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `group_order` int(3) unsigned NOT NULL,
  `is_site_default` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`),
  KEY `group_name_idx` (`group_name`),
  KEY `group_order_idx` (`group_order`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `exp_template_groups`
--

INSERT INTO `exp_template_groups` (`group_id`, `site_id`, `group_name`, `group_order`, `is_site_default`) VALUES
(4, 1, 'about', 2, 'n'),
(3, 1, 'home', 1, 'y'),
(5, 1, 'rules', 3, 'n'),
(6, 1, 'submit', 4, 'n'),
(7, 1, 'characters', 5, 'n'),
(8, 1, 'tasks', 6, 'n'),
(9, 1, 'quotes', 7, 'n'),
(10, 1, 'includes', 8, 'n'),
(11, 1, 'league', 9, 'n'),
(12, 1, 'cards', 10, 'n'),
(13, 1, 'qr', 11, 'n'),
(14, 1, 'search', 12, 'n'),
(15, 1, 'search', 13, 'n'),
(16, 1, 'shop', 14, 'n'),
(17, 1, 'my-account', 15, 'n'),
(18, 1, 'login', 16, 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_member_groups`
--

CREATE TABLE `exp_template_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `template_group_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`template_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_no_access`
--

CREATE TABLE `exp_template_no_access` (
  `template_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`template_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_throttle`
--

CREATE TABLE `exp_throttle` (
  `throttle_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL,
  `locked_out` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`throttle_id`),
  KEY `ip_address` (`ip_address`),
  KEY `last_activity` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_upload_no_access`
--

CREATE TABLE `exp_upload_no_access` (
  `upload_id` int(6) unsigned NOT NULL,
  `upload_loc` varchar(3) NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`upload_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_upload_no_access`
--

INSERT INTO `exp_upload_no_access` (`upload_id`, `upload_loc`, `member_group`) VALUES
(1, 'cp', 6),
(2, 'cp', 6),
(3, 'cp', 6),
(1, 'cp', 7),
(2, 'cp', 7),
(3, 'cp', 7);

-- --------------------------------------------------------

--
-- Table structure for table `exp_upload_prefs`
--

CREATE TABLE `exp_upload_prefs` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `is_user_blog` char(1) NOT NULL DEFAULT 'n',
  `name` varchar(50) NOT NULL,
  `server_path` varchar(255) DEFAULT NULL,
  `url` varchar(100) NOT NULL,
  `allowed_types` varchar(3) NOT NULL DEFAULT 'img',
  `max_size` varchar(16) DEFAULT NULL,
  `max_height` varchar(6) DEFAULT NULL,
  `max_width` varchar(6) DEFAULT NULL,
  `properties` varchar(120) DEFAULT NULL,
  `pre_format` varchar(120) DEFAULT NULL,
  `post_format` varchar(120) DEFAULT NULL,
  `file_properties` varchar(120) DEFAULT NULL,
  `file_pre_format` varchar(120) DEFAULT NULL,
  `file_post_format` varchar(120) DEFAULT NULL,
  `batch_location` varchar(255) DEFAULT NULL,
  `cat_group` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `exp_upload_prefs`
--

INSERT INTO `exp_upload_prefs` (`id`, `site_id`, `is_user_blog`, `name`, `server_path`, `url`, `allowed_types`, `max_size`, `max_height`, `max_width`, `properties`, `pre_format`, `post_format`, `file_properties`, `file_pre_format`, `file_post_format`, `batch_location`, `cat_group`) VALUES
(1, 1, 'n', 'Main Upload Directory', '/hsphere/local/home/supercooldesign/2ndfolio.net/images/uploads/', '/images/uploads/', 'all', '', '', '', 'style="border: 0;" alt="image"', '', '', '', '', '', NULL, NULL),
(2, 1, 'n', 'Characters', '/hsphere/local/home/supercooldesign/2ndfolio.net/images/uploads/characters/', '/images/uploads/characters/', 'img', '', '', '', '', '', '', '', '', '', NULL, NULL),
(3, 1, 'n', 'QR Codes', '/hsphere/local/home/supercooldesign/2ndfolio.net/images/uploads/qr-codes/', '/images/uploads/qr-codes/', 'img', '', '', '', '', '', '', '', '', '', NULL, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
