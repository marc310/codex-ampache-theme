-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 06-Out-2019 às 13:24
-- Versão do servidor: 5.6.41-84.1
-- versão do PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mundo458_ampache`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `access_list`
--

CREATE TABLE `access_list` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `start` varbinary(255) NOT NULL,
  `end` varbinary(255) NOT NULL,
  `level` smallint(3) UNSIGNED NOT NULL DEFAULT '5',
  `type` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `user` int(11) NOT NULL,
  `enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `access_list`
--

INSERT INTO `access_list` (`id`, `name`, `start`, `end`, `level`, `type`, `user`, `enabled`) VALUES
(1, 'DEFAULTv4', 0x00000000, 0xffffffff, 75, 'interface', -1, 1),
(2, 'DEFAULTv4', 0x00000000, 0xffffffff, 75, 'stream', -1, 1),
(3, 'DEFAULTv4', 0x00000000, 0xffffffff, 75, 'rpc', -1, 1),
(4, 'DEFAULTv6', 0x00000000000000000000000000000000, 0xffffffffffffffff, 75, 'interface', -1, 1),
(5, 'DEFAULTv6', 0x00000000000000000000000000000000, 0xffffffffffffffff, 75, 'stream', -1, 1),
(6, 'DEFAULTv6', 0x00000000000000000000000000000000, 0xffffffffffffffff, 75, 'rpc', -1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `album`
--

CREATE TABLE `album` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `prefix` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `mbid` varchar(36) CHARACTER SET utf8 DEFAULT NULL,
  `year` int(4) UNSIGNED NOT NULL DEFAULT '1984',
  `disk` smallint(5) UNSIGNED DEFAULT NULL,
  `mbid_group` varchar(36) CHARACTER SET utf8 DEFAULT NULL,
  `release_type` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `album_artist` int(11) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `artist`
--

CREATE TABLE `artist` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `prefix` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `mbid` varchar(1369) CHARACTER SET utf8 DEFAULT NULL,
  `summary` text CHARACTER SET utf8,
  `placeformed` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `yearformed` int(4) DEFAULT NULL,
  `last_update` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user` int(11) DEFAULT NULL,
  `manual_update` smallint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bookmark`
--

CREATE TABLE `bookmark` (
  `id` int(11) UNSIGNED NOT NULL,
  `user` int(11) NOT NULL,
  `position` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `comment` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `object_type` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `creation_date` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `update_date` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `broadcast`
--

CREATE TABLE `broadcast` (
  `id` int(11) UNSIGNED NOT NULL,
  `user` int(11) UNSIGNED NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `is_private` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `song` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `started` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `listeners` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `key` varchar(32) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog`
--

CREATE TABLE `catalog` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `catalog_type` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `last_update` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `last_clean` int(11) UNSIGNED DEFAULT NULL,
  `last_add` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `rename_pattern` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sort_pattern` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `gather_types` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_local`
--

CREATE TABLE `catalog_local` (
  `id` int(11) UNSIGNED NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `catalog_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_remote`
--

CREATE TABLE `catalog_remote` (
  `id` int(11) UNSIGNED NOT NULL,
  `uri` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `catalog_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `channel`
--

CREATE TABLE `channel` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `url` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `interface` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `port` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `fixed_endpoint` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `object_type` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `is_private` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `random` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `loop` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `admin_password` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `start_date` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `max_listeners` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `peak_listeners` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `listeners` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `connections` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `stream_type` varchar(8) CHARACTER SET utf8 DEFAULT NULL,
  `bitrate` int(11) UNSIGNED NOT NULL DEFAULT '128',
  `pid` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `clip`
--

CREATE TABLE `clip` (
  `id` int(11) UNSIGNED NOT NULL,
  `artist` int(11) DEFAULT NULL,
  `song` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `daap_session`
--

CREATE TABLE `daap_session` (
  `id` int(11) UNSIGNED NOT NULL,
  `creationdate` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `democratic`
--

CREATE TABLE `democratic` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `cooldown` tinyint(4) UNSIGNED DEFAULT NULL,
  `level` tinyint(4) UNSIGNED NOT NULL DEFAULT '25',
  `user` int(11) NOT NULL,
  `primary` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `base_playlist` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `image`
--

CREATE TABLE `image` (
  `id` int(11) UNSIGNED NOT NULL,
  `image` mediumblob,
  `width` int(4) UNSIGNED DEFAULT '0',
  `height` int(4) UNSIGNED DEFAULT '0',
  `mime` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `size` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `object_type` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `kind` varchar(32) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_history`
--

CREATE TABLE `ip_history` (
  `id` int(11) UNSIGNED NOT NULL,
  `user` int(11) NOT NULL,
  `ip` varbinary(255) DEFAULT NULL,
  `date` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `agent` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `label`
--

CREATE TABLE `label` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `category` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `summary` text CHARACTER SET utf8,
  `address` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `website` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `user` int(11) UNSIGNED DEFAULT NULL,
  `creation_date` int(11) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `label_asso`
--

CREATE TABLE `label_asso` (
  `id` int(11) UNSIGNED NOT NULL,
  `label` int(11) UNSIGNED NOT NULL,
  `artist` int(11) UNSIGNED NOT NULL,
  `creation_date` int(11) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `license`
--

CREATE TABLE `license` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `external_link` varchar(256) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `license`
--

INSERT INTO `license` (`id`, `name`, `description`, `external_link`) VALUES
(1, '0 - default', NULL, ''),
(2, 'CC BY', NULL, 'https://creativecommons.org/licenses/by/3.0/'),
(3, 'CC BY NC', NULL, 'https://creativecommons.org/licenses/by-nc/3.0/'),
(4, 'CC BY NC ND', NULL, 'https://creativecommons.org/licenses/by-nc-nd/3.0/'),
(5, 'CC BY NC SA', NULL, 'https://creativecommons.org/licenses/by-nc-sa/3.0/'),
(6, 'CC BY ND', NULL, 'https://creativecommons.org/licenses/by-nd/3.0/'),
(7, 'CC BY SA', NULL, 'https://creativecommons.org/licenses/by-sa/3.0/'),
(8, 'Licence Art Libre', NULL, 'http://artlibre.org/licence/lal/'),
(9, 'Yellow OpenMusic', NULL, 'http://openmusic.linuxtag.org/yellow.html'),
(10, 'Green OpenMusic', NULL, 'http://openmusic.linuxtag.org/green.html'),
(11, 'Gnu GPL Art', NULL, 'http://gnuart.org/english/gnugpl.html'),
(12, 'WTFPL', NULL, 'https://en.wikipedia.org/wiki/WTFPL'),
(13, 'FMPL', NULL, 'http://www.fmpl.org/fmpl.html'),
(14, 'C Reaction', NULL, 'http://morne.free.fr/Necktar7/creaction.htm');

-- --------------------------------------------------------

--
-- Estrutura da tabela `live_stream`
--

CREATE TABLE `live_stream` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `site_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `url` varchar(4096) CHARACTER SET utf8 DEFAULT NULL,
  `genre` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `catalog` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `codec` varchar(32) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `localplay_httpq`
--

CREATE TABLE `localplay_httpq` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `owner` int(11) NOT NULL,
  `host` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `port` int(11) UNSIGNED NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `access` smallint(4) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `localplay_mpd`
--

CREATE TABLE `localplay_mpd` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `owner` int(11) NOT NULL,
  `host` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `port` int(11) UNSIGNED NOT NULL DEFAULT '6600',
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `access` smallint(4) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `localplay_shoutcast`
--

CREATE TABLE `localplay_shoutcast` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `owner` int(11) NOT NULL,
  `pid` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `playlist` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `local_root` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `access` smallint(4) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `metadata`
--

CREATE TABLE `metadata` (
  `id` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `field` int(11) UNSIGNED NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(50) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `metadata_field`
--

CREATE TABLE `metadata_field` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `public` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `movie`
--

CREATE TABLE `movie` (
  `id` int(11) UNSIGNED NOT NULL,
  `original_name` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `summary` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `year` int(11) UNSIGNED DEFAULT NULL,
  `prefix` varchar(32) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `now_playing`
--

CREATE TABLE `now_playing` (
  `id` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `object_id` int(11) UNSIGNED NOT NULL,
  `object_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `user` int(11) NOT NULL,
  `expire` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `insertion` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `object_count`
--

CREATE TABLE `object_count` (
  `id` int(11) UNSIGNED NOT NULL,
  `object_type` enum('album','artist','song','playlist','genre','catalog','live_stream','video','podcast_episode') CHARACTER SET utf8 DEFAULT NULL,
  `object_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `date` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user` int(11) NOT NULL,
  `agent` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `geo_latitude` decimal(10,6) DEFAULT NULL,
  `geo_longitude` decimal(10,6) DEFAULT NULL,
  `geo_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `count_type` varchar(16) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `personal_video`
--

CREATE TABLE `personal_video` (
  `id` int(11) UNSIGNED NOT NULL,
  `location` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `summary` varchar(256) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_control`
--

CREATE TABLE `player_control` (
  `id` int(11) UNSIGNED NOT NULL,
  `user` int(11) UNSIGNED NOT NULL,
  `cmd` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `value` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `object_type` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `send_date` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `playlist`
--

CREATE TABLE `playlist` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `type` enum('private','public') CHARACTER SET utf8 DEFAULT NULL,
  `date` int(11) UNSIGNED NOT NULL,
  `last_update` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `playlist_data`
--

CREATE TABLE `playlist_data` (
  `id` int(11) UNSIGNED NOT NULL,
  `playlist` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `object_id` int(11) UNSIGNED DEFAULT NULL,
  `object_type` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `track` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `podcast`
--

CREATE TABLE `podcast` (
  `id` int(11) UNSIGNED NOT NULL,
  `feed` varchar(4096) CHARACTER SET utf8 DEFAULT NULL,
  `catalog` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(4096) CHARACTER SET utf8 DEFAULT NULL,
  `language` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `copyright` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `generator` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `lastbuilddate` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `lastsync` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `podcast_episode`
--

CREATE TABLE `podcast_episode` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `guid` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `podcast` int(11) NOT NULL,
  `state` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `file` varchar(4096) CHARACTER SET utf8 DEFAULT NULL,
  `source` varchar(4096) CHARACTER SET utf8 DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `time` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `website` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(4096) CHARACTER SET utf8 DEFAULT NULL,
  `author` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `category` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `played` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `pubdate` int(11) UNSIGNED NOT NULL,
  `addition_time` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `preference`
--

CREATE TABLE `preference` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `level` int(11) UNSIGNED NOT NULL DEFAULT '100',
  `type` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `catagory` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `subcatagory` varchar(128) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `preference`
--

INSERT INTO `preference` (`id`, `name`, `value`, `description`, `level`, `type`, `catagory`, `subcatagory`) VALUES
(1, 'download', '1', 'Allow Downloads', 100, 'boolean', 'options', 'feature'),
(4, 'popular_threshold', '10', 'Popular Threshold', 25, 'integer', 'interface', 'query'),
(19, 'transcode_bitrate', '64', 'Transcode Bitrate', 25, 'string', 'streaming', 'transcoding'),
(22, 'site_title', 'Ampache :: For the love of Music', 'Website Title', 100, 'string', 'interface', 'custom'),
(23, 'lock_songs', '0', 'Lock Songs', 100, 'boolean', 'system', NULL),
(24, 'force_http_play', '0', 'Forces Http play regardless of port', 100, 'boolean', 'system', NULL),
(41, 'localplay_controller', '0', 'Localplay Type', 100, 'special', 'options', 'localplay'),
(29, 'play_type', 'web_player', 'Type of Playback', 25, 'special', 'streaming', NULL),
(31, 'lang', 'fr_FR', 'Language', 100, 'special', 'interface', NULL),
(32, 'playlist_type', 'm3u', 'Playlist Type', 100, 'special', 'playlist', NULL),
(33, 'theme_name', 'reborn', 'Theme', 5, 'special', 'interface', 'theme'),
(51, 'offset_limit', '50', 'Offset Limit', 5, 'integer', 'interface', 'query'),
(40, 'localplay_level', '0', 'Localplay Access', 100, 'special', 'options', 'localplay'),
(44, 'allow_stream_playback', '1', 'Allow Streaming', 100, 'boolean', 'options', 'feature'),
(45, 'allow_democratic_playback', '0', 'Allow Democratic Play', 100, 'boolean', 'options', 'feature'),
(46, 'allow_localplay_playback', '0', 'Allow Localplay Play', 100, 'boolean', 'options', 'localplay'),
(47, 'stats_threshold', '7', 'Statistics Day Threshold', 25, 'integer', 'interface', 'query'),
(52, 'rate_limit', '8192', 'Rate Limit', 100, 'integer', 'streaming', 'transcoding'),
(53, 'playlist_method', 'default', 'Playlist Method', 5, 'string', 'playlist', NULL),
(55, 'transcode', 'default', 'Transcoding', 25, 'string', 'streaming', 'transcoding'),
(69, 'show_lyrics', '0', 'Show Lyrics', 5, 'boolean', 'interface', 'player'),
(70, 'mpd_active', '0', 'MPD Active Instance', 25, 'integer', 'internal', 'mpd'),
(71, 'httpq_active', '0', 'HTTPQ Active Instance', 25, 'integer', 'internal', 'httpq'),
(72, 'shoutcast_active', '0', 'Shoutcast Active Instance', 25, 'integer', 'internal', 'shoutcast'),
(77, 'lastfm_grant_link', '', 'Last.FM Grant URL', 25, 'string', 'internal', 'lastfm'),
(78, 'lastfm_challenge', '', 'Last.FM Submit Challenge', 25, 'string', 'internal', 'lastfm'),
(102, 'share', '0', 'Allow Share', 100, 'boolean', 'options', 'feature'),
(123, 'ajax_load', '1', 'Ajax page load', 25, 'boolean', 'interface', NULL),
(82, 'now_playing_per_user', '1', 'Now playing filtered per user', 50, 'boolean', 'interface', 'home'),
(83, 'album_sort', '0', 'Album Default Sort', 25, 'string', 'interface', 'library'),
(84, 'show_played_times', '0', 'Show # played', 25, 'string', 'interface', 'library'),
(85, 'song_page_title', '1', 'Show current song in Web player page title', 25, 'boolean', 'interface', 'player'),
(86, 'subsonic_backend', '1', 'Use SubSonic backend', 100, 'boolean', 'system', 'backend'),
(87, 'plex_backend', '0', 'Use Plex backend', 100, 'boolean', 'system', 'backend'),
(88, 'webplayer_flash', '1', 'Authorize Flash Web Player(s)', 25, 'boolean', 'streaming', 'player'),
(89, 'webplayer_html5', '1', 'Authorize HTML5 Web Player(s)', 25, 'boolean', 'streaming', 'player'),
(90, 'allow_personal_info_now', '1', 'Personal information visibility - Now playing', 25, 'boolean', 'interface', 'privacy'),
(91, 'allow_personal_info_recent', '1', 'Personal information visibility - Recently played', 25, 'boolean', 'interface', 'privacy'),
(92, 'allow_personal_info_time', '1', 'Personal information visibility - Recently played - Allow to show streaming date/time', 25, 'boolean', 'interface', 'privacy'),
(93, 'allow_personal_info_agent', '1', 'Personal information visibility - Recently played - Allow to show streaming agent', 25, 'boolean', 'interface', 'privacy'),
(94, 'ui_fixed', '0', 'Fix header position on compatible themes', 25, 'boolean', 'interface', 'theme'),
(95, 'autoupdate', '1', 'Check for Ampache updates automatically', 25, 'boolean', 'system', 'update'),
(96, 'autoupdate_lastcheck', '', 'AutoUpdate last check time', 25, 'string', 'internal', 'update'),
(97, 'autoupdate_lastversion', '', 'AutoUpdate last version from last check', 25, 'string', 'internal', 'update'),
(98, 'autoupdate_lastversion_new', '', 'AutoUpdate last version from last check is newer', 25, 'boolean', 'internal', 'update'),
(99, 'webplayer_confirmclose', '0', 'Confirmation when closing current playing window', 25, 'boolean', 'interface', 'player'),
(100, 'webplayer_pausetabs', '1', 'Auto-pause betweens tabs', 25, 'boolean', 'interface', 'player'),
(101, 'stream_beautiful_url', '0', 'Enable url rewriting', 100, 'boolean', 'streaming', NULL),
(103, 'share_expire', '7', 'Share links default expiration days (0=never)', 100, 'integer', 'system', 'share'),
(104, 'slideshow_time', '0', 'Artist slideshow inactivity time', 25, 'integer', 'interface', 'player'),
(105, 'broadcast_by_default', '0', 'Broadcast web player by default', 25, 'boolean', 'streaming', 'player'),
(106, 'concerts_limit_future', '0', 'Limit number of future events', 25, 'integer', 'interface', 'query'),
(107, 'concerts_limit_past', '0', 'Limit number of past events', 25, 'integer', 'interface', 'query'),
(108, 'album_group', '0', 'Album - Group multiple disks', 25, 'boolean', 'interface', 'library'),
(109, 'topmenu', '0', 'Top menu', 25, 'boolean', 'interface', 'theme'),
(110, 'demo_clear_sessions', '0', 'Clear democratic votes of expired user sessions', 25, 'boolean', 'playlist', NULL),
(111, 'show_donate', '1', 'Show donate button in footer', 25, 'boolean', 'interface', NULL),
(112, 'upload_catalog', '-1', 'Uploads catalog destination', 75, 'integer', 'system', 'upload'),
(113, 'allow_upload', '0', 'Allow users to upload media', 75, 'boolean', 'system', 'upload'),
(114, 'upload_subdir', '1', 'Upload: create a subdirectory per user (recommended)', 75, 'boolean', 'system', 'upload'),
(115, 'upload_user_artist', '0', 'Upload: consider the user sender as the track\'s artist', 75, 'boolean', 'system', 'upload'),
(116, 'upload_script', '', 'Upload: run the following script after upload (current directory = upload target directory)', 75, 'string', 'system', 'upload'),
(117, 'upload_allow_edit', '1', 'Upload: allow users to edit uploaded songs', 75, 'boolean', 'system', 'upload'),
(118, 'daap_backend', '0', 'Use DAAP backend', 100, 'boolean', 'system', 'backend'),
(119, 'daap_pass', '', 'DAAP backend password', 100, 'string', 'system', 'backend'),
(120, 'upnp_backend', '0', 'Use UPnP backend', 100, 'boolean', 'system', 'backend'),
(121, 'allow_video', '1', 'Allow video features', 75, 'integer', 'options', 'feature'),
(122, 'album_release_type', '1', 'Album - Group per release type', 25, 'boolean', 'interface', 'library'),
(124, 'direct_play_limit', '0', 'Limit direct play to maximum media count', 25, 'integer', 'interface', 'player'),
(125, 'home_moment_albums', '1', 'Show Albums of the moment at home page', 25, 'integer', 'interface', 'home'),
(126, 'home_moment_videos', '1', 'Show Videos of the moment at home page', 25, 'integer', 'interface', 'home'),
(127, 'home_recently_played', '1', 'Show Recently Played at home page', 25, 'integer', 'interface', 'home'),
(128, 'home_now_playing', '1', 'Show Now Playing at home page', 25, 'integer', 'interface', 'home'),
(129, 'custom_logo', '', 'Custom logo url', 25, 'string', 'interface', 'custom'),
(130, 'album_release_type_sort', 'album,ep,live,single', 'Album - Group per release type Sort', 25, 'string', 'interface', 'library'),
(131, 'browser_notify', '1', 'WebPlayer browser notifications', 25, 'integer', 'interface', 'notification'),
(132, 'browser_notify_timeout', '10', 'WebPlayer browser notifications timeout (seconds)', 25, 'integer', 'interface', 'notification'),
(133, 'geolocation', '0', 'Allow geolocation', 25, 'integer', 'options', 'feature'),
(134, 'webplayer_aurora', '1', 'Authorize JavaScript decoder (Aurora.js) in Web Player(s)', 25, 'boolean', 'streaming', 'player'),
(135, 'upload_allow_remove', '1', 'Upload: allow users to remove uploaded songs', 75, 'boolean', 'system', 'upload'),
(136, 'custom_login_logo', '', 'Custom login page logo url', 75, 'string', 'interface', 'custom'),
(137, 'custom_favicon', '', 'Custom favicon url', 75, 'string', 'interface', 'custom'),
(138, 'custom_text_footer', '', 'Custom text footer', 75, 'string', 'interface', 'custom'),
(139, 'webdav_backend', '0', 'Use WebDAV backend', 100, 'boolean', 'system', 'backend'),
(140, 'notify_email', '0', 'Receive notifications by email (shouts, private messages, ...)', 25, 'boolean', 'options', NULL),
(141, 'theme_color', 'dark', 'Theme color', 5, 'special', 'interface', 'theme'),
(142, 'disabled_custom_metadata_fields', '', 'Disable custom metadata fields (ctrl / shift click to select multiple)', 100, 'string', 'system', 'metadata'),
(143, 'disabled_custom_metadata_fields_input', '', 'Disable custom metadata fields. Insert them in a comma separated list. They will add to the fields selected above.', 100, 'string', 'system', 'metadata'),
(144, 'podcast_keep', '10', 'Podcast: # latest episodes to keep', 100, 'integer', 'system', 'podcast'),
(145, 'podcast_new_download', '1', 'Podcast: # episodes to download when new episodes are available', 100, 'integer', 'system', 'podcast'),
(146, 'libitem_contextmenu', '1', 'Library item context menu', 5, 'boolean', 'interface', 'library'),
(147, 'upload_catalog_pattern', '0', 'Rename uploaded file according to catalog pattern', 100, 'boolean', 'system', 'upload'),
(148, 'catalog_check_duplicate', '0', 'Check library item at import time and don\'t import duplicates', 100, 'boolean', 'system', 'catalog'),
(149, 'browse_filter', '1', 'Show filter box on browse', 25, 'boolean', 'interface', 'library'),
(150, 'sidebar_light', '0', 'Light sidebar by default', 25, 'boolean', 'interface', 'theme'),
(151, 'custom_blankalbum', '', 'Custom blank album default image', 75, 'string', 'interface', 'custom'),
(152, 'custom_blankmovie', '', 'Custom blank video default image', 75, 'string', 'interface', 'custom'),
(153, 'libitem_browse_alpha', '', 'Alphabet browsing by default for following library items (album,artist,...)', 75, 'string', 'interface', 'library');

-- --------------------------------------------------------

--
-- Estrutura da tabela `rating`
--

CREATE TABLE `rating` (
  `id` int(11) UNSIGNED NOT NULL,
  `user` int(11) NOT NULL,
  `object_type` enum('artist','album','song','stream','video','playlist','tvshow','tvshow_season','podcast','podcast_episode') CHARACTER SET utf8 DEFAULT NULL,
  `object_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `rating` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `rating`
--

INSERT INTO `rating` (`id`, `user`, `object_type`, `object_id`, `rating`) VALUES
(46, -1, 'song', 5110, 5),
(45, -1, 'song', 5109, 5),
(44, -1, 'song', 5108, 5),
(43, -1, 'song', 5107, 5),
(42, -1, 'song', 5106, 5),
(41, -1, 'song', 5105, 5),
(40, -1, 'song', 5104, 5),
(39, -1, 'song', 5103, 5),
(38, -1, 'song', 5102, 5),
(37, -1, 'song', 5101, 5),
(36, -1, 'song', 5100, 5),
(35, -1, 'song', 5099, 5),
(34, -1, 'song', 5098, 5),
(47, -1, 'song', 5111, 5),
(48, -1, 'song', 5112, 5),
(49, -1, 'song', 5113, 5),
(50, -1, 'song', 5114, 5),
(51, -1, 'song', 5115, 5),
(52, -1, 'song', 5116, 5),
(53, -1, 'song', 5117, 5),
(54, -1, 'song', 5118, 5),
(55, -1, 'song', 5119, 5),
(56, -1, 'song', 5120, 5),
(57, -1, 'song', 5121, 5),
(58, -1, 'song', 5122, 5),
(59, -1, 'song', 5123, 5),
(60, -1, 'song', 5124, 5),
(61, -1, 'song', 5125, 5),
(62, -1, 'song', 5126, 5),
(63, -1, 'song', 5127, 5),
(64, -1, 'song', 5128, 5),
(65, -1, 'song', 5129, 5),
(66, -1, 'song', 5130, 5),
(67, -1, 'song', 5131, 5),
(68, -1, 'song', 5132, 5),
(69, -1, 'song', 5133, 5),
(70, -1, 'song', 5134, 5),
(71, -1, 'song', 5135, 5),
(72, -1, 'song', 5136, 5),
(73, -1, 'song', 5137, 5),
(74, -1, 'song', 5138, 5),
(75, -1, 'song', 5139, 5),
(76, -1, 'song', 5140, 5),
(77, -1, 'song', 5141, 5),
(78, -1, 'song', 5142, 5),
(79, -1, 'song', 5143, 5),
(80, -1, 'song', 5144, 5),
(81, -1, 'song', 5145, 5),
(82, -1, 'song', 5146, 5),
(83, -1, 'song', 5147, 5),
(84, -1, 'song', 5148, 5),
(85, -1, 'song', 5149, 5),
(86, -1, 'song', 5150, 5),
(87, -1, 'song', 5151, 5),
(88, -1, 'song', 5152, 5),
(89, -1, 'song', 5153, 5),
(146, -1, 'song', 6622, 5),
(147, -1, 'song', 6623, 5),
(148, -1, 'song', 6624, 5),
(149, -1, 'song', 6625, 5),
(150, -1, 'song', 6626, 5),
(151, -1, 'song', 6627, 5),
(152, -1, 'song', 6628, 5),
(153, -1, 'song', 6629, 5),
(154, -1, 'song', 6630, 5),
(155, -1, 'song', 6641, 5),
(156, -1, 'song', 6642, 5),
(157, -1, 'song', 6643, 5),
(158, -1, 'song', 6644, 5),
(159, -1, 'song', 6645, 5),
(160, -1, 'song', 6646, 5),
(161, -1, 'song', 6647, 5),
(162, -1, 'song', 6648, 5),
(163, -1, 'song', 6649, 5),
(164, -1, 'song', 6650, 5),
(165, -1, 'song', 6651, 5),
(166, -1, 'song', 6652, 5),
(167, -1, 'song', 6653, 5),
(168, -1, 'song', 6654, 5),
(169, -1, 'song', 6655, 5),
(170, -1, 'song', 6656, 5),
(171, -1, 'song', 6657, 5),
(172, -1, 'song', 6658, 5),
(173, -1, 'song', 6659, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `recommendation`
--

CREATE TABLE `recommendation` (
  `id` int(11) UNSIGNED NOT NULL,
  `object_type` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `last_update` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `recommendation_item`
--

CREATE TABLE `recommendation_item` (
  `id` int(11) UNSIGNED NOT NULL,
  `recommendation` int(11) UNSIGNED NOT NULL,
  `recommendation_id` int(11) UNSIGNED DEFAULT NULL,
  `name` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `rel` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `mbid` varchar(1369) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `search`
--

CREATE TABLE `search` (
  `id` int(11) UNSIGNED NOT NULL,
  `user` int(11) NOT NULL,
  `type` enum('private','public') CHARACTER SET utf8 DEFAULT NULL,
  `rules` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `logic_operator` varchar(3) CHARACTER SET utf8 DEFAULT NULL,
  `random` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `limit` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `session`
--

CREATE TABLE `session` (
  `id` varchar(256) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `username` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `expire` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ip` varbinary(255) DEFAULT NULL,
  `type` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `agent` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `geo_latitude` decimal(10,6) DEFAULT NULL,
  `geo_longitude` decimal(10,6) DEFAULT NULL,
  `geo_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `session`
--

INSERT INTO `session` (`id`, `username`, `expire`, `value`, `ip`, `type`, `agent`, `geo_latitude`, `geo_longitude`, `geo_name`) VALUES
('c5d4fa814f8b7fbcab141cb2fbf636f8', 'codex', 1570382667, 'userdata|a:5:{s:7:\"success\";b:1;s:4:\"type\";s:5:\"mysql\";s:8:\"username\";s:5:\"codex\";s:3:\"uid\";i:1;s:11:\"preferences\";a:100:{s:8:\"download\";s:1:\"1\";s:17:\"popular_threshold\";s:2:\"10\";s:17:\"transcode_bitrate\";s:2:\"32\";s:10:\"site_title\";s:49:\"CodeXMusic :: Para quem é Apaixonado por Música\";s:10:\"lock_songs\";N;s:15:\"force_http_play\";N;s:20:\"localplay_controller\";s:3:\"mpd\";s:9:\"play_type\";s:10:\"web_player\";s:4:\"lang\";s:5:\"pt_BR\";s:13:\"playlist_type\";s:3:\"m3u\";s:10:\"theme_name\";s:6:\"reborn\";s:12:\"offset_limit\";s:2:\"50\";s:15:\"localplay_level\";s:3:\"100\";s:21:\"allow_stream_playback\";s:1:\"1\";s:25:\"allow_democratic_playback\";s:1:\"1\";s:24:\"allow_localplay_playback\";s:1:\"1\";s:15:\"stats_threshold\";s:1:\"7\";s:10:\"rate_limit\";s:4:\"8192\";s:15:\"playlist_method\";s:7:\"default\";s:9:\"transcode\";s:7:\"default\";s:11:\"show_lyrics\";s:1:\"0\";s:10:\"mpd_active\";s:1:\"0\";s:12:\"httpq_active\";s:1:\"0\";s:16:\"shoutcast_active\";s:1:\"0\";s:17:\"lastfm_grant_link\";s:0:\"\";s:16:\"lastfm_challenge\";s:0:\"\";s:5:\"share\";s:1:\"0\";s:9:\"ajax_load\";s:1:\"1\";s:20:\"now_playing_per_user\";s:1:\"1\";s:10:\"album_sort\";s:7:\"default\";s:17:\"show_played_times\";s:1:\"1\";s:15:\"song_page_title\";s:1:\"1\";s:16:\"subsonic_backend\";s:1:\"1\";s:12:\"plex_backend\";N;s:15:\"webplayer_flash\";s:1:\"1\";s:15:\"webplayer_html5\";s:1:\"1\";s:23:\"allow_personal_info_now\";s:1:\"1\";s:26:\"allow_personal_info_recent\";s:1:\"1\";s:24:\"allow_personal_info_time\";s:1:\"1\";s:25:\"allow_personal_info_agent\";s:1:\"1\";s:8:\"ui_fixed\";s:1:\"0\";s:10:\"autoupdate\";s:1:\"1\";s:20:\"autoupdate_lastcheck\";s:10:\"1570376078\";s:22:\"autoupdate_lastversion\";s:17:\"5.0.0-pre-release\";s:26:\"autoupdate_lastversion_new\";s:1:\"1\";s:22:\"webplayer_confirmclose\";s:1:\"1\";s:19:\"webplayer_pausetabs\";s:1:\"1\";s:20:\"stream_beautiful_url\";s:1:\"0\";s:12:\"share_expire\";s:1:\"7\";s:14:\"slideshow_time\";s:1:\"0\";s:20:\"broadcast_by_default\";s:1:\"0\";s:21:\"concerts_limit_future\";s:1:\"0\";s:19:\"concerts_limit_past\";s:1:\"0\";s:11:\"album_group\";s:1:\"0\";s:7:\"topmenu\";s:1:\"0\";s:19:\"demo_clear_sessions\";s:1:\"0\";s:11:\"show_donate\";s:1:\"1\";s:14:\"upload_catalog\";s:2:\"-1\";s:12:\"allow_upload\";N;s:13:\"upload_subdir\";s:1:\"1\";s:18:\"upload_user_artist\";N;s:13:\"upload_script\";N;s:17:\"upload_allow_edit\";s:1:\"1\";s:12:\"daap_backend\";N;s:9:\"daap_pass\";N;s:12:\"upnp_backend\";N;s:11:\"allow_video\";s:1:\"1\";s:18:\"album_release_type\";s:1:\"1\";s:17:\"direct_play_limit\";s:1:\"0\";s:18:\"home_moment_albums\";s:1:\"1\";s:18:\"home_moment_videos\";s:1:\"1\";s:20:\"home_recently_played\";s:1:\"1\";s:16:\"home_now_playing\";s:1:\"1\";s:11:\"custom_logo\";s:0:\"\";s:23:\"album_release_type_sort\";s:20:\"album,ep,live,single\";s:14:\"browser_notify\";s:1:\"1\";s:22:\"browser_notify_timeout\";s:2:\"10\";s:11:\"geolocation\";s:1:\"0\";s:16:\"webplayer_aurora\";s:1:\"1\";s:19:\"upload_allow_remove\";s:1:\"1\";s:17:\"custom_login_logo\";s:0:\"\";s:14:\"custom_favicon\";s:0:\"\";s:18:\"custom_text_footer\";s:0:\"\";s:14:\"webdav_backend\";N;s:12:\"notify_email\";s:1:\"0\";s:11:\"theme_color\";s:4:\"dark\";s:31:\"disabled_custom_metadata_fields\";N;s:37:\"disabled_custom_metadata_fields_input\";N;s:12:\"podcast_keep\";s:2:\"10\";s:20:\"podcast_new_download\";s:1:\"1\";s:19:\"libitem_contextmenu\";s:1:\"1\";s:22:\"upload_catalog_pattern\";N;s:23:\"catalog_check_duplicate\";N;s:13:\"browse_filter\";s:1:\"1\";s:13:\"sidebar_light\";s:1:\"0\";s:17:\"custom_blankalbum\";s:0:\"\";s:17:\"custom_blankmovie\";s:0:\"\";s:20:\"libitem_browse_alpha\";s:0:\"\";s:10:\"theme_path\";s:14:\"/themes/reborn\";s:14:\"theme_css_base\";a:1:{i:0;a:2:{i:0;s:11:\"default.css\";i:1;s:6:\"screen\";}}}}art_enabled|b:1;login|b:0;state|a:1:{s:11:\"sidebar_tab\";s:5:\"admin\";}catalog|i:0;forms|a:54:{s:32:\"fcf384f8a9842416625636946e8325a4\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570375982;}s:32:\"ca26a7507bd10f8d53fc291550aff275\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570376086;}s:32:\"8c0148d07f520a158abad5f734aeb3df\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570376104;}s:32:\"a7fa281956893ffd29f0c67112cd9771\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570376190;}s:32:\"90aeaec9d50cac6da6eb176d4c162d40\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570376203;}s:32:\"1a148338d94c87a108f7c31da5a5ab20\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570376302;}s:32:\"fee5a0eff33ad655fbb8bcba2c31f86b\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570376316;}s:32:\"1d0af32e24579e995c25fef6e1f1b53d\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570376330;}s:32:\"1ad53433b5af77f280415eab4bdfac70\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570376398;}s:32:\"c1618f3e94d980aee98dd8ae6a26674e\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570376414;}s:32:\"7822819c94ecaeed01c0792e8a591130\";a:2:{s:4:\"name\";s:14:\"delete_catalog\";s:6:\"expire\";i:1570376465;}s:32:\"1ddea92febfad6c2443e0b828fd06341\";a:2:{s:4:\"name\";s:11:\"add_catalog\";s:6:\"expire\";i:1570376598;}s:32:\"6ada09aef27aa8a183e02cad3eb5ac0e\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570376833;}s:32:\"2df0ede50c88ee460e65dcd4da24e28d\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570376847;}s:32:\"38d38ce0da2302245b4c0b29c57b481a\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570376861;}s:32:\"97cb51aa60d3d1a99bf4d59f9e850f6a\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570376874;}s:32:\"c371a790183a881d5861b460a8dc98ef\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570376889;}s:32:\"5ee5b14844b35efdb104c0d653034308\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570377016;}s:32:\"b51e0529a81593bbc6a145db3feb4c9c\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570377039;}s:32:\"023bf188043ad0ce9a5d2a6297e551a8\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570377049;}s:32:\"5ec4b2ccc21484c55ef87cfaa7905a10\";a:2:{s:4:\"name\";s:11:\"add_catalog\";s:6:\"expire\";i:1570377078;}s:32:\"37d0bd2139a55b7c80160e07a412b4b2\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570377091;}s:32:\"4a23c9bc0b57c655e74261a0de526ffd\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570377113;}s:32:\"9e67f07db24095b6caa8aee6e0f7cbec\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570377121;}s:32:\"990ac05907a3700ed5b04c1ab286f4b8\";a:2:{s:4:\"name\";s:17:\"update_preference\";s:6:\"expire\";i:1570377296;}s:32:\"7b3893b45537b820af23832b4092069c\";a:2:{s:4:\"name\";s:17:\"update_preference\";s:6:\"expire\";i:1570377306;}s:32:\"5fa7857a4d65d2011a95b86de5ba40bd\";a:2:{s:4:\"name\";s:17:\"update_preference\";s:6:\"expire\";i:1570377328;}s:32:\"398189ed010214f985b1e285b458735a\";a:2:{s:4:\"name\";s:17:\"update_preference\";s:6:\"expire\";i:1570377331;}s:32:\"7195914764be75a6179e28902c55a13d\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570377379;}s:32:\"53b4233f1fef360e9898ebec3d852c73\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570377393;}s:32:\"eb655c3161cd298562340ecb0b8302d1\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570377414;}s:32:\"41f984981ee62ec22b2fb75a228c3665\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570377423;}s:32:\"5a7ac51fe393ad7ad5aa3eb5eed6dc3f\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570377438;}s:32:\"e94e754ae2fb5a73a476cbb37307021d\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570377446;}s:32:\"c7539bb93c8d5f5e0659bef3f7c87ae5\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570377456;}s:32:\"8df937d3a4b9901cc0ab0168eb527b48\";a:2:{s:4:\"name\";s:17:\"update_preference\";s:6:\"expire\";i:1570377490;}s:32:\"391a1498fb1dcacf9837b6efa107518a\";a:2:{s:4:\"name\";s:17:\"update_preference\";s:6:\"expire\";i:1570377697;}s:32:\"01be7db08cca6b66f55aa64abf751481\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570377789;}s:32:\"f1709b8e02f5ae92f72efec40a15d924\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570378367;}s:32:\"5047c2204c96c38004f2b3ec3614e31c\";a:2:{s:4:\"name\";s:17:\"update_preference\";s:6:\"expire\";i:1570378656;}s:32:\"9fa21fcb5596ed56d9ae312afb655b9e\";a:2:{s:4:\"name\";s:17:\"update_preference\";s:6:\"expire\";i:1570378684;}s:32:\"6a4fdda0521251b5cfdffd9dd1b27aa0\";a:2:{s:4:\"name\";s:17:\"update_preference\";s:6:\"expire\";i:1570380410;}s:32:\"5bc3a7d038567b87cd7b81288d5e13c0\";a:2:{s:4:\"name\";s:17:\"update_preference\";s:6:\"expire\";i:1570380534;}s:32:\"3de03a8bb36f8621fef78d4e2b689a95\";a:2:{s:4:\"name\";s:17:\"update_preference\";s:6:\"expire\";i:1570380995;}s:32:\"4c7128825d5efe0c4a1e8b4aa1d8afd2\";a:2:{s:4:\"name\";s:17:\"update_preference\";s:6:\"expire\";i:1570381540;}s:32:\"b57191ba8398e1c8524d6cbc659884be\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570381549;}s:32:\"7c873e321a54a4c4c82949bb9b740d8a\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570382146;}s:32:\"05f75d7f08be22606b609c650d45717e\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570382162;}s:32:\"d925f9fbd6e747ed6878f9e7a876d4ef\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570382261;}s:32:\"00efdda65f1ea88bf240cb7fc00e513d\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570382281;}s:32:\"04c78b8c103e1888df4f2293f686ccd7\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570382301;}s:32:\"520649fa84921d7ee2566bafea643c45\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570382365;}s:32:\"9883ad9d8d3c2531c9ec1501391fa833\";a:2:{s:4:\"name\";s:12:\"confirmation\";s:6:\"expire\";i:1570382371;}s:32:\"19d218cd36faf005e628d494dc5c2163\";a:2:{s:4:\"name\";s:17:\"update_preference\";s:6:\"expire\";i:1570382432;}}errors|a:1:{s:7:\"general\";s:49:\"Error: Defined Path is inside an existing catalog\";}browse_current_artist|a:1:{s:5:\"start\";i:150;}browse_current_album|a:1:{s:5:\"start\";i:100;}iframe|a:0:{}browse_current_song|a:1:{s:5:\"start\";i:0;}browse_current_playlist|a:1:{s:5:\"start\";i:0;}', 0xbf2753a4, 'mysql', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('6045f2f2636918d2c63a129c558342f6', '', 1570379458, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('4dcf121e89c12bafcae24f198d59484b', '', 1570379476, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('149a0b454fccd52dd12cba7e5ae0c871', '', 1570379505, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('42f9a5d69d1844a3379c400498061a57', '', 1570379541, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('dd7830afbaae600a30f0622746953f42', '', 1570379564, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('f842620bfc945e8ab05cda108703750e', '', 1570379582, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('9347da89934a1cf487d5a807064a3233', '', 1570379664, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('29f11c5780b1b10ccc977ea0a34d6854', '', 1570379686, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('28522f6bd10858fc00c7a344f4b221cb', '', 1570379694, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('cd31e62b7d07993aa87f5409b3f287bc', '', 1570379704, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('a599b5deec90a1f746d5888c2749a629', '', 1570379709, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('b4d535eb9e9b52f0c05b4a59ccb7c932', '', 1570379787, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('2412359b7dc2aa58a57d294c25221a9b', '', 1570379790, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('84685ba7ce6628a9ce319040e1d405d4', '', 1570379792, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('ae9488228a9fcb71eb211db52c1412c0', '', 1570379803, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('5acd7065895bb538e907136f690e8537', '', 1570379808, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('45a9ec352b80e15dc314ce7ec59bd6a3', '', 1570379853, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('a1616116d02497191ab22fb1a998a86e', '', 1570379902, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('fafc0816920745e527b5973d2648d8d2', '', 1570379907, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('5938c63678ec3d83a8c65fb2128b5e47', '', 1570379916, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('cc0b9b135a34b43cdec2250285cd4e3c', '', 1570379922, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('46b4f688fbce72d329673280cc9b7acb', '', 1570379930, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('43bf3e65d927987f3a423e252f038e98', 'codex', 1570383644, ' ', 0x42f95535, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('44a046de6d0d67ca97eb2673fb3fb8c0', '', 1570379933, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('6f89662cc507b30a3d072feef691a014', '', 1570379936, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('13e288ca7821e0ef904be6bea124ef05', '', 1570379957, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('adb0046d10aca7fd956448c5e2db45b8', '', 1570379998, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('b06e7c2750eb990d3dea53da05c8ec93', '', 1570380006, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('d1f609ec309cdb2003f28bddbbafc579', '', 1570380014, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('65ca26714127e12931d8728ddfd711ee', '', 1570380020, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('2a4bfb867ddf1eea6483225a540bd54a', '', 1570380065, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('c433b19dcbcbb52b829747f9deb82aa2', '', 1570380069, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('c4cf0f9030f862cb08a74ef195ef569a', '', 1570380098, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('59dbef5c4c7af12c167a0d08be3f319b', '', 1570380198, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('0bf40d3296acb0dc1ef0e8a17bd058ba', '', 1570380123, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('373bbe076b3c3037c252c0255fd69668', '', 1570380143, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('00b79d81057de40227dd17ecdace7d6c', '', 1570380209, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('1edb886b41f57240d282e1c21d4347ba', '', 1570380222, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('13252bb2f44023b1683b22544105ef75', '', 1570380235, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('4cf6c2342341a3b9fcc784a52b9c0d9f', '', 1570380433, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('1a0d0f951b9456e0c7a73021239a6120', '', 1570380249, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('12ecaab07f92a1f7c4ab9c2ef47736b9', '', 1570380436, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('d7c9daf78360bf14187b5b57cfdf2783', '', 1570380447, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('baec6822b9e0b954d42efa345346fe43', '', 1570380450, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('ab1a5d3ad4c8a2c9ef2751e676dbe1cc', '', 1570380461, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('e12df4440ed7ef2908d625964e7a55b1', '', 1570380463, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('6b9bd2c8e27652fe197acc49c48c1776', '', 1570380472, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('2e3d20985a0f2c2e47cf214dd0707a54', '', 1570380474, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('dcee304a72e6e1f476854441728b64ab', '', 1570380477, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('aeb18370af2417fd010d3c7d86b898f9', '', 1570380487, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('023f0972dcf2fe504acddc1838e1b215', '', 1570380489, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('7caaa098e2e946976bd075708df92b75', '', 1570380491, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('8a191a26cdfaf8fc5523260d182fac71', '', 1570380501, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('d371fd59aac661c63bfb718f487d2840', '', 1570380561, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('0b9749fe9638eea70fb43ab290cac979', '', 1570380593, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('0d1a93bd6595aacffd66b1bf4769972b', '', 1570380616, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('bef972832be24562cde7da9935000b44', '', 1570380624, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('3fd1e6ee0e4a9849034024854d13ae58', '', 1570380639, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('3be71948bfc56009c9ef648dfe0a97f5', '', 1570380643, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('ce1e11185afdf751a911aa4ecd79ebea', '', 1570380649, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('fb0b80daef2b685ae478b6c6056fde82', '', 1570380651, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('1cd98926fe36dc47e1724c455b6a06cd', '', 1570380664, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('81cd160185ca0e57c83368228338547f', '', 1570380678, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('adb9c755256fd1608f7971bc24679aa7', '', 1570380685, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('acb6153df177a576268fafbdc0586572', '', 1570380688, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('9804986b8051e0713db981867db1b467', '', 1570380690, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('b117caed84624451d41e8fd899362d1b', '', 1570380694, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('ccefe4e6ff3ccea20e5e3e9c885c8906', '', 1570380696, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('b28fd0cbac87cafa6c682ce5bdc62edc', '', 1570380713, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('284480f1cabbfe36e75417237e819854', '', 1570380715, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('2ee582975f0650d9351a1da28fab226d', '', 1570380721, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('0723bc5c73a2c39e6944afebcb694f4f', '', 1570380724, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('ea296162b4c9c17164112b713a9bf15d', '', 1570380732, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('5e73527fd7dece13ef13fbe700bacc81', '', 1570380756, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('3ee404011aa429708338d7bc7aa80e2a', '', 1570380761, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('b169dfe79be078d022ea2d13e736abb0', '', 1570380774, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('56785c8842e2e38e908eec9b14bb832f', '', 1570380788, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('f577c15793478047908e6fe99398cabc', '', 1570380793, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('f9fbd5f7b219a2c068e511c2c2a191fb', '', 1570380797, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('8892056d4bea0b06d46a42831e48f89f', '', 1570380799, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('cb150007b46416e68163d070509d395a', 'codex', 1570380867, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('f9404fbfdd0928c73d61289472cb7648', '', 1570380845, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('3dd15dde9c44adc4177022ddb75bf495', '', 1570380853, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('6a62106f0cf34a379af6703df0c3f901', '', 1570380873, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('3f93c9372b4779a7f4801b31efd7b373', '', 1570380896, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('cb09eea1a9ca441161e20ab8031d17f5', '', 1570380906, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('c3711126c1b893ad0ff1a903cfedec60', '', 1570380927, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('d52cd1680fb53c202909ebb9bce7f7ab', '', 1570380930, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('153da564419949a8b3b202abd968b314', '', 1570380973, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('3b5fed4d39d1675b4e44720a9b9387c2', '', 1570380979, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('755bea5d3d0bc3fb06a8dac136a9286d', '', 1570380983, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('a5b9e16fc3533e3537c5bf033c751425', '', 1570380990, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('cd0810d11a9d482ead761ee2fe53de81', '', 1570380993, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('82929d4dc8d6038af7742fea5d76ca3e', '', 1570380996, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('95e4374e3e03d965de7eef019c3f9aa3', '', 1570381001, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('bf643367cb24f79a00c8c2e874f8f66f', '', 1570381014, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('f3e4679cd823b30a21e0afcd230be58f', '', 1570381017, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('8445f28f6d68aa8074bc48c28f454fb3', '', 1570381023, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('625ef069e72a291e295e08b55bd343c2', '', 1570381025, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('28efef183bcbbe959ad8acb4edb06967', '', 1570381038, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('fafcf4198d2747f2903e85773eaebcf6', '', 1570381039, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('8fdf840c228f4a01d70f2b479f5077e9', '', 1570381046, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('3d5fdd10bc1bca52c6e0ba6779473148', '', 1570381050, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('3d7827a569000cc702b28931d0dc16ec', '', 1570381056, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('6fb864cacf1914248086147660d57d7b', '', 1570381058, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('038f80397df13f9afc135762290d6081', '', 1570381069, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('50d6af8be29d614d6482f112b8dadf7f', '', 1570381090, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('3fd31f86d7aa48774df500dd9bf9d858', '', 1570381112, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('cf8997eec73b350389048d952e83bdd7', '', 1570381100, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('24779e170e6fe1c7de706e5d5fdb31f5', '', 1570381103, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('5ad860459e030034481a7587405a88a0', '', 1570381118, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('c05f061c918ad756925156247004f727', '', 1570381125, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('a8ccf4ba465d6e090248809ca65bb4e7', '', 1570381130, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('294db89ddc99705d30b41da007cb2713', 'codex', 1570381144, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('8ba83df72e56d6928bccd31bcdb21238', '', 1570381157, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('d09825fc1b67bacfd3d2b750b2159f4d', '', 1570381205, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('24629bb5587619595a1cedc9f7568f9b', 'codex', 1570381828, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('ae984487b9569dc6d3374e1ccec16f0f', '', 1570381238, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('bcf507197a27133d698fe82db53d6617', '', 1570381254, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('2675a5fef707d7e283149de9071d1b6e', '', 1570381297, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('fa5878bdaaf5b9a9b4e930d631b5bd1c', '', 1570381343, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('99434e96842852a9330efd5b243c25f9', '', 1570381388, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('4601d26fb014c525759c54c9d9f67999', '', 1570381394, ' ', 0xbf2753a4, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('809b5b479ab994f947ec66ec6c44ffc2', '', 1570385283, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('0b0cbddce152fabd690db5e58fe3bf87', '', 1570385309, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('2c5d0607f65da1ae1a95c5dd9339a78a', '', 1570385347, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('114e82429e525618916f96907e7b8cf6', 'codex', 1570385632, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('f9deb7e0023aec7bdec4b10e604973d9', '', 1570385719, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('4a9f9fa66390581438b832538f6b5e0e', '', 1570385720, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('bad1090d23cd685cb5e2f3a4e30d8335', '', 1570385746, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('ad700edcca842fc88fcc6b6dc15abae8', '', 1570385748, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('2b011a752e883a63e9a772f8d0d1c880', '', 1570381472, ' ', 0x42f95533, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('489b360902c0158a1b9e1ebeb3168b68', '', 1570381473, ' ', 0x42f95531, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('29f78559c0396d57f60596fa944bba43', '', 1570381505, ' ', 0x42f95531, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('ac750bbe420dc95dd0dc5af01dcccda7', 'codex', 1570381521, ' ', 0x42f95533, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('3d81a405d4a73341a72c040a4db350e8', 'codex', 1570381514, ' ', 0x42f95535, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('ae3e064b988abb9efcb60d9646674b3b', 'codex', 1570381526, ' ', 0x42f95531, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('f8d4cc833bce1481cc8861e9e6948337', 'codex', 1570381538, ' ', 0x42f95533, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('2be1643dd719a6749cbe3506b22eb8ab', 'codex', 1570381535, ' ', 0x42f95533, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('1ab1fa89aad9f6a1a89eecfda564f0b1', 'codex', 1570381556, ' ', 0x42f95533, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('1d5c44ae240a6462451fe4bc45a0d6bb', '', 1570381547, ' ', 0x42f95535, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('00775a26ddc28938ea6600cb0ecd12b6', '', 1570381548, ' ', 0x42f95533, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('4f968c7758a4053c2d5ca00032cbc66c', 'codex', 1570381572, ' ', 0x42f95533, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('388d869435f22bf7dbc0d63320b8b92d', 'codex', 1570381576, ' ', 0x42f95531, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('77f2a67f28c73722f145b06d5ce54e29', 'codex', 1570381581, ' ', 0x42f95533, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('2d97bc3f4ff0ae6de92ba8c0a99d9903', 'codex', 1570381576, ' ', 0x42f95535, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('b4fca8fe57a3eb2d290515f3c445dfd7', 'codex', 1570381588, ' ', 0x42f95533, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('3bc16681599c9e9625dbd3fc3a0322b4', '', 1570381622, ' ', 0x42f95535, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('0484bd44a86ca4b0e4b4beedf8916e98', '', 1570381782, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('7da62d946b35a63cce6d440025cf5bf0', '', 1570381791, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('4144c1179d8165b69267b5e83e03c151', '', 1570381967, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('541d6362f5459f549d8a81ee7d33101b', '', 1570381970, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('22fcb0ed9e39314213de7d5e90318241', '', 1570381988, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('47344a5b62897e6100c769c45d9e8feb', '', 1570381993, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('068b82148419e214964e89a72cf975be', '', 1570382004, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('586b40e271bd8795d05abc2549a1d8d7', '', 1570382029, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('ec2d318f63e583d7ac374e3e9f61d3b4', '', 1570382040, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('790605cb4e4d92938132464f42cd2e7d', '', 1570382109, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('94183c785d9c8d35afa41546a47c430d', '', 1570382116, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('5a1a623637079b7b46875a7fbb1e5aef', 'codex', 1570382144, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('77d6bca7fa7ae7599eea571060f86478', '', 1570382256, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('50ba1a4ff20a1987be75791f8929bb2d', '', 1570382284, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('dae32dae6a98fd39907e73a6dee43ad4', '', 1570382356, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('711b7ff36e33dd4761ee556c041760d8', 'codex', 1570379571, 'userdata|a:5:{s:7:\"success\";b:1;s:4:\"type\";s:5:\"mysql\";s:8:\"username\";s:5:\"codex\";s:3:\"uid\";i:1;s:11:\"preferences\";a:100:{s:8:\"download\";s:1:\"1\";s:17:\"popular_threshold\";s:2:\"10\";s:17:\"transcode_bitrate\";s:2:\"32\";s:10:\"site_title\";s:32:\"Ampache :: For the love of Music\";s:10:\"lock_songs\";N;s:15:\"force_http_play\";N;s:20:\"localplay_controller\";s:3:\"mpd\";s:9:\"play_type\";s:10:\"web_player\";s:4:\"lang\";s:5:\"pt_BR\";s:13:\"playlist_type\";s:3:\"m3u\";s:10:\"theme_name\";s:6:\"reborn\";s:12:\"offset_limit\";s:2:\"50\";s:15:\"localplay_level\";s:3:\"100\";s:21:\"allow_stream_playback\";s:1:\"1\";s:25:\"allow_democratic_playback\";s:1:\"1\";s:24:\"allow_localplay_playback\";s:1:\"1\";s:15:\"stats_threshold\";s:1:\"7\";s:10:\"rate_limit\";s:4:\"8192\";s:15:\"playlist_method\";s:7:\"default\";s:9:\"transcode\";s:7:\"default\";s:11:\"show_lyrics\";s:1:\"0\";s:10:\"mpd_active\";s:1:\"0\";s:12:\"httpq_active\";s:1:\"0\";s:16:\"shoutcast_active\";s:1:\"0\";s:17:\"lastfm_grant_link\";s:0:\"\";s:16:\"lastfm_challenge\";s:0:\"\";s:5:\"share\";s:1:\"0\";s:9:\"ajax_load\";s:1:\"1\";s:20:\"now_playing_per_user\";s:1:\"1\";s:10:\"album_sort\";s:1:\"0\";s:17:\"show_played_times\";s:1:\"0\";s:15:\"song_page_title\";s:1:\"1\";s:16:\"subsonic_backend\";s:1:\"1\";s:12:\"plex_backend\";N;s:15:\"webplayer_flash\";s:1:\"1\";s:15:\"webplayer_html5\";s:1:\"1\";s:23:\"allow_personal_info_now\";s:1:\"1\";s:26:\"allow_personal_info_recent\";s:1:\"1\";s:24:\"allow_personal_info_time\";s:1:\"1\";s:25:\"allow_personal_info_agent\";s:1:\"1\";s:8:\"ui_fixed\";s:1:\"0\";s:10:\"autoupdate\";s:1:\"1\";s:20:\"autoupdate_lastcheck\";s:10:\"1570375434\";s:22:\"autoupdate_lastversion\";s:17:\"5.0.0-pre-release\";s:26:\"autoupdate_lastversion_new\";s:1:\"1\";s:22:\"webplayer_confirmclose\";s:1:\"0\";s:19:\"webplayer_pausetabs\";s:1:\"1\";s:20:\"stream_beautiful_url\";s:1:\"0\";s:12:\"share_expire\";s:1:\"7\";s:14:\"slideshow_time\";s:1:\"0\";s:20:\"broadcast_by_default\";s:1:\"0\";s:21:\"concerts_limit_future\";s:1:\"0\";s:19:\"concerts_limit_past\";s:1:\"0\";s:11:\"album_group\";s:1:\"0\";s:7:\"topmenu\";s:1:\"0\";s:19:\"demo_clear_sessions\";s:1:\"0\";s:11:\"show_donate\";s:1:\"1\";s:14:\"upload_catalog\";s:2:\"-1\";s:12:\"allow_upload\";N;s:13:\"upload_subdir\";s:1:\"1\";s:18:\"upload_user_artist\";N;s:13:\"upload_script\";N;s:17:\"upload_allow_edit\";s:1:\"1\";s:12:\"daap_backend\";N;s:9:\"daap_pass\";N;s:12:\"upnp_backend\";N;s:11:\"allow_video\";s:1:\"1\";s:18:\"album_release_type\";s:1:\"1\";s:17:\"direct_play_limit\";s:1:\"0\";s:18:\"home_moment_albums\";s:1:\"1\";s:18:\"home_moment_videos\";s:1:\"1\";s:20:\"home_recently_played\";s:1:\"1\";s:16:\"home_now_playing\";s:1:\"1\";s:11:\"custom_logo\";s:0:\"\";s:23:\"album_release_type_sort\";s:20:\"album,ep,live,single\";s:14:\"browser_notify\";s:1:\"1\";s:22:\"browser_notify_timeout\";s:2:\"10\";s:11:\"geolocation\";s:1:\"0\";s:16:\"webplayer_aurora\";s:1:\"1\";s:19:\"upload_allow_remove\";s:1:\"1\";s:17:\"custom_login_logo\";s:0:\"\";s:14:\"custom_favicon\";s:0:\"\";s:18:\"custom_text_footer\";s:0:\"\";s:14:\"webdav_backend\";N;s:12:\"notify_email\";s:1:\"0\";s:11:\"theme_color\";s:4:\"dark\";s:31:\"disabled_custom_metadata_fields\";N;s:37:\"disabled_custom_metadata_fields_input\";N;s:12:\"podcast_keep\";s:2:\"10\";s:20:\"podcast_new_download\";s:1:\"1\";s:19:\"libitem_contextmenu\";s:1:\"1\";s:22:\"upload_catalog_pattern\";N;s:23:\"catalog_check_duplicate\";N;s:13:\"browse_filter\";s:1:\"1\";s:13:\"sidebar_light\";s:1:\"0\";s:17:\"custom_blankalbum\";s:0:\"\";s:17:\"custom_blankmovie\";s:0:\"\";s:20:\"libitem_browse_alpha\";s:0:\"\";s:10:\"theme_path\";s:14:\"/themes/reborn\";s:14:\"theme_css_base\";a:1:{i:0;a:2:{i:0;s:11:\"default.css\";i:1;s:6:\"screen\";}}}}art_enabled|b:1;login|b:0;state|a:1:{s:11:\"sidebar_tab\";s:5:\"admin\";}catalog|i:0;browse_current_artist|a:1:{s:5:\"start\";i:0;}browse_current_live_stream|a:1:{s:5:\"start\";i:0;}iframe|a:0:{}forms|a:6:{s:32:\"91582ae3bce3270e469b8a14a206fbda\";a:2:{s:4:\"name\";s:17:\"update_preference\";s:6:\"expire\";i:1570379319;}s:32:\"c61d359a861ed41d8f55103cc9455f5e\";a:2:{s:4:\"name\";s:17:\"update_preference\";s:6:\"expire\";i:1570379320;}s:32:\"cd28c7b6c77f6516e1e8421c1b17da67\";a:2:{s:4:\"name\";s:17:\"update_preference\";s:6:\"expire\";i:1570379346;}s:32:\"1ccf294d76fd705a4f4548ffa0c53bc1\";a:2:{s:4:\"name\";s:17:\"update_preference\";s:6:\"expire\";i:1570379352;}s:32:\"5ddf6838d936ab1ef6e7a25de520f94b\";a:2:{s:4:\"name\";s:17:\"update_preference\";s:6:\"expire\";i:1570379461;}s:32:\"43214db6de849d278cc7c2cbe8c8d6be\";a:2:{s:4:\"name\";s:17:\"update_preference\";s:6:\"expire\";i:1570379462;}}', 0xbf274ba6, 'mysql', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('a47d35e15c56d1771d948a435edeaf6b', '', 1570382636, ' ', 0x42f95531, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('0f34e047297c6b3a8876ebcb26978f9d', '', 1570382664, ' ', 0x42f95535, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('bf9cd2997b1f963d9cf3b69d81aa8771', '', 1570382665, ' ', 0x42f95535, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('5421304ba6df1bbccd9bffe871cf0755', '', 1570382668, ' ', 0x42f95533, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('eff9eba68e15bfdc1f2c2f0b660eb11f', '', 1570382669, ' ', 0x42f95535, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('65da4651dd517a2a7d1ed452c2b23118', '', 1570382680, ' ', 0x42f95531, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('b3cf0fcc42c3b5eee1d37a828af479e3', '', 1570382681, ' ', 0x42f95533, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('ebbf835b7d2037508c9c693815270304', '', 1570382683, ' ', 0x42f95531, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('f4ff9767887720b1cdeb191d4213087e', '', 1570382700, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('e72feedb1394f458633db4e9100c7de9', '', 1570382722, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('0a2cb5fc1fc967e426e12a84ce534023', '', 1570382739, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('9755d57b2ce687aca830322e1accf571', '', 1570382765, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('8bb6eb70859aa32083fa551c1606767a', '', 1570382768, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('210da952a2aa82ba8386fbf94ff43862', '', 1570382782, ' ', 0x42f95533, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('97ec8f8d2f68fce828117e5c3f3c7e48', '', 1570382783, ' ', 0x42f95533, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('67182540500671cc81cc2fee53141630', '', 1570382789, ' ', 0x42f95535, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('88ad0a0f36e677bb327d9b34d5c97bc5', '', 1570382790, ' ', 0x42f95531, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('87fdcecbd3c87c16e61116aa03359804', '', 1570382802, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('e6e216bd50b20cea054a61dd74742f53', '', 1570382807, ' ', 0x42f95533, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('c6a5c3806dbc7b6a2e7df6bd48a317fb', '', 1570382808, ' ', 0x42f95531, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL);
INSERT INTO `session` (`id`, `username`, `expire`, `value`, `ip`, `type`, `agent`, `geo_latitude`, `geo_longitude`, `geo_name`) VALUES
('bf17fa825837d1604ab16d5a5aab18d3', '', 1570382847, ' ', 0x42f95531, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('fab7fafb34266287ebc7ab6818852c14', 'codex', 1570382890, ' ', 0x42f95533, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('39c3fa60a6384b1f82a21b4281ea19e5', 'codex', 1570382892, ' ', 0x42f95531, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('245e1fe05c9daaf5bb4b8a2b2fc21e0c', 'codex', 1570382888, ' ', 0x42f95531, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('000c246227c10f4823fe495ebfc8689a', '', 1570382918, ' ', 0x42f95535, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('45c3d236782cee37b9b241fe9ac017d1', '', 1570382919, ' ', 0x42f95535, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('c80ff6b4ea0996bc66b0cd338a792911', '', 1570382945, ' ', 0x42f95535, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('bd6a7d128d83d5b60b06ca76861d59d1', '', 1570382946, ' ', 0x42f95535, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('b1286ff3c4d16f36bf4d0b5fa794cafe', '', 1570382952, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('0204be9dea7e330c7cc63cc48f757d35', '', 1570383060, ' ', 0x42f95533, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('fc95544b49e5e04c7ec2b7b9b6e2961a', '', 1570383061, ' ', 0x42f95531, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('cad15d39737de58038f79b0b568d4ef5', 'codex', 1570383172, ' ', 0x42f95535, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('b978650a2a15d2bf0749ae16f166393f', '', 1570383100, ' ', 0x42f95533, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('95023de85af730b108362d559b2669b7', '', 1570383101, ' ', 0x42f95535, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('d1b879c3134a833e9710597a7b233300', '', 1570383115, ' ', 0x42f95531, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('80f6269b4efdb5f6bca83fb5be776f1f', '', 1570383123, ' ', 0x42f95531, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('379ec5cd2516369230f9ba53cbea749d', '', 1570383124, ' ', 0x42f95531, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('e3b3d4f8b15440c09b95ac1406a9b181', '', 1570383132, ' ', 0x42f95531, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('3e8b81b1d38837ebcc6fb3b199a0b840', '', 1570383133, ' ', 0x42f95533, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('a56faf872ea88f2e26f15cdf92e1af5d', '', 1570383152, ' ', 0x42f95533, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('49aaffe89d0550de43ba188139594ed5', '', 1570383153, ' ', 0x42f95531, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('7b0d4a787d3368f133958081448612dc', 'codex', 1570383170, ' ', 0x42f95535, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('92324b406f8526eaee07a3741abd1633', 'codex', 1570380642, 'userdata|a:5:{s:7:\"success\";b:1;s:4:\"type\";s:5:\"mysql\";s:8:\"username\";s:5:\"codex\";s:11:\"preferences\";a:100:{s:8:\"download\";s:1:\"1\";s:17:\"popular_threshold\";s:2:\"10\";s:17:\"transcode_bitrate\";s:2:\"32\";s:10:\"site_title\";s:32:\"Ampache :: For the love of Music\";s:10:\"lock_songs\";N;s:15:\"force_http_play\";N;s:20:\"localplay_controller\";s:3:\"mpd\";s:9:\"play_type\";s:10:\"web_player\";s:4:\"lang\";s:5:\"pt_BR\";s:13:\"playlist_type\";s:3:\"m3u\";s:10:\"theme_name\";s:6:\"reborn\";s:12:\"offset_limit\";s:2:\"50\";s:15:\"localplay_level\";s:3:\"100\";s:21:\"allow_stream_playback\";s:1:\"1\";s:25:\"allow_democratic_playback\";s:1:\"1\";s:24:\"allow_localplay_playback\";s:1:\"1\";s:15:\"stats_threshold\";s:1:\"7\";s:10:\"rate_limit\";s:4:\"8192\";s:15:\"playlist_method\";s:7:\"default\";s:9:\"transcode\";s:7:\"default\";s:11:\"show_lyrics\";s:1:\"0\";s:10:\"mpd_active\";s:1:\"0\";s:12:\"httpq_active\";s:1:\"0\";s:16:\"shoutcast_active\";s:1:\"0\";s:17:\"lastfm_grant_link\";s:0:\"\";s:16:\"lastfm_challenge\";s:0:\"\";s:5:\"share\";s:1:\"0\";s:9:\"ajax_load\";s:1:\"1\";s:20:\"now_playing_per_user\";s:1:\"1\";s:10:\"album_sort\";s:1:\"0\";s:17:\"show_played_times\";s:1:\"0\";s:15:\"song_page_title\";s:1:\"1\";s:16:\"subsonic_backend\";s:1:\"1\";s:12:\"plex_backend\";N;s:15:\"webplayer_flash\";s:1:\"1\";s:15:\"webplayer_html5\";s:1:\"1\";s:23:\"allow_personal_info_now\";s:1:\"1\";s:26:\"allow_personal_info_recent\";s:1:\"1\";s:24:\"allow_personal_info_time\";s:1:\"1\";s:25:\"allow_personal_info_agent\";s:1:\"1\";s:8:\"ui_fixed\";s:1:\"0\";s:10:\"autoupdate\";s:1:\"1\";s:20:\"autoupdate_lastcheck\";s:10:\"1570376078\";s:22:\"autoupdate_lastversion\";s:17:\"5.0.0-pre-release\";s:26:\"autoupdate_lastversion_new\";s:1:\"1\";s:22:\"webplayer_confirmclose\";s:1:\"0\";s:19:\"webplayer_pausetabs\";s:1:\"1\";s:20:\"stream_beautiful_url\";s:1:\"0\";s:12:\"share_expire\";s:1:\"7\";s:14:\"slideshow_time\";s:1:\"0\";s:20:\"broadcast_by_default\";s:1:\"0\";s:21:\"concerts_limit_future\";s:1:\"0\";s:19:\"concerts_limit_past\";s:1:\"0\";s:11:\"album_group\";s:1:\"0\";s:7:\"topmenu\";s:1:\"0\";s:19:\"demo_clear_sessions\";s:1:\"0\";s:11:\"show_donate\";s:1:\"1\";s:14:\"upload_catalog\";s:2:\"-1\";s:12:\"allow_upload\";N;s:13:\"upload_subdir\";s:1:\"1\";s:18:\"upload_user_artist\";N;s:13:\"upload_script\";N;s:17:\"upload_allow_edit\";s:1:\"1\";s:12:\"daap_backend\";N;s:9:\"daap_pass\";N;s:12:\"upnp_backend\";N;s:11:\"allow_video\";s:1:\"1\";s:18:\"album_release_type\";s:1:\"1\";s:17:\"direct_play_limit\";s:1:\"0\";s:18:\"home_moment_albums\";s:1:\"1\";s:18:\"home_moment_videos\";s:1:\"1\";s:20:\"home_recently_played\";s:1:\"1\";s:16:\"home_now_playing\";s:1:\"1\";s:11:\"custom_logo\";s:0:\"\";s:23:\"album_release_type_sort\";s:20:\"album,ep,live,single\";s:14:\"browser_notify\";s:1:\"1\";s:22:\"browser_notify_timeout\";s:2:\"10\";s:11:\"geolocation\";s:1:\"0\";s:16:\"webplayer_aurora\";s:1:\"1\";s:19:\"upload_allow_remove\";s:1:\"1\";s:17:\"custom_login_logo\";s:0:\"\";s:14:\"custom_favicon\";s:0:\"\";s:18:\"custom_text_footer\";s:0:\"\";s:14:\"webdav_backend\";N;s:12:\"notify_email\";s:1:\"0\";s:11:\"theme_color\";s:4:\"dark\";s:31:\"disabled_custom_metadata_fields\";N;s:37:\"disabled_custom_metadata_fields_input\";N;s:12:\"podcast_keep\";s:2:\"10\";s:20:\"podcast_new_download\";s:1:\"1\";s:19:\"libitem_contextmenu\";s:1:\"1\";s:22:\"upload_catalog_pattern\";N;s:23:\"catalog_check_duplicate\";N;s:13:\"browse_filter\";s:1:\"1\";s:13:\"sidebar_light\";s:1:\"0\";s:17:\"custom_blankalbum\";s:0:\"\";s:17:\"custom_blankmovie\";s:0:\"\";s:20:\"libitem_browse_alpha\";s:0:\"\";s:10:\"theme_path\";s:14:\"/themes/reborn\";s:14:\"theme_css_base\";a:1:{i:0;a:2:{i:0;s:11:\"default.css\";i:1;s:6:\"screen\";}}}s:3:\"uid\";i:1;}art_enabled|b:1;login|b:0;state|a:1:{s:11:\"sidebar_tab\";s:4:\"home\";}catalog|i:0;iframe|a:0:{}', 0xbf274ba6, 'mysql', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('a6bd823ec82e0b6cc0f9d54b700e788f', '', 1570383279, ' ', 0x42f95533, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('f03ffaf53b7357a920e6b9bb5eaa65c3', '', 1570383280, ' ', 0x42f95531, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('588945e476405d567c60a52ef5714cbb', '', 1570383293, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('df61cd9d250e75d04bc0d78d82b25fe5', '', 1570383301, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('fd22ed59039b0559cd8aa4e039eaf179', '', 1570383326, ' ', 0x42f95531, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('d1d15b0456e203983148067d49538f10', '', 1570383327, ' ', 0x42f95533, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('3ef8bc278a008539f71d826a0f479ab1', '', 1570383350, ' ', 0x42f95531, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('bacb93710f2b565d39b0af4429e23b54', '', 1570383351, ' ', 0x42f95531, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('9218d3c46a97019aefc9df42c8e5486c', 'codex', 1570383376, ' ', 0x42f95535, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('394ffdcabca9b5836d10a9944bd37432', 'codex', 1570383374, ' ', 0x42f95531, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('1a55a7d7a5e4a21c2db596fc4ae3f31a', '', 1570383375, ' ', 0x42f95533, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('53a5a214d743b6228ceef27ab34666d6', '', 1570383375, ' ', 0x42f95535, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('37a87999fbfaf974dd22f9c192c4ceb5', '', 1570383389, ' ', 0x42f95535, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('06749a84eb4d1e318313c74f41363178', '', 1570383390, ' ', 0x42f95531, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('6c3db42a144d290dd774296c8a596df3', 'codex', 1570383399, ' ', 0x42f95533, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('6a41fa904641e510c3679e5e5d139592', 'codex', 1570383596, ' ', 0x42f95535, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('5f1c7e8daee4166b7fdd075e231c923a', '', 1570383411, ' ', 0x42f95533, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('99055944caa2c0e8cacbccaf6ba7ad0f', 'codex', 1570383486, ' ', 0x42f95535, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('372f8205638bb845e09848f1e42086bd', 'codex', 1570383648, ' ', 0x42f95533, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('b7afef4a9f065d7b92d7df6a08413ed5', 'codex', 1570383733, ' ', 0x42f95535, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('cfb33b431014233d65195ec114b78263', 'codex', 1570383734, ' ', 0x42f95533, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('aac723b847172814abac6634c93f38f3', 'codex', 1570383740, ' ', 0x42f95533, 'stream', 'Mozilla/5.0 (Linux; Android 7.0; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.92 Mobile Safari/537.36', NULL, NULL, NULL),
('434e362f80ad5d96f664f680bf181aa5', '', 1570384010, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('5b1f391e1674d5a4162af36190c61f9b', '', 1570384021, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('b868c8c1fed431b181a5c839dcf8f321', '', 1570384134, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('5af355efcf1533eeaa5c7fd6a536fe3b', '', 1570384155, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('6d3b9e69ad95374eaa6287c7f11733f6', '', 1570384166, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('e235173aec4a052f5bce28d14ea794d5', '', 1570384188, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('0da86dc74dbe76fee966868dd0c97451', '', 1570384218, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('cd6c06f8acaede7555c739c1b0de5094', 'codex', 1570384362, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('f732ae4c8b8af241ae946c3205befed7', '', 1570384553, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('a2c86f759df6c0d691b4999726bf4ca2', '', 1570384595, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('58eeb2be83de87dedd0a585e2ed23dd7', '', 1570384599, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('5dad8089b01b524bc2f7afb5c51b83fc', '', 1570384603, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('54e66a184db9977a95a62a171f34aa83', '', 1570384607, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('98d627e7a283fd59544a05bf053e056e', '', 1570384625, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('e287514983d73b5add28caadb8688cc0', '', 1570384636, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('8aca861dc56662ec8e02cef2bc6072e9', '', 1570384813, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('9ae06c9ccadf626dd1216dcc81d894f3', '', 1570384904, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('2520e3deff0bcf5381906ea3b5f49cc9', '', 1570385079, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('08d70f5e4c42de25d9322209275d5d2c', '', 1570385125, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('f2d5fb093ae9ed89e23f1dc6141e0349', '', 1570385131, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('dc41923b30d2d5c71ab54769d32cd93f', '', 1570385132, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('e6c7289e38d007123f75b07c73105b46', '', 1570385140, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('b9ede0503c6a2f273890453adcbbc52e', '', 1570385142, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('47208e5e173e280a4d01e6af84bbc736', '', 1570385149, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('a1444da9bf14d18f5b72c900156ed5ab', '', 1570385151, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('9a0a0f317accbe667f3895ff1a0b967a', '', 1570385736, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('09044864496d2c3d5ef999c193be6634', '', 1570385179, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('748cedf15d817191074105aa1f4ae504', 'codex', 1570385206, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('bb83744038aa5b3046c52052b070e8fc', '', 1570385206, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('30f0cbd09d4d7026f664440021299c80', '', 1570385758, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('111cdca2f93182e2aa4b61a8d24fa9d1', '', 1570385760, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('0f3961434b23dcc3d35c7f037614cc00', '', 1570385765, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('5fd0e9d2e474e76f90815d111ff1d7de', '', 1570385836, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('058f062f10205ce317ef6237cb48f333', '', 1570385842, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('f84c1f2309f8a6ce3deb3887defb9bff', '', 1570385861, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('e514464d37a9e4983ac12f20c23d58c7', '', 1570385867, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('2b6e068268feac2e902b5b65c56989b9', '', 1570385881, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('14e59bf1ac7393e666dc1fda3997aaa3', '', 1570385895, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('bde19197a9cc4ba5b21fb03efea0fb06', '', 1570385901, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('14d19c4b5ee0410e02bbe4de684db701', '', 1570385904, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('c283a0137105976b90b9482f77bb2612', '', 1570385933, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('e13a1fe584fdf33f4e11bc3509d8cd53', '', 1570385941, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('aee2eb604d1ea3f991a858ced025b9ae', '', 1570385946, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('af596c3696e55f44f4fb8bd3a7101bfc', '', 1570385965, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('f048d65f743741f03eee6df900668d95', '', 1570385967, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('c0424c643d90f73f4e4b9a9cc17d2af2', '', 1570385971, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('91e8e9b5b698317e94b69298875b8895', '', 1570385973, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('13cbc280973671060d69cba5883222be', '', 1570386032, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('eadbc8c02739f5a988e3f44f2140ac3b', '', 1570386068, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('dfddeffa903b57505cc9822076993c5e', '', 1570386261, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL),
('43560d8269745c785cfbba04a5fd14fc', '', 1570386267, ' ', 0xbf274ba6, 'stream', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `session_remember`
--

CREATE TABLE `session_remember` (
  `username` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `token` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `expire` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `session_stream`
--

CREATE TABLE `session_stream` (
  `id` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `user` int(11) UNSIGNED NOT NULL,
  `agent` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `expire` int(11) UNSIGNED NOT NULL,
  `ip` varbinary(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `share`
--

CREATE TABLE `share` (
  `id` int(11) UNSIGNED NOT NULL,
  `user` int(11) UNSIGNED NOT NULL,
  `object_type` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `allow_stream` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `allow_download` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `expire_days` int(4) UNSIGNED NOT NULL DEFAULT '0',
  `max_counter` int(4) UNSIGNED NOT NULL DEFAULT '0',
  `secret` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `counter` int(4) UNSIGNED NOT NULL DEFAULT '0',
  `creation_date` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `lastvisit_date` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `public_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `song`
--

CREATE TABLE `song` (
  `id` int(11) UNSIGNED NOT NULL,
  `file` varchar(4096) CHARACTER SET utf8 DEFAULT NULL,
  `catalog` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `album` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `year` mediumint(4) UNSIGNED NOT NULL DEFAULT '0',
  `artist` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `bitrate` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `rate` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `mode` enum('abr','vbr','cbr') CHARACTER SET utf8 DEFAULT NULL,
  `size` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `time` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `track` smallint(5) UNSIGNED DEFAULT NULL,
  `mbid` varchar(36) CHARACTER SET utf8 DEFAULT NULL,
  `played` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `update_time` int(11) UNSIGNED DEFAULT '0',
  `addition_time` int(11) UNSIGNED DEFAULT '0',
  `user_upload` int(11) DEFAULT NULL,
  `license` int(11) DEFAULT NULL,
  `composer` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `channels` mediumint(9) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `song_data`
--

CREATE TABLE `song_data` (
  `song_id` int(11) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `lyrics` text COLLATE utf8_unicode_ci,
  `label` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `catalog_number` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `language` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `waveform` mediumblob,
  `replaygain_track_gain` decimal(10,6) DEFAULT NULL,
  `replaygain_track_peak` decimal(10,6) DEFAULT NULL,
  `replaygain_album_gain` decimal(10,6) DEFAULT NULL,
  `replaygain_album_peak` decimal(10,6) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `song_preview`
--

CREATE TABLE `song_preview` (
  `id` int(11) UNSIGNED NOT NULL,
  `session` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `artist` int(11) DEFAULT NULL,
  `artist_mbid` varchar(1369) CHARACTER SET utf8 DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `album_mbid` varchar(36) CHARACTER SET utf8 DEFAULT NULL,
  `mbid` varchar(36) CHARACTER SET utf8 DEFAULT NULL,
  `disk` int(11) DEFAULT NULL,
  `track` int(11) DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `stream_playlist`
--

CREATE TABLE `stream_playlist` (
  `id` int(11) UNSIGNED NOT NULL,
  `sid` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `url` text COLLATE utf8_unicode_ci NOT NULL,
  `info_url` text COLLATE utf8_unicode_ci,
  `image_url` text COLLATE utf8_unicode_ci,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `album` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `time` smallint(5) DEFAULT NULL,
  `codec` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `track_num` smallint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `stream_playlist`
--

INSERT INTO `stream_playlist` (`id`, `sid`, `url`, `info_url`, `image_url`, `title`, `author`, `album`, `type`, `time`, `codec`, `track_num`) VALUES
(1, 'cb150007b46416e68163d070509d395a', 'http://play.marcelomotta.com/play/index.php?ssid=cb150007b46416e68163d070509d395a&type=song&oid=5796&uid=1&name=Bobby%20Lee%20-SOJA-%20-%20Be%20Aware.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=5796\" title=\"Bobby Lee (SOJA) - Be Aware\"> Be Aware</a>', 'http://play.marcelomotta.com/image.php?object_id=438&object_type=album&auth=cb150007b46416e68163d070509d395a&thumb=3', 'Be Aware', 'Bobby Lee (SOJA)', 'Syr Mahber: A SOJA Production', 'song', 249, NULL, 1),
(2, '294db89ddc99705d30b41da007cb2713', 'http://play.marcelomotta.com/play/index.php?ssid=294db89ddc99705d30b41da007cb2713&type=song&oid=10792&uid=1&name=1995%20-%20Vamo%20Bat-%20Lata%20-%2001%20-%20A%20Novidade.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=10792\" title=\"1995 - Vamo Bat&ecirc; Lata - 01 - A Novidade\"> 01 - A Novidade</a>', 'http://play.marcelomotta.com/image.php?object_id=742&object_type=album&auth=294db89ddc99705d30b41da007cb2713&thumb=3', '01 - A Novidade', '1995 - Vamo Batê Lata', '#1', 'song', 276, NULL, 1),
(3, '24629bb5587619595a1cedc9f7568f9b', 'http://play.marcelomotta.com/play/index.php?ssid=24629bb5587619595a1cedc9f7568f9b&type=song&oid=8971&uid=1&name=Amy%20Winehouse%20-%20Rehab.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=8971\" title=\"Amy Winehouse - Rehab\"> Rehab</a>', 'http://play.marcelomotta.com/image.php?object_id=661&object_type=album&auth=24629bb5587619595a1cedc9f7568f9b&thumb=3', 'Rehab', 'Amy Winehouse', 'Back To Black', 'song', 214, NULL, 1),
(4, '24629bb5587619595a1cedc9f7568f9b', 'http://play.marcelomotta.com/play/index.php?ssid=24629bb5587619595a1cedc9f7568f9b&type=song&oid=8966&uid=1&name=Amy%20Winehouse%20-%20You%20Know%20I-m%20No%20Good.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=8966\" title=\"Amy Winehouse - You Know I&#039;m No Good\"> You Know I&#039;m No Good</a>', 'http://play.marcelomotta.com/image.php?object_id=661&object_type=album&auth=24629bb5587619595a1cedc9f7568f9b&thumb=3', 'You Know I\'m No Good', 'Amy Winehouse', 'Back To Black', 'song', 257, NULL, 2),
(5, '24629bb5587619595a1cedc9f7568f9b', 'http://play.marcelomotta.com/play/index.php?ssid=24629bb5587619595a1cedc9f7568f9b&type=song&oid=8987&uid=1&name=Amy%20Winehouse%20-%20Me%20-%20Mr.%20Jones.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=8987\" title=\"Amy Winehouse - Me &amp; Mr. Jones\"> Me &amp; Mr. Jones</a>', 'http://play.marcelomotta.com/image.php?object_id=661&object_type=album&auth=24629bb5587619595a1cedc9f7568f9b&thumb=3', 'Me & Mr. Jones', 'Amy Winehouse', 'Back To Black', 'song', 153, NULL, 3),
(6, '24629bb5587619595a1cedc9f7568f9b', 'http://play.marcelomotta.com/play/index.php?ssid=24629bb5587619595a1cedc9f7568f9b&type=song&oid=8974&uid=1&name=Amy%20Winehouse%20-%20Just%20Friends.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=8974\" title=\"Amy Winehouse - Just Friends\"> Just Friends</a>', 'http://play.marcelomotta.com/image.php?object_id=661&object_type=album&auth=24629bb5587619595a1cedc9f7568f9b&thumb=3', 'Just Friends', 'Amy Winehouse', 'Back To Black', 'song', 193, NULL, 4),
(7, '24629bb5587619595a1cedc9f7568f9b', 'http://play.marcelomotta.com/play/index.php?ssid=24629bb5587619595a1cedc9f7568f9b&type=song&oid=8985&uid=1&name=Amy%20Winehouse%20-%20Back%20To%20Black.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=8985\" title=\"Amy Winehouse - Back To Black\"> Back To Black</a>', 'http://play.marcelomotta.com/image.php?object_id=661&object_type=album&auth=24629bb5587619595a1cedc9f7568f9b&thumb=3', 'Back To Black', 'Amy Winehouse', 'Back To Black', 'song', 241, NULL, 5),
(8, '24629bb5587619595a1cedc9f7568f9b', 'http://play.marcelomotta.com/play/index.php?ssid=24629bb5587619595a1cedc9f7568f9b&type=song&oid=8964&uid=1&name=Amy%20Winehouse%20-%20Love%20Is%20A%20Losing%20Game.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=8964\" title=\"Amy Winehouse - Love Is A Losing Game\"> Love Is A Losing Game</a>', 'http://play.marcelomotta.com/image.php?object_id=661&object_type=album&auth=24629bb5587619595a1cedc9f7568f9b&thumb=3', 'Love Is A Losing Game', 'Amy Winehouse', 'Back To Black', 'song', 155, NULL, 6),
(9, '24629bb5587619595a1cedc9f7568f9b', 'http://play.marcelomotta.com/play/index.php?ssid=24629bb5587619595a1cedc9f7568f9b&type=song&oid=8990&uid=1&name=Amy%20Winehouse%20-%20Tears%20Dry%20On%20Their%20Own.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=8990\" title=\"Amy Winehouse - Tears Dry On Their Own\"> Tears Dry On Their Own</a>', 'http://play.marcelomotta.com/image.php?object_id=661&object_type=album&auth=24629bb5587619595a1cedc9f7568f9b&thumb=3', 'Tears Dry On Their Own', 'Amy Winehouse', 'Back To Black', 'song', 186, NULL, 7),
(10, '24629bb5587619595a1cedc9f7568f9b', 'http://play.marcelomotta.com/play/index.php?ssid=24629bb5587619595a1cedc9f7568f9b&type=song&oid=8983&uid=1&name=Amy%20Winehouse%20-%20Wake%20Up%20Alone.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=8983\" title=\"Amy Winehouse - Wake Up Alone\"> Wake Up Alone</a>', 'http://play.marcelomotta.com/image.php?object_id=661&object_type=album&auth=24629bb5587619595a1cedc9f7568f9b&thumb=3', 'Wake Up Alone', 'Amy Winehouse', 'Back To Black', 'song', 222, NULL, 8),
(11, '24629bb5587619595a1cedc9f7568f9b', 'http://play.marcelomotta.com/play/index.php?ssid=24629bb5587619595a1cedc9f7568f9b&type=song&oid=8976&uid=1&name=Amy%20Winehouse%20-%20Some%20Unholy%20War.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=8976\" title=\"Amy Winehouse - Some Unholy War\"> Some Unholy War</a>', 'http://play.marcelomotta.com/image.php?object_id=661&object_type=album&auth=24629bb5587619595a1cedc9f7568f9b&thumb=3', 'Some Unholy War', 'Amy Winehouse', 'Back To Black', 'song', 142, NULL, 9),
(12, '24629bb5587619595a1cedc9f7568f9b', 'http://play.marcelomotta.com/play/index.php?ssid=24629bb5587619595a1cedc9f7568f9b&type=song&oid=8980&uid=1&name=Amy%20Winehouse%20-%20He%20Can%20Only%20Hold%20Her.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=8980\" title=\"Amy Winehouse - He Can Only Hold Her\"> He Can Only Hold Her</a>', 'http://play.marcelomotta.com/image.php?object_id=661&object_type=album&auth=24629bb5587619595a1cedc9f7568f9b&thumb=3', 'He Can Only Hold Her', 'Amy Winehouse', 'Back To Black', 'song', 166, NULL, 10),
(13, '24629bb5587619595a1cedc9f7568f9b', 'http://play.marcelomotta.com/play/index.php?ssid=24629bb5587619595a1cedc9f7568f9b&type=song&oid=8994&uid=1&name=Amy%20Winehouse%20-%20Addicted.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=8994\" title=\"Amy Winehouse - Addicted\"> Addicted</a>', 'http://play.marcelomotta.com/image.php?object_id=661&object_type=album&auth=24629bb5587619595a1cedc9f7568f9b&thumb=3', 'Addicted', 'Amy Winehouse', 'Back To Black', 'song', 165, NULL, 11),
(14, 'ac750bbe420dc95dd0dc5af01dcccda7', 'http://play.marcelomotta.com/play/index.php?ssid=ac750bbe420dc95dd0dc5af01dcccda7&type=song&oid=6625&uid=1&name=AC-DC%20-%20Rock%20-n-%20Roll%20Damnation.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6625\" title=\"AC/DC - Rock &#039;n&#039; Roll Damnation\"> Rock &#039;n&#039; Roll Damnation</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ac750bbe420dc95dd0dc5af01dcccda7&thumb=3&name=art.jpg', 'Rock \'n\' Roll Damnation', 'AC/DC', 'Powerage', 'song', 219, NULL, 1),
(15, 'ac750bbe420dc95dd0dc5af01dcccda7', 'http://play.marcelomotta.com/play/index.php?ssid=ac750bbe420dc95dd0dc5af01dcccda7&type=song&oid=16778&uid=1&name=AC-DC%20-%20Rock%20-n-%20Roll%20Damnation.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16778\" title=\"AC/DC - Rock &#039;n&#039; Roll Damnation\"> Rock &#039;n&#039; Roll Damnation</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ac750bbe420dc95dd0dc5af01dcccda7&thumb=3&name=art.jpg', 'Rock \'n\' Roll Damnation', 'AC/DC', 'Powerage', 'song', 219, NULL, 1),
(16, 'ac750bbe420dc95dd0dc5af01dcccda7', 'http://play.marcelomotta.com/play/index.php?ssid=ac750bbe420dc95dd0dc5af01dcccda7&type=song&oid=6628&uid=1&name=AC-DC%20-%20Down%20Payment%20Blues.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6628\" title=\"AC/DC - Down Payment Blues\"> Down Payment Blues</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ac750bbe420dc95dd0dc5af01dcccda7&thumb=3&name=art.jpg', 'Down Payment Blues', 'AC/DC', 'Powerage', 'song', 366, NULL, 2),
(17, 'ac750bbe420dc95dd0dc5af01dcccda7', 'http://play.marcelomotta.com/play/index.php?ssid=ac750bbe420dc95dd0dc5af01dcccda7&type=song&oid=16781&uid=1&name=AC-DC%20-%20Down%20Payment%20Blues.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16781\" title=\"AC/DC - Down Payment Blues\"> Down Payment Blues</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ac750bbe420dc95dd0dc5af01dcccda7&thumb=3&name=art.jpg', 'Down Payment Blues', 'AC/DC', 'Powerage', 'song', 366, NULL, 2),
(18, 'ac750bbe420dc95dd0dc5af01dcccda7', 'http://play.marcelomotta.com/play/index.php?ssid=ac750bbe420dc95dd0dc5af01dcccda7&type=song&oid=6630&uid=1&name=AC-DC%20-%20Gimme%20A%20Bullet.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6630\" title=\"AC/DC - Gimme A Bullet\"> Gimme A Bullet</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ac750bbe420dc95dd0dc5af01dcccda7&thumb=3&name=art.jpg', 'Gimme A Bullet', 'AC/DC', 'Powerage', 'song', 203, NULL, 3),
(19, 'ac750bbe420dc95dd0dc5af01dcccda7', 'http://play.marcelomotta.com/play/index.php?ssid=ac750bbe420dc95dd0dc5af01dcccda7&type=song&oid=16783&uid=1&name=AC-DC%20-%20Gimme%20A%20Bullet.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16783\" title=\"AC/DC - Gimme A Bullet\"> Gimme A Bullet</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ac750bbe420dc95dd0dc5af01dcccda7&thumb=3&name=art.jpg', 'Gimme A Bullet', 'AC/DC', 'Powerage', 'song', 203, NULL, 3),
(20, 'ac750bbe420dc95dd0dc5af01dcccda7', 'http://play.marcelomotta.com/play/index.php?ssid=ac750bbe420dc95dd0dc5af01dcccda7&type=song&oid=6626&uid=1&name=AC-DC%20-%20Riff%20Raff.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6626\" title=\"AC/DC - Riff Raff\"> Riff Raff</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ac750bbe420dc95dd0dc5af01dcccda7&thumb=3&name=art.jpg', 'Riff Raff', 'AC/DC', 'Powerage', 'song', 314, NULL, 4),
(21, 'ac750bbe420dc95dd0dc5af01dcccda7', 'http://play.marcelomotta.com/play/index.php?ssid=ac750bbe420dc95dd0dc5af01dcccda7&type=song&oid=16779&uid=1&name=AC-DC%20-%20Riff%20Raff.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16779\" title=\"AC/DC - Riff Raff\"> Riff Raff</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ac750bbe420dc95dd0dc5af01dcccda7&thumb=3&name=art.jpg', 'Riff Raff', 'AC/DC', 'Powerage', 'song', 314, NULL, 4),
(22, 'ac750bbe420dc95dd0dc5af01dcccda7', 'http://play.marcelomotta.com/play/index.php?ssid=ac750bbe420dc95dd0dc5af01dcccda7&type=song&oid=6624&uid=1&name=AC-DC%20-%20Sin%20City.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6624\" title=\"AC/DC - Sin City\"> Sin City</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ac750bbe420dc95dd0dc5af01dcccda7&thumb=3&name=art.jpg', 'Sin City', 'AC/DC', 'Powerage', 'song', 286, NULL, 5),
(23, 'ac750bbe420dc95dd0dc5af01dcccda7', 'http://play.marcelomotta.com/play/index.php?ssid=ac750bbe420dc95dd0dc5af01dcccda7&type=song&oid=16777&uid=1&name=AC-DC%20-%20Sin%20City.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16777\" title=\"AC/DC - Sin City\"> Sin City</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ac750bbe420dc95dd0dc5af01dcccda7&thumb=3&name=art.jpg', 'Sin City', 'AC/DC', 'Powerage', 'song', 286, NULL, 5),
(24, 'ac750bbe420dc95dd0dc5af01dcccda7', 'http://play.marcelomotta.com/play/index.php?ssid=ac750bbe420dc95dd0dc5af01dcccda7&type=song&oid=6623&uid=1&name=AC-DC%20-%20Next%20To%20The%20Moon.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6623\" title=\"AC/DC - Next To The Moon\"> Next To The Moon</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ac750bbe420dc95dd0dc5af01dcccda7&thumb=3&name=art.jpg', 'Next To The Moon', 'AC/DC', 'Powerage', 'song', 213, NULL, 6),
(25, 'ac750bbe420dc95dd0dc5af01dcccda7', 'http://play.marcelomotta.com/play/index.php?ssid=ac750bbe420dc95dd0dc5af01dcccda7&type=song&oid=16776&uid=1&name=AC-DC%20-%20Next%20To%20The%20Moon.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16776\" title=\"AC/DC - Next To The Moon\"> Next To The Moon</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ac750bbe420dc95dd0dc5af01dcccda7&thumb=3&name=art.jpg', 'Next To The Moon', 'AC/DC', 'Powerage', 'song', 213, NULL, 6),
(26, 'ac750bbe420dc95dd0dc5af01dcccda7', 'http://play.marcelomotta.com/play/index.php?ssid=ac750bbe420dc95dd0dc5af01dcccda7&type=song&oid=6627&uid=1&name=AC-DC%20-%20Gone%20Shootin-.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6627\" title=\"AC/DC - Gone Shootin&#039;\"> Gone Shootin&#039;</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ac750bbe420dc95dd0dc5af01dcccda7&thumb=3&name=art.jpg', 'Gone Shootin\'', 'AC/DC', 'Powerage', 'song', 300, NULL, 7),
(27, 'ac750bbe420dc95dd0dc5af01dcccda7', 'http://play.marcelomotta.com/play/index.php?ssid=ac750bbe420dc95dd0dc5af01dcccda7&type=song&oid=16780&uid=1&name=AC-DC%20-%20Gone%20Shootin-.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16780\" title=\"AC/DC - Gone Shootin&#039;\"> Gone Shootin&#039;</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ac750bbe420dc95dd0dc5af01dcccda7&thumb=3&name=art.jpg', 'Gone Shootin\'', 'AC/DC', 'Powerage', 'song', 300, NULL, 7),
(28, 'ac750bbe420dc95dd0dc5af01dcccda7', 'http://play.marcelomotta.com/play/index.php?ssid=ac750bbe420dc95dd0dc5af01dcccda7&type=song&oid=6622&uid=1&name=AC-DC%20-%20Up%20To%20My%20Neck%20In%20You.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6622\" title=\"AC/DC - Up To My Neck In You\"> Up To My Neck In You</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ac750bbe420dc95dd0dc5af01dcccda7&thumb=3&name=art.jpg', 'Up To My Neck In You', 'AC/DC', 'Powerage', 'song', 255, NULL, 8),
(29, 'ac750bbe420dc95dd0dc5af01dcccda7', 'http://play.marcelomotta.com/play/index.php?ssid=ac750bbe420dc95dd0dc5af01dcccda7&type=song&oid=16775&uid=1&name=AC-DC%20-%20Up%20To%20My%20Neck%20In%20You.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16775\" title=\"AC/DC - Up To My Neck In You\"> Up To My Neck In You</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ac750bbe420dc95dd0dc5af01dcccda7&thumb=3&name=art.jpg', 'Up To My Neck In You', 'AC/DC', 'Powerage', 'song', 255, NULL, 8),
(30, 'ac750bbe420dc95dd0dc5af01dcccda7', 'http://play.marcelomotta.com/play/index.php?ssid=ac750bbe420dc95dd0dc5af01dcccda7&type=song&oid=6629&uid=1&name=AC-DC%20-%20Kicked%20In%20The%20Teeth.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6629\" title=\"AC/DC - Kicked In The Teeth\"> Kicked In The Teeth</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ac750bbe420dc95dd0dc5af01dcccda7&thumb=3&name=art.jpg', 'Kicked In The Teeth', 'AC/DC', 'Powerage', 'song', 233, NULL, 9),
(31, 'ac750bbe420dc95dd0dc5af01dcccda7', 'http://play.marcelomotta.com/play/index.php?ssid=ac750bbe420dc95dd0dc5af01dcccda7&type=song&oid=16782&uid=1&name=AC-DC%20-%20Kicked%20In%20The%20Teeth.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16782\" title=\"AC/DC - Kicked In The Teeth\"> Kicked In The Teeth</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ac750bbe420dc95dd0dc5af01dcccda7&thumb=3&name=art.jpg', 'Kicked In The Teeth', 'AC/DC', 'Powerage', 'song', 233, NULL, 9),
(32, '3d81a405d4a73341a72c040a4db350e8', 'http://play.marcelomotta.com/play/index.php?ssid=3d81a405d4a73341a72c040a4db350e8&type=song&oid=6625&uid=1&name=AC-DC%20-%20Rock%20-n-%20Roll%20Damnation.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6625\" title=\"AC/DC - Rock &#039;n&#039; Roll Damnation\"> Rock &#039;n&#039; Roll Damnation</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=3d81a405d4a73341a72c040a4db350e8&thumb=3&name=art.jpg', 'Rock \'n\' Roll Damnation', 'AC/DC', 'Powerage', 'song', 219, NULL, 1),
(33, '3d81a405d4a73341a72c040a4db350e8', 'http://play.marcelomotta.com/play/index.php?ssid=3d81a405d4a73341a72c040a4db350e8&type=song&oid=16778&uid=1&name=AC-DC%20-%20Rock%20-n-%20Roll%20Damnation.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16778\" title=\"AC/DC - Rock &#039;n&#039; Roll Damnation\"> Rock &#039;n&#039; Roll Damnation</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=3d81a405d4a73341a72c040a4db350e8&thumb=3&name=art.jpg', 'Rock \'n\' Roll Damnation', 'AC/DC', 'Powerage', 'song', 219, NULL, 1),
(34, '3d81a405d4a73341a72c040a4db350e8', 'http://play.marcelomotta.com/play/index.php?ssid=3d81a405d4a73341a72c040a4db350e8&type=song&oid=6628&uid=1&name=AC-DC%20-%20Down%20Payment%20Blues.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6628\" title=\"AC/DC - Down Payment Blues\"> Down Payment Blues</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=3d81a405d4a73341a72c040a4db350e8&thumb=3&name=art.jpg', 'Down Payment Blues', 'AC/DC', 'Powerage', 'song', 366, NULL, 2),
(35, '3d81a405d4a73341a72c040a4db350e8', 'http://play.marcelomotta.com/play/index.php?ssid=3d81a405d4a73341a72c040a4db350e8&type=song&oid=16781&uid=1&name=AC-DC%20-%20Down%20Payment%20Blues.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16781\" title=\"AC/DC - Down Payment Blues\"> Down Payment Blues</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=3d81a405d4a73341a72c040a4db350e8&thumb=3&name=art.jpg', 'Down Payment Blues', 'AC/DC', 'Powerage', 'song', 366, NULL, 2),
(36, '3d81a405d4a73341a72c040a4db350e8', 'http://play.marcelomotta.com/play/index.php?ssid=3d81a405d4a73341a72c040a4db350e8&type=song&oid=6630&uid=1&name=AC-DC%20-%20Gimme%20A%20Bullet.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6630\" title=\"AC/DC - Gimme A Bullet\"> Gimme A Bullet</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=3d81a405d4a73341a72c040a4db350e8&thumb=3&name=art.jpg', 'Gimme A Bullet', 'AC/DC', 'Powerage', 'song', 203, NULL, 3),
(37, '3d81a405d4a73341a72c040a4db350e8', 'http://play.marcelomotta.com/play/index.php?ssid=3d81a405d4a73341a72c040a4db350e8&type=song&oid=16783&uid=1&name=AC-DC%20-%20Gimme%20A%20Bullet.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16783\" title=\"AC/DC - Gimme A Bullet\"> Gimme A Bullet</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=3d81a405d4a73341a72c040a4db350e8&thumb=3&name=art.jpg', 'Gimme A Bullet', 'AC/DC', 'Powerage', 'song', 203, NULL, 3),
(38, '3d81a405d4a73341a72c040a4db350e8', 'http://play.marcelomotta.com/play/index.php?ssid=3d81a405d4a73341a72c040a4db350e8&type=song&oid=6626&uid=1&name=AC-DC%20-%20Riff%20Raff.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6626\" title=\"AC/DC - Riff Raff\"> Riff Raff</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=3d81a405d4a73341a72c040a4db350e8&thumb=3&name=art.jpg', 'Riff Raff', 'AC/DC', 'Powerage', 'song', 314, NULL, 4),
(39, '3d81a405d4a73341a72c040a4db350e8', 'http://play.marcelomotta.com/play/index.php?ssid=3d81a405d4a73341a72c040a4db350e8&type=song&oid=16779&uid=1&name=AC-DC%20-%20Riff%20Raff.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16779\" title=\"AC/DC - Riff Raff\"> Riff Raff</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=3d81a405d4a73341a72c040a4db350e8&thumb=3&name=art.jpg', 'Riff Raff', 'AC/DC', 'Powerage', 'song', 314, NULL, 4),
(40, '3d81a405d4a73341a72c040a4db350e8', 'http://play.marcelomotta.com/play/index.php?ssid=3d81a405d4a73341a72c040a4db350e8&type=song&oid=6624&uid=1&name=AC-DC%20-%20Sin%20City.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6624\" title=\"AC/DC - Sin City\"> Sin City</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=3d81a405d4a73341a72c040a4db350e8&thumb=3&name=art.jpg', 'Sin City', 'AC/DC', 'Powerage', 'song', 286, NULL, 5),
(41, '3d81a405d4a73341a72c040a4db350e8', 'http://play.marcelomotta.com/play/index.php?ssid=3d81a405d4a73341a72c040a4db350e8&type=song&oid=16777&uid=1&name=AC-DC%20-%20Sin%20City.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16777\" title=\"AC/DC - Sin City\"> Sin City</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=3d81a405d4a73341a72c040a4db350e8&thumb=3&name=art.jpg', 'Sin City', 'AC/DC', 'Powerage', 'song', 286, NULL, 5),
(42, '3d81a405d4a73341a72c040a4db350e8', 'http://play.marcelomotta.com/play/index.php?ssid=3d81a405d4a73341a72c040a4db350e8&type=song&oid=6623&uid=1&name=AC-DC%20-%20Next%20To%20The%20Moon.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6623\" title=\"AC/DC - Next To The Moon\"> Next To The Moon</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=3d81a405d4a73341a72c040a4db350e8&thumb=3&name=art.jpg', 'Next To The Moon', 'AC/DC', 'Powerage', 'song', 213, NULL, 6),
(43, '3d81a405d4a73341a72c040a4db350e8', 'http://play.marcelomotta.com/play/index.php?ssid=3d81a405d4a73341a72c040a4db350e8&type=song&oid=16776&uid=1&name=AC-DC%20-%20Next%20To%20The%20Moon.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16776\" title=\"AC/DC - Next To The Moon\"> Next To The Moon</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=3d81a405d4a73341a72c040a4db350e8&thumb=3&name=art.jpg', 'Next To The Moon', 'AC/DC', 'Powerage', 'song', 213, NULL, 6),
(44, '3d81a405d4a73341a72c040a4db350e8', 'http://play.marcelomotta.com/play/index.php?ssid=3d81a405d4a73341a72c040a4db350e8&type=song&oid=6627&uid=1&name=AC-DC%20-%20Gone%20Shootin-.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6627\" title=\"AC/DC - Gone Shootin&#039;\"> Gone Shootin&#039;</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=3d81a405d4a73341a72c040a4db350e8&thumb=3&name=art.jpg', 'Gone Shootin\'', 'AC/DC', 'Powerage', 'song', 300, NULL, 7),
(45, '3d81a405d4a73341a72c040a4db350e8', 'http://play.marcelomotta.com/play/index.php?ssid=3d81a405d4a73341a72c040a4db350e8&type=song&oid=16780&uid=1&name=AC-DC%20-%20Gone%20Shootin-.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16780\" title=\"AC/DC - Gone Shootin&#039;\"> Gone Shootin&#039;</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=3d81a405d4a73341a72c040a4db350e8&thumb=3&name=art.jpg', 'Gone Shootin\'', 'AC/DC', 'Powerage', 'song', 300, NULL, 7),
(46, '3d81a405d4a73341a72c040a4db350e8', 'http://play.marcelomotta.com/play/index.php?ssid=3d81a405d4a73341a72c040a4db350e8&type=song&oid=6622&uid=1&name=AC-DC%20-%20Up%20To%20My%20Neck%20In%20You.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6622\" title=\"AC/DC - Up To My Neck In You\"> Up To My Neck In You</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=3d81a405d4a73341a72c040a4db350e8&thumb=3&name=art.jpg', 'Up To My Neck In You', 'AC/DC', 'Powerage', 'song', 255, NULL, 8),
(47, '3d81a405d4a73341a72c040a4db350e8', 'http://play.marcelomotta.com/play/index.php?ssid=3d81a405d4a73341a72c040a4db350e8&type=song&oid=16775&uid=1&name=AC-DC%20-%20Up%20To%20My%20Neck%20In%20You.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16775\" title=\"AC/DC - Up To My Neck In You\"> Up To My Neck In You</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=3d81a405d4a73341a72c040a4db350e8&thumb=3&name=art.jpg', 'Up To My Neck In You', 'AC/DC', 'Powerage', 'song', 255, NULL, 8),
(48, '3d81a405d4a73341a72c040a4db350e8', 'http://play.marcelomotta.com/play/index.php?ssid=3d81a405d4a73341a72c040a4db350e8&type=song&oid=6629&uid=1&name=AC-DC%20-%20Kicked%20In%20The%20Teeth.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6629\" title=\"AC/DC - Kicked In The Teeth\"> Kicked In The Teeth</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=3d81a405d4a73341a72c040a4db350e8&thumb=3&name=art.jpg', 'Kicked In The Teeth', 'AC/DC', 'Powerage', 'song', 233, NULL, 9),
(49, '3d81a405d4a73341a72c040a4db350e8', 'http://play.marcelomotta.com/play/index.php?ssid=3d81a405d4a73341a72c040a4db350e8&type=song&oid=16782&uid=1&name=AC-DC%20-%20Kicked%20In%20The%20Teeth.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16782\" title=\"AC/DC - Kicked In The Teeth\"> Kicked In The Teeth</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=3d81a405d4a73341a72c040a4db350e8&thumb=3&name=art.jpg', 'Kicked In The Teeth', 'AC/DC', 'Powerage', 'song', 233, NULL, 9),
(50, 'ae3e064b988abb9efcb60d9646674b3b', 'http://play.marcelomotta.com/play/index.php?ssid=ae3e064b988abb9efcb60d9646674b3b&type=song&oid=6625&uid=1&name=AC-DC%20-%20Rock%20-n-%20Roll%20Damnation.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6625\" title=\"AC/DC - Rock &#039;n&#039; Roll Damnation\"> Rock &#039;n&#039; Roll Damnation</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ae3e064b988abb9efcb60d9646674b3b&thumb=3&name=art.jpg', 'Rock \'n\' Roll Damnation', 'AC/DC', 'Powerage', 'song', 219, NULL, 1),
(51, 'ae3e064b988abb9efcb60d9646674b3b', 'http://play.marcelomotta.com/play/index.php?ssid=ae3e064b988abb9efcb60d9646674b3b&type=song&oid=16778&uid=1&name=AC-DC%20-%20Rock%20-n-%20Roll%20Damnation.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16778\" title=\"AC/DC - Rock &#039;n&#039; Roll Damnation\"> Rock &#039;n&#039; Roll Damnation</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ae3e064b988abb9efcb60d9646674b3b&thumb=3&name=art.jpg', 'Rock \'n\' Roll Damnation', 'AC/DC', 'Powerage', 'song', 219, NULL, 1),
(52, 'ae3e064b988abb9efcb60d9646674b3b', 'http://play.marcelomotta.com/play/index.php?ssid=ae3e064b988abb9efcb60d9646674b3b&type=song&oid=6628&uid=1&name=AC-DC%20-%20Down%20Payment%20Blues.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6628\" title=\"AC/DC - Down Payment Blues\"> Down Payment Blues</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ae3e064b988abb9efcb60d9646674b3b&thumb=3&name=art.jpg', 'Down Payment Blues', 'AC/DC', 'Powerage', 'song', 366, NULL, 2),
(53, 'ae3e064b988abb9efcb60d9646674b3b', 'http://play.marcelomotta.com/play/index.php?ssid=ae3e064b988abb9efcb60d9646674b3b&type=song&oid=16781&uid=1&name=AC-DC%20-%20Down%20Payment%20Blues.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16781\" title=\"AC/DC - Down Payment Blues\"> Down Payment Blues</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ae3e064b988abb9efcb60d9646674b3b&thumb=3&name=art.jpg', 'Down Payment Blues', 'AC/DC', 'Powerage', 'song', 366, NULL, 2),
(54, 'ae3e064b988abb9efcb60d9646674b3b', 'http://play.marcelomotta.com/play/index.php?ssid=ae3e064b988abb9efcb60d9646674b3b&type=song&oid=6630&uid=1&name=AC-DC%20-%20Gimme%20A%20Bullet.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6630\" title=\"AC/DC - Gimme A Bullet\"> Gimme A Bullet</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ae3e064b988abb9efcb60d9646674b3b&thumb=3&name=art.jpg', 'Gimme A Bullet', 'AC/DC', 'Powerage', 'song', 203, NULL, 3),
(55, 'ae3e064b988abb9efcb60d9646674b3b', 'http://play.marcelomotta.com/play/index.php?ssid=ae3e064b988abb9efcb60d9646674b3b&type=song&oid=16783&uid=1&name=AC-DC%20-%20Gimme%20A%20Bullet.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16783\" title=\"AC/DC - Gimme A Bullet\"> Gimme A Bullet</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ae3e064b988abb9efcb60d9646674b3b&thumb=3&name=art.jpg', 'Gimme A Bullet', 'AC/DC', 'Powerage', 'song', 203, NULL, 3),
(56, 'ae3e064b988abb9efcb60d9646674b3b', 'http://play.marcelomotta.com/play/index.php?ssid=ae3e064b988abb9efcb60d9646674b3b&type=song&oid=6626&uid=1&name=AC-DC%20-%20Riff%20Raff.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6626\" title=\"AC/DC - Riff Raff\"> Riff Raff</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ae3e064b988abb9efcb60d9646674b3b&thumb=3&name=art.jpg', 'Riff Raff', 'AC/DC', 'Powerage', 'song', 314, NULL, 4),
(57, 'ae3e064b988abb9efcb60d9646674b3b', 'http://play.marcelomotta.com/play/index.php?ssid=ae3e064b988abb9efcb60d9646674b3b&type=song&oid=16779&uid=1&name=AC-DC%20-%20Riff%20Raff.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16779\" title=\"AC/DC - Riff Raff\"> Riff Raff</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ae3e064b988abb9efcb60d9646674b3b&thumb=3&name=art.jpg', 'Riff Raff', 'AC/DC', 'Powerage', 'song', 314, NULL, 4),
(58, 'ae3e064b988abb9efcb60d9646674b3b', 'http://play.marcelomotta.com/play/index.php?ssid=ae3e064b988abb9efcb60d9646674b3b&type=song&oid=6624&uid=1&name=AC-DC%20-%20Sin%20City.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6624\" title=\"AC/DC - Sin City\"> Sin City</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ae3e064b988abb9efcb60d9646674b3b&thumb=3&name=art.jpg', 'Sin City', 'AC/DC', 'Powerage', 'song', 286, NULL, 5),
(59, 'ae3e064b988abb9efcb60d9646674b3b', 'http://play.marcelomotta.com/play/index.php?ssid=ae3e064b988abb9efcb60d9646674b3b&type=song&oid=16777&uid=1&name=AC-DC%20-%20Sin%20City.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16777\" title=\"AC/DC - Sin City\"> Sin City</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ae3e064b988abb9efcb60d9646674b3b&thumb=3&name=art.jpg', 'Sin City', 'AC/DC', 'Powerage', 'song', 286, NULL, 5),
(60, 'ae3e064b988abb9efcb60d9646674b3b', 'http://play.marcelomotta.com/play/index.php?ssid=ae3e064b988abb9efcb60d9646674b3b&type=song&oid=6623&uid=1&name=AC-DC%20-%20Next%20To%20The%20Moon.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6623\" title=\"AC/DC - Next To The Moon\"> Next To The Moon</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ae3e064b988abb9efcb60d9646674b3b&thumb=3&name=art.jpg', 'Next To The Moon', 'AC/DC', 'Powerage', 'song', 213, NULL, 6),
(61, 'ae3e064b988abb9efcb60d9646674b3b', 'http://play.marcelomotta.com/play/index.php?ssid=ae3e064b988abb9efcb60d9646674b3b&type=song&oid=16776&uid=1&name=AC-DC%20-%20Next%20To%20The%20Moon.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16776\" title=\"AC/DC - Next To The Moon\"> Next To The Moon</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ae3e064b988abb9efcb60d9646674b3b&thumb=3&name=art.jpg', 'Next To The Moon', 'AC/DC', 'Powerage', 'song', 213, NULL, 6),
(62, 'ae3e064b988abb9efcb60d9646674b3b', 'http://play.marcelomotta.com/play/index.php?ssid=ae3e064b988abb9efcb60d9646674b3b&type=song&oid=6627&uid=1&name=AC-DC%20-%20Gone%20Shootin-.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6627\" title=\"AC/DC - Gone Shootin&#039;\"> Gone Shootin&#039;</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ae3e064b988abb9efcb60d9646674b3b&thumb=3&name=art.jpg', 'Gone Shootin\'', 'AC/DC', 'Powerage', 'song', 300, NULL, 7),
(63, 'ae3e064b988abb9efcb60d9646674b3b', 'http://play.marcelomotta.com/play/index.php?ssid=ae3e064b988abb9efcb60d9646674b3b&type=song&oid=16780&uid=1&name=AC-DC%20-%20Gone%20Shootin-.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16780\" title=\"AC/DC - Gone Shootin&#039;\"> Gone Shootin&#039;</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ae3e064b988abb9efcb60d9646674b3b&thumb=3&name=art.jpg', 'Gone Shootin\'', 'AC/DC', 'Powerage', 'song', 300, NULL, 7),
(64, 'ae3e064b988abb9efcb60d9646674b3b', 'http://play.marcelomotta.com/play/index.php?ssid=ae3e064b988abb9efcb60d9646674b3b&type=song&oid=6622&uid=1&name=AC-DC%20-%20Up%20To%20My%20Neck%20In%20You.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6622\" title=\"AC/DC - Up To My Neck In You\"> Up To My Neck In You</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ae3e064b988abb9efcb60d9646674b3b&thumb=3&name=art.jpg', 'Up To My Neck In You', 'AC/DC', 'Powerage', 'song', 255, NULL, 8),
(65, 'ae3e064b988abb9efcb60d9646674b3b', 'http://play.marcelomotta.com/play/index.php?ssid=ae3e064b988abb9efcb60d9646674b3b&type=song&oid=16775&uid=1&name=AC-DC%20-%20Up%20To%20My%20Neck%20In%20You.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16775\" title=\"AC/DC - Up To My Neck In You\"> Up To My Neck In You</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ae3e064b988abb9efcb60d9646674b3b&thumb=3&name=art.jpg', 'Up To My Neck In You', 'AC/DC', 'Powerage', 'song', 255, NULL, 8),
(66, 'ae3e064b988abb9efcb60d9646674b3b', 'http://play.marcelomotta.com/play/index.php?ssid=ae3e064b988abb9efcb60d9646674b3b&type=song&oid=6629&uid=1&name=AC-DC%20-%20Kicked%20In%20The%20Teeth.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6629\" title=\"AC/DC - Kicked In The Teeth\"> Kicked In The Teeth</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ae3e064b988abb9efcb60d9646674b3b&thumb=3&name=art.jpg', 'Kicked In The Teeth', 'AC/DC', 'Powerage', 'song', 233, NULL, 9),
(67, 'ae3e064b988abb9efcb60d9646674b3b', 'http://play.marcelomotta.com/play/index.php?ssid=ae3e064b988abb9efcb60d9646674b3b&type=song&oid=16782&uid=1&name=AC-DC%20-%20Kicked%20In%20The%20Teeth.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16782\" title=\"AC/DC - Kicked In The Teeth\"> Kicked In The Teeth</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=ae3e064b988abb9efcb60d9646674b3b&thumb=3&name=art.jpg', 'Kicked In The Teeth', 'AC/DC', 'Powerage', 'song', 233, NULL, 9),
(68, 'f8d4cc833bce1481cc8861e9e6948337', 'http://play.marcelomotta.com/play/index.php?ssid=f8d4cc833bce1481cc8861e9e6948337&type=song&oid=6625&uid=1&name=AC-DC%20-%20Rock%20-n-%20Roll%20Damnation.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6625\" title=\"AC/DC - Rock &#039;n&#039; Roll Damnation\"> Rock &#039;n&#039; Roll Damnation</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=f8d4cc833bce1481cc8861e9e6948337&thumb=3&name=art.jpg', 'Rock \'n\' Roll Damnation', 'AC/DC', 'Powerage', 'song', 219, NULL, 1),
(69, 'f8d4cc833bce1481cc8861e9e6948337', 'http://play.marcelomotta.com/play/index.php?ssid=f8d4cc833bce1481cc8861e9e6948337&type=song&oid=16778&uid=1&name=AC-DC%20-%20Rock%20-n-%20Roll%20Damnation.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16778\" title=\"AC/DC - Rock &#039;n&#039; Roll Damnation\"> Rock &#039;n&#039; Roll Damnation</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=f8d4cc833bce1481cc8861e9e6948337&thumb=3&name=art.jpg', 'Rock \'n\' Roll Damnation', 'AC/DC', 'Powerage', 'song', 219, NULL, 1),
(70, 'f8d4cc833bce1481cc8861e9e6948337', 'http://play.marcelomotta.com/play/index.php?ssid=f8d4cc833bce1481cc8861e9e6948337&type=song&oid=6628&uid=1&name=AC-DC%20-%20Down%20Payment%20Blues.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6628\" title=\"AC/DC - Down Payment Blues\"> Down Payment Blues</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=f8d4cc833bce1481cc8861e9e6948337&thumb=3&name=art.jpg', 'Down Payment Blues', 'AC/DC', 'Powerage', 'song', 366, NULL, 2),
(71, 'f8d4cc833bce1481cc8861e9e6948337', 'http://play.marcelomotta.com/play/index.php?ssid=f8d4cc833bce1481cc8861e9e6948337&type=song&oid=16781&uid=1&name=AC-DC%20-%20Down%20Payment%20Blues.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16781\" title=\"AC/DC - Down Payment Blues\"> Down Payment Blues</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=f8d4cc833bce1481cc8861e9e6948337&thumb=3&name=art.jpg', 'Down Payment Blues', 'AC/DC', 'Powerage', 'song', 366, NULL, 2),
(72, 'f8d4cc833bce1481cc8861e9e6948337', 'http://play.marcelomotta.com/play/index.php?ssid=f8d4cc833bce1481cc8861e9e6948337&type=song&oid=6630&uid=1&name=AC-DC%20-%20Gimme%20A%20Bullet.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6630\" title=\"AC/DC - Gimme A Bullet\"> Gimme A Bullet</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=f8d4cc833bce1481cc8861e9e6948337&thumb=3&name=art.jpg', 'Gimme A Bullet', 'AC/DC', 'Powerage', 'song', 203, NULL, 3),
(73, 'f8d4cc833bce1481cc8861e9e6948337', 'http://play.marcelomotta.com/play/index.php?ssid=f8d4cc833bce1481cc8861e9e6948337&type=song&oid=16783&uid=1&name=AC-DC%20-%20Gimme%20A%20Bullet.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16783\" title=\"AC/DC - Gimme A Bullet\"> Gimme A Bullet</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=f8d4cc833bce1481cc8861e9e6948337&thumb=3&name=art.jpg', 'Gimme A Bullet', 'AC/DC', 'Powerage', 'song', 203, NULL, 3),
(74, 'f8d4cc833bce1481cc8861e9e6948337', 'http://play.marcelomotta.com/play/index.php?ssid=f8d4cc833bce1481cc8861e9e6948337&type=song&oid=6626&uid=1&name=AC-DC%20-%20Riff%20Raff.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6626\" title=\"AC/DC - Riff Raff\"> Riff Raff</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=f8d4cc833bce1481cc8861e9e6948337&thumb=3&name=art.jpg', 'Riff Raff', 'AC/DC', 'Powerage', 'song', 314, NULL, 4),
(75, 'f8d4cc833bce1481cc8861e9e6948337', 'http://play.marcelomotta.com/play/index.php?ssid=f8d4cc833bce1481cc8861e9e6948337&type=song&oid=16779&uid=1&name=AC-DC%20-%20Riff%20Raff.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16779\" title=\"AC/DC - Riff Raff\"> Riff Raff</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=f8d4cc833bce1481cc8861e9e6948337&thumb=3&name=art.jpg', 'Riff Raff', 'AC/DC', 'Powerage', 'song', 314, NULL, 4),
(76, 'f8d4cc833bce1481cc8861e9e6948337', 'http://play.marcelomotta.com/play/index.php?ssid=f8d4cc833bce1481cc8861e9e6948337&type=song&oid=6624&uid=1&name=AC-DC%20-%20Sin%20City.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6624\" title=\"AC/DC - Sin City\"> Sin City</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=f8d4cc833bce1481cc8861e9e6948337&thumb=3&name=art.jpg', 'Sin City', 'AC/DC', 'Powerage', 'song', 286, NULL, 5),
(77, 'f8d4cc833bce1481cc8861e9e6948337', 'http://play.marcelomotta.com/play/index.php?ssid=f8d4cc833bce1481cc8861e9e6948337&type=song&oid=16777&uid=1&name=AC-DC%20-%20Sin%20City.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16777\" title=\"AC/DC - Sin City\"> Sin City</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=f8d4cc833bce1481cc8861e9e6948337&thumb=3&name=art.jpg', 'Sin City', 'AC/DC', 'Powerage', 'song', 286, NULL, 5),
(78, 'f8d4cc833bce1481cc8861e9e6948337', 'http://play.marcelomotta.com/play/index.php?ssid=f8d4cc833bce1481cc8861e9e6948337&type=song&oid=6623&uid=1&name=AC-DC%20-%20Next%20To%20The%20Moon.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6623\" title=\"AC/DC - Next To The Moon\"> Next To The Moon</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=f8d4cc833bce1481cc8861e9e6948337&thumb=3&name=art.jpg', 'Next To The Moon', 'AC/DC', 'Powerage', 'song', 213, NULL, 6),
(79, 'f8d4cc833bce1481cc8861e9e6948337', 'http://play.marcelomotta.com/play/index.php?ssid=f8d4cc833bce1481cc8861e9e6948337&type=song&oid=16776&uid=1&name=AC-DC%20-%20Next%20To%20The%20Moon.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16776\" title=\"AC/DC - Next To The Moon\"> Next To The Moon</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=f8d4cc833bce1481cc8861e9e6948337&thumb=3&name=art.jpg', 'Next To The Moon', 'AC/DC', 'Powerage', 'song', 213, NULL, 6),
(80, 'f8d4cc833bce1481cc8861e9e6948337', 'http://play.marcelomotta.com/play/index.php?ssid=f8d4cc833bce1481cc8861e9e6948337&type=song&oid=6627&uid=1&name=AC-DC%20-%20Gone%20Shootin-.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6627\" title=\"AC/DC - Gone Shootin&#039;\"> Gone Shootin&#039;</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=f8d4cc833bce1481cc8861e9e6948337&thumb=3&name=art.jpg', 'Gone Shootin\'', 'AC/DC', 'Powerage', 'song', 300, NULL, 7),
(81, 'f8d4cc833bce1481cc8861e9e6948337', 'http://play.marcelomotta.com/play/index.php?ssid=f8d4cc833bce1481cc8861e9e6948337&type=song&oid=16780&uid=1&name=AC-DC%20-%20Gone%20Shootin-.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16780\" title=\"AC/DC - Gone Shootin&#039;\"> Gone Shootin&#039;</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=f8d4cc833bce1481cc8861e9e6948337&thumb=3&name=art.jpg', 'Gone Shootin\'', 'AC/DC', 'Powerage', 'song', 300, NULL, 7),
(82, 'f8d4cc833bce1481cc8861e9e6948337', 'http://play.marcelomotta.com/play/index.php?ssid=f8d4cc833bce1481cc8861e9e6948337&type=song&oid=6622&uid=1&name=AC-DC%20-%20Up%20To%20My%20Neck%20In%20You.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6622\" title=\"AC/DC - Up To My Neck In You\"> Up To My Neck In You</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=f8d4cc833bce1481cc8861e9e6948337&thumb=3&name=art.jpg', 'Up To My Neck In You', 'AC/DC', 'Powerage', 'song', 255, NULL, 8),
(83, 'f8d4cc833bce1481cc8861e9e6948337', 'http://play.marcelomotta.com/play/index.php?ssid=f8d4cc833bce1481cc8861e9e6948337&type=song&oid=16775&uid=1&name=AC-DC%20-%20Up%20To%20My%20Neck%20In%20You.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16775\" title=\"AC/DC - Up To My Neck In You\"> Up To My Neck In You</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=f8d4cc833bce1481cc8861e9e6948337&thumb=3&name=art.jpg', 'Up To My Neck In You', 'AC/DC', 'Powerage', 'song', 255, NULL, 8),
(84, 'f8d4cc833bce1481cc8861e9e6948337', 'http://play.marcelomotta.com/play/index.php?ssid=f8d4cc833bce1481cc8861e9e6948337&type=song&oid=6629&uid=1&name=AC-DC%20-%20Kicked%20In%20The%20Teeth.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6629\" title=\"AC/DC - Kicked In The Teeth\"> Kicked In The Teeth</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=f8d4cc833bce1481cc8861e9e6948337&thumb=3&name=art.jpg', 'Kicked In The Teeth', 'AC/DC', 'Powerage', 'song', 233, NULL, 9),
(85, 'f8d4cc833bce1481cc8861e9e6948337', 'http://play.marcelomotta.com/play/index.php?ssid=f8d4cc833bce1481cc8861e9e6948337&type=song&oid=16782&uid=1&name=AC-DC%20-%20Kicked%20In%20The%20Teeth.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16782\" title=\"AC/DC - Kicked In The Teeth\"> Kicked In The Teeth</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=f8d4cc833bce1481cc8861e9e6948337&thumb=3&name=art.jpg', 'Kicked In The Teeth', 'AC/DC', 'Powerage', 'song', 233, NULL, 9),
(86, '2be1643dd719a6749cbe3506b22eb8ab', 'http://play.marcelomotta.com/play/index.php?ssid=2be1643dd719a6749cbe3506b22eb8ab&type=song&oid=6625&uid=1&name=AC-DC%20-%20Rock%20-n-%20Roll%20Damnation.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6625\" title=\"AC/DC - Rock &#039;n&#039; Roll Damnation\"> Rock &#039;n&#039; Roll Damnation</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=2be1643dd719a6749cbe3506b22eb8ab&thumb=3&name=art.jpg', 'Rock \'n\' Roll Damnation', 'AC/DC', 'Powerage', 'song', 219, NULL, 1),
(87, '2be1643dd719a6749cbe3506b22eb8ab', 'http://play.marcelomotta.com/play/index.php?ssid=2be1643dd719a6749cbe3506b22eb8ab&type=song&oid=16778&uid=1&name=AC-DC%20-%20Rock%20-n-%20Roll%20Damnation.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16778\" title=\"AC/DC - Rock &#039;n&#039; Roll Damnation\"> Rock &#039;n&#039; Roll Damnation</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=2be1643dd719a6749cbe3506b22eb8ab&thumb=3&name=art.jpg', 'Rock \'n\' Roll Damnation', 'AC/DC', 'Powerage', 'song', 219, NULL, 1),
(88, '2be1643dd719a6749cbe3506b22eb8ab', 'http://play.marcelomotta.com/play/index.php?ssid=2be1643dd719a6749cbe3506b22eb8ab&type=song&oid=6628&uid=1&name=AC-DC%20-%20Down%20Payment%20Blues.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6628\" title=\"AC/DC - Down Payment Blues\"> Down Payment Blues</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=2be1643dd719a6749cbe3506b22eb8ab&thumb=3&name=art.jpg', 'Down Payment Blues', 'AC/DC', 'Powerage', 'song', 366, NULL, 2),
(89, '2be1643dd719a6749cbe3506b22eb8ab', 'http://play.marcelomotta.com/play/index.php?ssid=2be1643dd719a6749cbe3506b22eb8ab&type=song&oid=16781&uid=1&name=AC-DC%20-%20Down%20Payment%20Blues.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16781\" title=\"AC/DC - Down Payment Blues\"> Down Payment Blues</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=2be1643dd719a6749cbe3506b22eb8ab&thumb=3&name=art.jpg', 'Down Payment Blues', 'AC/DC', 'Powerage', 'song', 366, NULL, 2),
(90, '2be1643dd719a6749cbe3506b22eb8ab', 'http://play.marcelomotta.com/play/index.php?ssid=2be1643dd719a6749cbe3506b22eb8ab&type=song&oid=6630&uid=1&name=AC-DC%20-%20Gimme%20A%20Bullet.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6630\" title=\"AC/DC - Gimme A Bullet\"> Gimme A Bullet</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=2be1643dd719a6749cbe3506b22eb8ab&thumb=3&name=art.jpg', 'Gimme A Bullet', 'AC/DC', 'Powerage', 'song', 203, NULL, 3),
(91, '2be1643dd719a6749cbe3506b22eb8ab', 'http://play.marcelomotta.com/play/index.php?ssid=2be1643dd719a6749cbe3506b22eb8ab&type=song&oid=16783&uid=1&name=AC-DC%20-%20Gimme%20A%20Bullet.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16783\" title=\"AC/DC - Gimme A Bullet\"> Gimme A Bullet</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=2be1643dd719a6749cbe3506b22eb8ab&thumb=3&name=art.jpg', 'Gimme A Bullet', 'AC/DC', 'Powerage', 'song', 203, NULL, 3),
(92, '2be1643dd719a6749cbe3506b22eb8ab', 'http://play.marcelomotta.com/play/index.php?ssid=2be1643dd719a6749cbe3506b22eb8ab&type=song&oid=6626&uid=1&name=AC-DC%20-%20Riff%20Raff.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6626\" title=\"AC/DC - Riff Raff\"> Riff Raff</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=2be1643dd719a6749cbe3506b22eb8ab&thumb=3&name=art.jpg', 'Riff Raff', 'AC/DC', 'Powerage', 'song', 314, NULL, 4);
INSERT INTO `stream_playlist` (`id`, `sid`, `url`, `info_url`, `image_url`, `title`, `author`, `album`, `type`, `time`, `codec`, `track_num`) VALUES
(93, '2be1643dd719a6749cbe3506b22eb8ab', 'http://play.marcelomotta.com/play/index.php?ssid=2be1643dd719a6749cbe3506b22eb8ab&type=song&oid=16779&uid=1&name=AC-DC%20-%20Riff%20Raff.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16779\" title=\"AC/DC - Riff Raff\"> Riff Raff</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=2be1643dd719a6749cbe3506b22eb8ab&thumb=3&name=art.jpg', 'Riff Raff', 'AC/DC', 'Powerage', 'song', 314, NULL, 4),
(94, '2be1643dd719a6749cbe3506b22eb8ab', 'http://play.marcelomotta.com/play/index.php?ssid=2be1643dd719a6749cbe3506b22eb8ab&type=song&oid=6624&uid=1&name=AC-DC%20-%20Sin%20City.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6624\" title=\"AC/DC - Sin City\"> Sin City</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=2be1643dd719a6749cbe3506b22eb8ab&thumb=3&name=art.jpg', 'Sin City', 'AC/DC', 'Powerage', 'song', 286, NULL, 5),
(95, '2be1643dd719a6749cbe3506b22eb8ab', 'http://play.marcelomotta.com/play/index.php?ssid=2be1643dd719a6749cbe3506b22eb8ab&type=song&oid=16777&uid=1&name=AC-DC%20-%20Sin%20City.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16777\" title=\"AC/DC - Sin City\"> Sin City</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=2be1643dd719a6749cbe3506b22eb8ab&thumb=3&name=art.jpg', 'Sin City', 'AC/DC', 'Powerage', 'song', 286, NULL, 5),
(96, '2be1643dd719a6749cbe3506b22eb8ab', 'http://play.marcelomotta.com/play/index.php?ssid=2be1643dd719a6749cbe3506b22eb8ab&type=song&oid=6623&uid=1&name=AC-DC%20-%20Next%20To%20The%20Moon.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6623\" title=\"AC/DC - Next To The Moon\"> Next To The Moon</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=2be1643dd719a6749cbe3506b22eb8ab&thumb=3&name=art.jpg', 'Next To The Moon', 'AC/DC', 'Powerage', 'song', 213, NULL, 6),
(97, '2be1643dd719a6749cbe3506b22eb8ab', 'http://play.marcelomotta.com/play/index.php?ssid=2be1643dd719a6749cbe3506b22eb8ab&type=song&oid=16776&uid=1&name=AC-DC%20-%20Next%20To%20The%20Moon.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16776\" title=\"AC/DC - Next To The Moon\"> Next To The Moon</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=2be1643dd719a6749cbe3506b22eb8ab&thumb=3&name=art.jpg', 'Next To The Moon', 'AC/DC', 'Powerage', 'song', 213, NULL, 6),
(98, '2be1643dd719a6749cbe3506b22eb8ab', 'http://play.marcelomotta.com/play/index.php?ssid=2be1643dd719a6749cbe3506b22eb8ab&type=song&oid=6627&uid=1&name=AC-DC%20-%20Gone%20Shootin-.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6627\" title=\"AC/DC - Gone Shootin&#039;\"> Gone Shootin&#039;</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=2be1643dd719a6749cbe3506b22eb8ab&thumb=3&name=art.jpg', 'Gone Shootin\'', 'AC/DC', 'Powerage', 'song', 300, NULL, 7),
(99, '2be1643dd719a6749cbe3506b22eb8ab', 'http://play.marcelomotta.com/play/index.php?ssid=2be1643dd719a6749cbe3506b22eb8ab&type=song&oid=16780&uid=1&name=AC-DC%20-%20Gone%20Shootin-.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16780\" title=\"AC/DC - Gone Shootin&#039;\"> Gone Shootin&#039;</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=2be1643dd719a6749cbe3506b22eb8ab&thumb=3&name=art.jpg', 'Gone Shootin\'', 'AC/DC', 'Powerage', 'song', 300, NULL, 7),
(100, '2be1643dd719a6749cbe3506b22eb8ab', 'http://play.marcelomotta.com/play/index.php?ssid=2be1643dd719a6749cbe3506b22eb8ab&type=song&oid=6622&uid=1&name=AC-DC%20-%20Up%20To%20My%20Neck%20In%20You.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6622\" title=\"AC/DC - Up To My Neck In You\"> Up To My Neck In You</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=2be1643dd719a6749cbe3506b22eb8ab&thumb=3&name=art.jpg', 'Up To My Neck In You', 'AC/DC', 'Powerage', 'song', 255, NULL, 8),
(101, '2be1643dd719a6749cbe3506b22eb8ab', 'http://play.marcelomotta.com/play/index.php?ssid=2be1643dd719a6749cbe3506b22eb8ab&type=song&oid=16775&uid=1&name=AC-DC%20-%20Up%20To%20My%20Neck%20In%20You.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16775\" title=\"AC/DC - Up To My Neck In You\"> Up To My Neck In You</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=2be1643dd719a6749cbe3506b22eb8ab&thumb=3&name=art.jpg', 'Up To My Neck In You', 'AC/DC', 'Powerage', 'song', 255, NULL, 8),
(102, '2be1643dd719a6749cbe3506b22eb8ab', 'http://play.marcelomotta.com/play/index.php?ssid=2be1643dd719a6749cbe3506b22eb8ab&type=song&oid=6629&uid=1&name=AC-DC%20-%20Kicked%20In%20The%20Teeth.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6629\" title=\"AC/DC - Kicked In The Teeth\"> Kicked In The Teeth</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=2be1643dd719a6749cbe3506b22eb8ab&thumb=3&name=art.jpg', 'Kicked In The Teeth', 'AC/DC', 'Powerage', 'song', 233, NULL, 9),
(103, '2be1643dd719a6749cbe3506b22eb8ab', 'http://play.marcelomotta.com/play/index.php?ssid=2be1643dd719a6749cbe3506b22eb8ab&type=song&oid=16782&uid=1&name=AC-DC%20-%20Kicked%20In%20The%20Teeth.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16782\" title=\"AC/DC - Kicked In The Teeth\"> Kicked In The Teeth</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=2be1643dd719a6749cbe3506b22eb8ab&thumb=3&name=art.jpg', 'Kicked In The Teeth', 'AC/DC', 'Powerage', 'song', 233, NULL, 9),
(104, '1ab1fa89aad9f6a1a89eecfda564f0b1', 'http://play.marcelomotta.com/play/index.php?ssid=1ab1fa89aad9f6a1a89eecfda564f0b1&type=song&oid=6625&uid=1&name=AC-DC%20-%20Rock%20-n-%20Roll%20Damnation.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6625\" title=\"AC/DC - Rock &#039;n&#039; Roll Damnation\"> Rock &#039;n&#039; Roll Damnation</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=1ab1fa89aad9f6a1a89eecfda564f0b1&thumb=3&name=art.jpg', 'Rock \'n\' Roll Damnation', 'AC/DC', 'Powerage', 'song', 219, NULL, 1),
(105, '1ab1fa89aad9f6a1a89eecfda564f0b1', 'http://play.marcelomotta.com/play/index.php?ssid=1ab1fa89aad9f6a1a89eecfda564f0b1&type=song&oid=16778&uid=1&name=AC-DC%20-%20Rock%20-n-%20Roll%20Damnation.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16778\" title=\"AC/DC - Rock &#039;n&#039; Roll Damnation\"> Rock &#039;n&#039; Roll Damnation</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=1ab1fa89aad9f6a1a89eecfda564f0b1&thumb=3&name=art.jpg', 'Rock \'n\' Roll Damnation', 'AC/DC', 'Powerage', 'song', 219, NULL, 1),
(106, '1ab1fa89aad9f6a1a89eecfda564f0b1', 'http://play.marcelomotta.com/play/index.php?ssid=1ab1fa89aad9f6a1a89eecfda564f0b1&type=song&oid=6628&uid=1&name=AC-DC%20-%20Down%20Payment%20Blues.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6628\" title=\"AC/DC - Down Payment Blues\"> Down Payment Blues</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=1ab1fa89aad9f6a1a89eecfda564f0b1&thumb=3&name=art.jpg', 'Down Payment Blues', 'AC/DC', 'Powerage', 'song', 366, NULL, 2),
(107, '1ab1fa89aad9f6a1a89eecfda564f0b1', 'http://play.marcelomotta.com/play/index.php?ssid=1ab1fa89aad9f6a1a89eecfda564f0b1&type=song&oid=16781&uid=1&name=AC-DC%20-%20Down%20Payment%20Blues.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16781\" title=\"AC/DC - Down Payment Blues\"> Down Payment Blues</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=1ab1fa89aad9f6a1a89eecfda564f0b1&thumb=3&name=art.jpg', 'Down Payment Blues', 'AC/DC', 'Powerage', 'song', 366, NULL, 2),
(108, '1ab1fa89aad9f6a1a89eecfda564f0b1', 'http://play.marcelomotta.com/play/index.php?ssid=1ab1fa89aad9f6a1a89eecfda564f0b1&type=song&oid=6630&uid=1&name=AC-DC%20-%20Gimme%20A%20Bullet.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6630\" title=\"AC/DC - Gimme A Bullet\"> Gimme A Bullet</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=1ab1fa89aad9f6a1a89eecfda564f0b1&thumb=3&name=art.jpg', 'Gimme A Bullet', 'AC/DC', 'Powerage', 'song', 203, NULL, 3),
(109, '1ab1fa89aad9f6a1a89eecfda564f0b1', 'http://play.marcelomotta.com/play/index.php?ssid=1ab1fa89aad9f6a1a89eecfda564f0b1&type=song&oid=16783&uid=1&name=AC-DC%20-%20Gimme%20A%20Bullet.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16783\" title=\"AC/DC - Gimme A Bullet\"> Gimme A Bullet</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=1ab1fa89aad9f6a1a89eecfda564f0b1&thumb=3&name=art.jpg', 'Gimme A Bullet', 'AC/DC', 'Powerage', 'song', 203, NULL, 3),
(110, '1ab1fa89aad9f6a1a89eecfda564f0b1', 'http://play.marcelomotta.com/play/index.php?ssid=1ab1fa89aad9f6a1a89eecfda564f0b1&type=song&oid=6626&uid=1&name=AC-DC%20-%20Riff%20Raff.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6626\" title=\"AC/DC - Riff Raff\"> Riff Raff</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=1ab1fa89aad9f6a1a89eecfda564f0b1&thumb=3&name=art.jpg', 'Riff Raff', 'AC/DC', 'Powerage', 'song', 314, NULL, 4),
(111, '1ab1fa89aad9f6a1a89eecfda564f0b1', 'http://play.marcelomotta.com/play/index.php?ssid=1ab1fa89aad9f6a1a89eecfda564f0b1&type=song&oid=16779&uid=1&name=AC-DC%20-%20Riff%20Raff.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16779\" title=\"AC/DC - Riff Raff\"> Riff Raff</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=1ab1fa89aad9f6a1a89eecfda564f0b1&thumb=3&name=art.jpg', 'Riff Raff', 'AC/DC', 'Powerage', 'song', 314, NULL, 4),
(112, '1ab1fa89aad9f6a1a89eecfda564f0b1', 'http://play.marcelomotta.com/play/index.php?ssid=1ab1fa89aad9f6a1a89eecfda564f0b1&type=song&oid=6624&uid=1&name=AC-DC%20-%20Sin%20City.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6624\" title=\"AC/DC - Sin City\"> Sin City</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=1ab1fa89aad9f6a1a89eecfda564f0b1&thumb=3&name=art.jpg', 'Sin City', 'AC/DC', 'Powerage', 'song', 286, NULL, 5),
(113, '1ab1fa89aad9f6a1a89eecfda564f0b1', 'http://play.marcelomotta.com/play/index.php?ssid=1ab1fa89aad9f6a1a89eecfda564f0b1&type=song&oid=16777&uid=1&name=AC-DC%20-%20Sin%20City.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16777\" title=\"AC/DC - Sin City\"> Sin City</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=1ab1fa89aad9f6a1a89eecfda564f0b1&thumb=3&name=art.jpg', 'Sin City', 'AC/DC', 'Powerage', 'song', 286, NULL, 5),
(114, '1ab1fa89aad9f6a1a89eecfda564f0b1', 'http://play.marcelomotta.com/play/index.php?ssid=1ab1fa89aad9f6a1a89eecfda564f0b1&type=song&oid=6623&uid=1&name=AC-DC%20-%20Next%20To%20The%20Moon.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6623\" title=\"AC/DC - Next To The Moon\"> Next To The Moon</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=1ab1fa89aad9f6a1a89eecfda564f0b1&thumb=3&name=art.jpg', 'Next To The Moon', 'AC/DC', 'Powerage', 'song', 213, NULL, 6),
(115, '1ab1fa89aad9f6a1a89eecfda564f0b1', 'http://play.marcelomotta.com/play/index.php?ssid=1ab1fa89aad9f6a1a89eecfda564f0b1&type=song&oid=16776&uid=1&name=AC-DC%20-%20Next%20To%20The%20Moon.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16776\" title=\"AC/DC - Next To The Moon\"> Next To The Moon</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=1ab1fa89aad9f6a1a89eecfda564f0b1&thumb=3&name=art.jpg', 'Next To The Moon', 'AC/DC', 'Powerage', 'song', 213, NULL, 6),
(116, '1ab1fa89aad9f6a1a89eecfda564f0b1', 'http://play.marcelomotta.com/play/index.php?ssid=1ab1fa89aad9f6a1a89eecfda564f0b1&type=song&oid=6627&uid=1&name=AC-DC%20-%20Gone%20Shootin-.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6627\" title=\"AC/DC - Gone Shootin&#039;\"> Gone Shootin&#039;</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=1ab1fa89aad9f6a1a89eecfda564f0b1&thumb=3&name=art.jpg', 'Gone Shootin\'', 'AC/DC', 'Powerage', 'song', 300, NULL, 7),
(117, '1ab1fa89aad9f6a1a89eecfda564f0b1', 'http://play.marcelomotta.com/play/index.php?ssid=1ab1fa89aad9f6a1a89eecfda564f0b1&type=song&oid=16780&uid=1&name=AC-DC%20-%20Gone%20Shootin-.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16780\" title=\"AC/DC - Gone Shootin&#039;\"> Gone Shootin&#039;</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=1ab1fa89aad9f6a1a89eecfda564f0b1&thumb=3&name=art.jpg', 'Gone Shootin\'', 'AC/DC', 'Powerage', 'song', 300, NULL, 7),
(118, '1ab1fa89aad9f6a1a89eecfda564f0b1', 'http://play.marcelomotta.com/play/index.php?ssid=1ab1fa89aad9f6a1a89eecfda564f0b1&type=song&oid=6622&uid=1&name=AC-DC%20-%20Up%20To%20My%20Neck%20In%20You.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6622\" title=\"AC/DC - Up To My Neck In You\"> Up To My Neck In You</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=1ab1fa89aad9f6a1a89eecfda564f0b1&thumb=3&name=art.jpg', 'Up To My Neck In You', 'AC/DC', 'Powerage', 'song', 255, NULL, 8),
(119, '1ab1fa89aad9f6a1a89eecfda564f0b1', 'http://play.marcelomotta.com/play/index.php?ssid=1ab1fa89aad9f6a1a89eecfda564f0b1&type=song&oid=16775&uid=1&name=AC-DC%20-%20Up%20To%20My%20Neck%20In%20You.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16775\" title=\"AC/DC - Up To My Neck In You\"> Up To My Neck In You</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=1ab1fa89aad9f6a1a89eecfda564f0b1&thumb=3&name=art.jpg', 'Up To My Neck In You', 'AC/DC', 'Powerage', 'song', 255, NULL, 8),
(120, '1ab1fa89aad9f6a1a89eecfda564f0b1', 'http://play.marcelomotta.com/play/index.php?ssid=1ab1fa89aad9f6a1a89eecfda564f0b1&type=song&oid=6629&uid=1&name=AC-DC%20-%20Kicked%20In%20The%20Teeth.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6629\" title=\"AC/DC - Kicked In The Teeth\"> Kicked In The Teeth</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=1ab1fa89aad9f6a1a89eecfda564f0b1&thumb=3&name=art.jpg', 'Kicked In The Teeth', 'AC/DC', 'Powerage', 'song', 233, NULL, 9),
(121, '1ab1fa89aad9f6a1a89eecfda564f0b1', 'http://play.marcelomotta.com/play/index.php?ssid=1ab1fa89aad9f6a1a89eecfda564f0b1&type=song&oid=16782&uid=1&name=AC-DC%20-%20Kicked%20In%20The%20Teeth.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16782\" title=\"AC/DC - Kicked In The Teeth\"> Kicked In The Teeth</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=1ab1fa89aad9f6a1a89eecfda564f0b1&thumb=3&name=art.jpg', 'Kicked In The Teeth', 'AC/DC', 'Powerage', 'song', 233, NULL, 9),
(122, '4f968c7758a4053c2d5ca00032cbc66c', 'http://play.marcelomotta.com/play/index.php?ssid=4f968c7758a4053c2d5ca00032cbc66c&type=song&oid=16778&uid=1&name=AC-DC%20-%20Rock%20-n-%20Roll%20Damnation.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16778\" title=\"AC/DC - Rock &#039;n&#039; Roll Damnation\"> Rock &#039;n&#039; Roll Damnation</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=4f968c7758a4053c2d5ca00032cbc66c&thumb=3&name=art.jpg', 'Rock \'n\' Roll Damnation', 'AC/DC', 'Powerage', 'song', 219, NULL, 1),
(123, '388d869435f22bf7dbc0d63320b8b92d', 'http://play.marcelomotta.com/play/index.php?ssid=388d869435f22bf7dbc0d63320b8b92d&type=song&oid=16778&uid=1&name=AC-DC%20-%20Rock%20-n-%20Roll%20Damnation.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16778\" title=\"AC/DC - Rock &#039;n&#039; Roll Damnation\"> Rock &#039;n&#039; Roll Damnation</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=388d869435f22bf7dbc0d63320b8b92d&thumb=3&name=art.jpg', 'Rock \'n\' Roll Damnation', 'AC/DC', 'Powerage', 'song', 219, NULL, 1),
(124, '77f2a67f28c73722f145b06d5ce54e29', 'http://play.marcelomotta.com/play/index.php?ssid=77f2a67f28c73722f145b06d5ce54e29&type=song&oid=16778&uid=1&name=AC-DC%20-%20Rock%20-n-%20Roll%20Damnation.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16778\" title=\"AC/DC - Rock &#039;n&#039; Roll Damnation\"> Rock &#039;n&#039; Roll Damnation</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=77f2a67f28c73722f145b06d5ce54e29&thumb=3&name=art.jpg', 'Rock \'n\' Roll Damnation', 'AC/DC', 'Powerage', 'song', 219, NULL, 1),
(125, '2d97bc3f4ff0ae6de92ba8c0a99d9903', 'http://play.marcelomotta.com/play/index.php?ssid=2d97bc3f4ff0ae6de92ba8c0a99d9903&type=song&oid=16778&uid=1&name=AC-DC%20-%20Rock%20-n-%20Roll%20Damnation.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16778\" title=\"AC/DC - Rock &#039;n&#039; Roll Damnation\"> Rock &#039;n&#039; Roll Damnation</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=2d97bc3f4ff0ae6de92ba8c0a99d9903&thumb=3&name=art.jpg', 'Rock \'n\' Roll Damnation', 'AC/DC', 'Powerage', 'song', 219, NULL, 1),
(126, 'b4fca8fe57a3eb2d290515f3c445dfd7', 'http://play.marcelomotta.com/play/index.php?ssid=b4fca8fe57a3eb2d290515f3c445dfd7&type=song&oid=16778&uid=1&name=AC-DC%20-%20Rock%20-n-%20Roll%20Damnation.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16778\" title=\"AC/DC - Rock &#039;n&#039; Roll Damnation\"> Rock &#039;n&#039; Roll Damnation</a>', 'http://play.marcelomotta.com/image.php?object_id=375&object_type=album&auth=b4fca8fe57a3eb2d290515f3c445dfd7&thumb=3&name=art.jpg', 'Rock \'n\' Roll Damnation', 'AC/DC', 'Powerage', 'song', 219, NULL, 1),
(127, '5a1a623637079b7b46875a7fbb1e5aef', 'http://play.marcelomotta.com/play/index.php?ssid=5a1a623637079b7b46875a7fbb1e5aef&type=song&oid=19076&uid=1&name=The%20Animals%20-%20Boom%20Boom.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19076\" title=\"The Animals - Boom Boom\"> Boom Boom</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=5a1a623637079b7b46875a7fbb1e5aef&thumb=3', 'Boom Boom', 'The Animals', 'The Complete Animals Disc 1', 'song', 201, NULL, 1),
(128, '5a1a623637079b7b46875a7fbb1e5aef', 'http://play.marcelomotta.com/play/index.php?ssid=5a1a623637079b7b46875a7fbb1e5aef&type=song&oid=19077&uid=1&name=The%20Animals%20-%20Talkin-%20-bout%20You.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19077\" title=\"The Animals - Talkin&#039; &#039;bout You\"> Talkin&#039; &#039;bout You</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=5a1a623637079b7b46875a7fbb1e5aef&thumb=3', 'Talkin\' \'bout You', 'The Animals', 'The Complete Animals Disc 1', 'song', 426, NULL, 2),
(129, '5a1a623637079b7b46875a7fbb1e5aef', 'http://play.marcelomotta.com/play/index.php?ssid=5a1a623637079b7b46875a7fbb1e5aef&type=song&oid=19075&uid=1&name=The%20Animals%20-%20Blue%20Feeling.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19075\" title=\"The Animals - Blue Feeling\"> Blue Feeling</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=5a1a623637079b7b46875a7fbb1e5aef&thumb=3', 'Blue Feeling', 'The Animals', 'The Complete Animals Disc 1', 'song', 153, NULL, 3),
(130, '5a1a623637079b7b46875a7fbb1e5aef', 'http://play.marcelomotta.com/play/index.php?ssid=5a1a623637079b7b46875a7fbb1e5aef&type=song&oid=19083&uid=1&name=The%20Animals%20-%20Dimples.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19083\" title=\"The Animals - Dimples\"> Dimples</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=5a1a623637079b7b46875a7fbb1e5aef&thumb=3', 'Dimples', 'The Animals', 'The Complete Animals Disc 1', 'song', 173, NULL, 4),
(131, '5a1a623637079b7b46875a7fbb1e5aef', 'http://play.marcelomotta.com/play/index.php?ssid=5a1a623637079b7b46875a7fbb1e5aef&type=song&oid=19085&uid=1&name=The%20Animals%20-%20Baby%20Let%20Me%20Take%20You%20Home.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19085\" title=\"The Animals - Baby Let Me Take You Home\"> Baby Let Me Take You Home</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=5a1a623637079b7b46875a7fbb1e5aef&thumb=3', 'Baby Let Me Take You Home', 'The Animals', 'The Complete Animals Disc 1', 'song', 143, NULL, 5),
(132, '5a1a623637079b7b46875a7fbb1e5aef', 'http://play.marcelomotta.com/play/index.php?ssid=5a1a623637079b7b46875a7fbb1e5aef&type=song&oid=19090&uid=1&name=The%20Animals%20-%20Gonna%20Send%20You%20Back%20To%20Walker.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19090\" title=\"The Animals - Gonna Send You Back To Walker\"> Gonna Send You Back To Walker</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=5a1a623637079b7b46875a7fbb1e5aef&thumb=3', 'Gonna Send You Back To Walker', 'The Animals', 'The Complete Animals Disc 1', 'song', 150, NULL, 6),
(133, '5a1a623637079b7b46875a7fbb1e5aef', 'http://play.marcelomotta.com/play/index.php?ssid=5a1a623637079b7b46875a7fbb1e5aef&type=song&oid=19091&uid=1&name=The%20Animals%20-%20Baby%20What-s%20Wrong.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19091\" title=\"The Animals - Baby What&#039;s Wrong\"> Baby What&#039;s Wrong</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=5a1a623637079b7b46875a7fbb1e5aef&thumb=3', 'Baby What\'s Wrong', 'The Animals', 'The Complete Animals Disc 1', 'song', 171, NULL, 7),
(134, '5a1a623637079b7b46875a7fbb1e5aef', 'http://play.marcelomotta.com/play/index.php?ssid=5a1a623637079b7b46875a7fbb1e5aef&type=song&oid=19087&uid=1&name=The%20Animals%20-%20The%20House%20Of%20The%20Rising%20Sun.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19087\" title=\"The Animals - The House Of The Rising Sun\"> The House Of The Rising Sun</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=5a1a623637079b7b46875a7fbb1e5aef&thumb=3', 'The House Of The Rising Sun', 'The Animals', 'The Complete Animals Disc 1', 'song', 272, NULL, 8),
(135, '5a1a623637079b7b46875a7fbb1e5aef', 'http://play.marcelomotta.com/play/index.php?ssid=5a1a623637079b7b46875a7fbb1e5aef&type=song&oid=19089&uid=1&name=The%20Animals%20-%20F-E-E-L.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19089\" title=\"The Animals - F-E-E-L\"> F-E-E-L</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=5a1a623637079b7b46875a7fbb1e5aef&thumb=3', 'F-E-E-L', 'The Animals', 'The Complete Animals Disc 1', 'song', 164, NULL, 9),
(136, '5a1a623637079b7b46875a7fbb1e5aef', 'http://play.marcelomotta.com/play/index.php?ssid=5a1a623637079b7b46875a7fbb1e5aef&type=song&oid=19079&uid=1&name=The%20Animals%20-%20I-m%20Mad%20Again.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19079\" title=\"The Animals - I&#039;m Mad Again\"> I&#039;m Mad Again</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=5a1a623637079b7b46875a7fbb1e5aef&thumb=3', 'I\'m Mad Again', 'The Animals', 'The Complete Animals Disc 1', 'song', 258, NULL, 10),
(137, '5a1a623637079b7b46875a7fbb1e5aef', 'http://play.marcelomotta.com/play/index.php?ssid=5a1a623637079b7b46875a7fbb1e5aef&type=song&oid=19081&uid=1&name=The%20Animals%20-%20Night%20Time%20Is%20The%20Right%20Time.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19081\" title=\"The Animals - Night Time Is The Right Time\"> Night Time Is The Right Time</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=5a1a623637079b7b46875a7fbb1e5aef&thumb=3', 'Night Time Is The Right Time', 'The Animals', 'The Complete Animals Disc 1', 'song', 227, NULL, 11),
(138, '5a1a623637079b7b46875a7fbb1e5aef', 'http://play.marcelomotta.com/play/index.php?ssid=5a1a623637079b7b46875a7fbb1e5aef&type=song&oid=19082&uid=1&name=The%20Animals%20-%20Around%20And%20Around.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19082\" title=\"The Animals - Around And Around\"> Around And Around</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=5a1a623637079b7b46875a7fbb1e5aef&thumb=3', 'Around And Around', 'The Animals', 'The Complete Animals Disc 1', 'song', 167, NULL, 12),
(139, '5a1a623637079b7b46875a7fbb1e5aef', 'http://play.marcelomotta.com/play/index.php?ssid=5a1a623637079b7b46875a7fbb1e5aef&type=song&oid=19072&uid=1&name=The%20Animals%20-%20I-m%20In%20Love%20Again.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19072\" title=\"The Animals - I&#039;m In Love Again\"> I&#039;m In Love Again</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=5a1a623637079b7b46875a7fbb1e5aef&thumb=3', 'I\'m In Love Again', 'The Animals', 'The Complete Animals Disc 1', 'song', 183, NULL, 13),
(140, '5a1a623637079b7b46875a7fbb1e5aef', 'http://play.marcelomotta.com/play/index.php?ssid=5a1a623637079b7b46875a7fbb1e5aef&type=song&oid=19074&uid=1&name=The%20Animals%20-%20Bury%20My%20Body.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19074\" title=\"The Animals - Bury My Body\"> Bury My Body</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=5a1a623637079b7b46875a7fbb1e5aef&thumb=3', 'Bury My Body', 'The Animals', 'The Complete Animals Disc 1', 'song', 172, NULL, 14),
(141, '5a1a623637079b7b46875a7fbb1e5aef', 'http://play.marcelomotta.com/play/index.php?ssid=5a1a623637079b7b46875a7fbb1e5aef&type=song&oid=19086&uid=1&name=The%20Animals%20-%20She%20Said%20Yeah.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19086\" title=\"The Animals - She Said Yeah\"> She Said Yeah</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=5a1a623637079b7b46875a7fbb1e5aef&thumb=3', 'She Said Yeah', 'The Animals', 'The Complete Animals Disc 1', 'song', 141, NULL, 15),
(142, '5a1a623637079b7b46875a7fbb1e5aef', 'http://play.marcelomotta.com/play/index.php?ssid=5a1a623637079b7b46875a7fbb1e5aef&type=song&oid=19078&uid=1&name=The%20Animals%20-%20I-m%20Crying.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19078\" title=\"The Animals - I&#039;m Crying\"> I&#039;m Crying</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=5a1a623637079b7b46875a7fbb1e5aef&thumb=3', 'I\'m Crying', 'The Animals', 'The Complete Animals Disc 1', 'song', 169, NULL, 16),
(143, '5a1a623637079b7b46875a7fbb1e5aef', 'http://play.marcelomotta.com/play/index.php?ssid=5a1a623637079b7b46875a7fbb1e5aef&type=song&oid=19080&uid=1&name=The%20Animals%20-%20Take%20It%20Easy.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19080\" title=\"The Animals - Take It Easy\"> Take It Easy</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=5a1a623637079b7b46875a7fbb1e5aef&thumb=3', 'Take It Easy', 'The Animals', 'The Complete Animals Disc 1', 'song', 175, NULL, 17),
(144, '5a1a623637079b7b46875a7fbb1e5aef', 'http://play.marcelomotta.com/play/index.php?ssid=5a1a623637079b7b46875a7fbb1e5aef&type=song&oid=19088&uid=1&name=The%20Animals%20-%20The%20Story%20Of%20Bo%20Diddley.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19088\" title=\"The Animals - The Story Of Bo Diddley\"> The Story Of Bo Diddley</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=5a1a623637079b7b46875a7fbb1e5aef&thumb=3', 'The Story Of Bo Diddley', 'The Animals', 'The Complete Animals Disc 1', 'song', 345, NULL, 18),
(145, '5a1a623637079b7b46875a7fbb1e5aef', 'http://play.marcelomotta.com/play/index.php?ssid=5a1a623637079b7b46875a7fbb1e5aef&type=song&oid=19073&uid=1&name=The%20Animals%20-%20The%20Girl%20Can-t%20Help%20It.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19073\" title=\"The Animals - The Girl Can&#039;t Help It\"> The Girl Can&#039;t Help It</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=5a1a623637079b7b46875a7fbb1e5aef&thumb=3', 'The Girl Can\'t Help It', 'The Animals', 'The Complete Animals Disc 1', 'song', 143, NULL, 19),
(146, '5a1a623637079b7b46875a7fbb1e5aef', 'http://play.marcelomotta.com/play/index.php?ssid=5a1a623637079b7b46875a7fbb1e5aef&type=song&oid=19084&uid=1&name=The%20Animals%20-%20I-ve%20Been%20Around.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19084\" title=\"The Animals - I&#039;ve Been Around\"> I&#039;ve Been Around</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=5a1a623637079b7b46875a7fbb1e5aef&thumb=3', 'I\'ve Been Around', 'The Animals', 'The Complete Animals Disc 1', 'song', 96, NULL, 20),
(147, 'fab7fafb34266287ebc7ab6818852c14', 'http://play.marcelomotta.com/play/index.php?ssid=fab7fafb34266287ebc7ab6818852c14&type=song&oid=16567&uid=1&name=Janis%20Joplin%20-%20Mercedes%20Benz.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16567\" title=\"Janis Joplin - Mercedes Benz\"> Mercedes Benz</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=fab7fafb34266287ebc7ab6818852c14&thumb=3', 'Mercedes Benz', 'Janis Joplin', 'Anthology Disc 2', 'song', 107, NULL, 5),
(148, '39c3fa60a6384b1f82a21b4281ea19e5', 'http://play.marcelomotta.com/play/index.php?ssid=39c3fa60a6384b1f82a21b4281ea19e5&type=song&oid=16567&uid=1&name=Janis%20Joplin%20-%20Mercedes%20Benz.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16567\" title=\"Janis Joplin - Mercedes Benz\"> Mercedes Benz</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=39c3fa60a6384b1f82a21b4281ea19e5&thumb=3', 'Mercedes Benz', 'Janis Joplin', 'Anthology Disc 2', 'song', 107, NULL, 5),
(149, '245e1fe05c9daaf5bb4b8a2b2fc21e0c', 'http://play.marcelomotta.com/play/index.php?ssid=245e1fe05c9daaf5bb4b8a2b2fc21e0c&type=song&oid=16567&uid=1&name=Janis%20Joplin%20-%20Mercedes%20Benz.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16567\" title=\"Janis Joplin - Mercedes Benz\"> Mercedes Benz</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=245e1fe05c9daaf5bb4b8a2b2fc21e0c&thumb=3', 'Mercedes Benz', 'Janis Joplin', 'Anthology Disc 2', 'song', 107, NULL, 5),
(150, 'cad15d39737de58038f79b0b568d4ef5', 'http://play.marcelomotta.com/play/index.php?ssid=cad15d39737de58038f79b0b568d4ef5&type=song&oid=6418&uid=1&name=Janis%20Joplin%20-%20Me%20And%20Bobby%20Mcgee.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6418\" title=\"Janis Joplin - Me And Bobby Mcgee\"> Me And Bobby Mcgee</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=cad15d39737de58038f79b0b568d4ef5&thumb=3', 'Me And Bobby Mcgee', 'Janis Joplin', 'Anthology Disc 2', 'song', 271, NULL, 4),
(151, 'cad15d39737de58038f79b0b568d4ef5', 'http://play.marcelomotta.com/play/index.php?ssid=cad15d39737de58038f79b0b568d4ef5&type=song&oid=16571&uid=1&name=Janis%20Joplin%20-%20Me%20And%20Bobby%20Mcgee.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16571\" title=\"Janis Joplin - Me And Bobby Mcgee\"> Me And Bobby Mcgee</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=cad15d39737de58038f79b0b568d4ef5&thumb=3', 'Me And Bobby Mcgee', 'Janis Joplin', 'Anthology Disc 2', 'song', 271, NULL, 4),
(152, 'cad15d39737de58038f79b0b568d4ef5', 'http://play.marcelomotta.com/play/index.php?ssid=cad15d39737de58038f79b0b568d4ef5&type=song&oid=16572&uid=1&name=Janis%20Joplin%20-%20Ball%20And%20Chain.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16572\" title=\"Janis Joplin - Ball And Chain\"> Ball And Chain</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=cad15d39737de58038f79b0b568d4ef5&thumb=3', 'Ball And Chain', 'Janis Joplin', 'Anthology Disc 2', 'song', 480, NULL, 9),
(153, 'cad15d39737de58038f79b0b568d4ef5', 'http://play.marcelomotta.com/play/index.php?ssid=cad15d39737de58038f79b0b568d4ef5&type=song&oid=6412&uid=1&name=Janis%20Joplin%20-%20Move%20Over.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6412\" title=\"Janis Joplin - Move Over\"> Move Over</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=cad15d39737de58038f79b0b568d4ef5&thumb=3', 'Move Over', 'Janis Joplin', 'Anthology Disc 2', 'song', 221, NULL, 1),
(154, 'cad15d39737de58038f79b0b568d4ef5', 'http://play.marcelomotta.com/play/index.php?ssid=cad15d39737de58038f79b0b568d4ef5&type=song&oid=6419&uid=1&name=Janis%20Joplin%20-%20Ball%20And%20Chain.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6419\" title=\"Janis Joplin - Ball And Chain\"> Ball And Chain</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=cad15d39737de58038f79b0b568d4ef5&thumb=3', 'Ball And Chain', 'Janis Joplin', 'Anthology Disc 2', 'song', 480, NULL, 9),
(155, 'cad15d39737de58038f79b0b568d4ef5', 'http://play.marcelomotta.com/play/index.php?ssid=cad15d39737de58038f79b0b568d4ef5&type=song&oid=16573&uid=1&name=Janis%20Joplin%20-%20Get%20It%20While%20You%20Can.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16573\" title=\"Janis Joplin - Get It While You Can\"> Get It While You Can</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=cad15d39737de58038f79b0b568d4ef5&thumb=3', 'Get It While You Can', 'Janis Joplin', 'Anthology Disc 2', 'song', 436, NULL, 8),
(156, 'cad15d39737de58038f79b0b568d4ef5', 'http://play.marcelomotta.com/play/index.php?ssid=cad15d39737de58038f79b0b568d4ef5&type=song&oid=6415&uid=1&name=Janis%20Joplin%20-%20Half%20Moon.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6415\" title=\"Janis Joplin - Half Moon\"> Half Moon</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=cad15d39737de58038f79b0b568d4ef5&thumb=3', 'Half Moon', 'Janis Joplin', 'Anthology Disc 2', 'song', 233, NULL, 2),
(157, 'cad15d39737de58038f79b0b568d4ef5', 'http://play.marcelomotta.com/play/index.php?ssid=cad15d39737de58038f79b0b568d4ef5&type=song&oid=6413&uid=1&name=Janis%20Joplin%20-%20Cry%20Baby.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6413\" title=\"Janis Joplin - Cry Baby\"> Cry Baby</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=cad15d39737de58038f79b0b568d4ef5&thumb=3', 'Cry Baby', 'Janis Joplin', 'Anthology Disc 2', 'song', 238, NULL, 3),
(158, 'cad15d39737de58038f79b0b568d4ef5', 'http://play.marcelomotta.com/play/index.php?ssid=cad15d39737de58038f79b0b568d4ef5&type=song&oid=6420&uid=1&name=Janis%20Joplin%20-%20Get%20It%20While%20You%20Can.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6420\" title=\"Janis Joplin - Get It While You Can\"> Get It While You Can</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=cad15d39737de58038f79b0b568d4ef5&thumb=3', 'Get It While You Can', 'Janis Joplin', 'Anthology Disc 2', 'song', 436, NULL, 8),
(159, 'cad15d39737de58038f79b0b568d4ef5', 'http://play.marcelomotta.com/play/index.php?ssid=cad15d39737de58038f79b0b568d4ef5&type=song&oid=6417&uid=1&name=Janis%20Joplin%20-%20Bye%20Bye%20Baby.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6417\" title=\"Janis Joplin - Bye Bye Baby\"> Bye Bye Baby</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=cad15d39737de58038f79b0b568d4ef5&thumb=3', 'Bye Bye Baby', 'Janis Joplin', 'Anthology Disc 2', 'song', 225, NULL, 7),
(160, 'cad15d39737de58038f79b0b568d4ef5', 'http://play.marcelomotta.com/play/index.php?ssid=cad15d39737de58038f79b0b568d4ef5&type=song&oid=6414&uid=1&name=Janis%20Joplin%20-%20Mercedes%20Benz.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6414\" title=\"Janis Joplin - Mercedes Benz\"> Mercedes Benz</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=cad15d39737de58038f79b0b568d4ef5&thumb=3', 'Mercedes Benz', 'Janis Joplin', 'Anthology Disc 2', 'song', 107, NULL, 5),
(161, 'cad15d39737de58038f79b0b568d4ef5', 'http://play.marcelomotta.com/play/index.php?ssid=cad15d39737de58038f79b0b568d4ef5&type=song&oid=16565&uid=1&name=Janis%20Joplin%20-%20Move%20Over.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16565\" title=\"Janis Joplin - Move Over\"> Move Over</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=cad15d39737de58038f79b0b568d4ef5&thumb=3', 'Move Over', 'Janis Joplin', 'Anthology Disc 2', 'song', 221, NULL, 1),
(162, 'cad15d39737de58038f79b0b568d4ef5', 'http://play.marcelomotta.com/play/index.php?ssid=cad15d39737de58038f79b0b568d4ef5&type=song&oid=16570&uid=1&name=Janis%20Joplin%20-%20Bye%20Bye%20Baby.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16570\" title=\"Janis Joplin - Bye Bye Baby\"> Bye Bye Baby</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=cad15d39737de58038f79b0b568d4ef5&thumb=3', 'Bye Bye Baby', 'Janis Joplin', 'Anthology Disc 2', 'song', 225, NULL, 7),
(163, 'cad15d39737de58038f79b0b568d4ef5', 'http://play.marcelomotta.com/play/index.php?ssid=cad15d39737de58038f79b0b568d4ef5&type=song&oid=6416&uid=1&name=Janis%20Joplin%20-%20Down%20On%20Me.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6416\" title=\"Janis Joplin - Down On Me\"> Down On Me</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=cad15d39737de58038f79b0b568d4ef5&thumb=3', 'Down On Me', 'Janis Joplin', 'Anthology Disc 2', 'song', 180, NULL, 6),
(164, 'cad15d39737de58038f79b0b568d4ef5', 'http://play.marcelomotta.com/play/index.php?ssid=cad15d39737de58038f79b0b568d4ef5&type=song&oid=16566&uid=1&name=Janis%20Joplin%20-%20Cry%20Baby.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16566\" title=\"Janis Joplin - Cry Baby\"> Cry Baby</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=cad15d39737de58038f79b0b568d4ef5&thumb=3', 'Cry Baby', 'Janis Joplin', 'Anthology Disc 2', 'song', 238, NULL, 3),
(165, 'cad15d39737de58038f79b0b568d4ef5', 'http://play.marcelomotta.com/play/index.php?ssid=cad15d39737de58038f79b0b568d4ef5&type=song&oid=16567&uid=1&name=Janis%20Joplin%20-%20Mercedes%20Benz.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16567\" title=\"Janis Joplin - Mercedes Benz\"> Mercedes Benz</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=cad15d39737de58038f79b0b568d4ef5&thumb=3', 'Mercedes Benz', 'Janis Joplin', 'Anthology Disc 2', 'song', 107, NULL, 5),
(166, 'cad15d39737de58038f79b0b568d4ef5', 'http://play.marcelomotta.com/play/index.php?ssid=cad15d39737de58038f79b0b568d4ef5&type=song&oid=16569&uid=1&name=Janis%20Joplin%20-%20Down%20On%20Me.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16569\" title=\"Janis Joplin - Down On Me\"> Down On Me</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=cad15d39737de58038f79b0b568d4ef5&thumb=3', 'Down On Me', 'Janis Joplin', 'Anthology Disc 2', 'song', 180, NULL, 6),
(167, 'cad15d39737de58038f79b0b568d4ef5', 'http://play.marcelomotta.com/play/index.php?ssid=cad15d39737de58038f79b0b568d4ef5&type=song&oid=16568&uid=1&name=Janis%20Joplin%20-%20Half%20Moon.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16568\" title=\"Janis Joplin - Half Moon\"> Half Moon</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=cad15d39737de58038f79b0b568d4ef5&thumb=3', 'Half Moon', 'Janis Joplin', 'Anthology Disc 2', 'song', 233, NULL, 2),
(168, '7b0d4a787d3368f133958081448612dc', 'http://play.marcelomotta.com/play/index.php?ssid=7b0d4a787d3368f133958081448612dc&type=song&oid=6418&uid=1&name=Janis%20Joplin%20-%20Me%20And%20Bobby%20Mcgee.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6418\" title=\"Janis Joplin - Me And Bobby Mcgee\"> Me And Bobby Mcgee</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=7b0d4a787d3368f133958081448612dc&thumb=3', 'Me And Bobby Mcgee', 'Janis Joplin', 'Anthology Disc 2', 'song', 271, NULL, 4),
(169, '7b0d4a787d3368f133958081448612dc', 'http://play.marcelomotta.com/play/index.php?ssid=7b0d4a787d3368f133958081448612dc&type=song&oid=16571&uid=1&name=Janis%20Joplin%20-%20Me%20And%20Bobby%20Mcgee.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16571\" title=\"Janis Joplin - Me And Bobby Mcgee\"> Me And Bobby Mcgee</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=7b0d4a787d3368f133958081448612dc&thumb=3', 'Me And Bobby Mcgee', 'Janis Joplin', 'Anthology Disc 2', 'song', 271, NULL, 4),
(170, '7b0d4a787d3368f133958081448612dc', 'http://play.marcelomotta.com/play/index.php?ssid=7b0d4a787d3368f133958081448612dc&type=song&oid=16572&uid=1&name=Janis%20Joplin%20-%20Ball%20And%20Chain.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16572\" title=\"Janis Joplin - Ball And Chain\"> Ball And Chain</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=7b0d4a787d3368f133958081448612dc&thumb=3', 'Ball And Chain', 'Janis Joplin', 'Anthology Disc 2', 'song', 480, NULL, 9),
(171, '7b0d4a787d3368f133958081448612dc', 'http://play.marcelomotta.com/play/index.php?ssid=7b0d4a787d3368f133958081448612dc&type=song&oid=6412&uid=1&name=Janis%20Joplin%20-%20Move%20Over.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6412\" title=\"Janis Joplin - Move Over\"> Move Over</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=7b0d4a787d3368f133958081448612dc&thumb=3', 'Move Over', 'Janis Joplin', 'Anthology Disc 2', 'song', 221, NULL, 1),
(172, '7b0d4a787d3368f133958081448612dc', 'http://play.marcelomotta.com/play/index.php?ssid=7b0d4a787d3368f133958081448612dc&type=song&oid=6419&uid=1&name=Janis%20Joplin%20-%20Ball%20And%20Chain.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6419\" title=\"Janis Joplin - Ball And Chain\"> Ball And Chain</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=7b0d4a787d3368f133958081448612dc&thumb=3', 'Ball And Chain', 'Janis Joplin', 'Anthology Disc 2', 'song', 480, NULL, 9),
(173, '7b0d4a787d3368f133958081448612dc', 'http://play.marcelomotta.com/play/index.php?ssid=7b0d4a787d3368f133958081448612dc&type=song&oid=16573&uid=1&name=Janis%20Joplin%20-%20Get%20It%20While%20You%20Can.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16573\" title=\"Janis Joplin - Get It While You Can\"> Get It While You Can</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=7b0d4a787d3368f133958081448612dc&thumb=3', 'Get It While You Can', 'Janis Joplin', 'Anthology Disc 2', 'song', 436, NULL, 8),
(174, '7b0d4a787d3368f133958081448612dc', 'http://play.marcelomotta.com/play/index.php?ssid=7b0d4a787d3368f133958081448612dc&type=song&oid=6415&uid=1&name=Janis%20Joplin%20-%20Half%20Moon.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6415\" title=\"Janis Joplin - Half Moon\"> Half Moon</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=7b0d4a787d3368f133958081448612dc&thumb=3', 'Half Moon', 'Janis Joplin', 'Anthology Disc 2', 'song', 233, NULL, 2),
(175, '7b0d4a787d3368f133958081448612dc', 'http://play.marcelomotta.com/play/index.php?ssid=7b0d4a787d3368f133958081448612dc&type=song&oid=6413&uid=1&name=Janis%20Joplin%20-%20Cry%20Baby.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6413\" title=\"Janis Joplin - Cry Baby\"> Cry Baby</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=7b0d4a787d3368f133958081448612dc&thumb=3', 'Cry Baby', 'Janis Joplin', 'Anthology Disc 2', 'song', 238, NULL, 3),
(176, '7b0d4a787d3368f133958081448612dc', 'http://play.marcelomotta.com/play/index.php?ssid=7b0d4a787d3368f133958081448612dc&type=song&oid=6420&uid=1&name=Janis%20Joplin%20-%20Get%20It%20While%20You%20Can.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6420\" title=\"Janis Joplin - Get It While You Can\"> Get It While You Can</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=7b0d4a787d3368f133958081448612dc&thumb=3', 'Get It While You Can', 'Janis Joplin', 'Anthology Disc 2', 'song', 436, NULL, 8),
(177, '7b0d4a787d3368f133958081448612dc', 'http://play.marcelomotta.com/play/index.php?ssid=7b0d4a787d3368f133958081448612dc&type=song&oid=6417&uid=1&name=Janis%20Joplin%20-%20Bye%20Bye%20Baby.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6417\" title=\"Janis Joplin - Bye Bye Baby\"> Bye Bye Baby</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=7b0d4a787d3368f133958081448612dc&thumb=3', 'Bye Bye Baby', 'Janis Joplin', 'Anthology Disc 2', 'song', 225, NULL, 7),
(178, '7b0d4a787d3368f133958081448612dc', 'http://play.marcelomotta.com/play/index.php?ssid=7b0d4a787d3368f133958081448612dc&type=song&oid=6414&uid=1&name=Janis%20Joplin%20-%20Mercedes%20Benz.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6414\" title=\"Janis Joplin - Mercedes Benz\"> Mercedes Benz</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=7b0d4a787d3368f133958081448612dc&thumb=3', 'Mercedes Benz', 'Janis Joplin', 'Anthology Disc 2', 'song', 107, NULL, 5),
(179, '7b0d4a787d3368f133958081448612dc', 'http://play.marcelomotta.com/play/index.php?ssid=7b0d4a787d3368f133958081448612dc&type=song&oid=16565&uid=1&name=Janis%20Joplin%20-%20Move%20Over.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16565\" title=\"Janis Joplin - Move Over\"> Move Over</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=7b0d4a787d3368f133958081448612dc&thumb=3', 'Move Over', 'Janis Joplin', 'Anthology Disc 2', 'song', 221, NULL, 1),
(180, '7b0d4a787d3368f133958081448612dc', 'http://play.marcelomotta.com/play/index.php?ssid=7b0d4a787d3368f133958081448612dc&type=song&oid=16570&uid=1&name=Janis%20Joplin%20-%20Bye%20Bye%20Baby.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16570\" title=\"Janis Joplin - Bye Bye Baby\"> Bye Bye Baby</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=7b0d4a787d3368f133958081448612dc&thumb=3', 'Bye Bye Baby', 'Janis Joplin', 'Anthology Disc 2', 'song', 225, NULL, 7),
(181, '7b0d4a787d3368f133958081448612dc', 'http://play.marcelomotta.com/play/index.php?ssid=7b0d4a787d3368f133958081448612dc&type=song&oid=6416&uid=1&name=Janis%20Joplin%20-%20Down%20On%20Me.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6416\" title=\"Janis Joplin - Down On Me\"> Down On Me</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=7b0d4a787d3368f133958081448612dc&thumb=3', 'Down On Me', 'Janis Joplin', 'Anthology Disc 2', 'song', 180, NULL, 6),
(182, '7b0d4a787d3368f133958081448612dc', 'http://play.marcelomotta.com/play/index.php?ssid=7b0d4a787d3368f133958081448612dc&type=song&oid=16566&uid=1&name=Janis%20Joplin%20-%20Cry%20Baby.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16566\" title=\"Janis Joplin - Cry Baby\"> Cry Baby</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=7b0d4a787d3368f133958081448612dc&thumb=3', 'Cry Baby', 'Janis Joplin', 'Anthology Disc 2', 'song', 238, NULL, 3),
(183, '7b0d4a787d3368f133958081448612dc', 'http://play.marcelomotta.com/play/index.php?ssid=7b0d4a787d3368f133958081448612dc&type=song&oid=16567&uid=1&name=Janis%20Joplin%20-%20Mercedes%20Benz.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16567\" title=\"Janis Joplin - Mercedes Benz\"> Mercedes Benz</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=7b0d4a787d3368f133958081448612dc&thumb=3', 'Mercedes Benz', 'Janis Joplin', 'Anthology Disc 2', 'song', 107, NULL, 5);
INSERT INTO `stream_playlist` (`id`, `sid`, `url`, `info_url`, `image_url`, `title`, `author`, `album`, `type`, `time`, `codec`, `track_num`) VALUES
(184, '7b0d4a787d3368f133958081448612dc', 'http://play.marcelomotta.com/play/index.php?ssid=7b0d4a787d3368f133958081448612dc&type=song&oid=16569&uid=1&name=Janis%20Joplin%20-%20Down%20On%20Me.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16569\" title=\"Janis Joplin - Down On Me\"> Down On Me</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=7b0d4a787d3368f133958081448612dc&thumb=3', 'Down On Me', 'Janis Joplin', 'Anthology Disc 2', 'song', 180, NULL, 6),
(185, '7b0d4a787d3368f133958081448612dc', 'http://play.marcelomotta.com/play/index.php?ssid=7b0d4a787d3368f133958081448612dc&type=song&oid=16568&uid=1&name=Janis%20Joplin%20-%20Half%20Moon.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16568\" title=\"Janis Joplin - Half Moon\"> Half Moon</a>', 'http://play.marcelomotta.com/image.php?object_id=493&object_type=album&auth=7b0d4a787d3368f133958081448612dc&thumb=3', 'Half Moon', 'Janis Joplin', 'Anthology Disc 2', 'song', 233, NULL, 2),
(186, '9218d3c46a97019aefc9df42c8e5486c', 'http://play.marcelomotta.com/play/index.php?ssid=9218d3c46a97019aefc9df42c8e5486c&type=song&oid=6185&uid=1&name=Tim%20Maia%20-%20Quer%20Queira%20Quer%20N-o%20Queira.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6185\" title=\"Tim Maia - Quer Queira Quer N&atilde;o Queira\"> Quer Queira Quer N&atilde;o Queira</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=9218d3c46a97019aefc9df42c8e5486c&thumb=3', 'Quer Queira Quer Não Queira', 'Tim Maia', 'Racional Vol. 2', 'song', 289, NULL, 1),
(187, '9218d3c46a97019aefc9df42c8e5486c', 'http://play.marcelomotta.com/play/index.php?ssid=9218d3c46a97019aefc9df42c8e5486c&type=song&oid=16338&uid=1&name=Tim%20Maia%20-%20Quer%20Queira%20Quer%20N-o%20Queira.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16338\" title=\"Tim Maia - Quer Queira Quer N&atilde;o Queira\"> Quer Queira Quer N&atilde;o Queira</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=9218d3c46a97019aefc9df42c8e5486c&thumb=3', 'Quer Queira Quer Não Queira', 'Tim Maia', 'Racional Vol. 2', 'song', 289, NULL, 1),
(188, '9218d3c46a97019aefc9df42c8e5486c', 'http://play.marcelomotta.com/play/index.php?ssid=9218d3c46a97019aefc9df42c8e5486c&type=song&oid=6183&uid=1&name=Tim%20Maia%20-%20Paz%20Interior.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6183\" title=\"Tim Maia - Paz Interior\"> Paz Interior</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=9218d3c46a97019aefc9df42c8e5486c&thumb=3', 'Paz Interior', 'Tim Maia', 'Racional Vol. 2', 'song', 171, NULL, 2),
(189, '9218d3c46a97019aefc9df42c8e5486c', 'http://play.marcelomotta.com/play/index.php?ssid=9218d3c46a97019aefc9df42c8e5486c&type=song&oid=16336&uid=1&name=Tim%20Maia%20-%20Paz%20Interior.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16336\" title=\"Tim Maia - Paz Interior\"> Paz Interior</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=9218d3c46a97019aefc9df42c8e5486c&thumb=3', 'Paz Interior', 'Tim Maia', 'Racional Vol. 2', 'song', 171, NULL, 2),
(190, '9218d3c46a97019aefc9df42c8e5486c', 'http://play.marcelomotta.com/play/index.php?ssid=9218d3c46a97019aefc9df42c8e5486c&type=song&oid=6189&uid=1&name=Tim%20Maia%20-%20O%20Caminho%20Do%20Bem.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6189\" title=\"Tim Maia - O Caminho Do Bem\"> O Caminho Do Bem</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=9218d3c46a97019aefc9df42c8e5486c&thumb=3', 'O Caminho Do Bem', 'Tim Maia', 'Racional Vol. 2', 'song', 367, NULL, 3),
(191, '9218d3c46a97019aefc9df42c8e5486c', 'http://play.marcelomotta.com/play/index.php?ssid=9218d3c46a97019aefc9df42c8e5486c&type=song&oid=16342&uid=1&name=Tim%20Maia%20-%20O%20Caminho%20Do%20Bem.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16342\" title=\"Tim Maia - O Caminho Do Bem\"> O Caminho Do Bem</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=9218d3c46a97019aefc9df42c8e5486c&thumb=3', 'O Caminho Do Bem', 'Tim Maia', 'Racional Vol. 2', 'song', 367, NULL, 3),
(192, '9218d3c46a97019aefc9df42c8e5486c', 'http://play.marcelomotta.com/play/index.php?ssid=9218d3c46a97019aefc9df42c8e5486c&type=song&oid=6184&uid=1&name=Tim%20Maia%20-%20Energia%20Racional.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6184\" title=\"Tim Maia - Energia Racional\"> Energia Racional</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=9218d3c46a97019aefc9df42c8e5486c&thumb=3', 'Energia Racional', 'Tim Maia', 'Racional Vol. 2', 'song', 173, NULL, 4),
(193, '9218d3c46a97019aefc9df42c8e5486c', 'http://play.marcelomotta.com/play/index.php?ssid=9218d3c46a97019aefc9df42c8e5486c&type=song&oid=16337&uid=1&name=Tim%20Maia%20-%20Energia%20Racional.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16337\" title=\"Tim Maia - Energia Racional\"> Energia Racional</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=9218d3c46a97019aefc9df42c8e5486c&thumb=3', 'Energia Racional', 'Tim Maia', 'Racional Vol. 2', 'song', 173, NULL, 4),
(194, '9218d3c46a97019aefc9df42c8e5486c', 'http://play.marcelomotta.com/play/index.php?ssid=9218d3c46a97019aefc9df42c8e5486c&type=song&oid=6186&uid=1&name=Tim%20Maia%20-%20Que%20Legal.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6186\" title=\"Tim Maia - Que Legal\"> Que Legal</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=9218d3c46a97019aefc9df42c8e5486c&thumb=3', 'Que Legal', 'Tim Maia', 'Racional Vol. 2', 'song', 249, NULL, 5),
(195, '9218d3c46a97019aefc9df42c8e5486c', 'http://play.marcelomotta.com/play/index.php?ssid=9218d3c46a97019aefc9df42c8e5486c&type=song&oid=16339&uid=1&name=Tim%20Maia%20-%20Que%20Legal.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16339\" title=\"Tim Maia - Que Legal\"> Que Legal</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=9218d3c46a97019aefc9df42c8e5486c&thumb=3', 'Que Legal', 'Tim Maia', 'Racional Vol. 2', 'song', 249, NULL, 5),
(196, '9218d3c46a97019aefc9df42c8e5486c', 'http://play.marcelomotta.com/play/index.php?ssid=9218d3c46a97019aefc9df42c8e5486c&type=song&oid=6190&uid=1&name=Tim%20Maia%20-%20Cultura%20Racional.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6190\" title=\"Tim Maia - Cultura Racional\"> Cultura Racional</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=9218d3c46a97019aefc9df42c8e5486c&thumb=3', 'Cultura Racional', 'Tim Maia', 'Racional Vol. 2', 'song', 294, NULL, 6),
(197, '9218d3c46a97019aefc9df42c8e5486c', 'http://play.marcelomotta.com/play/index.php?ssid=9218d3c46a97019aefc9df42c8e5486c&type=song&oid=16343&uid=1&name=Tim%20Maia%20-%20Cultura%20Racional.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16343\" title=\"Tim Maia - Cultura Racional\"> Cultura Racional</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=9218d3c46a97019aefc9df42c8e5486c&thumb=3', 'Cultura Racional', 'Tim Maia', 'Racional Vol. 2', 'song', 294, NULL, 6),
(198, '9218d3c46a97019aefc9df42c8e5486c', 'http://play.marcelomotta.com/play/index.php?ssid=9218d3c46a97019aefc9df42c8e5486c&type=song&oid=6191&uid=1&name=Tim%20Maia%20-%20O%20Dever%20De%20Fazer%20Propaganda%20Deste%20Conhecimento.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6191\" title=\"Tim Maia - O Dever De Fazer Propaganda Deste Conhecimento\"> O Dever De Fazer Propaganda Deste Conhecimento</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=9218d3c46a97019aefc9df42c8e5486c&thumb=3', 'O Dever De Fazer Propaganda Deste Conhecimento', 'Tim Maia', 'Racional Vol. 2', 'song', 355, NULL, 7),
(199, '9218d3c46a97019aefc9df42c8e5486c', 'http://play.marcelomotta.com/play/index.php?ssid=9218d3c46a97019aefc9df42c8e5486c&type=song&oid=16344&uid=1&name=Tim%20Maia%20-%20O%20Dever%20De%20Fazer%20Propaganda%20Deste%20Conhecimento.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16344\" title=\"Tim Maia - O Dever De Fazer Propaganda Deste Conhecimento\"> O Dever De Fazer Propaganda Deste Conhecimento</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=9218d3c46a97019aefc9df42c8e5486c&thumb=3', 'O Dever De Fazer Propaganda Deste Conhecimento', 'Tim Maia', 'Racional Vol. 2', 'song', 355, NULL, 7),
(200, '9218d3c46a97019aefc9df42c8e5486c', 'http://play.marcelomotta.com/play/index.php?ssid=9218d3c46a97019aefc9df42c8e5486c&type=song&oid=6188&uid=1&name=Tim%20Maia%20-%20Guine%20Bissau%20Mo-ambique%20E%20Angola%20Racional.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6188\" title=\"Tim Maia - Guine Bissau Mo&ccedil;ambique E Angola Racional\"> Guine Bissau Mo&ccedil;ambique E Angola Racional</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=9218d3c46a97019aefc9df42c8e5486c&thumb=3', 'Guine Bissau Moçambique E Angola Racional', 'Tim Maia', 'Racional Vol. 2', 'song', 367, NULL, 8),
(201, '9218d3c46a97019aefc9df42c8e5486c', 'http://play.marcelomotta.com/play/index.php?ssid=9218d3c46a97019aefc9df42c8e5486c&type=song&oid=16341&uid=1&name=Tim%20Maia%20-%20Guine%20Bissau%20Mo-ambique%20E%20Angola%20Racional.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16341\" title=\"Tim Maia - Guine Bissau Mo&ccedil;ambique E Angola Racional\"> Guine Bissau Mo&ccedil;ambique E Angola Racional</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=9218d3c46a97019aefc9df42c8e5486c&thumb=3', 'Guine Bissau Moçambique E Angola Racional', 'Tim Maia', 'Racional Vol. 2', 'song', 367, NULL, 8),
(202, '9218d3c46a97019aefc9df42c8e5486c', 'http://play.marcelomotta.com/play/index.php?ssid=9218d3c46a97019aefc9df42c8e5486c&type=song&oid=6187&uid=1&name=Tim%20Maia%20-%20Imuniza-o%20Nacional%20Que%20Beleza.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6187\" title=\"Tim Maia - Imuniza&ccedil;&atilde;o Nacional Que Beleza\"> Imuniza&ccedil;&atilde;o Nacional Que Beleza</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=9218d3c46a97019aefc9df42c8e5486c&thumb=3', 'Imunização Nacional Que Beleza', 'Tim Maia', 'Racional Vol. 2', 'song', 212, NULL, 9),
(203, '9218d3c46a97019aefc9df42c8e5486c', 'http://play.marcelomotta.com/play/index.php?ssid=9218d3c46a97019aefc9df42c8e5486c&type=song&oid=16340&uid=1&name=Tim%20Maia%20-%20Imuniza-o%20Nacional%20Que%20Beleza.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16340\" title=\"Tim Maia - Imuniza&ccedil;&atilde;o Nacional Que Beleza\"> Imuniza&ccedil;&atilde;o Nacional Que Beleza</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=9218d3c46a97019aefc9df42c8e5486c&thumb=3', 'Imunização Nacional Que Beleza', 'Tim Maia', 'Racional Vol. 2', 'song', 212, NULL, 9),
(204, '394ffdcabca9b5836d10a9944bd37432', 'http://play.marcelomotta.com/play/index.php?ssid=394ffdcabca9b5836d10a9944bd37432&type=song&oid=6185&uid=1&name=Tim%20Maia%20-%20Quer%20Queira%20Quer%20N-o%20Queira.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6185\" title=\"Tim Maia - Quer Queira Quer N&atilde;o Queira\"> Quer Queira Quer N&atilde;o Queira</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=394ffdcabca9b5836d10a9944bd37432&thumb=3', 'Quer Queira Quer Não Queira', 'Tim Maia', 'Racional Vol. 2', 'song', 289, NULL, 1),
(205, '394ffdcabca9b5836d10a9944bd37432', 'http://play.marcelomotta.com/play/index.php?ssid=394ffdcabca9b5836d10a9944bd37432&type=song&oid=16338&uid=1&name=Tim%20Maia%20-%20Quer%20Queira%20Quer%20N-o%20Queira.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16338\" title=\"Tim Maia - Quer Queira Quer N&atilde;o Queira\"> Quer Queira Quer N&atilde;o Queira</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=394ffdcabca9b5836d10a9944bd37432&thumb=3', 'Quer Queira Quer Não Queira', 'Tim Maia', 'Racional Vol. 2', 'song', 289, NULL, 1),
(206, '394ffdcabca9b5836d10a9944bd37432', 'http://play.marcelomotta.com/play/index.php?ssid=394ffdcabca9b5836d10a9944bd37432&type=song&oid=6183&uid=1&name=Tim%20Maia%20-%20Paz%20Interior.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6183\" title=\"Tim Maia - Paz Interior\"> Paz Interior</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=394ffdcabca9b5836d10a9944bd37432&thumb=3', 'Paz Interior', 'Tim Maia', 'Racional Vol. 2', 'song', 171, NULL, 2),
(207, '394ffdcabca9b5836d10a9944bd37432', 'http://play.marcelomotta.com/play/index.php?ssid=394ffdcabca9b5836d10a9944bd37432&type=song&oid=16336&uid=1&name=Tim%20Maia%20-%20Paz%20Interior.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16336\" title=\"Tim Maia - Paz Interior\"> Paz Interior</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=394ffdcabca9b5836d10a9944bd37432&thumb=3', 'Paz Interior', 'Tim Maia', 'Racional Vol. 2', 'song', 171, NULL, 2),
(208, '394ffdcabca9b5836d10a9944bd37432', 'http://play.marcelomotta.com/play/index.php?ssid=394ffdcabca9b5836d10a9944bd37432&type=song&oid=6189&uid=1&name=Tim%20Maia%20-%20O%20Caminho%20Do%20Bem.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6189\" title=\"Tim Maia - O Caminho Do Bem\"> O Caminho Do Bem</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=394ffdcabca9b5836d10a9944bd37432&thumb=3', 'O Caminho Do Bem', 'Tim Maia', 'Racional Vol. 2', 'song', 367, NULL, 3),
(209, '394ffdcabca9b5836d10a9944bd37432', 'http://play.marcelomotta.com/play/index.php?ssid=394ffdcabca9b5836d10a9944bd37432&type=song&oid=16342&uid=1&name=Tim%20Maia%20-%20O%20Caminho%20Do%20Bem.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16342\" title=\"Tim Maia - O Caminho Do Bem\"> O Caminho Do Bem</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=394ffdcabca9b5836d10a9944bd37432&thumb=3', 'O Caminho Do Bem', 'Tim Maia', 'Racional Vol. 2', 'song', 367, NULL, 3),
(210, '394ffdcabca9b5836d10a9944bd37432', 'http://play.marcelomotta.com/play/index.php?ssid=394ffdcabca9b5836d10a9944bd37432&type=song&oid=6184&uid=1&name=Tim%20Maia%20-%20Energia%20Racional.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6184\" title=\"Tim Maia - Energia Racional\"> Energia Racional</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=394ffdcabca9b5836d10a9944bd37432&thumb=3', 'Energia Racional', 'Tim Maia', 'Racional Vol. 2', 'song', 173, NULL, 4),
(211, '394ffdcabca9b5836d10a9944bd37432', 'http://play.marcelomotta.com/play/index.php?ssid=394ffdcabca9b5836d10a9944bd37432&type=song&oid=16337&uid=1&name=Tim%20Maia%20-%20Energia%20Racional.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16337\" title=\"Tim Maia - Energia Racional\"> Energia Racional</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=394ffdcabca9b5836d10a9944bd37432&thumb=3', 'Energia Racional', 'Tim Maia', 'Racional Vol. 2', 'song', 173, NULL, 4),
(212, '394ffdcabca9b5836d10a9944bd37432', 'http://play.marcelomotta.com/play/index.php?ssid=394ffdcabca9b5836d10a9944bd37432&type=song&oid=6186&uid=1&name=Tim%20Maia%20-%20Que%20Legal.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6186\" title=\"Tim Maia - Que Legal\"> Que Legal</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=394ffdcabca9b5836d10a9944bd37432&thumb=3', 'Que Legal', 'Tim Maia', 'Racional Vol. 2', 'song', 249, NULL, 5),
(213, '394ffdcabca9b5836d10a9944bd37432', 'http://play.marcelomotta.com/play/index.php?ssid=394ffdcabca9b5836d10a9944bd37432&type=song&oid=16339&uid=1&name=Tim%20Maia%20-%20Que%20Legal.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16339\" title=\"Tim Maia - Que Legal\"> Que Legal</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=394ffdcabca9b5836d10a9944bd37432&thumb=3', 'Que Legal', 'Tim Maia', 'Racional Vol. 2', 'song', 249, NULL, 5),
(214, '394ffdcabca9b5836d10a9944bd37432', 'http://play.marcelomotta.com/play/index.php?ssid=394ffdcabca9b5836d10a9944bd37432&type=song&oid=6190&uid=1&name=Tim%20Maia%20-%20Cultura%20Racional.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6190\" title=\"Tim Maia - Cultura Racional\"> Cultura Racional</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=394ffdcabca9b5836d10a9944bd37432&thumb=3', 'Cultura Racional', 'Tim Maia', 'Racional Vol. 2', 'song', 294, NULL, 6),
(215, '394ffdcabca9b5836d10a9944bd37432', 'http://play.marcelomotta.com/play/index.php?ssid=394ffdcabca9b5836d10a9944bd37432&type=song&oid=16343&uid=1&name=Tim%20Maia%20-%20Cultura%20Racional.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16343\" title=\"Tim Maia - Cultura Racional\"> Cultura Racional</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=394ffdcabca9b5836d10a9944bd37432&thumb=3', 'Cultura Racional', 'Tim Maia', 'Racional Vol. 2', 'song', 294, NULL, 6),
(216, '394ffdcabca9b5836d10a9944bd37432', 'http://play.marcelomotta.com/play/index.php?ssid=394ffdcabca9b5836d10a9944bd37432&type=song&oid=6191&uid=1&name=Tim%20Maia%20-%20O%20Dever%20De%20Fazer%20Propaganda%20Deste%20Conhecimento.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6191\" title=\"Tim Maia - O Dever De Fazer Propaganda Deste Conhecimento\"> O Dever De Fazer Propaganda Deste Conhecimento</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=394ffdcabca9b5836d10a9944bd37432&thumb=3', 'O Dever De Fazer Propaganda Deste Conhecimento', 'Tim Maia', 'Racional Vol. 2', 'song', 355, NULL, 7),
(217, '394ffdcabca9b5836d10a9944bd37432', 'http://play.marcelomotta.com/play/index.php?ssid=394ffdcabca9b5836d10a9944bd37432&type=song&oid=16344&uid=1&name=Tim%20Maia%20-%20O%20Dever%20De%20Fazer%20Propaganda%20Deste%20Conhecimento.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16344\" title=\"Tim Maia - O Dever De Fazer Propaganda Deste Conhecimento\"> O Dever De Fazer Propaganda Deste Conhecimento</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=394ffdcabca9b5836d10a9944bd37432&thumb=3', 'O Dever De Fazer Propaganda Deste Conhecimento', 'Tim Maia', 'Racional Vol. 2', 'song', 355, NULL, 7),
(218, '394ffdcabca9b5836d10a9944bd37432', 'http://play.marcelomotta.com/play/index.php?ssid=394ffdcabca9b5836d10a9944bd37432&type=song&oid=6188&uid=1&name=Tim%20Maia%20-%20Guine%20Bissau%20Mo-ambique%20E%20Angola%20Racional.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6188\" title=\"Tim Maia - Guine Bissau Mo&ccedil;ambique E Angola Racional\"> Guine Bissau Mo&ccedil;ambique E Angola Racional</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=394ffdcabca9b5836d10a9944bd37432&thumb=3', 'Guine Bissau Moçambique E Angola Racional', 'Tim Maia', 'Racional Vol. 2', 'song', 367, NULL, 8),
(219, '394ffdcabca9b5836d10a9944bd37432', 'http://play.marcelomotta.com/play/index.php?ssid=394ffdcabca9b5836d10a9944bd37432&type=song&oid=16341&uid=1&name=Tim%20Maia%20-%20Guine%20Bissau%20Mo-ambique%20E%20Angola%20Racional.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16341\" title=\"Tim Maia - Guine Bissau Mo&ccedil;ambique E Angola Racional\"> Guine Bissau Mo&ccedil;ambique E Angola Racional</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=394ffdcabca9b5836d10a9944bd37432&thumb=3', 'Guine Bissau Moçambique E Angola Racional', 'Tim Maia', 'Racional Vol. 2', 'song', 367, NULL, 8),
(220, '394ffdcabca9b5836d10a9944bd37432', 'http://play.marcelomotta.com/play/index.php?ssid=394ffdcabca9b5836d10a9944bd37432&type=song&oid=6187&uid=1&name=Tim%20Maia%20-%20Imuniza-o%20Nacional%20Que%20Beleza.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6187\" title=\"Tim Maia - Imuniza&ccedil;&atilde;o Nacional Que Beleza\"> Imuniza&ccedil;&atilde;o Nacional Que Beleza</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=394ffdcabca9b5836d10a9944bd37432&thumb=3', 'Imunização Nacional Que Beleza', 'Tim Maia', 'Racional Vol. 2', 'song', 212, NULL, 9),
(221, '394ffdcabca9b5836d10a9944bd37432', 'http://play.marcelomotta.com/play/index.php?ssid=394ffdcabca9b5836d10a9944bd37432&type=song&oid=16340&uid=1&name=Tim%20Maia%20-%20Imuniza-o%20Nacional%20Que%20Beleza.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16340\" title=\"Tim Maia - Imuniza&ccedil;&atilde;o Nacional Que Beleza\"> Imuniza&ccedil;&atilde;o Nacional Que Beleza</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=394ffdcabca9b5836d10a9944bd37432&thumb=3', 'Imunização Nacional Que Beleza', 'Tim Maia', 'Racional Vol. 2', 'song', 212, NULL, 9),
(222, '6c3db42a144d290dd774296c8a596df3', 'http://play.marcelomotta.com/play/index.php?ssid=6c3db42a144d290dd774296c8a596df3&type=song&oid=6189&uid=1&name=Tim%20Maia%20-%20O%20Caminho%20Do%20Bem.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6189\" title=\"Tim Maia - O Caminho Do Bem\"> O Caminho Do Bem</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=6c3db42a144d290dd774296c8a596df3&thumb=3', 'O Caminho Do Bem', 'Tim Maia', 'Racional Vol. 2', 'song', 367, NULL, 3),
(223, '6a41fa904641e510c3679e5e5d139592', 'http://play.marcelomotta.com/play/index.php?ssid=6a41fa904641e510c3679e5e5d139592&type=song&oid=6189&uid=1&name=Tim%20Maia%20-%20O%20Caminho%20Do%20Bem.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6189\" title=\"Tim Maia - O Caminho Do Bem\"> O Caminho Do Bem</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=6a41fa904641e510c3679e5e5d139592&thumb=3', 'O Caminho Do Bem', 'Tim Maia', 'Racional Vol. 2', 'song', 367, NULL, 3),
(224, '99055944caa2c0e8cacbccaf6ba7ad0f', 'http://play.marcelomotta.com/play/index.php?ssid=99055944caa2c0e8cacbccaf6ba7ad0f&type=song&oid=6185&uid=1&name=Tim%20Maia%20-%20Quer%20Queira%20Quer%20N-o%20Queira.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6185\" title=\"Tim Maia - Quer Queira Quer N&atilde;o Queira\"> Quer Queira Quer N&atilde;o Queira</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=99055944caa2c0e8cacbccaf6ba7ad0f&thumb=3', 'Quer Queira Quer Não Queira', 'Tim Maia', 'Racional Vol. 2', 'song', 289, NULL, 1),
(225, '99055944caa2c0e8cacbccaf6ba7ad0f', 'http://play.marcelomotta.com/play/index.php?ssid=99055944caa2c0e8cacbccaf6ba7ad0f&type=song&oid=16338&uid=1&name=Tim%20Maia%20-%20Quer%20Queira%20Quer%20N-o%20Queira.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16338\" title=\"Tim Maia - Quer Queira Quer N&atilde;o Queira\"> Quer Queira Quer N&atilde;o Queira</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=99055944caa2c0e8cacbccaf6ba7ad0f&thumb=3', 'Quer Queira Quer Não Queira', 'Tim Maia', 'Racional Vol. 2', 'song', 289, NULL, 1),
(226, '99055944caa2c0e8cacbccaf6ba7ad0f', 'http://play.marcelomotta.com/play/index.php?ssid=99055944caa2c0e8cacbccaf6ba7ad0f&type=song&oid=6183&uid=1&name=Tim%20Maia%20-%20Paz%20Interior.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6183\" title=\"Tim Maia - Paz Interior\"> Paz Interior</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=99055944caa2c0e8cacbccaf6ba7ad0f&thumb=3', 'Paz Interior', 'Tim Maia', 'Racional Vol. 2', 'song', 171, NULL, 2),
(227, '99055944caa2c0e8cacbccaf6ba7ad0f', 'http://play.marcelomotta.com/play/index.php?ssid=99055944caa2c0e8cacbccaf6ba7ad0f&type=song&oid=16336&uid=1&name=Tim%20Maia%20-%20Paz%20Interior.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16336\" title=\"Tim Maia - Paz Interior\"> Paz Interior</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=99055944caa2c0e8cacbccaf6ba7ad0f&thumb=3', 'Paz Interior', 'Tim Maia', 'Racional Vol. 2', 'song', 171, NULL, 2),
(228, '99055944caa2c0e8cacbccaf6ba7ad0f', 'http://play.marcelomotta.com/play/index.php?ssid=99055944caa2c0e8cacbccaf6ba7ad0f&type=song&oid=6189&uid=1&name=Tim%20Maia%20-%20O%20Caminho%20Do%20Bem.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6189\" title=\"Tim Maia - O Caminho Do Bem\"> O Caminho Do Bem</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=99055944caa2c0e8cacbccaf6ba7ad0f&thumb=3', 'O Caminho Do Bem', 'Tim Maia', 'Racional Vol. 2', 'song', 367, NULL, 3),
(229, '99055944caa2c0e8cacbccaf6ba7ad0f', 'http://play.marcelomotta.com/play/index.php?ssid=99055944caa2c0e8cacbccaf6ba7ad0f&type=song&oid=16342&uid=1&name=Tim%20Maia%20-%20O%20Caminho%20Do%20Bem.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16342\" title=\"Tim Maia - O Caminho Do Bem\"> O Caminho Do Bem</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=99055944caa2c0e8cacbccaf6ba7ad0f&thumb=3', 'O Caminho Do Bem', 'Tim Maia', 'Racional Vol. 2', 'song', 367, NULL, 3),
(230, '99055944caa2c0e8cacbccaf6ba7ad0f', 'http://play.marcelomotta.com/play/index.php?ssid=99055944caa2c0e8cacbccaf6ba7ad0f&type=song&oid=6184&uid=1&name=Tim%20Maia%20-%20Energia%20Racional.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6184\" title=\"Tim Maia - Energia Racional\"> Energia Racional</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=99055944caa2c0e8cacbccaf6ba7ad0f&thumb=3', 'Energia Racional', 'Tim Maia', 'Racional Vol. 2', 'song', 173, NULL, 4),
(231, '99055944caa2c0e8cacbccaf6ba7ad0f', 'http://play.marcelomotta.com/play/index.php?ssid=99055944caa2c0e8cacbccaf6ba7ad0f&type=song&oid=16337&uid=1&name=Tim%20Maia%20-%20Energia%20Racional.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16337\" title=\"Tim Maia - Energia Racional\"> Energia Racional</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=99055944caa2c0e8cacbccaf6ba7ad0f&thumb=3', 'Energia Racional', 'Tim Maia', 'Racional Vol. 2', 'song', 173, NULL, 4),
(232, '99055944caa2c0e8cacbccaf6ba7ad0f', 'http://play.marcelomotta.com/play/index.php?ssid=99055944caa2c0e8cacbccaf6ba7ad0f&type=song&oid=6186&uid=1&name=Tim%20Maia%20-%20Que%20Legal.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6186\" title=\"Tim Maia - Que Legal\"> Que Legal</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=99055944caa2c0e8cacbccaf6ba7ad0f&thumb=3', 'Que Legal', 'Tim Maia', 'Racional Vol. 2', 'song', 249, NULL, 5),
(233, '99055944caa2c0e8cacbccaf6ba7ad0f', 'http://play.marcelomotta.com/play/index.php?ssid=99055944caa2c0e8cacbccaf6ba7ad0f&type=song&oid=16339&uid=1&name=Tim%20Maia%20-%20Que%20Legal.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16339\" title=\"Tim Maia - Que Legal\"> Que Legal</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=99055944caa2c0e8cacbccaf6ba7ad0f&thumb=3', 'Que Legal', 'Tim Maia', 'Racional Vol. 2', 'song', 249, NULL, 5),
(234, '99055944caa2c0e8cacbccaf6ba7ad0f', 'http://play.marcelomotta.com/play/index.php?ssid=99055944caa2c0e8cacbccaf6ba7ad0f&type=song&oid=6190&uid=1&name=Tim%20Maia%20-%20Cultura%20Racional.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6190\" title=\"Tim Maia - Cultura Racional\"> Cultura Racional</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=99055944caa2c0e8cacbccaf6ba7ad0f&thumb=3', 'Cultura Racional', 'Tim Maia', 'Racional Vol. 2', 'song', 294, NULL, 6),
(235, '99055944caa2c0e8cacbccaf6ba7ad0f', 'http://play.marcelomotta.com/play/index.php?ssid=99055944caa2c0e8cacbccaf6ba7ad0f&type=song&oid=16343&uid=1&name=Tim%20Maia%20-%20Cultura%20Racional.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16343\" title=\"Tim Maia - Cultura Racional\"> Cultura Racional</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=99055944caa2c0e8cacbccaf6ba7ad0f&thumb=3', 'Cultura Racional', 'Tim Maia', 'Racional Vol. 2', 'song', 294, NULL, 6),
(236, '99055944caa2c0e8cacbccaf6ba7ad0f', 'http://play.marcelomotta.com/play/index.php?ssid=99055944caa2c0e8cacbccaf6ba7ad0f&type=song&oid=6191&uid=1&name=Tim%20Maia%20-%20O%20Dever%20De%20Fazer%20Propaganda%20Deste%20Conhecimento.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6191\" title=\"Tim Maia - O Dever De Fazer Propaganda Deste Conhecimento\"> O Dever De Fazer Propaganda Deste Conhecimento</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=99055944caa2c0e8cacbccaf6ba7ad0f&thumb=3', 'O Dever De Fazer Propaganda Deste Conhecimento', 'Tim Maia', 'Racional Vol. 2', 'song', 355, NULL, 7),
(237, '99055944caa2c0e8cacbccaf6ba7ad0f', 'http://play.marcelomotta.com/play/index.php?ssid=99055944caa2c0e8cacbccaf6ba7ad0f&type=song&oid=16344&uid=1&name=Tim%20Maia%20-%20O%20Dever%20De%20Fazer%20Propaganda%20Deste%20Conhecimento.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16344\" title=\"Tim Maia - O Dever De Fazer Propaganda Deste Conhecimento\"> O Dever De Fazer Propaganda Deste Conhecimento</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=99055944caa2c0e8cacbccaf6ba7ad0f&thumb=3', 'O Dever De Fazer Propaganda Deste Conhecimento', 'Tim Maia', 'Racional Vol. 2', 'song', 355, NULL, 7),
(238, '99055944caa2c0e8cacbccaf6ba7ad0f', 'http://play.marcelomotta.com/play/index.php?ssid=99055944caa2c0e8cacbccaf6ba7ad0f&type=song&oid=6188&uid=1&name=Tim%20Maia%20-%20Guine%20Bissau%20Mo-ambique%20E%20Angola%20Racional.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6188\" title=\"Tim Maia - Guine Bissau Mo&ccedil;ambique E Angola Racional\"> Guine Bissau Mo&ccedil;ambique E Angola Racional</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=99055944caa2c0e8cacbccaf6ba7ad0f&thumb=3', 'Guine Bissau Moçambique E Angola Racional', 'Tim Maia', 'Racional Vol. 2', 'song', 367, NULL, 8),
(239, '99055944caa2c0e8cacbccaf6ba7ad0f', 'http://play.marcelomotta.com/play/index.php?ssid=99055944caa2c0e8cacbccaf6ba7ad0f&type=song&oid=16341&uid=1&name=Tim%20Maia%20-%20Guine%20Bissau%20Mo-ambique%20E%20Angola%20Racional.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16341\" title=\"Tim Maia - Guine Bissau Mo&ccedil;ambique E Angola Racional\"> Guine Bissau Mo&ccedil;ambique E Angola Racional</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=99055944caa2c0e8cacbccaf6ba7ad0f&thumb=3', 'Guine Bissau Moçambique E Angola Racional', 'Tim Maia', 'Racional Vol. 2', 'song', 367, NULL, 8),
(240, '99055944caa2c0e8cacbccaf6ba7ad0f', 'http://play.marcelomotta.com/play/index.php?ssid=99055944caa2c0e8cacbccaf6ba7ad0f&type=song&oid=6187&uid=1&name=Tim%20Maia%20-%20Imuniza-o%20Nacional%20Que%20Beleza.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6187\" title=\"Tim Maia - Imuniza&ccedil;&atilde;o Nacional Que Beleza\"> Imuniza&ccedil;&atilde;o Nacional Que Beleza</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=99055944caa2c0e8cacbccaf6ba7ad0f&thumb=3', 'Imunização Nacional Que Beleza', 'Tim Maia', 'Racional Vol. 2', 'song', 212, NULL, 9),
(241, '99055944caa2c0e8cacbccaf6ba7ad0f', 'http://play.marcelomotta.com/play/index.php?ssid=99055944caa2c0e8cacbccaf6ba7ad0f&type=song&oid=16340&uid=1&name=Tim%20Maia%20-%20Imuniza-o%20Nacional%20Que%20Beleza.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16340\" title=\"Tim Maia - Imuniza&ccedil;&atilde;o Nacional Que Beleza\"> Imuniza&ccedil;&atilde;o Nacional Que Beleza</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=99055944caa2c0e8cacbccaf6ba7ad0f&thumb=3', 'Imunização Nacional Que Beleza', 'Tim Maia', 'Racional Vol. 2', 'song', 212, NULL, 9),
(242, '43bf3e65d927987f3a423e252f038e98', 'http://play.marcelomotta.com/play/index.php?ssid=43bf3e65d927987f3a423e252f038e98&type=song&oid=16338&uid=1&name=Tim%20Maia%20-%20Quer%20Queira%20Quer%20N-o%20Queira.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16338\" title=\"Tim Maia - Quer Queira Quer N&atilde;o Queira\"> Quer Queira Quer N&atilde;o Queira</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=43bf3e65d927987f3a423e252f038e98&thumb=3', 'Quer Queira Quer Não Queira', 'Tim Maia', 'Racional Vol. 2', 'song', 289, NULL, 1),
(243, '372f8205638bb845e09848f1e42086bd', 'http://play.marcelomotta.com/play/index.php?ssid=372f8205638bb845e09848f1e42086bd&type=song&oid=16338&uid=1&name=Tim%20Maia%20-%20Quer%20Queira%20Quer%20N-o%20Queira.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16338\" title=\"Tim Maia - Quer Queira Quer N&atilde;o Queira\"> Quer Queira Quer N&atilde;o Queira</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=372f8205638bb845e09848f1e42086bd&thumb=3', 'Quer Queira Quer Não Queira', 'Tim Maia', 'Racional Vol. 2', 'song', 289, NULL, 1),
(244, 'b7afef4a9f065d7b92d7df6a08413ed5', 'http://play.marcelomotta.com/play/index.php?ssid=b7afef4a9f065d7b92d7df6a08413ed5&type=song&oid=16342&uid=1&name=Tim%20Maia%20-%20O%20Caminho%20Do%20Bem.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16342\" title=\"Tim Maia - O Caminho Do Bem\"> O Caminho Do Bem</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=b7afef4a9f065d7b92d7df6a08413ed5&thumb=3', 'O Caminho Do Bem', 'Tim Maia', 'Racional Vol. 2', 'song', 367, NULL, 3),
(245, 'cfb33b431014233d65195ec114b78263', 'http://play.marcelomotta.com/play/index.php?ssid=cfb33b431014233d65195ec114b78263&type=song&oid=16342&uid=1&name=Tim%20Maia%20-%20O%20Caminho%20Do%20Bem.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16342\" title=\"Tim Maia - O Caminho Do Bem\"> O Caminho Do Bem</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=cfb33b431014233d65195ec114b78263&thumb=3', 'O Caminho Do Bem', 'Tim Maia', 'Racional Vol. 2', 'song', 367, NULL, 3),
(246, 'aac723b847172814abac6634c93f38f3', 'http://play.marcelomotta.com/play/index.php?ssid=aac723b847172814abac6634c93f38f3&type=song&oid=16342&uid=1&name=Tim%20Maia%20-%20O%20Caminho%20Do%20Bem.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16342\" title=\"Tim Maia - O Caminho Do Bem\"> O Caminho Do Bem</a>', 'http://play.marcelomotta.com/image.php?object_id=473&object_type=album&auth=aac723b847172814abac6634c93f38f3&thumb=3', 'O Caminho Do Bem', 'Tim Maia', 'Racional Vol. 2', 'song', 367, NULL, 3),
(247, 'cd6c06f8acaede7555c739c1b0de5094', 'http://play.marcelomotta.com/play/index.php?ssid=cd6c06f8acaede7555c739c1b0de5094&type=song&oid=8964&uid=1&name=Amy%20Winehouse%20-%20Love%20Is%20A%20Losing%20Game.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=8964\" title=\"Amy Winehouse - Love Is A Losing Game\"> Love Is A Losing Game</a>', 'http://play.marcelomotta.com/image.php?object_id=660&object_type=album&auth=cd6c06f8acaede7555c739c1b0de5094&thumb=3&name=art.jpg', 'Love Is A Losing Game', 'Amy Winehouse', 'Back To Black', 'song', 155, NULL, 6),
(248, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19058&uid=1&name=The%20Animals%20-%20Memphis%20Tennessee.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19058\" title=\"The Animals - Memphis Tennessee\"> Memphis Tennessee</a>', 'http://play.marcelomotta.com/image.php?object_id=1106&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'Memphis Tennessee', 'The Animals', 'The Complete Animals Disc 2', 'song', 188, NULL, 1),
(249, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19062&uid=1&name=The%20Animals%20-%20Don-t%20Let%20Me%20Be%20Misunderstood.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19062\" title=\"The Animals - Don&#039;t Let Me Be Misunderstood\"> Don&#039;t Let Me Be Misunderstood</a>', 'http://play.marcelomotta.com/image.php?object_id=1106&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'Don\'t Let Me Be Misunderstood', 'The Animals', 'The Complete Animals Disc 2', 'song', 150, NULL, 2),
(250, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19069&uid=1&name=The%20Animals%20-%20Club%20A%20Go-Go.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19069\" title=\"The Animals - Club A Go-Go\"> Club A Go-Go</a>', 'http://play.marcelomotta.com/image.php?object_id=1106&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'Club A Go-Go', 'The Animals', 'The Complete Animals Disc 2', 'song', 142, NULL, 3),
(251, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19052&uid=1&name=The%20Animals%20-%20Roadrunner.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19052\" title=\"The Animals - Roadrunner\"> Roadrunner</a>', 'http://play.marcelomotta.com/image.php?object_id=1106&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'Roadrunner', 'The Animals', 'The Complete Animals Disc 2', 'song', 170, NULL, 4),
(252, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19063&uid=1&name=The%20Animals%20-%20Hallelujah%20I%20Love%20Her%20So.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19063\" title=\"The Animals - Hallelujah I Love Her So\"> Hallelujah I Love Her So</a>', 'http://play.marcelomotta.com/image.php?object_id=1106&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'Hallelujah I Love Her So', 'The Animals', 'The Complete Animals Disc 2', 'song', 168, NULL, 5),
(253, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19057&uid=1&name=The%20Animals%20-%20Don-t%20Want%20Much.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19057\" title=\"The Animals - Don&#039;t Want Much\"> Don&#039;t Want Much</a>', 'http://play.marcelomotta.com/image.php?object_id=1106&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'Don\'t Want Much', 'The Animals', 'The Complete Animals Disc 2', 'song', 205, NULL, 6),
(254, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19067&uid=1&name=The%20Animals%20-%20I%20Believe%20To%20My%20Soul.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19067\" title=\"The Animals - I Believe To My Soul\"> I Believe To My Soul</a>', 'http://play.marcelomotta.com/image.php?object_id=1106&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'I Believe To My Soul', 'The Animals', 'The Complete Animals Disc 2', 'song', 206, NULL, 7),
(255, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19064&uid=1&name=The%20Animals%20-%20Let%20The%20Good%20Times%20Roll.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19064\" title=\"The Animals - Let The Good Times Roll\"> Let The Good Times Roll</a>', 'http://play.marcelomotta.com/image.php?object_id=1106&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'Let The Good Times Roll', 'The Animals', 'The Complete Animals Disc 2', 'song', 117, NULL, 8),
(256, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19055&uid=1&name=The%20Animals%20-%20Mess%20Around.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19055\" title=\"The Animals - Mess Around\"> Mess Around</a>', 'http://play.marcelomotta.com/image.php?object_id=1106&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'Mess Around', 'The Animals', 'The Complete Animals Disc 2', 'song', 142, NULL, 9),
(257, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19060&uid=1&name=The%20Animals%20-%20How%20You-ve%20Changed.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19060\" title=\"The Animals - How You&#039;ve Changed\"> How You&#039;ve Changed</a>', 'http://play.marcelomotta.com/image.php?object_id=1106&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'How You\'ve Changed', 'The Animals', 'The Complete Animals Disc 2', 'song', 194, NULL, 10),
(258, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19056&uid=1&name=The%20Animals%20-%20I%20Ain-t%20Got%20You.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19056\" title=\"The Animals - I Ain&#039;t Got You\"> I Ain&#039;t Got You</a>', 'http://play.marcelomotta.com/image.php?object_id=1106&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'I Ain\'t Got You', 'The Animals', 'The Complete Animals Disc 2', 'song', 151, NULL, 11),
(259, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19053&uid=1&name=The%20Animals%20-%20Roberta.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19053\" title=\"The Animals - Roberta\"> Roberta</a>', 'http://play.marcelomotta.com/image.php?object_id=1106&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'Roberta', 'The Animals', 'The Complete Animals Disc 2', 'song', 127, NULL, 12),
(260, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19070&uid=1&name=The%20Animals%20-%20Bright%20Lights%20Big%20City.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19070\" title=\"The Animals - Bright Lights Big City\"> Bright Lights Big City</a>', 'http://play.marcelomotta.com/image.php?object_id=1106&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'Bright Lights Big City', 'The Animals', 'The Complete Animals Disc 2', 'song', 177, NULL, 13),
(261, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19071&uid=1&name=The%20Animals%20-%20Worried%20Life%20Blues.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19071\" title=\"The Animals - Worried Life Blues\"> Worried Life Blues</a>', 'http://play.marcelomotta.com/image.php?object_id=1106&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'Worried Life Blues', 'The Animals', 'The Complete Animals Disc 2', 'song', 253, NULL, 14),
(262, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19066&uid=1&name=The%20Animals%20-%20Bring%20It%20On%20Home%20To%20Me.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19066\" title=\"The Animals - Bring It On Home To Me\"> Bring It On Home To Me</a>', 'http://play.marcelomotta.com/image.php?object_id=1106&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'Bring It On Home To Me', 'The Animals', 'The Complete Animals Disc 2', 'song', 165, NULL, 15),
(263, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19054&uid=1&name=The%20Animals%20-%20For%20Miss%20Caulker.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19054\" title=\"The Animals - For Miss Caulker\"> For Miss Caulker</a>', 'http://play.marcelomotta.com/image.php?object_id=1106&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'For Miss Caulker', 'The Animals', 'The Complete Animals Disc 2', 'song', 239, NULL, 16),
(264, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19059&uid=1&name=The%20Animals%20-%20I%20Can-t%20Believe%20It.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19059\" title=\"The Animals - I Can&#039;t Believe It\"> I Can&#039;t Believe It</a>', 'http://play.marcelomotta.com/image.php?object_id=1106&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'I Can\'t Believe It', 'The Animals', 'The Complete Animals Disc 2', 'song', 213, NULL, 17),
(265, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19065&uid=1&name=The%20Animals%20-%20We%20Gotta%20Get%20Out%20Of%20This%20Place.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19065\" title=\"The Animals - We Gotta Get Out Of This Place\"> We Gotta Get Out Of This Place</a>', 'http://play.marcelomotta.com/image.php?object_id=1106&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'We Gotta Get Out Of This Place', 'The Animals', 'The Complete Animals Disc 2', 'song', 195, NULL, 18),
(266, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19061&uid=1&name=The%20Animals%20-%20It-s%20My%20Life.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19061\" title=\"The Animals - It&#039;s My Life\"> It&#039;s My Life</a>', 'http://play.marcelomotta.com/image.php?object_id=1106&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'It\'s My Life', 'The Animals', 'The Complete Animals Disc 2', 'song', 189, NULL, 19),
(267, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19068&uid=1&name=The%20Animals%20-%20I-m%20Gonna%20Change%20The%20World.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19068\" title=\"The Animals - I&#039;m Gonna Change The World\"> I&#039;m Gonna Change The World</a>', 'http://play.marcelomotta.com/image.php?object_id=1106&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'I\'m Gonna Change The World', 'The Animals', 'The Complete Animals Disc 2', 'song', 214, NULL, 20),
(268, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19076&uid=1&name=The%20Animals%20-%20Boom%20Boom.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19076\" title=\"The Animals - Boom Boom\"> Boom Boom</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'Boom Boom', 'The Animals', 'The Complete Animals Disc 1', 'song', 201, NULL, 1),
(269, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19077&uid=1&name=The%20Animals%20-%20Talkin-%20-bout%20You.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19077\" title=\"The Animals - Talkin&#039; &#039;bout You\"> Talkin&#039; &#039;bout You</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'Talkin\' \'bout You', 'The Animals', 'The Complete Animals Disc 1', 'song', 426, NULL, 2);
INSERT INTO `stream_playlist` (`id`, `sid`, `url`, `info_url`, `image_url`, `title`, `author`, `album`, `type`, `time`, `codec`, `track_num`) VALUES
(270, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19075&uid=1&name=The%20Animals%20-%20Blue%20Feeling.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19075\" title=\"The Animals - Blue Feeling\"> Blue Feeling</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'Blue Feeling', 'The Animals', 'The Complete Animals Disc 1', 'song', 153, NULL, 3),
(271, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19083&uid=1&name=The%20Animals%20-%20Dimples.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19083\" title=\"The Animals - Dimples\"> Dimples</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'Dimples', 'The Animals', 'The Complete Animals Disc 1', 'song', 173, NULL, 4),
(272, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19085&uid=1&name=The%20Animals%20-%20Baby%20Let%20Me%20Take%20You%20Home.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19085\" title=\"The Animals - Baby Let Me Take You Home\"> Baby Let Me Take You Home</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'Baby Let Me Take You Home', 'The Animals', 'The Complete Animals Disc 1', 'song', 143, NULL, 5),
(273, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19090&uid=1&name=The%20Animals%20-%20Gonna%20Send%20You%20Back%20To%20Walker.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19090\" title=\"The Animals - Gonna Send You Back To Walker\"> Gonna Send You Back To Walker</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'Gonna Send You Back To Walker', 'The Animals', 'The Complete Animals Disc 1', 'song', 150, NULL, 6),
(274, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19091&uid=1&name=The%20Animals%20-%20Baby%20What-s%20Wrong.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19091\" title=\"The Animals - Baby What&#039;s Wrong\"> Baby What&#039;s Wrong</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'Baby What\'s Wrong', 'The Animals', 'The Complete Animals Disc 1', 'song', 171, NULL, 7),
(275, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19087&uid=1&name=The%20Animals%20-%20The%20House%20Of%20The%20Rising%20Sun.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19087\" title=\"The Animals - The House Of The Rising Sun\"> The House Of The Rising Sun</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'The House Of The Rising Sun', 'The Animals', 'The Complete Animals Disc 1', 'song', 272, NULL, 8),
(276, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19089&uid=1&name=The%20Animals%20-%20F-E-E-L.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19089\" title=\"The Animals - F-E-E-L\"> F-E-E-L</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'F-E-E-L', 'The Animals', 'The Complete Animals Disc 1', 'song', 164, NULL, 9),
(277, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19079&uid=1&name=The%20Animals%20-%20I-m%20Mad%20Again.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19079\" title=\"The Animals - I&#039;m Mad Again\"> I&#039;m Mad Again</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'I\'m Mad Again', 'The Animals', 'The Complete Animals Disc 1', 'song', 258, NULL, 10),
(278, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19081&uid=1&name=The%20Animals%20-%20Night%20Time%20Is%20The%20Right%20Time.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19081\" title=\"The Animals - Night Time Is The Right Time\"> Night Time Is The Right Time</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'Night Time Is The Right Time', 'The Animals', 'The Complete Animals Disc 1', 'song', 227, NULL, 11),
(279, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19082&uid=1&name=The%20Animals%20-%20Around%20And%20Around.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19082\" title=\"The Animals - Around And Around\"> Around And Around</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'Around And Around', 'The Animals', 'The Complete Animals Disc 1', 'song', 167, NULL, 12),
(280, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19072&uid=1&name=The%20Animals%20-%20I-m%20In%20Love%20Again.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19072\" title=\"The Animals - I&#039;m In Love Again\"> I&#039;m In Love Again</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'I\'m In Love Again', 'The Animals', 'The Complete Animals Disc 1', 'song', 183, NULL, 13),
(281, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19074&uid=1&name=The%20Animals%20-%20Bury%20My%20Body.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19074\" title=\"The Animals - Bury My Body\"> Bury My Body</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'Bury My Body', 'The Animals', 'The Complete Animals Disc 1', 'song', 172, NULL, 14),
(282, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19086&uid=1&name=The%20Animals%20-%20She%20Said%20Yeah.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19086\" title=\"The Animals - She Said Yeah\"> She Said Yeah</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'She Said Yeah', 'The Animals', 'The Complete Animals Disc 1', 'song', 141, NULL, 15),
(283, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19078&uid=1&name=The%20Animals%20-%20I-m%20Crying.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19078\" title=\"The Animals - I&#039;m Crying\"> I&#039;m Crying</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'I\'m Crying', 'The Animals', 'The Complete Animals Disc 1', 'song', 169, NULL, 16),
(284, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19080&uid=1&name=The%20Animals%20-%20Take%20It%20Easy.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19080\" title=\"The Animals - Take It Easy\"> Take It Easy</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'Take It Easy', 'The Animals', 'The Complete Animals Disc 1', 'song', 175, NULL, 17),
(285, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19088&uid=1&name=The%20Animals%20-%20The%20Story%20Of%20Bo%20Diddley.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19088\" title=\"The Animals - The Story Of Bo Diddley\"> The Story Of Bo Diddley</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'The Story Of Bo Diddley', 'The Animals', 'The Complete Animals Disc 1', 'song', 345, NULL, 18),
(286, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19073&uid=1&name=The%20Animals%20-%20The%20Girl%20Can-t%20Help%20It.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19073\" title=\"The Animals - The Girl Can&#039;t Help It\"> The Girl Can&#039;t Help It</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'The Girl Can\'t Help It', 'The Animals', 'The Complete Animals Disc 1', 'song', 143, NULL, 19),
(287, '748cedf15d817191074105aa1f4ae504', 'http://play.marcelomotta.com/play/index.php?ssid=748cedf15d817191074105aa1f4ae504&type=song&oid=19084&uid=1&name=The%20Animals%20-%20I-ve%20Been%20Around.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=19084\" title=\"The Animals - I&#039;ve Been Around\"> I&#039;ve Been Around</a>', 'http://play.marcelomotta.com/image.php?object_id=1107&object_type=album&auth=748cedf15d817191074105aa1f4ae504&thumb=3', 'I\'ve Been Around', 'The Animals', 'The Complete Animals Disc 1', 'song', 96, NULL, 20),
(288, '114e82429e525618916f96907e7b8cf6', 'http://play.marcelomotta.com/play/index.php?ssid=114e82429e525618916f96907e7b8cf6&type=song&oid=6646&uid=1&name=AC-DC%20-%20Highway%20To%20Hell.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6646\" title=\"AC/DC - Highway To Hell\"> Highway To Hell</a>', 'http://play.marcelomotta.com/image.php?object_id=381&object_type=album&auth=114e82429e525618916f96907e7b8cf6&thumb=3&name=art.jpg', 'Highway To Hell', 'AC/DC', 'Highway To Hell', 'song', 208, NULL, 1),
(289, '114e82429e525618916f96907e7b8cf6', 'http://play.marcelomotta.com/play/index.php?ssid=114e82429e525618916f96907e7b8cf6&type=song&oid=16799&uid=1&name=AC-DC%20-%20Highway%20To%20Hell.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16799\" title=\"AC/DC - Highway To Hell\"> Highway To Hell</a>', 'http://play.marcelomotta.com/image.php?object_id=381&object_type=album&auth=114e82429e525618916f96907e7b8cf6&thumb=3&name=art.jpg', 'Highway To Hell', 'AC/DC', 'Highway To Hell', 'song', 208, NULL, 1),
(290, '114e82429e525618916f96907e7b8cf6', 'http://play.marcelomotta.com/play/index.php?ssid=114e82429e525618916f96907e7b8cf6&type=song&oid=6642&uid=1&name=AC-DC%20-%20Girls%20Got%20Rhythm.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6642\" title=\"AC/DC - Girls Got Rhythm\"> Girls Got Rhythm</a>', 'http://play.marcelomotta.com/image.php?object_id=381&object_type=album&auth=114e82429e525618916f96907e7b8cf6&thumb=3&name=art.jpg', 'Girls Got Rhythm', 'AC/DC', 'Highway To Hell', 'song', 203, NULL, 2),
(291, '114e82429e525618916f96907e7b8cf6', 'http://play.marcelomotta.com/play/index.php?ssid=114e82429e525618916f96907e7b8cf6&type=song&oid=16795&uid=1&name=AC-DC%20-%20Girls%20Got%20Rhythm.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16795\" title=\"AC/DC - Girls Got Rhythm\"> Girls Got Rhythm</a>', 'http://play.marcelomotta.com/image.php?object_id=381&object_type=album&auth=114e82429e525618916f96907e7b8cf6&thumb=3&name=art.jpg', 'Girls Got Rhythm', 'AC/DC', 'Highway To Hell', 'song', 203, NULL, 2),
(292, '114e82429e525618916f96907e7b8cf6', 'http://play.marcelomotta.com/play/index.php?ssid=114e82429e525618916f96907e7b8cf6&type=song&oid=6644&uid=1&name=AC-DC%20-%20Walk%20All%20Over%20You.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6644\" title=\"AC/DC - Walk All Over You\"> Walk All Over You</a>', 'http://play.marcelomotta.com/image.php?object_id=381&object_type=album&auth=114e82429e525618916f96907e7b8cf6&thumb=3&name=art.jpg', 'Walk All Over You', 'AC/DC', 'Highway To Hell', 'song', 310, NULL, 3),
(293, '114e82429e525618916f96907e7b8cf6', 'http://play.marcelomotta.com/play/index.php?ssid=114e82429e525618916f96907e7b8cf6&type=song&oid=16797&uid=1&name=AC-DC%20-%20Walk%20All%20Over%20You.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16797\" title=\"AC/DC - Walk All Over You\"> Walk All Over You</a>', 'http://play.marcelomotta.com/image.php?object_id=381&object_type=album&auth=114e82429e525618916f96907e7b8cf6&thumb=3&name=art.jpg', 'Walk All Over You', 'AC/DC', 'Highway To Hell', 'song', 310, NULL, 3),
(294, '114e82429e525618916f96907e7b8cf6', 'http://play.marcelomotta.com/play/index.php?ssid=114e82429e525618916f96907e7b8cf6&type=song&oid=6641&uid=1&name=AC-DC%20-%20Touch%20Too%20Much.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6641\" title=\"AC/DC - Touch Too Much\"> Touch Too Much</a>', 'http://play.marcelomotta.com/image.php?object_id=381&object_type=album&auth=114e82429e525618916f96907e7b8cf6&thumb=3&name=art.jpg', 'Touch Too Much', 'AC/DC', 'Highway To Hell', 'song', 266, NULL, 4),
(295, '114e82429e525618916f96907e7b8cf6', 'http://play.marcelomotta.com/play/index.php?ssid=114e82429e525618916f96907e7b8cf6&type=song&oid=16794&uid=1&name=AC-DC%20-%20Touch%20Too%20Much.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16794\" title=\"AC/DC - Touch Too Much\"> Touch Too Much</a>', 'http://play.marcelomotta.com/image.php?object_id=381&object_type=album&auth=114e82429e525618916f96907e7b8cf6&thumb=3&name=art.jpg', 'Touch Too Much', 'AC/DC', 'Highway To Hell', 'song', 266, NULL, 4),
(296, '114e82429e525618916f96907e7b8cf6', 'http://play.marcelomotta.com/play/index.php?ssid=114e82429e525618916f96907e7b8cf6&type=song&oid=6648&uid=1&name=AC-DC%20-%20Beating%20Around%20The%20Bush.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6648\" title=\"AC/DC - Beating Around The Bush\"> Beating Around The Bush</a>', 'http://play.marcelomotta.com/image.php?object_id=381&object_type=album&auth=114e82429e525618916f96907e7b8cf6&thumb=3&name=art.jpg', 'Beating Around The Bush', 'AC/DC', 'Highway To Hell', 'song', 236, NULL, 5),
(297, '114e82429e525618916f96907e7b8cf6', 'http://play.marcelomotta.com/play/index.php?ssid=114e82429e525618916f96907e7b8cf6&type=song&oid=16801&uid=1&name=AC-DC%20-%20Beating%20Around%20The%20Bush.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16801\" title=\"AC/DC - Beating Around The Bush\"> Beating Around The Bush</a>', 'http://play.marcelomotta.com/image.php?object_id=381&object_type=album&auth=114e82429e525618916f96907e7b8cf6&thumb=3&name=art.jpg', 'Beating Around The Bush', 'AC/DC', 'Highway To Hell', 'song', 236, NULL, 5),
(298, '114e82429e525618916f96907e7b8cf6', 'http://play.marcelomotta.com/play/index.php?ssid=114e82429e525618916f96907e7b8cf6&type=song&oid=6650&uid=1&name=AC-DC%20-%20Shot%20Down%20In%20Flames.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6650\" title=\"AC/DC - Shot Down In Flames\"> Shot Down In Flames</a>', 'http://play.marcelomotta.com/image.php?object_id=381&object_type=album&auth=114e82429e525618916f96907e7b8cf6&thumb=3&name=art.jpg', 'Shot Down In Flames', 'AC/DC', 'Highway To Hell', 'song', 202, NULL, 6),
(299, '114e82429e525618916f96907e7b8cf6', 'http://play.marcelomotta.com/play/index.php?ssid=114e82429e525618916f96907e7b8cf6&type=song&oid=16803&uid=1&name=AC-DC%20-%20Shot%20Down%20In%20Flames.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16803\" title=\"AC/DC - Shot Down In Flames\"> Shot Down In Flames</a>', 'http://play.marcelomotta.com/image.php?object_id=381&object_type=album&auth=114e82429e525618916f96907e7b8cf6&thumb=3&name=art.jpg', 'Shot Down In Flames', 'AC/DC', 'Highway To Hell', 'song', 202, NULL, 6),
(300, '114e82429e525618916f96907e7b8cf6', 'http://play.marcelomotta.com/play/index.php?ssid=114e82429e525618916f96907e7b8cf6&type=song&oid=6649&uid=1&name=AC-DC%20-%20Get%20It%20Hot.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6649\" title=\"AC/DC - Get It Hot\"> Get It Hot</a>', 'http://play.marcelomotta.com/image.php?object_id=381&object_type=album&auth=114e82429e525618916f96907e7b8cf6&thumb=3&name=art.jpg', 'Get It Hot', 'AC/DC', 'Highway To Hell', 'song', 154, NULL, 7),
(301, '114e82429e525618916f96907e7b8cf6', 'http://play.marcelomotta.com/play/index.php?ssid=114e82429e525618916f96907e7b8cf6&type=song&oid=16802&uid=1&name=AC-DC%20-%20Get%20It%20Hot.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16802\" title=\"AC/DC - Get It Hot\"> Get It Hot</a>', 'http://play.marcelomotta.com/image.php?object_id=381&object_type=album&auth=114e82429e525618916f96907e7b8cf6&thumb=3&name=art.jpg', 'Get It Hot', 'AC/DC', 'Highway To Hell', 'song', 154, NULL, 7),
(302, '114e82429e525618916f96907e7b8cf6', 'http://play.marcelomotta.com/play/index.php?ssid=114e82429e525618916f96907e7b8cf6&type=song&oid=6647&uid=1&name=AC-DC%20-%20If%20You%20Want%20Blood%20-You-ve%20Got%20It-.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6647\" title=\"AC/DC - If You Want Blood (You&#039;ve Got It)\"> If You Want Blood (You&#039;ve Got It)</a>', 'http://play.marcelomotta.com/image.php?object_id=381&object_type=album&auth=114e82429e525618916f96907e7b8cf6&thumb=3&name=art.jpg', 'If You Want Blood (You\'ve Got It)', 'AC/DC', 'Highway To Hell', 'song', 276, NULL, 8),
(303, '114e82429e525618916f96907e7b8cf6', 'http://play.marcelomotta.com/play/index.php?ssid=114e82429e525618916f96907e7b8cf6&type=song&oid=16800&uid=1&name=AC-DC%20-%20If%20You%20Want%20Blood%20-You-ve%20Got%20It-.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16800\" title=\"AC/DC - If You Want Blood (You&#039;ve Got It)\"> If You Want Blood (You&#039;ve Got It)</a>', 'http://play.marcelomotta.com/image.php?object_id=381&object_type=album&auth=114e82429e525618916f96907e7b8cf6&thumb=3&name=art.jpg', 'If You Want Blood (You\'ve Got It)', 'AC/DC', 'Highway To Hell', 'song', 276, NULL, 8),
(304, '114e82429e525618916f96907e7b8cf6', 'http://play.marcelomotta.com/play/index.php?ssid=114e82429e525618916f96907e7b8cf6&type=song&oid=6643&uid=1&name=AC-DC%20-%20Love%20Hungry%20Man.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6643\" title=\"AC/DC - Love Hungry Man\"> Love Hungry Man</a>', 'http://play.marcelomotta.com/image.php?object_id=381&object_type=album&auth=114e82429e525618916f96907e7b8cf6&thumb=3&name=art.jpg', 'Love Hungry Man', 'AC/DC', 'Highway To Hell', 'song', 257, NULL, 9),
(305, '114e82429e525618916f96907e7b8cf6', 'http://play.marcelomotta.com/play/index.php?ssid=114e82429e525618916f96907e7b8cf6&type=song&oid=16796&uid=1&name=AC-DC%20-%20Love%20Hungry%20Man.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16796\" title=\"AC/DC - Love Hungry Man\"> Love Hungry Man</a>', 'http://play.marcelomotta.com/image.php?object_id=381&object_type=album&auth=114e82429e525618916f96907e7b8cf6&thumb=3&name=art.jpg', 'Love Hungry Man', 'AC/DC', 'Highway To Hell', 'song', 257, NULL, 9),
(306, '114e82429e525618916f96907e7b8cf6', 'http://play.marcelomotta.com/play/index.php?ssid=114e82429e525618916f96907e7b8cf6&type=song&oid=6645&uid=1&name=AC-DC%20-%20Night%20Prowler.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=6645\" title=\"AC/DC - Night Prowler\"> Night Prowler</a>', 'http://play.marcelomotta.com/image.php?object_id=381&object_type=album&auth=114e82429e525618916f96907e7b8cf6&thumb=3&name=art.jpg', 'Night Prowler', 'AC/DC', 'Highway To Hell', 'song', 375, NULL, 10),
(307, '114e82429e525618916f96907e7b8cf6', 'http://play.marcelomotta.com/play/index.php?ssid=114e82429e525618916f96907e7b8cf6&type=song&oid=16798&uid=1&name=AC-DC%20-%20Night%20Prowler.mp3', '<a href=\"http://play.marcelomotta.com/song.php?action=show_song&amp;song_id=16798\" title=\"AC/DC - Night Prowler\"> Night Prowler</a>', 'http://play.marcelomotta.com/image.php?object_id=381&object_type=album&auth=114e82429e525618916f96907e7b8cf6&thumb=3&name=art.jpg', 'Night Prowler', 'AC/DC', 'Highway To Hell', 'song', 375, NULL, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tag`
--

CREATE TABLE `tag` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tag`
--

INSERT INTO `tag` (`id`, `name`, `is_hidden`) VALUES
(3, 'Electronic', 0),
(13, 'Pop', 0),
(43, 'Rock & Roll', 0),
(42, 'Trance GOA', 0),
(41, 'House', 0),
(39, 'Disco', 0),
(40, 'Funk', 0),
(44, 'Oldies', 0),
(45, 'Rock', 0),
(46, 'Rock\'n\'Roll', 0),
(47, 'Hard Rock', 0),
(48, 'Heavy Metal', 0),
(49, 'Metal', 0),
(50, 'Classic Rock', 0),
(51, 'Alt. Rock', 0),
(52, 'genre', 0),
(53, 'Acoustic', 0),
(54, 'Other', 0),
(55, 'General Rock', 0),
(56, 'Blues', 0),
(57, 'Psychedelic Rock', 0),
(58, 'KaZaa', 0),
(59, 'Progressive Rock', 0),
(60, 'Folk-Rock', 0),
(61, 'New Age', 0),
(62, 'default', 0),
(63, 'Symphonic Rock', 0),
(64, 'Alternative', 0),
(65, 'Industrial', 0),
(66, 'Industrial Metal', 0),
(67, 'Other Reggae', 0),
(68, 'Reggae(Acoustic)', 0),
(69, 'Reggae', 0),
(70, 'Rap', 0),
(71, 'Rock Nacional', 0),
(72, 'World', 0),
(73, 'Mpb', 0),
(74, 'Soul', 0),
(75, 'Hard', 0),
(76, 'Heavy', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tag_map`
--

CREATE TABLE `tag_map` (
  `id` int(11) UNSIGNED NOT NULL,
  `tag_id` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `object_type` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `user` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tag_map`
--

INSERT INTO `tag_map` (`id`, `tag_id`, `object_id`, `object_type`, `user`) VALUES
(6062, 3, 351, 'album', 0),
(6061, 3, 5073, 'song', 0),
(6060, 40, 5072, 'song', 0),
(6059, 39, 5072, 'song', 0),
(6058, 13, 5072, 'song', 0),
(6057, 3, 5072, 'song', 0),
(6056, 40, 5071, 'song', 0),
(6055, 39, 5071, 'song', 0),
(6054, 13, 5071, 'song', 0),
(6053, 3, 5071, 'song', 0),
(6052, 40, 5070, 'song', 0),
(6051, 39, 5070, 'song', 0),
(6050, 13, 5070, 'song', 0),
(6049, 3, 5070, 'song', 0),
(6048, 40, 5069, 'song', 0),
(6047, 39, 5069, 'song', 0),
(6046, 13, 5069, 'song', 0),
(6045, 3, 5069, 'song', 0),
(6044, 40, 350, 'album', 0),
(6043, 40, 5068, 'song', 0),
(6042, 39, 350, 'album', 0),
(6041, 39, 5068, 'song', 0),
(6040, 13, 350, 'album', 0),
(6039, 13, 5068, 'song', 0),
(6038, 3, 350, 'album', 0),
(6036, 40, 5067, 'song', 0),
(6037, 3, 5068, 'song', 0),
(6035, 39, 5067, 'song', 0),
(6034, 13, 5067, 'song', 0),
(6033, 3, 5067, 'song', 0),
(6032, 40, 5066, 'song', 0),
(6031, 39, 5066, 'song', 0),
(6030, 13, 5066, 'song', 0),
(6029, 3, 5066, 'song', 0),
(6028, 40, 349, 'album', 0),
(5367, 3, 95, 'artist', 0),
(6027, 40, 5065, 'song', 0),
(6026, 39, 349, 'album', 0),
(6025, 39, 5065, 'song', 0),
(6024, 13, 349, 'album', 0),
(6023, 13, 5065, 'song', 0),
(6021, 3, 5065, 'song', 0),
(6022, 3, 349, 'album', 0),
(6020, 40, 5064, 'song', 0),
(6019, 39, 5064, 'song', 0),
(6018, 13, 5064, 'song', 0),
(6017, 3, 5064, 'song', 0),
(6016, 40, 5063, 'song', 0),
(6015, 39, 5063, 'song', 0),
(6014, 13, 5063, 'song', 0),
(6013, 3, 5063, 'song', 0),
(6012, 40, 5062, 'song', 0),
(6011, 39, 5062, 'song', 0),
(6010, 13, 5062, 'song', 0),
(6009, 3, 5062, 'song', 0),
(6008, 40, 348, 'album', 0),
(6007, 40, 5061, 'song', 0),
(6006, 39, 348, 'album', 0),
(6005, 39, 5061, 'song', 0),
(6004, 13, 348, 'album', 0),
(6003, 13, 5061, 'song', 0),
(6002, 3, 348, 'album', 0),
(6001, 3, 5061, 'song', 0),
(6000, 40, 5060, 'song', 0),
(5999, 39, 5060, 'song', 0),
(5998, 13, 5060, 'song', 0),
(5997, 3, 5060, 'song', 0),
(5996, 40, 5059, 'song', 0),
(5995, 39, 5059, 'song', 0),
(5994, 13, 5059, 'song', 0),
(5993, 3, 5059, 'song', 0),
(5992, 40, 5058, 'song', 0),
(5991, 39, 5058, 'song', 0),
(5990, 13, 5058, 'song', 0),
(5989, 3, 5058, 'song', 0),
(5988, 40, 347, 'album', 0),
(5987, 40, 5057, 'song', 0),
(5986, 39, 347, 'album', 0),
(5985, 39, 5057, 'song', 0),
(5984, 13, 347, 'album', 0),
(5983, 13, 5057, 'song', 0),
(5982, 3, 347, 'album', 0),
(5981, 3, 5057, 'song', 0),
(5980, 40, 5056, 'song', 0),
(5979, 39, 5056, 'song', 0),
(5978, 13, 5056, 'song', 0),
(5977, 3, 5056, 'song', 0),
(5976, 40, 5055, 'song', 0),
(5975, 39, 5055, 'song', 0),
(5974, 13, 5055, 'song', 0),
(5973, 3, 5055, 'song', 0),
(5972, 40, 5054, 'song', 0),
(5971, 39, 5054, 'song', 0),
(6208, 43, 5112, 'song', 0),
(6207, 43, 5111, 'song', 0),
(6206, 43, 5110, 'song', 0),
(6205, 43, 5109, 'song', 0),
(6204, 43, 5108, 'song', 0),
(6203, 43, 5107, 'song', 0),
(6202, 43, 5106, 'song', 0),
(6201, 43, 5105, 'song', 0),
(6200, 43, 5104, 'song', 0),
(6199, 43, 5103, 'song', 0),
(6198, 43, 5102, 'song', 0),
(6197, 43, 5101, 'song', 0),
(6196, 43, 5100, 'song', 0),
(6195, 43, 5099, 'song', 0),
(6194, 43, 99, 'artist', 0),
(6193, 43, 362, 'album', 0),
(6192, 43, 5098, 'song', 0),
(6191, 42, 98, 'artist', 0),
(5970, 13, 5054, 'song', 0),
(5969, 3, 5054, 'song', 0),
(6190, 42, 361, 'album', 0),
(6189, 42, 5097, 'song', 0),
(6188, 40, 360, 'album', 0),
(6187, 40, 5096, 'song', 0),
(6186, 39, 360, 'album', 0),
(6185, 39, 5096, 'song', 0),
(6184, 13, 360, 'album', 0),
(6183, 13, 5096, 'song', 0),
(6182, 3, 360, 'album', 0),
(6181, 3, 5096, 'song', 0),
(6180, 40, 5095, 'song', 0),
(5968, 40, 346, 'album', 0),
(6179, 39, 5095, 'song', 0),
(5967, 40, 5053, 'song', 0),
(6178, 13, 5095, 'song', 0),
(6177, 3, 5095, 'song', 0),
(6176, 40, 5094, 'song', 0),
(6175, 39, 5094, 'song', 0),
(6174, 13, 5094, 'song', 0),
(6173, 3, 5094, 'song', 0),
(6172, 40, 5093, 'song', 0),
(6171, 39, 5093, 'song', 0),
(6170, 13, 5093, 'song', 0),
(5966, 39, 346, 'album', 0),
(6169, 3, 5093, 'song', 0),
(5965, 39, 5053, 'song', 0),
(6168, 40, 359, 'album', 0),
(6167, 40, 5092, 'song', 0),
(6166, 39, 359, 'album', 0),
(6165, 39, 5092, 'song', 0),
(6164, 13, 359, 'album', 0),
(6163, 13, 5092, 'song', 0),
(6162, 3, 359, 'album', 0),
(6161, 3, 5092, 'song', 0),
(6160, 41, 5091, 'song', 0),
(5964, 13, 346, 'album', 0),
(6159, 41, 95, 'artist', 0),
(5963, 13, 5053, 'song', 0),
(6158, 41, 358, 'album', 0),
(6157, 41, 5090, 'song', 0),
(6156, 40, 5089, 'song', 0),
(5961, 3, 5053, 'song', 0),
(5962, 3, 346, 'album', 0),
(6155, 39, 5089, 'song', 0),
(5960, 40, 345, 'album', 0),
(6154, 13, 5089, 'song', 0),
(6153, 3, 5089, 'song', 0),
(5959, 40, 5052, 'song', 0),
(5958, 39, 345, 'album', 0),
(6152, 40, 357, 'album', 0),
(5957, 39, 5052, 'song', 0),
(6151, 40, 5088, 'song', 0),
(6150, 39, 357, 'album', 0),
(6149, 39, 5088, 'song', 0),
(6148, 13, 357, 'album', 0),
(6147, 13, 5088, 'song', 0),
(6146, 3, 357, 'album', 0),
(6145, 3, 5088, 'song', 0),
(6144, 40, 5087, 'song', 0),
(6143, 39, 5087, 'song', 0),
(6142, 13, 5087, 'song', 0),
(6141, 3, 5087, 'song', 0),
(6140, 40, 5086, 'song', 0),
(6139, 39, 5086, 'song', 0),
(6138, 13, 5086, 'song', 0),
(6137, 3, 5086, 'song', 0),
(5956, 13, 345, 'album', 0),
(5955, 13, 5052, 'song', 0),
(5954, 3, 345, 'album', 0),
(6136, 40, 5085, 'song', 0),
(6135, 39, 5085, 'song', 0),
(6134, 13, 5085, 'song', 0),
(6133, 3, 5085, 'song', 0),
(6132, 40, 5084, 'song', 0),
(6131, 39, 5084, 'song', 0),
(6130, 13, 5084, 'song', 0),
(6129, 3, 5084, 'song', 0),
(6128, 40, 356, 'album', 0),
(6127, 40, 5083, 'song', 0),
(6126, 39, 356, 'album', 0),
(6125, 39, 5083, 'song', 0),
(6124, 13, 356, 'album', 0),
(6123, 13, 5083, 'song', 0),
(6122, 3, 356, 'album', 0),
(6121, 3, 5083, 'song', 0),
(6120, 40, 355, 'album', 0),
(6119, 40, 5082, 'song', 0),
(6118, 39, 355, 'album', 0),
(6117, 39, 5082, 'song', 0),
(6116, 13, 355, 'album', 0),
(6115, 13, 5082, 'song', 0),
(5953, 3, 5052, 'song', 0),
(6114, 3, 355, 'album', 0),
(5952, 40, 344, 'album', 0),
(6113, 3, 5082, 'song', 0),
(5951, 40, 5051, 'song', 0),
(6112, 40, 354, 'album', 0),
(5950, 39, 344, 'album', 0),
(6111, 40, 5081, 'song', 0),
(6110, 39, 354, 'album', 0),
(5949, 39, 5051, 'song', 0),
(5948, 13, 344, 'album', 0),
(6109, 39, 5081, 'song', 0),
(5947, 13, 5051, 'song', 0),
(6108, 13, 354, 'album', 0),
(6107, 13, 5081, 'song', 0),
(6106, 3, 354, 'album', 0),
(6105, 3, 5081, 'song', 0),
(6104, 40, 5080, 'song', 0),
(6103, 39, 5080, 'song', 0),
(6102, 13, 5080, 'song', 0),
(5946, 3, 344, 'album', 0),
(6101, 3, 5080, 'song', 0),
(5945, 3, 5051, 'song', 0),
(6100, 40, 5079, 'song', 0),
(6099, 39, 5079, 'song', 0),
(6098, 13, 5079, 'song', 0),
(6097, 3, 5079, 'song', 0),
(6096, 40, 353, 'album', 0),
(6095, 40, 5078, 'song', 0),
(6094, 39, 353, 'album', 0),
(6093, 39, 5078, 'song', 0),
(6092, 13, 353, 'album', 0),
(5944, 40, 5050, 'song', 0),
(6091, 13, 5078, 'song', 0),
(6090, 3, 353, 'album', 0),
(5943, 39, 5050, 'song', 0),
(6089, 3, 5078, 'song', 0),
(6088, 40, 5077, 'song', 0),
(5942, 13, 5050, 'song', 0),
(6087, 39, 5077, 'song', 0),
(6086, 13, 5077, 'song', 0),
(6085, 3, 5077, 'song', 0),
(6084, 40, 5076, 'song', 0),
(6083, 39, 5076, 'song', 0),
(6082, 13, 5076, 'song', 0),
(6081, 3, 5076, 'song', 0),
(5370, 13, 95, 'artist', 0),
(6080, 40, 5075, 'song', 0),
(5373, 39, 95, 'artist', 0),
(6079, 39, 5075, 'song', 0),
(5376, 40, 95, 'artist', 0),
(6078, 13, 5075, 'song', 0),
(6077, 3, 5075, 'song', 0),
(6076, 40, 352, 'album', 0),
(6075, 40, 5074, 'song', 0),
(6074, 39, 352, 'album', 0),
(6073, 39, 5074, 'song', 0),
(6072, 13, 352, 'album', 0),
(6071, 13, 5074, 'song', 0),
(6070, 3, 352, 'album', 0),
(6069, 3, 5074, 'song', 0),
(6068, 40, 351, 'album', 0),
(6067, 40, 5073, 'song', 0),
(6066, 39, 351, 'album', 0),
(6065, 39, 5073, 'song', 0),
(6064, 13, 351, 'album', 0),
(6063, 13, 5073, 'song', 0),
(5610, 3, 326, 'album', 0),
(5612, 13, 326, 'album', 0),
(5614, 39, 326, 'album', 0),
(5941, 3, 5050, 'song', 0),
(5616, 40, 326, 'album', 0),
(5617, 3, 4988, 'song', 0),
(5618, 13, 4988, 'song', 0),
(5619, 39, 4988, 'song', 0),
(5620, 40, 4988, 'song', 0),
(5621, 3, 4989, 'song', 0),
(5622, 13, 4989, 'song', 0),
(5623, 39, 4989, 'song', 0),
(5624, 40, 4989, 'song', 0),
(5625, 3, 4990, 'song', 0),
(5626, 13, 4990, 'song', 0),
(5627, 39, 4990, 'song', 0),
(5628, 40, 4990, 'song', 0),
(5629, 3, 4991, 'song', 0),
(5630, 13, 4991, 'song', 0),
(5631, 39, 4991, 'song', 0),
(5632, 40, 4991, 'song', 0),
(5633, 3, 4992, 'song', 0),
(5634, 13, 4992, 'song', 0),
(5635, 39, 4992, 'song', 0),
(5636, 40, 4992, 'song', 0),
(5637, 3, 4993, 'song', 0),
(5638, 3, 327, 'album', 0),
(5639, 13, 4993, 'song', 0),
(5640, 13, 327, 'album', 0),
(5641, 39, 4993, 'song', 0),
(5642, 39, 327, 'album', 0),
(5643, 40, 4993, 'song', 0),
(5644, 40, 327, 'album', 0),
(5645, 3, 4994, 'song', 0),
(5646, 13, 4994, 'song', 0),
(5647, 39, 4994, 'song', 0),
(5648, 40, 4994, 'song', 0),
(5649, 3, 4995, 'song', 0),
(5650, 3, 328, 'album', 0),
(5651, 13, 4995, 'song', 0),
(5652, 13, 328, 'album', 0),
(5653, 39, 4995, 'song', 0),
(5654, 39, 328, 'album', 0),
(5655, 40, 4995, 'song', 0),
(5656, 40, 328, 'album', 0),
(5657, 3, 4996, 'song', 0),
(5658, 13, 4996, 'song', 0),
(5659, 39, 4996, 'song', 0),
(5660, 40, 4996, 'song', 0),
(5661, 3, 4997, 'song', 0),
(5662, 13, 4997, 'song', 0),
(5663, 39, 4997, 'song', 0),
(5664, 40, 4997, 'song', 0),
(5665, 3, 4998, 'song', 0),
(5666, 13, 4998, 'song', 0),
(5667, 39, 4998, 'song', 0),
(5668, 40, 4998, 'song', 0),
(5669, 3, 4999, 'song', 0),
(5670, 3, 329, 'album', 0),
(5671, 13, 4999, 'song', 0),
(5672, 13, 329, 'album', 0),
(5673, 39, 4999, 'song', 0),
(5674, 39, 329, 'album', 0),
(5675, 40, 4999, 'song', 0),
(5676, 40, 329, 'album', 0),
(5677, 3, 5000, 'song', 0),
(5678, 13, 5000, 'song', 0),
(5679, 39, 5000, 'song', 0),
(5680, 40, 5000, 'song', 0),
(5681, 3, 5001, 'song', 0),
(5682, 13, 5001, 'song', 0),
(5683, 39, 5001, 'song', 0),
(5684, 40, 5001, 'song', 0),
(5685, 3, 5002, 'song', 0),
(5686, 3, 330, 'album', 0),
(5687, 13, 5002, 'song', 0),
(5688, 13, 330, 'album', 0),
(5689, 39, 5002, 'song', 0),
(5690, 39, 330, 'album', 0),
(5691, 40, 5002, 'song', 0),
(5692, 40, 330, 'album', 0),
(5693, 3, 5003, 'song', 0),
(5694, 13, 5003, 'song', 0),
(5695, 39, 5003, 'song', 0),
(5696, 40, 5003, 'song', 0),
(5697, 3, 5004, 'song', 0),
(5698, 13, 5004, 'song', 0),
(5699, 39, 5004, 'song', 0),
(5700, 40, 5004, 'song', 0),
(5701, 3, 5005, 'song', 0),
(5702, 13, 5005, 'song', 0),
(5703, 39, 5005, 'song', 0),
(5704, 40, 5005, 'song', 0),
(5705, 3, 5006, 'song', 0),
(5706, 3, 331, 'album', 0),
(5707, 13, 5006, 'song', 0),
(5708, 13, 331, 'album', 0),
(5709, 39, 5006, 'song', 0),
(5710, 39, 331, 'album', 0),
(5711, 40, 5006, 'song', 0),
(5712, 40, 331, 'album', 0),
(5713, 3, 5007, 'song', 0),
(5714, 13, 5007, 'song', 0),
(5715, 39, 5007, 'song', 0),
(5716, 40, 5007, 'song', 0),
(5717, 3, 5008, 'song', 0),
(5718, 13, 5008, 'song', 0),
(5719, 39, 5008, 'song', 0),
(5720, 40, 5008, 'song', 0),
(5721, 3, 5009, 'song', 0),
(5722, 3, 332, 'album', 0),
(5723, 3, 96, 'artist', 0),
(5724, 13, 5009, 'song', 0),
(5725, 13, 332, 'album', 0),
(5726, 13, 96, 'artist', 0),
(5727, 39, 5009, 'song', 0),
(5728, 39, 332, 'album', 0),
(5729, 39, 96, 'artist', 0),
(5730, 40, 5009, 'song', 0),
(5731, 40, 332, 'album', 0),
(5732, 40, 96, 'artist', 0),
(5733, 3, 5010, 'song', 0),
(5734, 3, 333, 'album', 0),
(5735, 13, 5010, 'song', 0),
(5736, 13, 333, 'album', 0),
(5737, 39, 5010, 'song', 0),
(5738, 39, 333, 'album', 0),
(5739, 40, 5010, 'song', 0),
(5740, 40, 333, 'album', 0),
(5741, 3, 5011, 'song', 0),
(5742, 13, 5011, 'song', 0),
(5743, 39, 5011, 'song', 0),
(5744, 40, 5011, 'song', 0),
(5745, 3, 5012, 'song', 0),
(5746, 13, 5012, 'song', 0),
(5747, 39, 5012, 'song', 0),
(5748, 40, 5012, 'song', 0),
(5749, 3, 5013, 'song', 0),
(5750, 13, 5013, 'song', 0),
(5751, 39, 5013, 'song', 0),
(5752, 40, 5013, 'song', 0),
(5753, 3, 5014, 'song', 0),
(5754, 3, 334, 'album', 0),
(5755, 13, 5014, 'song', 0),
(5756, 13, 334, 'album', 0),
(5757, 39, 5014, 'song', 0),
(5758, 39, 334, 'album', 0),
(5759, 40, 5014, 'song', 0),
(5760, 40, 334, 'album', 0),
(5761, 3, 5015, 'song', 0),
(5762, 13, 5015, 'song', 0),
(5763, 39, 5015, 'song', 0),
(5764, 40, 5015, 'song', 0),
(5765, 3, 5016, 'song', 0),
(5766, 13, 5016, 'song', 0),
(5767, 39, 5016, 'song', 0),
(5768, 40, 5016, 'song', 0),
(5769, 3, 5017, 'song', 0),
(5770, 13, 5017, 'song', 0),
(5771, 39, 5017, 'song', 0),
(5772, 40, 5017, 'song', 0),
(5773, 3, 5018, 'song', 0),
(5774, 3, 335, 'album', 0),
(5775, 13, 5018, 'song', 0),
(5776, 13, 335, 'album', 0),
(5777, 39, 5018, 'song', 0),
(5778, 39, 335, 'album', 0),
(5779, 40, 5018, 'song', 0),
(5780, 40, 335, 'album', 0),
(5781, 3, 5019, 'song', 0),
(5782, 13, 5019, 'song', 0),
(5783, 39, 5019, 'song', 0),
(5784, 40, 5019, 'song', 0),
(5785, 3, 5020, 'song', 0),
(5786, 13, 5020, 'song', 0),
(5787, 39, 5020, 'song', 0),
(5788, 40, 5020, 'song', 0),
(5789, 3, 5021, 'song', 0),
(5790, 13, 5021, 'song', 0),
(5791, 39, 5021, 'song', 0),
(5792, 40, 5021, 'song', 0),
(5793, 3, 5022, 'song', 0),
(5794, 13, 5022, 'song', 0),
(5795, 39, 5022, 'song', 0),
(5796, 40, 5022, 'song', 0),
(5797, 3, 5023, 'song', 0),
(5798, 3, 336, 'album', 0),
(5799, 13, 5023, 'song', 0),
(5800, 13, 336, 'album', 0),
(5801, 39, 5023, 'song', 0),
(5802, 39, 336, 'album', 0),
(5803, 40, 5023, 'song', 0),
(5804, 40, 336, 'album', 0),
(5805, 3, 5024, 'song', 0),
(5806, 13, 5024, 'song', 0),
(5807, 39, 5024, 'song', 0),
(5808, 40, 5024, 'song', 0),
(5809, 3, 5025, 'song', 0),
(5810, 13, 5025, 'song', 0),
(5811, 39, 5025, 'song', 0),
(5812, 40, 5025, 'song', 0),
(5813, 3, 5026, 'song', 0),
(5814, 13, 5026, 'song', 0),
(5815, 39, 5026, 'song', 0),
(5816, 40, 5026, 'song', 0),
(5817, 3, 5027, 'song', 0),
(5818, 13, 5027, 'song', 0),
(5819, 39, 5027, 'song', 0),
(5820, 40, 5027, 'song', 0),
(5821, 3, 5028, 'song', 0),
(5822, 13, 5028, 'song', 0),
(5823, 39, 5028, 'song', 0),
(5824, 40, 5028, 'song', 0),
(5825, 3, 5029, 'song', 0),
(5826, 3, 337, 'album', 0),
(5827, 13, 5029, 'song', 0),
(5828, 13, 337, 'album', 0),
(5829, 39, 5029, 'song', 0),
(5830, 39, 337, 'album', 0),
(5831, 40, 5029, 'song', 0),
(5832, 40, 337, 'album', 0),
(5833, 3, 5030, 'song', 0),
(5834, 13, 5030, 'song', 0),
(5835, 39, 5030, 'song', 0),
(5836, 40, 5030, 'song', 0),
(5837, 3, 5031, 'song', 0),
(5838, 13, 5031, 'song', 0),
(5839, 39, 5031, 'song', 0),
(5840, 40, 5031, 'song', 0),
(5841, 3, 5032, 'song', 0),
(5842, 13, 5032, 'song', 0),
(5843, 39, 5032, 'song', 0),
(5844, 40, 5032, 'song', 0),
(5845, 3, 5033, 'song', 0),
(5846, 3, 338, 'album', 0),
(5847, 13, 5033, 'song', 0),
(5848, 13, 338, 'album', 0),
(5849, 39, 5033, 'song', 0),
(5850, 39, 338, 'album', 0),
(5851, 40, 5033, 'song', 0),
(5852, 40, 338, 'album', 0),
(5853, 3, 5034, 'song', 0),
(5854, 13, 5034, 'song', 0),
(5855, 39, 5034, 'song', 0),
(5856, 40, 5034, 'song', 0),
(5857, 3, 5035, 'song', 0),
(5858, 13, 5035, 'song', 0),
(5859, 39, 5035, 'song', 0),
(5860, 40, 5035, 'song', 0),
(5861, 3, 5036, 'song', 0),
(5862, 3, 339, 'album', 0),
(5863, 13, 5036, 'song', 0),
(5864, 13, 339, 'album', 0),
(5865, 39, 5036, 'song', 0),
(5866, 39, 339, 'album', 0),
(5867, 40, 5036, 'song', 0),
(5868, 40, 339, 'album', 0),
(5869, 3, 5037, 'song', 0),
(5870, 13, 5037, 'song', 0),
(5871, 39, 5037, 'song', 0),
(5872, 40, 5037, 'song', 0),
(5873, 3, 5038, 'song', 0),
(5874, 13, 5038, 'song', 0),
(5875, 39, 5038, 'song', 0),
(5876, 40, 5038, 'song', 0),
(5877, 3, 5039, 'song', 0),
(5878, 13, 5039, 'song', 0),
(5879, 39, 5039, 'song', 0),
(5880, 40, 5039, 'song', 0),
(5881, 3, 5040, 'song', 0),
(5882, 3, 340, 'album', 0),
(5883, 13, 5040, 'song', 0),
(5884, 13, 340, 'album', 0),
(5885, 39, 5040, 'song', 0),
(5886, 39, 340, 'album', 0),
(5887, 40, 5040, 'song', 0),
(5888, 40, 340, 'album', 0),
(5889, 3, 5041, 'song', 0),
(5890, 13, 5041, 'song', 0),
(5891, 39, 5041, 'song', 0),
(5892, 40, 5041, 'song', 0),
(5893, 3, 5042, 'song', 0),
(5894, 3, 341, 'album', 0),
(5895, 3, 97, 'artist', 0),
(5896, 13, 5042, 'song', 0),
(5897, 13, 341, 'album', 0),
(5898, 13, 97, 'artist', 0),
(5899, 39, 5042, 'song', 0),
(5900, 39, 341, 'album', 0),
(5901, 39, 97, 'artist', 0),
(5902, 40, 5042, 'song', 0),
(5903, 40, 341, 'album', 0),
(5904, 40, 97, 'artist', 0),
(5905, 3, 5043, 'song', 0),
(5906, 13, 5043, 'song', 0),
(5907, 39, 5043, 'song', 0),
(5908, 40, 5043, 'song', 0),
(5909, 3, 5044, 'song', 0),
(5910, 3, 342, 'album', 0),
(5911, 13, 5044, 'song', 0),
(5912, 13, 342, 'album', 0),
(5913, 39, 5044, 'song', 0),
(5914, 39, 342, 'album', 0),
(5915, 40, 5044, 'song', 0),
(5916, 40, 342, 'album', 0),
(5917, 3, 5045, 'song', 0),
(5918, 3, 343, 'album', 0),
(5919, 13, 5045, 'song', 0),
(5920, 13, 343, 'album', 0),
(5921, 39, 5045, 'song', 0),
(5922, 39, 343, 'album', 0),
(5923, 40, 5045, 'song', 0),
(5924, 40, 343, 'album', 0),
(5925, 3, 5046, 'song', 0),
(5926, 13, 5046, 'song', 0),
(5927, 39, 5046, 'song', 0),
(5928, 40, 5046, 'song', 0),
(5929, 3, 5047, 'song', 0),
(5930, 13, 5047, 'song', 0),
(5931, 39, 5047, 'song', 0),
(5932, 40, 5047, 'song', 0),
(5933, 3, 5048, 'song', 0),
(5934, 13, 5048, 'song', 0),
(5935, 39, 5048, 'song', 0),
(5936, 40, 5048, 'song', 0),
(5937, 3, 5049, 'song', 0),
(5938, 13, 5049, 'song', 0),
(5939, 39, 5049, 'song', 0),
(5940, 40, 5049, 'song', 0),
(6209, 43, 5113, 'song', 0),
(6210, 43, 5114, 'song', 0),
(6211, 43, 5115, 'song', 0),
(6212, 43, 5116, 'song', 0),
(6213, 43, 5117, 'song', 0),
(6214, 43, 5118, 'song', 0),
(6215, 43, 5119, 'song', 0),
(6216, 43, 5120, 'song', 0),
(6217, 43, 5121, 'song', 0),
(6218, 43, 5122, 'song', 0),
(6219, 43, 5123, 'song', 0),
(6220, 43, 5124, 'song', 0),
(6221, 43, 5125, 'song', 0),
(6222, 43, 5126, 'song', 0),
(6223, 43, 5127, 'song', 0),
(6224, 43, 5128, 'song', 0),
(6225, 43, 5129, 'song', 0),
(6226, 43, 5130, 'song', 0),
(6227, 43, 5131, 'song', 0),
(6228, 43, 5132, 'song', 0),
(6229, 43, 5133, 'song', 0),
(6230, 43, 5134, 'song', 0),
(6231, 43, 5135, 'song', 0),
(6232, 43, 5136, 'song', 0),
(6233, 43, 5137, 'song', 0),
(6234, 43, 5138, 'song', 0),
(6235, 43, 5139, 'song', 0),
(6236, 43, 5140, 'song', 0),
(6237, 43, 5141, 'song', 0),
(6238, 43, 5142, 'song', 0),
(6239, 43, 5143, 'song', 0),
(6240, 43, 5144, 'song', 0),
(6241, 43, 5145, 'song', 0),
(6242, 43, 5146, 'song', 0),
(6243, 43, 5147, 'song', 0),
(6244, 43, 5148, 'song', 0),
(6245, 43, 5149, 'song', 0),
(6246, 43, 5150, 'song', 0),
(6247, 43, 5151, 'song', 0),
(6248, 43, 5152, 'song', 0),
(6249, 43, 5153, 'song', 0),
(6250, 44, 5154, 'song', 0),
(6251, 44, 363, 'album', 0),
(6252, 44, 99, 'artist', 0),
(6253, 44, 5155, 'song', 0),
(6254, 44, 5156, 'song', 0),
(6255, 44, 5157, 'song', 0),
(6256, 44, 5158, 'song', 0),
(6257, 44, 5159, 'song', 0),
(6258, 44, 5160, 'song', 0),
(6259, 44, 5161, 'song', 0),
(6260, 44, 5162, 'song', 0),
(6261, 44, 5163, 'song', 0),
(6262, 44, 5164, 'song', 0),
(6263, 44, 5165, 'song', 0),
(6264, 45, 5166, 'song', 0),
(6265, 45, 364, 'album', 0),
(6266, 45, 99, 'artist', 0),
(6267, 45, 5167, 'song', 0),
(6268, 45, 5168, 'song', 0),
(6269, 45, 5169, 'song', 0),
(6270, 45, 5170, 'song', 0),
(6271, 45, 5171, 'song', 0),
(6272, 45, 5172, 'song', 0),
(6273, 45, 5173, 'song', 0),
(6274, 45, 5174, 'song', 0),
(6275, 45, 5175, 'song', 0),
(6276, 45, 5176, 'song', 0),
(6277, 45, 5177, 'song', 0),
(6278, 45, 5178, 'song', 0),
(6279, 45, 5179, 'song', 0),
(6280, 45, 5180, 'song', 0),
(6281, 46, 5181, 'song', 0),
(6282, 46, 365, 'album', 0),
(6283, 46, 99, 'artist', 0),
(6284, 46, 5182, 'song', 0),
(6285, 46, 5183, 'song', 0),
(6286, 46, 5184, 'song', 0),
(6287, 46, 5185, 'song', 0),
(6288, 46, 5186, 'song', 0),
(6289, 46, 5187, 'song', 0),
(6290, 46, 5188, 'song', 0),
(6291, 46, 5189, 'song', 0),
(6292, 46, 5190, 'song', 0),
(6293, 46, 5191, 'song', 0),
(6294, 46, 5192, 'song', 0),
(6295, 45, 5193, 'song', 0),
(6296, 45, 366, 'album', 0),
(6297, 45, 5194, 'song', 0),
(6298, 45, 5195, 'song', 0),
(6299, 45, 5196, 'song', 0),
(6300, 45, 5197, 'song', 0),
(6301, 45, 5198, 'song', 0),
(6302, 45, 5199, 'song', 0),
(6303, 45, 5200, 'song', 0),
(6304, 45, 5201, 'song', 0),
(6305, 45, 5202, 'song', 0),
(6306, 45, 5203, 'song', 0),
(6307, 45, 5204, 'song', 0),
(6308, 45, 5205, 'song', 0),
(6309, 45, 5206, 'song', 0),
(6310, 44, 5207, 'song', 0),
(6311, 44, 367, 'album', 0),
(6312, 44, 5208, 'song', 0),
(6313, 44, 5209, 'song', 0),
(6314, 44, 5210, 'song', 0),
(6315, 44, 5211, 'song', 0),
(6316, 44, 5212, 'song', 0),
(6317, 44, 5213, 'song', 0),
(6319, 47, 368, 'album', 0),
(6320, 47, 100, 'artist', 0),
(6321, 44, 5215, 'song', 0),
(6322, 44, 5216, 'song', 0),
(6324, 44, 5218, 'song', 0),
(6325, 44, 5219, 'song', 0),
(6327, 44, 5221, 'song', 0),
(6328, 48, 5222, 'song', 0),
(6329, 48, 369, 'album', 0),
(6330, 48, 101, 'artist', 0),
(6331, 47, 5222, 'song', 0),
(6332, 47, 369, 'album', 0),
(6333, 47, 101, 'artist', 0),
(6334, 48, 5223, 'song', 0),
(6335, 47, 5223, 'song', 0),
(6337, 48, 5225, 'song', 0),
(6338, 47, 5225, 'song', 0),
(6340, 48, 5227, 'song', 0),
(6341, 47, 5227, 'song', 0),
(6342, 48, 5228, 'song', 0),
(6343, 47, 5228, 'song', 0),
(6344, 48, 5229, 'song', 0),
(6345, 47, 5229, 'song', 0),
(6346, 48, 5230, 'song', 0),
(6347, 47, 5230, 'song', 0),
(6349, 48, 5232, 'song', 0),
(6350, 47, 5232, 'song', 0),
(6351, 48, 5233, 'song', 0),
(6352, 47, 5233, 'song', 0),
(6353, 48, 5234, 'song', 0),
(6354, 47, 5234, 'song', 0),
(6356, 48, 5236, 'song', 0),
(6357, 47, 5236, 'song', 0),
(6358, 48, 5237, 'song', 0),
(6359, 47, 5237, 'song', 0),
(6361, 48, 5239, 'song', 0),
(6362, 47, 5239, 'song', 0),
(6363, 49, 5240, 'song', 0),
(6364, 49, 370, 'album', 0),
(6365, 49, 101, 'artist', 0),
(6366, 49, 5242, 'song', 0),
(6368, 49, 5243, 'song', 0),
(6369, 49, 5244, 'song', 0),
(6371, 49, 5246, 'song', 0),
(6372, 49, 5247, 'song', 0),
(6373, 49, 5248, 'song', 0),
(6375, 47, 371, 'album', 0),
(6376, 49, 5250, 'song', 0),
(6377, 49, 5251, 'song', 0),
(6379, 49, 5253, 'song', 0),
(6381, 49, 5255, 'song', 0),
(6383, 49, 5257, 'song', 0),
(6385, 49, 5259, 'song', 0),
(6386, 49, 5260, 'song', 0),
(6389, 49, 5263, 'song', 0),
(6390, 49, 372, 'album', 0),
(6392, 49, 5265, 'song', 0),
(6393, 49, 5266, 'song', 0),
(6395, 47, 373, 'album', 0),
(6396, 49, 5268, 'song', 0),
(6398, 49, 5270, 'song', 0),
(6399, 49, 5271, 'song', 0),
(6401, 49, 5273, 'song', 0),
(6403, 49, 5275, 'song', 0),
(6405, 49, 5277, 'song', 0),
(6407, 49, 5279, 'song', 0),
(6409, 49, 5281, 'song', 0),
(6411, 49, 5283, 'song', 0),
(6413, 49, 5285, 'song', 0),
(6416, 45, 5289, 'song', 0),
(6417, 45, 376, 'album', 0),
(6418, 45, 102, 'artist', 0),
(6419, 13, 5289, 'song', 0),
(6420, 47, 375, 'album', 0),
(6421, 13, 376, 'album', 0),
(6422, 13, 102, 'artist', 0),
(6423, 45, 5290, 'song', 0),
(6424, 45, 377, 'album', 0),
(6428, 45, 5297, 'song', 0),
(6429, 13, 5297, 'song', 0),
(6431, 50, 5300, 'song', 0),
(6432, 50, 376, 'album', 0),
(6433, 50, 102, 'artist', 0),
(6435, 45, 5302, 'song', 0),
(6438, 45, 5305, 'song', 0),
(6440, 45, 5307, 'song', 0),
(6442, 47, 378, 'album', 0),
(6452, 51, 5329, 'song', 0),
(6453, 51, 380, 'album', 0),
(6454, 51, 102, 'artist', 0),
(6456, 47, 381, 'album', 0),
(6458, 45, 5333, 'song', 0),
(6460, 45, 382, 'album', 0),
(6462, 52, 5336, 'song', 0),
(6464, 52, 382, 'album', 0),
(6466, 52, 102, 'artist', 0),
(6470, 45, 5347, 'song', 0),
(6471, 45, 383, 'album', 0),
(6473, 45, 5349, 'song', 0),
(6474, 52, 5350, 'song', 0),
(6475, 52, 384, 'album', 0),
(6477, 47, 385, 'album', 0),
(6480, 52, 5356, 'song', 0),
(6483, 52, 5361, 'song', 0),
(6485, 52, 5363, 'song', 0),
(6487, 52, 5365, 'song', 0),
(6489, 52, 5367, 'song', 0),
(6491, 52, 5369, 'song', 0),
(6492, 45, 5370, 'song', 0),
(6493, 45, 384, 'album', 0),
(6494, 53, 5371, 'song', 0),
(6495, 53, 384, 'album', 0),
(6496, 53, 102, 'artist', 0),
(6497, 52, 5373, 'song', 0),
(6498, 45, 5374, 'song', 0),
(6499, 45, 5375, 'song', 0),
(6500, 54, 5376, 'song', 0),
(6501, 54, 387, 'album', 0),
(6502, 54, 102, 'artist', 0),
(6503, 55, 5376, 'song', 0),
(6504, 55, 387, 'album', 0),
(6505, 55, 102, 'artist', 0),
(6506, 52, 5378, 'song', 0),
(6507, 52, 387, 'album', 0),
(6508, 52, 5379, 'song', 0),
(6509, 52, 5380, 'song', 0),
(6510, 45, 5381, 'song', 0),
(6511, 45, 388, 'album', 0),
(6512, 50, 5382, 'song', 0),
(6513, 50, 387, 'album', 0),
(6514, 55, 5384, 'song', 0),
(6515, 56, 5385, 'song', 0),
(6516, 56, 374, 'album', 0),
(6517, 56, 102, 'artist', 0),
(6518, 54, 5386, 'song', 0),
(6519, 45, 5387, 'song', 0),
(6520, 45, 389, 'album', 0),
(6521, 45, 5388, 'song', 0),
(6522, 57, 5391, 'song', 0),
(6523, 57, 389, 'album', 0),
(6524, 57, 102, 'artist', 0),
(6525, 50, 5392, 'song', 0),
(6526, 50, 389, 'album', 0),
(6527, 57, 5393, 'song', 0),
(6528, 54, 5394, 'song', 0),
(6529, 54, 389, 'album', 0),
(6530, 58, 5395, 'song', 0),
(6531, 58, 374, 'album', 0),
(6532, 58, 102, 'artist', 0),
(6533, 45, 5397, 'song', 0),
(6534, 45, 390, 'album', 0),
(6535, 45, 5398, 'song', 0),
(6536, 45, 5399, 'song', 0),
(6537, 45, 5400, 'song', 0),
(6538, 13, 5400, 'song', 0),
(6539, 13, 390, 'album', 0),
(6540, 50, 5401, 'song', 0),
(6541, 50, 374, 'album', 0),
(6542, 45, 5402, 'song', 0),
(6543, 45, 5403, 'song', 0),
(6544, 45, 374, 'album', 0),
(6545, 50, 5404, 'song', 0),
(6546, 50, 390, 'album', 0),
(6547, 45, 5405, 'song', 0),
(6548, 59, 5407, 'song', 0),
(6549, 59, 391, 'album', 0),
(6550, 59, 102, 'artist', 0),
(6551, 59, 5408, 'song', 0),
(6552, 59, 5409, 'song', 0),
(6553, 59, 5410, 'song', 0),
(6554, 59, 5411, 'song', 0),
(6555, 59, 5412, 'song', 0),
(6556, 59, 5413, 'song', 0),
(6557, 59, 5414, 'song', 0),
(6558, 59, 5415, 'song', 0),
(6559, 59, 5416, 'song', 0),
(6560, 59, 392, 'album', 0),
(6561, 59, 5417, 'song', 0),
(6562, 59, 5418, 'song', 0),
(6563, 59, 5419, 'song', 0),
(6564, 59, 5420, 'song', 0),
(6565, 59, 5421, 'song', 0),
(6566, 59, 5422, 'song', 0),
(6567, 59, 5423, 'song', 0),
(6568, 59, 5424, 'song', 0),
(6569, 60, 5425, 'song', 0),
(6570, 60, 393, 'album', 0),
(6571, 60, 102, 'artist', 0),
(6572, 50, 5427, 'song', 0),
(6573, 50, 393, 'album', 0),
(6574, 50, 5428, 'song', 0),
(6575, 60, 5429, 'song', 0),
(6576, 13, 5430, 'song', 0),
(6577, 13, 393, 'album', 0),
(6578, 45, 5431, 'song', 0),
(6579, 45, 393, 'album', 0),
(6580, 45, 5432, 'song', 0),
(6581, 45, 394, 'album', 0),
(6582, 13, 5432, 'song', 0),
(6583, 13, 394, 'album', 0),
(6584, 60, 5433, 'song', 0),
(6585, 45, 5434, 'song', 0),
(6586, 45, 5435, 'song', 0),
(6587, 60, 5436, 'song', 0),
(6588, 45, 5437, 'song', 0),
(6589, 56, 5438, 'song', 0),
(6590, 56, 393, 'album', 0),
(6591, 61, 5439, 'song', 0),
(6592, 61, 395, 'album', 0),
(6593, 61, 102, 'artist', 0),
(6594, 45, 5440, 'song', 0),
(6595, 45, 395, 'album', 0),
(6596, 45, 5441, 'song', 0),
(6597, 45, 5443, 'song', 0),
(6598, 59, 5444, 'song', 0),
(6599, 59, 395, 'album', 0),
(6600, 45, 5445, 'song', 0),
(6601, 54, 5446, 'song', 0),
(6602, 54, 395, 'album', 0),
(6603, 45, 5447, 'song', 0),
(6604, 45, 5448, 'song', 0),
(6605, 45, 396, 'album', 0),
(6606, 45, 5449, 'song', 0),
(6607, 45, 5450, 'song', 0),
(6608, 45, 5451, 'song', 0),
(6609, 45, 5452, 'song', 0),
(6610, 45, 5453, 'song', 0),
(6611, 45, 5454, 'song', 0),
(6612, 45, 5455, 'song', 0),
(6613, 45, 5456, 'song', 0),
(6614, 45, 5457, 'song', 0),
(6615, 45, 5473, 'song', 0),
(6616, 45, 397, 'album', 0),
(6617, 50, 5474, 'song', 0),
(6618, 50, 397, 'album', 0),
(6619, 45, 5475, 'song', 0),
(6620, 45, 5476, 'song', 0),
(6621, 45, 5477, 'song', 0),
(6622, 45, 5478, 'song', 0),
(6623, 45, 105, 'artist', 0),
(6624, 13, 5478, 'song', 0),
(6625, 13, 397, 'album', 0),
(6626, 13, 105, 'artist', 0),
(6627, 45, 5479, 'song', 0),
(6628, 45, 5480, 'song', 0),
(6629, 45, 5481, 'song', 0),
(6630, 45, 5482, 'song', 0),
(6631, 45, 5483, 'song', 0),
(6632, 45, 5484, 'song', 0),
(6633, 45, 398, 'album', 0),
(6634, 45, 5485, 'song', 0),
(6635, 45, 5486, 'song', 0),
(6636, 45, 5487, 'song', 0),
(6637, 59, 5488, 'song', 0),
(6638, 59, 399, 'album', 0),
(6639, 45, 5489, 'song', 0),
(6640, 45, 399, 'album', 0),
(6641, 45, 5491, 'song', 0),
(6642, 45, 5493, 'song', 0),
(6643, 45, 5494, 'song', 0),
(6644, 45, 400, 'album', 0),
(6645, 59, 5495, 'song', 0),
(6646, 59, 400, 'album', 0),
(6647, 45, 5496, 'song', 0),
(6648, 45, 5498, 'song', 0),
(6649, 45, 401, 'album', 0),
(6650, 45, 5499, 'song', 0),
(6651, 45, 402, 'album', 0),
(6652, 45, 5501, 'song', 0),
(6653, 45, 5502, 'song', 0),
(6654, 45, 403, 'album', 0),
(6655, 45, 5503, 'song', 0),
(6656, 45, 5504, 'song', 0),
(6657, 45, 404, 'album', 0),
(6658, 45, 5505, 'song', 0),
(6659, 59, 5509, 'song', 0),
(6660, 59, 404, 'album', 0),
(6661, 45, 5511, 'song', 0),
(6662, 45, 5512, 'song', 0),
(6663, 59, 5513, 'song', 0),
(6664, 59, 405, 'album', 0),
(6665, 59, 5514, 'song', 0),
(6666, 59, 5515, 'song', 0),
(6667, 59, 5516, 'song', 0),
(6668, 59, 5517, 'song', 0),
(6669, 59, 5518, 'song', 0),
(6670, 59, 5519, 'song', 0),
(6671, 59, 5520, 'song', 0),
(6672, 59, 5521, 'song', 0),
(6673, 59, 5522, 'song', 0),
(6674, 59, 5523, 'song', 0),
(6675, 59, 5524, 'song', 0),
(6676, 59, 5525, 'song', 0),
(6677, 59, 5526, 'song', 0),
(6678, 59, 406, 'album', 0),
(6679, 59, 5527, 'song', 0),
(6680, 59, 5528, 'song', 0),
(6681, 59, 5529, 'song', 0),
(6682, 59, 5530, 'song', 0),
(6683, 59, 5531, 'song', 0),
(6684, 59, 5532, 'song', 0),
(6685, 59, 5533, 'song', 0),
(6686, 59, 5534, 'song', 0),
(6687, 59, 5535, 'song', 0),
(6688, 59, 5536, 'song', 0),
(6689, 59, 5537, 'song', 0),
(6690, 59, 5538, 'song', 0),
(6691, 59, 5539, 'song', 0),
(6692, 59, 5540, 'song', 0),
(6693, 59, 5541, 'song', 0),
(6694, 59, 5542, 'song', 0),
(6695, 59, 5543, 'song', 0),
(6696, 45, 5544, 'song', 0),
(6697, 45, 407, 'album', 0),
(6698, 45, 5546, 'song', 0),
(6699, 59, 5547, 'song', 0),
(6700, 59, 407, 'album', 0),
(6701, 54, 5548, 'song', 0),
(6702, 54, 407, 'album', 0),
(6703, 56, 5550, 'song', 0),
(6704, 56, 408, 'album', 0),
(6705, 56, 5551, 'song', 0),
(6706, 62, 5553, 'song', 0),
(6707, 62, 407, 'album', 0),
(6708, 62, 102, 'artist', 0),
(6709, 45, 5554, 'song', 0),
(6710, 45, 409, 'album', 0),
(6711, 54, 5556, 'song', 0),
(6712, 54, 409, 'album', 0),
(6713, 50, 5558, 'song', 0),
(6714, 50, 409, 'album', 0),
(6715, 59, 5559, 'song', 0),
(6716, 59, 409, 'album', 0),
(6717, 13, 5560, 'song', 0),
(6718, 13, 409, 'album', 0),
(6719, 13, 5561, 'song', 0),
(6720, 45, 5562, 'song', 0),
(6721, 59, 5563, 'song', 0),
(6722, 45, 5564, 'song', 0),
(6723, 45, 410, 'album', 0),
(6724, 45, 5565, 'song', 0),
(6725, 45, 5566, 'song', 0),
(6726, 54, 5567, 'song', 0),
(6727, 54, 410, 'album', 0),
(6728, 56, 5569, 'song', 0),
(6729, 56, 411, 'album', 0),
(6730, 54, 5570, 'song', 0),
(6731, 45, 5571, 'song', 0),
(6732, 45, 412, 'album', 0),
(6733, 50, 5572, 'song', 0),
(6734, 50, 412, 'album', 0),
(6735, 63, 5573, 'song', 0),
(6736, 63, 374, 'album', 0),
(6737, 63, 102, 'artist', 0),
(6738, 59, 5574, 'song', 0),
(6739, 59, 413, 'album', 0),
(6740, 59, 5575, 'song', 0),
(6741, 59, 5576, 'song', 0),
(6742, 59, 5577, 'song', 0),
(6743, 59, 5578, 'song', 0),
(6744, 59, 5579, 'song', 0),
(6745, 59, 5580, 'song', 0),
(6746, 59, 5581, 'song', 0),
(6747, 59, 5582, 'song', 0),
(6748, 59, 5583, 'song', 0),
(6749, 59, 5584, 'song', 0),
(6750, 59, 5585, 'song', 0),
(6751, 59, 5586, 'song', 0),
(6752, 59, 5587, 'song', 0),
(6753, 59, 5588, 'song', 0),
(6754, 59, 5589, 'song', 0),
(6755, 59, 5590, 'song', 0),
(6756, 59, 5591, 'song', 0),
(6757, 59, 5592, 'song', 0),
(6758, 45, 5593, 'song', 0),
(6759, 45, 414, 'album', 0),
(6760, 13, 5593, 'song', 0),
(6761, 13, 414, 'album', 0),
(6762, 45, 5594, 'song', 0),
(6763, 13, 5594, 'song', 0),
(6764, 45, 5595, 'song', 0),
(6765, 13, 5595, 'song', 0),
(6766, 45, 5596, 'song', 0),
(6767, 13, 5596, 'song', 0),
(6768, 43, 5597, 'song', 0),
(6769, 43, 414, 'album', 0),
(6770, 43, 102, 'artist', 0),
(6771, 45, 5598, 'song', 0),
(6772, 54, 5599, 'song', 0),
(6773, 54, 414, 'album', 0),
(6774, 55, 5599, 'song', 0),
(6775, 55, 414, 'album', 0),
(6776, 45, 5600, 'song', 0),
(6777, 45, 5601, 'song', 0),
(6778, 50, 5602, 'song', 0),
(6779, 50, 415, 'album', 0),
(6780, 50, 5603, 'song', 0),
(6781, 45, 5606, 'song', 0),
(6782, 45, 416, 'album', 0),
(6783, 13, 5607, 'song', 0),
(6784, 13, 417, 'album', 0),
(6785, 45, 5610, 'song', 0),
(6786, 50, 5611, 'song', 0),
(6787, 45, 5612, 'song', 0),
(6788, 45, 418, 'album', 0),
(6789, 45, 106, 'artist', 0),
(6790, 45, 5613, 'song', 0),
(6791, 45, 5614, 'song', 0),
(6792, 45, 5615, 'song', 0),
(6793, 45, 5616, 'song', 0),
(6794, 45, 5617, 'song', 0),
(6795, 45, 5618, 'song', 0),
(6796, 45, 5619, 'song', 0),
(6797, 45, 5620, 'song', 0),
(6798, 45, 419, 'album', 0),
(6799, 45, 5621, 'song', 0),
(6800, 45, 5622, 'song', 0),
(6801, 45, 5623, 'song', 0),
(6802, 45, 5624, 'song', 0),
(6803, 45, 5625, 'song', 0),
(6804, 45, 5626, 'song', 0),
(6805, 45, 5627, 'song', 0),
(6806, 45, 5628, 'song', 0),
(6807, 45, 420, 'album', 0),
(6808, 45, 5629, 'song', 0),
(6809, 45, 5630, 'song', 0),
(6810, 45, 5631, 'song', 0),
(6811, 45, 5632, 'song', 0),
(6812, 45, 5633, 'song', 0),
(6813, 45, 5634, 'song', 0),
(6814, 45, 5635, 'song', 0),
(6815, 45, 421, 'album', 0),
(6816, 45, 5636, 'song', 0),
(6817, 45, 5637, 'song', 0),
(6818, 45, 5638, 'song', 0),
(6819, 45, 5639, 'song', 0),
(6820, 45, 5640, 'song', 0),
(6821, 45, 5641, 'song', 0),
(6822, 45, 5642, 'song', 0),
(6823, 45, 5643, 'song', 0),
(6824, 45, 5644, 'song', 0),
(6825, 45, 5645, 'song', 0),
(6826, 45, 422, 'album', 0),
(6827, 45, 5646, 'song', 0),
(6828, 45, 5647, 'song', 0),
(6829, 45, 5648, 'song', 0),
(6830, 45, 5649, 'song', 0),
(6831, 45, 5650, 'song', 0),
(6832, 48, 5651, 'song', 0),
(6833, 48, 423, 'album', 0),
(6834, 48, 106, 'artist', 0),
(6835, 45, 5652, 'song', 0),
(6836, 45, 5653, 'song', 0),
(6837, 45, 5654, 'song', 0),
(6838, 45, 424, 'album', 0),
(6839, 45, 5655, 'song', 0),
(6840, 45, 5656, 'song', 0),
(6841, 45, 5657, 'song', 0),
(6842, 45, 5658, 'song', 0),
(6843, 45, 5659, 'song', 0),
(6844, 45, 5660, 'song', 0),
(6845, 45, 5661, 'song', 0),
(6846, 45, 425, 'album', 0),
(6847, 45, 107, 'artist', 0),
(6848, 45, 5662, 'song', 0),
(6849, 45, 5663, 'song', 0),
(6850, 45, 5664, 'song', 0),
(6851, 45, 5665, 'song', 0),
(6852, 45, 5666, 'song', 0),
(6853, 45, 5667, 'song', 0),
(6854, 45, 5668, 'song', 0),
(6855, 45, 5669, 'song', 0),
(6856, 45, 5670, 'song', 0),
(6857, 45, 5671, 'song', 0),
(6858, 45, 5672, 'song', 0),
(6859, 54, 5673, 'song', 0),
(6860, 54, 426, 'album', 0),
(6861, 54, 107, 'artist', 0),
(6862, 54, 5675, 'song', 0),
(6863, 45, 5676, 'song', 0),
(6864, 45, 427, 'album', 0),
(6865, 54, 5677, 'song', 0),
(6866, 45, 5678, 'song', 0),
(6867, 54, 5679, 'song', 0),
(6868, 45, 5681, 'song', 0),
(6869, 54, 5683, 'song', 0),
(6870, 54, 5684, 'song', 0),
(6871, 54, 5686, 'song', 0),
(6872, 54, 5687, 'song', 0),
(6873, 54, 5688, 'song', 0),
(6874, 49, 5689, 'song', 0),
(6875, 49, 428, 'album', 0),
(6876, 49, 107, 'artist', 0),
(6877, 49, 5690, 'song', 0),
(6878, 49, 5691, 'song', 0),
(6879, 49, 5692, 'song', 0),
(6880, 49, 5693, 'song', 0),
(6881, 49, 5694, 'song', 0),
(6882, 49, 5695, 'song', 0),
(6883, 49, 5696, 'song', 0),
(6884, 49, 5697, 'song', 0),
(6885, 49, 5698, 'song', 0),
(6886, 49, 5699, 'song', 0),
(6887, 49, 5700, 'song', 0),
(6888, 49, 5701, 'song', 0),
(6889, 49, 5702, 'song', 0),
(6890, 49, 429, 'album', 0),
(6891, 49, 5703, 'song', 0),
(6892, 49, 5704, 'song', 0),
(6893, 49, 5705, 'song', 0),
(6894, 49, 5706, 'song', 0),
(6895, 49, 5707, 'song', 0),
(6896, 49, 5708, 'song', 0),
(6897, 49, 5709, 'song', 0),
(6898, 49, 5710, 'song', 0),
(6899, 49, 5711, 'song', 0),
(6900, 49, 5712, 'song', 0),
(6901, 64, 5713, 'song', 0),
(6902, 64, 430, 'album', 0),
(6903, 64, 107, 'artist', 0),
(6904, 64, 5714, 'song', 0),
(6905, 64, 5715, 'song', 0),
(6906, 64, 5716, 'song', 0),
(6907, 64, 5717, 'song', 0),
(6908, 64, 5718, 'song', 0),
(6909, 64, 5719, 'song', 0),
(6910, 64, 5720, 'song', 0),
(6911, 64, 5721, 'song', 0),
(6912, 64, 5722, 'song', 0),
(6913, 64, 5723, 'song', 0),
(6914, 64, 5724, 'song', 0),
(6915, 64, 5725, 'song', 0),
(6916, 64, 5726, 'song', 0),
(6917, 65, 5727, 'song', 0),
(6918, 65, 431, 'album', 0),
(6919, 65, 108, 'artist', 0),
(6920, 65, 5728, 'song', 0),
(6921, 65, 5729, 'song', 0),
(6922, 65, 5730, 'song', 0),
(6923, 65, 5731, 'song', 0),
(6924, 65, 5732, 'song', 0),
(6925, 65, 5733, 'song', 0),
(6926, 65, 5734, 'song', 0),
(6927, 65, 5735, 'song', 0),
(6928, 65, 5736, 'song', 0),
(6929, 65, 5737, 'song', 0),
(6930, 66, 5738, 'song', 0),
(6931, 66, 432, 'album', 0),
(6932, 66, 108, 'artist', 0),
(6933, 66, 5739, 'song', 0),
(6934, 66, 5740, 'song', 0),
(6935, 66, 5741, 'song', 0),
(6936, 66, 5742, 'song', 0),
(6937, 66, 5743, 'song', 0),
(6938, 66, 5744, 'song', 0),
(6939, 66, 5745, 'song', 0),
(6940, 66, 5746, 'song', 0),
(6941, 66, 5747, 'song', 0),
(6942, 66, 5748, 'song', 0),
(6943, 66, 5749, 'song', 0),
(6944, 66, 5750, 'song', 0),
(6945, 66, 5751, 'song', 0),
(6946, 66, 433, 'album', 0),
(6947, 66, 5752, 'song', 0),
(6948, 66, 5753, 'song', 0),
(6949, 66, 5754, 'song', 0),
(6950, 66, 5755, 'song', 0),
(6951, 66, 5756, 'song', 0),
(6952, 66, 5757, 'song', 0),
(6953, 66, 5758, 'song', 0),
(6954, 66, 5759, 'song', 0),
(6955, 66, 5760, 'song', 0),
(6956, 66, 5761, 'song', 0),
(6957, 66, 434, 'album', 0),
(6958, 66, 5762, 'song', 0),
(6959, 66, 5763, 'song', 0),
(6960, 66, 5764, 'song', 0),
(6961, 66, 5765, 'song', 0),
(6962, 67, 5766, 'song', 0),
(6963, 67, 435, 'album', 0),
(6964, 67, 109, 'artist', 0),
(6965, 67, 5767, 'song', 0),
(6966, 67, 5768, 'song', 0),
(6967, 68, 5769, 'song', 0),
(6968, 68, 436, 'album', 0),
(6969, 68, 110, 'artist', 0),
(6970, 67, 5770, 'song', 0),
(6971, 67, 5771, 'song', 0),
(6972, 68, 5772, 'song', 0),
(6973, 67, 5773, 'song', 0),
(6974, 68, 5774, 'song', 0),
(6975, 67, 5775, 'song', 0),
(6976, 67, 5776, 'song', 0),
(6977, 67, 5777, 'song', 0),
(6978, 67, 5778, 'song', 0),
(6979, 67, 5779, 'song', 0),
(6980, 69, 5780, 'song', 0),
(6981, 69, 437, 'album', 0),
(6982, 69, 109, 'artist', 0),
(6983, 69, 5781, 'song', 0),
(6984, 69, 5782, 'song', 0),
(6985, 69, 5783, 'song', 0),
(6986, 69, 5784, 'song', 0),
(6987, 69, 5785, 'song', 0),
(6988, 69, 5786, 'song', 0),
(6989, 69, 5787, 'song', 0),
(6990, 69, 5788, 'song', 0),
(6991, 69, 5789, 'song', 0),
(6992, 69, 5790, 'song', 0),
(6993, 67, 5791, 'song', 0),
(6994, 67, 438, 'album', 0),
(6995, 67, 111, 'artist', 0),
(6996, 67, 5792, 'song', 0),
(6997, 67, 112, 'artist', 0),
(6998, 67, 5793, 'song', 0),
(6999, 67, 113, 'artist', 0),
(7000, 67, 5794, 'song', 0),
(7001, 67, 114, 'artist', 0),
(7002, 67, 5795, 'song', 0),
(7003, 67, 115, 'artist', 0),
(7004, 67, 5796, 'song', 0),
(7005, 67, 116, 'artist', 0),
(7006, 67, 5797, 'song', 0),
(7007, 67, 117, 'artist', 0),
(7008, 67, 5798, 'song', 0),
(7009, 67, 118, 'artist', 0),
(7010, 67, 5799, 'song', 0),
(7011, 67, 119, 'artist', 0),
(7012, 67, 5800, 'song', 0),
(7013, 67, 120, 'artist', 0),
(7014, 67, 5801, 'song', 0),
(7015, 67, 121, 'artist', 0),
(7016, 67, 5802, 'song', 0),
(7017, 67, 122, 'artist', 0),
(7018, 67, 5803, 'song', 0),
(7019, 67, 123, 'artist', 0),
(7020, 67, 5804, 'song', 0),
(7021, 67, 124, 'artist', 0),
(7022, 67, 5805, 'song', 0),
(7023, 67, 125, 'artist', 0),
(7024, 67, 5806, 'song', 0),
(7025, 64, 5807, 'song', 0),
(7026, 64, 439, 'album', 0),
(7027, 64, 126, 'artist', 0),
(7028, 64, 5808, 'song', 0),
(7029, 64, 5809, 'song', 0),
(7030, 64, 5810, 'song', 0),
(7031, 64, 5811, 'song', 0),
(7032, 64, 5812, 'song', 0),
(7033, 69, 5813, 'song', 0),
(7034, 69, 440, 'album', 0),
(7035, 69, 5814, 'song', 0),
(7036, 69, 5815, 'song', 0),
(7037, 69, 5816, 'song', 0),
(7038, 69, 5817, 'song', 0),
(7039, 69, 5818, 'song', 0),
(7040, 69, 5819, 'song', 0),
(7041, 69, 5820, 'song', 0),
(7042, 69, 5821, 'song', 0),
(7043, 69, 5822, 'song', 0),
(7044, 69, 5823, 'song', 0),
(7045, 69, 5824, 'song', 0),
(7046, 69, 5825, 'song', 0),
(7047, 69, 5826, 'song', 0),
(7048, 69, 5827, 'song', 0),
(7049, 69, 5828, 'song', 0),
(7050, 69, 5829, 'song', 0),
(7051, 67, 5830, 'song', 0),
(7052, 67, 441, 'album', 0),
(7053, 67, 5831, 'song', 0),
(7054, 67, 5832, 'song', 0),
(7055, 67, 5833, 'song', 0),
(7056, 67, 5834, 'song', 0),
(7057, 67, 5835, 'song', 0),
(7058, 67, 5836, 'song', 0),
(7059, 67, 5837, 'song', 0),
(7060, 69, 5838, 'song', 0),
(7061, 69, 442, 'album', 0),
(7062, 69, 126, 'artist', 0),
(7063, 69, 5839, 'song', 0),
(7064, 69, 5840, 'song', 0),
(7065, 69, 5841, 'song', 0),
(7066, 69, 5842, 'song', 0),
(7067, 69, 5843, 'song', 0),
(7068, 69, 5844, 'song', 0),
(7069, 69, 5845, 'song', 0),
(7070, 69, 5846, 'song', 0),
(7071, 69, 5847, 'song', 0),
(7072, 69, 5848, 'song', 0),
(7073, 69, 5849, 'song', 0),
(7074, 69, 5850, 'song', 0),
(7075, 69, 5851, 'song', 0),
(7076, 69, 5852, 'song', 0),
(7077, 69, 443, 'album', 0),
(7078, 67, 5853, 'song', 0),
(7079, 67, 443, 'album', 0),
(7080, 67, 5854, 'song', 0),
(7081, 67, 5855, 'song', 0),
(7082, 67, 5856, 'song', 0),
(7083, 67, 5857, 'song', 0),
(7084, 67, 5858, 'song', 0),
(7085, 67, 5859, 'song', 0),
(7086, 67, 5860, 'song', 0),
(7087, 67, 5861, 'song', 0),
(7088, 67, 5862, 'song', 0),
(7089, 67, 5863, 'song', 0),
(7090, 67, 5864, 'song', 0),
(7091, 67, 5865, 'song', 0),
(7092, 67, 5866, 'song', 0),
(7093, 67, 5867, 'song', 0),
(7094, 67, 444, 'album', 0),
(7095, 67, 126, 'artist', 0),
(7096, 67, 5868, 'song', 0),
(7097, 67, 5869, 'song', 0),
(7098, 67, 5870, 'song', 0),
(7099, 67, 5871, 'song', 0),
(7100, 67, 5872, 'song', 0),
(7101, 67, 5873, 'song', 0),
(7102, 67, 5874, 'song', 0),
(7103, 67, 5875, 'song', 0),
(7104, 67, 5876, 'song', 0),
(7105, 67, 5877, 'song', 0),
(7106, 67, 5878, 'song', 0),
(7107, 67, 5879, 'song', 0),
(7108, 67, 5880, 'song', 0),
(7109, 67, 5881, 'song', 0),
(7110, 69, 5882, 'song', 0),
(7111, 69, 445, 'album', 0),
(7112, 69, 127, 'artist', 0),
(7113, 69, 5883, 'song', 0),
(7114, 69, 5884, 'song', 0),
(7115, 69, 5885, 'song', 0),
(7116, 69, 5886, 'song', 0),
(7117, 69, 5887, 'song', 0),
(7118, 69, 5888, 'song', 0),
(7119, 69, 5889, 'song', 0),
(7120, 69, 5890, 'song', 0),
(7121, 69, 5891, 'song', 0),
(7122, 69, 5892, 'song', 0),
(7123, 69, 5893, 'song', 0),
(7124, 69, 5894, 'song', 0),
(7125, 69, 5895, 'song', 0),
(7126, 69, 5896, 'song', 0),
(7127, 69, 446, 'album', 0),
(7128, 69, 5897, 'song', 0),
(7129, 69, 5898, 'song', 0),
(7130, 69, 5899, 'song', 0),
(7131, 69, 5900, 'song', 0),
(7132, 69, 5901, 'song', 0),
(7133, 69, 5902, 'song', 0),
(7134, 69, 5903, 'song', 0),
(7135, 69, 5904, 'song', 0),
(7136, 69, 5905, 'song', 0),
(7137, 69, 5906, 'song', 0),
(7138, 69, 5907, 'song', 0),
(7139, 45, 5908, 'song', 0),
(7140, 45, 447, 'album', 0),
(7141, 45, 129, 'artist', 0),
(7142, 45, 5909, 'song', 0),
(7143, 45, 5910, 'song', 0),
(7144, 45, 5911, 'song', 0),
(7145, 45, 5912, 'song', 0),
(7146, 45, 5913, 'song', 0),
(7147, 45, 5914, 'song', 0),
(7148, 45, 5915, 'song', 0),
(7149, 45, 5916, 'song', 0),
(7150, 45, 5917, 'song', 0),
(7151, 45, 5918, 'song', 0),
(7152, 45, 5919, 'song', 0),
(7153, 45, 5920, 'song', 0),
(7154, 45, 5921, 'song', 0),
(7155, 45, 5922, 'song', 0),
(7156, 45, 5923, 'song', 0),
(7157, 45, 5924, 'song', 0),
(7158, 45, 448, 'album', 0),
(7159, 45, 5925, 'song', 0),
(7160, 45, 5926, 'song', 0),
(7161, 45, 5927, 'song', 0),
(7162, 45, 5928, 'song', 0),
(7163, 45, 5929, 'song', 0),
(7164, 45, 5930, 'song', 0),
(7165, 45, 449, 'album', 0),
(7166, 45, 5931, 'song', 0),
(7167, 45, 5932, 'song', 0),
(7168, 45, 5933, 'song', 0),
(7169, 45, 5934, 'song', 0),
(7170, 45, 5935, 'song', 0),
(7171, 45, 5936, 'song', 0),
(7172, 70, 5937, 'song', 0),
(7173, 70, 450, 'album', 0),
(7174, 70, 129, 'artist', 0),
(7175, 45, 5937, 'song', 0),
(7176, 45, 450, 'album', 0),
(7177, 70, 5938, 'song', 0),
(7178, 45, 5938, 'song', 0),
(7179, 70, 5939, 'song', 0),
(7180, 45, 5939, 'song', 0),
(7181, 70, 5940, 'song', 0),
(7182, 45, 5940, 'song', 0),
(7183, 70, 5941, 'song', 0),
(7184, 45, 5941, 'song', 0),
(7185, 70, 5942, 'song', 0),
(7186, 45, 5942, 'song', 0),
(7187, 70, 5943, 'song', 0),
(7188, 70, 447, 'album', 0),
(7189, 45, 5943, 'song', 0),
(7190, 70, 5944, 'song', 0),
(7191, 45, 5944, 'song', 0),
(7192, 70, 5945, 'song', 0),
(7193, 45, 5945, 'song', 0),
(7194, 70, 5946, 'song', 0),
(7195, 45, 5946, 'song', 0),
(7196, 70, 5947, 'song', 0),
(7197, 45, 5947, 'song', 0),
(7198, 70, 5948, 'song', 0),
(7199, 45, 5948, 'song', 0),
(7200, 70, 5949, 'song', 0),
(7201, 45, 5949, 'song', 0),
(7202, 70, 5950, 'song', 0),
(7203, 45, 5950, 'song', 0),
(7204, 70, 5951, 'song', 0),
(7205, 45, 5951, 'song', 0),
(7206, 70, 5952, 'song', 0),
(7207, 45, 5952, 'song', 0),
(7208, 70, 5953, 'song', 0),
(7209, 45, 5953, 'song', 0),
(7210, 70, 5954, 'song', 0),
(7211, 45, 5954, 'song', 0),
(7212, 70, 5955, 'song', 0),
(7213, 45, 5955, 'song', 0),
(7214, 70, 5956, 'song', 0),
(7215, 45, 5956, 'song', 0),
(7216, 70, 5957, 'song', 0),
(7217, 45, 5957, 'song', 0),
(7218, 70, 5958, 'song', 0),
(7219, 45, 5958, 'song', 0),
(7220, 70, 5959, 'song', 0),
(7221, 45, 5959, 'song', 0),
(7222, 70, 5960, 'song', 0),
(7223, 45, 5960, 'song', 0),
(7224, 45, 5961, 'song', 0),
(7225, 45, 451, 'album', 0),
(7226, 45, 5962, 'song', 0),
(7227, 45, 5963, 'song', 0),
(7228, 45, 5964, 'song', 0),
(7229, 45, 5965, 'song', 0),
(7230, 45, 452, 'album', 0),
(7231, 45, 5966, 'song', 0),
(7232, 45, 5967, 'song', 0),
(7233, 45, 5968, 'song', 0),
(7234, 45, 5969, 'song', 0),
(7235, 45, 5970, 'song', 0),
(7236, 45, 5971, 'song', 0),
(7237, 45, 5972, 'song', 0),
(7238, 45, 5973, 'song', 0),
(7239, 45, 5974, 'song', 0),
(7240, 45, 453, 'album', 0),
(7241, 45, 5975, 'song', 0),
(7242, 45, 5976, 'song', 0),
(7243, 45, 5977, 'song', 0),
(7244, 45, 5978, 'song', 0),
(7245, 45, 5979, 'song', 0),
(7246, 45, 5980, 'song', 0),
(7247, 45, 5981, 'song', 0),
(7248, 45, 5982, 'song', 0),
(7249, 45, 5983, 'song', 0),
(7250, 45, 5984, 'song', 0),
(7251, 45, 5985, 'song', 0),
(7252, 71, 5986, 'song', 0),
(7253, 71, 454, 'album', 0),
(7254, 71, 129, 'artist', 0),
(7255, 71, 5987, 'song', 0),
(7256, 72, 5988, 'song', 0),
(7257, 72, 454, 'album', 0),
(7258, 72, 129, 'artist', 0),
(7259, 71, 5989, 'song', 0),
(7260, 71, 455, 'album', 0),
(7261, 72, 5990, 'song', 0),
(7262, 71, 5991, 'song', 0),
(7263, 71, 5992, 'song', 0),
(7264, 71, 5993, 'song', 0),
(7265, 71, 5994, 'song', 0),
(7266, 71, 5995, 'song', 0),
(7267, 71, 5996, 'song', 0),
(7268, 71, 5997, 'song', 0),
(7269, 71, 5998, 'song', 0),
(7270, 71, 5999, 'song', 0),
(7271, 45, 6000, 'song', 0),
(7272, 45, 456, 'album', 0),
(7273, 45, 6001, 'song', 0),
(7274, 45, 6002, 'song', 0),
(7275, 45, 6003, 'song', 0),
(7276, 45, 6004, 'song', 0),
(7277, 45, 6005, 'song', 0),
(7278, 45, 6006, 'song', 0),
(7279, 45, 6007, 'song', 0),
(7280, 45, 6008, 'song', 0),
(7281, 45, 6009, 'song', 0),
(7282, 45, 6010, 'song', 0),
(7283, 45, 6011, 'song', 0),
(7284, 45, 6012, 'song', 0),
(7285, 45, 6013, 'song', 0),
(7286, 45, 457, 'album', 0),
(7287, 45, 6014, 'song', 0),
(7288, 45, 6015, 'song', 0),
(7289, 45, 6016, 'song', 0),
(7290, 45, 6017, 'song', 0),
(7291, 45, 6018, 'song', 0),
(7292, 45, 6019, 'song', 0),
(7293, 45, 6020, 'song', 0),
(7294, 54, 6021, 'song', 0),
(7295, 54, 458, 'album', 0),
(7296, 54, 129, 'artist', 0),
(7297, 54, 6022, 'song', 0),
(7298, 54, 6023, 'song', 0),
(7299, 54, 6024, 'song', 0),
(7300, 54, 6025, 'song', 0),
(7301, 54, 6026, 'song', 0),
(7302, 54, 6027, 'song', 0),
(7303, 54, 6028, 'song', 0),
(7304, 54, 6029, 'song', 0),
(7305, 54, 6030, 'song', 0),
(7306, 54, 6031, 'song', 0),
(7307, 56, 6032, 'song', 0),
(7308, 56, 459, 'album', 0),
(7309, 56, 129, 'artist', 0),
(7310, 56, 6033, 'song', 0),
(7311, 56, 6034, 'song', 0),
(7312, 56, 6035, 'song', 0),
(7313, 56, 460, 'album', 0),
(7314, 56, 6036, 'song', 0),
(7315, 56, 6037, 'song', 0),
(7316, 56, 6038, 'song', 0),
(7317, 56, 6039, 'song', 0),
(7318, 56, 6040, 'song', 0),
(7319, 56, 6041, 'song', 0),
(7320, 56, 6042, 'song', 0),
(7321, 56, 6043, 'song', 0),
(7322, 56, 6044, 'song', 0),
(7323, 54, 6045, 'song', 0),
(7324, 54, 461, 'album', 0),
(7325, 54, 6046, 'song', 0),
(7326, 54, 6047, 'song', 0),
(7327, 54, 6048, 'song', 0),
(7328, 54, 6049, 'song', 0),
(7329, 54, 6050, 'song', 0),
(7330, 54, 6051, 'song', 0),
(7331, 54, 6052, 'song', 0),
(7332, 54, 6053, 'song', 0),
(7333, 54, 6054, 'song', 0),
(7334, 54, 6055, 'song', 0),
(7335, 54, 6056, 'song', 0),
(7336, 73, 6057, 'song', 0),
(7337, 73, 462, 'album', 0),
(7338, 73, 130, 'artist', 0),
(7339, 73, 6058, 'song', 0),
(7340, 73, 6059, 'song', 0),
(7341, 73, 6060, 'song', 0),
(7342, 73, 6061, 'song', 0),
(7343, 73, 6062, 'song', 0),
(7344, 73, 6063, 'song', 0),
(7345, 73, 6064, 'song', 0),
(7346, 73, 6065, 'song', 0),
(7347, 73, 6066, 'song', 0),
(7348, 73, 6067, 'song', 0),
(7349, 73, 463, 'album', 0),
(7350, 73, 6068, 'song', 0),
(7351, 73, 6069, 'song', 0),
(7352, 73, 6070, 'song', 0),
(7353, 73, 6071, 'song', 0),
(7354, 73, 6072, 'song', 0),
(7355, 73, 6073, 'song', 0),
(7356, 73, 6074, 'song', 0),
(7357, 73, 6075, 'song', 0),
(7358, 73, 6076, 'song', 0),
(7359, 73, 6077, 'song', 0),
(7360, 73, 6078, 'song', 0),
(7361, 74, 6079, 'song', 0),
(7362, 74, 464, 'album', 0),
(7363, 74, 130, 'artist', 0),
(7364, 74, 6080, 'song', 0),
(7365, 74, 6081, 'song', 0),
(7366, 74, 6082, 'song', 0),
(7367, 74, 6083, 'song', 0),
(7368, 74, 6084, 'song', 0),
(7369, 74, 6085, 'song', 0),
(7370, 74, 6086, 'song', 0),
(7371, 74, 6087, 'song', 0),
(7372, 74, 6088, 'song', 0),
(7373, 13, 6089, 'song', 0),
(7374, 13, 465, 'album', 0),
(7375, 13, 130, 'artist', 0),
(7376, 13, 6090, 'song', 0),
(7377, 13, 6091, 'song', 0),
(7378, 13, 6092, 'song', 0),
(7379, 13, 6093, 'song', 0),
(7380, 13, 6094, 'song', 0),
(7381, 13, 6095, 'song', 0),
(7382, 13, 6096, 'song', 0),
(7383, 13, 6097, 'song', 0),
(7384, 13, 6098, 'song', 0),
(7385, 13, 6099, 'song', 0),
(7386, 74, 6100, 'song', 0),
(7387, 74, 466, 'album', 0),
(7388, 74, 6101, 'song', 0),
(7389, 74, 6102, 'song', 0),
(7390, 74, 6103, 'song', 0),
(7391, 74, 6104, 'song', 0),
(7392, 74, 6105, 'song', 0),
(7393, 74, 6106, 'song', 0),
(7394, 74, 6107, 'song', 0),
(7395, 74, 6108, 'song', 0),
(7396, 74, 6109, 'song', 0),
(7397, 74, 6110, 'song', 0),
(7398, 73, 6111, 'song', 0),
(7399, 73, 467, 'album', 0),
(7400, 73, 6112, 'song', 0),
(7401, 73, 6113, 'song', 0),
(7402, 73, 6114, 'song', 0),
(7403, 73, 6115, 'song', 0),
(7404, 73, 6116, 'song', 0),
(7405, 73, 6117, 'song', 0),
(7406, 73, 6118, 'song', 0),
(7407, 73, 6119, 'song', 0),
(7408, 73, 6120, 'song', 0),
(7409, 73, 6121, 'song', 0),
(7410, 73, 468, 'album', 0),
(7411, 73, 6122, 'song', 0),
(7412, 73, 6123, 'song', 0),
(7413, 73, 6124, 'song', 0),
(7414, 73, 6125, 'song', 0),
(7415, 73, 6126, 'song', 0),
(7416, 73, 6127, 'song', 0),
(7417, 73, 6128, 'song', 0),
(7418, 73, 6129, 'song', 0),
(7419, 73, 6130, 'song', 0),
(7420, 73, 6131, 'song', 0),
(7421, 73, 6132, 'song', 0),
(7422, 73, 6133, 'song', 0),
(7423, 73, 6134, 'song', 0),
(7424, 73, 6135, 'song', 0),
(7425, 73, 469, 'album', 0),
(7426, 73, 6136, 'song', 0),
(7427, 73, 6137, 'song', 0),
(7428, 73, 6138, 'song', 0),
(7429, 73, 6139, 'song', 0),
(7430, 73, 6140, 'song', 0),
(7431, 73, 6141, 'song', 0),
(7432, 73, 6142, 'song', 0),
(7433, 73, 6143, 'song', 0),
(7434, 73, 6144, 'song', 0),
(7435, 73, 6145, 'song', 0),
(7436, 73, 6146, 'song', 0),
(7437, 73, 6147, 'song', 0),
(7438, 73, 470, 'album', 0),
(7439, 73, 6148, 'song', 0),
(7440, 73, 6149, 'song', 0),
(7441, 73, 6150, 'song', 0),
(7442, 73, 6151, 'song', 0),
(7443, 73, 6152, 'song', 0),
(7444, 73, 6153, 'song', 0),
(7445, 73, 6154, 'song', 0),
(7446, 73, 6155, 'song', 0),
(7447, 73, 6156, 'song', 0),
(7448, 73, 6157, 'song', 0),
(7449, 73, 6158, 'song', 0),
(7450, 73, 6159, 'song', 0),
(7451, 73, 6160, 'song', 0),
(7452, 73, 6161, 'song', 0),
(7453, 73, 471, 'album', 0),
(7454, 73, 6162, 'song', 0),
(7455, 73, 6163, 'song', 0),
(7456, 73, 6164, 'song', 0),
(7457, 73, 6165, 'song', 0),
(7458, 73, 6166, 'song', 0),
(7459, 73, 6167, 'song', 0),
(7460, 73, 6168, 'song', 0),
(7461, 73, 6169, 'song', 0),
(7462, 73, 6170, 'song', 0),
(7463, 73, 6171, 'song', 0),
(7464, 73, 6172, 'song', 0),
(7465, 73, 6173, 'song', 0),
(7466, 73, 6174, 'song', 0),
(7467, 73, 6175, 'song', 0),
(7468, 73, 472, 'album', 0),
(7469, 73, 6176, 'song', 0),
(7470, 73, 6177, 'song', 0),
(7471, 73, 6178, 'song', 0),
(7472, 73, 6179, 'song', 0),
(7473, 73, 6180, 'song', 0),
(7474, 73, 6181, 'song', 0),
(7475, 73, 6182, 'song', 0),
(7476, 73, 6183, 'song', 0),
(7477, 73, 473, 'album', 0),
(7478, 73, 6184, 'song', 0),
(7479, 73, 6185, 'song', 0),
(7480, 73, 6186, 'song', 0),
(7481, 73, 6187, 'song', 0),
(7482, 73, 6188, 'song', 0),
(7483, 73, 6189, 'song', 0),
(7484, 73, 6190, 'song', 0),
(7485, 73, 6191, 'song', 0),
(7486, 73, 6192, 'song', 0),
(7487, 73, 474, 'album', 0),
(7488, 73, 6193, 'song', 0),
(7489, 73, 6194, 'song', 0),
(7490, 73, 6195, 'song', 0),
(7491, 73, 6196, 'song', 0),
(7492, 73, 6197, 'song', 0),
(7493, 73, 6198, 'song', 0),
(7494, 73, 6199, 'song', 0),
(7495, 73, 6200, 'song', 0),
(7496, 73, 6201, 'song', 0),
(7497, 73, 6202, 'song', 0),
(7498, 73, 6203, 'song', 0),
(7499, 73, 6204, 'song', 0),
(7500, 73, 6205, 'song', 0),
(7501, 73, 6206, 'song', 0),
(7502, 73, 6207, 'song', 0),
(7503, 73, 6208, 'song', 0),
(7504, 73, 6209, 'song', 0),
(7505, 73, 6210, 'song', 0),
(7506, 73, 475, 'album', 0),
(7507, 73, 6211, 'song', 0),
(7508, 73, 6212, 'song', 0),
(7509, 73, 6213, 'song', 0),
(7510, 73, 6214, 'song', 0),
(7511, 73, 6215, 'song', 0),
(7512, 73, 6216, 'song', 0),
(7513, 73, 6217, 'song', 0),
(7514, 73, 6218, 'song', 0),
(7515, 73, 6219, 'song', 0),
(7516, 73, 6220, 'song', 0),
(7517, 73, 6221, 'song', 0),
(7518, 54, 6222, 'song', 0),
(7519, 54, 476, 'album', 0),
(7520, 54, 130, 'artist', 0),
(7521, 54, 6223, 'song', 0),
(7522, 54, 6224, 'song', 0),
(7523, 54, 6225, 'song', 0),
(7524, 54, 6226, 'song', 0),
(7525, 54, 6227, 'song', 0);
INSERT INTO `tag_map` (`id`, `tag_id`, `object_id`, `object_type`, `user`) VALUES
(7526, 54, 6228, 'song', 0),
(7527, 54, 6229, 'song', 0),
(7528, 54, 6230, 'song', 0),
(7529, 54, 6231, 'song', 0),
(7530, 73, 6232, 'song', 0),
(7531, 73, 477, 'album', 0),
(7532, 73, 6233, 'song', 0),
(7533, 73, 6234, 'song', 0),
(7534, 73, 6235, 'song', 0),
(7535, 73, 6236, 'song', 0),
(7536, 73, 6237, 'song', 0),
(7537, 73, 6238, 'song', 0),
(7538, 73, 6239, 'song', 0),
(7539, 73, 6240, 'song', 0),
(7540, 73, 6241, 'song', 0),
(7541, 73, 6242, 'song', 0),
(7542, 73, 478, 'album', 0),
(7543, 73, 6243, 'song', 0),
(7544, 73, 6244, 'song', 0),
(7545, 73, 6245, 'song', 0),
(7546, 73, 6246, 'song', 0),
(7547, 73, 6247, 'song', 0),
(7548, 73, 6248, 'song', 0),
(7549, 73, 6249, 'song', 0),
(7550, 73, 6250, 'song', 0),
(7551, 73, 6251, 'song', 0),
(7552, 73, 6252, 'song', 0),
(7553, 73, 6253, 'song', 0),
(7554, 73, 6254, 'song', 0),
(7555, 73, 479, 'album', 0),
(7556, 73, 6255, 'song', 0),
(7557, 73, 6256, 'song', 0),
(7558, 73, 6257, 'song', 0),
(7559, 73, 6258, 'song', 0),
(7560, 73, 6259, 'song', 0),
(7561, 73, 6260, 'song', 0),
(7562, 73, 6261, 'song', 0),
(7563, 73, 6262, 'song', 0),
(7564, 73, 6263, 'song', 0),
(7565, 54, 6264, 'song', 0),
(7566, 54, 480, 'album', 0),
(7567, 54, 6265, 'song', 0),
(7568, 54, 6266, 'song', 0),
(7569, 54, 6267, 'song', 0),
(7570, 54, 6268, 'song', 0),
(7571, 54, 6269, 'song', 0),
(7572, 54, 6270, 'song', 0),
(7573, 54, 6271, 'song', 0),
(7574, 54, 6272, 'song', 0),
(7575, 54, 6273, 'song', 0),
(7576, 73, 6274, 'song', 0),
(7577, 73, 481, 'album', 0),
(7578, 73, 6275, 'song', 0),
(7579, 73, 6276, 'song', 0),
(7580, 73, 6277, 'song', 0),
(7581, 73, 6278, 'song', 0),
(7582, 73, 6279, 'song', 0),
(7583, 73, 6280, 'song', 0),
(7584, 73, 6281, 'song', 0),
(7585, 73, 6282, 'song', 0),
(7586, 73, 6283, 'song', 0),
(7587, 73, 6284, 'song', 0),
(7588, 73, 482, 'album', 0),
(7589, 73, 6285, 'song', 0),
(7590, 73, 6286, 'song', 0),
(7591, 73, 6287, 'song', 0),
(7592, 73, 6288, 'song', 0),
(7593, 73, 6289, 'song', 0),
(7594, 73, 6290, 'song', 0),
(7595, 73, 6291, 'song', 0),
(7596, 73, 6292, 'song', 0),
(7597, 73, 6293, 'song', 0),
(7598, 73, 6294, 'song', 0),
(7599, 73, 483, 'album', 0),
(7600, 73, 6295, 'song', 0),
(7601, 73, 6296, 'song', 0),
(7602, 73, 6297, 'song', 0),
(7603, 73, 6298, 'song', 0),
(7604, 73, 6299, 'song', 0),
(7605, 73, 6300, 'song', 0),
(7606, 73, 6301, 'song', 0),
(7607, 73, 6302, 'song', 0),
(7608, 73, 6303, 'song', 0),
(7609, 73, 6304, 'song', 0),
(7610, 73, 6305, 'song', 0),
(7611, 73, 6306, 'song', 0),
(7612, 73, 6307, 'song', 0),
(7613, 73, 484, 'album', 0),
(7614, 73, 6308, 'song', 0),
(7615, 73, 6309, 'song', 0),
(7616, 73, 6310, 'song', 0),
(7617, 73, 6311, 'song', 0),
(7618, 73, 6312, 'song', 0),
(7619, 73, 6313, 'song', 0),
(7620, 73, 6314, 'song', 0),
(7621, 73, 6315, 'song', 0),
(7622, 73, 6316, 'song', 0),
(7623, 73, 6317, 'song', 0),
(7624, 73, 6318, 'song', 0),
(7625, 73, 6319, 'song', 0),
(7626, 73, 6320, 'song', 0),
(7627, 73, 6321, 'song', 0),
(7628, 73, 6322, 'song', 0),
(7629, 73, 6323, 'song', 0),
(7630, 73, 6324, 'song', 0),
(7631, 73, 6325, 'song', 0),
(7632, 73, 485, 'album', 0),
(7633, 73, 6326, 'song', 0),
(7634, 73, 6327, 'song', 0),
(7635, 73, 6328, 'song', 0),
(7636, 73, 6329, 'song', 0),
(7637, 73, 6330, 'song', 0),
(7638, 73, 6331, 'song', 0),
(7639, 73, 6332, 'song', 0),
(7640, 73, 6333, 'song', 0),
(7641, 73, 6334, 'song', 0),
(7642, 73, 6335, 'song', 0),
(7643, 73, 6336, 'song', 0),
(7644, 73, 6337, 'song', 0),
(7645, 73, 486, 'album', 0),
(7646, 73, 6338, 'song', 0),
(7647, 73, 6339, 'song', 0),
(7648, 73, 6340, 'song', 0),
(7649, 73, 6341, 'song', 0),
(7650, 73, 6342, 'song', 0),
(7651, 73, 6343, 'song', 0),
(7652, 73, 6344, 'song', 0),
(7653, 73, 6345, 'song', 0),
(7654, 73, 6346, 'song', 0),
(7655, 73, 6347, 'song', 0),
(7656, 73, 487, 'album', 0),
(7657, 73, 6348, 'song', 0),
(7658, 73, 6349, 'song', 0),
(7659, 73, 6350, 'song', 0),
(7660, 73, 6351, 'song', 0),
(7661, 73, 6352, 'song', 0),
(7662, 73, 6353, 'song', 0),
(7663, 73, 6354, 'song', 0),
(7664, 73, 6355, 'song', 0),
(7665, 73, 6356, 'song', 0),
(7666, 73, 6357, 'song', 0),
(7667, 73, 488, 'album', 0),
(7668, 73, 6358, 'song', 0),
(7669, 73, 6359, 'song', 0),
(7670, 73, 6360, 'song', 0),
(7671, 73, 6361, 'song', 0),
(7672, 73, 6362, 'song', 0),
(7673, 73, 6363, 'song', 0),
(7674, 73, 6364, 'song', 0),
(7675, 73, 6365, 'song', 0),
(7676, 73, 6366, 'song', 0),
(7677, 73, 6367, 'song', 0),
(7678, 73, 6368, 'song', 0),
(7679, 73, 6369, 'song', 0),
(7680, 73, 6370, 'song', 0),
(7681, 73, 6371, 'song', 0),
(7682, 73, 489, 'album', 0),
(7683, 73, 131, 'artist', 0),
(7684, 73, 6372, 'song', 0),
(7685, 73, 6373, 'song', 0),
(7686, 73, 6374, 'song', 0),
(7687, 73, 6375, 'song', 0),
(7688, 73, 6376, 'song', 0),
(7689, 73, 6377, 'song', 0),
(7690, 73, 6378, 'song', 0),
(7691, 73, 6379, 'song', 0),
(7692, 73, 6380, 'song', 0),
(7693, 73, 6381, 'song', 0),
(7694, 73, 490, 'album', 0),
(7695, 73, 6382, 'song', 0),
(7696, 73, 6383, 'song', 0),
(7697, 73, 6384, 'song', 0),
(7698, 73, 6385, 'song', 0),
(7699, 73, 6386, 'song', 0),
(7700, 73, 6387, 'song', 0),
(7701, 73, 6388, 'song', 0),
(7702, 73, 6389, 'song', 0),
(7703, 73, 6390, 'song', 0),
(7704, 73, 491, 'album', 0),
(7705, 73, 6391, 'song', 0),
(7706, 73, 6392, 'song', 0),
(7707, 73, 6393, 'song', 0),
(7708, 73, 6394, 'song', 0),
(7709, 73, 6395, 'song', 0),
(7710, 73, 6396, 'song', 0),
(7711, 73, 6397, 'song', 0),
(7712, 73, 6398, 'song', 0),
(7713, 73, 6399, 'song', 0),
(7714, 73, 6400, 'song', 0),
(7715, 73, 492, 'album', 0),
(7716, 73, 6401, 'song', 0),
(7717, 73, 6402, 'song', 0),
(7718, 73, 6403, 'song', 0),
(7719, 73, 6404, 'song', 0),
(7720, 73, 6405, 'song', 0),
(7721, 73, 6406, 'song', 0),
(7722, 73, 6407, 'song', 0),
(7723, 73, 6408, 'song', 0),
(7724, 73, 6409, 'song', 0),
(7725, 73, 6410, 'song', 0),
(7726, 73, 6411, 'song', 0),
(7727, 45, 6412, 'song', 0),
(7728, 45, 493, 'album', 0),
(7729, 45, 132, 'artist', 0),
(7730, 45, 6413, 'song', 0),
(7731, 45, 6414, 'song', 0),
(7732, 45, 6415, 'song', 0),
(7733, 45, 6416, 'song', 0),
(7734, 45, 6417, 'song', 0),
(7735, 45, 6418, 'song', 0),
(7736, 45, 6419, 'song', 0),
(7737, 45, 6420, 'song', 0),
(7738, 56, 6421, 'song', 0),
(7739, 56, 494, 'album', 0),
(7740, 56, 132, 'artist', 0),
(7741, 45, 6422, 'song', 0),
(7742, 45, 495, 'album', 0),
(7743, 45, 6423, 'song', 0),
(7744, 45, 133, 'artist', 0),
(7745, 45, 6424, 'song', 0),
(7746, 45, 6425, 'song', 0),
(7747, 45, 134, 'artist', 0),
(7748, 45, 6426, 'song', 0),
(7749, 45, 6427, 'song', 0),
(7750, 45, 6428, 'song', 0),
(7751, 45, 6429, 'song', 0),
(7752, 45, 6430, 'song', 0),
(7753, 45, 6431, 'song', 0),
(7754, 45, 6432, 'song', 0),
(7755, 45, 496, 'album', 0),
(7756, 45, 6433, 'song', 0),
(7757, 45, 6434, 'song', 0),
(7758, 45, 6435, 'song', 0),
(7759, 45, 6436, 'song', 0),
(7760, 45, 6437, 'song', 0),
(7761, 45, 6438, 'song', 0),
(7762, 45, 6439, 'song', 0),
(7763, 45, 6440, 'song', 0),
(7764, 45, 6441, 'song', 0),
(7765, 45, 6442, 'song', 0),
(7766, 45, 6443, 'song', 0),
(7767, 45, 6444, 'song', 0),
(7768, 45, 497, 'album', 0),
(7769, 45, 135, 'artist', 0),
(7770, 45, 6445, 'song', 0),
(7771, 45, 6446, 'song', 0),
(7772, 45, 6447, 'song', 0),
(7773, 45, 6448, 'song', 0),
(7774, 45, 6449, 'song', 0),
(7775, 45, 6450, 'song', 0),
(7776, 45, 6451, 'song', 0),
(7777, 45, 6452, 'song', 0),
(7778, 45, 6453, 'song', 0),
(7779, 45, 6454, 'song', 0),
(7780, 45, 6455, 'song', 0),
(7781, 56, 6456, 'song', 0),
(7782, 56, 498, 'album', 0),
(7783, 56, 6457, 'song', 0),
(7784, 56, 6458, 'song', 0),
(7785, 56, 6459, 'song', 0),
(7786, 56, 6460, 'song', 0),
(7787, 56, 6461, 'song', 0),
(7788, 56, 6462, 'song', 0),
(7789, 56, 6463, 'song', 0),
(7790, 56, 6464, 'song', 0),
(7791, 56, 6465, 'song', 0),
(7792, 56, 6466, 'song', 0),
(7793, 56, 6467, 'song', 0),
(7794, 56, 6468, 'song', 0),
(7795, 56, 6469, 'song', 0),
(7796, 45, 6470, 'song', 0),
(7797, 45, 499, 'album', 0),
(7798, 45, 6471, 'song', 0),
(7799, 45, 6472, 'song', 0),
(7800, 45, 6473, 'song', 0),
(7801, 45, 6474, 'song', 0),
(7802, 45, 6475, 'song', 0),
(7803, 45, 6476, 'song', 0),
(7804, 45, 6477, 'song', 0),
(7805, 45, 6478, 'song', 0),
(7806, 45, 6479, 'song', 0),
(7807, 56, 6480, 'song', 0),
(7808, 56, 500, 'album', 0),
(7809, 56, 6481, 'song', 0),
(7810, 56, 6482, 'song', 0),
(7811, 56, 6483, 'song', 0),
(7812, 56, 6484, 'song', 0),
(7813, 56, 6485, 'song', 0),
(7814, 56, 6486, 'song', 0),
(7815, 56, 6487, 'song', 0),
(7816, 56, 6488, 'song', 0),
(7817, 56, 6489, 'song', 0),
(7818, 45, 6490, 'song', 0),
(7819, 45, 501, 'album', 0),
(7820, 45, 6491, 'song', 0),
(7821, 45, 6492, 'song', 0),
(7822, 45, 6493, 'song', 0),
(7823, 45, 6494, 'song', 0),
(7824, 45, 6495, 'song', 0),
(7825, 45, 6496, 'song', 0),
(7826, 45, 6497, 'song', 0),
(7827, 45, 6498, 'song', 0),
(7828, 45, 6499, 'song', 0),
(7829, 45, 6500, 'song', 0),
(7830, 45, 6501, 'song', 0),
(7831, 45, 6502, 'song', 0),
(7832, 45, 6503, 'song', 0),
(7833, 45, 136, 'artist', 0),
(7834, 45, 6504, 'song', 0),
(7835, 45, 6505, 'song', 0),
(7836, 45, 6506, 'song', 0),
(7837, 45, 6507, 'song', 0),
(7838, 45, 6508, 'song', 0),
(7839, 45, 6509, 'song', 0),
(7840, 45, 6510, 'song', 0),
(7841, 45, 502, 'album', 0),
(7842, 45, 6511, 'song', 0),
(7843, 45, 6512, 'song', 0),
(7844, 45, 6513, 'song', 0),
(7845, 45, 6514, 'song', 0),
(7846, 45, 6515, 'song', 0),
(7847, 45, 6516, 'song', 0),
(7848, 45, 6517, 'song', 0),
(7849, 45, 6518, 'song', 0),
(7850, 45, 6519, 'song', 0),
(7851, 45, 6520, 'song', 0),
(7852, 45, 6521, 'song', 0),
(7853, 45, 6522, 'song', 0),
(7854, 45, 6523, 'song', 0),
(7855, 45, 6524, 'song', 0),
(7856, 45, 6525, 'song', 0),
(7857, 45, 6526, 'song', 0),
(7858, 45, 6527, 'song', 0),
(7859, 56, 6528, 'song', 0),
(7860, 56, 503, 'album', 0),
(7861, 56, 6529, 'song', 0),
(7862, 56, 6530, 'song', 0),
(7863, 56, 504, 'album', 0),
(7864, 56, 6531, 'song', 0),
(7865, 56, 6532, 'song', 0),
(7866, 56, 6533, 'song', 0),
(7867, 56, 6534, 'song', 0),
(7868, 56, 6535, 'song', 0),
(7869, 56, 6536, 'song', 0),
(7870, 45, 6537, 'song', 0),
(7871, 45, 505, 'album', 0),
(7872, 45, 6538, 'song', 0),
(7873, 45, 6539, 'song', 0),
(7874, 45, 6540, 'song', 0),
(7875, 45, 6541, 'song', 0),
(7876, 45, 6542, 'song', 0),
(7877, 45, 6543, 'song', 0),
(7878, 45, 6544, 'song', 0),
(7879, 45, 6545, 'song', 0),
(7880, 56, 6546, 'song', 0),
(7881, 56, 506, 'album', 0),
(7882, 56, 6547, 'song', 0),
(7883, 56, 6548, 'song', 0),
(7884, 56, 6549, 'song', 0),
(7885, 56, 6550, 'song', 0),
(7886, 56, 6551, 'song', 0),
(7887, 56, 6552, 'song', 0),
(7888, 56, 6553, 'song', 0),
(7889, 56, 137, 'artist', 0),
(7890, 56, 6554, 'song', 0),
(7891, 56, 6555, 'song', 0),
(7892, 56, 6556, 'song', 0),
(7893, 56, 6557, 'song', 0),
(7894, 56, 6558, 'song', 0),
(7895, 56, 6559, 'song', 0),
(7896, 56, 6560, 'song', 0),
(7897, 56, 507, 'album', 0),
(7898, 56, 6561, 'song', 0),
(7899, 56, 6562, 'song', 0),
(7900, 56, 6563, 'song', 0),
(7901, 56, 6564, 'song', 0),
(7902, 56, 6565, 'song', 0),
(7903, 56, 6566, 'song', 0),
(7904, 56, 6567, 'song', 0),
(7905, 56, 6568, 'song', 0),
(7906, 56, 6569, 'song', 0),
(7907, 56, 6570, 'song', 0),
(7908, 45, 6571, 'song', 0),
(7909, 45, 508, 'album', 0),
(7910, 45, 6572, 'song', 0),
(7911, 45, 138, 'artist', 0),
(7912, 45, 6573, 'song', 0),
(7913, 45, 6574, 'song', 0),
(7914, 45, 6575, 'song', 0),
(7915, 45, 6576, 'song', 0),
(7916, 45, 139, 'artist', 0),
(7917, 45, 6577, 'song', 0),
(7918, 45, 6578, 'song', 0),
(7919, 45, 6579, 'song', 0),
(7920, 45, 6580, 'song', 0),
(7921, 45, 6581, 'song', 0),
(7922, 45, 6582, 'song', 0),
(7923, 45, 6583, 'song', 0),
(7924, 45, 6584, 'song', 0),
(7925, 45, 6585, 'song', 0),
(7926, 45, 6586, 'song', 0),
(7927, 45, 140, 'artist', 0),
(7928, 45, 6587, 'song', 0),
(7929, 45, 6588, 'song', 0),
(7930, 45, 6589, 'song', 0),
(7931, 45, 6590, 'song', 0),
(7932, 45, 6591, 'song', 0),
(7933, 45, 6592, 'song', 0),
(7934, 45, 6593, 'song', 0),
(7935, 47, 6594, 'song', 0),
(7936, 47, 6595, 'song', 0),
(7937, 47, 6596, 'song', 0),
(7938, 47, 6597, 'song', 0),
(7939, 47, 6598, 'song', 0),
(7940, 47, 6599, 'song', 0),
(7941, 47, 6600, 'song', 0),
(7942, 47, 6601, 'song', 0),
(7943, 47, 6602, 'song', 0),
(7944, 47, 6603, 'song', 0),
(7945, 47, 6604, 'song', 0),
(7946, 47, 6605, 'song', 0),
(7947, 47, 6606, 'song', 0),
(7948, 47, 6607, 'song', 0),
(7949, 47, 6608, 'song', 0),
(7950, 47, 6609, 'song', 0),
(7951, 47, 6610, 'song', 0),
(7952, 47, 6611, 'song', 0),
(7953, 47, 6612, 'song', 0),
(7954, 47, 6613, 'song', 0),
(7955, 47, 6614, 'song', 0),
(7956, 47, 6615, 'song', 0),
(7957, 47, 6616, 'song', 0),
(7958, 47, 6617, 'song', 0),
(7959, 47, 6618, 'song', 0),
(7960, 47, 6619, 'song', 0),
(7961, 47, 6620, 'song', 0),
(7962, 47, 6621, 'song', 0),
(7963, 47, 6622, 'song', 0),
(7964, 47, 6623, 'song', 0),
(7965, 47, 6624, 'song', 0),
(7966, 47, 6625, 'song', 0),
(7967, 47, 6626, 'song', 0),
(7968, 47, 6627, 'song', 0),
(7969, 47, 6628, 'song', 0),
(7970, 47, 6629, 'song', 0),
(7971, 47, 6630, 'song', 0),
(7972, 47, 6631, 'song', 0),
(7973, 47, 6632, 'song', 0),
(7974, 47, 6633, 'song', 0),
(7975, 47, 6634, 'song', 0),
(7976, 47, 6635, 'song', 0),
(7977, 47, 6636, 'song', 0),
(7978, 47, 6637, 'song', 0),
(7979, 47, 6638, 'song', 0),
(7980, 47, 6639, 'song', 0),
(7981, 47, 6640, 'song', 0),
(7982, 47, 6641, 'song', 0),
(7983, 47, 6642, 'song', 0),
(7984, 47, 6643, 'song', 0),
(7985, 47, 6644, 'song', 0),
(7986, 47, 6645, 'song', 0),
(7987, 47, 6646, 'song', 0),
(7988, 47, 6647, 'song', 0),
(7989, 47, 6648, 'song', 0),
(7990, 47, 6649, 'song', 0),
(7991, 47, 6650, 'song', 0),
(7992, 47, 6651, 'song', 0),
(7993, 47, 6652, 'song', 0),
(7994, 47, 6653, 'song', 0),
(7995, 47, 6654, 'song', 0),
(7996, 47, 6655, 'song', 0),
(7997, 47, 6656, 'song', 0),
(7998, 47, 6657, 'song', 0),
(7999, 47, 6658, 'song', 0),
(8000, 47, 6659, 'song', 0),
(8001, 49, 6665, 'song', 0),
(8002, 49, 509, 'album', 0),
(8003, 49, 144, 'artist', 0),
(8004, 49, 6666, 'song', 0),
(8005, 49, 6667, 'song', 0),
(8006, 49, 6668, 'song', 0),
(8007, 49, 6669, 'song', 0),
(8008, 49, 6670, 'song', 0),
(8009, 49, 6671, 'song', 0),
(8010, 49, 6672, 'song', 0),
(8011, 49, 6673, 'song', 0),
(8012, 49, 6674, 'song', 0),
(8013, 48, 6675, 'song', 0),
(8014, 48, 510, 'album', 0),
(8015, 48, 145, 'artist', 0),
(8016, 48, 6676, 'song', 0),
(8017, 48, 6677, 'song', 0),
(8018, 48, 6678, 'song', 0),
(8019, 48, 6679, 'song', 0),
(8020, 48, 6680, 'song', 0),
(8021, 48, 6681, 'song', 0),
(8022, 48, 6682, 'song', 0),
(8023, 48, 6683, 'song', 0),
(8024, 48, 6684, 'song', 0),
(8025, 75, 6685, 'song', 0),
(8026, 75, 511, 'album', 0),
(8027, 75, 145, 'artist', 0),
(8028, 76, 6685, 'song', 0),
(8029, 76, 511, 'album', 0),
(8030, 76, 145, 'artist', 0),
(8031, 75, 6686, 'song', 0),
(8032, 76, 6686, 'song', 0),
(8033, 75, 6687, 'song', 0),
(8034, 76, 6687, 'song', 0),
(8035, 75, 6688, 'song', 0),
(8036, 76, 6688, 'song', 0),
(8037, 75, 6689, 'song', 0),
(8038, 76, 6689, 'song', 0),
(8039, 75, 6690, 'song', 0),
(8040, 76, 6690, 'song', 0),
(8041, 75, 6691, 'song', 0),
(8042, 76, 6691, 'song', 0),
(8043, 75, 6692, 'song', 0),
(8044, 76, 6692, 'song', 0),
(8045, 75, 6693, 'song', 0),
(8046, 76, 6693, 'song', 0),
(8047, 75, 6694, 'song', 0),
(8048, 76, 6694, 'song', 0),
(8049, 75, 6695, 'song', 0),
(8050, 76, 6695, 'song', 0),
(8051, 75, 6696, 'song', 0),
(8052, 76, 6696, 'song', 0),
(8053, 47, 6697, 'song', 0),
(8054, 47, 512, 'album', 0),
(8055, 47, 145, 'artist', 0),
(8056, 47, 6698, 'song', 0),
(8057, 47, 6699, 'song', 0),
(8058, 47, 6700, 'song', 0),
(8059, 47, 6701, 'song', 0),
(8060, 47, 6702, 'song', 0),
(8061, 47, 6703, 'song', 0),
(8062, 47, 6704, 'song', 0),
(8063, 47, 6705, 'song', 0),
(8064, 56, 6706, 'song', 0),
(8065, 56, 513, 'album', 0),
(8066, 56, 146, 'artist', 0),
(8067, 56, 6707, 'song', 0),
(8068, 56, 6708, 'song', 0),
(8069, 56, 6709, 'song', 0),
(8070, 56, 514, 'album', 0),
(8071, 56, 6710, 'song', 0),
(8072, 56, 6711, 'song', 0),
(8073, 56, 6712, 'song', 0),
(8074, 56, 6713, 'song', 0),
(8075, 56, 6714, 'song', 0),
(8076, 56, 6715, 'song', 0),
(8077, 56, 6716, 'song', 0),
(8078, 56, 6717, 'song', 0),
(8079, 56, 6718, 'song', 0),
(8080, 56, 6719, 'song', 0),
(8081, 56, 6720, 'song', 0),
(8082, 56, 6721, 'song', 0),
(8083, 56, 6722, 'song', 0),
(8084, 56, 6723, 'song', 0),
(8085, 56, 515, 'album', 0),
(8086, 56, 148, 'artist', 0),
(8087, 56, 6724, 'song', 0),
(8088, 56, 6725, 'song', 0),
(8089, 56, 6726, 'song', 0),
(8090, 56, 6727, 'song', 0),
(8091, 56, 6728, 'song', 0),
(8092, 56, 6729, 'song', 0),
(8093, 56, 6730, 'song', 0),
(8094, 56, 6731, 'song', 0),
(8095, 56, 6732, 'song', 0),
(8096, 56, 6733, 'song', 0),
(8097, 56, 6734, 'song', 0),
(8098, 56, 516, 'album', 0),
(8099, 56, 149, 'artist', 0),
(8100, 56, 6735, 'song', 0),
(8101, 56, 6736, 'song', 0),
(8102, 56, 6737, 'song', 0),
(8103, 56, 6738, 'song', 0),
(8104, 56, 6739, 'song', 0),
(8105, 56, 6740, 'song', 0),
(8106, 56, 6741, 'song', 0),
(8107, 56, 6742, 'song', 0),
(8108, 56, 6743, 'song', 0),
(8109, 56, 6744, 'song', 0),
(8110, 56, 6745, 'song', 0),
(8111, 56, 6746, 'song', 0),
(8112, 56, 6747, 'song', 0),
(8113, 56, 6748, 'song', 0),
(8114, 56, 6749, 'song', 0),
(8115, 56, 517, 'album', 0),
(8116, 56, 6750, 'song', 0),
(8117, 56, 6751, 'song', 0),
(8118, 56, 6752, 'song', 0),
(8119, 56, 6753, 'song', 0),
(8120, 56, 6754, 'song', 0),
(8121, 56, 150, 'artist', 0),
(8122, 56, 6755, 'song', 0),
(8123, 56, 6756, 'song', 0),
(8124, 56, 6757, 'song', 0),
(8125, 56, 6758, 'song', 0),
(8126, 56, 6759, 'song', 0),
(8127, 56, 6760, 'song', 0),
(8128, 56, 6761, 'song', 0),
(8129, 56, 6762, 'song', 0),
(8130, 56, 518, 'album', 0),
(8131, 56, 6763, 'song', 0),
(8132, 56, 6764, 'song', 0),
(8133, 56, 6765, 'song', 0),
(8134, 56, 6766, 'song', 0),
(8135, 56, 6767, 'song', 0),
(8136, 56, 6768, 'song', 0),
(8137, 56, 6769, 'song', 0),
(8138, 56, 6770, 'song', 0),
(8139, 56, 6771, 'song', 0),
(8140, 56, 519, 'album', 0),
(8141, 56, 6772, 'song', 0),
(8142, 56, 6773, 'song', 0),
(8143, 56, 6774, 'song', 0),
(8144, 56, 6775, 'song', 0),
(8145, 56, 6776, 'song', 0),
(8146, 56, 6777, 'song', 0),
(8147, 56, 6778, 'song', 0),
(8148, 56, 520, 'album', 0),
(8149, 56, 6779, 'song', 0),
(8150, 56, 6780, 'song', 0),
(8151, 56, 6781, 'song', 0),
(8152, 56, 6782, 'song', 0),
(8153, 56, 6783, 'song', 0),
(8154, 56, 6784, 'song', 0),
(8155, 56, 6785, 'song', 0),
(8156, 56, 6786, 'song', 0),
(8157, 56, 6787, 'song', 0),
(8158, 56, 6788, 'song', 0),
(8159, 56, 6789, 'song', 0),
(8160, 56, 6790, 'song', 0),
(8161, 56, 6791, 'song', 0),
(8162, 56, 521, 'album', 0),
(8163, 56, 6792, 'song', 0),
(8164, 56, 6793, 'song', 0),
(8165, 56, 6794, 'song', 0),
(8166, 56, 6795, 'song', 0),
(8167, 56, 6796, 'song', 0),
(8168, 56, 6797, 'song', 0),
(8169, 56, 6798, 'song', 0),
(8170, 56, 6799, 'song', 0),
(8171, 56, 6800, 'song', 0),
(8172, 56, 522, 'album', 0),
(8173, 56, 6801, 'song', 0),
(8174, 56, 6802, 'song', 0),
(8175, 56, 6803, 'song', 0),
(8176, 56, 6804, 'song', 0),
(8177, 56, 6805, 'song', 0),
(8178, 56, 6806, 'song', 0),
(8179, 56, 6807, 'song', 0),
(8180, 56, 6808, 'song', 0),
(8181, 56, 6809, 'song', 0),
(8182, 56, 523, 'album', 0),
(8183, 56, 6810, 'song', 0),
(8184, 56, 6811, 'song', 0),
(8185, 56, 6812, 'song', 0),
(8186, 56, 6813, 'song', 0),
(8187, 56, 6814, 'song', 0),
(8188, 56, 6815, 'song', 0),
(8189, 56, 6816, 'song', 0),
(8190, 56, 6817, 'song', 0),
(8191, 56, 6818, 'song', 0),
(8192, 56, 6819, 'song', 0),
(8193, 56, 6820, 'song', 0),
(8194, 56, 6821, 'song', 0),
(8195, 56, 6822, 'song', 0),
(8196, 56, 6823, 'song', 0),
(8197, 56, 6825, 'song', 0),
(8198, 56, 525, 'album', 0),
(8199, 56, 6826, 'song', 0),
(8200, 56, 151, 'artist', 0),
(8201, 56, 6827, 'song', 0),
(8202, 56, 6828, 'song', 0),
(8203, 56, 6829, 'song', 0),
(8204, 56, 6830, 'song', 0),
(8205, 56, 6831, 'song', 0),
(8206, 56, 526, 'album', 0),
(8207, 56, 6832, 'song', 0),
(8208, 56, 6833, 'song', 0),
(8209, 56, 6834, 'song', 0),
(8210, 56, 6835, 'song', 0),
(8211, 56, 6836, 'song', 0),
(8212, 56, 6837, 'song', 0),
(8213, 56, 6838, 'song', 0),
(8214, 56, 6839, 'song', 0),
(8215, 56, 527, 'album', 0),
(8216, 56, 6840, 'song', 0),
(8217, 56, 6841, 'song', 0),
(8218, 56, 6842, 'song', 0),
(8219, 56, 528, 'album', 0),
(8220, 56, 6843, 'song', 0),
(8221, 56, 529, 'album', 0),
(8222, 56, 6844, 'song', 0),
(8223, 56, 6845, 'song', 0),
(8224, 56, 6846, 'song', 0),
(8225, 56, 6847, 'song', 0),
(8226, 56, 6848, 'song', 0),
(8227, 56, 6849, 'song', 0),
(8228, 56, 6850, 'song', 0),
(8229, 56, 6851, 'song', 0),
(8230, 56, 6852, 'song', 0),
(8231, 56, 6853, 'song', 0),
(8232, 56, 6854, 'song', 0),
(8233, 56, 6855, 'song', 0),
(8234, 56, 6856, 'song', 0),
(8235, 56, 530, 'album', 0),
(8236, 56, 6857, 'song', 0),
(8237, 56, 6858, 'song', 0),
(8238, 56, 6859, 'song', 0),
(8239, 56, 6860, 'song', 0),
(8240, 56, 6861, 'song', 0),
(8241, 56, 6862, 'song', 0),
(8242, 56, 6863, 'song', 0),
(8243, 56, 6864, 'song', 0),
(8244, 56, 6865, 'song', 0),
(8245, 56, 6866, 'song', 0),
(8246, 56, 6867, 'song', 0),
(8247, 56, 6868, 'song', 0),
(8248, 56, 6869, 'song', 0),
(8249, 56, 6870, 'song', 0),
(8250, 54, 6871, 'song', 0),
(8251, 54, 531, 'album', 0),
(8252, 54, 152, 'artist', 0),
(8253, 54, 6872, 'song', 0),
(8254, 54, 6873, 'song', 0),
(8255, 54, 6874, 'song', 0),
(8256, 54, 6875, 'song', 0),
(8257, 45, 6876, 'song', 0),
(8258, 45, 532, 'album', 0),
(8259, 45, 153, 'artist', 0),
(8260, 45, 6877, 'song', 0),
(8261, 45, 533, 'album', 0),
(8262, 45, 154, 'artist', 0),
(8263, 45, 6878, 'song', 0),
(8264, 45, 6879, 'song', 0),
(8265, 45, 6880, 'song', 0),
(8266, 45, 6881, 'song', 0),
(8267, 45, 6882, 'song', 0),
(8268, 45, 6883, 'song', 0),
(8269, 45, 6884, 'song', 0),
(8270, 45, 6885, 'song', 0),
(8271, 45, 6886, 'song', 0),
(8272, 45, 6887, 'song', 0),
(8273, 45, 6888, 'song', 0),
(8274, 45, 6889, 'song', 0),
(8275, 45, 6890, 'song', 0),
(8276, 45, 6891, 'song', 0),
(8277, 45, 6892, 'song', 0),
(8278, 45, 6893, 'song', 0),
(8279, 45, 534, 'album', 0),
(8280, 45, 6894, 'song', 0),
(8281, 45, 6895, 'song', 0),
(8282, 45, 6896, 'song', 0),
(8283, 45, 6897, 'song', 0),
(8284, 45, 6898, 'song', 0),
(8285, 45, 6899, 'song', 0),
(8286, 45, 6900, 'song', 0),
(8287, 45, 6901, 'song', 0),
(8288, 45, 6902, 'song', 0),
(8289, 45, 6903, 'song', 0),
(8290, 45, 6904, 'song', 0),
(8291, 45, 6905, 'song', 0),
(8292, 45, 6906, 'song', 0),
(8293, 45, 6907, 'song', 0),
(8294, 45, 6908, 'song', 0),
(8295, 45, 6909, 'song', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tag_merge`
--

CREATE TABLE `tag_merge` (
  `tag_id` int(11) NOT NULL,
  `merged_to` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tmp_browse`
--

CREATE TABLE `tmp_browse` (
  `id` int(13) NOT NULL,
  `sid` varchar(128) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `object_data` longtext COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tmp_browse`
--

INSERT INTO `tmp_browse` (`id`, `sid`, `data`, `object_data`) VALUES
(1, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":1}', '[\"4\"]'),
(2, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":1}', '[\"4\"]'),
(3, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":1}', '[\"4\"]'),
(4, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":0}', '[]'),
(5, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":0}', '[]'),
(6, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":1}', '[\"5\"]'),
(7, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":1}', '[\"5\"]'),
(8, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":1}', '[\"5\"]'),
(9, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":2}', '[\"7\",\"5\"]'),
(10, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":2}', '[\"7\",\"5\"]'),
(11, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":3}', '[\"7\",\"14\",\"5\"]'),
(12, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":3}', '[\"7\",\"14\",\"5\"]'),
(13, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":3}', '[\"7\",\"14\",\"5\"]'),
(14, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":2}', '[\"14\",\"5\"]'),
(15, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":1}', '[\"14\"]'),
(16, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\",\"catalog\":0},\"select\":[\"`artist`.`id`\"],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"artist\",\"update_session\":true,\"sort\":{\"name\":\"ASC\"},\"total\":30}', NULL),
(17, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `album` \",\"filter\":{\"regex_not_match\":\"\",\"catalog\":0},\"select\":[\"`album`.`id`\"],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"album\",\"update_session\":true,\"sort\":{\"name\":\"ASC\"},\"total\":223}', NULL),
(18, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":1}', '[\"14\"]'),
(19, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":1}', '[\"14\"]'),
(20, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":1}', '[\"14\"]'),
(21, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":1}', '[\"14\"]'),
(22, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":1}', '[\"14\"]'),
(23, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":0}', '[]'),
(24, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":1}', '[\"16\"]'),
(25, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":1}', '[\"16\"]'),
(26, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `album` \",\"filter\":{\"regex_not_match\":\"\",\"catalog\":0},\"select\":[\"`album`.`id`\"],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"album\",\"update_session\":true,\"sort\":{\"name\":\"ASC\"},\"total\":78}', NULL),
(27, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `album` \",\"filter\":{\"regex_not_match\":\"\",\"catalog\":0},\"select\":[\"`album`.`id`\"],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"album\",\"update_session\":true,\"sort\":{\"name\":\"ASC\"},\"total\":116}', NULL),
(28, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\",\"catalog\":0},\"select\":[\"`artist`.`id`\"],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"artist\",\"update_session\":true,\"sort\":{\"name\":\"ASC\"},\"total\":35}', NULL),
(29, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `album` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`album`.`id`\"],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"album\",\"ak\":\"album\",\"total\":1}', '[\"438\"]'),
(30, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `song` \",\"filter\":{\"regex_not_match\":\"\",\"album\":\"438\"},\"select\":[\"`song`.`id`\"],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"song\",\"sort\":{\"track\":\"ASC\"},\"total\":16}', NULL),
(31, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `album` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`album`.`id`\"],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"album\",\"ak\":\"album\",\"total\":1}', '[\"438\"]'),
(32, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `song` \",\"filter\":{\"regex_not_match\":\"\",\"album\":\"438\"},\"select\":[\"`song`.`id`\"],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"song\",\"sort\":{\"track\":\"ASC\"},\"total\":16}', NULL),
(33, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `album` \",\"filter\":{\"regex_not_match\":\"\",\"catalog\":0},\"select\":[\"`album`.`id`\"],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"album\",\"update_session\":true,\"sort\":{\"name\":\"ASC\"},\"total\":211}', NULL),
(34, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `album` \",\"filter\":{\"regex_not_match\":\"\",\"catalog\":0},\"select\":[\"`album`.`id`\"],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"album\",\"update_session\":true,\"sort\":{\"name\":\"ASC\"},\"total\":211}', NULL),
(35, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":1}', '[\"16\"]'),
(36, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":1}', '[\"16\"]'),
(37, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":0}', '[]'),
(38, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":1}', '[\"17\"]'),
(39, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":1}', '[\"17\"]'),
(40, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":1}', '[\"17\"]'),
(41, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":1}', '[\"17\"]'),
(42, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":1}', '[\"17\"]'),
(43, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `song` \",\"filter\":{\"regex_not_match\":\"\",\"catalog\":0},\"select\":[\"`song`.`id`\"],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"song\",\"update_session\":true,\"sort\":{\"title\":\"ASC\"},\"total\":6126}', NULL),
(44, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `album` \",\"filter\":{\"regex_not_match\":\"\",\"catalog\":0},\"select\":[\"`album`.`id`\"],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"album\",\"update_session\":true,\"sort\":{\"name\":\"ASC\"},\"total\":467}', NULL),
(45, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `song` \",\"filter\":{\"regex_not_match\":\"\",\"album\":\"742\"},\"select\":[\"`song`.`id`\"],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"song\",\"sort\":{\"track\":\"ASC\"},\"total\":14}', NULL),
(46, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\",\"catalog\":0},\"select\":[\"`artist`.`id`\"],\"static\":false,\"simple\":true,\"start\":50,\"offset\":50,\"use_pages\":false,\"use_alpha\":false,\"grid_view\":true,\"type\":\"artist\",\"update_session\":true,\"sort\":{\"name\":\"ASC\"},\"total\":153}', NULL),
(47, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `album` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`album`.`id`\"],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"album\",\"ak\":\"album\",\"total\":12}', '[\"660\",\"661\",\"665\",\"664\",\"663\",\"668\",\"673\",\"672\",\"671\",\"662\",\"667\",\"666\"]'),
(48, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `playlist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`playlist`.`id`\"],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"playlist\",\"update_session\":true,\"sort\":{\"last_update\":\"DESC\"},\"total\":0}', NULL),
(49, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `user` \",\"filter\":[],\"select\":[\"`user`.`id`\"],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"user\",\"total\":2}', NULL),
(81, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":null,\"filter\":[],\"select\":[],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50}', '[\"189\",\"100\",\"281\",\"230\",\"132\",\"130\"]'),
(82, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\",\"catalog\":0},\"select\":[\"`artist`.`id`\"],\"static\":false,\"simple\":true,\"start\":150,\"offset\":50,\"use_pages\":false,\"use_alpha\":false,\"grid_view\":false,\"type\":\"artist\",\"update_session\":true,\"sort\":{\"name\":\"ASC\"},\"total\":166}', NULL),
(79, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":null,\"filter\":[],\"select\":[],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50}', '[\"189\",\"100\",\"281\",\"230\",\"132\",\"130\"]'),
(80, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":null,\"filter\":[],\"select\":[],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50}', '[\"286\",\"285\",\"284\",\"283\",\"282\",\"281\"]'),
(50, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `user` \",\"filter\":[],\"select\":[\"`user`.`id`\"],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"user\",\"total\":2}', NULL),
(51, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `user` \",\"filter\":[],\"select\":[\"`user`.`id`\"],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"user\",\"total\":2}', NULL),
(52, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `album` \",\"filter\":{\"regex_not_match\":\"\",\"catalog\":0},\"select\":[\"`album`.`id`\"],\"static\":false,\"simple\":true,\"start\":100,\"offset\":50,\"use_pages\":false,\"use_alpha\":false,\"grid_view\":true,\"type\":\"album\",\"update_session\":true,\"sort\":{\"name\":\"ASC\"},\"total\":747}', NULL),
(53, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\",\"catalog\":0},\"select\":[\"`artist`.`id`\"],\"static\":false,\"simple\":true,\"start\":50,\"offset\":50,\"use_pages\":false,\"use_alpha\":false,\"grid_view\":true,\"type\":\"artist\",\"update_session\":true,\"sort\":{\"name\":\"ASC\"},\"total\":166}', NULL);
INSERT INTO `tmp_browse` (`id`, `sid`, `data`, `object_data`) VALUES
(54, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `song` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`song`.`id`\"],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"song\",\"total\":14685}', '[\"5098\",\"5099\",\"5100\",\"5101\",\"5102\",\"5103\",\"5104\",\"5105\",\"5106\",\"5107\",\"5108\",\"5109\",\"5110\",\"5111\",\"5112\",\"5113\",\"5114\",\"5115\",\"5116\",\"5117\",\"5118\",\"5119\",\"5120\",\"5121\",\"5122\",\"5123\",\"5124\",\"5125\",\"5126\",\"5127\",\"5128\",\"5129\",\"5130\",\"5131\",\"5132\",\"5133\",\"5134\",\"5135\",\"5136\",\"5137\",\"5138\",\"5139\",\"5140\",\"5141\",\"5142\",\"5143\",\"5144\",\"5145\",\"5146\",\"5147\",\"5148\",\"5149\",\"5150\",\"5151\",\"5152\",\"5153\",\"5154\",\"5155\",\"5156\",\"5157\",\"5158\",\"5159\",\"5160\",\"5161\",\"5162\",\"5163\",\"5164\",\"5165\",\"5166\",\"5167\",\"5168\",\"5169\",\"5170\",\"5171\",\"5172\",\"5173\",\"5174\",\"5175\",\"5176\",\"5177\",\"5178\",\"5179\",\"5180\",\"5181\",\"5182\",\"5183\",\"5184\",\"5185\",\"5186\",\"5187\",\"5188\",\"5189\",\"5190\",\"5191\",\"5192\",\"5193\",\"5194\",\"5195\",\"5196\",\"5197\",\"5198\",\"5199\",\"5200\",\"5201\",\"5202\",\"5203\",\"5204\",\"5205\",\"5206\",\"5207\",\"5208\",\"5209\",\"5210\",\"5211\",\"5212\",\"5213\",\"5215\",\"5216\",\"5218\",\"5219\",\"5221\",\"14923\",\"14924\",\"14929\",\"14931\",\"14935\",\"14936\",\"14939\",\"14940\",\"14941\",\"14942\",\"14943\",\"14944\",\"14945\",\"14946\",\"14947\",\"14948\",\"14949\",\"14950\",\"14951\",\"14952\",\"14953\",\"14954\",\"14955\",\"14956\",\"14957\",\"14958\",\"14959\",\"14960\",\"14961\",\"14962\",\"14963\",\"14964\",\"14965\",\"14966\",\"14967\",\"14968\",\"14969\",\"14970\",\"14971\",\"14972\",\"14973\",\"14974\",\"14975\",\"14976\",\"14977\",\"14978\",\"14979\",\"14980\",\"14981\",\"14982\",\"14983\",\"14984\",\"14985\",\"14986\",\"14987\",\"14988\",\"14989\",\"14990\",\"14991\",\"14992\",\"14993\",\"14994\",\"14995\",\"14996\",\"14997\",\"14998\",\"14999\",\"15000\",\"15001\",\"15002\",\"15003\",\"15004\",\"15005\",\"15006\",\"15007\",\"15008\",\"15009\",\"15010\",\"15011\",\"15012\",\"15013\",\"15014\",\"15015\",\"15016\",\"15017\",\"15018\",\"15019\",\"15020\",\"15021\",\"15022\",\"15023\",\"15024\",\"15025\",\"15026\",\"15027\",\"15028\",\"15029\",\"15030\",\"15031\",\"15032\",\"15033\",\"15034\",\"15035\",\"15036\",\"15037\",\"15038\",\"15039\",\"15040\",\"15041\",\"15042\",\"15043\",\"15044\",\"15045\",\"15046\",\"15047\",\"15048\",\"15049\",\"15050\",\"15051\",\"15052\",\"15053\",\"15054\",\"15055\",\"15056\",\"15057\",\"15058\",\"15059\",\"15060\",\"15061\",\"15062\",\"15063\",\"15064\",\"15065\",\"15066\",\"15067\",\"15068\",\"15069\",\"15070\",\"15071\",\"15072\",\"15073\",\"15074\",\"15075\",\"15076\",\"15077\",\"15078\",\"15079\",\"15080\",\"15081\",\"15082\",\"15083\",\"15084\",\"15085\",\"15086\",\"15087\",\"15088\",\"15089\",\"15090\",\"15091\",\"15092\",\"15093\",\"15094\",\"15095\",\"15096\",\"15097\",\"15098\",\"15099\",\"15100\",\"15101\",\"15102\",\"15103\",\"15104\",\"15105\",\"15106\",\"15107\",\"15108\",\"15109\",\"15110\",\"15111\",\"15112\",\"15113\",\"15114\",\"15115\",\"15116\",\"15117\",\"15118\",\"15119\",\"15120\",\"15121\",\"15122\",\"15123\",\"15124\",\"15125\",\"15126\",\"15127\",\"15128\",\"15129\",\"15130\",\"15131\",\"15132\",\"15133\",\"15134\",\"15135\",\"15136\",\"15137\",\"15138\",\"15139\",\"15140\",\"15141\",\"15142\",\"15143\",\"15144\",\"15145\",\"15146\",\"15147\",\"15148\",\"15149\",\"15150\",\"15151\",\"15152\",\"15153\",\"15154\",\"15155\",\"15156\",\"15157\",\"15158\",\"15159\",\"15160\",\"15161\",\"15162\",\"15163\",\"15164\",\"15165\",\"15166\",\"15167\",\"15168\",\"15169\",\"15170\",\"15171\",\"15172\",\"15173\",\"15174\",\"15175\",\"15176\",\"15177\",\"15178\",\"15179\",\"15180\",\"15181\",\"15182\",\"15183\",\"15184\",\"15185\",\"15186\",\"15187\",\"15188\",\"15189\",\"15190\",\"15191\",\"15192\",\"15193\",\"15194\",\"15195\",\"15196\",\"15197\",\"15198\",\"15199\",\"15200\",\"15201\",\"15202\",\"15203\",\"15204\",\"15205\",\"15206\",\"15207\",\"15208\",\"15209\",\"15210\",\"15211\",\"15212\",\"15213\",\"15214\",\"15215\",\"15216\",\"15217\",\"15218\",\"15219\",\"15220\",\"15221\",\"15222\",\"15223\",\"15224\",\"15225\",\"15226\",\"15227\",\"15228\",\"15229\",\"15230\",\"15231\",\"15232\",\"15233\",\"15234\",\"15235\",\"15236\",\"15237\",\"15238\",\"15239\",\"15240\",\"15241\",\"15242\",\"15243\",\"15244\",\"15245\",\"15246\",\"15247\",\"15248\",\"15249\",\"15250\",\"15251\",\"15252\",\"15253\",\"15254\",\"15255\",\"15256\",\"15257\",\"15258\",\"15259\",\"15260\",\"15261\",\"15262\",\"15263\",\"15264\",\"15265\",\"15266\",\"15267\",\"15268\",\"15269\",\"15270\",\"15271\",\"15272\",\"15273\",\"15274\",\"15275\",\"15276\",\"15277\",\"15278\",\"15279\",\"15280\",\"15281\",\"15282\",\"15283\",\"15284\",\"15285\",\"15286\",\"15287\",\"15288\",\"15289\",\"15290\",\"15291\",\"15292\",\"15293\",\"15294\",\"15295\",\"5097\",\"14921\",\"14922\",\"14938\",\"5041\",\"5040\",\"5039\",\"5038\",\"5037\",\"5036\",\"5035\",\"5034\",\"5033\",\"5032\",\"5031\",\"5030\",\"5029\",\"5028\",\"5027\",\"5026\",\"5025\",\"5024\",\"5023\",\"5022\",\"5021\",\"5020\",\"5019\",\"5018\",\"5017\",\"5016\",\"5015\",\"5014\",\"5013\",\"5012\",\"5011\",\"5010\",\"5008\",\"5007\",\"5006\",\"5005\",\"5004\",\"5003\",\"5002\",\"5001\",\"5000\",\"4999\",\"4998\",\"4997\",\"4996\",\"4995\",\"4994\",\"4993\",\"4992\",\"4991\",\"4990\",\"4989\",\"4988\",\"5044\",\"5045\",\"5046\",\"5047\",\"5048\",\"5049\",\"5050\",\"5051\",\"5052\",\"5053\",\"5054\",\"5055\",\"5056\",\"5057\",\"5058\",\"5059\",\"5060\",\"5061\",\"5062\",\"5063\",\"5064\",\"5065\",\"5066\",\"5067\",\"5068\",\"5069\",\"5070\",\"5071\",\"5072\",\"5073\",\"5074\",\"5075\",\"5076\",\"5077\",\"5078\",\"5079\",\"5080\",\"5081\",\"5082\",\"5083\",\"5084\",\"5085\",\"5086\",\"5087\",\"5088\",\"5089\",\"5090\",\"5091\",\"5092\",\"5093\",\"5094\",\"5095\",\"5096\",\"14435\",\"14436\",\"14437\",\"14438\",\"14439\",\"14440\",\"14441\",\"14442\",\"14443\",\"14444\",\"14445\",\"14446\",\"14447\",\"14448\",\"14449\",\"14450\",\"14451\",\"14452\",\"14453\",\"14454\",\"14455\",\"14456\",\"14457\",\"14458\",\"14459\",\"14460\",\"14461\",\"14462\",\"14463\",\"14464\",\"14465\",\"14466\",\"14467\",\"14468\",\"14469\",\"14470\",\"14471\",\"14472\",\"14473\",\"14474\",\"14475\",\"14476\",\"14477\",\"14478\",\"14479\",\"14480\",\"14481\",\"14482\",\"14483\",\"14484\",\"14485\",\"14486\",\"14487\",\"14488\",\"14489\",\"14490\",\"14491\",\"14492\",\"14493\",\"14494\",\"14495\",\"14496\",\"14497\",\"14498\",\"14499\",\"14500\",\"14501\",\"14502\",\"14503\",\"14504\",\"14505\",\"14506\",\"14507\",\"14508\",\"14509\",\"14510\",\"14511\",\"14512\",\"14513\",\"14514\",\"14515\",\"14516\",\"14517\",\"14518\",\"14519\",\"14520\",\"14521\",\"14522\",\"14523\",\"14524\",\"14525\",\"14526\",\"14527\",\"14528\",\"14529\",\"14530\",\"14531\",\"14532\",\"14533\",\"14534\",\"14535\",\"14536\",\"14537\",\"14538\",\"14539\",\"14540\",\"14541\",\"14542\",\"14543\",\"14544\",\"14545\",\"14546\",\"14547\",\"14548\",\"14549\",\"14550\",\"14551\",\"14552\",\"14553\",\"14554\",\"14555\",\"14556\",\"14557\",\"14558\",\"14559\",\"14560\",\"14561\",\"14562\",\"14563\",\"14564\",\"14565\",\"14566\",\"14567\",\"14568\",\"14569\",\"14570\",\"14571\",\"14572\",\"14573\",\"14574\",\"14575\",\"14576\",\"14577\",\"14578\",\"14579\",\"14580\",\"14581\",\"14582\",\"14583\",\"14584\",\"14585\",\"14586\",\"14587\",\"14588\",\"14589\",\"14590\",\"14591\",\"14592\",\"14593\",\"14594\",\"14595\",\"14596\",\"14597\",\"14598\",\"14599\",\"14600\",\"14601\",\"14602\",\"14603\",\"14604\",\"14605\",\"14606\",\"14607\",\"14608\",\"14609\",\"14610\",\"14611\",\"14612\",\"14613\",\"14614\",\"14615\",\"14616\",\"14617\",\"14618\",\"14619\",\"14620\",\"14621\",\"14622\",\"14623\",\"14624\",\"14625\",\"14626\",\"14627\",\"14628\",\"14629\",\"14630\",\"14631\",\"14632\",\"14633\",\"14634\",\"14635\",\"14636\",\"14637\",\"14638\",\"14639\",\"14640\",\"14641\",\"14642\",\"14643\",\"14644\",\"14645\",\"14646\",\"14647\",\"14648\",\"14649\",\"14650\",\"14651\",\"14652\",\"14653\",\"14654\",\"14655\",\"14656\",\"14657\",\"14658\",\"14659\",\"14660\",\"14661\",\"14662\",\"14663\",\"14664\",\"14665\",\"14668\",\"14670\",\"14671\",\"14672\",\"14673\",\"14674\",\"14675\",\"14676\",\"14677\",\"14678\",\"14679\",\"14680\",\"14681\",\"14682\",\"14683\",\"14684\",\"14685\",\"14686\",\"14687\",\"14688\",\"14689\",\"14690\",\"14691\",\"14692\",\"14693\",\"14694\",\"14695\",\"14696\",\"14697\",\"14698\",\"14699\",\"14700\",\"14701\",\"14702\",\"14703\",\"14704\",\"14705\",\"14706\",\"14707\",\"14708\",\"14709\",\"14710\",\"14711\",\"14712\",\"14713\",\"14714\",\"14715\",\"14716\",\"14717\",\"14718\",\"14719\",\"14720\",\"14721\",\"14722\",\"14723\",\"14724\",\"14725\",\"14726\",\"14727\",\"14728\",\"14729\",\"14730\",\"14731\",\"14732\",\"14733\",\"14734\",\"14735\",\"14736\",\"14737\",\"14738\",\"14739\",\"14740\",\"14741\",\"14742\",\"14743\",\"14744\",\"14745\",\"14746\",\"14747\",\"14748\",\"14749\",\"14750\",\"14751\",\"14752\",\"14753\",\"14754\",\"14755\",\"14756\",\"14757\",\"14758\",\"14759\",\"14760\",\"14761\",\"14762\",\"14763\",\"14764\",\"14771\",\"14772\",\"14773\",\"14774\",\"14775\",\"14776\",\"14777\",\"14778\",\"14779\",\"14780\",\"14781\",\"14782\",\"14783\",\"14784\",\"14785\",\"14786\",\"14787\",\"14788\",\"14789\",\"14790\",\"14791\",\"14792\",\"14793\",\"14794\",\"14795\",\"14796\",\"14797\",\"14798\",\"14799\",\"14800\",\"14801\",\"14802\",\"14803\",\"14804\",\"14805\",\"14806\",\"14807\",\"14808\",\"14809\",\"14810\",\"14811\",\"14812\",\"14813\",\"14814\",\"14815\",\"14816\",\"14817\",\"14818\",\"14819\",\"14820\",\"14821\",\"14822\",\"14823\",\"14824\",\"14825\",\"14826\",\"14827\",\"14828\",\"14829\",\"14830\",\"14831\",\"14832\",\"14833\",\"14834\",\"14835\",\"14836\",\"14837\",\"14838\",\"14839\",\"14840\",\"14841\",\"14842\",\"14843\",\"14844\",\"14845\",\"14846\",\"14847\",\"14848\",\"14849\",\"14850\",\"14851\",\"14852\",\"14853\",\"14854\",\"14855\",\"14856\",\"14857\",\"14858\",\"14859\",\"14860\",\"14861\",\"14862\",\"14863\",\"14864\",\"14865\",\"14866\",\"14867\",\"14868\",\"14869\",\"14870\",\"14871\",\"14872\",\"14873\",\"14874\",\"14875\",\"14876\",\"14877\",\"14878\",\"14879\",\"14880\",\"14881\",\"14882\",\"14883\",\"14884\",\"14885\",\"14886\",\"14887\",\"14888\",\"14889\",\"14890\",\"14891\",\"14892\",\"14893\",\"14894\",\"14895\",\"14896\",\"14897\",\"14898\",\"14899\",\"14900\",\"14901\",\"14902\",\"14903\",\"14904\",\"14905\",\"14906\",\"14907\",\"14908\",\"14909\",\"14910\",\"14911\",\"14912\",\"14913\",\"14914\",\"14915\",\"14916\",\"14917\",\"14918\",\"14919\",\"14920\",\"14925\",\"14926\",\"14927\",\"14928\",\"14930\",\"14932\",\"14933\",\"14934\",\"14937\",\"5009\",\"14666\",\"14667\",\"14669\",\"5042\",\"5043\",\"14765\",\"14766\",\"14767\",\"14768\",\"14769\",\"14770\",\"6594\",\"6595\",\"6596\",\"6597\",\"6598\",\"6599\",\"6600\",\"6601\",\"6602\",\"6603\",\"6604\",\"6605\",\"6606\",\"6607\",\"6608\",\"6609\",\"6610\",\"6611\",\"6612\",\"6613\",\"6614\",\"6615\",\"6616\",\"6617\",\"6618\",\"6619\",\"6620\",\"6621\",\"6622\",\"6623\",\"6624\",\"6625\",\"6626\",\"6627\",\"6628\",\"6629\",\"6630\",\"6631\",\"6632\",\"6633\",\"6634\",\"6635\",\"6636\",\"6637\",\"6638\",\"6639\",\"6640\",\"6641\",\"6642\",\"6643\",\"6644\",\"6645\",\"6646\",\"6647\",\"6648\",\"6649\",\"6650\",\"6651\",\"6652\",\"6653\",\"6654\",\"6655\",\"6656\",\"6657\",\"6658\",\"6659\",\"16747\",\"16748\",\"16749\",\"16750\",\"16751\",\"16752\",\"16753\",\"16754\",\"16755\",\"16756\",\"16757\",\"16758\",\"16759\",\"16760\",\"16761\",\"16762\",\"16763\",\"16764\",\"16765\",\"16766\",\"16767\",\"16768\",\"16769\",\"16770\",\"16771\",\"16772\",\"16773\",\"16774\",\"16775\",\"16776\",\"16777\",\"16778\",\"16779\",\"16780\",\"16781\",\"16782\",\"16783\",\"16784\",\"16785\",\"16786\",\"16787\",\"16788\",\"16789\",\"16790\",\"16791\",\"16792\",\"16793\",\"16794\",\"16795\",\"16796\",\"16797\",\"16798\",\"16799\",\"16800\",\"16801\",\"16802\",\"16803\",\"16804\",\"16805\",\"16806\",\"16807\",\"16808\",\"16809\",\"16810\",\"16811\",\"16812\",\"5222\",\"5223\",\"5225\",\"5227\",\"5228\",\"5229\",\"5230\",\"5232\",\"5233\",\"5234\",\"5236\",\"5237\",\"5239\",\"5240\",\"5242\",\"5243\",\"5244\",\"5246\",\"5247\",\"5248\",\"5250\",\"5251\",\"5253\",\"5255\",\"5257\",\"5259\",\"5260\",\"5263\",\"5265\",\"5266\",\"5268\",\"5270\",\"5271\",\"5273\",\"5275\",\"5277\",\"5279\",\"5281\",\"5283\",\"5285\",\"15296\",\"15297\",\"15298\",\"15299\",\"15300\",\"15301\",\"15302\",\"15303\",\"15304\",\"15305\",\"15306\",\"15307\",\"15308\",\"15309\",\"15310\",\"15311\",\"15312\",\"15313\",\"15314\",\"15315\",\"15316\",\"15317\",\"15318\",\"15319\",\"15320\",\"15321\",\"15322\",\"15323\",\"15324\",\"15325\",\"15326\",\"15327\",\"15328\",\"15329\",\"15330\",\"15331\",\"15332\",\"15333\",\"15334\",\"15335\",\"15336\",\"15337\",\"15338\",\"15339\",\"15340\",\"15341\",\"15342\",\"15343\",\"15344\",\"15345\",\"15346\",\"15347\",\"15348\",\"15349\",\"15350\",\"15351\",\"15352\",\"15353\",\"15354\",\"15355\",\"15356\",\"15357\",\"15358\",\"15359\",\"15360\",\"15361\",\"15362\",\"15363\",\"15364\",\"15365\",\"15366\",\"15367\",\"15368\",\"15369\",\"15370\",\"15371\",\"15372\",\"15373\",\"15374\",\"15375\",\"15376\",\"15377\",\"15378\",\"15379\",\"15380\",\"15381\",\"15382\",\"15383\",\"15384\",\"15385\",\"15386\",\"15387\",\"15388\",\"15389\",\"15390\",\"15391\",\"15392\",\"15393\",\"15394\",\"15395\",\"15396\",\"15397\",\"15398\",\"15399\",\"15400\",\"15401\",\"15402\",\"15403\",\"15404\",\"15405\",\"15406\",\"15407\",\"15408\",\"15409\",\"15410\",\"15411\",\"15412\",\"15413\",\"15414\",\"15415\",\"5287\",\"5289\",\"5290\",\"5292\",\"5297\",\"5300\",\"5302\",\"5305\",\"5307\",\"5329\",\"5333\",\"5336\",\"5347\",\"5349\",\"5350\",\"5356\",\"5358\",\"5361\",\"5363\",\"5365\",\"5367\",\"5369\",\"5370\",\"5371\",\"5372\",\"5373\",\"5374\",\"5375\",\"5376\",\"5377\",\"5378\",\"5379\",\"5380\",\"5381\",\"5382\",\"5384\",\"5385\",\"5386\",\"5387\",\"5388\",\"5391\",\"5392\",\"5393\",\"5394\",\"5395\",\"5397\",\"5398\",\"5399\",\"5400\",\"5401\",\"5402\",\"5403\",\"5404\",\"5405\",\"5407\",\"5408\",\"5409\",\"5410\",\"5411\",\"5412\",\"5413\",\"5414\",\"5415\",\"5416\",\"5417\",\"5418\",\"5419\",\"5420\",\"5421\",\"5422\",\"5423\",\"5424\",\"5425\",\"5426\",\"5427\",\"5428\",\"5429\",\"5430\",\"5431\",\"5432\",\"5433\",\"5434\",\"5435\",\"5436\",\"5437\",\"5438\",\"5439\",\"5440\",\"5441\",\"5442\",\"5443\",\"5444\",\"5445\",\"5446\",\"5447\",\"5448\",\"5449\",\"5450\",\"5451\",\"5452\",\"5453\",\"5454\",\"5455\",\"5456\",\"5457\",\"5473\",\"5474\",\"5475\",\"5476\",\"5477\",\"5479\",\"5480\",\"5481\",\"5482\",\"5483\",\"5484\",\"5485\",\"5486\",\"5487\",\"5488\",\"5489\",\"5491\",\"5493\",\"5494\",\"5495\",\"5496\",\"5498\",\"5499\",\"5501\",\"5502\",\"5503\",\"5504\",\"5505\",\"5507\",\"5509\",\"5511\",\"5512\",\"5513\",\"5514\",\"5515\",\"5516\",\"5517\",\"5518\",\"5519\",\"5520\",\"5521\",\"5522\",\"5523\",\"5524\",\"5525\",\"5526\",\"5527\",\"5528\",\"5529\",\"5530\",\"5531\",\"5532\",\"5533\",\"5534\",\"5535\",\"5536\",\"5537\",\"5538\",\"5539\",\"5540\",\"5541\",\"5542\",\"5543\",\"5544\",\"5546\",\"5547\",\"5548\",\"5550\",\"5551\",\"5552\",\"5553\",\"5554\",\"5556\",\"5558\",\"5559\",\"5560\",\"5561\",\"5562\",\"5563\",\"5564\",\"5565\",\"5566\",\"5567\",\"5569\",\"5570\",\"5571\",\"5572\",\"5573\",\"5574\",\"5575\",\"5576\",\"5577\",\"5578\",\"5579\",\"5580\",\"5581\",\"5582\",\"5583\",\"5584\",\"5585\",\"5586\",\"5587\",\"5588\",\"5589\",\"5590\",\"5591\",\"5592\",\"5593\",\"5594\",\"5595\",\"5596\",\"5597\",\"5598\",\"5599\",\"5600\",\"5601\",\"5602\",\"5603\",\"5606\",\"5607\",\"5610\",\"5611\",\"15416\",\"15417\",\"15418\",\"15419\",\"15420\",\"15421\",\"15422\",\"15423\",\"15424\",\"15425\",\"15426\",\"15427\",\"15434\",\"15435\",\"15436\",\"15440\",\"15441\",\"15442\",\"15443\",\"15444\",\"15445\",\"15446\",\"15447\",\"15448\",\"15449\",\"15450\",\"15451\",\"15484\",\"15486\",\"15487\",\"15491\",\"15492\",\"15493\",\"15494\",\"15495\",\"15496\",\"15510\",\"15511\",\"15512\",\"15515\",\"15516\",\"15518\",\"15519\",\"15520\",\"15521\",\"15522\",\"15523\",\"15524\",\"15525\",\"15526\",\"15527\",\"15528\",\"15529\",\"15530\",\"15531\",\"15532\",\"15533\",\"15534\",\"15535\",\"15537\",\"15538\",\"15539\",\"15540\",\"15541\",\"15544\",\"15545\",\"15546\",\"15547\",\"15548\",\"15550\",\"15551\",\"15552\",\"15553\",\"15554\",\"15555\",\"15556\",\"15557\",\"15558\",\"15560\",\"15561\",\"15562\",\"15563\",\"15564\",\"15565\",\"15566\",\"15567\",\"15568\",\"15569\",\"15570\",\"15571\",\"15572\",\"15573\",\"15574\",\"15575\",\"15576\",\"15577\",\"15578\",\"15579\",\"15580\",\"15581\",\"15582\",\"15583\",\"15584\",\"15585\",\"15586\",\"15587\",\"15588\",\"15589\",\"15590\",\"15591\",\"15592\",\"15593\",\"15594\",\"15595\",\"15596\",\"15597\",\"15598\",\"15599\",\"15600\",\"15601\",\"15602\",\"15603\",\"15604\",\"15605\",\"15606\",\"15607\",\"15608\",\"15609\",\"15610\",\"15626\",\"15627\",\"15628\",\"15629\",\"15630\",\"15632\",\"15633\",\"15634\",\"15635\",\"15636\",\"15637\",\"15638\",\"15639\",\"15640\",\"15641\",\"15642\",\"15644\",\"15646\",\"15647\",\"15648\",\"15649\",\"15651\",\"15652\",\"15654\",\"15655\",\"15656\",\"15657\",\"15658\",\"15660\",\"15662\",\"15664\",\"15665\",\"15666\",\"15667\",\"15668\",\"15669\",\"15670\",\"15671\",\"15672\",\"15673\",\"15674\",\"15675\",\"15676\",\"15677\",\"15678\",\"15679\",\"15680\",\"15681\",\"15682\",\"15683\",\"15684\",\"15685\",\"15686\",\"15687\",\"15688\",\"15689\",\"15690\",\"15691\",\"15692\",\"15693\",\"15694\",\"15695\",\"15696\",\"15697\",\"15699\",\"15700\",\"15701\",\"15703\",\"15704\",\"15705\",\"15706\",\"15707\",\"15709\",\"15711\",\"15712\",\"15713\",\"15714\",\"15715\",\"15716\",\"15717\",\"15718\",\"15719\",\"15720\",\"15722\",\"15723\",\"15724\",\"15725\",\"15726\",\"15727\",\"15728\",\"15729\",\"15730\",\"15731\",\"15732\",\"15733\",\"15734\",\"15735\",\"15736\",\"15737\",\"15738\",\"15739\",\"15740\",\"15741\",\"15742\",\"15743\",\"15744\",\"15745\",\"15746\",\"15747\",\"15748\",\"15749\",\"15750\",\"15751\",\"15752\",\"15753\",\"15754\",\"15755\",\"15756\",\"15759\",\"15760\",\"15763\",\"15764\",\"5293\",\"5295\",\"5298\",\"5308\",\"5331\",\"5340\",\"5341\",\"5343\",\"5344\",\"5346\",\"5353\",\"5354\",\"5360\",\"5383\",\"5389\",\"5390\",\"5396\",\"5406\",\"5458\",\"5459\",\"5460\",\"5461\",\"5462\",\"5463\",\"5464\",\"5465\",\"5466\",\"5467\",\"5468\",\"5469\",\"5470\",\"5471\",\"5472\",\"5490\",\"5492\",\"5497\",\"5500\",\"5506\",\"5508\",\"5510\",\"5545\",\"5549\",\"5555\",\"5557\",\"5568\",\"5604\",\"5605\",\"5608\",\"5609\",\"6663\",\"6664\",\"15428\",\"15429\",\"15430\",\"15431\",\"15432\",\"15433\",\"15437\",\"15438\",\"15439\",\"15452\",\"15453\",\"15454\",\"15488\",\"15489\",\"15490\",\"15497\",\"15498\",\"15499\",\"15500\",\"15501\",\"15502\",\"15503\",\"15504\",\"15505\",\"15506\",\"15507\",\"15508\",\"5310\",\"5312\",\"5314\",\"5316\",\"5318\",\"5320\",\"5321\",\"5324\",\"5326\",\"5327\",\"15455\",\"15456\",\"15457\",\"15458\",\"15459\",\"15460\",\"15461\",\"15462\",\"15463\",\"15464\",\"15465\",\"15466\",\"15467\",\"15468\",\"15469\",\"15470\",\"15471\",\"15472\",\"15473\",\"15474\",\"15475\",\"15476\",\"15477\",\"15478\",\"15479\",\"15480\",\"15481\",\"15482\",\"15483\",\"15485\",\"5478\",\"15631\",\"5612\",\"5613\",\"5614\",\"5615\",\"5616\",\"5617\",\"5618\",\"5619\",\"5620\",\"5621\",\"5622\",\"5623\",\"5624\",\"5625\",\"5626\",\"5627\",\"5628\",\"5629\",\"5630\",\"5631\",\"5632\",\"5633\",\"5634\",\"5635\",\"5636\",\"5637\",\"5638\",\"5639\",\"5640\",\"5641\",\"5642\",\"5643\",\"5644\",\"5645\",\"5646\",\"5647\",\"5648\",\"5649\",\"5650\",\"5651\",\"5652\",\"5653\",\"5654\",\"5655\",\"5656\",\"5657\",\"5658\",\"5659\",\"5660\",\"15765\",\"15766\",\"15767\",\"15768\",\"15769\",\"15770\",\"15771\",\"15772\",\"15773\",\"15774\",\"15775\",\"15776\",\"15777\",\"15778\",\"15779\",\"15780\",\"15781\",\"15782\",\"15783\",\"15784\",\"15785\",\"15786\",\"15787\",\"15788\",\"15789\",\"15790\",\"15791\",\"15792\",\"15793\",\"15794\",\"15795\",\"15796\",\"15797\",\"15798\",\"15799\",\"15800\",\"15801\",\"15802\",\"15803\",\"15804\",\"15805\",\"15806\",\"15807\",\"15808\",\"15809\",\"15810\",\"15811\",\"15812\",\"15813\",\"5661\",\"5662\",\"5663\",\"5664\",\"5665\",\"5666\",\"5667\",\"5668\",\"5669\",\"5670\",\"5671\",\"5672\",\"5673\",\"5674\",\"5675\",\"5676\",\"5677\",\"5678\",\"5679\",\"5680\",\"5681\",\"5682\",\"5683\",\"5684\",\"5685\",\"5686\",\"5687\",\"5688\",\"5689\",\"5690\",\"5691\",\"5692\",\"5693\",\"5694\",\"5695\",\"5696\",\"5697\",\"5698\",\"5699\",\"5700\",\"5701\",\"5702\",\"5703\",\"5704\",\"5705\",\"5706\",\"5707\",\"5708\",\"5709\",\"5710\",\"5711\",\"5712\",\"5713\",\"5714\",\"5715\",\"5716\",\"5717\",\"5718\",\"5719\",\"5720\",\"5721\",\"5722\",\"5723\",\"5724\",\"5725\",\"5726\",\"15814\",\"15815\",\"15816\",\"15817\",\"15818\",\"15819\",\"15820\",\"15821\",\"15822\",\"15823\",\"15824\",\"15825\",\"15826\",\"15827\",\"15828\",\"15829\",\"15830\",\"15831\",\"15832\",\"15833\",\"15834\",\"15835\",\"15836\",\"15837\",\"15838\",\"15839\",\"15840\",\"15841\",\"15842\",\"15843\",\"15844\",\"15845\",\"15846\",\"15847\",\"15848\",\"15849\",\"15850\",\"15851\",\"15852\",\"15853\",\"15854\",\"15855\",\"15856\",\"15857\",\"15858\",\"15859\",\"15860\",\"15861\",\"15862\",\"15863\",\"15864\",\"15865\",\"15866\",\"15867\",\"15868\",\"15869\",\"15870\",\"15871\",\"15872\",\"15873\",\"15874\",\"15875\",\"15876\",\"15877\",\"15878\",\"15879\",\"5727\",\"5728\",\"5729\",\"5730\",\"5731\",\"5732\",\"5733\",\"5734\",\"5735\",\"5736\",\"5737\",\"5738\",\"5739\",\"5740\",\"5741\",\"5742\",\"5743\",\"5744\",\"5745\",\"5746\",\"5747\",\"5748\",\"5749\",\"5750\",\"5751\",\"5752\",\"5753\",\"5754\",\"5755\",\"5756\",\"5757\",\"5758\",\"5759\",\"5760\",\"5761\",\"5762\",\"5763\",\"5764\",\"5765\",\"15880\",\"15881\",\"15882\",\"15883\",\"15884\",\"15885\",\"15886\",\"15887\",\"15888\",\"15889\",\"15890\",\"15891\",\"15892\",\"15893\",\"15894\",\"15895\",\"15896\",\"15897\",\"15898\",\"15899\",\"15900\",\"15901\",\"15902\",\"15903\",\"15904\",\"15905\",\"15906\",\"15907\",\"15908\",\"15909\",\"15910\",\"15911\",\"15912\",\"15913\",\"15914\",\"15915\",\"15916\",\"15917\",\"15918\",\"5766\",\"5767\",\"5768\",\"5770\",\"5771\",\"5773\",\"5775\",\"5776\",\"5777\",\"5778\",\"5779\",\"5780\",\"5781\",\"5782\",\"5783\",\"5784\",\"5785\",\"5786\",\"5787\",\"5788\",\"5789\",\"5790\",\"5813\",\"5814\",\"5815\",\"5816\",\"5817\",\"5818\",\"5819\",\"5820\",\"5821\",\"5822\",\"5823\",\"5824\",\"5825\",\"5826\",\"5827\",\"5828\",\"5829\",\"5830\",\"5831\",\"5832\",\"5833\",\"5834\",\"5835\",\"5836\",\"5837\",\"5852\",\"5853\",\"5854\",\"5855\",\"5856\",\"5857\",\"5858\",\"5859\",\"5860\",\"5861\",\"5862\",\"5863\",\"5864\",\"5865\",\"5866\",\"15919\",\"15920\",\"15921\",\"15923\",\"15924\",\"15926\",\"15928\",\"15929\",\"15930\",\"15931\",\"15932\",\"15933\",\"15934\",\"15935\",\"15936\",\"15937\",\"15938\",\"15939\",\"15940\",\"15941\",\"15942\",\"15943\",\"15966\",\"15967\",\"15968\",\"15969\",\"15970\",\"15971\",\"15972\",\"15973\",\"15974\",\"15975\",\"15976\",\"15977\",\"15978\",\"15979\",\"15980\",\"15981\",\"15982\",\"15983\",\"15984\",\"15985\",\"15986\",\"15987\",\"15988\",\"15989\",\"15990\",\"16005\",\"16006\",\"16007\",\"16008\",\"16009\",\"16010\",\"16011\",\"16012\",\"16013\",\"16014\",\"16015\",\"16016\",\"16017\",\"16018\",\"16019\",\"5769\",\"5772\",\"5774\",\"15922\",\"15925\",\"15927\",\"5791\",\"9830\",\"9831\",\"9832\",\"15944\",\"5792\",\"9833\",\"9834\",\"9835\",\"15945\",\"5793\",\"15946\",\"5794\",\"15947\",\"5795\",\"9836\",\"9837\",\"9838\",\"15948\",\"5796\",\"5806\",\"9839\",\"9840\",\"9841\",\"9857\",\"9858\",\"9861\",\"15949\",\"15959\",\"5797\",\"9842\",\"9843\",\"9844\",\"15950\",\"5798\",\"15951\",\"5799\",\"9845\",\"9846\",\"9847\",\"15952\",\"5800\",\"9848\",\"9849\",\"9850\",\"15953\",\"5801\",\"9851\",\"9852\",\"9853\",\"15954\",\"5802\",\"9854\",\"9855\",\"9856\",\"15955\",\"5803\",\"15956\",\"5804\",\"15957\",\"5805\",\"15958\",\"5807\",\"5808\",\"5809\",\"5810\",\"5811\",\"5812\",\"5838\",\"5839\",\"5840\",\"5841\",\"5842\",\"5843\",\"5844\",\"5845\",\"5846\",\"5847\",\"5848\",\"5849\",\"5850\",\"5851\",\"5867\",\"5868\",\"5869\",\"5870\",\"5871\",\"5872\",\"5873\",\"5874\",\"5875\",\"5876\",\"5877\",\"5878\",\"5879\",\"5880\",\"5881\",\"15960\",\"15961\",\"15962\",\"15963\",\"15964\",\"15965\",\"15991\",\"15992\",\"15993\",\"15994\",\"15995\",\"15996\",\"15997\",\"15998\",\"15999\",\"16000\",\"16001\",\"16002\",\"16003\",\"16004\",\"16020\",\"16021\",\"16022\",\"16023\",\"16024\",\"16025\",\"16026\",\"16027\",\"16028\",\"16029\",\"16030\",\"16031\",\"16032\",\"16033\",\"16034\",\"5882\",\"5883\",\"5884\",\"5885\",\"5886\",\"5887\",\"5888\",\"5889\",\"5890\",\"5891\",\"5892\",\"5893\",\"5894\",\"5895\",\"5896\",\"5897\",\"5898\",\"5899\",\"5900\",\"5901\",\"5902\",\"5903\",\"5904\",\"5905\",\"5906\",\"5907\",\"16035\",\"16036\",\"16037\",\"16038\",\"16039\",\"16040\",\"16041\",\"16042\",\"16043\",\"16044\",\"16045\",\"16046\",\"16047\",\"16048\",\"16049\",\"16050\",\"16051\",\"16052\",\"16053\",\"16054\",\"16055\",\"16056\",\"16057\",\"16058\",\"16059\",\"16060\",\"5908\",\"5909\",\"5910\",\"5911\",\"5912\",\"5913\",\"5914\",\"5915\",\"5916\",\"5917\",\"5918\",\"5919\",\"5920\",\"5921\",\"5922\",\"5923\",\"5924\",\"5925\",\"5926\",\"5927\",\"5928\",\"5929\",\"5930\",\"5931\",\"5932\",\"5933\",\"5934\",\"5935\",\"5936\",\"5937\",\"5938\",\"5939\",\"5940\",\"5941\",\"5942\",\"5943\",\"5944\",\"5945\",\"5946\",\"5947\",\"5948\",\"5949\",\"5950\",\"5951\",\"5952\",\"5953\",\"5954\",\"5955\",\"5956\",\"5957\",\"5958\",\"5959\",\"5960\",\"5961\",\"5962\",\"5963\",\"5964\",\"5965\",\"5966\",\"5967\",\"5968\",\"5969\",\"5970\",\"5971\",\"5972\",\"5973\",\"5974\",\"5975\",\"5976\",\"5977\",\"5978\",\"5979\",\"5980\",\"5981\",\"5982\",\"5983\",\"5984\",\"5985\",\"5986\",\"5987\",\"5988\",\"5989\",\"5990\",\"5991\",\"5992\",\"5993\",\"5994\",\"5995\",\"5996\",\"5997\",\"5998\",\"5999\",\"6000\",\"6001\",\"6002\",\"6003\",\"6004\",\"6005\",\"6006\",\"6007\",\"6008\",\"6009\",\"6010\",\"6011\",\"6012\",\"6013\",\"6014\",\"6015\",\"6016\",\"6017\",\"6018\",\"6019\",\"6020\",\"6021\",\"6022\",\"6023\",\"6024\",\"6025\",\"6026\",\"6027\",\"6028\",\"6029\",\"6030\",\"6031\",\"6032\",\"6033\",\"6034\",\"6035\",\"6036\",\"6037\",\"6038\",\"6039\",\"6040\",\"6041\",\"6042\",\"6043\",\"6044\",\"6045\",\"6046\",\"6047\",\"6048\",\"6049\",\"6050\",\"6051\",\"6052\",\"6053\",\"6054\",\"6055\",\"6056\",\"16061\",\"16062\",\"16063\",\"16064\",\"16065\",\"16066\",\"16067\",\"16068\",\"16069\",\"16070\",\"16071\",\"16072\",\"16073\",\"16074\",\"16075\",\"16076\",\"16077\",\"16078\",\"16079\",\"16080\",\"16081\",\"16082\",\"16083\",\"16084\",\"16085\",\"16086\",\"16087\",\"16088\",\"16089\",\"16090\",\"16091\",\"16092\",\"16093\",\"16094\",\"16095\",\"16096\",\"16097\",\"16098\",\"16099\",\"16100\",\"16101\",\"16102\",\"16103\",\"16104\",\"16105\",\"16106\",\"16107\",\"16108\",\"16109\",\"16110\",\"16111\",\"16112\",\"16113\",\"16114\",\"16115\",\"16116\",\"16117\",\"16118\",\"16119\",\"16120\",\"16121\",\"16122\",\"16123\",\"16124\",\"16125\",\"16126\",\"16127\",\"16128\",\"16129\",\"16130\",\"16131\",\"16132\",\"16133\",\"16134\",\"16135\",\"16136\",\"16137\",\"16138\",\"16139\",\"16140\",\"16141\",\"16142\",\"16143\",\"16144\",\"16145\",\"16146\",\"16147\",\"16148\",\"16149\",\"16150\",\"16151\",\"16152\",\"16153\",\"16154\",\"16155\",\"16156\",\"16157\",\"16158\",\"16159\",\"16160\",\"16161\",\"16162\",\"16163\",\"16164\",\"16165\",\"16166\",\"16167\",\"16168\",\"16169\",\"16170\",\"16171\",\"16172\",\"16173\",\"16174\",\"16175\",\"16176\",\"16177\",\"16178\",\"16179\",\"16180\",\"16181\",\"16182\",\"16183\",\"16184\",\"16185\",\"16186\",\"16187\",\"16188\",\"16189\",\"16190\",\"16191\",\"16192\",\"16193\",\"16194\",\"16195\",\"16196\",\"16197\",\"16198\",\"16199\",\"16200\",\"16201\",\"16202\",\"16203\",\"16204\",\"16205\",\"16206\",\"16207\",\"16208\",\"16209\",\"6057\",\"6058\",\"6059\",\"6060\",\"6061\",\"6062\",\"6063\",\"6064\",\"6065\",\"6066\",\"6067\",\"6068\",\"6069\",\"6070\",\"6071\",\"6072\",\"6073\",\"6074\",\"6075\",\"6076\",\"6077\",\"6078\",\"6079\",\"6080\",\"6081\",\"6082\",\"6083\",\"6084\",\"6085\",\"6086\",\"6087\",\"6088\",\"6089\",\"6090\",\"6091\",\"6092\",\"6093\",\"6094\",\"6095\",\"6096\",\"6097\",\"6098\",\"6099\",\"6100\",\"6101\",\"6102\",\"6103\",\"6104\",\"6105\",\"6106\",\"6107\",\"6108\",\"6109\",\"6110\",\"6111\",\"6112\",\"6113\",\"6114\",\"6115\",\"6116\",\"6117\",\"6118\",\"6119\",\"6120\",\"6121\",\"6122\",\"6123\",\"6124\",\"6125\",\"6126\",\"6127\",\"6128\",\"6129\",\"6130\",\"6131\",\"6132\",\"6133\",\"6134\",\"6135\",\"6136\",\"6137\",\"6138\",\"6139\",\"6140\",\"6141\",\"6142\",\"6143\",\"6144\",\"6145\",\"6146\",\"6147\",\"6148\",\"6149\",\"6150\",\"6151\",\"6152\",\"6153\",\"6154\",\"6155\",\"6156\",\"6157\",\"6158\",\"6159\",\"6160\",\"6161\",\"6162\",\"6163\",\"6164\",\"6165\",\"6166\",\"6167\",\"6168\",\"6169\",\"6170\",\"6171\",\"6172\",\"6173\",\"6174\",\"6175\",\"6176\",\"6177\",\"6178\",\"6179\",\"6180\",\"6181\",\"6182\",\"6183\",\"6184\",\"6185\",\"6186\",\"6187\",\"6188\",\"6189\",\"6190\",\"6191\",\"6192\",\"6193\",\"6194\",\"6195\",\"6196\",\"6197\",\"6198\",\"6199\",\"6200\",\"6201\",\"6202\",\"6203\",\"6204\",\"6205\",\"6206\",\"6207\",\"6208\",\"6209\",\"6210\",\"6211\",\"6212\",\"6213\",\"6214\",\"6215\",\"6216\",\"6217\",\"6218\",\"6219\",\"6220\",\"6221\",\"6222\",\"6223\",\"6224\",\"6225\",\"6226\",\"6227\",\"6228\",\"6229\",\"6230\",\"6231\",\"6232\",\"6233\",\"6234\",\"6235\",\"6236\",\"6237\",\"6238\",\"6239\",\"6240\",\"6241\",\"6242\",\"6243\",\"6244\",\"6245\",\"6246\",\"6247\",\"6248\",\"6249\",\"6250\",\"6251\",\"6252\",\"6253\",\"6254\",\"6255\",\"6256\",\"6257\",\"6258\",\"6259\",\"6260\",\"6261\",\"6262\",\"6263\",\"6264\",\"6265\",\"6266\",\"6267\",\"6268\",\"6269\",\"6270\",\"6271\",\"6272\",\"6273\",\"6274\",\"6275\",\"6276\",\"6277\",\"6278\",\"6279\",\"6280\",\"6281\",\"6282\",\"6283\",\"6284\",\"6285\",\"6286\",\"6287\",\"6288\",\"6289\",\"6290\",\"6291\",\"6292\",\"6293\",\"6294\",\"6295\",\"6296\",\"6297\",\"6298\",\"6299\",\"6300\",\"6301\",\"6302\",\"6303\",\"6304\",\"6305\",\"6306\",\"6307\",\"6308\",\"6309\",\"6310\",\"6311\",\"6312\",\"6313\",\"6314\",\"6315\",\"6316\",\"6317\",\"6318\",\"6319\",\"6320\",\"6321\",\"6322\",\"6323\",\"6324\",\"6325\",\"6326\",\"6327\",\"6328\",\"6329\",\"6330\",\"6331\",\"6332\",\"6333\",\"6334\",\"6335\",\"6336\",\"6337\",\"6338\",\"6339\",\"6340\",\"6341\",\"6342\",\"6343\",\"6344\",\"6345\",\"6346\",\"6347\",\"6348\",\"6349\",\"6350\",\"6351\",\"6352\",\"6353\",\"6354\",\"6355\",\"6356\",\"6357\",\"6358\",\"6359\",\"6360\",\"6361\",\"6362\",\"6363\",\"6364\",\"6365\",\"6366\",\"6367\",\"6368\",\"6369\",\"6370\",\"6381\",\"6382\",\"6383\",\"6384\",\"6385\",\"6386\",\"6387\",\"6388\",\"6389\",\"6390\",\"6391\",\"6392\",\"6393\",\"6394\",\"6395\",\"6396\",\"6397\",\"6398\",\"6399\",\"6400\",\"6401\",\"6402\",\"6403\",\"6404\",\"6405\",\"6406\",\"6407\",\"6408\",\"6409\",\"6410\",\"6411\",\"16210\",\"16211\",\"16212\",\"16213\",\"16214\",\"16215\",\"16216\",\"16217\",\"16218\",\"16219\",\"16220\",\"16221\",\"16222\",\"16223\",\"16224\",\"16225\",\"16226\",\"16227\",\"16228\",\"16229\",\"16230\",\"16231\",\"16232\",\"16233\",\"16234\",\"16235\",\"16236\",\"16237\",\"16238\",\"16239\",\"16240\",\"16241\",\"16242\",\"16243\",\"16244\",\"16245\",\"16246\",\"16247\",\"16248\",\"16249\",\"16250\",\"16251\",\"16252\",\"16253\",\"16254\",\"16255\",\"16256\",\"16257\",\"16258\",\"16259\",\"16260\",\"16261\",\"16262\",\"16263\",\"16264\",\"16265\",\"16266\",\"16267\",\"16268\",\"16269\",\"16270\",\"16271\",\"16272\",\"16273\",\"16274\",\"16275\",\"16276\",\"16277\",\"16278\",\"16279\",\"16280\",\"16281\",\"16282\",\"16283\",\"16284\",\"16285\",\"16286\",\"16287\",\"16288\",\"16289\",\"16290\",\"16291\",\"16292\",\"16293\",\"16294\",\"16295\",\"16296\",\"16297\",\"16298\",\"16299\",\"16300\",\"16301\",\"16302\",\"16303\",\"16304\",\"16305\",\"16306\",\"16307\",\"16308\",\"16309\",\"16310\",\"16311\",\"16312\",\"16313\",\"16314\",\"16315\",\"16316\",\"16317\",\"16318\",\"16319\",\"16320\",\"16321\",\"16322\",\"16323\",\"16324\",\"16325\",\"16326\",\"16327\",\"16328\",\"16329\",\"16330\",\"16331\",\"16332\",\"16333\",\"16334\",\"16335\",\"16336\",\"16337\",\"16338\",\"16339\",\"16340\",\"16341\",\"16342\",\"16343\",\"16344\",\"16345\",\"16346\",\"16347\",\"16348\",\"16349\",\"16350\",\"16351\",\"16352\",\"16353\",\"16354\",\"16355\",\"16356\",\"16357\",\"16358\",\"16359\",\"16360\",\"16361\",\"16362\",\"16363\",\"16364\",\"16365\",\"16366\",\"16367\",\"16368\",\"16369\",\"16370\",\"16371\",\"16372\",\"16373\",\"16374\",\"16375\",\"16376\",\"16377\",\"16378\",\"16379\",\"16380\",\"16381\",\"16382\",\"16383\",\"16384\",\"16385\",\"16386\",\"16387\",\"16388\",\"16389\",\"16390\",\"16391\",\"16392\",\"16393\",\"16394\",\"16395\",\"16396\",\"16397\",\"16398\",\"16399\",\"16400\",\"16401\",\"16402\",\"16403\",\"16404\",\"16405\",\"16406\",\"16407\",\"16408\",\"16409\",\"16410\",\"16411\",\"16412\",\"16413\",\"16414\",\"16415\",\"16416\",\"16417\",\"16418\",\"16419\",\"16420\",\"16421\",\"16422\",\"16423\",\"16424\",\"16425\",\"16426\",\"16427\",\"16428\",\"16429\",\"16430\",\"16431\",\"16432\",\"16433\",\"16434\",\"16435\",\"16436\",\"16437\",\"16438\",\"16439\",\"16440\",\"16441\",\"16442\",\"16443\",\"16444\",\"16445\",\"16446\",\"16447\",\"16448\",\"16449\",\"16450\",\"16451\",\"16452\",\"16453\",\"16454\",\"16455\",\"16456\",\"16457\",\"16458\",\"16459\",\"16460\",\"16461\",\"16462\",\"16463\",\"16464\",\"16465\",\"16466\",\"16467\",\"16468\",\"16469\",\"16470\",\"16471\",\"16472\",\"16473\",\"16474\",\"16475\",\"16476\",\"16477\",\"16478\",\"16479\",\"16480\",\"16481\",\"16482\",\"16483\",\"16484\",\"16485\",\"16486\",\"16487\",\"16488\",\"16489\",\"16490\",\"16491\",\"16492\",\"16493\",\"16494\",\"16495\",\"16496\",\"16497\",\"16498\",\"16499\",\"16500\",\"16501\",\"16502\",\"16503\",\"16504\",\"16505\",\"16506\",\"16507\",\"16508\",\"16509\",\"16510\",\"16511\",\"16512\",\"16513\",\"16514\",\"16515\",\"16516\",\"16517\",\"16518\",\"16519\",\"16520\",\"16521\",\"16522\",\"16523\",\"16534\",\"16535\",\"16536\",\"16537\",\"16538\",\"16539\",\"16540\",\"16541\",\"16542\",\"16543\",\"16544\",\"16545\",\"16546\",\"16547\",\"16548\",\"16549\",\"16550\",\"16551\",\"16552\",\"16553\",\"16554\",\"16555\",\"16556\",\"16557\",\"16558\",\"16559\",\"16560\",\"16561\",\"16562\",\"16563\",\"16564\",\"6371\",\"6372\",\"6373\",\"6374\",\"6375\",\"6376\",\"6377\",\"6378\",\"6379\",\"6380\",\"16524\",\"16525\",\"16526\",\"16527\",\"16528\",\"16529\",\"16530\",\"16531\",\"16532\",\"16533\",\"6412\",\"6413\",\"6414\",\"6415\",\"6416\",\"6417\",\"6418\",\"6419\",\"6420\",\"6421\",\"6422\",\"6424\",\"6426\",\"6427\",\"6429\",\"6431\",\"6433\",\"6434\",\"6435\",\"6436\",\"6437\",\"6438\",\"6439\",\"6442\",\"6443\",\"6456\",\"6457\",\"6458\",\"6459\",\"6460\",\"6461\",\"6462\",\"6463\",\"6464\",\"6465\",\"6466\",\"6467\",\"6468\",\"6469\",\"6470\",\"6471\",\"6472\",\"6473\",\"6474\",\"6475\",\"6476\",\"6477\",\"6478\",\"6479\",\"6480\",\"6481\",\"6482\",\"6483\",\"6484\",\"6485\",\"6486\",\"6487\",\"6488\",\"6489\",\"6490\",\"6491\",\"6492\",\"6493\",\"6494\",\"6495\",\"6496\",\"6497\",\"6498\",\"6499\",\"6500\",\"6501\",\"6502\",\"6504\",\"6505\",\"6506\",\"6507\",\"6508\",\"6509\",\"6510\",\"6511\",\"6512\",\"6513\",\"6514\",\"6515\",\"6516\",\"6517\",\"6518\",\"6519\",\"6520\",\"6521\",\"6522\",\"6523\",\"6524\",\"6525\",\"6526\",\"6527\",\"6528\",\"6529\",\"6530\",\"6531\",\"6532\",\"6533\",\"6534\",\"6535\",\"6536\",\"6537\",\"6538\",\"6539\",\"6540\",\"6541\",\"6542\",\"6543\",\"6544\",\"6545\",\"6546\",\"6547\",\"6548\",\"6549\",\"6550\",\"6551\",\"6552\",\"6554\",\"6555\",\"6556\",\"6557\",\"6558\",\"6559\",\"6560\",\"6561\",\"6562\",\"6563\",\"6564\",\"6565\",\"6566\",\"6567\",\"6568\",\"6569\",\"6570\",\"6571\",\"6573\",\"6574\",\"6575\",\"6577\",\"6578\",\"6579\",\"6580\",\"6582\",\"6583\",\"6585\",\"6588\",\"6589\",\"6590\",\"16565\",\"16566\",\"16567\",\"16568\",\"16569\",\"16570\",\"16571\",\"16572\",\"16573\",\"16574\",\"16575\",\"16577\",\"16579\",\"16580\",\"16582\",\"16584\",\"16586\",\"16587\",\"16588\",\"16589\",\"16590\",\"16591\",\"16592\",\"16595\",\"16596\",\"16609\",\"16610\",\"16611\",\"16612\",\"16613\",\"16614\",\"16615\",\"16616\",\"16617\",\"16618\",\"16619\",\"16620\",\"16621\",\"16622\",\"16623\",\"16624\",\"16625\",\"16626\",\"16627\",\"16628\",\"16629\",\"16630\",\"16631\",\"16632\",\"16633\",\"16634\",\"16635\",\"16636\",\"16637\",\"16638\",\"16639\",\"16640\",\"16641\",\"16642\",\"16643\",\"16644\",\"16645\",\"16646\",\"16647\",\"16648\",\"16649\",\"16650\",\"16651\",\"16652\",\"16653\",\"16654\",\"16655\",\"16657\",\"16658\",\"16659\",\"16660\",\"16661\",\"16662\",\"16663\",\"16664\",\"16665\",\"16666\",\"16667\",\"16668\",\"16669\",\"16670\",\"16671\",\"16672\",\"16673\",\"16674\",\"16675\",\"16676\",\"16677\",\"16678\",\"16679\",\"16680\",\"16681\",\"16682\",\"16683\",\"16684\",\"16685\",\"16686\",\"16687\",\"16688\",\"16689\",\"16690\",\"16691\",\"16692\",\"16693\",\"16694\",\"16695\",\"16696\",\"16697\",\"16698\",\"16699\",\"16700\",\"16701\",\"16702\",\"16703\",\"16704\",\"16705\",\"16707\",\"16708\",\"16709\",\"16710\",\"16711\",\"16712\",\"16713\",\"16714\",\"16715\",\"16716\",\"16717\",\"16718\",\"16719\",\"16720\",\"16721\",\"16722\",\"16723\",\"16724\",\"16726\",\"16727\",\"16728\",\"16730\",\"16731\",\"16732\",\"16733\",\"16735\",\"16736\",\"16738\",\"16741\",\"16742\",\"16743\",\"6423\",\"6428\",\"6430\",\"6432\",\"6440\",\"6441\",\"16576\",\"16581\",\"16583\",\"16585\",\"16593\",\"16594\",\"6425\",\"16578\",\"6444\",\"6445\",\"6446\",\"6447\",\"6448\",\"6449\",\"6450\",\"6451\",\"6452\",\"6453\",\"6454\",\"6455\",\"6581\",\"6587\",\"6592\",\"6593\",\"16597\",\"16598\",\"16599\",\"16600\",\"16601\",\"16602\",\"16603\",\"16604\",\"16605\",\"16606\",\"16607\",\"16608\",\"16734\",\"16740\",\"16745\",\"16746\",\"6503\",\"16656\",\"6553\",\"16706\",\"6572\",\"6591\",\"16725\",\"16744\",\"6576\",\"6584\",\"16729\",\"16737\",\"6586\",\"16739\",\"6660\",\"16813\",\"6661\",\"16814\",\"6662\",\"16815\",\"6665\",\"6666\",\"6667\",\"6668\",\"6669\",\"6670\",\"6671\",\"6672\",\"6673\",\"6674\",\"16818\",\"16819\",\"16820\",\"16821\",\"16822\",\"16823\",\"16824\",\"16825\",\"16826\",\"16827\",\"6675\",\"6676\",\"6677\",\"6678\",\"6679\",\"6680\",\"6681\",\"6682\",\"6683\",\"6684\",\"6685\",\"6686\",\"6687\",\"6688\",\"6689\",\"6690\",\"6691\",\"6692\",\"6693\",\"6694\",\"6695\",\"6696\",\"6697\",\"6698\",\"6699\",\"6700\",\"6701\",\"6702\",\"6703\",\"6704\",\"6705\",\"16828\",\"16829\",\"16830\",\"16831\",\"16832\",\"16833\",\"16834\",\"16835\",\"16836\",\"16837\",\"16838\",\"16839\",\"16840\",\"16841\",\"16842\",\"16843\",\"16844\",\"16845\",\"16846\",\"16847\",\"16848\",\"16849\",\"16850\",\"16851\",\"16852\",\"16853\",\"16854\",\"16855\",\"16856\",\"16857\",\"16858\",\"6706\",\"6707\",\"6708\",\"6709\",\"6710\",\"6711\",\"6712\",\"6713\",\"6714\",\"6715\",\"6716\",\"6717\",\"6718\",\"6719\",\"6720\",\"6721\",\"6722\",\"6771\",\"6772\",\"6773\",\"6774\",\"6775\",\"6776\",\"6777\",\"6778\",\"6779\",\"6780\",\"6781\",\"6782\",\"6783\",\"6784\",\"6785\",\"6786\",\"6787\",\"6788\",\"6789\",\"6790\",\"6800\",\"6801\",\"6802\",\"6803\",\"6804\",\"6805\",\"6806\",\"6807\",\"6808\",\"6824\",\"6825\",\"16859\",\"16860\",\"16861\",\"16862\",\"16863\",\"16864\",\"16865\",\"16866\",\"16867\",\"16868\",\"16869\",\"16870\",\"16871\",\"16872\",\"16873\",\"16874\",\"16875\",\"16924\",\"16925\",\"16926\",\"16927\",\"16928\",\"16929\",\"16930\",\"16931\",\"16932\",\"16933\",\"16934\",\"16935\",\"16936\",\"16937\",\"16938\",\"16939\",\"16940\",\"16941\",\"16942\",\"16943\",\"16953\",\"16954\",\"16955\",\"16956\",\"16957\",\"16958\",\"16959\",\"16960\",\"16961\",\"16977\",\"16978\",\"6723\",\"6724\",\"6725\",\"6726\",\"6727\",\"6728\",\"6729\",\"6730\",\"6731\",\"6732\",\"6733\",\"16876\",\"16877\",\"16878\",\"16879\",\"16880\",\"16881\",\"16882\",\"16883\",\"16884\",\"16885\",\"16886\",\"6734\",\"6735\",\"6736\",\"6737\",\"6738\",\"6739\",\"6740\",\"6741\",\"6742\",\"6743\",\"6744\",\"6745\",\"6746\",\"6747\",\"6748\",\"6749\",\"6750\",\"6751\",\"6752\",\"6753\",\"6755\",\"6756\",\"6757\",\"6758\",\"6759\",\"6760\",\"6761\",\"6762\",\"6763\",\"6764\",\"6765\",\"6766\",\"6767\",\"6768\",\"6769\",\"6770\",\"6809\",\"6810\",\"6811\",\"6812\",\"6813\",\"6814\",\"6815\",\"6816\",\"6817\",\"6818\",\"6819\",\"6820\",\"6821\",\"6822\",\"6823\",\"6831\",\"6832\",\"6833\",\"6834\",\"6835\",\"6836\",\"6837\",\"6838\",\"6839\",\"6840\",\"6841\",\"16887\",\"16888\",\"16889\",\"16890\",\"16891\",\"16892\",\"16893\",\"16894\",\"16895\",\"16896\",\"16897\",\"16898\",\"16899\",\"16900\",\"16901\",\"16902\",\"16903\",\"16904\",\"16905\",\"16906\",\"16908\",\"16909\",\"16910\",\"16911\",\"16912\",\"16913\",\"16914\",\"16915\",\"16916\",\"16917\",\"16918\",\"16919\",\"16920\",\"16921\",\"16922\",\"16923\",\"16962\",\"16963\",\"16964\",\"16965\",\"16966\",\"16967\",\"16968\",\"16969\",\"16970\",\"16971\",\"16972\",\"16973\",\"16974\",\"16975\",\"16976\",\"16984\",\"16985\",\"16986\",\"16987\",\"16988\",\"16989\",\"16990\",\"16991\",\"16992\",\"16993\",\"16994\",\"6754\",\"6791\",\"6792\",\"6793\",\"6794\",\"6795\",\"6796\",\"6797\",\"6798\",\"6799\",\"6842\",\"6843\",\"6844\",\"6845\",\"6846\",\"6847\",\"6848\",\"6849\",\"6850\",\"6851\",\"6852\",\"6853\",\"6854\",\"6855\",\"6856\",\"6857\",\"6858\",\"6859\",\"6860\",\"6861\",\"6862\",\"6863\",\"6864\",\"6865\",\"6866\",\"6867\",\"6868\",\"6869\",\"6870\",\"16907\",\"16944\",\"16945\",\"16946\",\"16947\",\"16948\",\"16949\",\"16950\",\"16951\",\"16952\",\"16995\",\"16996\",\"16997\",\"16998\",\"16999\",\"17000\",\"17001\",\"17002\",\"17003\",\"17004\",\"17005\",\"17006\",\"17007\",\"17008\",\"17009\",\"17010\",\"17011\",\"17012\",\"17013\",\"17014\",\"17015\",\"17016\",\"17017\",\"17018\",\"17019\",\"17020\",\"17021\",\"17022\",\"17023\",\"6826\",\"6827\",\"6828\",\"6829\",\"6830\",\"16979\",\"16980\",\"16981\",\"16982\",\"16983\",\"6871\",\"6872\",\"6873\",\"6874\",\"6875\",\"17024\",\"17025\",\"17026\",\"17027\",\"17028\",\"6876\",\"17029\",\"6877\",\"6878\",\"6879\",\"6880\",\"6881\",\"6882\",\"6883\",\"6884\",\"6885\",\"6886\",\"6887\",\"6888\",\"6889\",\"6890\",\"6891\",\"6892\",\"6893\",\"6894\",\"6895\",\"6896\",\"6897\",\"6898\",\"6899\",\"6900\",\"6901\",\"6902\",\"6903\",\"6904\",\"6905\",\"6906\",\"6907\",\"6908\",\"6909\",\"6910\",\"6911\",\"6912\",\"6913\",\"6914\",\"6915\",\"6916\",\"6917\",\"6918\",\"6919\",\"6920\",\"6921\",\"6922\",\"6923\",\"6924\",\"6925\",\"6926\",\"6927\",\"6928\",\"6929\",\"6930\",\"6931\",\"6932\",\"6933\",\"6934\",\"6935\",\"6936\",\"6937\",\"6938\",\"6939\",\"6940\",\"6941\",\"17030\",\"17031\",\"17032\",\"17033\",\"17034\",\"17035\",\"17036\",\"17037\",\"17038\",\"17039\",\"17040\",\"17041\",\"17042\",\"17043\",\"17044\",\"17045\",\"17046\",\"17047\",\"17048\",\"17049\",\"17050\",\"17051\",\"17052\",\"17053\",\"17054\",\"17055\",\"17056\",\"17057\",\"17058\",\"17059\",\"17060\",\"17061\",\"17062\",\"17063\",\"17064\",\"17065\",\"17066\",\"17067\",\"17068\",\"17069\",\"17070\",\"17071\",\"17072\",\"17073\",\"17074\",\"17075\",\"17076\",\"17077\",\"17078\",\"17079\",\"17080\",\"17081\",\"17082\",\"17083\",\"17084\",\"17085\",\"17086\",\"17087\",\"17088\",\"17089\",\"17090\",\"17091\",\"17092\",\"17093\",\"17094\",\"17095\",\"17096\",\"17097\",\"17098\",\"17099\",\"17162\",\"17163\",\"17164\",\"17165\",\"17166\",\"17167\",\"17168\",\"17169\",\"17170\",\"17171\",\"17172\",\"17173\",\"17174\",\"17175\",\"17176\",\"17177\",\"17178\",\"17179\",\"17180\",\"17181\",\"17182\",\"17183\",\"17184\",\"17185\",\"17186\",\"17187\",\"17188\",\"17189\",\"17190\",\"17191\",\"17192\",\"17193\",\"17194\",\"17238\",\"17239\",\"17240\",\"17241\",\"17242\",\"17243\",\"17244\",\"17245\",\"17246\",\"17247\",\"17248\",\"17249\",\"17250\",\"17251\",\"17252\",\"17253\",\"17254\",\"17255\",\"17256\",\"17257\",\"17258\",\"17259\",\"17260\",\"17261\",\"17262\",\"17263\",\"17264\",\"17265\",\"17266\",\"17267\",\"17268\",\"17269\",\"17270\",\"17271\",\"17308\",\"17309\",\"17310\",\"17311\",\"17312\",\"17313\",\"17314\",\"17315\",\"17316\",\"17317\",\"17318\",\"17319\",\"17320\",\"6997\",\"6996\",\"6995\",\"6994\",\"6993\",\"6992\",\"6991\",\"6990\",\"6989\",\"6988\",\"6987\",\"6986\",\"6985\",\"6984\",\"6983\",\"6982\",\"6981\",\"6980\",\"6979\",\"6978\",\"6977\",\"6976\",\"6975\",\"6974\",\"6973\",\"6972\",\"6971\",\"6970\",\"6969\",\"6968\",\"6967\",\"6966\",\"6965\",\"6964\",\"6963\",\"6962\",\"6961\",\"6960\",\"6959\",\"6958\",\"6957\",\"6956\",\"6955\",\"6954\",\"6953\",\"6952\",\"6951\",\"6950\",\"6949\",\"6948\",\"6947\",\"6946\",\"6945\",\"6943\",\"6944\",\"6942\",\"6998\",\"6999\",\"7000\",\"7001\",\"7002\",\"7003\",\"7004\",\"7005\",\"7006\",\"7007\",\"7008\",\"7009\",\"7010\",\"7011\",\"7012\",\"7013\",\"7014\",\"7015\",\"7016\",\"7017\",\"7018\",\"7019\",\"7020\",\"7021\",\"7022\",\"7023\",\"7024\",\"7025\",\"7026\",\"7027\",\"7028\",\"7029\",\"7030\",\"7031\",\"7032\",\"7033\",\"7034\",\"7035\",\"7036\",\"7037\",\"7038\",\"7039\",\"7040\",\"7041\",\"7042\",\"7043\",\"7044\",\"7045\",\"7046\",\"7047\",\"7048\",\"7049\",\"7050\",\"7051\",\"7052\",\"7053\",\"7054\",\"7055\",\"7056\",\"7057\",\"7058\",\"7059\",\"7060\",\"7061\",\"7062\",\"7063\",\"7064\",\"7065\",\"7066\",\"7067\",\"7068\",\"7069\",\"7070\",\"7071\",\"7072\",\"7073\",\"7074\",\"7075\",\"7076\",\"7077\",\"7078\",\"7079\",\"7080\",\"7081\",\"7082\",\"7083\",\"7084\",\"7085\",\"7086\",\"7087\",\"7088\",\"7089\",\"7090\",\"7091\",\"7092\",\"7093\",\"7094\",\"7095\",\"7096\",\"7097\",\"7098\",\"7099\",\"7100\",\"7101\",\"7102\",\"7103\",\"7104\",\"7105\",\"7106\",\"7107\",\"7108\",\"7109\",\"7110\",\"7111\",\"7112\",\"7113\",\"7114\",\"7115\",\"7116\",\"7117\",\"7118\",\"7119\",\"7120\",\"7121\",\"7122\",\"7123\",\"7124\",\"7125\",\"7126\",\"7127\",\"7128\",\"7129\",\"7130\",\"7131\",\"7132\",\"7133\",\"7134\",\"7135\",\"7136\",\"7137\",\"7138\",\"7139\",\"7140\",\"7141\",\"7142\",\"7143\",\"7144\",\"7145\",\"7146\",\"7147\",\"7148\",\"7149\",\"7150\",\"7151\",\"7152\",\"7153\",\"7154\",\"7155\",\"7156\",\"7157\",\"7158\",\"7159\",\"7160\",\"7161\",\"7162\",\"7163\",\"7164\",\"7165\",\"7166\",\"7167\",\"7168\",\"7169\",\"7170\",\"7171\",\"7172\",\"7173\",\"7174\",\"7175\",\"7176\",\"7177\",\"7178\",\"7179\",\"7180\",\"7181\",\"7182\",\"7183\",\"7184\",\"7185\",\"7186\",\"7187\",\"7188\",\"7189\",\"7190\",\"7191\",\"7192\",\"7193\",\"7194\",\"7195\",\"7196\",\"7197\",\"7198\",\"7199\",\"7200\",\"7201\",\"7202\",\"7203\",\"7204\",\"7205\",\"7206\",\"7207\",\"7208\",\"7209\",\"7210\",\"7211\",\"7212\",\"7213\",\"7214\",\"7215\",\"7216\",\"7217\",\"7218\",\"7219\",\"7220\",\"7221\",\"7222\",\"7223\",\"7224\",\"7225\",\"7226\",\"7227\",\"7228\",\"7229\",\"7230\",\"7231\",\"7232\",\"7233\",\"7234\",\"7235\",\"7236\",\"7237\",\"7238\",\"7239\",\"7240\",\"7241\",\"7242\",\"7243\",\"7244\",\"7245\",\"7246\",\"7247\",\"7248\",\"7249\",\"7250\",\"7251\",\"7252\",\"7253\",\"7254\",\"7255\",\"7256\",\"7257\",\"7258\",\"7259\",\"7260\",\"7261\",\"7262\",\"7263\",\"7266\",\"7267\",\"7273\",\"7274\",\"7275\",\"7279\",\"7280\",\"7264\",\"7265\",\"7268\",\"7269\",\"7270\",\"7271\",\"7272\",\"7276\",\"7277\",\"7278\",\"7281\",\"7282\",\"7283\",\"7284\",\"7285\",\"7286\",\"7287\",\"7288\",\"7289\",\"7290\",\"7291\",\"7292\",\"7293\",\"7294\",\"7295\",\"7296\",\"7297\",\"7298\",\"7299\",\"7300\",\"7301\",\"7302\",\"7303\",\"7304\",\"7305\",\"7306\",\"7307\",\"7308\",\"7309\",\"7310\",\"7311\",\"7312\",\"7313\",\"7314\",\"7315\",\"7316\",\"7317\",\"7318\",\"7319\",\"7320\",\"7321\",\"7322\",\"7323\",\"7324\",\"7325\",\"7326\",\"7327\",\"7328\",\"7329\",\"7330\",\"7331\",\"7332\",\"7333\",\"7334\",\"7336\",\"7337\",\"7338\",\"7339\",\"7340\",\"7341\",\"7342\",\"7343\",\"7344\",\"7345\",\"7346\",\"7347\",\"7348\",\"7349\",\"7350\",\"7351\",\"7352\",\"7353\",\"7354\",\"7355\",\"7356\",\"7357\",\"7358\",\"7359\",\"7360\",\"7361\",\"7362\",\"7363\",\"7364\",\"7365\",\"7366\",\"7367\",\"7368\",\"7369\",\"7370\",\"7371\",\"7372\",\"7373\",\"7374\",\"7375\",\"7376\",\"7377\",\"7378\",\"7379\",\"7380\",\"7381\",\"7382\",\"7383\",\"7384\",\"7385\",\"7386\",\"7387\",\"7388\",\"7389\",\"7390\",\"7391\",\"7392\",\"7393\",\"7394\",\"7395\",\"7396\",\"7397\",\"7398\",\"7399\",\"7400\",\"7401\",\"7402\",\"7403\",\"7404\",\"7405\",\"7406\",\"7407\",\"7408\",\"7409\",\"7410\",\"7411\",\"7412\",\"7413\",\"7414\",\"7415\",\"7416\",\"7417\",\"7418\",\"7419\",\"7420\",\"7421\",\"7422\",\"7423\",\"7424\",\"7425\",\"7426\",\"7427\",\"7428\",\"7429\",\"7430\",\"7431\",\"7432\",\"7433\",\"7434\",\"7435\",\"7436\",\"7437\",\"7438\",\"7439\",\"7440\",\"7441\",\"7442\",\"7443\",\"7444\",\"7445\",\"7446\",\"7447\",\"7448\",\"7449\",\"7450\",\"7451\",\"7452\",\"7453\",\"7454\",\"7455\",\"7456\",\"7457\",\"7458\",\"7459\",\"7460\",\"7461\",\"7462\",\"7463\",\"7464\",\"7465\",\"7466\",\"7467\",\"7335\",\"7468\",\"7469\",\"7470\",\"7471\",\"7472\",\"7473\",\"7474\",\"7475\",\"7476\",\"7477\",\"7478\",\"7479\",\"7480\",\"7481\",\"7482\",\"7483\",\"7484\",\"7485\",\"7486\",\"7487\",\"7488\",\"7489\",\"7490\",\"7491\",\"7492\",\"7493\",\"7494\",\"7495\",\"7496\",\"7497\",\"7498\",\"7499\",\"7500\",\"7501\",\"7502\",\"7503\",\"7504\",\"7505\",\"7506\",\"7507\",\"7508\",\"7509\",\"7510\",\"7511\",\"7512\",\"7513\",\"7514\",\"7515\",\"7516\",\"7517\",\"7518\",\"7519\",\"7520\",\"7521\",\"7522\",\"7523\",\"7524\",\"7525\",\"7526\",\"7527\",\"7528\",\"7529\",\"7530\",\"7531\",\"7532\",\"7533\",\"7534\",\"7535\",\"7536\",\"7537\",\"7538\",\"7539\",\"7540\",\"7541\",\"7542\",\"7543\",\"7544\",\"7545\",\"7548\",\"7549\",\"7550\",\"7551\",\"7552\",\"7553\",\"7554\",\"7555\",\"7556\",\"7557\",\"7558\",\"7559\",\"7560\",\"7561\",\"7562\",\"7563\",\"7564\",\"7565\",\"7566\",\"7567\",\"7568\",\"7569\",\"7570\",\"7571\",\"7572\",\"7573\",\"7574\",\"7575\",\"7576\",\"7577\",\"7578\",\"7579\",\"7580\",\"7581\",\"7582\",\"7583\",\"7584\",\"7585\",\"7586\",\"7587\",\"7588\",\"7589\",\"7590\",\"7591\",\"7592\",\"7593\",\"7594\",\"7595\",\"7596\",\"7597\",\"7598\",\"7599\",\"7600\",\"7601\",\"7602\",\"7603\",\"7604\",\"7605\",\"7606\",\"7607\",\"7608\",\"7609\",\"7610\",\"7611\",\"7612\",\"7613\",\"7614\",\"7615\",\"7616\",\"7617\",\"7618\",\"7619\",\"7620\",\"7621\",\"7622\",\"7623\",\"7624\",\"7625\",\"7626\",\"7627\",\"7628\",\"7629\",\"7630\",\"7631\",\"7632\",\"7633\",\"7634\",\"7635\",\"7636\",\"7637\",\"7638\",\"7639\",\"7640\",\"7641\",\"7642\",\"7643\",\"7644\",\"7645\",\"7646\",\"7647\",\"7648\",\"7649\",\"7650\",\"7651\",\"7652\",\"7653\",\"7654\",\"7655\",\"7656\",\"7657\",\"7658\",\"7659\",\"7660\",\"7661\",\"7662\",\"7663\",\"7664\",\"7665\",\"7666\",\"7667\",\"7668\",\"7669\",\"7670\",\"7671\",\"7672\",\"7673\",\"7674\",\"7675\",\"7546\",\"7547\",\"7676\",\"7677\",\"7678\",\"7679\",\"7680\",\"7681\",\"7682\",\"7683\",\"7684\",\"7685\",\"7686\",\"7687\",\"7688\",\"7689\",\"7690\",\"7691\",\"7692\",\"7693\",\"7694\",\"7695\",\"7696\",\"7697\",\"7698\",\"7699\",\"7700\",\"7701\",\"7702\",\"7703\",\"7704\",\"7705\",\"7706\",\"7707\",\"7708\",\"7709\",\"7710\",\"7711\",\"7712\",\"7713\",\"7714\",\"7715\",\"7716\",\"7717\",\"7718\",\"7719\",\"7720\",\"7721\",\"7722\",\"7723\",\"7724\",\"7725\",\"7726\",\"7727\",\"7728\",\"7729\",\"7730\",\"7731\",\"7732\",\"7733\",\"7734\",\"7735\",\"7736\",\"7737\",\"7738\",\"7739\",\"7740\",\"7741\",\"7742\",\"7743\",\"7744\",\"7745\",\"7746\",\"7747\",\"7748\",\"7749\",\"7750\",\"7751\",\"7752\",\"7753\",\"7754\",\"7755\",\"7756\",\"7757\",\"7758\",\"7759\",\"7760\",\"7761\",\"7762\",\"7763\",\"7764\",\"7765\",\"7766\",\"7767\",\"7768\",\"7769\",\"7770\",\"7771\",\"7772\",\"7773\",\"7774\",\"7775\",\"7776\",\"7777\",\"7778\",\"7779\",\"7780\",\"7781\",\"7782\",\"7783\",\"7784\",\"7785\",\"7786\",\"7787\",\"7788\",\"7789\",\"7790\",\"7791\",\"7792\",\"7793\",\"7794\",\"7795\",\"7796\",\"7797\",\"7798\",\"7799\",\"7800\",\"7801\",\"7802\",\"7803\",\"7804\",\"7805\",\"7806\",\"7807\",\"7808\",\"7809\",\"7810\",\"7811\",\"7812\",\"7813\",\"7814\",\"7815\",\"7816\",\"7817\",\"7818\",\"7819\",\"7820\",\"7821\",\"7822\",\"7823\",\"7824\",\"7825\",\"7826\",\"7827\",\"7828\",\"7829\",\"7830\",\"7831\",\"7832\",\"7833\",\"7834\",\"7835\",\"7836\",\"7837\",\"7838\",\"7839\",\"7840\",\"7841\",\"7842\",\"7843\",\"7844\",\"7845\",\"7846\",\"7847\",\"7848\",\"7849\",\"7850\",\"7851\",\"7852\",\"7853\",\"7854\",\"7855\",\"7856\",\"7857\",\"7858\",\"7859\",\"7860\",\"7861\",\"7862\",\"7863\",\"7864\",\"7865\",\"7866\",\"7867\",\"7868\",\"7869\",\"7870\",\"7871\",\"7872\",\"7873\",\"7874\",\"7875\",\"7876\",\"7877\",\"7878\",\"7879\",\"7880\",\"7881\",\"7882\",\"7883\",\"7884\",\"7885\",\"7886\",\"7887\",\"7888\",\"7889\",\"7890\",\"7891\",\"7892\",\"7893\",\"7894\",\"7895\",\"7896\",\"7897\",\"7898\",\"7899\",\"7900\",\"7901\",\"7902\",\"7903\",\"7904\",\"7905\",\"7906\",\"7907\",\"7908\",\"7909\",\"7910\",\"7911\",\"7912\",\"7913\",\"7914\",\"7915\",\"7916\",\"7917\",\"7918\",\"7919\",\"7920\",\"7921\",\"7922\",\"7923\",\"7924\",\"7925\",\"7926\",\"7927\",\"7928\",\"7929\",\"7930\",\"7931\",\"7932\",\"7933\",\"7934\",\"7935\",\"7936\",\"7937\",\"7938\",\"7939\",\"7940\",\"7941\",\"7942\",\"7943\",\"7944\",\"7945\",\"7946\",\"7947\",\"7948\",\"7949\",\"7950\",\"7951\",\"7952\",\"7953\",\"7954\",\"7955\",\"7956\",\"7957\",\"7958\",\"7959\",\"7960\",\"7961\",\"7962\",\"7963\",\"7964\",\"7965\",\"7966\",\"7967\",\"7968\",\"7969\",\"7970\",\"7971\",\"7972\",\"7973\",\"7974\",\"7975\",\"7976\",\"7977\",\"7978\",\"7979\",\"7980\",\"7981\",\"7982\",\"7983\",\"7984\",\"7985\",\"7986\",\"7987\",\"7988\",\"7989\",\"7990\",\"7991\",\"7992\",\"7993\",\"7994\",\"7995\",\"7996\",\"7997\",\"7998\",\"7999\",\"8000\",\"8001\",\"8002\",\"8003\",\"8004\",\"8005\",\"8006\",\"8007\",\"8008\",\"8009\",\"8010\",\"8011\",\"8012\",\"8013\",\"8014\",\"8015\",\"8016\",\"8017\",\"8018\",\"8019\",\"8020\",\"8021\",\"8022\",\"8023\",\"8024\",\"8025\",\"8026\",\"8027\",\"8028\",\"8029\",\"8030\",\"8031\",\"8032\",\"8033\",\"8034\",\"8035\",\"8036\",\"8037\",\"8038\",\"8039\",\"8040\",\"8041\",\"8042\",\"8043\",\"8044\",\"8045\",\"8046\",\"8047\",\"8048\",\"8049\",\"8050\",\"8051\",\"8052\",\"8053\",\"8054\",\"8055\",\"8056\",\"8057\",\"8058\",\"8059\",\"8060\",\"8061\",\"8062\",\"8063\",\"8064\",\"8065\",\"8066\",\"8067\",\"8068\",\"8069\",\"8070\",\"8071\",\"8072\",\"8073\",\"8074\",\"8075\",\"8076\",\"8077\",\"8078\",\"8079\",\"8080\",\"8081\",\"8082\",\"8083\",\"8084\",\"8085\",\"8086\",\"8087\",\"8088\",\"8089\",\"8090\",\"8091\",\"8092\",\"8093\",\"8094\",\"8095\",\"8096\",\"8097\",\"8098\",\"8099\",\"8100\",\"8101\",\"8102\",\"8103\",\"8104\",\"8105\",\"8106\",\"8107\",\"8108\",\"8109\",\"8110\",\"8111\",\"8112\",\"8113\",\"8114\",\"8115\",\"8116\",\"8117\",\"8118\",\"8119\",\"8120\",\"8121\",\"8122\",\"8123\",\"8124\",\"8125\",\"8126\",\"8127\",\"8128\",\"8129\",\"8130\",\"8131\",\"8132\",\"8133\",\"8134\",\"8135\",\"8136\",\"8137\",\"8138\",\"8139\",\"8140\",\"8141\",\"8142\",\"8143\",\"8144\",\"8145\",\"8146\",\"8147\",\"8148\",\"8149\",\"8150\",\"8151\",\"8152\",\"8153\",\"8154\",\"8155\",\"8156\",\"8157\",\"8158\",\"8159\",\"8160\",\"8161\",\"8162\",\"8163\",\"8164\",\"8165\",\"8166\",\"8167\",\"8168\",\"8169\",\"8170\",\"8171\",\"8172\",\"8173\",\"8174\",\"8175\",\"8176\",\"8177\",\"8178\",\"8179\",\"8180\",\"8181\",\"8182\",\"8183\",\"8184\",\"8185\",\"8186\",\"8187\",\"8188\",\"8189\",\"8190\",\"8191\",\"8192\",\"8193\",\"8194\",\"8195\",\"8196\",\"8197\",\"8198\",\"8199\",\"8200\",\"8201\",\"8202\",\"8203\",\"8204\",\"8205\",\"8206\",\"8207\",\"8208\",\"8209\",\"8210\",\"8211\",\"8212\",\"8213\",\"8214\",\"8215\",\"8216\",\"8217\",\"8218\",\"8219\",\"8220\",\"8221\",\"8222\",\"8223\",\"8224\",\"8225\",\"8226\",\"8227\",\"8228\",\"8229\",\"8230\",\"8231\",\"8232\",\"8233\",\"8234\",\"8235\",\"8236\",\"8237\",\"8238\",\"8239\",\"8240\",\"8241\",\"8242\",\"8243\",\"8244\",\"8245\",\"8246\",\"8247\",\"8248\",\"8249\",\"8250\",\"8251\",\"8252\",\"8253\",\"8254\",\"8255\",\"8256\",\"8257\",\"8258\",\"8259\",\"8260\",\"8261\",\"8262\",\"8263\",\"8264\",\"8265\",\"8266\",\"8267\",\"8268\",\"8269\",\"8270\",\"8271\",\"8272\",\"8273\",\"8274\",\"8275\",\"8276\",\"8277\",\"8278\",\"8279\",\"8280\",\"8281\",\"8282\",\"8283\",\"8284\",\"8285\",\"8286\",\"8287\",\"8288\",\"8289\",\"8290\",\"8291\",\"8292\",\"8293\",\"8294\",\"8295\",\"8296\",\"8297\",\"8298\",\"8299\",\"8300\",\"8301\",\"8302\",\"8303\",\"8304\",\"8305\",\"8306\",\"8307\",\"8308\",\"8309\",\"8310\",\"8311\",\"8312\",\"8313\",\"8314\",\"8315\",\"8316\",\"8317\",\"8318\",\"8319\",\"8320\",\"8321\",\"8322\",\"8323\",\"8324\",\"8325\",\"8326\",\"8327\",\"8328\",\"8329\",\"8330\",\"8331\",\"8332\",\"8333\",\"8334\",\"8335\",\"8336\",\"8337\",\"8338\",\"8339\",\"8340\",\"8341\",\"8342\",\"8343\",\"8344\",\"8345\",\"8346\",\"8347\",\"8348\",\"8349\",\"8350\",\"8351\",\"8352\",\"8353\",\"8354\",\"8355\",\"8356\",\"8357\",\"8358\",\"8359\",\"8360\",\"8361\",\"8362\",\"8363\",\"8364\",\"8365\",\"8366\",\"8367\",\"8368\",\"8369\",\"8370\",\"8371\",\"8372\",\"8373\",\"8374\",\"8375\",\"8376\",\"8377\",\"8378\",\"8379\",\"8380\",\"8381\",\"8382\",\"8383\",\"8384\",\"8385\",\"8386\",\"8387\",\"8388\",\"8389\",\"8390\",\"8391\",\"8392\",\"8393\",\"8394\",\"8395\",\"8396\",\"8397\",\"8398\",\"8399\",\"8400\",\"8401\",\"8402\",\"8403\",\"8404\",\"8405\",\"8406\",\"8407\",\"8408\",\"8409\",\"8411\",\"8412\",\"8413\",\"8415\",\"8410\",\"8414\",\"8416\",\"8417\",\"8418\",\"8419\",\"8420\",\"8421\",\"8422\",\"8423\",\"8424\",\"8425\",\"8426\",\"8427\",\"8428\",\"8429\",\"8430\",\"8431\",\"8432\",\"8433\",\"8434\",\"8435\",\"8436\",\"8437\",\"8438\",\"8439\",\"8440\",\"8441\",\"8442\",\"8443\",\"8444\",\"8445\",\"8446\",\"8447\",\"8448\",\"8449\",\"8450\",\"8451\",\"8452\",\"8453\",\"8454\",\"8455\",\"8456\",\"8457\",\"8458\",\"8459\",\"8460\",\"8461\",\"8462\",\"8463\",\"8464\",\"8465\",\"8466\",\"8467\",\"8468\",\"8469\",\"8470\",\"8471\",\"8472\",\"8473\",\"8474\",\"8475\",\"8476\",\"8477\",\"8478\",\"8479\",\"8480\",\"8481\",\"8482\",\"8483\",\"8484\",\"8485\",\"8486\",\"8487\",\"8488\",\"8489\",\"8490\",\"8491\",\"8492\",\"8493\",\"8494\",\"8495\",\"8496\",\"8497\",\"8498\",\"8499\",\"8500\",\"8501\",\"8502\",\"8503\",\"8504\",\"8505\",\"8506\",\"8507\",\"8508\",\"8509\",\"8510\",\"8511\",\"8512\",\"8513\",\"8514\",\"8515\",\"8516\",\"8517\",\"8518\",\"8519\",\"8520\",\"8521\",\"8522\",\"8523\",\"8524\",\"8525\",\"8526\",\"8527\",\"8528\",\"8529\",\"8530\",\"8531\",\"8532\",\"8533\",\"8534\",\"8535\",\"8536\",\"8537\",\"8538\",\"8539\",\"8540\",\"8541\",\"8542\",\"8543\",\"8544\",\"8545\",\"8546\",\"8547\",\"8548\",\"8549\",\"8550\",\"8551\",\"8552\",\"8553\",\"8554\",\"8555\",\"8556\",\"8557\",\"8558\",\"8559\",\"8560\",\"8561\",\"8562\",\"8563\",\"8564\",\"8565\",\"8566\",\"8567\",\"8568\",\"8569\",\"8570\",\"8571\",\"8572\",\"8573\",\"8574\",\"8575\",\"8576\",\"8577\",\"8578\",\"8579\",\"8580\",\"8581\",\"8582\",\"8583\",\"8584\",\"8585\",\"8586\",\"8587\",\"8588\",\"8589\",\"8590\",\"8591\",\"8592\",\"8593\",\"8594\",\"8595\",\"8596\",\"8597\",\"8598\",\"8599\",\"8600\",\"8601\",\"8602\",\"8603\",\"8604\",\"8605\",\"8606\",\"8607\",\"8608\",\"8609\",\"8610\",\"8611\",\"8612\",\"8613\",\"8614\",\"8615\",\"8616\",\"8617\",\"8618\",\"8619\",\"8620\",\"8621\",\"8622\",\"8623\",\"8624\",\"8625\",\"8626\",\"8627\",\"8628\",\"8629\",\"8630\",\"8631\",\"8632\",\"8633\",\"8634\",\"8635\",\"8636\",\"8637\",\"8638\",\"8639\",\"8640\",\"8641\",\"8642\",\"8643\",\"8644\",\"8645\",\"8646\",\"8647\",\"8648\",\"8649\",\"8650\",\"8651\",\"8652\",\"8653\",\"8654\",\"8655\",\"8656\",\"8657\",\"8658\",\"8659\",\"8660\",\"8661\",\"8662\",\"8663\",\"8664\",\"8665\",\"8666\",\"8667\",\"8668\",\"8669\",\"8670\",\"8671\",\"8672\",\"8673\",\"8674\",\"8675\",\"8676\",\"8677\",\"8678\",\"8679\",\"8680\",\"8681\",\"8682\",\"8683\",\"8684\",\"8685\",\"8686\",\"8687\",\"8688\",\"8689\",\"8690\",\"8691\",\"8692\",\"8693\",\"8694\",\"8695\",\"8696\",\"8697\",\"8698\",\"8699\",\"8700\",\"8701\",\"8702\",\"8703\",\"8704\",\"8705\",\"8706\",\"8707\",\"8708\",\"8709\",\"8710\",\"8711\",\"8712\",\"8713\",\"8714\",\"8715\",\"8716\",\"8717\",\"8718\",\"8719\",\"8720\",\"8721\",\"8722\",\"8723\",\"8724\",\"8725\",\"8726\",\"8727\",\"8728\",\"8729\",\"8730\",\"8731\",\"8732\",\"8733\",\"8734\",\"8735\",\"8736\",\"8737\",\"8738\",\"8739\",\"8740\",\"8741\",\"8742\",\"8743\",\"8744\",\"8745\",\"8746\",\"8747\",\"8748\",\"8749\",\"8750\",\"8751\",\"8752\",\"8753\",\"8754\",\"8755\",\"8756\",\"8757\",\"8758\",\"8759\",\"8760\",\"8761\",\"8762\",\"8763\",\"8764\",\"8765\",\"8766\",\"8767\",\"8768\",\"8769\",\"8770\",\"8771\",\"8772\",\"8773\",\"8774\",\"8775\",\"8776\",\"8777\",\"8778\",\"8779\",\"8780\",\"8781\",\"8782\",\"8783\",\"8784\",\"8785\",\"8786\",\"8787\",\"8788\",\"8789\",\"8790\",\"8791\",\"8792\",\"8793\",\"8794\",\"8795\",\"8796\",\"8797\",\"8798\",\"8799\",\"8800\",\"8801\",\"8802\",\"8803\",\"8804\",\"8805\",\"8806\",\"8807\",\"8808\",\"8809\",\"8810\",\"8811\",\"8812\",\"8813\",\"8814\",\"8815\",\"8816\",\"8817\",\"8818\",\"8819\",\"8820\",\"8821\",\"8822\",\"8823\",\"8824\",\"8825\",\"8826\",\"8827\",\"8828\",\"8829\",\"8830\",\"8831\",\"8832\",\"8833\",\"8834\",\"8835\",\"8836\",\"8837\",\"8838\",\"8839\",\"8840\",\"8841\",\"8842\",\"8843\",\"8844\",\"8845\",\"8846\",\"8847\",\"8848\",\"8849\",\"8850\",\"8851\",\"8852\",\"8853\",\"8854\",\"8855\",\"8856\",\"8857\",\"8858\",\"8859\",\"8860\",\"8861\",\"8862\",\"8863\",\"8864\",\"8865\",\"8866\",\"8867\",\"8868\",\"8869\",\"8870\",\"8871\",\"8872\",\"8873\",\"8874\",\"8875\",\"8876\",\"8877\",\"8878\",\"8879\",\"8880\",\"8881\",\"8882\",\"8883\",\"8884\",\"8885\",\"8886\",\"8887\",\"8888\",\"8889\",\"8890\",\"8891\",\"8892\",\"8893\",\"8894\",\"8895\",\"8896\",\"8897\",\"8898\",\"8899\",\"8900\",\"8901\",\"8902\",\"8903\",\"8904\",\"8905\",\"8906\",\"8907\",\"8908\",\"8909\",\"8910\",\"8911\",\"8912\",\"8913\",\"8914\",\"8915\",\"8916\",\"8917\",\"8918\",\"8919\",\"8920\",\"8921\",\"8922\",\"8923\",\"8924\",\"8925\",\"8926\",\"8927\",\"8928\",\"8929\",\"8930\",\"8931\",\"8932\",\"8933\",\"8934\",\"8935\",\"8936\",\"8937\",\"8938\",\"8939\",\"8940\",\"8941\",\"8942\",\"8943\",\"8944\",\"8945\",\"8946\",\"8947\",\"8948\",\"8949\",\"8950\",\"8951\",\"8952\",\"8953\",\"8954\",\"8955\",\"8956\",\"8957\",\"8958\",\"8959\",\"8960\",\"8961\",\"8962\",\"8963\",\"8964\",\"8965\",\"8966\",\"8967\",\"8968\",\"8969\",\"8970\",\"8971\",\"8972\",\"8973\",\"8974\",\"8975\",\"8976\",\"8977\",\"8978\",\"8979\",\"8980\",\"8981\",\"8982\",\"8983\",\"8984\",\"8985\",\"8986\",\"8987\",\"8988\",\"8989\",\"8990\",\"8991\",\"8992\",\"8993\",\"8994\",\"8995\",\"8996\",\"8997\",\"8998\",\"8999\",\"9000\",\"9001\",\"9002\",\"9003\",\"9004\",\"9005\",\"9006\",\"9007\",\"9008\",\"9009\",\"9010\",\"9011\",\"9012\",\"9013\",\"9014\",\"9015\",\"9016\",\"9017\",\"9018\",\"9019\",\"9020\",\"9021\",\"9022\",\"9023\",\"9024\",\"9025\",\"9026\",\"9027\",\"9028\",\"9029\",\"9030\",\"9031\",\"9032\",\"9033\",\"9034\",\"9038\",\"9039\",\"9040\",\"9041\",\"9042\",\"9043\",\"9044\",\"9045\",\"9046\",\"9047\",\"9048\",\"9049\",\"9050\",\"9051\",\"9052\",\"9053\",\"9054\",\"9055\",\"9056\",\"9057\",\"9058\",\"9059\",\"9060\",\"9061\",\"9062\",\"9063\",\"9064\",\"9065\",\"9066\",\"9067\",\"9068\",\"9069\",\"9070\",\"9071\",\"9072\",\"9073\",\"9074\",\"9075\",\"9076\",\"9077\",\"9078\",\"9079\",\"9080\",\"9081\",\"9082\",\"9083\",\"9084\",\"9085\",\"9086\",\"9087\",\"9088\",\"9089\",\"9090\",\"9091\",\"9092\",\"9093\",\"9094\",\"9095\",\"9096\",\"9097\",\"9098\",\"9099\",\"9100\",\"9101\",\"9102\",\"9103\",\"9104\",\"9105\",\"9106\",\"9107\",\"9108\",\"9109\",\"9110\",\"9111\",\"9112\",\"9113\",\"9114\",\"9115\",\"9116\",\"9117\",\"9118\",\"9119\",\"9120\",\"9121\",\"9125\",\"9126\",\"9127\",\"9035\",\"9036\",\"9037\",\"9122\",\"9123\",\"9124\",\"9128\",\"9129\",\"9130\",\"9131\",\"9132\",\"9133\",\"9134\",\"9135\",\"9136\",\"9137\",\"9138\",\"9139\",\"9140\",\"9141\",\"9142\",\"9143\",\"9144\",\"9145\",\"9146\",\"9147\",\"9148\",\"9149\",\"9150\",\"9151\",\"9152\",\"9153\",\"9154\",\"9155\",\"9156\",\"9157\",\"9158\",\"9159\",\"9160\",\"9161\",\"9162\",\"9163\",\"9164\",\"9165\",\"9166\",\"9167\",\"9168\",\"9169\",\"9170\",\"9171\",\"9172\",\"9173\",\"9174\",\"9175\",\"9176\",\"9177\",\"9178\",\"9179\",\"9180\",\"9181\",\"9182\",\"9183\",\"9184\",\"9185\",\"9186\",\"9187\",\"9188\",\"9189\",\"9190\",\"9191\",\"9192\",\"9193\",\"9194\",\"9195\",\"9196\",\"9197\",\"9198\",\"9199\",\"9200\",\"9201\",\"9202\",\"9203\",\"9204\",\"9205\",\"9206\",\"9207\",\"9208\",\"9209\",\"9210\",\"9211\",\"9212\",\"9213\",\"9214\",\"9215\",\"9216\",\"9217\",\"9218\",\"9219\",\"9220\",\"9221\",\"9222\",\"9223\",\"9224\",\"9225\",\"9226\",\"9227\",\"9228\",\"9229\",\"9230\",\"9231\",\"9232\",\"9233\",\"9234\",\"9235\",\"9239\",\"9240\",\"9241\",\"9242\",\"9243\",\"9244\",\"9245\",\"9246\",\"9247\",\"9248\",\"9249\",\"9250\",\"9251\",\"9252\",\"9253\",\"9254\",\"9255\",\"9256\",\"9257\",\"9258\",\"9259\",\"9260\",\"9261\",\"9262\",\"9263\",\"9264\",\"9265\",\"9266\",\"9267\",\"9268\",\"9269\",\"9270\",\"9271\",\"9236\",\"9237\",\"9238\",\"9272\",\"9273\",\"9274\",\"9275\",\"9276\",\"9277\",\"9278\",\"9279\",\"9280\",\"9281\",\"9282\",\"9283\",\"9284\",\"9285\",\"9286\",\"9287\",\"9288\",\"9289\",\"9290\",\"9291\",\"9292\",\"9293\",\"9294\",\"9295\",\"9296\",\"9297\",\"9298\",\"9299\",\"9300\",\"9301\",\"9302\",\"9303\",\"9304\",\"9305\",\"9306\",\"9307\",\"9308\",\"9309\",\"9310\",\"9311\",\"9312\",\"9313\",\"9314\",\"9315\",\"9316\",\"9317\",\"9318\",\"9319\",\"9320\",\"9321\",\"9322\",\"9323\",\"9324\",\"9325\",\"9326\",\"9327\",\"9328\",\"9329\",\"9330\",\"9331\",\"9332\",\"9333\",\"9334\",\"9335\",\"9336\",\"9337\",\"9338\",\"9339\",\"9340\",\"9341\",\"9342\",\"9343\",\"9344\",\"9345\",\"9346\",\"9347\",\"9348\",\"9349\",\"9350\",\"9351\",\"9352\",\"9353\",\"9354\",\"9355\",\"9356\",\"9357\",\"9358\",\"9359\",\"9360\",\"9361\",\"9362\",\"9363\",\"9364\",\"9365\",\"9366\",\"9367\",\"9368\",\"9369\",\"9370\",\"9371\",\"9372\",\"9373\",\"9374\",\"9375\",\"9376\",\"9377\",\"9378\",\"9379\",\"9380\",\"9381\",\"9382\",\"9383\",\"9384\",\"9385\",\"9386\",\"9387\",\"9388\",\"9389\",\"9390\",\"9391\",\"9392\",\"9393\",\"9394\",\"9395\",\"9396\",\"9397\",\"9398\",\"9399\",\"9400\",\"9401\",\"9402\",\"9403\",\"9404\",\"9405\",\"9406\",\"9407\",\"9408\",\"9409\",\"9410\",\"9411\",\"9412\",\"9413\",\"9414\",\"9417\",\"9415\",\"9416\",\"9418\",\"9419\",\"9420\",\"9421\",\"9422\",\"9423\",\"9424\",\"9425\",\"9426\",\"9427\",\"9428\",\"9429\",\"9430\",\"9431\",\"9432\",\"9433\",\"9434\",\"9435\",\"9436\",\"9437\",\"9438\",\"9439\",\"9440\",\"9441\",\"9442\",\"9443\",\"9444\",\"9445\",\"9446\",\"9447\",\"9448\",\"9449\",\"9450\",\"9451\",\"9452\",\"9453\",\"9454\",\"9455\",\"9456\",\"9457\",\"9458\",\"9459\",\"9460\",\"9461\",\"9462\",\"9463\",\"9464\",\"9465\",\"9466\",\"9467\",\"9468\",\"9469\",\"9470\",\"9471\",\"9472\",\"9473\",\"9474\",\"9475\",\"9476\",\"9477\",\"9478\",\"9479\",\"9480\",\"9481\",\"9482\",\"9483\",\"9484\",\"9485\",\"9486\",\"9487\",\"9488\",\"9489\",\"9490\",\"9524\",\"9525\",\"9526\",\"9527\",\"9528\",\"9529\",\"9530\",\"9531\",\"9532\",\"9533\",\"9534\",\"9535\",\"9536\",\"9537\",\"9538\",\"9539\",\"9540\",\"9541\",\"9542\",\"9543\",\"9544\",\"9545\",\"9546\",\"9547\",\"9548\",\"9549\",\"9550\",\"9551\",\"9552\",\"9553\",\"9554\",\"9555\",\"9556\",\"9557\",\"9558\",\"9559\",\"9560\",\"9561\",\"9562\",\"9563\",\"9564\",\"9565\",\"9566\",\"9567\",\"9568\",\"9569\",\"9570\",\"9571\",\"9572\",\"9573\",\"9574\",\"9575\",\"9576\",\"9577\",\"9578\",\"9579\",\"9580\",\"9581\",\"9582\",\"9583\",\"9584\",\"9585\",\"9586\",\"9587\",\"9588\",\"9589\",\"9590\",\"9591\",\"9592\",\"9593\",\"9594\",\"9595\",\"9596\",\"9597\",\"9598\",\"9599\",\"9600\",\"9601\",\"9602\",\"9603\",\"9604\",\"9605\",\"9606\",\"9607\",\"9608\",\"9609\",\"9610\",\"9611\",\"9612\",\"9613\",\"9614\",\"9615\",\"9616\",\"9617\",\"9618\",\"9619\",\"9620\",\"9621\",\"9622\",\"9623\",\"9624\",\"9625\",\"9626\",\"9627\",\"9628\",\"9629\",\"9630\",\"9631\",\"9632\",\"9633\",\"9634\",\"9635\",\"9636\",\"9637\",\"9638\",\"9639\",\"9640\",\"9641\",\"9642\",\"9643\",\"9644\",\"9645\",\"9646\",\"9647\",\"9648\",\"9649\",\"9650\",\"9651\",\"9652\",\"9653\",\"9654\",\"9655\",\"9656\",\"9657\",\"9658\",\"9659\",\"9660\",\"9661\",\"9662\",\"9663\",\"9664\",\"9665\",\"9666\",\"9667\",\"9668\",\"9669\",\"9670\",\"9671\",\"9672\",\"9673\",\"9674\",\"9675\",\"9676\",\"9677\",\"9678\",\"9679\",\"9680\",\"9681\",\"9682\",\"9683\",\"9684\",\"9685\",\"9686\",\"9687\",\"9688\",\"9689\",\"9690\",\"9691\",\"9692\",\"9693\",\"9694\",\"9695\",\"9696\",\"9697\",\"9698\",\"9699\",\"9700\",\"9701\",\"9702\",\"9703\",\"9704\",\"9705\",\"9706\",\"9707\",\"9708\",\"9709\",\"9710\",\"9711\",\"9712\",\"9713\",\"9714\",\"9715\",\"9716\",\"9717\",\"9718\",\"9719\",\"9720\",\"9721\",\"9722\",\"9723\",\"9724\",\"9725\",\"9726\",\"9727\",\"9728\",\"9729\",\"9730\",\"9731\",\"9732\",\"9733\",\"9734\",\"9735\",\"9736\",\"9737\",\"9738\",\"9739\",\"9740\",\"9741\",\"9742\",\"9743\",\"9744\",\"9745\",\"9746\",\"9747\",\"9748\",\"9749\",\"9750\",\"9751\",\"9752\",\"9753\",\"9754\",\"9755\",\"9756\",\"9757\",\"9758\",\"9759\",\"9760\",\"9761\",\"9762\",\"9763\",\"9764\",\"9765\",\"9766\",\"9767\",\"9768\",\"9769\",\"9770\",\"9771\",\"9772\",\"9773\",\"9774\",\"9775\",\"9776\",\"9777\",\"9778\",\"9779\",\"9780\",\"9781\",\"9782\",\"9783\",\"9784\",\"9785\",\"9786\",\"9787\",\"9788\",\"9789\",\"9790\",\"9791\",\"9792\",\"9793\",\"9794\",\"9795\",\"9796\",\"9797\",\"9798\",\"9799\",\"9800\",\"9801\",\"9802\",\"9803\",\"9804\",\"9805\",\"9806\",\"9807\",\"9808\",\"9809\",\"9810\",\"9811\",\"9812\",\"9813\",\"9814\",\"9815\",\"9816\",\"9817\",\"9818\",\"9819\",\"9820\",\"9821\",\"9822\",\"9823\",\"9824\",\"9825\",\"9826\",\"9827\",\"9828\",\"9829\",\"9859\",\"9860\",\"9862\",\"9863\",\"9864\",\"9865\",\"9866\",\"9867\",\"9868\",\"9869\",\"9870\",\"9871\",\"9872\",\"9873\",\"9874\",\"9875\",\"9876\",\"9877\",\"9878\",\"9879\",\"9880\",\"9881\",\"9882\",\"9883\",\"9884\",\"9885\",\"9886\",\"9887\",\"9888\",\"9889\",\"9890\",\"9891\",\"9892\",\"9893\",\"9894\",\"9895\",\"9896\",\"9897\",\"9898\",\"9899\",\"9900\",\"9901\",\"9902\",\"9903\",\"9904\",\"9905\",\"9906\",\"9907\",\"9908\",\"9909\",\"9910\",\"9911\",\"9912\",\"9913\",\"9914\",\"9915\",\"9916\",\"9917\",\"9918\",\"9919\",\"9920\",\"9921\",\"9922\",\"9923\",\"9924\",\"9925\",\"9926\",\"9927\",\"9928\",\"9929\",\"9930\",\"9931\",\"9932\",\"9933\",\"9934\",\"9935\",\"9936\",\"9937\",\"9938\",\"9939\",\"9940\",\"9941\",\"9942\",\"9943\",\"9944\",\"9945\",\"9946\",\"9947\",\"9948\",\"9949\",\"9950\",\"9951\",\"9952\",\"9953\",\"9954\",\"9955\",\"9956\",\"9957\",\"9958\",\"9959\",\"9960\",\"9961\",\"9962\",\"9963\",\"9964\",\"9965\",\"9966\",\"9967\",\"9968\",\"9969\",\"9970\",\"9971\",\"9972\",\"9973\",\"9974\",\"9975\",\"9976\",\"9977\",\"9978\",\"9979\",\"9980\",\"9981\",\"9982\",\"9983\",\"9984\",\"9985\",\"9986\",\"9987\",\"9988\",\"9989\",\"9990\",\"9991\",\"9992\",\"9993\",\"9994\",\"9995\",\"9996\",\"9997\",\"9998\",\"9999\",\"10000\",\"10001\",\"10002\",\"10003\",\"10004\",\"10005\",\"10006\",\"10007\",\"10008\",\"10009\",\"10010\",\"10011\",\"10012\",\"10013\",\"10014\",\"10015\",\"10016\",\"10017\",\"10018\",\"10019\",\"10020\",\"10021\",\"10022\",\"10023\",\"10024\",\"10025\",\"10026\",\"10027\",\"10028\",\"10029\",\"10030\",\"10031\",\"10032\",\"10033\",\"10034\",\"10035\",\"10036\",\"10037\",\"10038\",\"10039\",\"10040\",\"10041\",\"10042\",\"10043\",\"10044\",\"10045\",\"10046\",\"10047\",\"10048\",\"10049\",\"10050\",\"10051\",\"10052\",\"10053\",\"10054\",\"10151\",\"10152\",\"10153\",\"10154\",\"10155\",\"10156\",\"10157\",\"10158\",\"10159\",\"10160\",\"10161\",\"10162\",\"10163\",\"10164\",\"10165\",\"10166\",\"10167\",\"10168\",\"10169\",\"10170\",\"10171\",\"10172\",\"10173\",\"10174\",\"10175\",\"10176\",\"10177\",\"10178\",\"10179\",\"10180\",\"10181\",\"10182\",\"10183\",\"10184\",\"10185\",\"10186\",\"10187\",\"10188\",\"10189\",\"10190\",\"10191\",\"10192\",\"10193\",\"10194\",\"10195\",\"10196\",\"10197\",\"10198\",\"10523\",\"10524\",\"10525\",\"10526\",\"10527\",\"10528\",\"10529\",\"10530\",\"10531\",\"10532\",\"10533\",\"10534\",\"10535\",\"10536\",\"10537\",\"10538\",\"10539\",\"10540\",\"10541\",\"10542\",\"10543\",\"10544\",\"10545\",\"10546\",\"10547\",\"10548\",\"10549\",\"10550\",\"10551\",\"10552\",\"10553\",\"10554\",\"10555\",\"10556\",\"10557\",\"10558\",\"10559\",\"10560\",\"10561\",\"10562\",\"10563\",\"10564\",\"10055\",\"10056\",\"10057\",\"10058\",\"10059\",\"10060\",\"10061\",\"10062\",\"10063\",\"10064\",\"10065\",\"10066\",\"10067\",\"10068\",\"10069\",\"10070\",\"10071\",\"10072\",\"10073\",\"10074\",\"10075\",\"10076\",\"10077\",\"10078\",\"10079\",\"10080\",\"10081\",\"10082\",\"10083\",\"10084\",\"10085\",\"10086\",\"10087\",\"10088\",\"10089\",\"10090\",\"10091\",\"10092\",\"10093\",\"10094\",\"10095\",\"10096\",\"10097\",\"10098\",\"10099\",\"10100\",\"10101\",\"10102\",\"10103\",\"10104\",\"10105\",\"10106\",\"10107\",\"10108\",\"10109\",\"10110\",\"10111\",\"10112\",\"10113\",\"10114\",\"10115\",\"10116\",\"10117\",\"10118\",\"10119\",\"10120\",\"10121\",\"10122\",\"10123\",\"10124\",\"10125\",\"10126\",\"10127\",\"10128\",\"10129\",\"10130\",\"10131\",\"10132\",\"10133\",\"10134\",\"10135\",\"10136\",\"10137\",\"10138\",\"10139\",\"10140\",\"10141\",\"10142\",\"10143\",\"10144\",\"10145\",\"10146\",\"10147\",\"10148\",\"10149\",\"10150\",\"10199\",\"10200\",\"10201\",\"10202\",\"10203\",\"10204\",\"10205\",\"10206\",\"10207\",\"10208\",\"10209\",\"10210\",\"10211\",\"10212\",\"10213\",\"10214\",\"10215\",\"10216\",\"10217\",\"10218\",\"10219\",\"10220\",\"10221\",\"10222\",\"10223\",\"10224\",\"10225\",\"10226\",\"10227\",\"10228\",\"10229\",\"10230\",\"10231\",\"10232\",\"10233\",\"10234\",\"10235\",\"10236\",\"10237\",\"10238\",\"10239\",\"10240\",\"10241\",\"10242\",\"10243\",\"10244\",\"10245\",\"10246\",\"10247\",\"10248\",\"10249\",\"10250\",\"10251\",\"10252\",\"10253\",\"10254\",\"10255\",\"10256\",\"10257\",\"10258\",\"10259\",\"10260\",\"10261\",\"10262\",\"10263\",\"10264\",\"10265\",\"10266\",\"10267\",\"10268\",\"10269\",\"10270\",\"10271\",\"10272\",\"10273\",\"10274\",\"10275\",\"10276\",\"10277\",\"10278\",\"10279\",\"10280\",\"10281\",\"10282\",\"10283\",\"10284\",\"10285\",\"10286\",\"10287\",\"10288\",\"10289\",\"10290\",\"10291\",\"10292\",\"10293\",\"10294\",\"10295\",\"10296\",\"10297\",\"10298\",\"10299\",\"10300\",\"10301\",\"10302\",\"10303\",\"10304\",\"10305\",\"10306\",\"10307\",\"10308\",\"10309\",\"10310\",\"10311\",\"10312\",\"10313\",\"10314\",\"10315\",\"10316\",\"10317\",\"10318\",\"10319\",\"10320\",\"10321\",\"10322\",\"10323\",\"10324\",\"10325\",\"10326\",\"10327\",\"10328\",\"10329\",\"10330\",\"10331\",\"10332\",\"10333\",\"10334\",\"10335\",\"10336\",\"10337\",\"10338\",\"10339\",\"10340\",\"10341\",\"10342\",\"10343\",\"10344\",\"10345\",\"10346\",\"10347\",\"10348\",\"10349\",\"10350\",\"10351\",\"10352\",\"10353\",\"10354\",\"10355\",\"10356\",\"10357\",\"10358\",\"10359\",\"10360\",\"10361\",\"10362\",\"10363\",\"10364\",\"10365\",\"10366\",\"10565\",\"10566\",\"10567\",\"10568\",\"10569\",\"10570\",\"10571\",\"10572\",\"10573\",\"10574\",\"10575\",\"10576\",\"10577\",\"10578\",\"10579\",\"10580\",\"10581\",\"10582\",\"10583\",\"10584\",\"10585\",\"10586\",\"10587\",\"10588\",\"10589\",\"10590\",\"10591\",\"10592\",\"10593\",\"10594\",\"10595\",\"10596\",\"10597\",\"10598\",\"10599\",\"10600\",\"10601\",\"10602\",\"10603\",\"10604\",\"10605\",\"10606\",\"10607\",\"10608\",\"10609\",\"10610\",\"10611\",\"10612\",\"10613\",\"10614\",\"10615\",\"10616\",\"10617\",\"10618\",\"10619\",\"10620\",\"10621\",\"10622\",\"10623\",\"10624\",\"10625\",\"10626\",\"10627\",\"10628\",\"10629\",\"10630\",\"10631\",\"10632\",\"10633\",\"10634\",\"10635\",\"10636\",\"10637\",\"10638\",\"10639\",\"10640\",\"10641\",\"10642\",\"10643\",\"10644\",\"10645\",\"10646\",\"10647\",\"10648\",\"10649\",\"10650\",\"10651\",\"10652\",\"10653\",\"10654\",\"10655\",\"10656\",\"10657\",\"10658\",\"10659\",\"10660\",\"10661\",\"10662\",\"10663\",\"10664\",\"10665\",\"10666\",\"10667\",\"10668\",\"10669\",\"10670\",\"10671\",\"10672\",\"10673\",\"10674\",\"10675\",\"10676\",\"10677\",\"10678\",\"10679\",\"10680\",\"10681\",\"10682\",\"10683\",\"10684\",\"10685\",\"10686\",\"10687\",\"10688\",\"10689\",\"10690\",\"10691\",\"10692\",\"10693\",\"10694\",\"10695\",\"10696\",\"10697\",\"10698\",\"10699\",\"10700\",\"10701\",\"10702\",\"10703\",\"10704\",\"10705\",\"10706\",\"10707\",\"10708\",\"10709\",\"10710\",\"10711\",\"10712\",\"10713\",\"10714\",\"10715\",\"10716\",\"10717\",\"10718\",\"10719\",\"10720\",\"10721\",\"10722\",\"10723\",\"10724\",\"10725\",\"10726\",\"10727\",\"10728\",\"10729\",\"10730\",\"10731\",\"10732\",\"10733\",\"10734\",\"10735\",\"10736\",\"10737\",\"10738\",\"10739\",\"10740\",\"10741\",\"10742\",\"10743\",\"10744\",\"10745\",\"10746\",\"10747\",\"10748\",\"10749\",\"10750\",\"10805\",\"10806\",\"10807\",\"10808\",\"10809\",\"10810\",\"10811\",\"10812\",\"10813\",\"10814\",\"10815\",\"10816\",\"10817\",\"10818\",\"10819\",\"10820\",\"10821\",\"10822\",\"10823\",\"10824\",\"10825\",\"10826\",\"10827\",\"10828\",\"10829\",\"10830\",\"10831\",\"10832\",\"10833\",\"10834\",\"10367\",\"10368\",\"10369\",\"10370\",\"10371\",\"10372\",\"10373\",\"10374\",\"10375\",\"10376\",\"10377\",\"10378\",\"10379\",\"10380\",\"10381\",\"10382\",\"10383\",\"10384\",\"10385\",\"10386\",\"10387\",\"10388\",\"10389\",\"10390\",\"10391\",\"10392\",\"10393\",\"10394\",\"10395\",\"10396\",\"10397\",\"10398\",\"10399\",\"10400\",\"10401\",\"10402\",\"10403\",\"10404\",\"10405\",\"10406\",\"10407\",\"10408\",\"10409\",\"10410\",\"10411\",\"10412\",\"10413\",\"10414\",\"10415\",\"10416\",\"10417\",\"10418\",\"10419\",\"10420\",\"10421\",\"10422\",\"10423\",\"10424\",\"10425\",\"10426\",\"10427\",\"10428\",\"10429\",\"10430\",\"10431\",\"10432\",\"10433\",\"10434\",\"10435\",\"10436\",\"10437\",\"10438\",\"10439\",\"10440\",\"10441\",\"10442\",\"10443\",\"10444\",\"10445\",\"10446\",\"10447\",\"10448\",\"10449\",\"10450\",\"10451\",\"10452\",\"10453\",\"10454\",\"10455\",\"10456\",\"10457\",\"10458\",\"10459\",\"10460\",\"10461\",\"10462\",\"10463\",\"10464\",\"10465\",\"10466\",\"10467\",\"10468\",\"10469\",\"10470\",\"10471\",\"10472\",\"10473\",\"10474\",\"10475\",\"10476\",\"10477\",\"10478\",\"10479\",\"10480\",\"10481\",\"10482\",\"10483\",\"10484\",\"10485\",\"10486\",\"10487\",\"10488\",\"10489\",\"10490\",\"10491\",\"10492\",\"10493\",\"10494\",\"10495\",\"10496\",\"10497\",\"10498\",\"10499\",\"10500\",\"10501\",\"10502\",\"10503\",\"10504\",\"10505\",\"10506\",\"10507\",\"10508\",\"10509\",\"10510\",\"10511\",\"10512\",\"10513\",\"10514\",\"10515\",\"10516\",\"10517\",\"10518\",\"10519\",\"10520\",\"10521\",\"10522\",\"10751\",\"10752\",\"10753\",\"10754\",\"10755\",\"10756\",\"10757\",\"10758\",\"10759\",\"10760\",\"10761\",\"10762\",\"10763\",\"10764\",\"10765\",\"10766\",\"10767\",\"10768\",\"10769\",\"10770\",\"10771\",\"10772\",\"10773\",\"10774\",\"10775\",\"10776\",\"10777\",\"10778\",\"10779\",\"10780\",\"10781\",\"10782\",\"10783\",\"10784\",\"10785\",\"10786\",\"10787\",\"10788\",\"10789\",\"10790\",\"10791\",\"10792\",\"10793\",\"10794\",\"10795\",\"10796\",\"10797\",\"10798\",\"10799\",\"10800\",\"10801\",\"10802\",\"10803\",\"10804\",\"10835\",\"10836\",\"10837\",\"10838\",\"10839\",\"10840\",\"10841\",\"10842\",\"10843\",\"10844\",\"10845\",\"10846\",\"10847\",\"10848\",\"10849\",\"10850\",\"10851\",\"10852\",\"10853\",\"10854\",\"10855\",\"10856\",\"10857\",\"10858\",\"10859\",\"10860\",\"10861\",\"10862\",\"10863\",\"10864\",\"10865\",\"10866\",\"10867\",\"10868\",\"10869\",\"10870\",\"10871\",\"10872\",\"10873\",\"10874\",\"10875\",\"10876\",\"10877\",\"10878\",\"10879\",\"10880\",\"10881\",\"10882\",\"10883\",\"10884\",\"10885\",\"10886\",\"10887\",\"10888\",\"10889\",\"10890\",\"10891\",\"10892\",\"10893\",\"10894\",\"10895\",\"10896\",\"10897\",\"10898\",\"10899\",\"10900\",\"10901\",\"10902\",\"10903\",\"10904\",\"10905\",\"10906\",\"10907\",\"10908\",\"10909\",\"10910\",\"10911\",\"10912\",\"10913\",\"10914\",\"10915\",\"10916\",\"10917\",\"10918\",\"10919\",\"10920\",\"10921\",\"10922\",\"10923\",\"10924\",\"10925\",\"10926\",\"10927\",\"10928\",\"10929\",\"10930\",\"10931\",\"10932\",\"10933\",\"10934\",\"10935\",\"10936\",\"10937\",\"10938\",\"10939\",\"10940\",\"10941\",\"10942\",\"10943\",\"10944\",\"10945\",\"10946\",\"10947\",\"10948\",\"10949\",\"10950\",\"10951\",\"10952\",\"10953\",\"10954\",\"10955\",\"10956\",\"10957\",\"10958\",\"10959\",\"10960\",\"10961\",\"10962\",\"10963\",\"10964\",\"10965\",\"10966\",\"10967\",\"10968\",\"10969\",\"10970\",\"10971\",\"10972\",\"10973\",\"10974\",\"10975\",\"10976\",\"10977\",\"10978\",\"10979\",\"10980\",\"10981\",\"10982\",\"10983\",\"10984\",\"10985\",\"10986\",\"10987\",\"10988\",\"10989\",\"10990\",\"10991\",\"10992\",\"10993\",\"10994\",\"10995\",\"10996\",\"10997\",\"10998\",\"10999\",\"11000\",\"11001\",\"11002\",\"11003\",\"11004\",\"11005\",\"11006\",\"11007\",\"11008\",\"11009\",\"11010\",\"11011\",\"11012\",\"11013\",\"11014\",\"11015\",\"11016\",\"11017\",\"11018\",\"11019\",\"11020\",\"11021\",\"11022\",\"11023\",\"11024\",\"11025\",\"11026\",\"11027\",\"11028\",\"11029\",\"11030\",\"11031\",\"11032\",\"11033\",\"11034\",\"11035\",\"11036\",\"11037\",\"11038\",\"11039\",\"11040\",\"11041\",\"11042\",\"11043\",\"11044\",\"11045\",\"11046\",\"11047\",\"11048\",\"11049\",\"11050\",\"11051\",\"11052\",\"11053\",\"11054\",\"11055\",\"11056\",\"11057\",\"11058\",\"11059\",\"11060\",\"11061\",\"11062\",\"11063\",\"11064\",\"11065\",\"11066\",\"11067\",\"11068\",\"11069\",\"11070\",\"11071\",\"11072\",\"11073\",\"11074\",\"11075\",\"11076\",\"11077\",\"11078\",\"11079\",\"11080\",\"11081\",\"11082\",\"11083\",\"11084\",\"11085\",\"11086\",\"11087\",\"11088\",\"11089\",\"11090\",\"11091\",\"11092\",\"11093\",\"11094\",\"11095\",\"11096\",\"11097\",\"11098\",\"11099\",\"11100\",\"11101\",\"11102\",\"11103\",\"11104\",\"11105\",\"11106\",\"11107\",\"11108\",\"11109\",\"11110\",\"11111\",\"11112\",\"11113\",\"11114\",\"11115\",\"11116\",\"11117\",\"11118\",\"11119\",\"11120\",\"11121\",\"11122\",\"11123\",\"11124\",\"11125\",\"11126\",\"11127\",\"11128\",\"11129\",\"11130\",\"11131\",\"11132\",\"11133\",\"11134\",\"11135\",\"11136\",\"11137\",\"11138\",\"11139\",\"11140\",\"11147\",\"11148\",\"11149\",\"11156\",\"11157\",\"11158\",\"11159\",\"11160\",\"11161\",\"11162\",\"11163\",\"11164\",\"11165\",\"11166\",\"11167\",\"11168\",\"11169\",\"11170\",\"11171\",\"11172\",\"11173\",\"11174\",\"11175\",\"11176\",\"11177\",\"11178\",\"11179\",\"11180\",\"11181\",\"11182\",\"11183\",\"11184\",\"11185\",\"11186\",\"11187\",\"11188\",\"11189\",\"11190\",\"11191\",\"11192\",\"11193\",\"11194\",\"11195\",\"11196\",\"11197\",\"11198\",\"11199\",\"11200\",\"11201\",\"11202\",\"11203\",\"11204\",\"11205\",\"11206\",\"11207\",\"11208\",\"11209\",\"11210\",\"11211\",\"11212\",\"11213\",\"11214\",\"11215\",\"11216\",\"11217\",\"11218\",\"11219\",\"11220\",\"11221\",\"11222\",\"11223\",\"11224\",\"11225\",\"11226\",\"11227\",\"11228\",\"11229\",\"11230\",\"11231\",\"11232\",\"11233\",\"11234\",\"11235\",\"11236\",\"11237\",\"11238\",\"11239\",\"11240\",\"11241\",\"11242\",\"11243\",\"11244\",\"11245\",\"11246\",\"11247\",\"11248\",\"11249\",\"11250\",\"11251\",\"11252\",\"11253\",\"11254\",\"11255\",\"11256\",\"11257\",\"11258\",\"11259\",\"11260\",\"11261\",\"11262\",\"11263\",\"11264\",\"11265\",\"11266\",\"11267\",\"11268\",\"11269\",\"11270\",\"11271\",\"11272\",\"11273\",\"11274\",\"11275\",\"11276\",\"11277\",\"11278\",\"11279\",\"11280\",\"11281\",\"11282\",\"11283\",\"11284\",\"11285\",\"11286\",\"11287\",\"11288\",\"11289\",\"11290\",\"11291\",\"11292\",\"11293\",\"11294\",\"11295\",\"11296\",\"11297\",\"11298\",\"11299\",\"11300\",\"11301\",\"11302\",\"11303\",\"11304\",\"11305\",\"11514\",\"11518\",\"11520\",\"11524\",\"11527\",\"11530\",\"11533\",\"11534\",\"11537\",\"11541\",\"11544\",\"11546\",\"11549\",\"11552\",\"11554\",\"11557\",\"11560\",\"11564\",\"11568\",\"11570\",\"11573\",\"11577\",\"11579\",\"11583\",\"11586\",\"11589\",\"11591\",\"11595\",\"11598\",\"11600\",\"11603\",\"11606\",\"11609\",\"11611\",\"11613\",\"11617\",\"11620\",\"11622\",\"11624\",\"11628\",\"11632\",\"11636\",\"11640\",\"11642\",\"11646\",\"11648\",\"11651\",\"11654\",\"11657\",\"11660\",\"11663\",\"11667\",\"11670\",\"11672\",\"11675\",\"11678\",\"11683\",\"11685\",\"11688\",\"11691\",\"11694\",\"11696\",\"11700\",\"11704\",\"11706\",\"11709\",\"11713\",\"11715\",\"11719\",\"11722\",\"11724\",\"11727\",\"11730\",\"11733\",\"11736\",\"11739\",\"11741\",\"11746\",\"11749\",\"11750\",\"11753\",\"11756\",\"11759\",\"11762\",\"11765\",\"11768\",\"11773\",\"11775\",\"11777\",\"11781\",\"11784\",\"11786\",\"11791\",\"11794\",\"11795\",\"11799\",\"11801\",\"11804\",\"11807\",\"11812\",\"11815\",\"11817\",\"11819\",\"11822\",\"11824\",\"11828\",\"11831\",\"11833\",\"11836\",\"11839\",\"11844\",\"11848\",\"11306\",\"11307\",\"11308\",\"11309\",\"11310\",\"11311\",\"11312\",\"11313\",\"11314\",\"11315\",\"11316\",\"11317\",\"11318\",\"11319\",\"11320\",\"11321\",\"11322\",\"11323\",\"11324\",\"11325\",\"11326\",\"11327\",\"11328\",\"11329\",\"11330\",\"11331\",\"11332\",\"11333\",\"11334\",\"11335\",\"11336\",\"11337\",\"11338\",\"11339\",\"11340\",\"11341\",\"11342\",\"11343\",\"11344\",\"11345\",\"11346\",\"11347\",\"11348\",\"11349\",\"11350\",\"11351\",\"11352\",\"11353\",\"11354\",\"11355\",\"11356\",\"11357\",\"11358\",\"11359\",\"11360\",\"11361\",\"11362\",\"11363\",\"11364\",\"11365\",\"11366\",\"11367\",\"11368\",\"11369\",\"11370\",\"11371\",\"11372\",\"11373\",\"11374\",\"11375\",\"11376\",\"11377\",\"11378\",\"11379\",\"11380\",\"11381\",\"11382\",\"11383\",\"11384\",\"11385\",\"11386\",\"11387\",\"11388\",\"11389\",\"11390\",\"11391\",\"11392\",\"11393\",\"11394\",\"11395\",\"11396\",\"11397\",\"11398\",\"11399\",\"11400\",\"11401\",\"11402\",\"11403\",\"11404\",\"11405\",\"11406\",\"11407\",\"11408\",\"11409\",\"11410\",\"11411\",\"11412\",\"11413\",\"11414\",\"11415\",\"11416\",\"11417\",\"11418\",\"11419\",\"11420\",\"11421\",\"11422\",\"11423\",\"11424\",\"11425\",\"11426\",\"11427\",\"11428\",\"11429\",\"11430\",\"11431\",\"11432\",\"11433\",\"11434\",\"11435\",\"11436\",\"11437\",\"11438\",\"11439\",\"11440\",\"11441\",\"11442\",\"11443\",\"11444\",\"11445\",\"11446\",\"11447\",\"11448\",\"11449\",\"11450\",\"11451\",\"11452\",\"11453\",\"11454\",\"11455\",\"11456\",\"11457\",\"11458\",\"11459\",\"11460\",\"11461\",\"11462\",\"11463\",\"11464\",\"11465\",\"11466\",\"11467\",\"11468\",\"11469\",\"11470\",\"11471\",\"11472\",\"11473\",\"11474\",\"11475\",\"11476\",\"11477\",\"11478\",\"11479\",\"11480\",\"11481\",\"11482\",\"11483\",\"11484\",\"11485\",\"11486\",\"11487\",\"11488\",\"11489\",\"11490\",\"11491\",\"11492\",\"11493\",\"11494\",\"11495\",\"11496\",\"11497\",\"11498\",\"11499\",\"11500\",\"11501\",\"11502\",\"11503\",\"11504\",\"11505\",\"11506\",\"11507\",\"11508\",\"11509\",\"11510\",\"11511\",\"11512\",\"11513\",\"11515\",\"11516\",\"11517\",\"11519\",\"11521\",\"11522\",\"11523\",\"11525\",\"11526\",\"11528\",\"11529\",\"11531\",\"11532\",\"11535\",\"11536\",\"11538\",\"11539\",\"11540\",\"11542\",\"11543\",\"11545\",\"11547\",\"11548\",\"11550\",\"11551\",\"11553\",\"11555\",\"11556\",\"11558\",\"11559\",\"11561\",\"11562\",\"11563\",\"11565\",\"11566\",\"11567\",\"11569\",\"11571\",\"11572\",\"11574\",\"11575\",\"11576\",\"11578\",\"11580\",\"11581\",\"11582\",\"11584\",\"11585\",\"11587\",\"11588\",\"11590\",\"11592\",\"11593\",\"11594\",\"11596\",\"11597\",\"11599\",\"11601\",\"11602\",\"11604\",\"11605\",\"11607\",\"11608\",\"11610\",\"11612\",\"11614\",\"11615\",\"11616\",\"11618\",\"11619\",\"11621\",\"11623\",\"11625\",\"11626\",\"11627\",\"11629\",\"11630\",\"11631\",\"11633\",\"11634\",\"11635\",\"11637\",\"11638\",\"11639\",\"11641\",\"11643\",\"11644\",\"11645\",\"11647\",\"11649\",\"11650\",\"11652\",\"11653\",\"11655\",\"11656\",\"11658\",\"11659\",\"11661\",\"11662\",\"11664\",\"11665\",\"11666\",\"11668\",\"11669\",\"11671\",\"11673\",\"11674\",\"11676\",\"11677\",\"11679\",\"11680\",\"11681\",\"11682\",\"11684\",\"11686\",\"11687\",\"11689\",\"11690\",\"11692\",\"11693\",\"11695\",\"11697\",\"11698\",\"11699\",\"11701\",\"11702\",\"11703\",\"11705\",\"11707\",\"11708\",\"11710\",\"11711\",\"11712\",\"11714\",\"11716\",\"11717\",\"11718\",\"11720\",\"11721\",\"11723\",\"11725\",\"11726\",\"11728\",\"11729\",\"11731\",\"11732\",\"11734\",\"11735\",\"11737\",\"11738\",\"11740\",\"11742\",\"11743\",\"11744\",\"11745\",\"11747\",\"11748\",\"11751\",\"11752\",\"11754\",\"11755\",\"11757\",\"11758\",\"11760\",\"11761\",\"11763\",\"11764\",\"11766\",\"11767\",\"11769\",\"11770\",\"11771\",\"11772\",\"11774\",\"11776\",\"11778\",\"11779\",\"11780\",\"11782\",\"11783\",\"11785\",\"11787\",\"11788\",\"11789\",\"11790\",\"11792\",\"11793\",\"11796\",\"11797\",\"11798\",\"11800\",\"11802\",\"11803\",\"11805\",\"11806\",\"11808\",\"11809\",\"11810\",\"11811\",\"11813\",\"11814\",\"11816\",\"11818\",\"11820\",\"11821\",\"11823\",\"11825\",\"11826\",\"11827\",\"11829\",\"11830\",\"11832\",\"11834\",\"11835\",\"11837\",\"11838\",\"11840\",\"11841\",\"11842\",\"11843\",\"11845\",\"11846\",\"11847\",\"11849\",\"11850\",\"11851\",\"11852\",\"11853\",\"11854\",\"11855\",\"11856\",\"11857\",\"11858\",\"11859\",\"11860\",\"11861\",\"11862\",\"11863\",\"11864\",\"11865\",\"11866\",\"11867\",\"11868\",\"11869\",\"11870\",\"11871\",\"11872\",\"11873\",\"11874\",\"11875\",\"11876\",\"11877\",\"11878\",\"11879\",\"11880\",\"11881\",\"11882\",\"11883\",\"11884\",\"11885\",\"11886\",\"11887\",\"11888\",\"11889\",\"11890\",\"11891\",\"11892\",\"11893\",\"11894\",\"11895\",\"11896\",\"11897\",\"11898\",\"11899\",\"11900\",\"11901\",\"11902\",\"11903\",\"11904\",\"11905\",\"11906\",\"11907\",\"11908\",\"11909\",\"11910\",\"11911\",\"11912\",\"11913\",\"11914\",\"11915\",\"11916\",\"11917\",\"11918\",\"11919\",\"11920\",\"11921\",\"11922\",\"11923\",\"11924\",\"11925\",\"11926\",\"11927\",\"11928\",\"11929\",\"11930\",\"11931\",\"11932\",\"11933\",\"11934\",\"11935\",\"11936\",\"11937\",\"11938\",\"11939\",\"11940\",\"11941\",\"11942\",\"11943\",\"11944\",\"11945\",\"11946\",\"11947\",\"11948\",\"11949\",\"11950\",\"11951\",\"11952\",\"11953\",\"11954\",\"11955\",\"11956\",\"11957\",\"11958\",\"11959\",\"11960\",\"11961\",\"11962\",\"11963\",\"11964\",\"11965\",\"11966\",\"11967\",\"11968\",\"11969\",\"11970\",\"11971\",\"11972\",\"11973\",\"11974\",\"11975\",\"11976\",\"11977\",\"11978\",\"11979\",\"11980\",\"11981\",\"11982\",\"11983\",\"11984\",\"11985\",\"11986\",\"11987\",\"11988\",\"11989\",\"11990\",\"11991\",\"11992\",\"11993\",\"11994\",\"11995\",\"11996\",\"11997\",\"11998\",\"11999\",\"12000\",\"12001\",\"12002\",\"12003\",\"12004\",\"12005\",\"12006\",\"12007\",\"12008\",\"12009\",\"12010\",\"12011\",\"12012\",\"12013\",\"12014\",\"12015\",\"12016\",\"12017\",\"12018\",\"12019\",\"12020\",\"12021\",\"12022\",\"12023\",\"12024\",\"12025\",\"12026\",\"12027\",\"12028\",\"12029\",\"12030\",\"12031\",\"12032\",\"12033\",\"12034\",\"12035\",\"12036\",\"12037\",\"12038\",\"12039\",\"12040\",\"12041\",\"12042\",\"12043\",\"12044\",\"12045\",\"12046\",\"12047\",\"12048\",\"12049\",\"12050\",\"12051\",\"12052\",\"12053\",\"12054\",\"12055\",\"12056\",\"12057\",\"12058\",\"12059\",\"12060\",\"12061\",\"12062\",\"12063\",\"12064\",\"12065\",\"12066\",\"12067\",\"12068\",\"12069\",\"12070\",\"12071\",\"12072\",\"12073\",\"12074\",\"12075\",\"12076\",\"12077\",\"12078\",\"12079\",\"12080\",\"12081\",\"12082\",\"12083\",\"12084\",\"12085\",\"12086\",\"12087\",\"12088\",\"12089\",\"12090\",\"12091\",\"12093\",\"12095\",\"12098\",\"12101\",\"12105\",\"12108\",\"12110\",\"12114\",\"12117\",\"12120\",\"12122\",\"12127\",\"12135\",\"12147\",\"12150\",\"12153\",\"12160\",\"12163\",\"12166\",\"12171\",\"12174\",\"12175\",\"12177\",\"12181\",\"12184\",\"12187\",\"12189\",\"12193\",\"12195\",\"12199\",\"12200\",\"12205\",\"12206\",\"12209\",\"12213\",\"12216\",\"12219\",\"12221\",\"12226\",\"12229\",\"12232\",\"12233\",\"12238\",\"12240\",\"12242\",\"12245\",\"12248\",\"12251\",\"12256\",\"12259\",\"12261\",\"12264\",\"12268\",\"12271\",\"12272\",\"12277\",\"12280\",\"12283\",\"12285\",\"12288\",\"12290\",\"12295\",\"12296\",\"12300\",\"12302\",\"12306\",\"12308\",\"12311\",\"12315\",\"12319\",\"12321\",\"12324\",\"12328\",\"12329\",\"12333\",\"12337\",\"12338\",\"12341\",\"12344\",\"12349\",\"12352\",\"12354\",\"12357\",\"12360\",\"12364\",\"12366\",\"12369\",\"12372\",\"12376\",\"12378\",\"12381\",\"12385\",\"12388\",\"12391\",\"12394\",\"12395\",\"12398\",\"12401\",\"12404\",\"12407\",\"12410\",\"12415\",\"12416\",\"12419\",\"12423\",\"12425\",\"12429\",\"12431\",\"12434\",\"12439\",\"12442\",\"12445\",\"12446\",\"12450\",\"12454\",\"12456\",\"12460\",\"12462\",\"12466\",\"12467\",\"12471\",\"12475\",\"12478\",\"12481\",\"12484\",\"12485\",\"12488\",\"12493\",\"12495\",\"12498\",\"12502\",\"12505\",\"12508\",\"12511\",\"12514\",\"12516\",\"12520\",\"12522\",\"12525\",\"12528\",\"12531\",\"12535\",\"12537\",\"12540\",\"12543\",\"12546\",\"12550\",\"12555\",\"12559\",\"12563\",\"12569\",\"12570\",\"12572\",\"12574\",\"12576\",\"12582\",\"12585\",\"12589\",\"12593\",\"12597\",\"12600\",\"12603\",\"12607\",\"12610\",\"12611\",\"12616\",\"12618\",\"12621\",\"12622\",\"12625\",\"12627\",\"12630\",\"12634\",\"12637\",\"12640\",\"12643\",\"12645\",\"12651\",\"12653\",\"12656\",\"12660\",\"12663\",\"12665\",\"12670\",\"12672\",\"12675\",\"12677\",\"12680\",\"12683\",\"12687\",\"12689\",\"12692\",\"12695\",\"12699\",\"12701\",\"12719\",\"12722\",\"12727\",\"12730\",\"12733\",\"12735\",\"12737\",\"12740\",\"12744\",\"12746\",\"12750\",\"12753\",\"12756\",\"12759\",\"12761\",\"12764\",\"12767\",\"12772\",\"12775\",\"12778\",\"12781\",\"12782\",\"12786\",\"12788\",\"12792\",\"12795\",\"12797\",\"12802\",\"12805\",\"12808\",\"12811\",\"12814\",\"12815\",\"12819\",\"12821\",\"12826\",\"12829\",\"12831\",\"12834\",\"12837\",\"12839\",\"12844\",\"12846\",\"12849\",\"12853\",\"12855\",\"12859\",\"12863\",\"12866\",\"12868\",\"12870\",\"12873\",\"12876\",\"12879\",\"12881\",\"12885\",\"12888\",\"12891\",\"12895\",\"12898\",\"12901\",\"12905\",\"12909\",\"12912\",\"12914\",\"12916\",\"12919\",\"12922\",\"12926\",\"12931\",\"12935\",\"12940\",\"12941\",\"12942\",\"12944\",\"12946\",\"12947\",\"12951\",\"12955\",\"12958\",\"12960\",\"12962\",\"12965\",\"12968\",\"12972\",\"12976\",\"12977\",\"12981\",\"12983\",\"12986\",\"12990\",\"12992\",\"12996\",\"12999\",\"13001\",\"13005\",\"13009\",\"13011\",\"13014\",\"13017\",\"13020\",\"13024\",\"13025\",\"13029\",\"13032\",\"13036\",\"13039\",\"13040\",\"13044\",\"13047\",\"13049\",\"13052\",\"13056\",\"13058\",\"13062\",\"13064\",\"13068\",\"13071\",\"13075\",\"13077\",\"13080\",\"13083\",\"13086\",\"13090\",\"13091\",\"13094\",\"13098\",\"13100\",\"13104\",\"13107\",\"13111\",\"13114\",\"13115\",\"13118\",\"13121\",\"13123\",\"13127\",\"13130\",\"13133\",\"13135\",\"13137\",\"13140\",\"13146\",\"13148\",\"13151\",\"13154\",\"13159\",\"12092\",\"12094\",\"12096\",\"12097\",\"12099\",\"12100\",\"12102\",\"12103\",\"12104\",\"12106\",\"12107\",\"12109\",\"12111\",\"12112\",\"12113\",\"12115\",\"12116\",\"12118\",\"12119\",\"12121\",\"12123\",\"12124\",\"12125\",\"12126\",\"12134\",\"12136\",\"12146\",\"12148\",\"12149\",\"12151\",\"12152\",\"12154\",\"12158\",\"12159\",\"12161\",\"12162\",\"12164\",\"12165\",\"12167\",\"12168\",\"12169\",\"12170\",\"12172\",\"12173\",\"12176\",\"12178\",\"12179\",\"12180\",\"12182\",\"12183\",\"12185\",\"12186\",\"12188\",\"12190\",\"12191\",\"12192\",\"12194\",\"12196\",\"12197\",\"12198\",\"12201\",\"12202\",\"12203\",\"12204\",\"12207\",\"12208\",\"12210\",\"12211\",\"12212\",\"12214\",\"12215\",\"12217\",\"12218\",\"12220\",\"12222\",\"12223\",\"12224\",\"12225\",\"12227\",\"12228\",\"12230\",\"12231\",\"12234\",\"12235\",\"12236\",\"12237\",\"12239\",\"12241\",\"12243\",\"12244\",\"12246\",\"12247\",\"12249\",\"12250\",\"12252\",\"12253\",\"12254\",\"12255\",\"12257\",\"12258\",\"12260\",\"12262\",\"12263\",\"12265\",\"12266\",\"12267\",\"12269\",\"12270\",\"12273\",\"12274\",\"12275\",\"12276\",\"12278\",\"12279\",\"12281\",\"12282\",\"12284\",\"12286\",\"12287\",\"12289\",\"12291\",\"12292\",\"12293\",\"12294\",\"12297\",\"12298\",\"12299\",\"12301\",\"12303\",\"12304\",\"12305\",\"12307\",\"12309\",\"12310\",\"12312\",\"12313\",\"12314\",\"12316\",\"12317\",\"12318\",\"12320\",\"12322\",\"12323\",\"12325\",\"12326\",\"12327\",\"12330\",\"12331\",\"12332\",\"12334\",\"12335\",\"12336\",\"12339\",\"12340\",\"12342\",\"12343\",\"12345\",\"12346\",\"12347\",\"12348\",\"12350\",\"12351\",\"12353\",\"12355\",\"12356\",\"12358\",\"12359\",\"12361\",\"12362\",\"12363\",\"12365\",\"12367\",\"12368\",\"12370\",\"12371\",\"12373\",\"12374\",\"12375\",\"12377\",\"12379\",\"12380\",\"12382\",\"12383\",\"12384\",\"12386\",\"12387\",\"12389\",\"12390\",\"12392\",\"12393\",\"12396\",\"12397\",\"12399\",\"12400\",\"12402\",\"12403\",\"12405\",\"12406\",\"12408\",\"12409\",\"12411\",\"12412\",\"12413\",\"12414\",\"12417\",\"12418\",\"12420\",\"12421\",\"12422\",\"12424\",\"12426\",\"12427\",\"12428\",\"12430\",\"12432\",\"12433\",\"12435\",\"12436\",\"12437\",\"12438\",\"12440\",\"12441\",\"12443\",\"12444\",\"12447\",\"12448\",\"12449\",\"12451\",\"12452\",\"12453\",\"12455\",\"12457\",\"12458\",\"12459\",\"12461\",\"12463\",\"12464\",\"12465\",\"12468\",\"12469\",\"12470\",\"12472\",\"12473\",\"12474\",\"12476\",\"12477\",\"12479\",\"12480\",\"12482\",\"12483\",\"12486\",\"12487\",\"12489\",\"12490\",\"12491\",\"12492\",\"12494\",\"12496\",\"12497\",\"12499\",\"12500\",\"12501\",\"12503\",\"12504\",\"12506\",\"12507\",\"12509\",\"12510\",\"12512\",\"12513\",\"12515\",\"12517\",\"12518\",\"12519\",\"12521\",\"12523\",\"12524\",\"12526\",\"12527\",\"12529\",\"12530\",\"12532\",\"12533\",\"12534\",\"12536\",\"12538\",\"12539\",\"12541\",\"12542\",\"12544\",\"12545\",\"12547\",\"12548\",\"12549\",\"12551\",\"12552\",\"12553\",\"12554\",\"12556\",\"12557\",\"12564\",\"12566\",\"12568\",\"12571\",\"12573\",\"12575\",\"12577\",\"12579\",\"12580\",\"12583\",\"12584\",\"12587\",\"12588\",\"12590\",\"12591\",\"12592\",\"12594\",\"12595\",\"12596\",\"12598\",\"12599\",\"12601\",\"12602\",\"12604\",\"12605\",\"12606\",\"12608\",\"12609\",\"12612\",\"12613\",\"12614\",\"12615\",\"12617\",\"12619\",\"12620\",\"12623\",\"12624\",\"12626\",\"12628\",\"12629\",\"12631\",\"12632\",\"12633\",\"12635\",\"12636\",\"12638\",\"12639\",\"12641\",\"12642\",\"12644\",\"12646\",\"12647\",\"12648\",\"12649\",\"12650\",\"12652\",\"12654\",\"12655\",\"12657\",\"12658\",\"12659\",\"12661\",\"12662\",\"12664\",\"12666\",\"12667\",\"12668\",\"12669\",\"12671\",\"12673\",\"12674\",\"12676\",\"12678\",\"12679\",\"12681\",\"12682\",\"12684\",\"12685\",\"12686\",\"12688\",\"12690\",\"12691\",\"12693\",\"12694\",\"12696\",\"12697\",\"12698\",\"12700\",\"12702\",\"12705\",\"12720\",\"12721\",\"12723\",\"12724\",\"12725\",\"12726\",\"12728\",\"12729\",\"12731\",\"12732\",\"12734\",\"12736\",\"12738\",\"12739\",\"12741\",\"12742\",\"12743\",\"12745\",\"12747\",\"12748\",\"12749\",\"12751\",\"12752\",\"12754\",\"12755\",\"12757\",\"12758\",\"12760\",\"12762\",\"12763\",\"12765\",\"12766\",\"12768\",\"12769\",\"12770\",\"12771\",\"12773\",\"12774\",\"12776\",\"12777\",\"12779\",\"12780\",\"12783\",\"12784\",\"12785\",\"12787\",\"12789\",\"12790\",\"12791\",\"12793\",\"12794\",\"12796\",\"12798\",\"12799\",\"12800\",\"12801\",\"12803\",\"12804\",\"12806\",\"12807\",\"12809\",\"12810\",\"12812\",\"12813\",\"12816\",\"12817\",\"12818\",\"12820\",\"12822\",\"12823\",\"12824\",\"12825\",\"12827\",\"12828\",\"12830\",\"12832\",\"12833\",\"12835\",\"12836\",\"12838\",\"12840\",\"12841\",\"12842\",\"12843\",\"12845\",\"12847\",\"12848\",\"12850\",\"12851\",\"12852\",\"12854\",\"12856\",\"12857\",\"12858\",\"12860\",\"12861\",\"12862\",\"12864\",\"12865\",\"12867\",\"12869\",\"12871\",\"12872\",\"12874\",\"12875\",\"12877\",\"12878\",\"12880\",\"12882\",\"12883\",\"12884\",\"12886\",\"12887\",\"12889\",\"12890\",\"12892\",\"12893\",\"12894\",\"12896\",\"12897\",\"12899\",\"12900\",\"12902\",\"12903\",\"12904\",\"12906\",\"12907\",\"12908\",\"12910\",\"12911\",\"12913\",\"12915\",\"12917\",\"12918\",\"12920\",\"12921\",\"12923\",\"12924\",\"12925\",\"12927\",\"12928\",\"12929\",\"12930\",\"12932\",\"12933\",\"12934\",\"12936\",\"12937\",\"12938\",\"12939\",\"12943\",\"12945\",\"12948\",\"12949\",\"12950\",\"12952\",\"12953\",\"12954\",\"12956\",\"12957\",\"12959\",\"12961\",\"12963\",\"12964\",\"12966\",\"12967\",\"12969\",\"12970\",\"12971\",\"12973\",\"12974\",\"12975\",\"12978\",\"12979\",\"12980\",\"12982\",\"12984\",\"12985\",\"12987\",\"12988\",\"12989\",\"12991\",\"12993\",\"12994\",\"12995\",\"12997\",\"12998\",\"13000\",\"13002\",\"13003\",\"13004\",\"13006\",\"13007\",\"13008\",\"13010\",\"13012\",\"13013\",\"13015\",\"13016\",\"13018\",\"13019\",\"13021\",\"13022\",\"13023\",\"13026\",\"13027\",\"13028\",\"13030\",\"13031\",\"13033\",\"13034\",\"13035\",\"13037\",\"13038\",\"13041\",\"13042\",\"13043\",\"13045\",\"13046\",\"13048\",\"13050\",\"13051\",\"13053\",\"13054\",\"13055\",\"13057\",\"13059\",\"13060\",\"13061\",\"13063\",\"13065\",\"13066\",\"13067\",\"13069\",\"13070\",\"13072\",\"13073\",\"13074\",\"13076\",\"13078\",\"13079\",\"13081\",\"13082\",\"13084\",\"13085\",\"13087\",\"13088\",\"13089\",\"13092\",\"13093\",\"13095\",\"13096\",\"13097\",\"13099\",\"13101\",\"13102\",\"13103\",\"13105\",\"13106\",\"13108\",\"13109\",\"13110\",\"13112\",\"13113\",\"13116\",\"13117\",\"13119\",\"13120\",\"13122\",\"13124\",\"13125\",\"13126\",\"13128\",\"13129\",\"13131\",\"13132\",\"13134\",\"13136\",\"13138\",\"13139\",\"13141\",\"13142\",\"13143\",\"13144\",\"13145\",\"13147\",\"13149\",\"13150\",\"13152\",\"13153\",\"13155\",\"13156\",\"13157\",\"13158\",\"12128\",\"12129\",\"12130\",\"12131\",\"12132\",\"12133\",\"12137\",\"12138\",\"12139\",\"12140\",\"12141\",\"12142\",\"12703\",\"12704\",\"12706\",\"12709\",\"12710\",\"12712\",\"12716\",\"12717\",\"12718\",\"12143\",\"12157\",\"12707\",\"12714\",\"12144\",\"12145\",\"12155\",\"12156\",\"12708\",\"12711\",\"12713\",\"12715\",\"12558\",\"12560\",\"12565\",\"12561\",\"12562\",\"12567\",\"12578\",\"12581\",\"12586\",\"13160\",\"13161\",\"13162\",\"13163\",\"13164\",\"13165\",\"13166\",\"13167\",\"13168\",\"13169\",\"13170\",\"13171\",\"13172\",\"13173\",\"13174\",\"13175\",\"13176\",\"13177\",\"13178\",\"13179\",\"13180\",\"13181\",\"13182\",\"13183\",\"13184\",\"13185\",\"13186\",\"13187\",\"13188\",\"13189\",\"13190\",\"13191\",\"13192\",\"13193\",\"13194\",\"13195\",\"13196\",\"13197\",\"13198\",\"13199\",\"13200\",\"13201\",\"13202\",\"13203\",\"13204\",\"13205\",\"13206\",\"13207\",\"13208\",\"13209\",\"13210\",\"13211\",\"13212\",\"13213\",\"13214\",\"13215\",\"13216\",\"13217\",\"13218\",\"13219\",\"13220\",\"13221\",\"13222\",\"13223\",\"13224\",\"13225\",\"13226\",\"13227\",\"13228\",\"13229\",\"13230\",\"13231\",\"13232\",\"13233\",\"13234\",\"13235\",\"13236\",\"13237\",\"13238\",\"13239\",\"13240\",\"13241\",\"13242\",\"13243\",\"13244\",\"13245\",\"13246\",\"13247\",\"13248\",\"13249\",\"13250\",\"13251\",\"13252\",\"13253\",\"13254\",\"13255\",\"13256\",\"13257\",\"13258\",\"13259\",\"13260\",\"13261\",\"13262\",\"13263\",\"13264\",\"13265\",\"13266\",\"13267\",\"13268\",\"13269\",\"13270\",\"13274\",\"13275\",\"13276\",\"13277\",\"13278\",\"13279\",\"13280\",\"13281\",\"13282\",\"13283\",\"13284\",\"13285\",\"13286\",\"13287\",\"13288\",\"13289\",\"13290\",\"13291\",\"13292\",\"13293\",\"13294\",\"13298\",\"13299\",\"13300\",\"13301\",\"13302\",\"13303\",\"13304\",\"13305\",\"13306\",\"13307\",\"13308\",\"13309\",\"13310\",\"13311\",\"13312\",\"13313\",\"13314\",\"13315\",\"13316\",\"13317\",\"13318\",\"13319\",\"13320\",\"13321\",\"13322\",\"13323\",\"13324\",\"13325\",\"13326\",\"13327\",\"13328\",\"13329\",\"13330\",\"13331\",\"13332\",\"13333\",\"13334\",\"13335\",\"13336\",\"13337\",\"13338\",\"13339\",\"13340\",\"13341\",\"13342\",\"13343\",\"13344\",\"13345\",\"13346\",\"13347\",\"13348\",\"13349\",\"13350\",\"13351\",\"13352\",\"13353\",\"13354\",\"13355\",\"13356\",\"13357\",\"13358\",\"13359\",\"13360\",\"13361\",\"13362\",\"13363\",\"13364\",\"13365\",\"13366\",\"13367\",\"13368\",\"13369\",\"13370\",\"13371\",\"13372\",\"13373\",\"13374\",\"13375\",\"13376\",\"13377\",\"13378\",\"13379\",\"13380\",\"13381\",\"13382\",\"13383\",\"13384\",\"13385\",\"13386\",\"13387\",\"13388\",\"13389\",\"13390\",\"13391\",\"13392\",\"13393\",\"13394\",\"13395\",\"13396\",\"13397\",\"13398\",\"13399\",\"13400\",\"13401\",\"13402\",\"13403\",\"13404\",\"13405\",\"13406\",\"13407\",\"13408\",\"13409\",\"13410\",\"13411\",\"13412\",\"13413\",\"13414\",\"13415\",\"13416\",\"13417\",\"13418\",\"13419\",\"13420\",\"13421\",\"13422\",\"13423\",\"13424\",\"13425\",\"13426\",\"13427\",\"13428\",\"13429\",\"13430\",\"13431\",\"13432\",\"13433\",\"13434\",\"13435\",\"13436\",\"13437\",\"13438\",\"13439\",\"13440\",\"13441\",\"13442\",\"13443\",\"13444\",\"13445\",\"13446\",\"13447\",\"13448\",\"13449\",\"13450\",\"13451\",\"13452\",\"13453\",\"13454\",\"13455\",\"13456\",\"13457\",\"13458\",\"13459\",\"13460\",\"13461\",\"13462\",\"13463\",\"13464\",\"13465\",\"13466\",\"13467\",\"13468\",\"13469\",\"13470\",\"13471\",\"13472\",\"13473\",\"13474\",\"13475\",\"13476\",\"13477\",\"13478\",\"13479\",\"13480\",\"13481\",\"13482\",\"13483\",\"13484\",\"13485\",\"13486\",\"13487\",\"13488\",\"13489\",\"13490\",\"13491\",\"13492\",\"13493\",\"13494\",\"13495\",\"13496\",\"13497\",\"13498\",\"13499\",\"13500\",\"13501\",\"13502\",\"13503\",\"13504\",\"13505\",\"13506\",\"13507\",\"13508\",\"13509\",\"13510\",\"13511\",\"13512\",\"13513\",\"13514\",\"13515\",\"13516\",\"13517\",\"13518\",\"13519\",\"13520\",\"13521\",\"13522\",\"13523\",\"13524\",\"13525\",\"13526\",\"13527\",\"13528\",\"13529\",\"13530\",\"13531\",\"13532\",\"13533\",\"13534\",\"13535\",\"13536\",\"13537\",\"13271\",\"13272\",\"13273\",\"13295\",\"13296\",\"13297\",\"13539\",\"13547\",\"13552\",\"13555\",\"13579\",\"13592\",\"13618\",\"13635\",\"13641\",\"13644\",\"13650\",\"13654\",\"13656\",\"13660\",\"13678\",\"13682\",\"13686\",\"13708\",\"13715\",\"13729\",\"13730\",\"13744\",\"13747\",\"13749\",\"13751\",\"13757\",\"13762\",\"13768\",\"13777\",\"13813\",\"13814\",\"13832\",\"13839\",\"13843\",\"13861\",\"13871\",\"13879\",\"13882\",\"13887\",\"13894\",\"13902\",\"13915\",\"13920\",\"13942\",\"13944\",\"13960\",\"13974\",\"13976\",\"13982\",\"13986\",\"14014\",\"14019\",\"14026\",\"14063\",\"14076\",\"14078\",\"14097\",\"14099\",\"14113\",\"14135\",\"14155\",\"14165\",\"14175\",\"14189\",\"14193\",\"14196\",\"14201\",\"14222\",\"14236\",\"14238\",\"14240\",\"14272\",\"14282\",\"14299\",\"14304\",\"14309\",\"14313\",\"14319\",\"14325\",\"14351\",\"14355\",\"14360\",\"14364\",\"14389\",\"14394\",\"14399\",\"14414\",\"14417\",\"13538\",\"13548\",\"13551\",\"13554\",\"13576\",\"13594\",\"13617\",\"13634\",\"13642\",\"13645\",\"13651\",\"13652\",\"13657\",\"13659\",\"13676\",\"13683\",\"13685\",\"13707\",\"13717\",\"13727\",\"13732\",\"13742\",\"13745\",\"13748\",\"13753\",\"13759\",\"13761\",\"13767\",\"13775\",\"13812\",\"13815\",\"13834\",\"13838\",\"13841\",\"13859\",\"13869\",\"13877\",\"13880\",\"13888\",\"13893\",\"13903\",\"13914\",\"13919\",\"13941\",\"13945\",\"13958\",\"13973\",\"13977\",\"13984\",\"13985\",\"14013\",\"14018\",\"14025\",\"14065\",\"14075\",\"14080\",\"14096\",\"14100\",\"14116\",\"14139\",\"14159\",\"14166\",\"14176\",\"14191\",\"14194\",\"14195\",\"14202\",\"14223\",\"14234\",\"14237\",\"14242\",\"14270\",\"14284\",\"14297\",\"14303\",\"14310\",\"14312\",\"14318\",\"14326\",\"14352\",\"14356\",\"14362\",\"14365\",\"14387\",\"14395\",\"14401\",\"14418\",\"14421\",\"13540\",\"13549\",\"13550\",\"13553\",\"13578\",\"13593\",\"13616\",\"13636\",\"13640\",\"13643\",\"13649\",\"13653\",\"13655\",\"13658\",\"13677\",\"13684\",\"13687\",\"13706\",\"13716\",\"13728\",\"13731\",\"13743\",\"13746\",\"13750\",\"13752\",\"13758\",\"13760\",\"13766\",\"13776\",\"13811\",\"13816\",\"13833\",\"13840\",\"13842\",\"13860\",\"13867\",\"13878\",\"13881\",\"13886\",\"13892\",\"13901\",\"13913\",\"13921\",\"13940\",\"13943\",\"13959\",\"13975\",\"13978\",\"13983\",\"13987\",\"14012\",\"14020\",\"14024\",\"14064\",\"14077\",\"14079\",\"14098\",\"14101\",\"14114\",\"14136\",\"14156\",\"14167\",\"14174\",\"14190\",\"14192\",\"14197\",\"14203\",\"14224\",\"14235\",\"14239\",\"14241\",\"14271\",\"14283\",\"14298\",\"14305\",\"14311\",\"14314\",\"14322\",\"14333\",\"14353\",\"14354\",\"14361\",\"14363\",\"14388\",\"14393\",\"14400\",\"14413\",\"14416\",\"13541\",\"13542\",\"13543\",\"13544\",\"13545\",\"13546\",\"13556\",\"13557\",\"13558\",\"13559\",\"13560\",\"13561\",\"13562\",\"13563\",\"13564\",\"13565\",\"13566\",\"13569\",\"13571\",\"13572\",\"13573\",\"13580\",\"13581\",\"13582\",\"13583\",\"13584\",\"13585\",\"13586\",\"13587\",\"13588\",\"13595\",\"13596\",\"13597\",\"13598\",\"13599\",\"13600\",\"13604\",\"13605\",\"13606\",\"13607\",\"13608\",\"13609\",\"13610\",\"13611\",\"13612\",\"13613\",\"13614\",\"13615\",\"13619\",\"13620\",\"13621\",\"13622\",\"13623\",\"13624\",\"13625\",\"13626\",\"13627\",\"13628\",\"13629\",\"13630\",\"13631\",\"13632\",\"13633\",\"13646\",\"13647\",\"13648\",\"13661\",\"13662\",\"13663\",\"13664\",\"13665\",\"13666\",\"13667\",\"13668\",\"13669\",\"13673\",\"13674\",\"13675\",\"13679\",\"13680\",\"13681\",\"13688\",\"13689\",\"13690\",\"13694\",\"13695\",\"13696\",\"13697\",\"13698\",\"13699\",\"13700\",\"13701\",\"13702\",\"13703\",\"13704\",\"13705\",\"13712\",\"13713\",\"13714\",\"13718\",\"13719\",\"13720\",\"13721\",\"13722\",\"13723\",\"13724\",\"13725\",\"13726\",\"13736\",\"13737\",\"13738\",\"13739\",\"13740\",\"13741\",\"13754\",\"13755\",\"13756\",\"13763\",\"13764\",\"13765\",\"13769\",\"13770\",\"13771\",\"13772\",\"13773\",\"13774\",\"13778\",\"13779\",\"13780\",\"13781\",\"13782\",\"13783\",\"13784\",\"13785\",\"13786\",\"13787\",\"13788\",\"13789\",\"13793\",\"13794\",\"13795\",\"13796\",\"13797\",\"13798\",\"13799\",\"13800\",\"13801\",\"13802\",\"13803\",\"13804\",\"13805\",\"13806\",\"13807\",\"13817\",\"13818\",\"13819\",\"13829\",\"13830\",\"13831\",\"13835\",\"13836\",\"13837\",\"13844\",\"13845\",\"13848\",\"13850\",\"13851\",\"13852\",\"13853\",\"13854\",\"13855\",\"13856\",\"13857\",\"13858\",\"13862\",\"13863\",\"13864\",\"13865\",\"13866\",\"13868\",\"13870\",\"13872\",\"13873\",\"13874\",\"13875\",\"13876\",\"13883\",\"13884\",\"13885\",\"13889\",\"13890\",\"13891\",\"13895\",\"13896\",\"13897\",\"13898\",\"13899\",\"13900\",\"13904\",\"13905\",\"13906\",\"13907\",\"13908\",\"13909\",\"13910\",\"13911\",\"13912\",\"13916\",\"13917\",\"13918\",\"13922\",\"13923\",\"13924\",\"13925\",\"13926\",\"13927\",\"13931\",\"13932\",\"13933\",\"13934\",\"13935\",\"13936\",\"13946\",\"13947\",\"13948\",\"13949\",\"13950\",\"13951\",\"13952\",\"13953\",\"13954\",\"13955\",\"13956\",\"13957\",\"13961\",\"13962\",\"13963\",\"13964\",\"13965\",\"13966\",\"13979\",\"13980\",\"13981\",\"13988\",\"13989\",\"13990\",\"13991\",\"13992\",\"13993\",\"13994\",\"13995\",\"13996\",\"13997\",\"13998\",\"13999\",\"14000\",\"14001\",\"14002\",\"14003\",\"14004\",\"14005\",\"14015\",\"14016\",\"14017\",\"14030\",\"14031\",\"14032\",\"14033\",\"14034\",\"14035\",\"14036\",\"14037\",\"14038\",\"14039\",\"14040\",\"14041\",\"14042\",\"14043\",\"14044\",\"14045\",\"14046\",\"14047\",\"14048\",\"14049\",\"14050\",\"14051\",\"14052\",\"14053\",\"14054\",\"14055\",\"14056\",\"14057\",\"14058\",\"14059\",\"14060\",\"14061\",\"14062\",\"14069\",\"14070\",\"14071\",\"14081\",\"14082\",\"14083\",\"14084\",\"14085\",\"14086\",\"14087\",\"14088\",\"14089\",\"14090\",\"14091\",\"14092\",\"14093\",\"14094\",\"14095\",\"14102\",\"14103\",\"14104\",\"14107\",\"14108\",\"14111\",\"14117\",\"14118\",\"14119\",\"14123\",\"14124\",\"14125\",\"14129\",\"14130\",\"14131\",\"14132\",\"14133\",\"14134\",\"14137\",\"14138\",\"14140\",\"14141\",\"14144\",\"14145\",\"14146\",\"14147\",\"14148\",\"14149\",\"14150\",\"14151\",\"14153\",\"14154\",\"14157\",\"14158\",\"14160\",\"14161\",\"14168\",\"14169\",\"14170\",\"14180\",\"14181\",\"14182\",\"14183\",\"14184\",\"14185\",\"14186\",\"14187\",\"14188\",\"14198\",\"14199\",\"14200\",\"14207\",\"14208\",\"14209\",\"14210\",\"14211\",\"14212\",\"14213\",\"14214\",\"14215\",\"14216\",\"14217\",\"14218\",\"14219\",\"14220\",\"14221\",\"14228\",\"14229\",\"14230\",\"14231\",\"14232\",\"14233\",\"14243\",\"14244\",\"14245\",\"14246\",\"14247\",\"14248\",\"14249\",\"14250\",\"14251\",\"14255\",\"14256\",\"14257\",\"14258\",\"14259\",\"14260\",\"14264\",\"14265\",\"14266\",\"14267\",\"14268\",\"14269\",\"14273\",\"14274\",\"14275\",\"14276\",\"14277\",\"14278\",\"14279\",\"14280\",\"14281\",\"14288\",\"14289\",\"14290\",\"14291\",\"14292\",\"14293\",\"14294\",\"14295\",\"14296\",\"14300\",\"14301\",\"14302\",\"14306\",\"14307\",\"14308\",\"14315\",\"14316\",\"14317\",\"14320\",\"14321\",\"14323\",\"14324\",\"14327\",\"14328\",\"14329\",\"14330\",\"14331\",\"14332\",\"14336\",\"14340\",\"14346\",\"14347\",\"14350\",\"14357\",\"14358\",\"14359\",\"14366\",\"14367\",\"14368\",\"14369\",\"14370\",\"14371\",\"14378\",\"14379\",\"14380\",\"14381\",\"14382\",\"14383\",\"14384\",\"14385\",\"14386\",\"14390\",\"14391\",\"14392\",\"14396\",\"14397\",\"14398\",\"14405\",\"14406\",\"14407\",\"14411\",\"14412\",\"14415\",\"14429\",\"14430\",\"14431\",\"13567\",\"13589\",\"13967\",\"14006\",\"14068\",\"14120\",\"14162\",\"14204\",\"14341\",\"14403\",\"13568\",\"13570\",\"13590\",\"13591\",\"13968\",\"13969\",\"14007\",\"14008\",\"14066\",\"14067\",\"14121\",\"14122\",\"14163\",\"14164\",\"14205\",\"14206\",\"14339\",\"14348\",\"14402\",\"14404\",\"13574\",\"13575\",\"13577\",\"13601\",\"13602\",\"13603\",\"13709\",\"13710\",\"13711\",\"13733\",\"13734\",\"13735\",\"13790\",\"13791\",\"13792\",\"13808\",\"13809\",\"13810\",\"13823\",\"13824\",\"13825\",\"13826\",\"13827\",\"13828\",\"13846\",\"13847\",\"13849\",\"13937\",\"13938\",\"13939\",\"14009\",\"14010\",\"14011\",\"14072\",\"14073\",\"14074\",\"14105\",\"14106\",\"14109\",\"14110\",\"14112\",\"14115\",\"14142\",\"14143\",\"14152\",\"14171\",\"14172\",\"14173\",\"14177\",\"14178\",\"14179\",\"14225\",\"14226\",\"14227\",\"14261\",\"14262\",\"14263\",\"14334\",\"14335\",\"14337\",\"14338\",\"14344\",\"14345\",\"14408\",\"14409\",\"14410\",\"14419\",\"14420\",\"14422\",\"14423\",\"14424\",\"14426\",\"13637\",\"13638\",\"13639\",\"13670\",\"13671\",\"13672\",\"13691\",\"13692\",\"13693\",\"13820\",\"13821\",\"13822\",\"13928\",\"13929\",\"13930\",\"13970\",\"13971\",\"13972\",\"14021\",\"14022\",\"14023\",\"14027\",\"14028\",\"14029\",\"14126\",\"14127\",\"14128\",\"14252\",\"14253\",\"14254\",\"14285\",\"14286\",\"14287\",\"14342\",\"14343\",\"14349\",\"14372\",\"14373\",\"14374\",\"14375\",\"14376\",\"14377\",\"14425\",\"14427\",\"14428\",\"14432\",\"14433\",\"14434\",\"9491\",\"9492\",\"9493\",\"9494\",\"9495\",\"9496\",\"9497\",\"9498\",\"9499\",\"9500\",\"9501\",\"9502\",\"9503\",\"9504\",\"9505\",\"9506\",\"9507\",\"9508\",\"9509\",\"9510\",\"9511\",\"9512\",\"9513\",\"9514\",\"9515\",\"9516\",\"9517\",\"9518\",\"9519\",\"9520\",\"9521\",\"9522\",\"9523\",\"11141\",\"11142\",\"11143\",\"11144\",\"11145\",\"11146\",\"11150\",\"11151\",\"11152\",\"11153\",\"11154\",\"11155\",\"15509\",\"15513\",\"15514\",\"15517\",\"15536\",\"15542\",\"15543\",\"15549\",\"15559\",\"15611\",\"15612\",\"15613\",\"15614\",\"15615\",\"15616\",\"15617\",\"15618\",\"15619\",\"15620\",\"15621\",\"15622\",\"15623\",\"15624\",\"15625\",\"15643\",\"15645\",\"15650\",\"15653\",\"15659\",\"15661\",\"15663\",\"15698\",\"15702\",\"15708\",\"15710\",\"15721\",\"15757\",\"15758\",\"15761\",\"15762\",\"16816\",\"16817\",\"17833\",\"17100\",\"17101\",\"17102\",\"17103\",\"17104\",\"17105\",\"17106\",\"17107\",\"17108\",\"17109\",\"17110\",\"17111\",\"17112\",\"17113\",\"17114\",\"17115\",\"17116\",\"17117\",\"17118\",\"17119\",\"17120\",\"17121\",\"17122\",\"17123\",\"17124\",\"17125\",\"17126\",\"17127\",\"17128\",\"17129\",\"17154\",\"17155\",\"17156\",\"17157\",\"17158\",\"17159\",\"17160\",\"17161\",\"17195\",\"17196\",\"17197\",\"17198\",\"17199\",\"17200\",\"17201\",\"17202\",\"17203\",\"17204\",\"17205\",\"17206\",\"17207\",\"17208\",\"17209\",\"17210\",\"17211\",\"17212\",\"17213\",\"17214\",\"17215\",\"17216\",\"17217\",\"17218\",\"17219\",\"17220\",\"17221\",\"17222\",\"17223\",\"17224\",\"17225\",\"17226\",\"17227\",\"17228\",\"17229\",\"17230\",\"17231\",\"17232\",\"17233\",\"17234\",\"17235\",\"17236\",\"17237\",\"17272\",\"17273\",\"17274\",\"17275\",\"17276\",\"17277\",\"17278\",\"17279\",\"17280\",\"17281\",\"17282\",\"17283\",\"17284\",\"17285\",\"17286\",\"17287\",\"17288\",\"17289\",\"17290\",\"17291\",\"17292\",\"17293\",\"17294\",\"17295\",\"17296\",\"17297\",\"17298\",\"17299\",\"17300\",\"17301\",\"17302\",\"17303\",\"17304\",\"17305\",\"17306\",\"17307\",\"17321\",\"17322\",\"17323\",\"17324\",\"17325\",\"17326\",\"17327\",\"17328\",\"17329\",\"17330\",\"17331\",\"17332\",\"17333\",\"17334\",\"17335\",\"17336\",\"17337\",\"17338\",\"17339\",\"17340\",\"17341\",\"17342\",\"17343\",\"17344\",\"17345\",\"17346\",\"17347\",\"17348\",\"17349\",\"17350\",\"17351\",\"17352\",\"17353\",\"17354\",\"17355\",\"17356\",\"17357\",\"17358\",\"17359\",\"17360\",\"17361\",\"17362\",\"17363\",\"17364\",\"17365\",\"17366\",\"17367\",\"17368\",\"17369\",\"17370\",\"17371\",\"17372\",\"17373\",\"17374\",\"17375\",\"17376\",\"17377\",\"17378\",\"17379\",\"17380\",\"17381\",\"17382\",\"17383\",\"17384\",\"17385\",\"17386\",\"17387\",\"17388\",\"17389\",\"17390\",\"17391\",\"17392\",\"17393\",\"17394\",\"17395\",\"17396\",\"17397\",\"17398\",\"17399\",\"17400\",\"17401\",\"17402\",\"17403\",\"17404\",\"17405\",\"17406\",\"17407\",\"17408\",\"17409\",\"17410\",\"17411\",\"17412\",\"17413\",\"17414\",\"17415\",\"17416\",\"17417\",\"17418\",\"17419\",\"17420\",\"17421\",\"17422\",\"17130\",\"17131\",\"17132\",\"17133\",\"17134\",\"17135\",\"17136\",\"17137\",\"17138\",\"17139\",\"17140\",\"17141\",\"17142\",\"17143\",\"17144\",\"17145\",\"17146\",\"17147\",\"17148\",\"17149\",\"17150\",\"17151\",\"17152\",\"17153\",\"17423\",\"17424\",\"17425\",\"17426\",\"17427\",\"17428\",\"17429\",\"17430\",\"17431\",\"17432\",\"17433\",\"17434\",\"17435\",\"17436\",\"17437\",\"17438\",\"17439\",\"17440\",\"17441\",\"17442\",\"17443\",\"17444\",\"17445\",\"17446\",\"17447\",\"17448\",\"17449\",\"17450\",\"17451\",\"17452\",\"17453\",\"17454\",\"17455\",\"17456\",\"17457\",\"17458\",\"17459\",\"17460\",\"17461\",\"17462\",\"17463\",\"17464\",\"17465\",\"17466\",\"17467\",\"17468\",\"17469\",\"17470\",\"17471\",\"17472\",\"17473\",\"17474\",\"17475\",\"17476\",\"17477\",\"17478\",\"17479\",\"17480\",\"17481\",\"17482\",\"17483\",\"17484\",\"17485\",\"17486\",\"17487\",\"17488\",\"17489\",\"17490\",\"17491\",\"17492\",\"17493\",\"17494\",\"17495\",\"17496\",\"17497\",\"17498\",\"17499\",\"17500\",\"17501\",\"17502\",\"17503\",\"17504\",\"17505\",\"17506\",\"17507\",\"17508\",\"17509\",\"17510\",\"17511\",\"17512\",\"17513\",\"17514\",\"17515\",\"17516\",\"17517\",\"17518\",\"17519\",\"17520\",\"17521\",\"17522\",\"17523\",\"17524\",\"17525\",\"17526\",\"17527\",\"17528\",\"17529\",\"17530\",\"17531\",\"17532\",\"17533\",\"17534\",\"17535\",\"17536\",\"17537\",\"17538\",\"17539\",\"17540\",\"17541\",\"17542\",\"17543\",\"17544\",\"17545\",\"17546\",\"17547\",\"17548\",\"17549\",\"17550\",\"17551\",\"17552\",\"17553\",\"17554\",\"17555\",\"17556\",\"17557\",\"17558\",\"17559\",\"17560\",\"17561\",\"17562\",\"17563\",\"17564\",\"17565\",\"17566\",\"17567\",\"17568\",\"17569\",\"17570\",\"17571\",\"17572\",\"17573\",\"17574\",\"17575\",\"17576\",\"17577\",\"17578\",\"17579\",\"17580\",\"17581\",\"17582\",\"17583\",\"17584\",\"17585\",\"17586\",\"17587\",\"17588\",\"17589\",\"17590\",\"17591\",\"17592\",\"17593\",\"17594\",\"17595\",\"17596\",\"17597\",\"17598\",\"17599\",\"17600\",\"17601\",\"17602\",\"17603\",\"17604\",\"17605\",\"17606\",\"17607\",\"17608\",\"17609\",\"17610\",\"17611\",\"17612\",\"17613\",\"17614\",\"17615\",\"17616\",\"17617\",\"17618\",\"17619\",\"17620\",\"17621\",\"17622\",\"17623\",\"17624\",\"17625\",\"17626\",\"17627\",\"17628\",\"17629\",\"17630\",\"17631\",\"17632\",\"17633\",\"17634\",\"17635\",\"17636\",\"17637\",\"17638\",\"17639\",\"17640\",\"17641\",\"17642\",\"17643\",\"17644\",\"17645\",\"17646\",\"17647\",\"17648\",\"17649\",\"17650\",\"17651\",\"17652\",\"17653\",\"17654\",\"17655\",\"17656\",\"17657\",\"17658\",\"17659\",\"17660\",\"17661\",\"17662\",\"17663\",\"17664\",\"17665\",\"17666\",\"17667\",\"17668\",\"17669\",\"17670\",\"17671\",\"17672\",\"17673\",\"17674\",\"17675\",\"17676\",\"17677\",\"17678\",\"17679\",\"17680\",\"17681\",\"17682\",\"17683\",\"17684\",\"17685\",\"17686\",\"17687\",\"17688\",\"17689\",\"17690\",\"17691\",\"17692\",\"17693\",\"17694\",\"17695\",\"17696\",\"17697\",\"17698\",\"17699\",\"17700\",\"17701\",\"17702\",\"17703\",\"17704\",\"17705\",\"17706\",\"17707\",\"17708\",\"17709\",\"17710\",\"17711\",\"17712\",\"17713\",\"17714\",\"17715\",\"17716\",\"17717\",\"17718\",\"17719\",\"17720\",\"17721\",\"17722\",\"17723\",\"17724\",\"17725\",\"17726\",\"17727\",\"17728\",\"17729\",\"17730\",\"17731\",\"17732\",\"17733\",\"17734\",\"17735\",\"17736\",\"17789\",\"17790\",\"17791\",\"17792\",\"17793\",\"17794\",\"17795\",\"17796\",\"17797\",\"17798\",\"17799\",\"17800\",\"17801\",\"17802\",\"17803\",\"17804\",\"17805\",\"17806\",\"17807\",\"17808\",\"17809\",\"17810\",\"17811\",\"17812\",\"17813\",\"17814\",\"17815\",\"17816\",\"17817\",\"17818\",\"17819\",\"17820\",\"17821\",\"17822\",\"17823\",\"17824\",\"17825\",\"17826\",\"17827\",\"17828\",\"17829\",\"17830\",\"17831\",\"17832\",\"17834\",\"17835\",\"17836\",\"17837\",\"17838\",\"17839\",\"17840\",\"17841\",\"17842\",\"17843\",\"17844\",\"17845\",\"17846\",\"17847\",\"17848\",\"17849\",\"17850\",\"17851\",\"17852\",\"17853\",\"17854\",\"17855\",\"17856\",\"17857\",\"17858\",\"17859\",\"17860\",\"17861\",\"17862\",\"17863\",\"17864\",\"17865\",\"17866\",\"17867\",\"17868\",\"17869\",\"17870\",\"17871\",\"17872\",\"17873\",\"17874\",\"17875\",\"17876\",\"17877\",\"17878\",\"17879\",\"17880\",\"17881\",\"17882\",\"17883\",\"17884\",\"17885\",\"17886\",\"17887\",\"17737\",\"17738\",\"17739\",\"17740\",\"17741\",\"17742\",\"17743\",\"17744\",\"17745\",\"17746\",\"17747\",\"17748\",\"17749\",\"17750\",\"17751\",\"17752\",\"17753\",\"17754\",\"17755\",\"17756\",\"17757\",\"17758\",\"17759\",\"17760\",\"17761\",\"17762\",\"17763\",\"17764\",\"17765\",\"17766\",\"17767\",\"17768\",\"17769\",\"17770\",\"17771\",\"17772\",\"17773\",\"17774\",\"17775\",\"17776\",\"17777\",\"17778\",\"17779\",\"17780\",\"17781\",\"17782\",\"17783\",\"17784\",\"17785\",\"17786\",\"17787\",\"17788\",\"17888\",\"17889\",\"17890\",\"17891\",\"17892\",\"17893\",\"17894\",\"17895\",\"17896\",\"17897\",\"17898\",\"17899\",\"17900\",\"17901\",\"17902\",\"17903\",\"17904\",\"17905\",\"17906\",\"17907\",\"17908\",\"17909\",\"17910\",\"17911\",\"17912\",\"17913\",\"17914\",\"17915\",\"17916\",\"17917\",\"17918\",\"17919\",\"17920\",\"17921\",\"17922\",\"17923\",\"17924\",\"17925\",\"17926\",\"17927\",\"17928\",\"17929\",\"17930\",\"17931\",\"17932\",\"17933\",\"17934\",\"17935\",\"17936\",\"17937\",\"17938\",\"17939\",\"17940\",\"17941\",\"17942\",\"17943\",\"17944\",\"17945\",\"17946\",\"17947\",\"17948\",\"17949\",\"17950\",\"17951\",\"17952\",\"17953\",\"17954\",\"17955\",\"17956\",\"17957\",\"17958\",\"17959\",\"17960\",\"17961\",\"17962\",\"17963\",\"17964\",\"17965\",\"17966\",\"17967\",\"17968\",\"17969\",\"17970\",\"17971\",\"17972\",\"17973\",\"17974\",\"17975\",\"17976\",\"17977\",\"17978\",\"17979\",\"17980\",\"17981\",\"17982\",\"17983\",\"17984\",\"17985\",\"17986\",\"17987\",\"17988\",\"17989\",\"17990\",\"17991\",\"17992\",\"17993\",\"17994\",\"17995\",\"17996\",\"17997\",\"17998\",\"17999\",\"18000\",\"18001\",\"18002\",\"18003\",\"18004\",\"18005\",\"18006\",\"18007\",\"18008\",\"18009\",\"18010\",\"18011\",\"18012\",\"18013\",\"18014\",\"18015\",\"18016\",\"18017\",\"18018\",\"18019\",\"18020\",\"18021\",\"18022\",\"18023\",\"18024\",\"18025\",\"18026\",\"18027\",\"18028\",\"18029\",\"18030\",\"18031\",\"18032\",\"18033\",\"18034\",\"18035\",\"18036\",\"18037\",\"18038\",\"18039\",\"18040\",\"18041\",\"18042\",\"18043\",\"18044\",\"18045\",\"18046\",\"18047\",\"18048\",\"18049\",\"18050\",\"18051\",\"18052\",\"18053\",\"18054\",\"18055\",\"18056\",\"18057\",\"18058\",\"18059\",\"18060\",\"18061\",\"18062\",\"18063\",\"18064\",\"18065\",\"18066\",\"18067\",\"18068\",\"18069\",\"18070\",\"18071\",\"18072\",\"18073\",\"18074\",\"18075\",\"18076\",\"18077\",\"18078\",\"18079\",\"18080\",\"18081\",\"18082\",\"18083\",\"18084\",\"18085\",\"18086\",\"18087\",\"18088\",\"18089\",\"18090\",\"18091\",\"18092\",\"18093\",\"18094\",\"18095\",\"18096\",\"18097\",\"18098\",\"18099\",\"18100\",\"18101\",\"18102\",\"18103\",\"18104\",\"18105\",\"18106\",\"18107\",\"18108\",\"18109\",\"18110\",\"18111\",\"18112\",\"18113\",\"18114\",\"18115\",\"18116\",\"18117\",\"18118\",\"18119\",\"18120\",\"18121\",\"18122\",\"18123\",\"18124\",\"18125\",\"18126\",\"18127\",\"18128\",\"18129\",\"18130\",\"18131\",\"18132\",\"18133\",\"18134\",\"18135\",\"18136\",\"18137\",\"18138\",\"18139\",\"18140\",\"18141\",\"18142\",\"18143\",\"18144\",\"18145\",\"18146\",\"18147\",\"18148\",\"18149\",\"18150\",\"18151\",\"18152\",\"18153\",\"18154\",\"18155\",\"18156\",\"18157\",\"18158\",\"18159\",\"18160\",\"18161\",\"18162\",\"18163\",\"18164\",\"18165\",\"18166\",\"18167\",\"18168\",\"18169\",\"18170\",\"18171\",\"18172\",\"18173\",\"18174\",\"18175\",\"18176\",\"18177\",\"18178\",\"18179\",\"18180\",\"18181\",\"18182\",\"18183\",\"18184\",\"18185\",\"18186\",\"18187\",\"18188\",\"18189\",\"18190\",\"18191\",\"18192\",\"18193\",\"18194\",\"18195\",\"18196\",\"18197\",\"18198\",\"18199\",\"18200\",\"18201\",\"18202\",\"18203\",\"18204\",\"18205\",\"18206\",\"18207\",\"18208\",\"18209\",\"18210\",\"18211\",\"18212\",\"18213\",\"18214\",\"18215\",\"18216\",\"18217\",\"18218\",\"18219\",\"18220\",\"18221\",\"18222\",\"18223\",\"18224\",\"18225\",\"18226\",\"18227\",\"18228\",\"18229\",\"18230\",\"18231\",\"18232\",\"18233\",\"18234\",\"18235\",\"18236\",\"18237\",\"18238\",\"18239\",\"18240\",\"18241\",\"18242\",\"18243\",\"18244\",\"18245\",\"18246\",\"18247\",\"18248\",\"18249\",\"18250\",\"18251\",\"18252\",\"18253\",\"18254\",\"18255\",\"18256\",\"18257\",\"18258\",\"18259\",\"18260\",\"18261\",\"18262\",\"18263\",\"18264\",\"18265\",\"18266\",\"18267\",\"18268\",\"18269\",\"18270\",\"18271\",\"18272\",\"18273\",\"18274\",\"18275\",\"18276\",\"18277\",\"18278\",\"18279\",\"18280\",\"18281\",\"18282\",\"18283\",\"18284\",\"18285\",\"18286\",\"18287\",\"18288\",\"18289\",\"18290\",\"18291\",\"18292\",\"18293\",\"18294\",\"18295\",\"18296\",\"18297\",\"18298\",\"18299\",\"18300\",\"18301\",\"18302\",\"18303\",\"18304\",\"18305\",\"18306\",\"18307\",\"18308\",\"18309\",\"18310\",\"18311\",\"18312\",\"18313\",\"18314\",\"18315\",\"18316\",\"18317\",\"18318\",\"18319\",\"18320\",\"18321\",\"18322\",\"18323\",\"18324\",\"18325\",\"18326\",\"18327\",\"18328\",\"18329\",\"18330\",\"18331\",\"18332\",\"18333\",\"18334\",\"18335\",\"18336\",\"18337\",\"18338\",\"18339\",\"18340\",\"18341\",\"18342\",\"18343\",\"18344\",\"18345\",\"18346\",\"18347\",\"18348\",\"18349\",\"18350\",\"18351\",\"18352\",\"18353\",\"18354\",\"18355\",\"18356\",\"18357\",\"18358\",\"18359\",\"18360\",\"18361\",\"18362\",\"18363\",\"18364\",\"18365\",\"18366\",\"18367\",\"18368\",\"18369\",\"18370\",\"18371\",\"18372\",\"18373\",\"18374\",\"18375\",\"18376\",\"18377\",\"18378\",\"18379\",\"18380\",\"18381\",\"18382\",\"18383\",\"18384\",\"18385\",\"18386\",\"18387\",\"18388\",\"18389\",\"18390\",\"18391\",\"18392\",\"18393\",\"18394\",\"18395\",\"18396\",\"18397\",\"18398\",\"18399\",\"18400\",\"18401\",\"18402\",\"18403\",\"18404\",\"18405\",\"18406\",\"18407\",\"18408\",\"18409\",\"18410\",\"18411\",\"18412\",\"18413\",\"18414\",\"18415\",\"18416\",\"18417\",\"18418\",\"18419\",\"18420\",\"18421\",\"18422\",\"18423\",\"18424\",\"18425\",\"18426\",\"18427\",\"18428\",\"18429\",\"18430\",\"18431\",\"18432\",\"18433\",\"18434\",\"18435\",\"18436\",\"18437\",\"18438\",\"18439\",\"18440\",\"18441\",\"18442\",\"18443\",\"18444\",\"18445\",\"18446\",\"18447\",\"18448\",\"18449\",\"18450\",\"18451\",\"18452\",\"18453\",\"18454\",\"18455\",\"18456\",\"18457\",\"18458\",\"18459\",\"18460\",\"18461\",\"18462\",\"18463\",\"18464\",\"18465\",\"18466\",\"18467\",\"18468\",\"18469\",\"18470\",\"18471\",\"18472\",\"18473\",\"18474\",\"18475\",\"18476\",\"18477\",\"18478\",\"18479\",\"18480\",\"18481\",\"18482\",\"18483\",\"18484\",\"18485\",\"18486\",\"18487\",\"18488\",\"18489\",\"18490\",\"18491\",\"18492\",\"18493\",\"18494\",\"18495\",\"18496\",\"18497\",\"18498\",\"18499\",\"18500\",\"18501\",\"18502\",\"18503\",\"18504\",\"18505\",\"18506\",\"18507\",\"18508\",\"18509\",\"18510\",\"18511\",\"18512\",\"18513\",\"18514\",\"18515\",\"18516\",\"18517\",\"18518\",\"18519\",\"18520\",\"18521\",\"18522\",\"18523\",\"18524\",\"18525\",\"18526\",\"18527\",\"18528\",\"18529\",\"18530\",\"18531\",\"18532\",\"18533\",\"18534\",\"18535\",\"18536\",\"18537\",\"18538\",\"18539\",\"18540\",\"18541\",\"18542\",\"18543\",\"18544\",\"18545\",\"18546\",\"18547\",\"18548\",\"18549\",\"18550\",\"18551\",\"18552\",\"18553\",\"18554\",\"18555\",\"18556\",\"18557\",\"18558\",\"18559\",\"18560\",\"18561\",\"18562\",\"18563\",\"18564\",\"18565\",\"18566\",\"18567\",\"18568\",\"18569\",\"18570\",\"18571\",\"18572\",\"18573\",\"18574\",\"18575\",\"18576\",\"18577\",\"18578\",\"18579\",\"18580\",\"18581\",\"18582\",\"18583\",\"18584\",\"18585\",\"18586\",\"18587\",\"18588\",\"18589\",\"18590\",\"18591\",\"18592\",\"18593\",\"18594\",\"18595\",\"18596\",\"18597\",\"18598\",\"18599\",\"18600\",\"18601\",\"18602\",\"18603\",\"18604\",\"18605\",\"18606\",\"18607\",\"18608\",\"18609\",\"18610\",\"18611\",\"18612\",\"18613\",\"18614\",\"18615\",\"18616\",\"18617\",\"18618\",\"18619\",\"18620\",\"18621\",\"18622\",\"18623\",\"18624\",\"18625\",\"18626\",\"18627\",\"18628\",\"18629\",\"18630\",\"18631\",\"18632\",\"18633\",\"18634\",\"18635\",\"18636\",\"18637\",\"18638\",\"18639\",\"18640\",\"18641\",\"18642\",\"18643\",\"18644\",\"18645\",\"18646\",\"18647\",\"18648\",\"18649\",\"18650\",\"18651\",\"18652\",\"18653\",\"18654\",\"18655\",\"18656\",\"18657\",\"18658\",\"18659\",\"18660\",\"18661\",\"18662\",\"18663\",\"18664\",\"18665\",\"18666\",\"18667\",\"18668\",\"18669\",\"18670\",\"18671\",\"18672\",\"18673\",\"18674\",\"18675\",\"18676\",\"18677\",\"18678\",\"18679\",\"18680\",\"18681\",\"18682\",\"18683\",\"18684\",\"18685\",\"18686\",\"18687\",\"18688\",\"18689\",\"18690\",\"18691\",\"18692\",\"18693\",\"18694\",\"18695\",\"18696\",\"18697\",\"18698\",\"18699\",\"18700\",\"18701\",\"18702\",\"18703\",\"18704\",\"18705\",\"18706\",\"18707\",\"18708\",\"18709\",\"18710\",\"18711\",\"18712\",\"18713\",\"18714\",\"18715\",\"18716\",\"18717\",\"18718\",\"18719\",\"18720\",\"18721\",\"18722\",\"18723\",\"18724\",\"18725\",\"18726\",\"18727\",\"18728\",\"18729\",\"18730\",\"18731\",\"18732\",\"18733\",\"18734\",\"18735\",\"18736\",\"18737\",\"18738\",\"18739\",\"18740\",\"18741\",\"18742\",\"18743\",\"18744\",\"18745\",\"18746\",\"18747\",\"18748\",\"18749\",\"18750\",\"18751\",\"18752\",\"18753\",\"18754\",\"18755\",\"18756\",\"18757\",\"18758\",\"18759\",\"18760\",\"18761\",\"18762\",\"18763\",\"18764\",\"18765\",\"18766\",\"18767\",\"18768\",\"18769\",\"18770\",\"18771\",\"18772\",\"18773\",\"18774\",\"18775\",\"18776\",\"18777\",\"18778\",\"18779\",\"18780\",\"18781\",\"18782\",\"18783\",\"18784\",\"18785\",\"18786\",\"18787\",\"18788\",\"18789\",\"18790\",\"18791\",\"18792\",\"18793\",\"18794\",\"18795\",\"18796\",\"18797\",\"18798\",\"18799\",\"18800\",\"18801\",\"18802\",\"18803\",\"18804\",\"18805\",\"18806\",\"18807\",\"18808\",\"18809\",\"18810\",\"18811\",\"18812\",\"18813\",\"18814\",\"18815\",\"18816\",\"18817\",\"18818\",\"18819\",\"18820\",\"18821\",\"18822\",\"18823\",\"18824\",\"18825\",\"18826\",\"18827\",\"18828\",\"18829\",\"18830\",\"18831\",\"18832\",\"18833\",\"18834\",\"18835\",\"18836\",\"18837\",\"18838\",\"18839\",\"18840\",\"18841\",\"18842\",\"18843\",\"18844\",\"18845\",\"18846\",\"18847\",\"18848\",\"18849\",\"18850\",\"18851\",\"18852\",\"18853\",\"18854\",\"18855\",\"18856\",\"18857\",\"18858\",\"18859\",\"18860\",\"18861\",\"18862\",\"18863\",\"18864\",\"18865\",\"18866\",\"18867\",\"18868\",\"18869\",\"18870\",\"18871\",\"18872\",\"18873\",\"18874\",\"18875\",\"18876\",\"18877\",\"18878\",\"18879\",\"18880\",\"18881\",\"18882\",\"18883\",\"18884\",\"18885\",\"18886\",\"18887\",\"18888\",\"18889\",\"18890\",\"18891\",\"18892\",\"18893\",\"18894\",\"18895\",\"18896\",\"18897\",\"18898\",\"18899\",\"18900\",\"18901\",\"18902\",\"18903\",\"18904\",\"18905\",\"18906\",\"18907\",\"18908\",\"18909\",\"18910\",\"18911\",\"18912\",\"18913\",\"18914\",\"18915\",\"18916\",\"18917\",\"18918\",\"18919\",\"18920\",\"18921\",\"18922\",\"18923\",\"18924\",\"18925\",\"18926\",\"18927\",\"18928\",\"18929\",\"18930\",\"18931\",\"18932\",\"18933\",\"18934\",\"18935\",\"18936\",\"18937\",\"18938\",\"18939\",\"18940\",\"18941\",\"18942\",\"18943\",\"18944\",\"18945\",\"18946\",\"18947\",\"18948\",\"18949\",\"18950\",\"18951\",\"18952\",\"18953\",\"18954\",\"18955\",\"18956\",\"18957\",\"18958\",\"18959\",\"18960\",\"18961\",\"18962\",\"18963\",\"18964\",\"18965\",\"18966\",\"18967\",\"18968\",\"18969\",\"18970\",\"18971\",\"18972\",\"18973\",\"18974\",\"18975\",\"18976\",\"18977\",\"18978\",\"18979\",\"18980\",\"18981\",\"18982\",\"18983\",\"18984\",\"18985\",\"18986\",\"18987\",\"18988\",\"18989\",\"18990\",\"18991\",\"18992\",\"18993\",\"18994\",\"18995\",\"18996\",\"18997\",\"18998\",\"18999\",\"19000\",\"19001\",\"19002\",\"19003\",\"19004\",\"19005\",\"19006\",\"19007\",\"19008\",\"19009\",\"19010\",\"19011\",\"19012\",\"19013\",\"19014\",\"19015\",\"19016\",\"19017\",\"19018\",\"19019\",\"19020\",\"19021\",\"19022\",\"19023\",\"19024\",\"19025\",\"19026\",\"19027\",\"19028\",\"19029\",\"19030\",\"19031\",\"19032\",\"19033\",\"19034\",\"19035\",\"19036\",\"19037\",\"19038\",\"19039\",\"19040\",\"19041\",\"19042\",\"19043\",\"19044\",\"19045\",\"19046\",\"19047\",\"19048\",\"19049\",\"19050\",\"19051\",\"19052\",\"19053\",\"19054\",\"19055\",\"19056\",\"19057\",\"19058\",\"19059\",\"19060\",\"19061\",\"19062\",\"19063\",\"19064\",\"19065\",\"19066\",\"19067\",\"19068\",\"19069\",\"19070\",\"19071\",\"19072\",\"19073\",\"19074\",\"19075\",\"19076\",\"19077\",\"19078\",\"19079\",\"19080\",\"19081\",\"19082\",\"19083\",\"19084\",\"19085\",\"19086\",\"19087\",\"19088\",\"19089\",\"19090\",\"19091\",\"19092\",\"19093\",\"19094\",\"19095\",\"19096\",\"19097\",\"19098\",\"19099\",\"19100\",\"19101\",\"19102\",\"19103\",\"19104\",\"19105\",\"19106\",\"19107\",\"19108\",\"19109\",\"19110\",\"19111\",\"19112\",\"19113\",\"19114\",\"19115\",\"19116\",\"19117\",\"19118\",\"19119\",\"19120\",\"19121\",\"19122\",\"19123\",\"19124\",\"19125\",\"19126\",\"19127\",\"19128\",\"19129\",\"19130\",\"19131\",\"19132\",\"19133\",\"19134\",\"19135\",\"19136\",\"19137\",\"19138\",\"19139\",\"19140\",\"19141\",\"19142\",\"19143\",\"19144\",\"19145\",\"19146\",\"19147\",\"19148\",\"19149\",\"19150\",\"19151\",\"19152\",\"19153\",\"19154\",\"19155\",\"19156\",\"19157\",\"19158\",\"19159\",\"19160\",\"19161\",\"19162\",\"19163\",\"19164\",\"19165\",\"19166\",\"19167\",\"19168\",\"19169\",\"19170\",\"19171\",\"19172\",\"19173\",\"19174\",\"19175\",\"19176\",\"19177\",\"19178\",\"19179\",\"19180\",\"19181\",\"19182\",\"19183\",\"19184\",\"19185\",\"19186\",\"19187\",\"19188\",\"19189\",\"19190\",\"19191\",\"19192\",\"19193\",\"19194\",\"19195\",\"19196\",\"19197\",\"19198\",\"19199\",\"19200\",\"19201\",\"19202\",\"19203\",\"19204\",\"19205\",\"19206\",\"19207\",\"19208\",\"19209\",\"19210\",\"19211\",\"19212\",\"19213\",\"19214\",\"19215\",\"19216\",\"19217\",\"19218\",\"19219\",\"19220\",\"19221\",\"19222\",\"19223\",\"19224\",\"19225\",\"19226\",\"19227\",\"19228\",\"19229\",\"19230\",\"19231\",\"19232\",\"19233\",\"19234\",\"19235\",\"19236\",\"19237\",\"19238\",\"19239\",\"19240\",\"19241\",\"19242\",\"19243\",\"19244\",\"19245\",\"19246\",\"19247\",\"19248\",\"19249\",\"19250\",\"19251\",\"19252\",\"19253\",\"19254\",\"19255\",\"19256\",\"19257\",\"19258\",\"19259\",\"19260\",\"19261\",\"19262\",\"19263\",\"19264\",\"19265\",\"19266\",\"19267\",\"19268\",\"19269\",\"19270\",\"19271\",\"19272\",\"19273\",\"19274\",\"19275\",\"19276\",\"19277\",\"19278\",\"19279\",\"19280\",\"19281\",\"19282\",\"19283\",\"19284\",\"19285\",\"19286\",\"19287\",\"19288\",\"19289\",\"19290\",\"19291\",\"19292\",\"19293\",\"19294\",\"19295\",\"19296\",\"19297\",\"19298\",\"19299\",\"19300\",\"19301\",\"19302\",\"19303\",\"19304\",\"19305\",\"19306\",\"19307\",\"19308\",\"19309\",\"19310\",\"19311\",\"19312\",\"19313\",\"19314\",\"19315\",\"19316\",\"19317\",\"19318\",\"19319\",\"19320\",\"19321\",\"19322\",\"19323\",\"19324\",\"19325\",\"19326\",\"19327\",\"19328\",\"19329\",\"19330\",\"19331\",\"19332\",\"19333\",\"19334\",\"19335\",\"19336\",\"19337\",\"19338\",\"19339\",\"19340\",\"19341\",\"19342\",\"19343\",\"19344\",\"19345\",\"19346\",\"19347\",\"19348\",\"19349\",\"19350\",\"19351\",\"19352\",\"19353\",\"19354\",\"19355\",\"19356\",\"19357\",\"19358\",\"19359\",\"19360\",\"19361\",\"19362\",\"19363\",\"19364\",\"19365\",\"19366\",\"19367\",\"19368\",\"19369\",\"19370\",\"19371\",\"19372\",\"19373\",\"19374\",\"19375\",\"19376\",\"19377\",\"19378\",\"19379\",\"19380\",\"19381\",\"19382\",\"19383\",\"19384\",\"19385\",\"19386\",\"19387\",\"19388\",\"19389\",\"19390\",\"19391\",\"19392\",\"19393\",\"19394\",\"19395\",\"19396\",\"19397\",\"19398\",\"19399\",\"19400\",\"19401\",\"19402\",\"19403\",\"19404\",\"19405\",\"19406\",\"19407\",\"19408\",\"19409\",\"19410\",\"19411\",\"19412\",\"19413\",\"19414\",\"19415\",\"19416\",\"19417\",\"19418\",\"19419\",\"19420\",\"19421\",\"19422\",\"19423\",\"19424\",\"19425\",\"19426\",\"19427\",\"19428\",\"19429\",\"19430\",\"19431\",\"19432\",\"19433\",\"19434\",\"19435\",\"19436\",\"19437\",\"19438\",\"19439\",\"19440\",\"19441\",\"19442\",\"19443\",\"19444\",\"19445\",\"19446\",\"19447\",\"19448\",\"19449\",\"19450\",\"19451\",\"19452\",\"19453\",\"19454\",\"19455\",\"19456\",\"19457\",\"19458\",\"19459\",\"19460\",\"19461\",\"19463\",\"19465\",\"19466\",\"19467\",\"19468\",\"19469\",\"19470\",\"19472\",\"19473\",\"19474\",\"19475\",\"19476\",\"19477\",\"19478\",\"19479\",\"19480\",\"19481\",\"19482\",\"19483\",\"19484\",\"19485\",\"19486\",\"19487\",\"19488\",\"19489\",\"19490\",\"19491\",\"19492\",\"19493\",\"19494\",\"19495\",\"19496\",\"19497\",\"19498\",\"19499\",\"19500\",\"19501\",\"19502\",\"19503\",\"19504\",\"19505\",\"19506\",\"19507\",\"19508\",\"19509\",\"19510\",\"19511\",\"19512\",\"19462\",\"19464\",\"19471\",\"19513\",\"19514\",\"19515\",\"19516\",\"19517\",\"19518\",\"19519\",\"19520\",\"19521\",\"19522\",\"19523\",\"19524\",\"19525\",\"19526\",\"19527\",\"19528\",\"19529\",\"19530\",\"19531\",\"19532\",\"19533\",\"19534\",\"19535\",\"19536\",\"19537\",\"19538\",\"19539\",\"19540\",\"19541\",\"19542\",\"19543\",\"19544\",\"19545\",\"19546\",\"19547\",\"19548\",\"19549\",\"19550\",\"19551\",\"19552\",\"19553\",\"19554\",\"19555\",\"19556\",\"19557\",\"19558\",\"19559\",\"19560\",\"19561\",\"19562\",\"19563\",\"19564\",\"19565\",\"19566\",\"19567\",\"19568\",\"19569\",\"19570\",\"19571\",\"19572\",\"19573\",\"19574\",\"19575\",\"19576\",\"19577\",\"19578\",\"19579\",\"19580\",\"19581\",\"19582\",\"19583\",\"19584\",\"19585\",\"19586\",\"19587\",\"19588\",\"19589\",\"19590\",\"19591\",\"19592\",\"19593\",\"19594\",\"19595\",\"19596\",\"19597\",\"19598\",\"19599\",\"19600\",\"19601\",\"19602\",\"19603\",\"19604\",\"19605\",\"19606\",\"19607\",\"19608\",\"19609\",\"19610\",\"19611\",\"19612\",\"19613\",\"19614\",\"19615\",\"19616\",\"19617\",\"19618\",\"19619\",\"19620\",\"19621\",\"19622\",\"19623\",\"19624\",\"19625\",\"19626\",\"19627\",\"19628\",\"19629\",\"19630\",\"19631\",\"19632\",\"19633\",\"19634\",\"19635\",\"19636\",\"19637\",\"19638\",\"19639\",\"19640\",\"19641\",\"19642\",\"19643\",\"19644\",\"19645\",\"19646\",\"19647\",\"19648\",\"19649\",\"19650\",\"19651\",\"19652\",\"19653\",\"19654\",\"19655\",\"19656\",\"19657\",\"19658\",\"19659\",\"19660\",\"19661\",\"19662\",\"19663\",\"19664\",\"19665\",\"19666\",\"19667\",\"19668\",\"19669\",\"19670\",\"19671\",\"19672\",\"19673\",\"19674\",\"19675\",\"19676\",\"19677\",\"19678\",\"19679\",\"19680\",\"19681\",\"19682\",\"19683\",\"19684\",\"19685\",\"19686\",\"19687\",\"19688\",\"19689\",\"19690\",\"19691\",\"19692\",\"19693\",\"19694\",\"19695\",\"19696\",\"19697\",\"19698\",\"19699\",\"19700\",\"19701\",\"19702\",\"19703\",\"19704\",\"19705\",\"19706\",\"19707\",\"19708\",\"19709\",\"19710\",\"19711\",\"19712\",\"19713\",\"19714\",\"19715\",\"19716\",\"19717\",\"19718\",\"19719\",\"19720\",\"19721\",\"19722\",\"19723\",\"19724\",\"19725\",\"19726\",\"19727\",\"19728\",\"19729\",\"19730\",\"19731\",\"19732\",\"19733\",\"19734\",\"19735\",\"19736\",\"19737\",\"19738\"]');
INSERT INTO `tmp_browse` (`id`, `sid`, `data`, `object_data`) VALUES
(55, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `song` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`song`.`id`\"],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"song\",\"total\":40}', '[\"19052\",\"19053\",\"19054\",\"19055\",\"19056\",\"19057\",\"19058\",\"19059\",\"19060\",\"19061\",\"19062\",\"19063\",\"19064\",\"19065\",\"19066\",\"19067\",\"19068\",\"19069\",\"19070\",\"19071\",\"19072\",\"19073\",\"19074\",\"19075\",\"19076\",\"19077\",\"19078\",\"19079\",\"19080\",\"19081\",\"19082\",\"19083\",\"19084\",\"19085\",\"19086\",\"19087\",\"19088\",\"19089\",\"19090\",\"19091\"]'),
(56, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `album` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`album`.`id`\"],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":false,\"use_alpha\":false,\"grid_view\":true,\"type\":\"album\",\"ak\":\"album\",\"total\":2}', '[\"1107\",\"1106\"]'),
(1, '711b7ff36e33dd4761ee556c041760d8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\",\"catalog\":0},\"select\":[\"`artist`.`id`\"],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"artist\",\"update_session\":true,\"sort\":{\"name\":\"ASC\"},\"total\":166}', NULL),
(2, '711b7ff36e33dd4761ee556c041760d8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\",\"catalog\":0},\"select\":[\"`artist`.`id`\"],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"artist\",\"update_session\":true,\"sort\":{\"name\":\"ASC\"},\"total\":166}', NULL),
(3, '711b7ff36e33dd4761ee556c041760d8', '{\"base\":\"SELECT %%SELECT%% FROM `live_stream` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`live_stream`.`id`\"],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"live_stream\",\"update_session\":true,\"sort\":{\"name\":\"ASC\"},\"total\":0}', NULL),
(4, '711b7ff36e33dd4761ee556c041760d8', '{\"base\":\"SELECT %%SELECT%% FROM `live_stream` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`live_stream`.`id`\"],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"live_stream\",\"update_session\":true,\"sort\":{\"name\":\"ASC\"},\"total\":0}', NULL),
(5, '711b7ff36e33dd4761ee556c041760d8', '{\"base\":\"SELECT %%SELECT%% FROM `live_stream` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`live_stream`.`id`\"],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"live_stream\",\"update_session\":true,\"sort\":{\"name\":\"ASC\"},\"total\":0}', NULL),
(6, '711b7ff36e33dd4761ee556c041760d8', '{\"base\":\"SELECT %%SELECT%% FROM `song` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`song`.`id`\"],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"song\",\"total\":1069}', '[\"12092\",\"12093\",\"12094\",\"12095\",\"12096\",\"12097\",\"12098\",\"12099\",\"12100\",\"12101\",\"12102\",\"12103\",\"12104\",\"12105\",\"12106\",\"12107\",\"12108\",\"12109\",\"12110\",\"12111\",\"12112\",\"12113\",\"12114\",\"12115\",\"12116\",\"12117\",\"12118\",\"12119\",\"12120\",\"12121\",\"12122\",\"12123\",\"12124\",\"12125\",\"12126\",\"12127\",\"12128\",\"12129\",\"12130\",\"12131\",\"12132\",\"12133\",\"12134\",\"12135\",\"12136\",\"12137\",\"12138\",\"12139\",\"12140\",\"12141\",\"12142\",\"12143\",\"12144\",\"12145\",\"12146\",\"12147\",\"12148\",\"12149\",\"12150\",\"12151\",\"12152\",\"12153\",\"12154\",\"12155\",\"12156\",\"12157\",\"12158\",\"12159\",\"12160\",\"12161\",\"12162\",\"12163\",\"12164\",\"12165\",\"12166\",\"12167\",\"12168\",\"12169\",\"12170\",\"12171\",\"12172\",\"12173\",\"12174\",\"12175\",\"12176\",\"12177\",\"12178\",\"12179\",\"12180\",\"12181\",\"12182\",\"12183\",\"12184\",\"12185\",\"12186\",\"12187\",\"12188\",\"12189\",\"12190\",\"12191\",\"12192\",\"12193\",\"12194\",\"12195\",\"12196\",\"12197\",\"12198\",\"12199\",\"12200\",\"12201\",\"12202\",\"12203\",\"12204\",\"12205\",\"12206\",\"12207\",\"12208\",\"12209\",\"12210\",\"12211\",\"12212\",\"12213\",\"12214\",\"12215\",\"12216\",\"12217\",\"12218\",\"12219\",\"12220\",\"12221\",\"12222\",\"12223\",\"12224\",\"12225\",\"12226\",\"12227\",\"12228\",\"12229\",\"12230\",\"12231\",\"12232\",\"12233\",\"12234\",\"12235\",\"12236\",\"12237\",\"12238\",\"12239\",\"12240\",\"12241\",\"12242\",\"12243\",\"12244\",\"12245\",\"12246\",\"12247\",\"12248\",\"12249\",\"12250\",\"12251\",\"12252\",\"12253\",\"12254\",\"12255\",\"12256\",\"12257\",\"12258\",\"12259\",\"12260\",\"12261\",\"12262\",\"12263\",\"12264\",\"12265\",\"12266\",\"12267\",\"12268\",\"12269\",\"12270\",\"12271\",\"12272\",\"12273\",\"12274\",\"12275\",\"12276\",\"12277\",\"12278\",\"12279\",\"12280\",\"12281\",\"12282\",\"12283\",\"12284\",\"12285\",\"12286\",\"12287\",\"12288\",\"12289\",\"12290\",\"12291\",\"12292\",\"12293\",\"12294\",\"12295\",\"12296\",\"12297\",\"12298\",\"12299\",\"12300\",\"12301\",\"12302\",\"12303\",\"12304\",\"12305\",\"12306\",\"12307\",\"12308\",\"12309\",\"12310\",\"12311\",\"12312\",\"12313\",\"12314\",\"12315\",\"12316\",\"12317\",\"12318\",\"12319\",\"12320\",\"12321\",\"12322\",\"12323\",\"12324\",\"12325\",\"12326\",\"12327\",\"12328\",\"12329\",\"12330\",\"12331\",\"12332\",\"12333\",\"12334\",\"12335\",\"12336\",\"12337\",\"12338\",\"12339\",\"12340\",\"12341\",\"12342\",\"12343\",\"12344\",\"12345\",\"12346\",\"12347\",\"12348\",\"12349\",\"12350\",\"12351\",\"12352\",\"12353\",\"12354\",\"12355\",\"12356\",\"12357\",\"12358\",\"12359\",\"12360\",\"12361\",\"12362\",\"12363\",\"12364\",\"12365\",\"12366\",\"12367\",\"12368\",\"12369\",\"12370\",\"12371\",\"12372\",\"12373\",\"12374\",\"12375\",\"12376\",\"12377\",\"12378\",\"12379\",\"12380\",\"12381\",\"12382\",\"12383\",\"12384\",\"12385\",\"12386\",\"12387\",\"12388\",\"12389\",\"12390\",\"12391\",\"12392\",\"12393\",\"12394\",\"12395\",\"12396\",\"12397\",\"12398\",\"12399\",\"12400\",\"12401\",\"12402\",\"12403\",\"12404\",\"12405\",\"12406\",\"12407\",\"12408\",\"12409\",\"12410\",\"12411\",\"12412\",\"12413\",\"12414\",\"12415\",\"12416\",\"12417\",\"12418\",\"12419\",\"12420\",\"12421\",\"12422\",\"12423\",\"12424\",\"12425\",\"12426\",\"12427\",\"12428\",\"12429\",\"12430\",\"12431\",\"12432\",\"12433\",\"12434\",\"12435\",\"12436\",\"12437\",\"12438\",\"12439\",\"12440\",\"12441\",\"12442\",\"12443\",\"12444\",\"12445\",\"12446\",\"12447\",\"12448\",\"12449\",\"12450\",\"12451\",\"12452\",\"12453\",\"12454\",\"12455\",\"12456\",\"12457\",\"12458\",\"12459\",\"12460\",\"12461\",\"12462\",\"12463\",\"12464\",\"12465\",\"12466\",\"12467\",\"12468\",\"12469\",\"12470\",\"12471\",\"12472\",\"12473\",\"12474\",\"12475\",\"12476\",\"12477\",\"12478\",\"12479\",\"12480\",\"12481\",\"12482\",\"12483\",\"12484\",\"12485\",\"12486\",\"12487\",\"12488\",\"12489\",\"12490\",\"12491\",\"12492\",\"12493\",\"12494\",\"12495\",\"12496\",\"12497\",\"12498\",\"12499\",\"12500\",\"12501\",\"12502\",\"12503\",\"12504\",\"12505\",\"12506\",\"12507\",\"12508\",\"12509\",\"12510\",\"12511\",\"12512\",\"12513\",\"12514\",\"12515\",\"12516\",\"12517\",\"12518\",\"12519\",\"12520\",\"12521\",\"12522\",\"12523\",\"12524\",\"12525\",\"12526\",\"12527\",\"12528\",\"12529\",\"12530\",\"12531\",\"12532\",\"12533\",\"12534\",\"12535\",\"12536\",\"12537\",\"12538\",\"12539\",\"12540\",\"12541\",\"12542\",\"12543\",\"12544\",\"12545\",\"12546\",\"12547\",\"12548\",\"12549\",\"12550\",\"12551\",\"12552\",\"12553\",\"12554\",\"12555\",\"12556\",\"12557\",\"12558\",\"12559\",\"12560\",\"12561\",\"12562\",\"12563\",\"12564\",\"12565\",\"12566\",\"12567\",\"12568\",\"12569\",\"12570\",\"12571\",\"12572\",\"12573\",\"12574\",\"12575\",\"12576\",\"12577\",\"12578\",\"12579\",\"12580\",\"12581\",\"12582\",\"12583\",\"12584\",\"12585\",\"12586\",\"12587\",\"12588\",\"12589\",\"12590\",\"12591\",\"12592\",\"12593\",\"12594\",\"12595\",\"12596\",\"12597\",\"12598\",\"12599\",\"12600\",\"12601\",\"12602\",\"12603\",\"12604\",\"12605\",\"12606\",\"12607\",\"12608\",\"12609\",\"12610\",\"12611\",\"12612\",\"12613\",\"12614\",\"12615\",\"12616\",\"12617\",\"12618\",\"12619\",\"12620\",\"12621\",\"12622\",\"12623\",\"12624\",\"12625\",\"12626\",\"12627\",\"12628\",\"12629\",\"12630\",\"12631\",\"12632\",\"12633\",\"12634\",\"12635\",\"12636\",\"12637\",\"12638\",\"12639\",\"12640\",\"12641\",\"12642\",\"12643\",\"12644\",\"12645\",\"12646\",\"12647\",\"12648\",\"12649\",\"12650\",\"12651\",\"12652\",\"12653\",\"12654\",\"12655\",\"12656\",\"12657\",\"12658\",\"12659\",\"12660\",\"12661\",\"12662\",\"12663\",\"12664\",\"12665\",\"12666\",\"12667\",\"12668\",\"12669\",\"12670\",\"12671\",\"12672\",\"12673\",\"12674\",\"12675\",\"12676\",\"12677\",\"12678\",\"12679\",\"12680\",\"12681\",\"12682\",\"12683\",\"12684\",\"12685\",\"12686\",\"12687\",\"12688\",\"12689\",\"12690\",\"12691\",\"12692\",\"12693\",\"12694\",\"12695\",\"12696\",\"12697\",\"12698\",\"12699\",\"12700\",\"12701\",\"12702\",\"12703\",\"12704\",\"12705\",\"12706\",\"12707\",\"12708\",\"12709\",\"12710\",\"12711\",\"12712\",\"12713\",\"12714\",\"12715\",\"12716\",\"12717\",\"12718\",\"12719\",\"12720\",\"12721\",\"12722\",\"12723\",\"12724\",\"12725\",\"12726\",\"12727\",\"12728\",\"12729\",\"12730\",\"12731\",\"12732\",\"12733\",\"12734\",\"12735\",\"12736\",\"12737\",\"12738\",\"12739\",\"12740\",\"12741\",\"12742\",\"12743\",\"12744\",\"12745\",\"12746\",\"12747\",\"12748\",\"12749\",\"12750\",\"12751\",\"12752\",\"12753\",\"12754\",\"12755\",\"12756\",\"12757\",\"12758\",\"12759\",\"12760\",\"12761\",\"12762\",\"12763\",\"12764\",\"12765\",\"12766\",\"12767\",\"12768\",\"12769\",\"12770\",\"12771\",\"12772\",\"12773\",\"12774\",\"12775\",\"12776\",\"12777\",\"12778\",\"12779\",\"12780\",\"12781\",\"12782\",\"12783\",\"12784\",\"12785\",\"12786\",\"12787\",\"12788\",\"12789\",\"12790\",\"12791\",\"12792\",\"12793\",\"12794\",\"12795\",\"12796\",\"12797\",\"12798\",\"12799\",\"12800\",\"12801\",\"12802\",\"12803\",\"12804\",\"12805\",\"12806\",\"12807\",\"12808\",\"12809\",\"12810\",\"12811\",\"12812\",\"12813\",\"12814\",\"12815\",\"12816\",\"12817\",\"12818\",\"12819\",\"12820\",\"12821\",\"12822\",\"12823\",\"12824\",\"12825\",\"12826\",\"12827\",\"12828\",\"12829\",\"12830\",\"12831\",\"12832\",\"12833\",\"12834\",\"12835\",\"12836\",\"12837\",\"12838\",\"12839\",\"12840\",\"12841\",\"12842\",\"12843\",\"12844\",\"12845\",\"12846\",\"12847\",\"12848\",\"12849\",\"12850\",\"12851\",\"12852\",\"12853\",\"12854\",\"12855\",\"12856\",\"12857\",\"12858\",\"12859\",\"12860\",\"12861\",\"12862\",\"12863\",\"12864\",\"12865\",\"12866\",\"12867\",\"12868\",\"12869\",\"12870\",\"12871\",\"12872\",\"12873\",\"12874\",\"12875\",\"12876\",\"12877\",\"12878\",\"12879\",\"12880\",\"12881\",\"12882\",\"12883\",\"12884\",\"12885\",\"12886\",\"12887\",\"12888\",\"12889\",\"12890\",\"12891\",\"12892\",\"12893\",\"12894\",\"12895\",\"12896\",\"12897\",\"12898\",\"12899\",\"12900\",\"12901\",\"12902\",\"12903\",\"12904\",\"12905\",\"12906\",\"12907\",\"12908\",\"12909\",\"12910\",\"12911\",\"12912\",\"12913\",\"12914\",\"12915\",\"12916\",\"12917\",\"12918\",\"12919\",\"12920\",\"12921\",\"12922\",\"12923\",\"12924\",\"12925\",\"12926\",\"12927\",\"12928\",\"12929\",\"12930\",\"12931\",\"12932\",\"12933\",\"12934\",\"12935\",\"12936\",\"12937\",\"12938\",\"12939\",\"12940\",\"12941\",\"12942\",\"12943\",\"12944\",\"12945\",\"12946\",\"12947\",\"12948\",\"12949\",\"12950\",\"12951\",\"12952\",\"12953\",\"12954\",\"12955\",\"12956\",\"12957\",\"12958\",\"12959\",\"12960\",\"12961\",\"12962\",\"12963\",\"12964\",\"12965\",\"12966\",\"12967\",\"12968\",\"12969\",\"12970\",\"12971\",\"12972\",\"12973\",\"12974\",\"12975\",\"12976\",\"12977\",\"12978\",\"12979\",\"12980\",\"12981\",\"12982\",\"12983\",\"12984\",\"12985\",\"12986\",\"12987\",\"12988\",\"12989\",\"12990\",\"12991\",\"12992\",\"12993\",\"12994\",\"12995\",\"12996\",\"12997\",\"12998\",\"12999\",\"13000\",\"13001\",\"13002\",\"13003\",\"13004\",\"13005\",\"13006\",\"13007\",\"13008\",\"13009\",\"13010\",\"13011\",\"13012\",\"13013\",\"13014\",\"13015\",\"13016\",\"13017\",\"13018\",\"13019\",\"13020\",\"13021\",\"13022\",\"13023\",\"13024\",\"13025\",\"13026\",\"13027\",\"13028\",\"13029\",\"13030\",\"13031\",\"13032\",\"13033\",\"13034\",\"13035\",\"13036\",\"13037\",\"13038\",\"13039\",\"13040\",\"13041\",\"13042\",\"13043\",\"13044\",\"13045\",\"13046\",\"13047\",\"13048\",\"13049\",\"13050\",\"13051\",\"13052\",\"13053\",\"13054\",\"13055\",\"13056\",\"13057\",\"13058\",\"13059\",\"13060\",\"13061\",\"13062\",\"13063\",\"13064\",\"13065\",\"13066\",\"13067\",\"13068\",\"13069\",\"13070\",\"13071\",\"13072\",\"13073\",\"13074\",\"13075\",\"13076\",\"13077\",\"13078\",\"13079\",\"13080\",\"13081\",\"13082\",\"13083\",\"13084\",\"13085\",\"13086\",\"13087\",\"13088\",\"13089\",\"13090\",\"13091\",\"13092\",\"13093\",\"13094\",\"13095\",\"13096\",\"13097\",\"13098\",\"13099\",\"13100\",\"13101\",\"13102\",\"13103\",\"13104\",\"13105\",\"13106\",\"13107\",\"13108\",\"13109\",\"13110\",\"13111\",\"13112\",\"13113\",\"13114\",\"13115\",\"13116\",\"13117\",\"13118\",\"13119\",\"13120\",\"13121\",\"13122\",\"13123\",\"13124\",\"13125\",\"13126\",\"13127\",\"13128\",\"13129\",\"13130\",\"13131\",\"13132\",\"13133\",\"13134\",\"13135\",\"13136\",\"13137\",\"13138\",\"13139\",\"13140\",\"13141\",\"13142\",\"13143\",\"13144\",\"13145\",\"13146\",\"13147\",\"13148\",\"13149\",\"13150\",\"13151\",\"13152\",\"13153\",\"13154\",\"13155\",\"13156\",\"13157\",\"13158\",\"13159\",\"18324\"]'),
(7, '711b7ff36e33dd4761ee556c041760d8', '{\"base\":\"SELECT %%SELECT%% FROM `song` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`song`.`id`\"],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"song\",\"total\":123}', '[\"7134\",\"7135\",\"7136\",\"7137\",\"7138\",\"7139\",\"7140\",\"7141\",\"7142\",\"7143\",\"7144\",\"7145\",\"7146\",\"7147\",\"7148\",\"7149\",\"7150\",\"7151\",\"7152\",\"7153\",\"7154\",\"7155\",\"7156\",\"7157\",\"7158\",\"7159\",\"7160\",\"7161\",\"7162\",\"7163\",\"7164\",\"7165\",\"7166\",\"7167\",\"7168\",\"7169\",\"7170\",\"7171\",\"7172\",\"7173\",\"7174\",\"7175\",\"7176\",\"7177\",\"7178\",\"7179\",\"7180\",\"7181\",\"7182\",\"7183\",\"7184\",\"7185\",\"7186\",\"7187\",\"7188\",\"7189\",\"7190\",\"7191\",\"7192\",\"7193\",\"7194\",\"7195\",\"7196\",\"7197\",\"7198\",\"7199\",\"7200\",\"7201\",\"7202\",\"7203\",\"7204\",\"7205\",\"7206\",\"7207\",\"7208\",\"7209\",\"7210\",\"7211\",\"7212\",\"7213\",\"7214\",\"7215\",\"7216\",\"7217\",\"7218\",\"7219\",\"7220\",\"7221\",\"7222\",\"7223\",\"7224\",\"7225\",\"7226\",\"7227\",\"7228\",\"7229\",\"7230\",\"7231\",\"7232\",\"7233\",\"7234\",\"7235\",\"7236\",\"7237\",\"7238\",\"7239\",\"7240\",\"7241\",\"7242\",\"7243\",\"7244\",\"7245\",\"7246\",\"7247\",\"7248\",\"7249\",\"7250\",\"7251\",\"7252\",\"7253\",\"7254\",\"7255\",\"17096\"]'),
(8, '711b7ff36e33dd4761ee556c041760d8', '{\"base\":\"SELECT %%SELECT%% FROM `song` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`song`.`id`\"],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"song\",\"total\":0}', '[]'),
(9, '711b7ff36e33dd4761ee556c041760d8', '{\"base\":\"SELECT %%SELECT%% FROM `song` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`song`.`id`\"],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"song\",\"total\":364}', '[\"6412\",\"6413\",\"6414\",\"6415\",\"6416\",\"6417\",\"6418\",\"6419\",\"6420\",\"6421\",\"6422\",\"6423\",\"6424\",\"6425\",\"6426\",\"6427\",\"6428\",\"6429\",\"6430\",\"6431\",\"6432\",\"6433\",\"6434\",\"6435\",\"6436\",\"6437\",\"6438\",\"6439\",\"6440\",\"6441\",\"6442\",\"6443\",\"6444\",\"6445\",\"6446\",\"6447\",\"6448\",\"6449\",\"6450\",\"6451\",\"6452\",\"6453\",\"6454\",\"6455\",\"6456\",\"6457\",\"6458\",\"6459\",\"6460\",\"6461\",\"6462\",\"6463\",\"6464\",\"6465\",\"6466\",\"6467\",\"6468\",\"6469\",\"6470\",\"6471\",\"6472\",\"6473\",\"6474\",\"6475\",\"6476\",\"6477\",\"6478\",\"6479\",\"6480\",\"6481\",\"6482\",\"6483\",\"6484\",\"6485\",\"6486\",\"6487\",\"6488\",\"6489\",\"6490\",\"6491\",\"6492\",\"6493\",\"6494\",\"6495\",\"6496\",\"6497\",\"6498\",\"6499\",\"6500\",\"6501\",\"6502\",\"6503\",\"6504\",\"6505\",\"6506\",\"6507\",\"6508\",\"6509\",\"6510\",\"6511\",\"6512\",\"6513\",\"6514\",\"6515\",\"6516\",\"6517\",\"6518\",\"6519\",\"6520\",\"6521\",\"6522\",\"6523\",\"6524\",\"6525\",\"6526\",\"6527\",\"6528\",\"6529\",\"6530\",\"6531\",\"6532\",\"6533\",\"6534\",\"6535\",\"6536\",\"6537\",\"6538\",\"6539\",\"6540\",\"6541\",\"6542\",\"6543\",\"6544\",\"6545\",\"6546\",\"6547\",\"6548\",\"6549\",\"6550\",\"6551\",\"6552\",\"6553\",\"6554\",\"6555\",\"6556\",\"6557\",\"6558\",\"6559\",\"6560\",\"6561\",\"6562\",\"6563\",\"6564\",\"6565\",\"6566\",\"6567\",\"6568\",\"6569\",\"6570\",\"6571\",\"6572\",\"6573\",\"6574\",\"6575\",\"6576\",\"6577\",\"6578\",\"6579\",\"6580\",\"6581\",\"6582\",\"6583\",\"6584\",\"6585\",\"6586\",\"6587\",\"6588\",\"6589\",\"6590\",\"6591\",\"6592\",\"6593\",\"16565\",\"16566\",\"16567\",\"16568\",\"16569\",\"16570\",\"16571\",\"16572\",\"16573\",\"16574\",\"16575\",\"16576\",\"16577\",\"16578\",\"16579\",\"16580\",\"16581\",\"16582\",\"16583\",\"16584\",\"16585\",\"16586\",\"16587\",\"16588\",\"16589\",\"16590\",\"16591\",\"16592\",\"16593\",\"16594\",\"16595\",\"16596\",\"16597\",\"16598\",\"16599\",\"16600\",\"16601\",\"16602\",\"16603\",\"16604\",\"16605\",\"16606\",\"16607\",\"16608\",\"16609\",\"16610\",\"16611\",\"16612\",\"16613\",\"16614\",\"16615\",\"16616\",\"16617\",\"16618\",\"16619\",\"16620\",\"16621\",\"16622\",\"16623\",\"16624\",\"16625\",\"16626\",\"16627\",\"16628\",\"16629\",\"16630\",\"16631\",\"16632\",\"16633\",\"16634\",\"16635\",\"16636\",\"16637\",\"16638\",\"16639\",\"16640\",\"16641\",\"16642\",\"16643\",\"16644\",\"16645\",\"16646\",\"16647\",\"16648\",\"16649\",\"16650\",\"16651\",\"16652\",\"16653\",\"16654\",\"16655\",\"16656\",\"16657\",\"16658\",\"16659\",\"16660\",\"16661\",\"16662\",\"16663\",\"16664\",\"16665\",\"16666\",\"16667\",\"16668\",\"16669\",\"16670\",\"16671\",\"16672\",\"16673\",\"16674\",\"16675\",\"16676\",\"16677\",\"16678\",\"16679\",\"16680\",\"16681\",\"16682\",\"16683\",\"16684\",\"16685\",\"16686\",\"16687\",\"16688\",\"16689\",\"16690\",\"16691\",\"16692\",\"16693\",\"16694\",\"16695\",\"16696\",\"16697\",\"16698\",\"16699\",\"16700\",\"16701\",\"16702\",\"16703\",\"16704\",\"16705\",\"16706\",\"16707\",\"16708\",\"16709\",\"16710\",\"16711\",\"16712\",\"16713\",\"16714\",\"16715\",\"16716\",\"16717\",\"16718\",\"16719\",\"16720\",\"16721\",\"16722\",\"16723\",\"16724\",\"16725\",\"16726\",\"16727\",\"16728\",\"16729\",\"16730\",\"16731\",\"16732\",\"16733\",\"16734\",\"16735\",\"16736\",\"16737\",\"16738\",\"16739\",\"16740\",\"16741\",\"16742\",\"16743\",\"16744\",\"16745\",\"16746\"]'),
(10, '711b7ff36e33dd4761ee556c041760d8', '{\"base\":\"SELECT %%SELECT%% FROM `song` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`song`.`id`\"],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"song\",\"total\":364}', '[\"6412\",\"6413\",\"6414\",\"6415\",\"6416\",\"6417\",\"6418\",\"6419\",\"6420\",\"6421\",\"6422\",\"6423\",\"6424\",\"6425\",\"6426\",\"6427\",\"6428\",\"6429\",\"6430\",\"6431\",\"6432\",\"6433\",\"6434\",\"6435\",\"6436\",\"6437\",\"6438\",\"6439\",\"6440\",\"6441\",\"6442\",\"6443\",\"6444\",\"6445\",\"6446\",\"6447\",\"6448\",\"6449\",\"6450\",\"6451\",\"6452\",\"6453\",\"6454\",\"6455\",\"6456\",\"6457\",\"6458\",\"6459\",\"6460\",\"6461\",\"6462\",\"6463\",\"6464\",\"6465\",\"6466\",\"6467\",\"6468\",\"6469\",\"6470\",\"6471\",\"6472\",\"6473\",\"6474\",\"6475\",\"6476\",\"6477\",\"6478\",\"6479\",\"6480\",\"6481\",\"6482\",\"6483\",\"6484\",\"6485\",\"6486\",\"6487\",\"6488\",\"6489\",\"6490\",\"6491\",\"6492\",\"6493\",\"6494\",\"6495\",\"6496\",\"6497\",\"6498\",\"6499\",\"6500\",\"6501\",\"6502\",\"6503\",\"6504\",\"6505\",\"6506\",\"6507\",\"6508\",\"6509\",\"6510\",\"6511\",\"6512\",\"6513\",\"6514\",\"6515\",\"6516\",\"6517\",\"6518\",\"6519\",\"6520\",\"6521\",\"6522\",\"6523\",\"6524\",\"6525\",\"6526\",\"6527\",\"6528\",\"6529\",\"6530\",\"6531\",\"6532\",\"6533\",\"6534\",\"6535\",\"6536\",\"6537\",\"6538\",\"6539\",\"6540\",\"6541\",\"6542\",\"6543\",\"6544\",\"6545\",\"6546\",\"6547\",\"6548\",\"6549\",\"6550\",\"6551\",\"6552\",\"6553\",\"6554\",\"6555\",\"6556\",\"6557\",\"6558\",\"6559\",\"6560\",\"6561\",\"6562\",\"6563\",\"6564\",\"6565\",\"6566\",\"6567\",\"6568\",\"6569\",\"6570\",\"6571\",\"6572\",\"6573\",\"6574\",\"6575\",\"6576\",\"6577\",\"6578\",\"6579\",\"6580\",\"6581\",\"6582\",\"6583\",\"6584\",\"6585\",\"6586\",\"6587\",\"6588\",\"6589\",\"6590\",\"6591\",\"6592\",\"6593\",\"16565\",\"16566\",\"16567\",\"16568\",\"16569\",\"16570\",\"16571\",\"16572\",\"16573\",\"16574\",\"16575\",\"16576\",\"16577\",\"16578\",\"16579\",\"16580\",\"16581\",\"16582\",\"16583\",\"16584\",\"16585\",\"16586\",\"16587\",\"16588\",\"16589\",\"16590\",\"16591\",\"16592\",\"16593\",\"16594\",\"16595\",\"16596\",\"16597\",\"16598\",\"16599\",\"16600\",\"16601\",\"16602\",\"16603\",\"16604\",\"16605\",\"16606\",\"16607\",\"16608\",\"16609\",\"16610\",\"16611\",\"16612\",\"16613\",\"16614\",\"16615\",\"16616\",\"16617\",\"16618\",\"16619\",\"16620\",\"16621\",\"16622\",\"16623\",\"16624\",\"16625\",\"16626\",\"16627\",\"16628\",\"16629\",\"16630\",\"16631\",\"16632\",\"16633\",\"16634\",\"16635\",\"16636\",\"16637\",\"16638\",\"16639\",\"16640\",\"16641\",\"16642\",\"16643\",\"16644\",\"16645\",\"16646\",\"16647\",\"16648\",\"16649\",\"16650\",\"16651\",\"16652\",\"16653\",\"16654\",\"16655\",\"16656\",\"16657\",\"16658\",\"16659\",\"16660\",\"16661\",\"16662\",\"16663\",\"16664\",\"16665\",\"16666\",\"16667\",\"16668\",\"16669\",\"16670\",\"16671\",\"16672\",\"16673\",\"16674\",\"16675\",\"16676\",\"16677\",\"16678\",\"16679\",\"16680\",\"16681\",\"16682\",\"16683\",\"16684\",\"16685\",\"16686\",\"16687\",\"16688\",\"16689\",\"16690\",\"16691\",\"16692\",\"16693\",\"16694\",\"16695\",\"16696\",\"16697\",\"16698\",\"16699\",\"16700\",\"16701\",\"16702\",\"16703\",\"16704\",\"16705\",\"16706\",\"16707\",\"16708\",\"16709\",\"16710\",\"16711\",\"16712\",\"16713\",\"16714\",\"16715\",\"16716\",\"16717\",\"16718\",\"16719\",\"16720\",\"16721\",\"16722\",\"16723\",\"16724\",\"16725\",\"16726\",\"16727\",\"16728\",\"16729\",\"16730\",\"16731\",\"16732\",\"16733\",\"16734\",\"16735\",\"16736\",\"16737\",\"16738\",\"16739\",\"16740\",\"16741\",\"16742\",\"16743\",\"16744\",\"16745\",\"16746\"]'),
(11, '711b7ff36e33dd4761ee556c041760d8', '{\"base\":\"SELECT %%SELECT%% FROM `live_stream` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`live_stream`.`id`\"],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"live_stream\",\"update_session\":true,\"sort\":{\"name\":\"ASC\"},\"total\":0}', NULL),
(12, '711b7ff36e33dd4761ee556c041760d8', '{\"base\":\"SELECT %%SELECT%% FROM `live_stream` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`live_stream`.`id`\"],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"live_stream\",\"update_session\":true,\"sort\":{\"name\":\"ASC\"},\"total\":0}', NULL),
(13, '711b7ff36e33dd4761ee556c041760d8', '{\"base\":\"SELECT %%SELECT%% FROM `song` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`song`.`id`\"],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"song\",\"total\":364}', '[\"6412\",\"6413\",\"6414\",\"6415\",\"6416\",\"6417\",\"6418\",\"6419\",\"6420\",\"6421\",\"6422\",\"6423\",\"6424\",\"6425\",\"6426\",\"6427\",\"6428\",\"6429\",\"6430\",\"6431\",\"6432\",\"6433\",\"6434\",\"6435\",\"6436\",\"6437\",\"6438\",\"6439\",\"6440\",\"6441\",\"6442\",\"6443\",\"6444\",\"6445\",\"6446\",\"6447\",\"6448\",\"6449\",\"6450\",\"6451\",\"6452\",\"6453\",\"6454\",\"6455\",\"6456\",\"6457\",\"6458\",\"6459\",\"6460\",\"6461\",\"6462\",\"6463\",\"6464\",\"6465\",\"6466\",\"6467\",\"6468\",\"6469\",\"6470\",\"6471\",\"6472\",\"6473\",\"6474\",\"6475\",\"6476\",\"6477\",\"6478\",\"6479\",\"6480\",\"6481\",\"6482\",\"6483\",\"6484\",\"6485\",\"6486\",\"6487\",\"6488\",\"6489\",\"6490\",\"6491\",\"6492\",\"6493\",\"6494\",\"6495\",\"6496\",\"6497\",\"6498\",\"6499\",\"6500\",\"6501\",\"6502\",\"6503\",\"6504\",\"6505\",\"6506\",\"6507\",\"6508\",\"6509\",\"6510\",\"6511\",\"6512\",\"6513\",\"6514\",\"6515\",\"6516\",\"6517\",\"6518\",\"6519\",\"6520\",\"6521\",\"6522\",\"6523\",\"6524\",\"6525\",\"6526\",\"6527\",\"6528\",\"6529\",\"6530\",\"6531\",\"6532\",\"6533\",\"6534\",\"6535\",\"6536\",\"6537\",\"6538\",\"6539\",\"6540\",\"6541\",\"6542\",\"6543\",\"6544\",\"6545\",\"6546\",\"6547\",\"6548\",\"6549\",\"6550\",\"6551\",\"6552\",\"6553\",\"6554\",\"6555\",\"6556\",\"6557\",\"6558\",\"6559\",\"6560\",\"6561\",\"6562\",\"6563\",\"6564\",\"6565\",\"6566\",\"6567\",\"6568\",\"6569\",\"6570\",\"6571\",\"6572\",\"6573\",\"6574\",\"6575\",\"6576\",\"6577\",\"6578\",\"6579\",\"6580\",\"6581\",\"6582\",\"6583\",\"6584\",\"6585\",\"6586\",\"6587\",\"6588\",\"6589\",\"6590\",\"6591\",\"6592\",\"6593\",\"16565\",\"16566\",\"16567\",\"16568\",\"16569\",\"16570\",\"16571\",\"16572\",\"16573\",\"16574\",\"16575\",\"16576\",\"16577\",\"16578\",\"16579\",\"16580\",\"16581\",\"16582\",\"16583\",\"16584\",\"16585\",\"16586\",\"16587\",\"16588\",\"16589\",\"16590\",\"16591\",\"16592\",\"16593\",\"16594\",\"16595\",\"16596\",\"16597\",\"16598\",\"16599\",\"16600\",\"16601\",\"16602\",\"16603\",\"16604\",\"16605\",\"16606\",\"16607\",\"16608\",\"16609\",\"16610\",\"16611\",\"16612\",\"16613\",\"16614\",\"16615\",\"16616\",\"16617\",\"16618\",\"16619\",\"16620\",\"16621\",\"16622\",\"16623\",\"16624\",\"16625\",\"16626\",\"16627\",\"16628\",\"16629\",\"16630\",\"16631\",\"16632\",\"16633\",\"16634\",\"16635\",\"16636\",\"16637\",\"16638\",\"16639\",\"16640\",\"16641\",\"16642\",\"16643\",\"16644\",\"16645\",\"16646\",\"16647\",\"16648\",\"16649\",\"16650\",\"16651\",\"16652\",\"16653\",\"16654\",\"16655\",\"16656\",\"16657\",\"16658\",\"16659\",\"16660\",\"16661\",\"16662\",\"16663\",\"16664\",\"16665\",\"16666\",\"16667\",\"16668\",\"16669\",\"16670\",\"16671\",\"16672\",\"16673\",\"16674\",\"16675\",\"16676\",\"16677\",\"16678\",\"16679\",\"16680\",\"16681\",\"16682\",\"16683\",\"16684\",\"16685\",\"16686\",\"16687\",\"16688\",\"16689\",\"16690\",\"16691\",\"16692\",\"16693\",\"16694\",\"16695\",\"16696\",\"16697\",\"16698\",\"16699\",\"16700\",\"16701\",\"16702\",\"16703\",\"16704\",\"16705\",\"16706\",\"16707\",\"16708\",\"16709\",\"16710\",\"16711\",\"16712\",\"16713\",\"16714\",\"16715\",\"16716\",\"16717\",\"16718\",\"16719\",\"16720\",\"16721\",\"16722\",\"16723\",\"16724\",\"16725\",\"16726\",\"16727\",\"16728\",\"16729\",\"16730\",\"16731\",\"16732\",\"16733\",\"16734\",\"16735\",\"16736\",\"16737\",\"16738\",\"16739\",\"16740\",\"16741\",\"16742\",\"16743\",\"16744\",\"16745\",\"16746\"]'),
(14, '711b7ff36e33dd4761ee556c041760d8', '{\"base\":\"SELECT %%SELECT%% FROM `album` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`album`.`id`\"],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"album\",\"ak\":\"album\",\"total\":15}', '[\"502\",\"499\",\"493\",\"505\",\"506\",\"508\",\"507\",\"498\",\"501\",\"495\",\"496\",\"504\",\"503\",\"494\",\"500\"]'),
(15, '711b7ff36e33dd4761ee556c041760d8', '{\"base\":\"SELECT %%SELECT%% FROM `album` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`album`.`id`\"],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"album\",\"ak\":\"album\",\"total\":15}', '[\"502\",\"499\",\"493\",\"505\",\"506\",\"508\",\"507\",\"498\",\"501\",\"495\",\"496\",\"504\",\"503\",\"494\",\"500\"]'),
(16, '711b7ff36e33dd4761ee556c041760d8', '{\"base\":\"SELECT %%SELECT%% FROM `song` \",\"filter\":{\"regex_not_match\":\"\",\"album\":\"493\"},\"select\":[\"`song`.`id`\"],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"song\",\"sort\":{\"track\":\"ASC\"},\"total\":18}', NULL),
(17, '711b7ff36e33dd4761ee556c041760d8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":1}', '[\"17\"]'),
(18, '711b7ff36e33dd4761ee556c041760d8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":1}', '[\"17\"]'),
(1, '92324b406f8526eaee07a3741abd1633', '{\"base\":\"SELECT %%SELECT%% FROM `song` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`song`.`id`\"],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"song\",\"total\":458}', '[\"6877\",\"6878\",\"6879\",\"6880\",\"6881\",\"6882\",\"6883\",\"6884\",\"6885\",\"6886\",\"6887\",\"6888\",\"6889\",\"6890\",\"6891\",\"6892\",\"6893\",\"6894\",\"6895\",\"6896\",\"6897\",\"6898\",\"6899\",\"6900\",\"6901\",\"6902\",\"6903\",\"6904\",\"6905\",\"6906\",\"6907\",\"6908\",\"6909\",\"6910\",\"6911\",\"6912\",\"6913\",\"6914\",\"6915\",\"6916\",\"6917\",\"6918\",\"6919\",\"6920\",\"6921\",\"6922\",\"6923\",\"6924\",\"6925\",\"6926\",\"6927\",\"6928\",\"6929\",\"6930\",\"6931\",\"6932\",\"6933\",\"6934\",\"6935\",\"6936\",\"6937\",\"6938\",\"6939\",\"6940\",\"6941\",\"17030\",\"17031\",\"17032\",\"17033\",\"17034\",\"17035\",\"17036\",\"17037\",\"17038\",\"17039\",\"17040\",\"17041\",\"17042\",\"17043\",\"17044\",\"17045\",\"17046\",\"17047\",\"17048\",\"17049\",\"17050\",\"17051\",\"17052\",\"17053\",\"17054\",\"17055\",\"17056\",\"17057\",\"17058\",\"17059\",\"17060\",\"17061\",\"17062\",\"17063\",\"17064\",\"17065\",\"17066\",\"17067\",\"17068\",\"17069\",\"17070\",\"17071\",\"17072\",\"17073\",\"17074\",\"17075\",\"17076\",\"17077\",\"17078\",\"17079\",\"17080\",\"17081\",\"17082\",\"17083\",\"17084\",\"17085\",\"17086\",\"17087\",\"17088\",\"17089\",\"17090\",\"17091\",\"17092\",\"17093\",\"17094\",\"17095\",\"17096\",\"17097\",\"17098\",\"17099\",\"17100\",\"17101\",\"17102\",\"17103\",\"17104\",\"17105\",\"17106\",\"17107\",\"17108\",\"17109\",\"17110\",\"17111\",\"17112\",\"17113\",\"17114\",\"17115\",\"17116\",\"17117\",\"17118\",\"17119\",\"17120\",\"17121\",\"17122\",\"17123\",\"17124\",\"17125\",\"17126\",\"17127\",\"17128\",\"17129\",\"17130\",\"17131\",\"17132\",\"17133\",\"17134\",\"17135\",\"17136\",\"17137\",\"17138\",\"17139\",\"17140\",\"17141\",\"17142\",\"17143\",\"17144\",\"17145\",\"17146\",\"17147\",\"17148\",\"17149\",\"17150\",\"17151\",\"17152\",\"17153\",\"17154\",\"17155\",\"17156\",\"17157\",\"17158\",\"17159\",\"17160\",\"17161\",\"17162\",\"17163\",\"17164\",\"17165\",\"17166\",\"17167\",\"17168\",\"17169\",\"17170\",\"17171\",\"17172\",\"17173\",\"17174\",\"17175\",\"17176\",\"17177\",\"17178\",\"17179\",\"17180\",\"17181\",\"17182\",\"17183\",\"17184\",\"17185\",\"17186\",\"17187\",\"17188\",\"17189\",\"17190\",\"17191\",\"17192\",\"17193\",\"17194\",\"17195\",\"17196\",\"17197\",\"17198\",\"17199\",\"17200\",\"17201\",\"17202\",\"17203\",\"17204\",\"17205\",\"17206\",\"17207\",\"17208\",\"17209\",\"17210\",\"17211\",\"17212\",\"17213\",\"17214\",\"17215\",\"17216\",\"17217\",\"17218\",\"17219\",\"17220\",\"17221\",\"17222\",\"17223\",\"17224\",\"17225\",\"17226\",\"17227\",\"17228\",\"17229\",\"17230\",\"17231\",\"17232\",\"17233\",\"17234\",\"17235\",\"17236\",\"17237\",\"17238\",\"17239\",\"17240\",\"17241\",\"17242\",\"17243\",\"17244\",\"17245\",\"17246\",\"17247\",\"17248\",\"17249\",\"17250\",\"17251\",\"17252\",\"17253\",\"17254\",\"17255\",\"17256\",\"17257\",\"17258\",\"17259\",\"17260\",\"17261\",\"17262\",\"17263\",\"17264\",\"17265\",\"17266\",\"17267\",\"17268\",\"17269\",\"17270\",\"17271\",\"17272\",\"17273\",\"17274\",\"17275\",\"17276\",\"17277\",\"17278\",\"17279\",\"17280\",\"17281\",\"17282\",\"17283\",\"17284\",\"17285\",\"17286\",\"17287\",\"17288\",\"17289\",\"17290\",\"17291\",\"17292\",\"17293\",\"17294\",\"17295\",\"17296\",\"17297\",\"17298\",\"17299\",\"17300\",\"17301\",\"17302\",\"17303\",\"17304\",\"17305\",\"17306\",\"17307\",\"17308\",\"17309\",\"17310\",\"17311\",\"17312\",\"17313\",\"17314\",\"17315\",\"17316\",\"17317\",\"17318\",\"17319\",\"17320\",\"17321\",\"17322\",\"17323\",\"17324\",\"17325\",\"17326\",\"17327\",\"17328\",\"17329\",\"17330\",\"17331\",\"17332\",\"17333\",\"17334\",\"17335\",\"17336\",\"17337\",\"17338\",\"17339\",\"17340\",\"17341\",\"17342\",\"17343\",\"17344\",\"17345\",\"17346\",\"17347\",\"17348\",\"17349\",\"17350\",\"17351\",\"17352\",\"17353\",\"17354\",\"17355\",\"17356\",\"17357\",\"17358\",\"17359\",\"17360\",\"17361\",\"17362\",\"17363\",\"17364\",\"17365\",\"17366\",\"17367\",\"17368\",\"17369\",\"17370\",\"17371\",\"17372\",\"17373\",\"17374\",\"17375\",\"17376\",\"17377\",\"17378\",\"17379\",\"17380\",\"17381\",\"17382\",\"17383\",\"17384\",\"17385\",\"17386\",\"17387\",\"17388\",\"17389\",\"17390\",\"17391\",\"17392\",\"17393\",\"17394\",\"17395\",\"17396\",\"17397\",\"17398\",\"17399\",\"17400\",\"17401\",\"17402\",\"17403\",\"17404\",\"17405\",\"17406\",\"17407\",\"17408\",\"17409\",\"17410\",\"17411\",\"17412\",\"17413\",\"17414\",\"17415\",\"17416\",\"17417\",\"17418\",\"17419\",\"17420\",\"17421\",\"17422\"]');
INSERT INTO `tmp_browse` (`id`, `sid`, `data`, `object_data`) VALUES
(2, '92324b406f8526eaee07a3741abd1633', '{\"base\":\"SELECT %%SELECT%% FROM `song` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`song`.`id`\"],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"song\",\"total\":14685}', '[\"5042\",\"5041\",\"5040\",\"5039\",\"5038\",\"5037\",\"5036\",\"5035\",\"5034\",\"5033\",\"5032\",\"5031\",\"5030\",\"5029\",\"5028\",\"5027\",\"5026\",\"5025\",\"5024\",\"5023\",\"5022\",\"5021\",\"5020\",\"5019\",\"5018\",\"5017\",\"5016\",\"5015\",\"5014\",\"5013\",\"5012\",\"5011\",\"5010\",\"5009\",\"5008\",\"5007\",\"5006\",\"5005\",\"5004\",\"5003\",\"5002\",\"5001\",\"5000\",\"4999\",\"4998\",\"4997\",\"4996\",\"4995\",\"4994\",\"4993\",\"4992\",\"4991\",\"4990\",\"4989\",\"4988\",\"5043\",\"5044\",\"5045\",\"5046\",\"5047\",\"5048\",\"5049\",\"5050\",\"5051\",\"5052\",\"5053\",\"5054\",\"5055\",\"5056\",\"5057\",\"5058\",\"5059\",\"5060\",\"5061\",\"5062\",\"5063\",\"5064\",\"5065\",\"5066\",\"5067\",\"5068\",\"5069\",\"5070\",\"5071\",\"5072\",\"5073\",\"5074\",\"5075\",\"5076\",\"5077\",\"5078\",\"5079\",\"5080\",\"5081\",\"5082\",\"5083\",\"5084\",\"5085\",\"5086\",\"5087\",\"5088\",\"5089\",\"5090\",\"5091\",\"5092\",\"5093\",\"5094\",\"5095\",\"5096\",\"5097\",\"5098\",\"5099\",\"5100\",\"5101\",\"5102\",\"5103\",\"5104\",\"5105\",\"5106\",\"5107\",\"5108\",\"5109\",\"5110\",\"5111\",\"5112\",\"5113\",\"5114\",\"5115\",\"5116\",\"5117\",\"5118\",\"5119\",\"5120\",\"5121\",\"5122\",\"5123\",\"5124\",\"5125\",\"5126\",\"5127\",\"5128\",\"5129\",\"5130\",\"5131\",\"5132\",\"5133\",\"5134\",\"5135\",\"5136\",\"5137\",\"5138\",\"5139\",\"5140\",\"5141\",\"5142\",\"5143\",\"5144\",\"5145\",\"5146\",\"5147\",\"5148\",\"5149\",\"5150\",\"5151\",\"5152\",\"5153\",\"5154\",\"5155\",\"5156\",\"5157\",\"5158\",\"5159\",\"5160\",\"5161\",\"5162\",\"5163\",\"5164\",\"5165\",\"5166\",\"5167\",\"5168\",\"5169\",\"5170\",\"5171\",\"5172\",\"5173\",\"5174\",\"5175\",\"5176\",\"5177\",\"5178\",\"5179\",\"5180\",\"5181\",\"5182\",\"5183\",\"5184\",\"5185\",\"5186\",\"5187\",\"5188\",\"5189\",\"5190\",\"5191\",\"5192\",\"5193\",\"5194\",\"5195\",\"5196\",\"5197\",\"5198\",\"5199\",\"5200\",\"5201\",\"5202\",\"5203\",\"5204\",\"5205\",\"5206\",\"5207\",\"5208\",\"5209\",\"5210\",\"5211\",\"5212\",\"5213\",\"6997\",\"5215\",\"5216\",\"6996\",\"5218\",\"5219\",\"6995\",\"5221\",\"5222\",\"5223\",\"5225\",\"6994\",\"5227\",\"5228\",\"5229\",\"5230\",\"6993\",\"5232\",\"5233\",\"5234\",\"6992\",\"5236\",\"5237\",\"6991\",\"5239\",\"5240\",\"6990\",\"5242\",\"5243\",\"5244\",\"5246\",\"5247\",\"5248\",\"6989\",\"5250\",\"5251\",\"6988\",\"5253\",\"6987\",\"5255\",\"5257\",\"6986\",\"5259\",\"5260\",\"6985\",\"6984\",\"5263\",\"6983\",\"5265\",\"5266\",\"5268\",\"6982\",\"5270\",\"5271\",\"6981\",\"5273\",\"6980\",\"5275\",\"6979\",\"5277\",\"6978\",\"5279\",\"6977\",\"5281\",\"6976\",\"5283\",\"6975\",\"5285\",\"6974\",\"5287\",\"5289\",\"5290\",\"6973\",\"5292\",\"5293\",\"6972\",\"5295\",\"6971\",\"5297\",\"5298\",\"5300\",\"6970\",\"5302\",\"6969\",\"5305\",\"6968\",\"5307\",\"5308\",\"6967\",\"5310\",\"5312\",\"6966\",\"5314\",\"6965\",\"5316\",\"5318\",\"6964\",\"5320\",\"5321\",\"6963\",\"6962\",\"5324\",\"6961\",\"5326\",\"5327\",\"6960\",\"5329\",\"6959\",\"5331\",\"6958\",\"5333\",\"6957\",\"6956\",\"5336\",\"6955\",\"6954\",\"5340\",\"5341\",\"6953\",\"5343\",\"5344\",\"6952\",\"5346\",\"5347\",\"6951\",\"5349\",\"5350\",\"6950\",\"6949\",\"5353\",\"5354\",\"6948\",\"5356\",\"6947\",\"5358\",\"6946\",\"5360\",\"5361\",\"6945\",\"5363\",\"5365\",\"6943\",\"6944\",\"5367\",\"6942\",\"5369\",\"5370\",\"5371\",\"5372\",\"5373\",\"5374\",\"5375\",\"5376\",\"5377\",\"5378\",\"5379\",\"5380\",\"5381\",\"5382\",\"5383\",\"5384\",\"5385\",\"5386\",\"5387\",\"5388\",\"5389\",\"5390\",\"5391\",\"5392\",\"5393\",\"5394\",\"5395\",\"5396\",\"5397\",\"5398\",\"5399\",\"5400\",\"5401\",\"5402\",\"5403\",\"5404\",\"5405\",\"5406\",\"5407\",\"5408\",\"5409\",\"5410\",\"5411\",\"5412\",\"5413\",\"5414\",\"5415\",\"5416\",\"5417\",\"5418\",\"5419\",\"5420\",\"5421\",\"5422\",\"5423\",\"5424\",\"5425\",\"5426\",\"5427\",\"5428\",\"5429\",\"5430\",\"5431\",\"5432\",\"5433\",\"5434\",\"5435\",\"5436\",\"5437\",\"5438\",\"5439\",\"5440\",\"5441\",\"5442\",\"5443\",\"5444\",\"5445\",\"5446\",\"5447\",\"5448\",\"5449\",\"5450\",\"5451\",\"5452\",\"5453\",\"5454\",\"5455\",\"5456\",\"5457\",\"5458\",\"5459\",\"5460\",\"5461\",\"5462\",\"5463\",\"5464\",\"5465\",\"5466\",\"5467\",\"5468\",\"5469\",\"5470\",\"5471\",\"5472\",\"5473\",\"5474\",\"5475\",\"5476\",\"5477\",\"5478\",\"5479\",\"5480\",\"5481\",\"5482\",\"5483\",\"5484\",\"5485\",\"5486\",\"5487\",\"5488\",\"5489\",\"5490\",\"5491\",\"5492\",\"5493\",\"5494\",\"5495\",\"5496\",\"5497\",\"5498\",\"5499\",\"5500\",\"5501\",\"5502\",\"5503\",\"5504\",\"5505\",\"5506\",\"5507\",\"5508\",\"5509\",\"5510\",\"5511\",\"5512\",\"5513\",\"5514\",\"5515\",\"5516\",\"5517\",\"5518\",\"5519\",\"5520\",\"5521\",\"5522\",\"5523\",\"5524\",\"5525\",\"5526\",\"5527\",\"5528\",\"5529\",\"5530\",\"5531\",\"5532\",\"5533\",\"5534\",\"5535\",\"5536\",\"5537\",\"5538\",\"5539\",\"5540\",\"5541\",\"5542\",\"5543\",\"5544\",\"5545\",\"5546\",\"5547\",\"5548\",\"5549\",\"5550\",\"5551\",\"5552\",\"5553\",\"5554\",\"5555\",\"5556\",\"5557\",\"5558\",\"5559\",\"5560\",\"5561\",\"5562\",\"5563\",\"5564\",\"5565\",\"5566\",\"5567\",\"5568\",\"5569\",\"5570\",\"5571\",\"5572\",\"5573\",\"5574\",\"5575\",\"5576\",\"5577\",\"5578\",\"5579\",\"5580\",\"5581\",\"5582\",\"5583\",\"5584\",\"5585\",\"5586\",\"5587\",\"5588\",\"5589\",\"5590\",\"5591\",\"5592\",\"5593\",\"5594\",\"5595\",\"5596\",\"5597\",\"5598\",\"5599\",\"5600\",\"5601\",\"5602\",\"5603\",\"5604\",\"5605\",\"5606\",\"5607\",\"5608\",\"5609\",\"5610\",\"5611\",\"5612\",\"5613\",\"5614\",\"5615\",\"5616\",\"5617\",\"5618\",\"5619\",\"5620\",\"5621\",\"5622\",\"5623\",\"5624\",\"5625\",\"5626\",\"5627\",\"5628\",\"5629\",\"5630\",\"5631\",\"5632\",\"5633\",\"5634\",\"5635\",\"5636\",\"5637\",\"5638\",\"5639\",\"5640\",\"5641\",\"5642\",\"5643\",\"5644\",\"5645\",\"5646\",\"5647\",\"5648\",\"5649\",\"5650\",\"5651\",\"5652\",\"5653\",\"5654\",\"5655\",\"5656\",\"5657\",\"5658\",\"5659\",\"5660\",\"5661\",\"5662\",\"5663\",\"5664\",\"5665\",\"5666\",\"5667\",\"5668\",\"5669\",\"5670\",\"5671\",\"5672\",\"5673\",\"5674\",\"5675\",\"5676\",\"5677\",\"5678\",\"5679\",\"5680\",\"5681\",\"5682\",\"5683\",\"5684\",\"5685\",\"5686\",\"5687\",\"5688\",\"5689\",\"5690\",\"5691\",\"5692\",\"5693\",\"5694\",\"5695\",\"5696\",\"5697\",\"5698\",\"5699\",\"5700\",\"5701\",\"5702\",\"5703\",\"5704\",\"5705\",\"5706\",\"5707\",\"5708\",\"5709\",\"5710\",\"5711\",\"5712\",\"5713\",\"5714\",\"5715\",\"5716\",\"5717\",\"5718\",\"5719\",\"5720\",\"5721\",\"5722\",\"5723\",\"5724\",\"5725\",\"5726\",\"5727\",\"5728\",\"5729\",\"5730\",\"5731\",\"5732\",\"5733\",\"5734\",\"5735\",\"5736\",\"5737\",\"5738\",\"5739\",\"5740\",\"5741\",\"5742\",\"5743\",\"5744\",\"5745\",\"5746\",\"5747\",\"5748\",\"5749\",\"5750\",\"5751\",\"5752\",\"5753\",\"5754\",\"5755\",\"5756\",\"5757\",\"5758\",\"5759\",\"5760\",\"5761\",\"5762\",\"5763\",\"5764\",\"5765\",\"5766\",\"5767\",\"5768\",\"5769\",\"5770\",\"5771\",\"5772\",\"5773\",\"5774\",\"5775\",\"5776\",\"5777\",\"5778\",\"5779\",\"5780\",\"5781\",\"5782\",\"5783\",\"5784\",\"5785\",\"5786\",\"5787\",\"5788\",\"5789\",\"5790\",\"5791\",\"5792\",\"5793\",\"5794\",\"5795\",\"5796\",\"5797\",\"5798\",\"5799\",\"5800\",\"5801\",\"5802\",\"5803\",\"5804\",\"5805\",\"5806\",\"5807\",\"5808\",\"5809\",\"5810\",\"5811\",\"5812\",\"5813\",\"5814\",\"5815\",\"5816\",\"5817\",\"5818\",\"5819\",\"5820\",\"5821\",\"5822\",\"5823\",\"5824\",\"5825\",\"5826\",\"5827\",\"5828\",\"5829\",\"5830\",\"5831\",\"5832\",\"5833\",\"5834\",\"5835\",\"5836\",\"5837\",\"5838\",\"5839\",\"5840\",\"5841\",\"5842\",\"5843\",\"5844\",\"5845\",\"5846\",\"5847\",\"5848\",\"5849\",\"5850\",\"5851\",\"5852\",\"5853\",\"5854\",\"5855\",\"5856\",\"5857\",\"5858\",\"5859\",\"5860\",\"5861\",\"5862\",\"5863\",\"5864\",\"5865\",\"5866\",\"5867\",\"5868\",\"5869\",\"5870\",\"5871\",\"5872\",\"5873\",\"5874\",\"5875\",\"5876\",\"5877\",\"5878\",\"5879\",\"5880\",\"5881\",\"5882\",\"5883\",\"5884\",\"5885\",\"5886\",\"5887\",\"5888\",\"5889\",\"5890\",\"5891\",\"5892\",\"5893\",\"5894\",\"5895\",\"5896\",\"5897\",\"5898\",\"5899\",\"5900\",\"5901\",\"5902\",\"5903\",\"5904\",\"5905\",\"5906\",\"5907\",\"5908\",\"5909\",\"5910\",\"5911\",\"5912\",\"5913\",\"5914\",\"5915\",\"5916\",\"5917\",\"5918\",\"5919\",\"5920\",\"5921\",\"5922\",\"5923\",\"5924\",\"5925\",\"5926\",\"5927\",\"5928\",\"5929\",\"5930\",\"5931\",\"5932\",\"5933\",\"5934\",\"5935\",\"5936\",\"5937\",\"5938\",\"5939\",\"5940\",\"5941\",\"5942\",\"5943\",\"5944\",\"5945\",\"5946\",\"5947\",\"5948\",\"5949\",\"5950\",\"5951\",\"5952\",\"5953\",\"5954\",\"5955\",\"5956\",\"5957\",\"5958\",\"5959\",\"5960\",\"5961\",\"5962\",\"5963\",\"5964\",\"5965\",\"5966\",\"5967\",\"5968\",\"5969\",\"5970\",\"5971\",\"5972\",\"5973\",\"5974\",\"5975\",\"5976\",\"5977\",\"5978\",\"5979\",\"5980\",\"5981\",\"5982\",\"5983\",\"5984\",\"5985\",\"5986\",\"5987\",\"5988\",\"5989\",\"5990\",\"5991\",\"5992\",\"5993\",\"5994\",\"5995\",\"5996\",\"5997\",\"5998\",\"5999\",\"6000\",\"6001\",\"6002\",\"6003\",\"6004\",\"6005\",\"6006\",\"6007\",\"6008\",\"6009\",\"6010\",\"6011\",\"6012\",\"6013\",\"6014\",\"6015\",\"6016\",\"6017\",\"6018\",\"6019\",\"6020\",\"6021\",\"6022\",\"6023\",\"6024\",\"6025\",\"6026\",\"6027\",\"6028\",\"6029\",\"6030\",\"6031\",\"6032\",\"6033\",\"6034\",\"6035\",\"6036\",\"6037\",\"6038\",\"6039\",\"6040\",\"6041\",\"6042\",\"6043\",\"6044\",\"6045\",\"6046\",\"6047\",\"6048\",\"6049\",\"6050\",\"6051\",\"6052\",\"6053\",\"6054\",\"6055\",\"6056\",\"6057\",\"6058\",\"6059\",\"6060\",\"6061\",\"6062\",\"6063\",\"6064\",\"6065\",\"6066\",\"6067\",\"6068\",\"6069\",\"6070\",\"6071\",\"6072\",\"6073\",\"6074\",\"6075\",\"6076\",\"6077\",\"6078\",\"6079\",\"6080\",\"6081\",\"6082\",\"6083\",\"6084\",\"6085\",\"6086\",\"6087\",\"6088\",\"6089\",\"6090\",\"6091\",\"6092\",\"6093\",\"6094\",\"6095\",\"6096\",\"6097\",\"6098\",\"6099\",\"6100\",\"6101\",\"6102\",\"6103\",\"6104\",\"6105\",\"6106\",\"6107\",\"6108\",\"6109\",\"6110\",\"6111\",\"6112\",\"6113\",\"6114\",\"6115\",\"6116\",\"6117\",\"6118\",\"6119\",\"6120\",\"6121\",\"6122\",\"6123\",\"6124\",\"6125\",\"6126\",\"6127\",\"6128\",\"6129\",\"6130\",\"6131\",\"6132\",\"6133\",\"6134\",\"6135\",\"6136\",\"6137\",\"6138\",\"6139\",\"6140\",\"6141\",\"6142\",\"6143\",\"6144\",\"6145\",\"6146\",\"6147\",\"6148\",\"6149\",\"6150\",\"6151\",\"6152\",\"6153\",\"6154\",\"6155\",\"6156\",\"6157\",\"6158\",\"6159\",\"6160\",\"6161\",\"6162\",\"6163\",\"6164\",\"6165\",\"6166\",\"6167\",\"6168\",\"6169\",\"6170\",\"6171\",\"6172\",\"6173\",\"6174\",\"6175\",\"6176\",\"6177\",\"6178\",\"6179\",\"6180\",\"6181\",\"6182\",\"6183\",\"6184\",\"6185\",\"6186\",\"6187\",\"6188\",\"6189\",\"6190\",\"6191\",\"6192\",\"6193\",\"6194\",\"6195\",\"6196\",\"6197\",\"6198\",\"6199\",\"6200\",\"6201\",\"6202\",\"6203\",\"6204\",\"6205\",\"6206\",\"6207\",\"6208\",\"6209\",\"6210\",\"6211\",\"6212\",\"6213\",\"6214\",\"6215\",\"6216\",\"6217\",\"6218\",\"6219\",\"6220\",\"6221\",\"6222\",\"6223\",\"6224\",\"6225\",\"6226\",\"6227\",\"6228\",\"6229\",\"6230\",\"6231\",\"6232\",\"6233\",\"6234\",\"6235\",\"6236\",\"6237\",\"6238\",\"6239\",\"6240\",\"6241\",\"6242\",\"6243\",\"6244\",\"6245\",\"6246\",\"6247\",\"6248\",\"6249\",\"6250\",\"6251\",\"6252\",\"6253\",\"6254\",\"6255\",\"6256\",\"6257\",\"6258\",\"6259\",\"6260\",\"6261\",\"6262\",\"6263\",\"6264\",\"6265\",\"6266\",\"6267\",\"6268\",\"6269\",\"6270\",\"6271\",\"6272\",\"6273\",\"6274\",\"6275\",\"6276\",\"6277\",\"6278\",\"6279\",\"6280\",\"6281\",\"6282\",\"6283\",\"6284\",\"6285\",\"6286\",\"6287\",\"6288\",\"6289\",\"6290\",\"6291\",\"6292\",\"6293\",\"6294\",\"6295\",\"6296\",\"6297\",\"6298\",\"6299\",\"6300\",\"6301\",\"6302\",\"6303\",\"6304\",\"6305\",\"6306\",\"6307\",\"6308\",\"6309\",\"6310\",\"6311\",\"6312\",\"6313\",\"6314\",\"6315\",\"6316\",\"6317\",\"6318\",\"6319\",\"6320\",\"6321\",\"6322\",\"6323\",\"6324\",\"6325\",\"6326\",\"6327\",\"6328\",\"6329\",\"6330\",\"6331\",\"6332\",\"6333\",\"6334\",\"6335\",\"6336\",\"6337\",\"6338\",\"6339\",\"6340\",\"6341\",\"6342\",\"6343\",\"6344\",\"6345\",\"6346\",\"6347\",\"6348\",\"6349\",\"6350\",\"6351\",\"6352\",\"6353\",\"6354\",\"6355\",\"6356\",\"6357\",\"6358\",\"6359\",\"6360\",\"6361\",\"6362\",\"6363\",\"6364\",\"6365\",\"6366\",\"6367\",\"6368\",\"6369\",\"6370\",\"6371\",\"6372\",\"6373\",\"6374\",\"6375\",\"6376\",\"6377\",\"6378\",\"6379\",\"6380\",\"6381\",\"6382\",\"6383\",\"6384\",\"6385\",\"6386\",\"6387\",\"6388\",\"6389\",\"6390\",\"6391\",\"6392\",\"6393\",\"6394\",\"6395\",\"6396\",\"6397\",\"6398\",\"6399\",\"6400\",\"6401\",\"6402\",\"6403\",\"6404\",\"6405\",\"6406\",\"6407\",\"6408\",\"6409\",\"6410\",\"6411\",\"6412\",\"6413\",\"6414\",\"6415\",\"6416\",\"6417\",\"6418\",\"6419\",\"6420\",\"6421\",\"6422\",\"6423\",\"6424\",\"6425\",\"6426\",\"6427\",\"6428\",\"6429\",\"6430\",\"6431\",\"6432\",\"6433\",\"6434\",\"6435\",\"6436\",\"6437\",\"6438\",\"6439\",\"6440\",\"6441\",\"6442\",\"6443\",\"6444\",\"6445\",\"6446\",\"6447\",\"6448\",\"6449\",\"6450\",\"6451\",\"6452\",\"6453\",\"6454\",\"6455\",\"6456\",\"6457\",\"6458\",\"6459\",\"6460\",\"6461\",\"6462\",\"6463\",\"6464\",\"6465\",\"6466\",\"6467\",\"6468\",\"6469\",\"6470\",\"6471\",\"6472\",\"6473\",\"6474\",\"6475\",\"6476\",\"6477\",\"6478\",\"6479\",\"6480\",\"6481\",\"6482\",\"6483\",\"6484\",\"6485\",\"6486\",\"6487\",\"6488\",\"6489\",\"6490\",\"6491\",\"6492\",\"6493\",\"6494\",\"6495\",\"6496\",\"6497\",\"6498\",\"6499\",\"6500\",\"6501\",\"6502\",\"6503\",\"6504\",\"6505\",\"6506\",\"6507\",\"6508\",\"6509\",\"6510\",\"6511\",\"6512\",\"6513\",\"6514\",\"6515\",\"6516\",\"6517\",\"6518\",\"6519\",\"6520\",\"6521\",\"6522\",\"6523\",\"6524\",\"6525\",\"6526\",\"6527\",\"6528\",\"6529\",\"6530\",\"6531\",\"6532\",\"6533\",\"6534\",\"6535\",\"6536\",\"6537\",\"6538\",\"6539\",\"6540\",\"6541\",\"6542\",\"6543\",\"6544\",\"6545\",\"6546\",\"6547\",\"6548\",\"6549\",\"6550\",\"6551\",\"6552\",\"6553\",\"6554\",\"6555\",\"6556\",\"6557\",\"6558\",\"6559\",\"6560\",\"6561\",\"6562\",\"6563\",\"6564\",\"6565\",\"6566\",\"6567\",\"6568\",\"6569\",\"6570\",\"6571\",\"6572\",\"6573\",\"6574\",\"6575\",\"6576\",\"6577\",\"6578\",\"6579\",\"6580\",\"6581\",\"6582\",\"6583\",\"6584\",\"6585\",\"6586\",\"6587\",\"6588\",\"6589\",\"6590\",\"6591\",\"6592\",\"6593\",\"6594\",\"6595\",\"6596\",\"6597\",\"6598\",\"6599\",\"6600\",\"6601\",\"6602\",\"6603\",\"6604\",\"6605\",\"6606\",\"6607\",\"6608\",\"6609\",\"6610\",\"6611\",\"6612\",\"6613\",\"6614\",\"6615\",\"6616\",\"6617\",\"6618\",\"6619\",\"6620\",\"6621\",\"6622\",\"6623\",\"6624\",\"6625\",\"6626\",\"6627\",\"6628\",\"6629\",\"6630\",\"6631\",\"6632\",\"6633\",\"6634\",\"6635\",\"6636\",\"6637\",\"6638\",\"6639\",\"6640\",\"6641\",\"6642\",\"6643\",\"6644\",\"6645\",\"6646\",\"6647\",\"6648\",\"6649\",\"6650\",\"6651\",\"6652\",\"6653\",\"6654\",\"6655\",\"6656\",\"6657\",\"6658\",\"6659\",\"6660\",\"6661\",\"6662\",\"6663\",\"6664\",\"6665\",\"6666\",\"6667\",\"6668\",\"6669\",\"6670\",\"6671\",\"6672\",\"6673\",\"6674\",\"6675\",\"6676\",\"6677\",\"6678\",\"6679\",\"6680\",\"6681\",\"6682\",\"6683\",\"6684\",\"6685\",\"6686\",\"6687\",\"6688\",\"6689\",\"6690\",\"6691\",\"6692\",\"6693\",\"6694\",\"6695\",\"6696\",\"6697\",\"6698\",\"6699\",\"6700\",\"6701\",\"6702\",\"6703\",\"6704\",\"6705\",\"6706\",\"6707\",\"6708\",\"6709\",\"6710\",\"6711\",\"6712\",\"6713\",\"6714\",\"6715\",\"6716\",\"6717\",\"6718\",\"6719\",\"6720\",\"6721\",\"6722\",\"6723\",\"6724\",\"6725\",\"6726\",\"6727\",\"6728\",\"6729\",\"6730\",\"6731\",\"6732\",\"6733\",\"6734\",\"6735\",\"6736\",\"6737\",\"6738\",\"6739\",\"6740\",\"6741\",\"6742\",\"6743\",\"6744\",\"6745\",\"6746\",\"6747\",\"6748\",\"6749\",\"6750\",\"6751\",\"6752\",\"6753\",\"6754\",\"6755\",\"6756\",\"6757\",\"6758\",\"6759\",\"6760\",\"6761\",\"6762\",\"6763\",\"6764\",\"6765\",\"6766\",\"6767\",\"6768\",\"6769\",\"6770\",\"6771\",\"6772\",\"6773\",\"6774\",\"6775\",\"6776\",\"6777\",\"6778\",\"6779\",\"6780\",\"6781\",\"6782\",\"6783\",\"6784\",\"6785\",\"6786\",\"6787\",\"6788\",\"6789\",\"6790\",\"6791\",\"6792\",\"6793\",\"6794\",\"6795\",\"6796\",\"6797\",\"6798\",\"6799\",\"6800\",\"6801\",\"6802\",\"6803\",\"6804\",\"6805\",\"6806\",\"6807\",\"6808\",\"6809\",\"6810\",\"6811\",\"6812\",\"6813\",\"6814\",\"6815\",\"6816\",\"6817\",\"6818\",\"6819\",\"6820\",\"6821\",\"6822\",\"6823\",\"6824\",\"6825\",\"6826\",\"6827\",\"6828\",\"6829\",\"6830\",\"6831\",\"6832\",\"6833\",\"6834\",\"6835\",\"6836\",\"6837\",\"6838\",\"6839\",\"6840\",\"6841\",\"6842\",\"6843\",\"6844\",\"6845\",\"6846\",\"6847\",\"6848\",\"6849\",\"6850\",\"6851\",\"6852\",\"6853\",\"6854\",\"6855\",\"6856\",\"6857\",\"6858\",\"6859\",\"6860\",\"6861\",\"6862\",\"6863\",\"6864\",\"6865\",\"6866\",\"6867\",\"6868\",\"6869\",\"6870\",\"6871\",\"6872\",\"6873\",\"6874\",\"6875\",\"6876\",\"6877\",\"6878\",\"6879\",\"6880\",\"6881\",\"6882\",\"6883\",\"6884\",\"6885\",\"6886\",\"6887\",\"6888\",\"6889\",\"6890\",\"6891\",\"6892\",\"6893\",\"6894\",\"6895\",\"6896\",\"6897\",\"6898\",\"6899\",\"6900\",\"6901\",\"6902\",\"6903\",\"6904\",\"6905\",\"6906\",\"6907\",\"6908\",\"6909\",\"6910\",\"6911\",\"6912\",\"6913\",\"6914\",\"6915\",\"6916\",\"6917\",\"6918\",\"6919\",\"6920\",\"6921\",\"6922\",\"6923\",\"6924\",\"6925\",\"6926\",\"6927\",\"6928\",\"6929\",\"6930\",\"6931\",\"6932\",\"6933\",\"6934\",\"6935\",\"6936\",\"6937\",\"6938\",\"6939\",\"6940\",\"6941\",\"6998\",\"6999\",\"7000\",\"7001\",\"7002\",\"7003\",\"7004\",\"7005\",\"7006\",\"7007\",\"7008\",\"7009\",\"7010\",\"7011\",\"7012\",\"7013\",\"7014\",\"7015\",\"7016\",\"7017\",\"7018\",\"7019\",\"7020\",\"7021\",\"7022\",\"7023\",\"7024\",\"7025\",\"7026\",\"7027\",\"7028\",\"7029\",\"7030\",\"7031\",\"7032\",\"7033\",\"7034\",\"7035\",\"7036\",\"7037\",\"7038\",\"7039\",\"7040\",\"7041\",\"7042\",\"7043\",\"7044\",\"7045\",\"7046\",\"7047\",\"7048\",\"7049\",\"7050\",\"7051\",\"7052\",\"7053\",\"7054\",\"7055\",\"7056\",\"7057\",\"7058\",\"7059\",\"7060\",\"7061\",\"7062\",\"7063\",\"7064\",\"7065\",\"7066\",\"7067\",\"7068\",\"7069\",\"7070\",\"7071\",\"7072\",\"7073\",\"7074\",\"7075\",\"7076\",\"7077\",\"7078\",\"7079\",\"7080\",\"7081\",\"7082\",\"7083\",\"7084\",\"7085\",\"7086\",\"7087\",\"7088\",\"7089\",\"7090\",\"7091\",\"7092\",\"7093\",\"7094\",\"7095\",\"7096\",\"7097\",\"7098\",\"7099\",\"7100\",\"7101\",\"7102\",\"7103\",\"7104\",\"7105\",\"7106\",\"7107\",\"7108\",\"7109\",\"7110\",\"7111\",\"7112\",\"7113\",\"7114\",\"7115\",\"7116\",\"7117\",\"7118\",\"7119\",\"7120\",\"7121\",\"7122\",\"7123\",\"7124\",\"7125\",\"7126\",\"7127\",\"7128\",\"7129\",\"7130\",\"7131\",\"7132\",\"7133\",\"7134\",\"7135\",\"7136\",\"7137\",\"7138\",\"7139\",\"7140\",\"7141\",\"7142\",\"7143\",\"7144\",\"7145\",\"7146\",\"7147\",\"7148\",\"7149\",\"7150\",\"7151\",\"7152\",\"7153\",\"7154\",\"7155\",\"7156\",\"7157\",\"7158\",\"7159\",\"7160\",\"7161\",\"7162\",\"7163\",\"7164\",\"7165\",\"7166\",\"7167\",\"7168\",\"7169\",\"7170\",\"7171\",\"7172\",\"7173\",\"7174\",\"7175\",\"7176\",\"7177\",\"7178\",\"7179\",\"7180\",\"7181\",\"7182\",\"7183\",\"7184\",\"7185\",\"7186\",\"7187\",\"7188\",\"7189\",\"7190\",\"7191\",\"7192\",\"7193\",\"7194\",\"7195\",\"7196\",\"7197\",\"7198\",\"7199\",\"7200\",\"7201\",\"7202\",\"7203\",\"7204\",\"7205\",\"7206\",\"7207\",\"7208\",\"7209\",\"7210\",\"7211\",\"7212\",\"7213\",\"7214\",\"7215\",\"7216\",\"7217\",\"7218\",\"7219\",\"7220\",\"7221\",\"7222\",\"7223\",\"7224\",\"7225\",\"7226\",\"7227\",\"7228\",\"7229\",\"7230\",\"7231\",\"7232\",\"7233\",\"7234\",\"7235\",\"7236\",\"7237\",\"7238\",\"7239\",\"7240\",\"7241\",\"7242\",\"7243\",\"7244\",\"7245\",\"7246\",\"7247\",\"7248\",\"7249\",\"7250\",\"7251\",\"7252\",\"7253\",\"7254\",\"7255\",\"7256\",\"7257\",\"7258\",\"7259\",\"7260\",\"7261\",\"7262\",\"7263\",\"7264\",\"7265\",\"7266\",\"7267\",\"7268\",\"7269\",\"7270\",\"7271\",\"7272\",\"7273\",\"7274\",\"7275\",\"7276\",\"7277\",\"7278\",\"7279\",\"7280\",\"7281\",\"7282\",\"7283\",\"7284\",\"7285\",\"7286\",\"7287\",\"7288\",\"7289\",\"7290\",\"7291\",\"7292\",\"7293\",\"7294\",\"7295\",\"7296\",\"7297\",\"7298\",\"7299\",\"7300\",\"7301\",\"7302\",\"7303\",\"7304\",\"7305\",\"7306\",\"7307\",\"7308\",\"7309\",\"7310\",\"7311\",\"7312\",\"7313\",\"7314\",\"7315\",\"7316\",\"7317\",\"7318\",\"7319\",\"7320\",\"7321\",\"7322\",\"7323\",\"7324\",\"7325\",\"7326\",\"7327\",\"7328\",\"7329\",\"7330\",\"7331\",\"7332\",\"7333\",\"7334\",\"7335\",\"7336\",\"7337\",\"7338\",\"7339\",\"7340\",\"7341\",\"7342\",\"7343\",\"7344\",\"7345\",\"7346\",\"7347\",\"7348\",\"7349\",\"7350\",\"7351\",\"7352\",\"7353\",\"7354\",\"7355\",\"7356\",\"7357\",\"7358\",\"7359\",\"7360\",\"7361\",\"7362\",\"7363\",\"7364\",\"7365\",\"7366\",\"7367\",\"7368\",\"7369\",\"7370\",\"7371\",\"7372\",\"7373\",\"7374\",\"7375\",\"7376\",\"7377\",\"7378\",\"7379\",\"7380\",\"7381\",\"7382\",\"7383\",\"7384\",\"7385\",\"7386\",\"7387\",\"7388\",\"7389\",\"7390\",\"7391\",\"7392\",\"7393\",\"7394\",\"7395\",\"7396\",\"7397\",\"7398\",\"7399\",\"7400\",\"7401\",\"7402\",\"7403\",\"7404\",\"7405\",\"7406\",\"7407\",\"7408\",\"7409\",\"7410\",\"7411\",\"7412\",\"7413\",\"7414\",\"7415\",\"7416\",\"7417\",\"7418\",\"7419\",\"7420\",\"7421\",\"7422\",\"7423\",\"7424\",\"7425\",\"7426\",\"7427\",\"7428\",\"7429\",\"7430\",\"7431\",\"7432\",\"7433\",\"7434\",\"7435\",\"7436\",\"7437\",\"7438\",\"7439\",\"7440\",\"7441\",\"7442\",\"7443\",\"7444\",\"7445\",\"7446\",\"7447\",\"7448\",\"7449\",\"7450\",\"7451\",\"7452\",\"7453\",\"7454\",\"7455\",\"7456\",\"7457\",\"7458\",\"7459\",\"7460\",\"7461\",\"7462\",\"7463\",\"7464\",\"7465\",\"7466\",\"7467\",\"7468\",\"7469\",\"7470\",\"7471\",\"7472\",\"7473\",\"7474\",\"7475\",\"7476\",\"7477\",\"7478\",\"7479\",\"7480\",\"7481\",\"7482\",\"7483\",\"7484\",\"7485\",\"7486\",\"7487\",\"7488\",\"7489\",\"7490\",\"7491\",\"7492\",\"7493\",\"7494\",\"7495\",\"7496\",\"7497\",\"7498\",\"7499\",\"7500\",\"7501\",\"7502\",\"7503\",\"7504\",\"7505\",\"7506\",\"7507\",\"7508\",\"7509\",\"7510\",\"7511\",\"7512\",\"7513\",\"7514\",\"7515\",\"7516\",\"7517\",\"7518\",\"7519\",\"7520\",\"7521\",\"7522\",\"7523\",\"7524\",\"7525\",\"7526\",\"7527\",\"7528\",\"7529\",\"7530\",\"7531\",\"7532\",\"7533\",\"7534\",\"7535\",\"7536\",\"7537\",\"7538\",\"7539\",\"7540\",\"7541\",\"7542\",\"7543\",\"7544\",\"7545\",\"7546\",\"7547\",\"7548\",\"7549\",\"7550\",\"7551\",\"7552\",\"7553\",\"7554\",\"7555\",\"7556\",\"7557\",\"7558\",\"7559\",\"7560\",\"7561\",\"7562\",\"7563\",\"7564\",\"7565\",\"7566\",\"7567\",\"7568\",\"7569\",\"7570\",\"7571\",\"7572\",\"7573\",\"7574\",\"7575\",\"7576\",\"7577\",\"7578\",\"7579\",\"7580\",\"7581\",\"7582\",\"7583\",\"7584\",\"7585\",\"7586\",\"7587\",\"7588\",\"7589\",\"7590\",\"7591\",\"7592\",\"7593\",\"7594\",\"7595\",\"7596\",\"7597\",\"7598\",\"7599\",\"7600\",\"7601\",\"7602\",\"7603\",\"7604\",\"7605\",\"7606\",\"7607\",\"7608\",\"7609\",\"7610\",\"7611\",\"7612\",\"7613\",\"7614\",\"7615\",\"7616\",\"7617\",\"7618\",\"7619\",\"7620\",\"7621\",\"7622\",\"7623\",\"7624\",\"7625\",\"7626\",\"7627\",\"7628\",\"7629\",\"7630\",\"7631\",\"7632\",\"7633\",\"7634\",\"7635\",\"7636\",\"7637\",\"7638\",\"7639\",\"7640\",\"7641\",\"7642\",\"7643\",\"7644\",\"7645\",\"7646\",\"7647\",\"7648\",\"7649\",\"7650\",\"7651\",\"7652\",\"7653\",\"7654\",\"7655\",\"7656\",\"7657\",\"7658\",\"7659\",\"7660\",\"7661\",\"7662\",\"7663\",\"7664\",\"7665\",\"7666\",\"7667\",\"7668\",\"7669\",\"7670\",\"7671\",\"7672\",\"7673\",\"7674\",\"7675\",\"7676\",\"7677\",\"7678\",\"7679\",\"7680\",\"7681\",\"7682\",\"7683\",\"7684\",\"7685\",\"7686\",\"7687\",\"7688\",\"7689\",\"7690\",\"7691\",\"7692\",\"7693\",\"7694\",\"7695\",\"7696\",\"7697\",\"7698\",\"7699\",\"7700\",\"7701\",\"7702\",\"7703\",\"7704\",\"7705\",\"7706\",\"7707\",\"7708\",\"7709\",\"7710\",\"7711\",\"7712\",\"7713\",\"7714\",\"7715\",\"7716\",\"7717\",\"7718\",\"7719\",\"7720\",\"7721\",\"7722\",\"7723\",\"7724\",\"7725\",\"7726\",\"7727\",\"7728\",\"7729\",\"7730\",\"7731\",\"7732\",\"7733\",\"7734\",\"7735\",\"7736\",\"7737\",\"7738\",\"7739\",\"7740\",\"7741\",\"7742\",\"7743\",\"7744\",\"7745\",\"7746\",\"7747\",\"7748\",\"7749\",\"7750\",\"7751\",\"7752\",\"7753\",\"7754\",\"7755\",\"7756\",\"7757\",\"7758\",\"7759\",\"7760\",\"7761\",\"7762\",\"7763\",\"7764\",\"7765\",\"7766\",\"7767\",\"7768\",\"7769\",\"7770\",\"7771\",\"7772\",\"7773\",\"7774\",\"7775\",\"7776\",\"7777\",\"7778\",\"7779\",\"7780\",\"7781\",\"7782\",\"7783\",\"7784\",\"7785\",\"7786\",\"7787\",\"7788\",\"7789\",\"7790\",\"7791\",\"7792\",\"7793\",\"7794\",\"7795\",\"7796\",\"7797\",\"7798\",\"7799\",\"7800\",\"7801\",\"7802\",\"7803\",\"7804\",\"7805\",\"7806\",\"7807\",\"7808\",\"7809\",\"7810\",\"7811\",\"7812\",\"7813\",\"7814\",\"7815\",\"7816\",\"7817\",\"7818\",\"7819\",\"7820\",\"7821\",\"7822\",\"7823\",\"7824\",\"7825\",\"7826\",\"7827\",\"7828\",\"7829\",\"7830\",\"7831\",\"7832\",\"7833\",\"7834\",\"7835\",\"7836\",\"7837\",\"7838\",\"7839\",\"7840\",\"7841\",\"7842\",\"7843\",\"7844\",\"7845\",\"7846\",\"7847\",\"7848\",\"7849\",\"7850\",\"7851\",\"7852\",\"7853\",\"7854\",\"7855\",\"7856\",\"7857\",\"7858\",\"7859\",\"7860\",\"7861\",\"7862\",\"7863\",\"7864\",\"7865\",\"7866\",\"7867\",\"7868\",\"7869\",\"7870\",\"7871\",\"7872\",\"7873\",\"7874\",\"7875\",\"7876\",\"7877\",\"7878\",\"7879\",\"7880\",\"7881\",\"7882\",\"7883\",\"7884\",\"7885\",\"7886\",\"7887\",\"7888\",\"7889\",\"7890\",\"7891\",\"7892\",\"7893\",\"7894\",\"7895\",\"7896\",\"7897\",\"7898\",\"7899\",\"7900\",\"7901\",\"7902\",\"7903\",\"7904\",\"7905\",\"7906\",\"7907\",\"7908\",\"7909\",\"7910\",\"7911\",\"7912\",\"7913\",\"7914\",\"7915\",\"7916\",\"7917\",\"7918\",\"7919\",\"7920\",\"7921\",\"7922\",\"7923\",\"7924\",\"7925\",\"7926\",\"7927\",\"7928\",\"7929\",\"7930\",\"7931\",\"7932\",\"7933\",\"7934\",\"7935\",\"7936\",\"7937\",\"7938\",\"7939\",\"7940\",\"7941\",\"7942\",\"7943\",\"7944\",\"7945\",\"7946\",\"7947\",\"7948\",\"7949\",\"7950\",\"7951\",\"7952\",\"7953\",\"7954\",\"7955\",\"7956\",\"7957\",\"7958\",\"7959\",\"7960\",\"7961\",\"7962\",\"7963\",\"7964\",\"7965\",\"7966\",\"7967\",\"7968\",\"7969\",\"7970\",\"7971\",\"7972\",\"7973\",\"7974\",\"7975\",\"7976\",\"7977\",\"7978\",\"7979\",\"7980\",\"7981\",\"7982\",\"7983\",\"7984\",\"7985\",\"7986\",\"7987\",\"7988\",\"7989\",\"7990\",\"7991\",\"7992\",\"7993\",\"7994\",\"7995\",\"7996\",\"7997\",\"7998\",\"7999\",\"8000\",\"8001\",\"8002\",\"8003\",\"8004\",\"8005\",\"8006\",\"8007\",\"8008\",\"8009\",\"8010\",\"8011\",\"8012\",\"8013\",\"8014\",\"8015\",\"8016\",\"8017\",\"8018\",\"8019\",\"8020\",\"8021\",\"8022\",\"8023\",\"8024\",\"8025\",\"8026\",\"8027\",\"8028\",\"8029\",\"8030\",\"8031\",\"8032\",\"8033\",\"8034\",\"8035\",\"8036\",\"8037\",\"8038\",\"8039\",\"8040\",\"8041\",\"8042\",\"8043\",\"8044\",\"8045\",\"8046\",\"8047\",\"8048\",\"8049\",\"8050\",\"8051\",\"8052\",\"8053\",\"8054\",\"8055\",\"8056\",\"8057\",\"8058\",\"8059\",\"8060\",\"8061\",\"8062\",\"8063\",\"8064\",\"8065\",\"8066\",\"8067\",\"8068\",\"8069\",\"8070\",\"8071\",\"8072\",\"8073\",\"8074\",\"8075\",\"8076\",\"8077\",\"8078\",\"8079\",\"8080\",\"8081\",\"8082\",\"8083\",\"8084\",\"8085\",\"8086\",\"8087\",\"8088\",\"8089\",\"8090\",\"8091\",\"8092\",\"8093\",\"8094\",\"8095\",\"8096\",\"8097\",\"8098\",\"8099\",\"8100\",\"8101\",\"8102\",\"8103\",\"8104\",\"8105\",\"8106\",\"8107\",\"8108\",\"8109\",\"8110\",\"8111\",\"8112\",\"8113\",\"8114\",\"8115\",\"8116\",\"8117\",\"8118\",\"8119\",\"8120\",\"8121\",\"8122\",\"8123\",\"8124\",\"8125\",\"8126\",\"8127\",\"8128\",\"8129\",\"8130\",\"8131\",\"8132\",\"8133\",\"8134\",\"8135\",\"8136\",\"8137\",\"8138\",\"8139\",\"8140\",\"8141\",\"8142\",\"8143\",\"8144\",\"8145\",\"8146\",\"8147\",\"8148\",\"8149\",\"8150\",\"8151\",\"8152\",\"8153\",\"8154\",\"8155\",\"8156\",\"8157\",\"8158\",\"8159\",\"8160\",\"8161\",\"8162\",\"8163\",\"8164\",\"8165\",\"8166\",\"8167\",\"8168\",\"8169\",\"8170\",\"8171\",\"8172\",\"8173\",\"8174\",\"8175\",\"8176\",\"8177\",\"8178\",\"8179\",\"8180\",\"8181\",\"8182\",\"8183\",\"8184\",\"8185\",\"8186\",\"8187\",\"8188\",\"8189\",\"8190\",\"8191\",\"8192\",\"8193\",\"8194\",\"8195\",\"8196\",\"8197\",\"8198\",\"8199\",\"8200\",\"8201\",\"8202\",\"8203\",\"8204\",\"8205\",\"8206\",\"8207\",\"8208\",\"8209\",\"8210\",\"8211\",\"8212\",\"8213\",\"8214\",\"8215\",\"8216\",\"8217\",\"8218\",\"8219\",\"8220\",\"8221\",\"8222\",\"8223\",\"8224\",\"8225\",\"8226\",\"8227\",\"8228\",\"8229\",\"8230\",\"8231\",\"8232\",\"8233\",\"8234\",\"8235\",\"8236\",\"8237\",\"8238\",\"8239\",\"8240\",\"8241\",\"8242\",\"8243\",\"8244\",\"8245\",\"8246\",\"8247\",\"8248\",\"8249\",\"8250\",\"8251\",\"8252\",\"8253\",\"8254\",\"8255\",\"8256\",\"8257\",\"8258\",\"8259\",\"8260\",\"8261\",\"8262\",\"8263\",\"8264\",\"8265\",\"8266\",\"8267\",\"8268\",\"8269\",\"8270\",\"8271\",\"8272\",\"8273\",\"8274\",\"8275\",\"8276\",\"8277\",\"8278\",\"8279\",\"8280\",\"8281\",\"8282\",\"8283\",\"8284\",\"8285\",\"8286\",\"8287\",\"8288\",\"8289\",\"8290\",\"8291\",\"8292\",\"8293\",\"8294\",\"8295\",\"8296\",\"8297\",\"8298\",\"8299\",\"8300\",\"8301\",\"8302\",\"8303\",\"8304\",\"8305\",\"8306\",\"8307\",\"8308\",\"8309\",\"8310\",\"8311\",\"8312\",\"8313\",\"8314\",\"8315\",\"8316\",\"8317\",\"8318\",\"8319\",\"8320\",\"8321\",\"8322\",\"8323\",\"8324\",\"8325\",\"8326\",\"8327\",\"8328\",\"8329\",\"8330\",\"8331\",\"8332\",\"8333\",\"8334\",\"8335\",\"8336\",\"8337\",\"8338\",\"8339\",\"8340\",\"8341\",\"8342\",\"8343\",\"8344\",\"8345\",\"8346\",\"8347\",\"8348\",\"8349\",\"8350\",\"8351\",\"8352\",\"8353\",\"8354\",\"8355\",\"8356\",\"8357\",\"8358\",\"8359\",\"8360\",\"8361\",\"8362\",\"8363\",\"8364\",\"8365\",\"8366\",\"8367\",\"8368\",\"8369\",\"8370\",\"8371\",\"8372\",\"8373\",\"8374\",\"8375\",\"8376\",\"8377\",\"8378\",\"8379\",\"8380\",\"8381\",\"8382\",\"8383\",\"8384\",\"8385\",\"8386\",\"8387\",\"8388\",\"8389\",\"8390\",\"8391\",\"8392\",\"8393\",\"8394\",\"8395\",\"8396\",\"8397\",\"8398\",\"8399\",\"8400\",\"8401\",\"8402\",\"8403\",\"8404\",\"8405\",\"8406\",\"8407\",\"8408\",\"8409\",\"8410\",\"8411\",\"8412\",\"8413\",\"8414\",\"8415\",\"8416\",\"8417\",\"8418\",\"8419\",\"8420\",\"8421\",\"8422\",\"8423\",\"8424\",\"8425\",\"8426\",\"8427\",\"8428\",\"8429\",\"8430\",\"8431\",\"8432\",\"8433\",\"8434\",\"8435\",\"8436\",\"8437\",\"8438\",\"8439\",\"8440\",\"8441\",\"8442\",\"8443\",\"8444\",\"8445\",\"8446\",\"8447\",\"8448\",\"8449\",\"8450\",\"8451\",\"8452\",\"8453\",\"8454\",\"8455\",\"8456\",\"8457\",\"8458\",\"8459\",\"8460\",\"8461\",\"8462\",\"8463\",\"8464\",\"8465\",\"8466\",\"8467\",\"8468\",\"8469\",\"8470\",\"8471\",\"8472\",\"8473\",\"8474\",\"8475\",\"8476\",\"8477\",\"8478\",\"8479\",\"8480\",\"8481\",\"8482\",\"8483\",\"8484\",\"8485\",\"8486\",\"8487\",\"8488\",\"8489\",\"8490\",\"8491\",\"8492\",\"8493\",\"8494\",\"8495\",\"8496\",\"8497\",\"8498\",\"8499\",\"8500\",\"8501\",\"8502\",\"8503\",\"8504\",\"8505\",\"8506\",\"8507\",\"8508\",\"8509\",\"8510\",\"8511\",\"8512\",\"8513\",\"8514\",\"8515\",\"8516\",\"8517\",\"8518\",\"8519\",\"8520\",\"8521\",\"8522\",\"8523\",\"8524\",\"8525\",\"8526\",\"8527\",\"8528\",\"8529\",\"8530\",\"8531\",\"8532\",\"8533\",\"8534\",\"8535\",\"8536\",\"8537\",\"8538\",\"8539\",\"8540\",\"8541\",\"8542\",\"8543\",\"8544\",\"8545\",\"8546\",\"8547\",\"8548\",\"8549\",\"8550\",\"8551\",\"8552\",\"8553\",\"8554\",\"8555\",\"8556\",\"8557\",\"8558\",\"8559\",\"8560\",\"8561\",\"8562\",\"8563\",\"8564\",\"8565\",\"8566\",\"8567\",\"8568\",\"8569\",\"8570\",\"8571\",\"8572\",\"8573\",\"8574\",\"8575\",\"8576\",\"8577\",\"8578\",\"8579\",\"8580\",\"8581\",\"8582\",\"8583\",\"8584\",\"8585\",\"8586\",\"8587\",\"8588\",\"8589\",\"8590\",\"8591\",\"8592\",\"8593\",\"8594\",\"8595\",\"8596\",\"8597\",\"8598\",\"8599\",\"8600\",\"8601\",\"8602\",\"8603\",\"8604\",\"8605\",\"8606\",\"8607\",\"8608\",\"8609\",\"8610\",\"8611\",\"8612\",\"8613\",\"8614\",\"8615\",\"8616\",\"8617\",\"8618\",\"8619\",\"8620\",\"8621\",\"8622\",\"8623\",\"8624\",\"8625\",\"8626\",\"8627\",\"8628\",\"8629\",\"8630\",\"8631\",\"8632\",\"8633\",\"8634\",\"8635\",\"8636\",\"8637\",\"8638\",\"8639\",\"8640\",\"8641\",\"8642\",\"8643\",\"8644\",\"8645\",\"8646\",\"8647\",\"8648\",\"8649\",\"8650\",\"8651\",\"8652\",\"8653\",\"8654\",\"8655\",\"8656\",\"8657\",\"8658\",\"8659\",\"8660\",\"8661\",\"8662\",\"8663\",\"8664\",\"8665\",\"8666\",\"8667\",\"8668\",\"8669\",\"8670\",\"8671\",\"8672\",\"8673\",\"8674\",\"8675\",\"8676\",\"8677\",\"8678\",\"8679\",\"8680\",\"8681\",\"8682\",\"8683\",\"8684\",\"8685\",\"8686\",\"8687\",\"8688\",\"8689\",\"8690\",\"8691\",\"8692\",\"8693\",\"8694\",\"8695\",\"8696\",\"8697\",\"8698\",\"8699\",\"8700\",\"8701\",\"8702\",\"8703\",\"8704\",\"8705\",\"8706\",\"8707\",\"8708\",\"8709\",\"8710\",\"8711\",\"8712\",\"8713\",\"8714\",\"8715\",\"8716\",\"8717\",\"8718\",\"8719\",\"8720\",\"8721\",\"8722\",\"8723\",\"8724\",\"8725\",\"8726\",\"8727\",\"8728\",\"8729\",\"8730\",\"8731\",\"8732\",\"8733\",\"8734\",\"8735\",\"8736\",\"8737\",\"8738\",\"8739\",\"8740\",\"8741\",\"8742\",\"8743\",\"8744\",\"8745\",\"8746\",\"8747\",\"8748\",\"8749\",\"8750\",\"8751\",\"8752\",\"8753\",\"8754\",\"8755\",\"8756\",\"8757\",\"8758\",\"8759\",\"8760\",\"8761\",\"8762\",\"8763\",\"8764\",\"8765\",\"8766\",\"8767\",\"8768\",\"8769\",\"8770\",\"8771\",\"8772\",\"8773\",\"8774\",\"8775\",\"8776\",\"8777\",\"8778\",\"8779\",\"8780\",\"8781\",\"8782\",\"8783\",\"8784\",\"8785\",\"8786\",\"8787\",\"8788\",\"8789\",\"8790\",\"8791\",\"8792\",\"8793\",\"8794\",\"8795\",\"8796\",\"8797\",\"8798\",\"8799\",\"8800\",\"8801\",\"8802\",\"8803\",\"8804\",\"8805\",\"8806\",\"8807\",\"8808\",\"8809\",\"8810\",\"8811\",\"8812\",\"8813\",\"8814\",\"8815\",\"8816\",\"8817\",\"8818\",\"8819\",\"8820\",\"8821\",\"8822\",\"8823\",\"8824\",\"8825\",\"8826\",\"8827\",\"8828\",\"8829\",\"8830\",\"8831\",\"8832\",\"8833\",\"8834\",\"8835\",\"8836\",\"8837\",\"8838\",\"8839\",\"8840\",\"8841\",\"8842\",\"8843\",\"8844\",\"8845\",\"8846\",\"8847\",\"8848\",\"8849\",\"8850\",\"8851\",\"8852\",\"8853\",\"8854\",\"8855\",\"8856\",\"8857\",\"8858\",\"8859\",\"8860\",\"8861\",\"8862\",\"8863\",\"8864\",\"8865\",\"8866\",\"8867\",\"8868\",\"8869\",\"8870\",\"8871\",\"8872\",\"8873\",\"8874\",\"8875\",\"8876\",\"8877\",\"8878\",\"8879\",\"8880\",\"8881\",\"8882\",\"8883\",\"8884\",\"8885\",\"8886\",\"8887\",\"8888\",\"8889\",\"8890\",\"8891\",\"8892\",\"8893\",\"8894\",\"8895\",\"8896\",\"8897\",\"8898\",\"8899\",\"8900\",\"8901\",\"8902\",\"8903\",\"8904\",\"8905\",\"8906\",\"8907\",\"8908\",\"8909\",\"8910\",\"8911\",\"8912\",\"8913\",\"8914\",\"8915\",\"8916\",\"8917\",\"8918\",\"8919\",\"8920\",\"8921\",\"8922\",\"8923\",\"8924\",\"8925\",\"8926\",\"8927\",\"8928\",\"8929\",\"8930\",\"8931\",\"8932\",\"8933\",\"8934\",\"8935\",\"8936\",\"8937\",\"8938\",\"8939\",\"8940\",\"8941\",\"8942\",\"8943\",\"8944\",\"8945\",\"8946\",\"8947\",\"8948\",\"8949\",\"8950\",\"8951\",\"8952\",\"8953\",\"8954\",\"8955\",\"8956\",\"8957\",\"8958\",\"8959\",\"8960\",\"8961\",\"8962\",\"8963\",\"8964\",\"8965\",\"8966\",\"8967\",\"8968\",\"8969\",\"8970\",\"8971\",\"8972\",\"8973\",\"8974\",\"8975\",\"8976\",\"8977\",\"8978\",\"8979\",\"8980\",\"8981\",\"8982\",\"8983\",\"8984\",\"8985\",\"8986\",\"8987\",\"8988\",\"8989\",\"8990\",\"8991\",\"8992\",\"8993\",\"8994\",\"8995\",\"8996\",\"8997\",\"8998\",\"8999\",\"9000\",\"9001\",\"9002\",\"9003\",\"9004\",\"9005\",\"9006\",\"9007\",\"9008\",\"9009\",\"9010\",\"9011\",\"9012\",\"9013\",\"9014\",\"9015\",\"9016\",\"9017\",\"9018\",\"9019\",\"9020\",\"9021\",\"9022\",\"9023\",\"9024\",\"9025\",\"9026\",\"9027\",\"9028\",\"9029\",\"9030\",\"9031\",\"9032\",\"9033\",\"9034\",\"9035\",\"9036\",\"9037\",\"9038\",\"9039\",\"9040\",\"9041\",\"9042\",\"9043\",\"9044\",\"9045\",\"9046\",\"9047\",\"9048\",\"9049\",\"9050\",\"9051\",\"9052\",\"9053\",\"9054\",\"9055\",\"9056\",\"9057\",\"9058\",\"9059\",\"9060\",\"9061\",\"9062\",\"9063\",\"9064\",\"9065\",\"9066\",\"9067\",\"9068\",\"9069\",\"9070\",\"9071\",\"9072\",\"9073\",\"9074\",\"9075\",\"9076\",\"9077\",\"9078\",\"9079\",\"9080\",\"9081\",\"9082\",\"9083\",\"9084\",\"9085\",\"9086\",\"9087\",\"9088\",\"9089\",\"9090\",\"9091\",\"9092\",\"9093\",\"9094\",\"9095\",\"9096\",\"9097\",\"9098\",\"9099\",\"9100\",\"9101\",\"9102\",\"9103\",\"9104\",\"9105\",\"9106\",\"9107\",\"9108\",\"9109\",\"9110\",\"9111\",\"9112\",\"9113\",\"9114\",\"9115\",\"9116\",\"9117\",\"9118\",\"9119\",\"9120\",\"9121\",\"9122\",\"9123\",\"9124\",\"9125\",\"9126\",\"9127\",\"9128\",\"9129\",\"9130\",\"9131\",\"9132\",\"9133\",\"9134\",\"9135\",\"9136\",\"9137\",\"9138\",\"9139\",\"9140\",\"9141\",\"9142\",\"9143\",\"9144\",\"9145\",\"9146\",\"9147\",\"9148\",\"9149\",\"9150\",\"9151\",\"9152\",\"9153\",\"9154\",\"9155\",\"9156\",\"9157\",\"9158\",\"9159\",\"9160\",\"9161\",\"9162\",\"9163\",\"9164\",\"9165\",\"9166\",\"9167\",\"9168\",\"9169\",\"9170\",\"9171\",\"9172\",\"9173\",\"9174\",\"9175\",\"9176\",\"9177\",\"9178\",\"9179\",\"9180\",\"9181\",\"9182\",\"9183\",\"9184\",\"9185\",\"9186\",\"9187\",\"9188\",\"9189\",\"9190\",\"9191\",\"9192\",\"9193\",\"9194\",\"9195\",\"9196\",\"9197\",\"9198\",\"9199\",\"9200\",\"9201\",\"9202\",\"9203\",\"9204\",\"9205\",\"9206\",\"9207\",\"9208\",\"9209\",\"9210\",\"9211\",\"9212\",\"9213\",\"9214\",\"9215\",\"9216\",\"9217\",\"9218\",\"9219\",\"9220\",\"9221\",\"9222\",\"9223\",\"9224\",\"9225\",\"9226\",\"9227\",\"9228\",\"9229\",\"9230\",\"9231\",\"9232\",\"9233\",\"9234\",\"9235\",\"9236\",\"9237\",\"9238\",\"9239\",\"9240\",\"9241\",\"9242\",\"9243\",\"9244\",\"9245\",\"9246\",\"9247\",\"9248\",\"9249\",\"9250\",\"9251\",\"9252\",\"9253\",\"9254\",\"9255\",\"9256\",\"9257\",\"9258\",\"9259\",\"9260\",\"9261\",\"9262\",\"9263\",\"9264\",\"9265\",\"9266\",\"9267\",\"9268\",\"9269\",\"9270\",\"9271\",\"9272\",\"9273\",\"9274\",\"9275\",\"9276\",\"9277\",\"9278\",\"9279\",\"9280\",\"9281\",\"9282\",\"9283\",\"9284\",\"9285\",\"9286\",\"9287\",\"9288\",\"9289\",\"9290\",\"9291\",\"9292\",\"9293\",\"9294\",\"9295\",\"9296\",\"9297\",\"9298\",\"9299\",\"9300\",\"9301\",\"9302\",\"9303\",\"9304\",\"9305\",\"9306\",\"9307\",\"9308\",\"9309\",\"9310\",\"9311\",\"9312\",\"9313\",\"9314\",\"9315\",\"9316\",\"9317\",\"9318\",\"9319\",\"9320\",\"9321\",\"9322\",\"9323\",\"9324\",\"9325\",\"9326\",\"9327\",\"9328\",\"9329\",\"9330\",\"9331\",\"9332\",\"9333\",\"9334\",\"9335\",\"9336\",\"9337\",\"9338\",\"9339\",\"9340\",\"9341\",\"9342\",\"9343\",\"9344\",\"9345\",\"9346\",\"9347\",\"9348\",\"9349\",\"9350\",\"9351\",\"9352\",\"9353\",\"9354\",\"9355\",\"9356\",\"9357\",\"9358\",\"9359\",\"9360\",\"9361\",\"9362\",\"9363\",\"9364\",\"9365\",\"9366\",\"9367\",\"9368\",\"9369\",\"9370\",\"9371\",\"9372\",\"9373\",\"9374\",\"9375\",\"9376\",\"9377\",\"9378\",\"9379\",\"9380\",\"9381\",\"9382\",\"9383\",\"9384\",\"9385\",\"9386\",\"9387\",\"9388\",\"9389\",\"9390\",\"9391\",\"9392\",\"9393\",\"9394\",\"9395\",\"9396\",\"9397\",\"9398\",\"9399\",\"9400\",\"9401\",\"9402\",\"9403\",\"9404\",\"9405\",\"9406\",\"9407\",\"9408\",\"9409\",\"9410\",\"9411\",\"9412\",\"9413\",\"9414\",\"9415\",\"9416\",\"9417\",\"9418\",\"9419\",\"9420\",\"9421\",\"9422\",\"9423\",\"9424\",\"9425\",\"9426\",\"9427\",\"9428\",\"9429\",\"9430\",\"9431\",\"9432\",\"9433\",\"9434\",\"9435\",\"9436\",\"9437\",\"9438\",\"9439\",\"9440\",\"9441\",\"9442\",\"9443\",\"9444\",\"9445\",\"9446\",\"9447\",\"9448\",\"9449\",\"9450\",\"9451\",\"9452\",\"9453\",\"9454\",\"9455\",\"9456\",\"9457\",\"9458\",\"9459\",\"9460\",\"9461\",\"9462\",\"9463\",\"9464\",\"9465\",\"9466\",\"9467\",\"9468\",\"9469\",\"9470\",\"9471\",\"9472\",\"9473\",\"9474\",\"9475\",\"9476\",\"9477\",\"9478\",\"9479\",\"9480\",\"9481\",\"9482\",\"9483\",\"9484\",\"9485\",\"9486\",\"9487\",\"9488\",\"9489\",\"9490\",\"9491\",\"9492\",\"9493\",\"9494\",\"9495\",\"9496\",\"9497\",\"9498\",\"9499\",\"9500\",\"9501\",\"9502\",\"9503\",\"9504\",\"9505\",\"9506\",\"9507\",\"9508\",\"9509\",\"9510\",\"9511\",\"9512\",\"9513\",\"9514\",\"9515\",\"9516\",\"9517\",\"9518\",\"9519\",\"9520\",\"9521\",\"9522\",\"9523\",\"9524\",\"9525\",\"9526\",\"9527\",\"9528\",\"9529\",\"9530\",\"9531\",\"9532\",\"9533\",\"9534\",\"9535\",\"9536\",\"9537\",\"9538\",\"9539\",\"9540\",\"9541\",\"9542\",\"9543\",\"9544\",\"9545\",\"9546\",\"9547\",\"9548\",\"9549\",\"9550\",\"9551\",\"9552\",\"9553\",\"9554\",\"9555\",\"9556\",\"9557\",\"9558\",\"9559\",\"9560\",\"9561\",\"9562\",\"9563\",\"9564\",\"9565\",\"9566\",\"9567\",\"9568\",\"9569\",\"9570\",\"9571\",\"9572\",\"9573\",\"9574\",\"9575\",\"9576\",\"9577\",\"9578\",\"9579\",\"9580\",\"9581\",\"9582\",\"9583\",\"9584\",\"9585\",\"9586\",\"9587\",\"9588\",\"9589\",\"9590\",\"9591\",\"9592\",\"9593\",\"9594\",\"9595\",\"9596\",\"9597\",\"9598\",\"9599\",\"9600\",\"9601\",\"9602\",\"9603\",\"9604\",\"9605\",\"9606\",\"9607\",\"9608\",\"9609\",\"9610\",\"9611\",\"9612\",\"9613\",\"9614\",\"9615\",\"9616\",\"9617\",\"9618\",\"9619\",\"9620\",\"9621\",\"9622\",\"9623\",\"9624\",\"9625\",\"9626\",\"9627\",\"9628\",\"9629\",\"9630\",\"9631\",\"9632\",\"9633\",\"9634\",\"9635\",\"9636\",\"9637\",\"9638\",\"9639\",\"9640\",\"9641\",\"9642\",\"9643\",\"9644\",\"9645\",\"9646\",\"9647\",\"9648\",\"9649\",\"9650\",\"9651\",\"9652\",\"9653\",\"9654\",\"9655\",\"9656\",\"9657\",\"9658\",\"9659\",\"9660\",\"9661\",\"9662\",\"9663\",\"9664\",\"9665\",\"9666\",\"9667\",\"9668\",\"9669\",\"9670\",\"9671\",\"9672\",\"9673\",\"9674\",\"9675\",\"9676\",\"9677\",\"9678\",\"9679\",\"9680\",\"9681\",\"9682\",\"9683\",\"9684\",\"9685\",\"9686\",\"9687\",\"9688\",\"9689\",\"9690\",\"9691\",\"9692\",\"9693\",\"9694\",\"9695\",\"9696\",\"9697\",\"9698\",\"9699\",\"9700\",\"9701\",\"9702\",\"9703\",\"9704\",\"9705\",\"9706\",\"9707\",\"9708\",\"9709\",\"9710\",\"9711\",\"9712\",\"9713\",\"9714\",\"9715\",\"9716\",\"9717\",\"9718\",\"9719\",\"9720\",\"9721\",\"9722\",\"9723\",\"9724\",\"9725\",\"9726\",\"9727\",\"9728\",\"9729\",\"9730\",\"9731\",\"9732\",\"9733\",\"9734\",\"9735\",\"9736\",\"9737\",\"9738\",\"9739\",\"9740\",\"9741\",\"9742\",\"9743\",\"9744\",\"9745\",\"9746\",\"9747\",\"9748\",\"9749\",\"9750\",\"9751\",\"9752\",\"9753\",\"9754\",\"9755\",\"9756\",\"9757\",\"9758\",\"9759\",\"9760\",\"9761\",\"9762\",\"9763\",\"9764\",\"9765\",\"9766\",\"9767\",\"9768\",\"9769\",\"9770\",\"9771\",\"9772\",\"9773\",\"9774\",\"9775\",\"9776\",\"9777\",\"9778\",\"9779\",\"9780\",\"9781\",\"9782\",\"9783\",\"9784\",\"9785\",\"9786\",\"9787\",\"9788\",\"9789\",\"9790\",\"9791\",\"9792\",\"9793\",\"9794\",\"9795\",\"9796\",\"9797\",\"9798\",\"9799\",\"9800\",\"9801\",\"9802\",\"9803\",\"9804\",\"9805\",\"9806\",\"9807\",\"9808\",\"9809\",\"9810\",\"9811\",\"9812\",\"9813\",\"9814\",\"9815\",\"9816\",\"9817\",\"9818\",\"9819\",\"9820\",\"9821\",\"9822\",\"9823\",\"9824\",\"9825\",\"9826\",\"9827\",\"9828\",\"9829\",\"9830\",\"9831\",\"9832\",\"9833\",\"9834\",\"9835\",\"9836\",\"9837\",\"9838\",\"9839\",\"9840\",\"9841\",\"9842\",\"9843\",\"9844\",\"9845\",\"9846\",\"9847\",\"9848\",\"9849\",\"9850\",\"9851\",\"9852\",\"9853\",\"9854\",\"9855\",\"9856\",\"9857\",\"9858\",\"9859\",\"9860\",\"9861\",\"9862\",\"9863\",\"9864\",\"9865\",\"9866\",\"9867\",\"9868\",\"9869\",\"9870\",\"9871\",\"9872\",\"9873\",\"9874\",\"9875\",\"9876\",\"9877\",\"9878\",\"9879\",\"9880\",\"9881\",\"9882\",\"9883\",\"9884\",\"9885\",\"9886\",\"9887\",\"9888\",\"9889\",\"9890\",\"9891\",\"9892\",\"9893\",\"9894\",\"9895\",\"9896\",\"9897\",\"9898\",\"9899\",\"9900\",\"9901\",\"9902\",\"9903\",\"9904\",\"9905\",\"9906\",\"9907\",\"9908\",\"9909\",\"9910\",\"9911\",\"9912\",\"9913\",\"9914\",\"9915\",\"9916\",\"9917\",\"9918\",\"9919\",\"9920\",\"9921\",\"9922\",\"9923\",\"9924\",\"9925\",\"9926\",\"9927\",\"9928\",\"9929\",\"9930\",\"9931\",\"9932\",\"9933\",\"9934\",\"9935\",\"9936\",\"9937\",\"9938\",\"9939\",\"9940\",\"9941\",\"9942\",\"9943\",\"9944\",\"9945\",\"9946\",\"9947\",\"9948\",\"9949\",\"9950\",\"9951\",\"9952\",\"9953\",\"9954\",\"9955\",\"9956\",\"9957\",\"9958\",\"9959\",\"9960\",\"9961\",\"9962\",\"9963\",\"9964\",\"9965\",\"9966\",\"9967\",\"9968\",\"9969\",\"9970\",\"9971\",\"9972\",\"9973\",\"9974\",\"9975\",\"9976\",\"9977\",\"9978\",\"9979\",\"9980\",\"9981\",\"9982\",\"9983\",\"9984\",\"9985\",\"9986\",\"9987\",\"9988\",\"9989\",\"9990\",\"9991\",\"9992\",\"9993\",\"9994\",\"9995\",\"9996\",\"9997\",\"9998\",\"9999\",\"10000\",\"10001\",\"10002\",\"10003\",\"10004\",\"10005\",\"10006\",\"10007\",\"10008\",\"10009\",\"10010\",\"10011\",\"10012\",\"10013\",\"10014\",\"10015\",\"10016\",\"10017\",\"10018\",\"10019\",\"10020\",\"10021\",\"10022\",\"10023\",\"10024\",\"10025\",\"10026\",\"10027\",\"10028\",\"10029\",\"10030\",\"10031\",\"10032\",\"10033\",\"10034\",\"10035\",\"10036\",\"10037\",\"10038\",\"10039\",\"10040\",\"10041\",\"10042\",\"10043\",\"10044\",\"10045\",\"10046\",\"10047\",\"10048\",\"10049\",\"10050\",\"10051\",\"10052\",\"10053\",\"10054\",\"10055\",\"10056\",\"10057\",\"10058\",\"10059\",\"10060\",\"10061\",\"10062\",\"10063\",\"10064\",\"10065\",\"10066\",\"10067\",\"10068\",\"10069\",\"10070\",\"10071\",\"10072\",\"10073\",\"10074\",\"10075\",\"10076\",\"10077\",\"10078\",\"10079\",\"10080\",\"10081\",\"10082\",\"10083\",\"10084\",\"10085\",\"10086\",\"10087\",\"10088\",\"10089\",\"10090\",\"10091\",\"10092\",\"10093\",\"10094\",\"10095\",\"10096\",\"10097\",\"10098\",\"10099\",\"10100\",\"10101\",\"10102\",\"10103\",\"10104\",\"10105\",\"10106\",\"10107\",\"10108\",\"10109\",\"10110\",\"10111\",\"10112\",\"10113\",\"10114\",\"10115\",\"10116\",\"10117\",\"10118\",\"10119\",\"10120\",\"10121\",\"10122\",\"10123\",\"10124\",\"10125\",\"10126\",\"10127\",\"10128\",\"10129\",\"10130\",\"10131\",\"10132\",\"10133\",\"10134\",\"10135\",\"10136\",\"10137\",\"10138\",\"10139\",\"10140\",\"10141\",\"10142\",\"10143\",\"10144\",\"10145\",\"10146\",\"10147\",\"10148\",\"10149\",\"10150\",\"10151\",\"10152\",\"10153\",\"10154\",\"10155\",\"10156\",\"10157\",\"10158\",\"10159\",\"10160\",\"10161\",\"10162\",\"10163\",\"10164\",\"10165\",\"10166\",\"10167\",\"10168\",\"10169\",\"10170\",\"10171\",\"10172\",\"10173\",\"10174\",\"10175\",\"10176\",\"10177\",\"10178\",\"10179\",\"10180\",\"10181\",\"10182\",\"10183\",\"10184\",\"10185\",\"10186\",\"10187\",\"10188\",\"10189\",\"10190\",\"10191\",\"10192\",\"10193\",\"10194\",\"10195\",\"10196\",\"10197\",\"10198\",\"10199\",\"10200\",\"10201\",\"10202\",\"10203\",\"10204\",\"10205\",\"10206\",\"10207\",\"10208\",\"10209\",\"10210\",\"10211\",\"10212\",\"10213\",\"10214\",\"10215\",\"10216\",\"10217\",\"10218\",\"10219\",\"10220\",\"10221\",\"10222\",\"10223\",\"10224\",\"10225\",\"10226\",\"10227\",\"10228\",\"10229\",\"10230\",\"10231\",\"10232\",\"10233\",\"10234\",\"10235\",\"10236\",\"10237\",\"10238\",\"10239\",\"10240\",\"10241\",\"10242\",\"10243\",\"10244\",\"10245\",\"10246\",\"10247\",\"10248\",\"10249\",\"10250\",\"10251\",\"10252\",\"10253\",\"10254\",\"10255\",\"10256\",\"10257\",\"10258\",\"10259\",\"10260\",\"10261\",\"10262\",\"10263\",\"10264\",\"10265\",\"10266\",\"10267\",\"10268\",\"10269\",\"10270\",\"10271\",\"10272\",\"10273\",\"10274\",\"10275\",\"10276\",\"10277\",\"10278\",\"10279\",\"10280\",\"10281\",\"10282\",\"10283\",\"10284\",\"10285\",\"10286\",\"10287\",\"10288\",\"10289\",\"10290\",\"10291\",\"10292\",\"10293\",\"10294\",\"10295\",\"10296\",\"10297\",\"10298\",\"10299\",\"10300\",\"10301\",\"10302\",\"10303\",\"10304\",\"10305\",\"10306\",\"10307\",\"10308\",\"10309\",\"10310\",\"10311\",\"10312\",\"10313\",\"10314\",\"10315\",\"10316\",\"10317\",\"10318\",\"10319\",\"10320\",\"10321\",\"10322\",\"10323\",\"10324\",\"10325\",\"10326\",\"10327\",\"10328\",\"10329\",\"10330\",\"10331\",\"10332\",\"10333\",\"10334\",\"10335\",\"10336\",\"10337\",\"10338\",\"10339\",\"10340\",\"10341\",\"10342\",\"10343\",\"10344\",\"10345\",\"10346\",\"10347\",\"10348\",\"10349\",\"10350\",\"10351\",\"10352\",\"10353\",\"10354\",\"10355\",\"10356\",\"10357\",\"10358\",\"10359\",\"10360\",\"10361\",\"10362\",\"10363\",\"10364\",\"10365\",\"10366\",\"10367\",\"10368\",\"10369\",\"10370\",\"10371\",\"10372\",\"10373\",\"10374\",\"10375\",\"10376\",\"10377\",\"10378\",\"10379\",\"10380\",\"10381\",\"10382\",\"10383\",\"10384\",\"10385\",\"10386\",\"10387\",\"10388\",\"10389\",\"10390\",\"10391\",\"10392\",\"10393\",\"10394\",\"10395\",\"10396\",\"10397\",\"10398\",\"10399\",\"10400\",\"10401\",\"10402\",\"10403\",\"10404\",\"10405\",\"10406\",\"10407\",\"10408\",\"10409\",\"10410\",\"10411\",\"10412\",\"10413\",\"10414\",\"10415\",\"10416\",\"10417\",\"10418\",\"10419\",\"10420\",\"10421\",\"10422\",\"10423\",\"10424\",\"10425\",\"10426\",\"10427\",\"10428\",\"10429\",\"10430\",\"10431\",\"10432\",\"10433\",\"10434\",\"10435\",\"10436\",\"10437\",\"10438\",\"10439\",\"10440\",\"10441\",\"10442\",\"10443\",\"10444\",\"10445\",\"10446\",\"10447\",\"10448\",\"10449\",\"10450\",\"10451\",\"10452\",\"10453\",\"10454\",\"10455\",\"10456\",\"10457\",\"10458\",\"10459\",\"10460\",\"10461\",\"10462\",\"10463\",\"10464\",\"10465\",\"10466\",\"10467\",\"10468\",\"10469\",\"10470\",\"10471\",\"10472\",\"10473\",\"10474\",\"10475\",\"10476\",\"10477\",\"10478\",\"10479\",\"10480\",\"10481\",\"10482\",\"10483\",\"10484\",\"10485\",\"10486\",\"10487\",\"10488\",\"10489\",\"10490\",\"10491\",\"10492\",\"10493\",\"10494\",\"10495\",\"10496\",\"10497\",\"10498\",\"10499\",\"10500\",\"10501\",\"10502\",\"10503\",\"10504\",\"10505\",\"10506\",\"10507\",\"10508\",\"10509\",\"10510\",\"10511\",\"10512\",\"10513\",\"10514\",\"10515\",\"10516\",\"10517\",\"10518\",\"10519\",\"10520\",\"10521\",\"10522\",\"10523\",\"10524\",\"10525\",\"10526\",\"10527\",\"10528\",\"10529\",\"10530\",\"10531\",\"10532\",\"10533\",\"10534\",\"10535\",\"10536\",\"10537\",\"10538\",\"10539\",\"10540\",\"10541\",\"10542\",\"10543\",\"10544\",\"10545\",\"10546\",\"10547\",\"10548\",\"10549\",\"10550\",\"10551\",\"10552\",\"10553\",\"10554\",\"10555\",\"10556\",\"10557\",\"10558\",\"10559\",\"10560\",\"10561\",\"10562\",\"10563\",\"10564\",\"10565\",\"10566\",\"10567\",\"10568\",\"10569\",\"10570\",\"10571\",\"10572\",\"10573\",\"10574\",\"10575\",\"10576\",\"10577\",\"10578\",\"10579\",\"10580\",\"10581\",\"10582\",\"10583\",\"10584\",\"10585\",\"10586\",\"10587\",\"10588\",\"10589\",\"10590\",\"10591\",\"10592\",\"10593\",\"10594\",\"10595\",\"10596\",\"10597\",\"10598\",\"10599\",\"10600\",\"10601\",\"10602\",\"10603\",\"10604\",\"10605\",\"10606\",\"10607\",\"10608\",\"10609\",\"10610\",\"10611\",\"10612\",\"10613\",\"10614\",\"10615\",\"10616\",\"10617\",\"10618\",\"10619\",\"10620\",\"10621\",\"10622\",\"10623\",\"10624\",\"10625\",\"10626\",\"10627\",\"10628\",\"10629\",\"10630\",\"10631\",\"10632\",\"10633\",\"10634\",\"10635\",\"10636\",\"10637\",\"10638\",\"10639\",\"10640\",\"10641\",\"10642\",\"10643\",\"10644\",\"10645\",\"10646\",\"10647\",\"10648\",\"10649\",\"10650\",\"10651\",\"10652\",\"10653\",\"10654\",\"10655\",\"10656\",\"10657\",\"10658\",\"10659\",\"10660\",\"10661\",\"10662\",\"10663\",\"10664\",\"10665\",\"10666\",\"10667\",\"10668\",\"10669\",\"10670\",\"10671\",\"10672\",\"10673\",\"10674\",\"10675\",\"10676\",\"10677\",\"10678\",\"10679\",\"10680\",\"10681\",\"10682\",\"10683\",\"10684\",\"10685\",\"10686\",\"10687\",\"10688\",\"10689\",\"10690\",\"10691\",\"10692\",\"10693\",\"10694\",\"10695\",\"10696\",\"10697\",\"10698\",\"10699\",\"10700\",\"10701\",\"10702\",\"10703\",\"10704\",\"10705\",\"10706\",\"10707\",\"10708\",\"10709\",\"10710\",\"10711\",\"10712\",\"10713\",\"10714\",\"10715\",\"10716\",\"10717\",\"10718\",\"10719\",\"10720\",\"10721\",\"10722\",\"10723\",\"10724\",\"10725\",\"10726\",\"10727\",\"10728\",\"10729\",\"10730\",\"10731\",\"10732\",\"10733\",\"10734\",\"10735\",\"10736\",\"10737\",\"10738\",\"10739\",\"10740\",\"10741\",\"10742\",\"10743\",\"10744\",\"10745\",\"10746\",\"10747\",\"10748\",\"10749\",\"10750\",\"10751\",\"10752\",\"10753\",\"10754\",\"10755\",\"10756\",\"10757\",\"10758\",\"10759\",\"10760\",\"10761\",\"10762\",\"10763\",\"10764\",\"10765\",\"10766\",\"10767\",\"10768\",\"10769\",\"10770\",\"10771\",\"10772\",\"10773\",\"10774\",\"10775\",\"10776\",\"10777\",\"10778\",\"10779\",\"10780\",\"10781\",\"10782\",\"10783\",\"10784\",\"10785\",\"10786\",\"10787\",\"10788\",\"10789\",\"10790\",\"10791\",\"10792\",\"10793\",\"10794\",\"10795\",\"10796\",\"10797\",\"10798\",\"10799\",\"10800\",\"10801\",\"10802\",\"10803\",\"10804\",\"10805\",\"10806\",\"10807\",\"10808\",\"10809\",\"10810\",\"10811\",\"10812\",\"10813\",\"10814\",\"10815\",\"10816\",\"10817\",\"10818\",\"10819\",\"10820\",\"10821\",\"10822\",\"10823\",\"10824\",\"10825\",\"10826\",\"10827\",\"10828\",\"10829\",\"10830\",\"10831\",\"10832\",\"10833\",\"10834\",\"10835\",\"10836\",\"10837\",\"10838\",\"10839\",\"10840\",\"10841\",\"10842\",\"10843\",\"10844\",\"10845\",\"10846\",\"10847\",\"10848\",\"10849\",\"10850\",\"10851\",\"10852\",\"10853\",\"10854\",\"10855\",\"10856\",\"10857\",\"10858\",\"10859\",\"10860\",\"10861\",\"10862\",\"10863\",\"10864\",\"10865\",\"10866\",\"10867\",\"10868\",\"10869\",\"10870\",\"10871\",\"10872\",\"10873\",\"10874\",\"10875\",\"10876\",\"10877\",\"10878\",\"10879\",\"10880\",\"10881\",\"10882\",\"10883\",\"10884\",\"10885\",\"10886\",\"10887\",\"10888\",\"10889\",\"10890\",\"10891\",\"10892\",\"10893\",\"10894\",\"10895\",\"10896\",\"10897\",\"10898\",\"10899\",\"10900\",\"10901\",\"10902\",\"10903\",\"10904\",\"10905\",\"10906\",\"10907\",\"10908\",\"10909\",\"10910\",\"10911\",\"10912\",\"10913\",\"10914\",\"10915\",\"10916\",\"10917\",\"10918\",\"10919\",\"10920\",\"10921\",\"10922\",\"10923\",\"10924\",\"10925\",\"10926\",\"10927\",\"10928\",\"10929\",\"10930\",\"10931\",\"10932\",\"10933\",\"10934\",\"10935\",\"10936\",\"10937\",\"10938\",\"10939\",\"10940\",\"10941\",\"10942\",\"10943\",\"10944\",\"10945\",\"10946\",\"10947\",\"10948\",\"10949\",\"10950\",\"10951\",\"10952\",\"10953\",\"10954\",\"10955\",\"10956\",\"10957\",\"10958\",\"10959\",\"10960\",\"10961\",\"10962\",\"10963\",\"10964\",\"10965\",\"10966\",\"10967\",\"10968\",\"10969\",\"10970\",\"10971\",\"10972\",\"10973\",\"10974\",\"10975\",\"10976\",\"10977\",\"10978\",\"10979\",\"10980\",\"10981\",\"10982\",\"10983\",\"10984\",\"10985\",\"10986\",\"10987\",\"10988\",\"10989\",\"10990\",\"10991\",\"10992\",\"10993\",\"10994\",\"10995\",\"10996\",\"10997\",\"10998\",\"10999\",\"11000\",\"11001\",\"11002\",\"11003\",\"11004\",\"11005\",\"11006\",\"11007\",\"11008\",\"11009\",\"11010\",\"11011\",\"11012\",\"11013\",\"11014\",\"11015\",\"11016\",\"11017\",\"11018\",\"11019\",\"11020\",\"11021\",\"11022\",\"11023\",\"11024\",\"11025\",\"11026\",\"11027\",\"11028\",\"11029\",\"11030\",\"11031\",\"11032\",\"11033\",\"11034\",\"11035\",\"11036\",\"11037\",\"11038\",\"11039\",\"11040\",\"11041\",\"11042\",\"11043\",\"11044\",\"11045\",\"11046\",\"11047\",\"11048\",\"11049\",\"11050\",\"11051\",\"11052\",\"11053\",\"11054\",\"11055\",\"11056\",\"11057\",\"11058\",\"11059\",\"11060\",\"11061\",\"11062\",\"11063\",\"11064\",\"11065\",\"11066\",\"11067\",\"11068\",\"11069\",\"11070\",\"11071\",\"11072\",\"11073\",\"11074\",\"11075\",\"11076\",\"11077\",\"11078\",\"11079\",\"11080\",\"11081\",\"11082\",\"11083\",\"11084\",\"11085\",\"11086\",\"11087\",\"11088\",\"11089\",\"11090\",\"11091\",\"11092\",\"11093\",\"11094\",\"11095\",\"11096\",\"11097\",\"11098\",\"11099\",\"11100\",\"11101\",\"11102\",\"11103\",\"11104\",\"11105\",\"11106\",\"11107\",\"11108\",\"11109\",\"11110\",\"11111\",\"11112\",\"11113\",\"11114\",\"11115\",\"11116\",\"11117\",\"11118\",\"11119\",\"11120\",\"11121\",\"11122\",\"11123\",\"11124\",\"11125\",\"11126\",\"11127\",\"11128\",\"11129\",\"11130\",\"11131\",\"11132\",\"11133\",\"11134\",\"11135\",\"11136\",\"11137\",\"11138\",\"11139\",\"11140\",\"11141\",\"11142\",\"11143\",\"11144\",\"11145\",\"11146\",\"11147\",\"11148\",\"11149\",\"11150\",\"11151\",\"11152\",\"11153\",\"11154\",\"11155\",\"11156\",\"11157\",\"11158\",\"11159\",\"11160\",\"11161\",\"11162\",\"11163\",\"11164\",\"11165\",\"11166\",\"11167\",\"11168\",\"11169\",\"11170\",\"11171\",\"11172\",\"11173\",\"11174\",\"11175\",\"11176\",\"11177\",\"11178\",\"11179\",\"11180\",\"11181\",\"11182\",\"11183\",\"11184\",\"11185\",\"11186\",\"11187\",\"11188\",\"11189\",\"11190\",\"11191\",\"11192\",\"11193\",\"11194\",\"11195\",\"11196\",\"11197\",\"11198\",\"11199\",\"11200\",\"11201\",\"11202\",\"11203\",\"11204\",\"11205\",\"11206\",\"11207\",\"11208\",\"11209\",\"11210\",\"11211\",\"11212\",\"11213\",\"11214\",\"11215\",\"11216\",\"11217\",\"11218\",\"11219\",\"11220\",\"11221\",\"11222\",\"11223\",\"11224\",\"11225\",\"11226\",\"11227\",\"11228\",\"11229\",\"11230\",\"11231\",\"11232\",\"11233\",\"11234\",\"11235\",\"11236\",\"11237\",\"11238\",\"11239\",\"11240\",\"11241\",\"11242\",\"11243\",\"11244\",\"11245\",\"11246\",\"11247\",\"11248\",\"11249\",\"11250\",\"11251\",\"11252\",\"11253\",\"11254\",\"11255\",\"11256\",\"11257\",\"11258\",\"11259\",\"11260\",\"11261\",\"11262\",\"11263\",\"11264\",\"11265\",\"11266\",\"11267\",\"11268\",\"11269\",\"11270\",\"11271\",\"11272\",\"11273\",\"11274\",\"11275\",\"11276\",\"11277\",\"11278\",\"11279\",\"11280\",\"11281\",\"11282\",\"11283\",\"11284\",\"11285\",\"11286\",\"11287\",\"11288\",\"11289\",\"11290\",\"11291\",\"11292\",\"11293\",\"11294\",\"11295\",\"11296\",\"11297\",\"11298\",\"11299\",\"11300\",\"11301\",\"11302\",\"11303\",\"11304\",\"11305\",\"11306\",\"11307\",\"11308\",\"11309\",\"11310\",\"11311\",\"11312\",\"11313\",\"11314\",\"11315\",\"11316\",\"11317\",\"11318\",\"11319\",\"11320\",\"11321\",\"11322\",\"11323\",\"11324\",\"11325\",\"11326\",\"11327\",\"11328\",\"11329\",\"11330\",\"11331\",\"11332\",\"11333\",\"11334\",\"11335\",\"11336\",\"11337\",\"11338\",\"11339\",\"11340\",\"11341\",\"11342\",\"11343\",\"11344\",\"11345\",\"11346\",\"11347\",\"11348\",\"11349\",\"11350\",\"11351\",\"11352\",\"11353\",\"11354\",\"11355\",\"11356\",\"11357\",\"11358\",\"11359\",\"11360\",\"11361\",\"11362\",\"11363\",\"11364\",\"11365\",\"11366\",\"11367\",\"11368\",\"11369\",\"11370\",\"11371\",\"11372\",\"11373\",\"11374\",\"11375\",\"11376\",\"11377\",\"11378\",\"11379\",\"11380\",\"11381\",\"11382\",\"11383\",\"11384\",\"11385\",\"11386\",\"11387\",\"11388\",\"11389\",\"11390\",\"11391\",\"11392\",\"11393\",\"11394\",\"11395\",\"11396\",\"11397\",\"11398\",\"11399\",\"11400\",\"11401\",\"11402\",\"11403\",\"11404\",\"11405\",\"11406\",\"11407\",\"11408\",\"11409\",\"11410\",\"11411\",\"11412\",\"11413\",\"11414\",\"11415\",\"11416\",\"11417\",\"11418\",\"11419\",\"11420\",\"11421\",\"11422\",\"11423\",\"11424\",\"11425\",\"11426\",\"11427\",\"11428\",\"11429\",\"11430\",\"11431\",\"11432\",\"11433\",\"11434\",\"11435\",\"11436\",\"11437\",\"11438\",\"11439\",\"11440\",\"11441\",\"11442\",\"11443\",\"11444\",\"11445\",\"11446\",\"11447\",\"11448\",\"11449\",\"11450\",\"11451\",\"11452\",\"11453\",\"11454\",\"11455\",\"11456\",\"11457\",\"11458\",\"11459\",\"11460\",\"11461\",\"11462\",\"11463\",\"11464\",\"11465\",\"11466\",\"11467\",\"11468\",\"11469\",\"11470\",\"11471\",\"11472\",\"11473\",\"11474\",\"11475\",\"11476\",\"11477\",\"11478\",\"11479\",\"11480\",\"11481\",\"11482\",\"11483\",\"11484\",\"11485\",\"11486\",\"11487\",\"11488\",\"11489\",\"11490\",\"11491\",\"11492\",\"11493\",\"11494\",\"11495\",\"11496\",\"11497\",\"11498\",\"11499\",\"11500\",\"11501\",\"11502\",\"11503\",\"11504\",\"11505\",\"11506\",\"11507\",\"11508\",\"11509\",\"11510\",\"11511\",\"11512\",\"11513\",\"11514\",\"11515\",\"11516\",\"11517\",\"11518\",\"11519\",\"11520\",\"11521\",\"11522\",\"11523\",\"11524\",\"11525\",\"11526\",\"11527\",\"11528\",\"11529\",\"11530\",\"11531\",\"11532\",\"11533\",\"11534\",\"11535\",\"11536\",\"11537\",\"11538\",\"11539\",\"11540\",\"11541\",\"11542\",\"11543\",\"11544\",\"11545\",\"11546\",\"11547\",\"11548\",\"11549\",\"11550\",\"11551\",\"11552\",\"11553\",\"11554\",\"11555\",\"11556\",\"11557\",\"11558\",\"11559\",\"11560\",\"11561\",\"11562\",\"11563\",\"11564\",\"11565\",\"11566\",\"11567\",\"11568\",\"11569\",\"11570\",\"11571\",\"11572\",\"11573\",\"11574\",\"11575\",\"11576\",\"11577\",\"11578\",\"11579\",\"11580\",\"11581\",\"11582\",\"11583\",\"11584\",\"11585\",\"11586\",\"11587\",\"11588\",\"11589\",\"11590\",\"11591\",\"11592\",\"11593\",\"11594\",\"11595\",\"11596\",\"11597\",\"11598\",\"11599\",\"11600\",\"11601\",\"11602\",\"11603\",\"11604\",\"11605\",\"11606\",\"11607\",\"11608\",\"11609\",\"11610\",\"11611\",\"11612\",\"11613\",\"11614\",\"11615\",\"11616\",\"11617\",\"11618\",\"11619\",\"11620\",\"11621\",\"11622\",\"11623\",\"11624\",\"11625\",\"11626\",\"11627\",\"11628\",\"11629\",\"11630\",\"11631\",\"11632\",\"11633\",\"11634\",\"11635\",\"11636\",\"11637\",\"11638\",\"11639\",\"11640\",\"11641\",\"11642\",\"11643\",\"11644\",\"11645\",\"11646\",\"11647\",\"11648\",\"11649\",\"11650\",\"11651\",\"11652\",\"11653\",\"11654\",\"11655\",\"11656\",\"11657\",\"11658\",\"11659\",\"11660\",\"11661\",\"11662\",\"11663\",\"11664\",\"11665\",\"11666\",\"11667\",\"11668\",\"11669\",\"11670\",\"11671\",\"11672\",\"11673\",\"11674\",\"11675\",\"11676\",\"11677\",\"11678\",\"11679\",\"11680\",\"11681\",\"11682\",\"11683\",\"11684\",\"11685\",\"11686\",\"11687\",\"11688\",\"11689\",\"11690\",\"11691\",\"11692\",\"11693\",\"11694\",\"11695\",\"11696\",\"11697\",\"11698\",\"11699\",\"11700\",\"11701\",\"11702\",\"11703\",\"11704\",\"11705\",\"11706\",\"11707\",\"11708\",\"11709\",\"11710\",\"11711\",\"11712\",\"11713\",\"11714\",\"11715\",\"11716\",\"11717\",\"11718\",\"11719\",\"11720\",\"11721\",\"11722\",\"11723\",\"11724\",\"11725\",\"11726\",\"11727\",\"11728\",\"11729\",\"11730\",\"11731\",\"11732\",\"11733\",\"11734\",\"11735\",\"11736\",\"11737\",\"11738\",\"11739\",\"11740\",\"11741\",\"11742\",\"11743\",\"11744\",\"11745\",\"11746\",\"11747\",\"11748\",\"11749\",\"11750\",\"11751\",\"11752\",\"11753\",\"11754\",\"11755\",\"11756\",\"11757\",\"11758\",\"11759\",\"11760\",\"11761\",\"11762\",\"11763\",\"11764\",\"11765\",\"11766\",\"11767\",\"11768\",\"11769\",\"11770\",\"11771\",\"11772\",\"11773\",\"11774\",\"11775\",\"11776\",\"11777\",\"11778\",\"11779\",\"11780\",\"11781\",\"11782\",\"11783\",\"11784\",\"11785\",\"11786\",\"11787\",\"11788\",\"11789\",\"11790\",\"11791\",\"11792\",\"11793\",\"11794\",\"11795\",\"11796\",\"11797\",\"11798\",\"11799\",\"11800\",\"11801\",\"11802\",\"11803\",\"11804\",\"11805\",\"11806\",\"11807\",\"11808\",\"11809\",\"11810\",\"11811\",\"11812\",\"11813\",\"11814\",\"11815\",\"11816\",\"11817\",\"11818\",\"11819\",\"11820\",\"11821\",\"11822\",\"11823\",\"11824\",\"11825\",\"11826\",\"11827\",\"11828\",\"11829\",\"11830\",\"11831\",\"11832\",\"11833\",\"11834\",\"11835\",\"11836\",\"11837\",\"11838\",\"11839\",\"11840\",\"11841\",\"11842\",\"11843\",\"11844\",\"11845\",\"11846\",\"11847\",\"11848\",\"11849\",\"11850\",\"11851\",\"11852\",\"11853\",\"11854\",\"11855\",\"11856\",\"11857\",\"11858\",\"11859\",\"11860\",\"11861\",\"11862\",\"11863\",\"11864\",\"11865\",\"11866\",\"11867\",\"11868\",\"11869\",\"11870\",\"11871\",\"11872\",\"11873\",\"11874\",\"11875\",\"11876\",\"11877\",\"11878\",\"11879\",\"11880\",\"11881\",\"11882\",\"11883\",\"11884\",\"11885\",\"11886\",\"11887\",\"11888\",\"11889\",\"11890\",\"11891\",\"11892\",\"11893\",\"11894\",\"11895\",\"11896\",\"11897\",\"11898\",\"11899\",\"11900\",\"11901\",\"11902\",\"11903\",\"11904\",\"11905\",\"11906\",\"11907\",\"11908\",\"11909\",\"11910\",\"11911\",\"11912\",\"11913\",\"11914\",\"11915\",\"11916\",\"11917\",\"11918\",\"11919\",\"11920\",\"11921\",\"11922\",\"11923\",\"11924\",\"11925\",\"11926\",\"11927\",\"11928\",\"11929\",\"11930\",\"11931\",\"11932\",\"11933\",\"11934\",\"11935\",\"11936\",\"11937\",\"11938\",\"11939\",\"11940\",\"11941\",\"11942\",\"11943\",\"11944\",\"11945\",\"11946\",\"11947\",\"11948\",\"11949\",\"11950\",\"11951\",\"11952\",\"11953\",\"11954\",\"11955\",\"11956\",\"11957\",\"11958\",\"11959\",\"11960\",\"11961\",\"11962\",\"11963\",\"11964\",\"11965\",\"11966\",\"11967\",\"11968\",\"11969\",\"11970\",\"11971\",\"11972\",\"11973\",\"11974\",\"11975\",\"11976\",\"11977\",\"11978\",\"11979\",\"11980\",\"11981\",\"11982\",\"11983\",\"11984\",\"11985\",\"11986\",\"11987\",\"11988\",\"11989\",\"11990\",\"11991\",\"11992\",\"11993\",\"11994\",\"11995\",\"11996\",\"11997\",\"11998\",\"11999\",\"12000\",\"12001\",\"12002\",\"12003\",\"12004\",\"12005\",\"12006\",\"12007\",\"12008\",\"12009\",\"12010\",\"12011\",\"12012\",\"12013\",\"12014\",\"12015\",\"12016\",\"12017\",\"12018\",\"12019\",\"12020\",\"12021\",\"12022\",\"12023\",\"12024\",\"12025\",\"12026\",\"12027\",\"12028\",\"12029\",\"12030\",\"12031\",\"12032\",\"12033\",\"12034\",\"12035\",\"12036\",\"12037\",\"12038\",\"12039\",\"12040\",\"12041\",\"12042\",\"12043\",\"12044\",\"12045\",\"12046\",\"12047\",\"12048\",\"12049\",\"12050\",\"12051\",\"12052\",\"12053\",\"12054\",\"12055\",\"12056\",\"12057\",\"12058\",\"12059\",\"12060\",\"12061\",\"12062\",\"12063\",\"12064\",\"12065\",\"12066\",\"12067\",\"12068\",\"12069\",\"12070\",\"12071\",\"12072\",\"12073\",\"12074\",\"12075\",\"12076\",\"12077\",\"12078\",\"12079\",\"12080\",\"12081\",\"12082\",\"12083\",\"12084\",\"12085\",\"12086\",\"12087\",\"12088\",\"12089\",\"12090\",\"12091\",\"12092\",\"12093\",\"12094\",\"12095\",\"12096\",\"12097\",\"12098\",\"12099\",\"12100\",\"12101\",\"12102\",\"12103\",\"12104\",\"12105\",\"12106\",\"12107\",\"12108\",\"12109\",\"12110\",\"12111\",\"12112\",\"12113\",\"12114\",\"12115\",\"12116\",\"12117\",\"12118\",\"12119\",\"12120\",\"12121\",\"12122\",\"12123\",\"12124\",\"12125\",\"12126\",\"12127\",\"12128\",\"12129\",\"12130\",\"12131\",\"12132\",\"12133\",\"12134\",\"12135\",\"12136\",\"12137\",\"12138\",\"12139\",\"12140\",\"12141\",\"12142\",\"12143\",\"12144\",\"12145\",\"12146\",\"12147\",\"12148\",\"12149\",\"12150\",\"12151\",\"12152\",\"12153\",\"12154\",\"12155\",\"12156\",\"12157\",\"12158\",\"12159\",\"12160\",\"12161\",\"12162\",\"12163\",\"12164\",\"12165\",\"12166\",\"12167\",\"12168\",\"12169\",\"12170\",\"12171\",\"12172\",\"12173\",\"12174\",\"12175\",\"12176\",\"12177\",\"12178\",\"12179\",\"12180\",\"12181\",\"12182\",\"12183\",\"12184\",\"12185\",\"12186\",\"12187\",\"12188\",\"12189\",\"12190\",\"12191\",\"12192\",\"12193\",\"12194\",\"12195\",\"12196\",\"12197\",\"12198\",\"12199\",\"12200\",\"12201\",\"12202\",\"12203\",\"12204\",\"12205\",\"12206\",\"12207\",\"12208\",\"12209\",\"12210\",\"12211\",\"12212\",\"12213\",\"12214\",\"12215\",\"12216\",\"12217\",\"12218\",\"12219\",\"12220\",\"12221\",\"12222\",\"12223\",\"12224\",\"12225\",\"12226\",\"12227\",\"12228\",\"12229\",\"12230\",\"12231\",\"12232\",\"12233\",\"12234\",\"12235\",\"12236\",\"12237\",\"12238\",\"12239\",\"12240\",\"12241\",\"12242\",\"12243\",\"12244\",\"12245\",\"12246\",\"12247\",\"12248\",\"12249\",\"12250\",\"12251\",\"12252\",\"12253\",\"12254\",\"12255\",\"12256\",\"12257\",\"12258\",\"12259\",\"12260\",\"12261\",\"12262\",\"12263\",\"12264\",\"12265\",\"12266\",\"12267\",\"12268\",\"12269\",\"12270\",\"12271\",\"12272\",\"12273\",\"12274\",\"12275\",\"12276\",\"12277\",\"12278\",\"12279\",\"12280\",\"12281\",\"12282\",\"12283\",\"12284\",\"12285\",\"12286\",\"12287\",\"12288\",\"12289\",\"12290\",\"12291\",\"12292\",\"12293\",\"12294\",\"12295\",\"12296\",\"12297\",\"12298\",\"12299\",\"12300\",\"12301\",\"12302\",\"12303\",\"12304\",\"12305\",\"12306\",\"12307\",\"12308\",\"12309\",\"12310\",\"12311\",\"12312\",\"12313\",\"12314\",\"12315\",\"12316\",\"12317\",\"12318\",\"12319\",\"12320\",\"12321\",\"12322\",\"12323\",\"12324\",\"12325\",\"12326\",\"12327\",\"12328\",\"12329\",\"12330\",\"12331\",\"12332\",\"12333\",\"12334\",\"12335\",\"12336\",\"12337\",\"12338\",\"12339\",\"12340\",\"12341\",\"12342\",\"12343\",\"12344\",\"12345\",\"12346\",\"12347\",\"12348\",\"12349\",\"12350\",\"12351\",\"12352\",\"12353\",\"12354\",\"12355\",\"12356\",\"12357\",\"12358\",\"12359\",\"12360\",\"12361\",\"12362\",\"12363\",\"12364\",\"12365\",\"12366\",\"12367\",\"12368\",\"12369\",\"12370\",\"12371\",\"12372\",\"12373\",\"12374\",\"12375\",\"12376\",\"12377\",\"12378\",\"12379\",\"12380\",\"12381\",\"12382\",\"12383\",\"12384\",\"12385\",\"12386\",\"12387\",\"12388\",\"12389\",\"12390\",\"12391\",\"12392\",\"12393\",\"12394\",\"12395\",\"12396\",\"12397\",\"12398\",\"12399\",\"12400\",\"12401\",\"12402\",\"12403\",\"12404\",\"12405\",\"12406\",\"12407\",\"12408\",\"12409\",\"12410\",\"12411\",\"12412\",\"12413\",\"12414\",\"12415\",\"12416\",\"12417\",\"12418\",\"12419\",\"12420\",\"12421\",\"12422\",\"12423\",\"12424\",\"12425\",\"12426\",\"12427\",\"12428\",\"12429\",\"12430\",\"12431\",\"12432\",\"12433\",\"12434\",\"12435\",\"12436\",\"12437\",\"12438\",\"12439\",\"12440\",\"12441\",\"12442\",\"12443\",\"12444\",\"12445\",\"12446\",\"12447\",\"12448\",\"12449\",\"12450\",\"12451\",\"12452\",\"12453\",\"12454\",\"12455\",\"12456\",\"12457\",\"12458\",\"12459\",\"12460\",\"12461\",\"12462\",\"12463\",\"12464\",\"12465\",\"12466\",\"12467\",\"12468\",\"12469\",\"12470\",\"12471\",\"12472\",\"12473\",\"12474\",\"12475\",\"12476\",\"12477\",\"12478\",\"12479\",\"12480\",\"12481\",\"12482\",\"12483\",\"12484\",\"12485\",\"12486\",\"12487\",\"12488\",\"12489\",\"12490\",\"12491\",\"12492\",\"12493\",\"12494\",\"12495\",\"12496\",\"12497\",\"12498\",\"12499\",\"12500\",\"12501\",\"12502\",\"12503\",\"12504\",\"12505\",\"12506\",\"12507\",\"12508\",\"12509\",\"12510\",\"12511\",\"12512\",\"12513\",\"12514\",\"12515\",\"12516\",\"12517\",\"12518\",\"12519\",\"12520\",\"12521\",\"12522\",\"12523\",\"12524\",\"12525\",\"12526\",\"12527\",\"12528\",\"12529\",\"12530\",\"12531\",\"12532\",\"12533\",\"12534\",\"12535\",\"12536\",\"12537\",\"12538\",\"12539\",\"12540\",\"12541\",\"12542\",\"12543\",\"12544\",\"12545\",\"12546\",\"12547\",\"12548\",\"12549\",\"12550\",\"12551\",\"12552\",\"12553\",\"12554\",\"12555\",\"12556\",\"12557\",\"12558\",\"12559\",\"12560\",\"12561\",\"12562\",\"12563\",\"12564\",\"12565\",\"12566\",\"12567\",\"12568\",\"12569\",\"12570\",\"12571\",\"12572\",\"12573\",\"12574\",\"12575\",\"12576\",\"12577\",\"12578\",\"12579\",\"12580\",\"12581\",\"12582\",\"12583\",\"12584\",\"12585\",\"12586\",\"12587\",\"12588\",\"12589\",\"12590\",\"12591\",\"12592\",\"12593\",\"12594\",\"12595\",\"12596\",\"12597\",\"12598\",\"12599\",\"12600\",\"12601\",\"12602\",\"12603\",\"12604\",\"12605\",\"12606\",\"12607\",\"12608\",\"12609\",\"12610\",\"12611\",\"12612\",\"12613\",\"12614\",\"12615\",\"12616\",\"12617\",\"12618\",\"12619\",\"12620\",\"12621\",\"12622\",\"12623\",\"12624\",\"12625\",\"12626\",\"12627\",\"12628\",\"12629\",\"12630\",\"12631\",\"12632\",\"12633\",\"12634\",\"12635\",\"12636\",\"12637\",\"12638\",\"12639\",\"12640\",\"12641\",\"12642\",\"12643\",\"12644\",\"12645\",\"12646\",\"12647\",\"12648\",\"12649\",\"12650\",\"12651\",\"12652\",\"12653\",\"12654\",\"12655\",\"12656\",\"12657\",\"12658\",\"12659\",\"12660\",\"12661\",\"12662\",\"12663\",\"12664\",\"12665\",\"12666\",\"12667\",\"12668\",\"12669\",\"12670\",\"12671\",\"12672\",\"12673\",\"12674\",\"12675\",\"12676\",\"12677\",\"12678\",\"12679\",\"12680\",\"12681\",\"12682\",\"12683\",\"12684\",\"12685\",\"12686\",\"12687\",\"12688\",\"12689\",\"12690\",\"12691\",\"12692\",\"12693\",\"12694\",\"12695\",\"12696\",\"12697\",\"12698\",\"12699\",\"12700\",\"12701\",\"12702\",\"12703\",\"12704\",\"12705\",\"12706\",\"12707\",\"12708\",\"12709\",\"12710\",\"12711\",\"12712\",\"12713\",\"12714\",\"12715\",\"12716\",\"12717\",\"12718\",\"12719\",\"12720\",\"12721\",\"12722\",\"12723\",\"12724\",\"12725\",\"12726\",\"12727\",\"12728\",\"12729\",\"12730\",\"12731\",\"12732\",\"12733\",\"12734\",\"12735\",\"12736\",\"12737\",\"12738\",\"12739\",\"12740\",\"12741\",\"12742\",\"12743\",\"12744\",\"12745\",\"12746\",\"12747\",\"12748\",\"12749\",\"12750\",\"12751\",\"12752\",\"12753\",\"12754\",\"12755\",\"12756\",\"12757\",\"12758\",\"12759\",\"12760\",\"12761\",\"12762\",\"12763\",\"12764\",\"12765\",\"12766\",\"12767\",\"12768\",\"12769\",\"12770\",\"12771\",\"12772\",\"12773\",\"12774\",\"12775\",\"12776\",\"12777\",\"12778\",\"12779\",\"12780\",\"12781\",\"12782\",\"12783\",\"12784\",\"12785\",\"12786\",\"12787\",\"12788\",\"12789\",\"12790\",\"12791\",\"12792\",\"12793\",\"12794\",\"12795\",\"12796\",\"12797\",\"12798\",\"12799\",\"12800\",\"12801\",\"12802\",\"12803\",\"12804\",\"12805\",\"12806\",\"12807\",\"12808\",\"12809\",\"12810\",\"12811\",\"12812\",\"12813\",\"12814\",\"12815\",\"12816\",\"12817\",\"12818\",\"12819\",\"12820\",\"12821\",\"12822\",\"12823\",\"12824\",\"12825\",\"12826\",\"12827\",\"12828\",\"12829\",\"12830\",\"12831\",\"12832\",\"12833\",\"12834\",\"12835\",\"12836\",\"12837\",\"12838\",\"12839\",\"12840\",\"12841\",\"12842\",\"12843\",\"12844\",\"12845\",\"12846\",\"12847\",\"12848\",\"12849\",\"12850\",\"12851\",\"12852\",\"12853\",\"12854\",\"12855\",\"12856\",\"12857\",\"12858\",\"12859\",\"12860\",\"12861\",\"12862\",\"12863\",\"12864\",\"12865\",\"12866\",\"12867\",\"12868\",\"12869\",\"12870\",\"12871\",\"12872\",\"12873\",\"12874\",\"12875\",\"12876\",\"12877\",\"12878\",\"12879\",\"12880\",\"12881\",\"12882\",\"12883\",\"12884\",\"12885\",\"12886\",\"12887\",\"12888\",\"12889\",\"12890\",\"12891\",\"12892\",\"12893\",\"12894\",\"12895\",\"12896\",\"12897\",\"12898\",\"12899\",\"12900\",\"12901\",\"12902\",\"12903\",\"12904\",\"12905\",\"12906\",\"12907\",\"12908\",\"12909\",\"12910\",\"12911\",\"12912\",\"12913\",\"12914\",\"12915\",\"12916\",\"12917\",\"12918\",\"12919\",\"12920\",\"12921\",\"12922\",\"12923\",\"12924\",\"12925\",\"12926\",\"12927\",\"12928\",\"12929\",\"12930\",\"12931\",\"12932\",\"12933\",\"12934\",\"12935\",\"12936\",\"12937\",\"12938\",\"12939\",\"12940\",\"12941\",\"12942\",\"12943\",\"12944\",\"12945\",\"12946\",\"12947\",\"12948\",\"12949\",\"12950\",\"12951\",\"12952\",\"12953\",\"12954\",\"12955\",\"12956\",\"12957\",\"12958\",\"12959\",\"12960\",\"12961\",\"12962\",\"12963\",\"12964\",\"12965\",\"12966\",\"12967\",\"12968\",\"12969\",\"12970\",\"12971\",\"12972\",\"12973\",\"12974\",\"12975\",\"12976\",\"12977\",\"12978\",\"12979\",\"12980\",\"12981\",\"12982\",\"12983\",\"12984\",\"12985\",\"12986\",\"12987\",\"12988\",\"12989\",\"12990\",\"12991\",\"12992\",\"12993\",\"12994\",\"12995\",\"12996\",\"12997\",\"12998\",\"12999\",\"13000\",\"13001\",\"13002\",\"13003\",\"13004\",\"13005\",\"13006\",\"13007\",\"13008\",\"13009\",\"13010\",\"13011\",\"13012\",\"13013\",\"13014\",\"13015\",\"13016\",\"13017\",\"13018\",\"13019\",\"13020\",\"13021\",\"13022\",\"13023\",\"13024\",\"13025\",\"13026\",\"13027\",\"13028\",\"13029\",\"13030\",\"13031\",\"13032\",\"13033\",\"13034\",\"13035\",\"13036\",\"13037\",\"13038\",\"13039\",\"13040\",\"13041\",\"13042\",\"13043\",\"13044\",\"13045\",\"13046\",\"13047\",\"13048\",\"13049\",\"13050\",\"13051\",\"13052\",\"13053\",\"13054\",\"13055\",\"13056\",\"13057\",\"13058\",\"13059\",\"13060\",\"13061\",\"13062\",\"13063\",\"13064\",\"13065\",\"13066\",\"13067\",\"13068\",\"13069\",\"13070\",\"13071\",\"13072\",\"13073\",\"13074\",\"13075\",\"13076\",\"13077\",\"13078\",\"13079\",\"13080\",\"13081\",\"13082\",\"13083\",\"13084\",\"13085\",\"13086\",\"13087\",\"13088\",\"13089\",\"13090\",\"13091\",\"13092\",\"13093\",\"13094\",\"13095\",\"13096\",\"13097\",\"13098\",\"13099\",\"13100\",\"13101\",\"13102\",\"13103\",\"13104\",\"13105\",\"13106\",\"13107\",\"13108\",\"13109\",\"13110\",\"13111\",\"13112\",\"13113\",\"13114\",\"13115\",\"13116\",\"13117\",\"13118\",\"13119\",\"13120\",\"13121\",\"13122\",\"13123\",\"13124\",\"13125\",\"13126\",\"13127\",\"13128\",\"13129\",\"13130\",\"13131\",\"13132\",\"13133\",\"13134\",\"13135\",\"13136\",\"13137\",\"13138\",\"13139\",\"13140\",\"13141\",\"13142\",\"13143\",\"13144\",\"13145\",\"13146\",\"13147\",\"13148\",\"13149\",\"13150\",\"13151\",\"13152\",\"13153\",\"13154\",\"13155\",\"13156\",\"13157\",\"13158\",\"13159\",\"13160\",\"13161\",\"13162\",\"13163\",\"13164\",\"13165\",\"13166\",\"13167\",\"13168\",\"13169\",\"13170\",\"13171\",\"13172\",\"13173\",\"13174\",\"13175\",\"13176\",\"13177\",\"13178\",\"13179\",\"13180\",\"13181\",\"13182\",\"13183\",\"13184\",\"13185\",\"13186\",\"13187\",\"13188\",\"13189\",\"13190\",\"13191\",\"13192\",\"13193\",\"13194\",\"13195\",\"13196\",\"13197\",\"13198\",\"13199\",\"13200\",\"13201\",\"13202\",\"13203\",\"13204\",\"13205\",\"13206\",\"13207\",\"13208\",\"13209\",\"13210\",\"13211\",\"13212\",\"13213\",\"13214\",\"13215\",\"13216\",\"13217\",\"13218\",\"13219\",\"13220\",\"13221\",\"13222\",\"13223\",\"13224\",\"13225\",\"13226\",\"13227\",\"13228\",\"13229\",\"13230\",\"13231\",\"13232\",\"13233\",\"13234\",\"13235\",\"13236\",\"13237\",\"13238\",\"13239\",\"13240\",\"13241\",\"13242\",\"13243\",\"13244\",\"13245\",\"13246\",\"13247\",\"13248\",\"13249\",\"13250\",\"13251\",\"13252\",\"13253\",\"13254\",\"13255\",\"13256\",\"13257\",\"13258\",\"13259\",\"13260\",\"13261\",\"13262\",\"13263\",\"13264\",\"13265\",\"13266\",\"13267\",\"13268\",\"13269\",\"13270\",\"13271\",\"13272\",\"13273\",\"13274\",\"13275\",\"13276\",\"13277\",\"13278\",\"13279\",\"13280\",\"13281\",\"13282\",\"13283\",\"13284\",\"13285\",\"13286\",\"13287\",\"13288\",\"13289\",\"13290\",\"13291\",\"13292\",\"13293\",\"13294\",\"13295\",\"13296\",\"13297\",\"13298\",\"13299\",\"13300\",\"13301\",\"13302\",\"13303\",\"13304\",\"13305\",\"13306\",\"13307\",\"13308\",\"13309\",\"13310\",\"13311\",\"13312\",\"13313\",\"13314\",\"13315\",\"13316\",\"13317\",\"13318\",\"13319\",\"13320\",\"13321\",\"13322\",\"13323\",\"13324\",\"13325\",\"13326\",\"13327\",\"13328\",\"13329\",\"13330\",\"13331\",\"13332\",\"13333\",\"13334\",\"13335\",\"13336\",\"13337\",\"13338\",\"13339\",\"13340\",\"13341\",\"13342\",\"13343\",\"13344\",\"13345\",\"13346\",\"13347\",\"13348\",\"13349\",\"13350\",\"13351\",\"13352\",\"13353\",\"13354\",\"13355\",\"13356\",\"13357\",\"13358\",\"13359\",\"13360\",\"13361\",\"13362\",\"13363\",\"13364\",\"13365\",\"13366\",\"13367\",\"13368\",\"13369\",\"13370\",\"13371\",\"13372\",\"13373\",\"13374\",\"13375\",\"13376\",\"13377\",\"13378\",\"13379\",\"13380\",\"13381\",\"13382\",\"13383\",\"13384\",\"13385\",\"13386\",\"13387\",\"13388\",\"13389\",\"13390\",\"13391\",\"13392\",\"13393\",\"13394\",\"13395\",\"13396\",\"13397\",\"13398\",\"13399\",\"13400\",\"13401\",\"13402\",\"13403\",\"13404\",\"13405\",\"13406\",\"13407\",\"13408\",\"13409\",\"13410\",\"13411\",\"13412\",\"13413\",\"13414\",\"13415\",\"13416\",\"13417\",\"13418\",\"13419\",\"13420\",\"13421\",\"13422\",\"13423\",\"13424\",\"13425\",\"13426\",\"13427\",\"13428\",\"13429\",\"13430\",\"13431\",\"13432\",\"13433\",\"13434\",\"13435\",\"13436\",\"13437\",\"13438\",\"13439\",\"13440\",\"13441\",\"13442\",\"13443\",\"13444\",\"13445\",\"13446\",\"13447\",\"13448\",\"13449\",\"13450\",\"13451\",\"13452\",\"13453\",\"13454\",\"13455\",\"13456\",\"13457\",\"13458\",\"13459\",\"13460\",\"13461\",\"13462\",\"13463\",\"13464\",\"13465\",\"13466\",\"13467\",\"13468\",\"13469\",\"13470\",\"13471\",\"13472\",\"13473\",\"13474\",\"13475\",\"13476\",\"13477\",\"13478\",\"13479\",\"13480\",\"13481\",\"13482\",\"13483\",\"13484\",\"13485\",\"13486\",\"13487\",\"13488\",\"13489\",\"13490\",\"13491\",\"13492\",\"13493\",\"13494\",\"13495\",\"13496\",\"13497\",\"13498\",\"13499\",\"13500\",\"13501\",\"13502\",\"13503\",\"13504\",\"13505\",\"13506\",\"13507\",\"13508\",\"13509\",\"13510\",\"13511\",\"13512\",\"13513\",\"13514\",\"13515\",\"13516\",\"13517\",\"13518\",\"13519\",\"13520\",\"13521\",\"13522\",\"13523\",\"13524\",\"13525\",\"13526\",\"13527\",\"13528\",\"13529\",\"13530\",\"13531\",\"13532\",\"13533\",\"13534\",\"13535\",\"13536\",\"13537\",\"13538\",\"13539\",\"13540\",\"13541\",\"13542\",\"13543\",\"13544\",\"13545\",\"13546\",\"13547\",\"13548\",\"13549\",\"13550\",\"13551\",\"13552\",\"13553\",\"13554\",\"13555\",\"13556\",\"13557\",\"13558\",\"13559\",\"13560\",\"13561\",\"13562\",\"13563\",\"13564\",\"13565\",\"13566\",\"13567\",\"13568\",\"13569\",\"13570\",\"13571\",\"13572\",\"13573\",\"13574\",\"13575\",\"13576\",\"13577\",\"13578\",\"13579\",\"13580\",\"13581\",\"13582\",\"13583\",\"13584\",\"13585\",\"13586\",\"13587\",\"13588\",\"13589\",\"13590\",\"13591\",\"13592\",\"13593\",\"13594\",\"13595\",\"13596\",\"13597\",\"13598\",\"13599\",\"13600\",\"13601\",\"13602\",\"13603\",\"13604\",\"13605\",\"13606\",\"13607\",\"13608\",\"13609\",\"13610\",\"13611\",\"13612\",\"13613\",\"13614\",\"13615\",\"13616\",\"13617\",\"13618\",\"13619\",\"13620\",\"13621\",\"13622\",\"13623\",\"13624\",\"13625\",\"13626\",\"13627\",\"13628\",\"13629\",\"13630\",\"13631\",\"13632\",\"13633\",\"13634\",\"13635\",\"13636\",\"13637\",\"13638\",\"13639\",\"13640\",\"13641\",\"13642\",\"13643\",\"13644\",\"13645\",\"13646\",\"13647\",\"13648\",\"13649\",\"13650\",\"13651\",\"13652\",\"13653\",\"13654\",\"13655\",\"13656\",\"13657\",\"13658\",\"13659\",\"13660\",\"13661\",\"13662\",\"13663\",\"13664\",\"13665\",\"13666\",\"13667\",\"13668\",\"13669\",\"13670\",\"13671\",\"13672\",\"13673\",\"13674\",\"13675\",\"13676\",\"13677\",\"13678\",\"13679\",\"13680\",\"13681\",\"13682\",\"13683\",\"13684\",\"13685\",\"13686\",\"13687\",\"13688\",\"13689\",\"13690\",\"13691\",\"13692\",\"13693\",\"13694\",\"13695\",\"13696\",\"13697\",\"13698\",\"13699\",\"13700\",\"13701\",\"13702\",\"13703\",\"13704\",\"13705\",\"13706\",\"13707\",\"13708\",\"13709\",\"13710\",\"13711\",\"13712\",\"13713\",\"13714\",\"13715\",\"13716\",\"13717\",\"13718\",\"13719\",\"13720\",\"13721\",\"13722\",\"13723\",\"13724\",\"13725\",\"13726\",\"13727\",\"13728\",\"13729\",\"13730\",\"13731\",\"13732\",\"13733\",\"13734\",\"13735\",\"13736\",\"13737\",\"13738\",\"13739\",\"13740\",\"13741\",\"13742\",\"13743\",\"13744\",\"13745\",\"13746\",\"13747\",\"13748\",\"13749\",\"13750\",\"13751\",\"13752\",\"13753\",\"13754\",\"13755\",\"13756\",\"13757\",\"13758\",\"13759\",\"13760\",\"13761\",\"13762\",\"13763\",\"13764\",\"13765\",\"13766\",\"13767\",\"13768\",\"13769\",\"13770\",\"13771\",\"13772\",\"13773\",\"13774\",\"13775\",\"13776\",\"13777\",\"13778\",\"13779\",\"13780\",\"13781\",\"13782\",\"13783\",\"13784\",\"13785\",\"13786\",\"13787\",\"13788\",\"13789\",\"13790\",\"13791\",\"13792\",\"13793\",\"13794\",\"13795\",\"13796\",\"13797\",\"13798\",\"13799\",\"13800\",\"13801\",\"13802\",\"13803\",\"13804\",\"13805\",\"13806\",\"13807\",\"13808\",\"13809\",\"13810\",\"13811\",\"13812\",\"13813\",\"13814\",\"13815\",\"13816\",\"13817\",\"13818\",\"13819\",\"13820\",\"13821\",\"13822\",\"13823\",\"13824\",\"13825\",\"13826\",\"13827\",\"13828\",\"13829\",\"13830\",\"13831\",\"13832\",\"13833\",\"13834\",\"13835\",\"13836\",\"13837\",\"13838\",\"13839\",\"13840\",\"13841\",\"13842\",\"13843\",\"13844\",\"13845\",\"13846\",\"13847\",\"13848\",\"13849\",\"13850\",\"13851\",\"13852\",\"13853\",\"13854\",\"13855\",\"13856\",\"13857\",\"13858\",\"13859\",\"13860\",\"13861\",\"13862\",\"13863\",\"13864\",\"13865\",\"13866\",\"13867\",\"13868\",\"13869\",\"13870\",\"13871\",\"13872\",\"13873\",\"13874\",\"13875\",\"13876\",\"13877\",\"13878\",\"13879\",\"13880\",\"13881\",\"13882\",\"13883\",\"13884\",\"13885\",\"13886\",\"13887\",\"13888\",\"13889\",\"13890\",\"13891\",\"13892\",\"13893\",\"13894\",\"13895\",\"13896\",\"13897\",\"13898\",\"13899\",\"13900\",\"13901\",\"13902\",\"13903\",\"13904\",\"13905\",\"13906\",\"13907\",\"13908\",\"13909\",\"13910\",\"13911\",\"13912\",\"13913\",\"13914\",\"13915\",\"13916\",\"13917\",\"13918\",\"13919\",\"13920\",\"13921\",\"13922\",\"13923\",\"13924\",\"13925\",\"13926\",\"13927\",\"13928\",\"13929\",\"13930\",\"13931\",\"13932\",\"13933\",\"13934\",\"13935\",\"13936\",\"13937\",\"13938\",\"13939\",\"13940\",\"13941\",\"13942\",\"13943\",\"13944\",\"13945\",\"13946\",\"13947\",\"13948\",\"13949\",\"13950\",\"13951\",\"13952\",\"13953\",\"13954\",\"13955\",\"13956\",\"13957\",\"13958\",\"13959\",\"13960\",\"13961\",\"13962\",\"13963\",\"13964\",\"13965\",\"13966\",\"13967\",\"13968\",\"13969\",\"13970\",\"13971\",\"13972\",\"13973\",\"13974\",\"13975\",\"13976\",\"13977\",\"13978\",\"13979\",\"13980\",\"13981\",\"13982\",\"13983\",\"13984\",\"13985\",\"13986\",\"13987\",\"13988\",\"13989\",\"13990\",\"13991\",\"13992\",\"13993\",\"13994\",\"13995\",\"13996\",\"13997\",\"13998\",\"13999\",\"14000\",\"14001\",\"14002\",\"14003\",\"14004\",\"14005\",\"14006\",\"14007\",\"14008\",\"14009\",\"14010\",\"14011\",\"14012\",\"14013\",\"14014\",\"14015\",\"14016\",\"14017\",\"14018\",\"14019\",\"14020\",\"14021\",\"14022\",\"14023\",\"14024\",\"14025\",\"14026\",\"14027\",\"14028\",\"14029\",\"14030\",\"14031\",\"14032\",\"14033\",\"14034\",\"14035\",\"14036\",\"14037\",\"14038\",\"14039\",\"14040\",\"14041\",\"14042\",\"14043\",\"14044\",\"14045\",\"14046\",\"14047\",\"14048\",\"14049\",\"14050\",\"14051\",\"14052\",\"14053\",\"14054\",\"14055\",\"14056\",\"14057\",\"14058\",\"14059\",\"14060\",\"14061\",\"14062\",\"14063\",\"14064\",\"14065\",\"14066\",\"14067\",\"14068\",\"14069\",\"14070\",\"14071\",\"14072\",\"14073\",\"14074\",\"14075\",\"14076\",\"14077\",\"14078\",\"14079\",\"14080\",\"14081\",\"14082\",\"14083\",\"14084\",\"14085\",\"14086\",\"14087\",\"14088\",\"14089\",\"14090\",\"14091\",\"14092\",\"14093\",\"14094\",\"14095\",\"14096\",\"14097\",\"14098\",\"14099\",\"14100\",\"14101\",\"14102\",\"14103\",\"14104\",\"14105\",\"14106\",\"14107\",\"14108\",\"14109\",\"14110\",\"14111\",\"14112\",\"14113\",\"14114\",\"14115\",\"14116\",\"14117\",\"14118\",\"14119\",\"14120\",\"14121\",\"14122\",\"14123\",\"14124\",\"14125\",\"14126\",\"14127\",\"14128\",\"14129\",\"14130\",\"14131\",\"14132\",\"14133\",\"14134\",\"14135\",\"14136\",\"14137\",\"14138\",\"14139\",\"14140\",\"14141\",\"14142\",\"14143\",\"14144\",\"14145\",\"14146\",\"14147\",\"14148\",\"14149\",\"14150\",\"14151\",\"14152\",\"14153\",\"14154\",\"14155\",\"14156\",\"14157\",\"14158\",\"14159\",\"14160\",\"14161\",\"14162\",\"14163\",\"14164\",\"14165\",\"14166\",\"14167\",\"14168\",\"14169\",\"14170\",\"14171\",\"14172\",\"14173\",\"14174\",\"14175\",\"14176\",\"14177\",\"14178\",\"14179\",\"14180\",\"14181\",\"14182\",\"14183\",\"14184\",\"14185\",\"14186\",\"14187\",\"14188\",\"14189\",\"14190\",\"14191\",\"14192\",\"14193\",\"14194\",\"14195\",\"14196\",\"14197\",\"14198\",\"14199\",\"14200\",\"14201\",\"14202\",\"14203\",\"14204\",\"14205\",\"14206\",\"14207\",\"14208\",\"14209\",\"14210\",\"14211\",\"14212\",\"14213\",\"14214\",\"14215\",\"14216\",\"14217\",\"14218\",\"14219\",\"14220\",\"14221\",\"14222\",\"14223\",\"14224\",\"14225\",\"14226\",\"14227\",\"14228\",\"14229\",\"14230\",\"14231\",\"14232\",\"14233\",\"14234\",\"14235\",\"14236\",\"14237\",\"14238\",\"14239\",\"14240\",\"14241\",\"14242\",\"14243\",\"14244\",\"14245\",\"14246\",\"14247\",\"14248\",\"14249\",\"14250\",\"14251\",\"14252\",\"14253\",\"14254\",\"14255\",\"14256\",\"14257\",\"14258\",\"14259\",\"14260\",\"14261\",\"14262\",\"14263\",\"14264\",\"14265\",\"14266\",\"14267\",\"14268\",\"14269\",\"14270\",\"14271\",\"14272\",\"14273\",\"14274\",\"14275\",\"14276\",\"14277\",\"14278\",\"14279\",\"14280\",\"14281\",\"14282\",\"14283\",\"14284\",\"14285\",\"14286\",\"14287\",\"14288\",\"14289\",\"14290\",\"14291\",\"14292\",\"14293\",\"14294\",\"14295\",\"14296\",\"14297\",\"14298\",\"14299\",\"14300\",\"14301\",\"14302\",\"14303\",\"14304\",\"14305\",\"14306\",\"14307\",\"14308\",\"14309\",\"14310\",\"14311\",\"14312\",\"14313\",\"14314\",\"14315\",\"14316\",\"14317\",\"14318\",\"14319\",\"14320\",\"14321\",\"14322\",\"14323\",\"14324\",\"14325\",\"14326\",\"14327\",\"14328\",\"14329\",\"14330\",\"14331\",\"14332\",\"14333\",\"14334\",\"14335\",\"14336\",\"14337\",\"14338\",\"14339\",\"14340\",\"14341\",\"14342\",\"14343\",\"14344\",\"14345\",\"14346\",\"14347\",\"14348\",\"14349\",\"14350\",\"14351\",\"14352\",\"14353\",\"14354\",\"14355\",\"14356\",\"14357\",\"14358\",\"14359\",\"14360\",\"14361\",\"14362\",\"14363\",\"14364\",\"14365\",\"14366\",\"14367\",\"14368\",\"14369\",\"14370\",\"14371\",\"14372\",\"14373\",\"14374\",\"14375\",\"14376\",\"14377\",\"14378\",\"14379\",\"14380\",\"14381\",\"14382\",\"14383\",\"14384\",\"14385\",\"14386\",\"14387\",\"14388\",\"14389\",\"14390\",\"14391\",\"14392\",\"14393\",\"14394\",\"14395\",\"14396\",\"14397\",\"14398\",\"14399\",\"14400\",\"14401\",\"14402\",\"14403\",\"14404\",\"14405\",\"14406\",\"14407\",\"14408\",\"14409\",\"14410\",\"14411\",\"14412\",\"14413\",\"14414\",\"14415\",\"14416\",\"14417\",\"14418\",\"14419\",\"14420\",\"14421\",\"14422\",\"14423\",\"14424\",\"14425\",\"14426\",\"14427\",\"14428\",\"14429\",\"14430\",\"14431\",\"14432\",\"14433\",\"14434\",\"14435\",\"14436\",\"14437\",\"14438\",\"14439\",\"14440\",\"14441\",\"14442\",\"14443\",\"14444\",\"14445\",\"14446\",\"14447\",\"14448\",\"14449\",\"14450\",\"14451\",\"14452\",\"14453\",\"14454\",\"14455\",\"14456\",\"14457\",\"14458\",\"14459\",\"14460\",\"14461\",\"14462\",\"14463\",\"14464\",\"14465\",\"14466\",\"14467\",\"14468\",\"14469\",\"14470\",\"14471\",\"14472\",\"14473\",\"14474\",\"14475\",\"14476\",\"14477\",\"14478\",\"14479\",\"14480\",\"14481\",\"14482\",\"14483\",\"14484\",\"14485\",\"14486\",\"14487\",\"14488\",\"14489\",\"14490\",\"14491\",\"14492\",\"14493\",\"14494\",\"14495\",\"14496\",\"14497\",\"14498\",\"14499\",\"14500\",\"14501\",\"14502\",\"14503\",\"14504\",\"14505\",\"14506\",\"14507\",\"14508\",\"14509\",\"14510\",\"14511\",\"14512\",\"14513\",\"14514\",\"14515\",\"14516\",\"14517\",\"14518\",\"14519\",\"14520\",\"14521\",\"14522\",\"14523\",\"14524\",\"14525\",\"14526\",\"14527\",\"14528\",\"14529\",\"14530\",\"14531\",\"14532\",\"14533\",\"14534\",\"14535\",\"14536\",\"14537\",\"14538\",\"14539\",\"14540\",\"14541\",\"14542\",\"14543\",\"14544\",\"14545\",\"14546\",\"14547\",\"14548\",\"14549\",\"14550\",\"14551\",\"14552\",\"14553\",\"14554\",\"14555\",\"14556\",\"14557\",\"14558\",\"14559\",\"14560\",\"14561\",\"14562\",\"14563\",\"14564\",\"14565\",\"14566\",\"14567\",\"14568\",\"14569\",\"14570\",\"14571\",\"14572\",\"14573\",\"14574\",\"14575\",\"14576\",\"14577\",\"14578\",\"14579\",\"14580\",\"14581\",\"14582\",\"14583\",\"14584\",\"14585\",\"14586\",\"14587\",\"14588\",\"14589\",\"14590\",\"14591\",\"14592\",\"14593\",\"14594\",\"14595\",\"14596\",\"14597\",\"14598\",\"14599\",\"14600\",\"14601\",\"14602\",\"14603\",\"14604\",\"14605\",\"14606\",\"14607\",\"14608\",\"14609\",\"14610\",\"14611\",\"14612\",\"14613\",\"14614\",\"14615\",\"14616\",\"14617\",\"14618\",\"14619\",\"14620\",\"14621\",\"14622\",\"14623\",\"14624\",\"14625\",\"14626\",\"14627\",\"14628\",\"14629\",\"14630\",\"14631\",\"14632\",\"14633\",\"14634\",\"14635\",\"14636\",\"14637\",\"14638\",\"14639\",\"14640\",\"14641\",\"14642\",\"14643\",\"14644\",\"14645\",\"14646\",\"14647\",\"14648\",\"14649\",\"14650\",\"14651\",\"14652\",\"14653\",\"14654\",\"14655\",\"14656\",\"14657\",\"14658\",\"14659\",\"14660\",\"14661\",\"14662\",\"14663\",\"14664\",\"14665\",\"14666\",\"14667\",\"14668\",\"14669\",\"14670\",\"14671\",\"14672\",\"14673\",\"14674\",\"14675\",\"14676\",\"14677\",\"14678\",\"14679\",\"14680\",\"14681\",\"14682\",\"14683\",\"14684\",\"14685\",\"14686\",\"14687\",\"14688\",\"14689\",\"14690\",\"14691\",\"14692\",\"14693\",\"14694\",\"14695\",\"14696\",\"14697\",\"14698\",\"14699\",\"14700\",\"14701\",\"14702\",\"14703\",\"14704\",\"14705\",\"14706\",\"14707\",\"14708\",\"14709\",\"14710\",\"14711\",\"14712\",\"14713\",\"14714\",\"14715\",\"14716\",\"14717\",\"14718\",\"14719\",\"14720\",\"14721\",\"14722\",\"14723\",\"14724\",\"14725\",\"14726\",\"14727\",\"14728\",\"14729\",\"14730\",\"14731\",\"14732\",\"14733\",\"14734\",\"14735\",\"14736\",\"14737\",\"14738\",\"14739\",\"14740\",\"14741\",\"14742\",\"14743\",\"14744\",\"14745\",\"14746\",\"14747\",\"14748\",\"14749\",\"14750\",\"14751\",\"14752\",\"14753\",\"14754\",\"14755\",\"14756\",\"14757\",\"14758\",\"14759\",\"14760\",\"14761\",\"14762\",\"14763\",\"14764\",\"14765\",\"14766\",\"14767\",\"14768\",\"14769\",\"14770\",\"14771\",\"14772\",\"14773\",\"14774\",\"14775\",\"14776\",\"14777\",\"14778\",\"14779\",\"14780\",\"14781\",\"14782\",\"14783\",\"14784\",\"14785\",\"14786\",\"14787\",\"14788\",\"14789\",\"14790\",\"14791\",\"14792\",\"14793\",\"14794\",\"14795\",\"14796\",\"14797\",\"14798\",\"14799\",\"14800\",\"14801\",\"14802\",\"14803\",\"14804\",\"14805\",\"14806\",\"14807\",\"14808\",\"14809\",\"14810\",\"14811\",\"14812\",\"14813\",\"14814\",\"14815\",\"14816\",\"14817\",\"14818\",\"14819\",\"14820\",\"14821\",\"14822\",\"14823\",\"14824\",\"14825\",\"14826\",\"14827\",\"14828\",\"14829\",\"14830\",\"14831\",\"14832\",\"14833\",\"14834\",\"14835\",\"14836\",\"14837\",\"14838\",\"14839\",\"14840\",\"14841\",\"14842\",\"14843\",\"14844\",\"14845\",\"14846\",\"14847\",\"14848\",\"14849\",\"14850\",\"14851\",\"14852\",\"14853\",\"14854\",\"14855\",\"14856\",\"14857\",\"14858\",\"14859\",\"14860\",\"14861\",\"14862\",\"14863\",\"14864\",\"14865\",\"14866\",\"14867\",\"14868\",\"14869\",\"14870\",\"14871\",\"14872\",\"14873\",\"14874\",\"14875\",\"14876\",\"14877\",\"14878\",\"14879\",\"14880\",\"14881\",\"14882\",\"14883\",\"14884\",\"14885\",\"14886\",\"14887\",\"14888\",\"14889\",\"14890\",\"14891\",\"14892\",\"14893\",\"14894\",\"14895\",\"14896\",\"14897\",\"14898\",\"14899\",\"14900\",\"14901\",\"14902\",\"14903\",\"14904\",\"14905\",\"14906\",\"14907\",\"14908\",\"14909\",\"14910\",\"14911\",\"14912\",\"14913\",\"14914\",\"14915\",\"14916\",\"14917\",\"14918\",\"14919\",\"14920\",\"14921\",\"14922\",\"14923\",\"14924\",\"14925\",\"14926\",\"14927\",\"14928\",\"14929\",\"14930\",\"14931\",\"14932\",\"14933\",\"14934\",\"14935\",\"14936\",\"14937\",\"14938\",\"14939\",\"14940\",\"14941\",\"14942\",\"14943\",\"14944\",\"14945\",\"14946\",\"14947\",\"14948\",\"14949\",\"14950\",\"14951\",\"14952\",\"14953\",\"14954\",\"14955\",\"14956\",\"14957\",\"14958\",\"14959\",\"14960\",\"14961\",\"14962\",\"14963\",\"14964\",\"14965\",\"14966\",\"14967\",\"14968\",\"14969\",\"14970\",\"14971\",\"14972\",\"14973\",\"14974\",\"14975\",\"14976\",\"14977\",\"14978\",\"14979\",\"14980\",\"14981\",\"14982\",\"14983\",\"14984\",\"14985\",\"14986\",\"14987\",\"14988\",\"14989\",\"14990\",\"14991\",\"14992\",\"14993\",\"14994\",\"14995\",\"14996\",\"14997\",\"14998\",\"14999\",\"15000\",\"15001\",\"15002\",\"15003\",\"15004\",\"15005\",\"15006\",\"15007\",\"15008\",\"15009\",\"15010\",\"15011\",\"15012\",\"15013\",\"15014\",\"15015\",\"15016\",\"15017\",\"15018\",\"15019\",\"15020\",\"15021\",\"15022\",\"15023\",\"15024\",\"15025\",\"15026\",\"15027\",\"15028\",\"15029\",\"15030\",\"15031\",\"15032\",\"15033\",\"15034\",\"15035\",\"15036\",\"15037\",\"15038\",\"15039\",\"15040\",\"15041\",\"15042\",\"15043\",\"15044\",\"15045\",\"15046\",\"15047\",\"15048\",\"15049\",\"15050\",\"15051\",\"15052\",\"15053\",\"15054\",\"15055\",\"15056\",\"15057\",\"15058\",\"15059\",\"15060\",\"15061\",\"15062\",\"15063\",\"15064\",\"15065\",\"15066\",\"15067\",\"15068\",\"15069\",\"15070\",\"15071\",\"15072\",\"15073\",\"15074\",\"15075\",\"15076\",\"15077\",\"15078\",\"15079\",\"15080\",\"15081\",\"15082\",\"15083\",\"15084\",\"15085\",\"15086\",\"15087\",\"15088\",\"15089\",\"15090\",\"15091\",\"15092\",\"15093\",\"15094\",\"15095\",\"15096\",\"15097\",\"15098\",\"15099\",\"15100\",\"15101\",\"15102\",\"15103\",\"15104\",\"15105\",\"15106\",\"15107\",\"15108\",\"15109\",\"15110\",\"15111\",\"15112\",\"15113\",\"15114\",\"15115\",\"15116\",\"15117\",\"15118\",\"15119\",\"15120\",\"15121\",\"15122\",\"15123\",\"15124\",\"15125\",\"15126\",\"15127\",\"15128\",\"15129\",\"15130\",\"15131\",\"15132\",\"15133\",\"15134\",\"15135\",\"15136\",\"15137\",\"15138\",\"15139\",\"15140\",\"15141\",\"15142\",\"15143\",\"15144\",\"15145\",\"15146\",\"15147\",\"15148\",\"15149\",\"15150\",\"15151\",\"15152\",\"15153\",\"15154\",\"15155\",\"15156\",\"15157\",\"15158\",\"15159\",\"15160\",\"15161\",\"15162\",\"15163\",\"15164\",\"15165\",\"15166\",\"15167\",\"15168\",\"15169\",\"15170\",\"15171\",\"15172\",\"15173\",\"15174\",\"15175\",\"15176\",\"15177\",\"15178\",\"15179\",\"15180\",\"15181\",\"15182\",\"15183\",\"15184\",\"15185\",\"15186\",\"15187\",\"15188\",\"15189\",\"15190\",\"15191\",\"15192\",\"15193\",\"15194\",\"15195\",\"15196\",\"15197\",\"15198\",\"15199\",\"15200\",\"15201\",\"15202\",\"15203\",\"15204\",\"15205\",\"15206\",\"15207\",\"15208\",\"15209\",\"15210\",\"15211\",\"15212\",\"15213\",\"15214\",\"15215\",\"15216\",\"15217\",\"15218\",\"15219\",\"15220\",\"15221\",\"15222\",\"15223\",\"15224\",\"15225\",\"15226\",\"15227\",\"15228\",\"15229\",\"15230\",\"15231\",\"15232\",\"15233\",\"15234\",\"15235\",\"15236\",\"15237\",\"15238\",\"15239\",\"15240\",\"15241\",\"15242\",\"15243\",\"15244\",\"15245\",\"15246\",\"15247\",\"15248\",\"15249\",\"15250\",\"15251\",\"15252\",\"15253\",\"15254\",\"15255\",\"15256\",\"15257\",\"15258\",\"15259\",\"15260\",\"15261\",\"15262\",\"15263\",\"15264\",\"15265\",\"15266\",\"15267\",\"15268\",\"15269\",\"15270\",\"15271\",\"15272\",\"15273\",\"15274\",\"15275\",\"15276\",\"15277\",\"15278\",\"15279\",\"15280\",\"15281\",\"15282\",\"15283\",\"15284\",\"15285\",\"15286\",\"15287\",\"15288\",\"15289\",\"15290\",\"15291\",\"15292\",\"15293\",\"15294\",\"15295\",\"15296\",\"15297\",\"15298\",\"15299\",\"15300\",\"15301\",\"15302\",\"15303\",\"15304\",\"15305\",\"15306\",\"15307\",\"15308\",\"15309\",\"15310\",\"15311\",\"15312\",\"15313\",\"15314\",\"15315\",\"15316\",\"15317\",\"15318\",\"15319\",\"15320\",\"15321\",\"15322\",\"15323\",\"15324\",\"15325\",\"15326\",\"15327\",\"15328\",\"15329\",\"15330\",\"15331\",\"15332\",\"15333\",\"15334\",\"15335\",\"15336\",\"15337\",\"15338\",\"15339\",\"15340\",\"15341\",\"15342\",\"15343\",\"15344\",\"15345\",\"15346\",\"15347\",\"15348\",\"15349\",\"15350\",\"15351\",\"15352\",\"15353\",\"15354\",\"15355\",\"15356\",\"15357\",\"15358\",\"15359\",\"15360\",\"15361\",\"15362\",\"15363\",\"15364\",\"15365\",\"15366\",\"15367\",\"15368\",\"15369\",\"15370\",\"15371\",\"15372\",\"15373\",\"15374\",\"15375\",\"15376\",\"15377\",\"15378\",\"15379\",\"15380\",\"15381\",\"15382\",\"15383\",\"15384\",\"15385\",\"15386\",\"15387\",\"15388\",\"15389\",\"15390\",\"15391\",\"15392\",\"15393\",\"15394\",\"15395\",\"15396\",\"15397\",\"15398\",\"15399\",\"15400\",\"15401\",\"15402\",\"15403\",\"15404\",\"15405\",\"15406\",\"15407\",\"15408\",\"15409\",\"15410\",\"15411\",\"15412\",\"15413\",\"15414\",\"15415\",\"15416\",\"15417\",\"15418\",\"15419\",\"15420\",\"15421\",\"15422\",\"15423\",\"15424\",\"15425\",\"15426\",\"15427\",\"15428\",\"15429\",\"15430\",\"15431\",\"15432\",\"15433\",\"15434\",\"15435\",\"15436\",\"15437\",\"15438\",\"15439\",\"15440\",\"15441\",\"15442\",\"15443\",\"15444\",\"15445\",\"15446\",\"15447\",\"15448\",\"15449\",\"15450\",\"15451\",\"15452\",\"15453\",\"15454\",\"15455\",\"15456\",\"15457\",\"15458\",\"15459\",\"15460\",\"15461\",\"15462\",\"15463\",\"15464\",\"15465\",\"15466\",\"15467\",\"15468\",\"15469\",\"15470\",\"15471\",\"15472\",\"15473\",\"15474\",\"15475\",\"15476\",\"15477\",\"15478\",\"15479\",\"15480\",\"15481\",\"15482\",\"15483\",\"15484\",\"15485\",\"15486\",\"15487\",\"15488\",\"15489\",\"15490\",\"15491\",\"15492\",\"15493\",\"15494\",\"15495\",\"15496\",\"15497\",\"15498\",\"15499\",\"15500\",\"15501\",\"15502\",\"15503\",\"15504\",\"15505\",\"15506\",\"15507\",\"15508\",\"15509\",\"15510\",\"15511\",\"15512\",\"15513\",\"15514\",\"15515\",\"15516\",\"15517\",\"15518\",\"15519\",\"15520\",\"15521\",\"15522\",\"15523\",\"15524\",\"15525\",\"15526\",\"15527\",\"15528\",\"15529\",\"15530\",\"15531\",\"15532\",\"15533\",\"15534\",\"15535\",\"15536\",\"15537\",\"15538\",\"15539\",\"15540\",\"15541\",\"15542\",\"15543\",\"15544\",\"15545\",\"15546\",\"15547\",\"15548\",\"15549\",\"15550\",\"15551\",\"15552\",\"15553\",\"15554\",\"15555\",\"15556\",\"15557\",\"15558\",\"15559\",\"15560\",\"15561\",\"15562\",\"15563\",\"15564\",\"15565\",\"15566\",\"15567\",\"15568\",\"15569\",\"15570\",\"15571\",\"15572\",\"15573\",\"15574\",\"15575\",\"15576\",\"15577\",\"15578\",\"15579\",\"15580\",\"15581\",\"15582\",\"15583\",\"15584\",\"15585\",\"15586\",\"15587\",\"15588\",\"15589\",\"15590\",\"15591\",\"15592\",\"15593\",\"15594\",\"15595\",\"15596\",\"15597\",\"15598\",\"15599\",\"15600\",\"15601\",\"15602\",\"15603\",\"15604\",\"15605\",\"15606\",\"15607\",\"15608\",\"15609\",\"15610\",\"15611\",\"15612\",\"15613\",\"15614\",\"15615\",\"15616\",\"15617\",\"15618\",\"15619\",\"15620\",\"15621\",\"15622\",\"15623\",\"15624\",\"15625\",\"15626\",\"15627\",\"15628\",\"15629\",\"15630\",\"15631\",\"15632\",\"15633\",\"15634\",\"15635\",\"15636\",\"15637\",\"15638\",\"15639\",\"15640\",\"15641\",\"15642\",\"15643\",\"15644\",\"15645\",\"15646\",\"15647\",\"15648\",\"15649\",\"15650\",\"15651\",\"15652\",\"15653\",\"15654\",\"15655\",\"15656\",\"15657\",\"15658\",\"15659\",\"15660\",\"15661\",\"15662\",\"15663\",\"15664\",\"15665\",\"15666\",\"15667\",\"15668\",\"15669\",\"15670\",\"15671\",\"15672\",\"15673\",\"15674\",\"15675\",\"15676\",\"15677\",\"15678\",\"15679\",\"15680\",\"15681\",\"15682\",\"15683\",\"15684\",\"15685\",\"15686\",\"15687\",\"15688\",\"15689\",\"15690\",\"15691\",\"15692\",\"15693\",\"15694\",\"15695\",\"15696\",\"15697\",\"15698\",\"15699\",\"15700\",\"15701\",\"15702\",\"15703\",\"15704\",\"15705\",\"15706\",\"15707\",\"15708\",\"15709\",\"15710\",\"15711\",\"15712\",\"15713\",\"15714\",\"15715\",\"15716\",\"15717\",\"15718\",\"15719\",\"15720\",\"15721\",\"15722\",\"15723\",\"15724\",\"15725\",\"15726\",\"15727\",\"15728\",\"15729\",\"15730\",\"15731\",\"15732\",\"15733\",\"15734\",\"15735\",\"15736\",\"15737\",\"15738\",\"15739\",\"15740\",\"15741\",\"15742\",\"15743\",\"15744\",\"15745\",\"15746\",\"15747\",\"15748\",\"15749\",\"15750\",\"15751\",\"15752\",\"15753\",\"15754\",\"15755\",\"15756\",\"15757\",\"15758\",\"15759\",\"15760\",\"15761\",\"15762\",\"15763\",\"15764\",\"15765\",\"15766\",\"15767\",\"15768\",\"15769\",\"15770\",\"15771\",\"15772\",\"15773\",\"15774\",\"15775\",\"15776\",\"15777\",\"15778\",\"15779\",\"15780\",\"15781\",\"15782\",\"15783\",\"15784\",\"15785\",\"15786\",\"15787\",\"15788\",\"15789\",\"15790\",\"15791\",\"15792\",\"15793\",\"15794\",\"15795\",\"15796\",\"15797\",\"15798\",\"15799\",\"15800\",\"15801\",\"15802\",\"15803\",\"15804\",\"15805\",\"15806\",\"15807\",\"15808\",\"15809\",\"15810\",\"15811\",\"15812\",\"15813\",\"15814\",\"15815\",\"15816\",\"15817\",\"15818\",\"15819\",\"15820\",\"15821\",\"15822\",\"15823\",\"15824\",\"15825\",\"15826\",\"15827\",\"15828\",\"15829\",\"15830\",\"15831\",\"15832\",\"15833\",\"15834\",\"15835\",\"15836\",\"15837\",\"15838\",\"15839\",\"15840\",\"15841\",\"15842\",\"15843\",\"15844\",\"15845\",\"15846\",\"15847\",\"15848\",\"15849\",\"15850\",\"15851\",\"15852\",\"15853\",\"15854\",\"15855\",\"15856\",\"15857\",\"15858\",\"15859\",\"15860\",\"15861\",\"15862\",\"15863\",\"15864\",\"15865\",\"15866\",\"15867\",\"15868\",\"15869\",\"15870\",\"15871\",\"15872\",\"15873\",\"15874\",\"15875\",\"15876\",\"15877\",\"15878\",\"15879\",\"15880\",\"15881\",\"15882\",\"15883\",\"15884\",\"15885\",\"15886\",\"15887\",\"15888\",\"15889\",\"15890\",\"15891\",\"15892\",\"15893\",\"15894\",\"15895\",\"15896\",\"15897\",\"15898\",\"15899\",\"15900\",\"15901\",\"15902\",\"15903\",\"15904\",\"15905\",\"15906\",\"15907\",\"15908\",\"15909\",\"15910\",\"15911\",\"15912\",\"15913\",\"15914\",\"15915\",\"15916\",\"15917\",\"15918\",\"15919\",\"15920\",\"15921\",\"15922\",\"15923\",\"15924\",\"15925\",\"15926\",\"15927\",\"15928\",\"15929\",\"15930\",\"15931\",\"15932\",\"15933\",\"15934\",\"15935\",\"15936\",\"15937\",\"15938\",\"15939\",\"15940\",\"15941\",\"15942\",\"15943\",\"15944\",\"15945\",\"15946\",\"15947\",\"15948\",\"15949\",\"15950\",\"15951\",\"15952\",\"15953\",\"15954\",\"15955\",\"15956\",\"15957\",\"15958\",\"15959\",\"15960\",\"15961\",\"15962\",\"15963\",\"15964\",\"15965\",\"15966\",\"15967\",\"15968\",\"15969\",\"15970\",\"15971\",\"15972\",\"15973\",\"15974\",\"15975\",\"15976\",\"15977\",\"15978\",\"15979\",\"15980\",\"15981\",\"15982\",\"15983\",\"15984\",\"15985\",\"15986\",\"15987\",\"15988\",\"15989\",\"15990\",\"15991\",\"15992\",\"15993\",\"15994\",\"15995\",\"15996\",\"15997\",\"15998\",\"15999\",\"16000\",\"16001\",\"16002\",\"16003\",\"16004\",\"16005\",\"16006\",\"16007\",\"16008\",\"16009\",\"16010\",\"16011\",\"16012\",\"16013\",\"16014\",\"16015\",\"16016\",\"16017\",\"16018\",\"16019\",\"16020\",\"16021\",\"16022\",\"16023\",\"16024\",\"16025\",\"16026\",\"16027\",\"16028\",\"16029\",\"16030\",\"16031\",\"16032\",\"16033\",\"16034\",\"16035\",\"16036\",\"16037\",\"16038\",\"16039\",\"16040\",\"16041\",\"16042\",\"16043\",\"16044\",\"16045\",\"16046\",\"16047\",\"16048\",\"16049\",\"16050\",\"16051\",\"16052\",\"16053\",\"16054\",\"16055\",\"16056\",\"16057\",\"16058\",\"16059\",\"16060\",\"16061\",\"16062\",\"16063\",\"16064\",\"16065\",\"16066\",\"16067\",\"16068\",\"16069\",\"16070\",\"16071\",\"16072\",\"16073\",\"16074\",\"16075\",\"16076\",\"16077\",\"16078\",\"16079\",\"16080\",\"16081\",\"16082\",\"16083\",\"16084\",\"16085\",\"16086\",\"16087\",\"16088\",\"16089\",\"16090\",\"16091\",\"16092\",\"16093\",\"16094\",\"16095\",\"16096\",\"16097\",\"16098\",\"16099\",\"16100\",\"16101\",\"16102\",\"16103\",\"16104\",\"16105\",\"16106\",\"16107\",\"16108\",\"16109\",\"16110\",\"16111\",\"16112\",\"16113\",\"16114\",\"16115\",\"16116\",\"16117\",\"16118\",\"16119\",\"16120\",\"16121\",\"16122\",\"16123\",\"16124\",\"16125\",\"16126\",\"16127\",\"16128\",\"16129\",\"16130\",\"16131\",\"16132\",\"16133\",\"16134\",\"16135\",\"16136\",\"16137\",\"16138\",\"16139\",\"16140\",\"16141\",\"16142\",\"16143\",\"16144\",\"16145\",\"16146\",\"16147\",\"16148\",\"16149\",\"16150\",\"16151\",\"16152\",\"16153\",\"16154\",\"16155\",\"16156\",\"16157\",\"16158\",\"16159\",\"16160\",\"16161\",\"16162\",\"16163\",\"16164\",\"16165\",\"16166\",\"16167\",\"16168\",\"16169\",\"16170\",\"16171\",\"16172\",\"16173\",\"16174\",\"16175\",\"16176\",\"16177\",\"16178\",\"16179\",\"16180\",\"16181\",\"16182\",\"16183\",\"16184\",\"16185\",\"16186\",\"16187\",\"16188\",\"16189\",\"16190\",\"16191\",\"16192\",\"16193\",\"16194\",\"16195\",\"16196\",\"16197\",\"16198\",\"16199\",\"16200\",\"16201\",\"16202\",\"16203\",\"16204\",\"16205\",\"16206\",\"16207\",\"16208\",\"16209\",\"16210\",\"16211\",\"16212\",\"16213\",\"16214\",\"16215\",\"16216\",\"16217\",\"16218\",\"16219\",\"16220\",\"16221\",\"16222\",\"16223\",\"16224\",\"16225\",\"16226\",\"16227\",\"16228\",\"16229\",\"16230\",\"16231\",\"16232\",\"16233\",\"16234\",\"16235\",\"16236\",\"16237\",\"16238\",\"16239\",\"16240\",\"16241\",\"16242\",\"16243\",\"16244\",\"16245\",\"16246\",\"16247\",\"16248\",\"16249\",\"16250\",\"16251\",\"16252\",\"16253\",\"16254\",\"16255\",\"16256\",\"16257\",\"16258\",\"16259\",\"16260\",\"16261\",\"16262\",\"16263\",\"16264\",\"16265\",\"16266\",\"16267\",\"16268\",\"16269\",\"16270\",\"16271\",\"16272\",\"16273\",\"16274\",\"16275\",\"16276\",\"16277\",\"16278\",\"16279\",\"16280\",\"16281\",\"16282\",\"16283\",\"16284\",\"16285\",\"16286\",\"16287\",\"16288\",\"16289\",\"16290\",\"16291\",\"16292\",\"16293\",\"16294\",\"16295\",\"16296\",\"16297\",\"16298\",\"16299\",\"16300\",\"16301\",\"16302\",\"16303\",\"16304\",\"16305\",\"16306\",\"16307\",\"16308\",\"16309\",\"16310\",\"16311\",\"16312\",\"16313\",\"16314\",\"16315\",\"16316\",\"16317\",\"16318\",\"16319\",\"16320\",\"16321\",\"16322\",\"16323\",\"16324\",\"16325\",\"16326\",\"16327\",\"16328\",\"16329\",\"16330\",\"16331\",\"16332\",\"16333\",\"16334\",\"16335\",\"16336\",\"16337\",\"16338\",\"16339\",\"16340\",\"16341\",\"16342\",\"16343\",\"16344\",\"16345\",\"16346\",\"16347\",\"16348\",\"16349\",\"16350\",\"16351\",\"16352\",\"16353\",\"16354\",\"16355\",\"16356\",\"16357\",\"16358\",\"16359\",\"16360\",\"16361\",\"16362\",\"16363\",\"16364\",\"16365\",\"16366\",\"16367\",\"16368\",\"16369\",\"16370\",\"16371\",\"16372\",\"16373\",\"16374\",\"16375\",\"16376\",\"16377\",\"16378\",\"16379\",\"16380\",\"16381\",\"16382\",\"16383\",\"16384\",\"16385\",\"16386\",\"16387\",\"16388\",\"16389\",\"16390\",\"16391\",\"16392\",\"16393\",\"16394\",\"16395\",\"16396\",\"16397\",\"16398\",\"16399\",\"16400\",\"16401\",\"16402\",\"16403\",\"16404\",\"16405\",\"16406\",\"16407\",\"16408\",\"16409\",\"16410\",\"16411\",\"16412\",\"16413\",\"16414\",\"16415\",\"16416\",\"16417\",\"16418\",\"16419\",\"16420\",\"16421\",\"16422\",\"16423\",\"16424\",\"16425\",\"16426\",\"16427\",\"16428\",\"16429\",\"16430\",\"16431\",\"16432\",\"16433\",\"16434\",\"16435\",\"16436\",\"16437\",\"16438\",\"16439\",\"16440\",\"16441\",\"16442\",\"16443\",\"16444\",\"16445\",\"16446\",\"16447\",\"16448\",\"16449\",\"16450\",\"16451\",\"16452\",\"16453\",\"16454\",\"16455\",\"16456\",\"16457\",\"16458\",\"16459\",\"16460\",\"16461\",\"16462\",\"16463\",\"16464\",\"16465\",\"16466\",\"16467\",\"16468\",\"16469\",\"16470\",\"16471\",\"16472\",\"16473\",\"16474\",\"16475\",\"16476\",\"16477\",\"16478\",\"16479\",\"16480\",\"16481\",\"16482\",\"16483\",\"16484\",\"16485\",\"16486\",\"16487\",\"16488\",\"16489\",\"16490\",\"16491\",\"16492\",\"16493\",\"16494\",\"16495\",\"16496\",\"16497\",\"16498\",\"16499\",\"16500\",\"16501\",\"16502\",\"16503\",\"16504\",\"16505\",\"16506\",\"16507\",\"16508\",\"16509\",\"16510\",\"16511\",\"16512\",\"16513\",\"16514\",\"16515\",\"16516\",\"16517\",\"16518\",\"16519\",\"16520\",\"16521\",\"16522\",\"16523\",\"16524\",\"16525\",\"16526\",\"16527\",\"16528\",\"16529\",\"16530\",\"16531\",\"16532\",\"16533\",\"16534\",\"16535\",\"16536\",\"16537\",\"16538\",\"16539\",\"16540\",\"16541\",\"16542\",\"16543\",\"16544\",\"16545\",\"16546\",\"16547\",\"16548\",\"16549\",\"16550\",\"16551\",\"16552\",\"16553\",\"16554\",\"16555\",\"16556\",\"16557\",\"16558\",\"16559\",\"16560\",\"16561\",\"16562\",\"16563\",\"16564\",\"16565\",\"16566\",\"16567\",\"16568\",\"16569\",\"16570\",\"16571\",\"16572\",\"16573\",\"16574\",\"16575\",\"16576\",\"16577\",\"16578\",\"16579\",\"16580\",\"16581\",\"16582\",\"16583\",\"16584\",\"16585\",\"16586\",\"16587\",\"16588\",\"16589\",\"16590\",\"16591\",\"16592\",\"16593\",\"16594\",\"16595\",\"16596\",\"16597\",\"16598\",\"16599\",\"16600\",\"16601\",\"16602\",\"16603\",\"16604\",\"16605\",\"16606\",\"16607\",\"16608\",\"16609\",\"16610\",\"16611\",\"16612\",\"16613\",\"16614\",\"16615\",\"16616\",\"16617\",\"16618\",\"16619\",\"16620\",\"16621\",\"16622\",\"16623\",\"16624\",\"16625\",\"16626\",\"16627\",\"16628\",\"16629\",\"16630\",\"16631\",\"16632\",\"16633\",\"16634\",\"16635\",\"16636\",\"16637\",\"16638\",\"16639\",\"16640\",\"16641\",\"16642\",\"16643\",\"16644\",\"16645\",\"16646\",\"16647\",\"16648\",\"16649\",\"16650\",\"16651\",\"16652\",\"16653\",\"16654\",\"16655\",\"16656\",\"16657\",\"16658\",\"16659\",\"16660\",\"16661\",\"16662\",\"16663\",\"16664\",\"16665\",\"16666\",\"16667\",\"16668\",\"16669\",\"16670\",\"16671\",\"16672\",\"16673\",\"16674\",\"16675\",\"16676\",\"16677\",\"16678\",\"16679\",\"16680\",\"16681\",\"16682\",\"16683\",\"16684\",\"16685\",\"16686\",\"16687\",\"16688\",\"16689\",\"16690\",\"16691\",\"16692\",\"16693\",\"16694\",\"16695\",\"16696\",\"16697\",\"16698\",\"16699\",\"16700\",\"16701\",\"16702\",\"16703\",\"16704\",\"16705\",\"16706\",\"16707\",\"16708\",\"16709\",\"16710\",\"16711\",\"16712\",\"16713\",\"16714\",\"16715\",\"16716\",\"16717\",\"16718\",\"16719\",\"16720\",\"16721\",\"16722\",\"16723\",\"16724\",\"16725\",\"16726\",\"16727\",\"16728\",\"16729\",\"16730\",\"16731\",\"16732\",\"16733\",\"16734\",\"16735\",\"16736\",\"16737\",\"16738\",\"16739\",\"16740\",\"16741\",\"16742\",\"16743\",\"16744\",\"16745\",\"16746\",\"16747\",\"16748\",\"16749\",\"16750\",\"16751\",\"16752\",\"16753\",\"16754\",\"16755\",\"16756\",\"16757\",\"16758\",\"16759\",\"16760\",\"16761\",\"16762\",\"16763\",\"16764\",\"16765\",\"16766\",\"16767\",\"16768\",\"16769\",\"16770\",\"16771\",\"16772\",\"16773\",\"16774\",\"16775\",\"16776\",\"16777\",\"16778\",\"16779\",\"16780\",\"16781\",\"16782\",\"16783\",\"16784\",\"16785\",\"16786\",\"16787\",\"16788\",\"16789\",\"16790\",\"16791\",\"16792\",\"16793\",\"16794\",\"16795\",\"16796\",\"16797\",\"16798\",\"16799\",\"16800\",\"16801\",\"16802\",\"16803\",\"16804\",\"16805\",\"16806\",\"16807\",\"16808\",\"16809\",\"16810\",\"16811\",\"16812\",\"16813\",\"16814\",\"16815\",\"16816\",\"16817\",\"16818\",\"16819\",\"16820\",\"16821\",\"16822\",\"16823\",\"16824\",\"16825\",\"16826\",\"16827\",\"16828\",\"16829\",\"16830\",\"16831\",\"16832\",\"16833\",\"16834\",\"16835\",\"16836\",\"16837\",\"16838\",\"16839\",\"16840\",\"16841\",\"16842\",\"16843\",\"16844\",\"16845\",\"16846\",\"16847\",\"16848\",\"16849\",\"16850\",\"16851\",\"16852\",\"16853\",\"16854\",\"16855\",\"16856\",\"16857\",\"16858\",\"16859\",\"16860\",\"16861\",\"16862\",\"16863\",\"16864\",\"16865\",\"16866\",\"16867\",\"16868\",\"16869\",\"16870\",\"16871\",\"16872\",\"16873\",\"16874\",\"16875\",\"16876\",\"16877\",\"16878\",\"16879\",\"16880\",\"16881\",\"16882\",\"16883\",\"16884\",\"16885\",\"16886\",\"16887\",\"16888\",\"16889\",\"16890\",\"16891\",\"16892\",\"16893\",\"16894\",\"16895\",\"16896\",\"16897\",\"16898\",\"16899\",\"16900\",\"16901\",\"16902\",\"16903\",\"16904\",\"16905\",\"16906\",\"16907\",\"16908\",\"16909\",\"16910\",\"16911\",\"16912\",\"16913\",\"16914\",\"16915\",\"16916\",\"16917\",\"16918\",\"16919\",\"16920\",\"16921\",\"16922\",\"16923\",\"16924\",\"16925\",\"16926\",\"16927\",\"16928\",\"16929\",\"16930\",\"16931\",\"16932\",\"16933\",\"16934\",\"16935\",\"16936\",\"16937\",\"16938\",\"16939\",\"16940\",\"16941\",\"16942\",\"16943\",\"16944\",\"16945\",\"16946\",\"16947\",\"16948\",\"16949\",\"16950\",\"16951\",\"16952\",\"16953\",\"16954\",\"16955\",\"16956\",\"16957\",\"16958\",\"16959\",\"16960\",\"16961\",\"16962\",\"16963\",\"16964\",\"16965\",\"16966\",\"16967\",\"16968\",\"16969\",\"16970\",\"16971\",\"16972\",\"16973\",\"16974\",\"16975\",\"16976\",\"16977\",\"16978\",\"16979\",\"16980\",\"16981\",\"16982\",\"16983\",\"16984\",\"16985\",\"16986\",\"16987\",\"16988\",\"16989\",\"16990\",\"16991\",\"16992\",\"16993\",\"16994\",\"16995\",\"16996\",\"16997\",\"16998\",\"16999\",\"17000\",\"17001\",\"17002\",\"17003\",\"17004\",\"17005\",\"17006\",\"17007\",\"17008\",\"17009\",\"17010\",\"17011\",\"17012\",\"17013\",\"17014\",\"17015\",\"17016\",\"17017\",\"17018\",\"17019\",\"17020\",\"17021\",\"17022\",\"17023\",\"17024\",\"17025\",\"17026\",\"17027\",\"17028\",\"17029\",\"17030\",\"17031\",\"17032\",\"17033\",\"17034\",\"17035\",\"17036\",\"17037\",\"17038\",\"17039\",\"17040\",\"17041\",\"17042\",\"17043\",\"17044\",\"17045\",\"17046\",\"17047\",\"17048\",\"17049\",\"17050\",\"17051\",\"17052\",\"17053\",\"17054\",\"17055\",\"17056\",\"17057\",\"17058\",\"17059\",\"17060\",\"17061\",\"17062\",\"17063\",\"17064\",\"17065\",\"17066\",\"17067\",\"17068\",\"17069\",\"17070\",\"17071\",\"17072\",\"17073\",\"17074\",\"17075\",\"17076\",\"17077\",\"17078\",\"17079\",\"17080\",\"17081\",\"17082\",\"17083\",\"17084\",\"17085\",\"17086\",\"17087\",\"17088\",\"17089\",\"17090\",\"17091\",\"17092\",\"17093\",\"17094\",\"17095\",\"17096\",\"17097\",\"17098\",\"17099\",\"17100\",\"17101\",\"17102\",\"17103\",\"17104\",\"17105\",\"17106\",\"17107\",\"17108\",\"17109\",\"17110\",\"17111\",\"17112\",\"17113\",\"17114\",\"17115\",\"17116\",\"17117\",\"17118\",\"17119\",\"17120\",\"17121\",\"17122\",\"17123\",\"17124\",\"17125\",\"17126\",\"17127\",\"17128\",\"17129\",\"17130\",\"17131\",\"17132\",\"17133\",\"17134\",\"17135\",\"17136\",\"17137\",\"17138\",\"17139\",\"17140\",\"17141\",\"17142\",\"17143\",\"17144\",\"17145\",\"17146\",\"17147\",\"17148\",\"17149\",\"17150\",\"17151\",\"17152\",\"17153\",\"17154\",\"17155\",\"17156\",\"17157\",\"17158\",\"17159\",\"17160\",\"17161\",\"17162\",\"17163\",\"17164\",\"17165\",\"17166\",\"17167\",\"17168\",\"17169\",\"17170\",\"17171\",\"17172\",\"17173\",\"17174\",\"17175\",\"17176\",\"17177\",\"17178\",\"17179\",\"17180\",\"17181\",\"17182\",\"17183\",\"17184\",\"17185\",\"17186\",\"17187\",\"17188\",\"17189\",\"17190\",\"17191\",\"17192\",\"17193\",\"17194\",\"17195\",\"17196\",\"17197\",\"17198\",\"17199\",\"17200\",\"17201\",\"17202\",\"17203\",\"17204\",\"17205\",\"17206\",\"17207\",\"17208\",\"17209\",\"17210\",\"17211\",\"17212\",\"17213\",\"17214\",\"17215\",\"17216\",\"17217\",\"17218\",\"17219\",\"17220\",\"17221\",\"17222\",\"17223\",\"17224\",\"17225\",\"17226\",\"17227\",\"17228\",\"17229\",\"17230\",\"17231\",\"17232\",\"17233\",\"17234\",\"17235\",\"17236\",\"17237\",\"17238\",\"17239\",\"17240\",\"17241\",\"17242\",\"17243\",\"17244\",\"17245\",\"17246\",\"17247\",\"17248\",\"17249\",\"17250\",\"17251\",\"17252\",\"17253\",\"17254\",\"17255\",\"17256\",\"17257\",\"17258\",\"17259\",\"17260\",\"17261\",\"17262\",\"17263\",\"17264\",\"17265\",\"17266\",\"17267\",\"17268\",\"17269\",\"17270\",\"17271\",\"17272\",\"17273\",\"17274\",\"17275\",\"17276\",\"17277\",\"17278\",\"17279\",\"17280\",\"17281\",\"17282\",\"17283\",\"17284\",\"17285\",\"17286\",\"17287\",\"17288\",\"17289\",\"17290\",\"17291\",\"17292\",\"17293\",\"17294\",\"17295\",\"17296\",\"17297\",\"17298\",\"17299\",\"17300\",\"17301\",\"17302\",\"17303\",\"17304\",\"17305\",\"17306\",\"17307\",\"17308\",\"17309\",\"17310\",\"17311\",\"17312\",\"17313\",\"17314\",\"17315\",\"17316\",\"17317\",\"17318\",\"17319\",\"17320\",\"17321\",\"17322\",\"17323\",\"17324\",\"17325\",\"17326\",\"17327\",\"17328\",\"17329\",\"17330\",\"17331\",\"17332\",\"17333\",\"17334\",\"17335\",\"17336\",\"17337\",\"17338\",\"17339\",\"17340\",\"17341\",\"17342\",\"17343\",\"17344\",\"17345\",\"17346\",\"17347\",\"17348\",\"17349\",\"17350\",\"17351\",\"17352\",\"17353\",\"17354\",\"17355\",\"17356\",\"17357\",\"17358\",\"17359\",\"17360\",\"17361\",\"17362\",\"17363\",\"17364\",\"17365\",\"17366\",\"17367\",\"17368\",\"17369\",\"17370\",\"17371\",\"17372\",\"17373\",\"17374\",\"17375\",\"17376\",\"17377\",\"17378\",\"17379\",\"17380\",\"17381\",\"17382\",\"17383\",\"17384\",\"17385\",\"17386\",\"17387\",\"17388\",\"17389\",\"17390\",\"17391\",\"17392\",\"17393\",\"17394\",\"17395\",\"17396\",\"17397\",\"17398\",\"17399\",\"17400\",\"17401\",\"17402\",\"17403\",\"17404\",\"17405\",\"17406\",\"17407\",\"17408\",\"17409\",\"17410\",\"17411\",\"17412\",\"17413\",\"17414\",\"17415\",\"17416\",\"17417\",\"17418\",\"17419\",\"17420\",\"17421\",\"17422\",\"17423\",\"17424\",\"17425\",\"17426\",\"17427\",\"17428\",\"17429\",\"17430\",\"17431\",\"17432\",\"17433\",\"17434\",\"17435\",\"17436\",\"17437\",\"17438\",\"17439\",\"17440\",\"17441\",\"17442\",\"17443\",\"17444\",\"17445\",\"17446\",\"17447\",\"17448\",\"17449\",\"17450\",\"17451\",\"17452\",\"17453\",\"17454\",\"17455\",\"17456\",\"17457\",\"17458\",\"17459\",\"17460\",\"17461\",\"17462\",\"17463\",\"17464\",\"17465\",\"17466\",\"17467\",\"17468\",\"17469\",\"17470\",\"17471\",\"17472\",\"17473\",\"17474\",\"17475\",\"17476\",\"17477\",\"17478\",\"17479\",\"17480\",\"17481\",\"17482\",\"17483\",\"17484\",\"17485\",\"17486\",\"17487\",\"17488\",\"17489\",\"17490\",\"17491\",\"17492\",\"17493\",\"17494\",\"17495\",\"17496\",\"17497\",\"17498\",\"17499\",\"17500\",\"17501\",\"17502\",\"17503\",\"17504\",\"17505\",\"17506\",\"17507\",\"17508\",\"17509\",\"17510\",\"17511\",\"17512\",\"17513\",\"17514\",\"17515\",\"17516\",\"17517\",\"17518\",\"17519\",\"17520\",\"17521\",\"17522\",\"17523\",\"17524\",\"17525\",\"17526\",\"17527\",\"17528\",\"17529\",\"17530\",\"17531\",\"17532\",\"17533\",\"17534\",\"17535\",\"17536\",\"17537\",\"17538\",\"17539\",\"17540\",\"17541\",\"17542\",\"17543\",\"17544\",\"17545\",\"17546\",\"17547\",\"17548\",\"17549\",\"17550\",\"17551\",\"17552\",\"17553\",\"17554\",\"17555\",\"17556\",\"17557\",\"17558\",\"17559\",\"17560\",\"17561\",\"17562\",\"17563\",\"17564\",\"17565\",\"17566\",\"17567\",\"17568\",\"17569\",\"17570\",\"17571\",\"17572\",\"17573\",\"17574\",\"17575\",\"17576\",\"17577\",\"17578\",\"17579\",\"17580\",\"17581\",\"17582\",\"17583\",\"17584\",\"17585\",\"17586\",\"17587\",\"17588\",\"17589\",\"17590\",\"17591\",\"17592\",\"17593\",\"17594\",\"17595\",\"17596\",\"17597\",\"17598\",\"17599\",\"17600\",\"17601\",\"17602\",\"17603\",\"17604\",\"17605\",\"17606\",\"17607\",\"17608\",\"17609\",\"17610\",\"17611\",\"17612\",\"17613\",\"17614\",\"17615\",\"17616\",\"17617\",\"17618\",\"17619\",\"17620\",\"17621\",\"17622\",\"17623\",\"17624\",\"17625\",\"17626\",\"17627\",\"17628\",\"17629\",\"17630\",\"17631\",\"17632\",\"17633\",\"17634\",\"17635\",\"17636\",\"17637\",\"17638\",\"17639\",\"17640\",\"17641\",\"17642\",\"17643\",\"17644\",\"17645\",\"17646\",\"17647\",\"17648\",\"17649\",\"17650\",\"17651\",\"17652\",\"17653\",\"17654\",\"17655\",\"17656\",\"17657\",\"17658\",\"17659\",\"17660\",\"17661\",\"17662\",\"17663\",\"17664\",\"17665\",\"17666\",\"17667\",\"17668\",\"17669\",\"17670\",\"17671\",\"17672\",\"17673\",\"17674\",\"17675\",\"17676\",\"17677\",\"17678\",\"17679\",\"17680\",\"17681\",\"17682\",\"17683\",\"17684\",\"17685\",\"17686\",\"17687\",\"17688\",\"17689\",\"17690\",\"17691\",\"17692\",\"17693\",\"17694\",\"17695\",\"17696\",\"17697\",\"17698\",\"17699\",\"17700\",\"17701\",\"17702\",\"17703\",\"17704\",\"17705\",\"17706\",\"17707\",\"17708\",\"17709\",\"17710\",\"17711\",\"17712\",\"17713\",\"17714\",\"17715\",\"17716\",\"17717\",\"17718\",\"17719\",\"17720\",\"17721\",\"17722\",\"17723\",\"17724\",\"17725\",\"17726\",\"17727\",\"17728\",\"17729\",\"17730\",\"17731\",\"17732\",\"17733\",\"17734\",\"17735\",\"17736\",\"17737\",\"17738\",\"17739\",\"17740\",\"17741\",\"17742\",\"17743\",\"17744\",\"17745\",\"17746\",\"17747\",\"17748\",\"17749\",\"17750\",\"17751\",\"17752\",\"17753\",\"17754\",\"17755\",\"17756\",\"17757\",\"17758\",\"17759\",\"17760\",\"17761\",\"17762\",\"17763\",\"17764\",\"17765\",\"17766\",\"17767\",\"17768\",\"17769\",\"17770\",\"17771\",\"17772\",\"17773\",\"17774\",\"17775\",\"17776\",\"17777\",\"17778\",\"17779\",\"17780\",\"17781\",\"17782\",\"17783\",\"17784\",\"17785\",\"17786\",\"17787\",\"17788\",\"17789\",\"17790\",\"17791\",\"17792\",\"17793\",\"17794\",\"17795\",\"17796\",\"17797\",\"17798\",\"17799\",\"17800\",\"17801\",\"17802\",\"17803\",\"17804\",\"17805\",\"17806\",\"17807\",\"17808\",\"17809\",\"17810\",\"17811\",\"17812\",\"17813\",\"17814\",\"17815\",\"17816\",\"17817\",\"17818\",\"17819\",\"17820\",\"17821\",\"17822\",\"17823\",\"17824\",\"17825\",\"17826\",\"17827\",\"17828\",\"17829\",\"17830\",\"17831\",\"17832\",\"17833\",\"17834\",\"17835\",\"17836\",\"17837\",\"17838\",\"17839\",\"17840\",\"17841\",\"17842\",\"17843\",\"17844\",\"17845\",\"17846\",\"17847\",\"17848\",\"17849\",\"17850\",\"17851\",\"17852\",\"17853\",\"17854\",\"17855\",\"17856\",\"17857\",\"17858\",\"17859\",\"17860\",\"17861\",\"17862\",\"17863\",\"17864\",\"17865\",\"17866\",\"17867\",\"17868\",\"17869\",\"17870\",\"17871\",\"17872\",\"17873\",\"17874\",\"17875\",\"17876\",\"17877\",\"17878\",\"17879\",\"17880\",\"17881\",\"17882\",\"17883\",\"17884\",\"17885\",\"17886\",\"17887\",\"17888\",\"17889\",\"17890\",\"17891\",\"17892\",\"17893\",\"17894\",\"17895\",\"17896\",\"17897\",\"17898\",\"17899\",\"17900\",\"17901\",\"17902\",\"17903\",\"17904\",\"17905\",\"17906\",\"17907\",\"17908\",\"17909\",\"17910\",\"17911\",\"17912\",\"17913\",\"17914\",\"17915\",\"17916\",\"17917\",\"17918\",\"17919\",\"17920\",\"17921\",\"17922\",\"17923\",\"17924\",\"17925\",\"17926\",\"17927\",\"17928\",\"17929\",\"17930\",\"17931\",\"17932\",\"17933\",\"17934\",\"17935\",\"17936\",\"17937\",\"17938\",\"17939\",\"17940\",\"17941\",\"17942\",\"17943\",\"17944\",\"17945\",\"17946\",\"17947\",\"17948\",\"17949\",\"17950\",\"17951\",\"17952\",\"17953\",\"17954\",\"17955\",\"17956\",\"17957\",\"17958\",\"17959\",\"17960\",\"17961\",\"17962\",\"17963\",\"17964\",\"17965\",\"17966\",\"17967\",\"17968\",\"17969\",\"17970\",\"17971\",\"17972\",\"17973\",\"17974\",\"17975\",\"17976\",\"17977\",\"17978\",\"17979\",\"17980\",\"17981\",\"17982\",\"17983\",\"17984\",\"17985\",\"17986\",\"17987\",\"17988\",\"17989\",\"17990\",\"17991\",\"17992\",\"17993\",\"17994\",\"17995\",\"17996\",\"17997\",\"17998\",\"17999\",\"18000\",\"18001\",\"18002\",\"18003\",\"18004\",\"18005\",\"18006\",\"18007\",\"18008\",\"18009\",\"18010\",\"18011\",\"18012\",\"18013\",\"18014\",\"18015\",\"18016\",\"18017\",\"18018\",\"18019\",\"18020\",\"18021\",\"18022\",\"18023\",\"18024\",\"18025\",\"18026\",\"18027\",\"18028\",\"18029\",\"18030\",\"18031\",\"18032\",\"18033\",\"18034\",\"18035\",\"18036\",\"18037\",\"18038\",\"18039\",\"18040\",\"18041\",\"18042\",\"18043\",\"18044\",\"18045\",\"18046\",\"18047\",\"18048\",\"18049\",\"18050\",\"18051\",\"18052\",\"18053\",\"18054\",\"18055\",\"18056\",\"18057\",\"18058\",\"18059\",\"18060\",\"18061\",\"18062\",\"18063\",\"18064\",\"18065\",\"18066\",\"18067\",\"18068\",\"18069\",\"18070\",\"18071\",\"18072\",\"18073\",\"18074\",\"18075\",\"18076\",\"18077\",\"18078\",\"18079\",\"18080\",\"18081\",\"18082\",\"18083\",\"18084\",\"18085\",\"18086\",\"18087\",\"18088\",\"18089\",\"18090\",\"18091\",\"18092\",\"18093\",\"18094\",\"18095\",\"18096\",\"18097\",\"18098\",\"18099\",\"18100\",\"18101\",\"18102\",\"18103\",\"18104\",\"18105\",\"18106\",\"18107\",\"18108\",\"18109\",\"18110\",\"18111\",\"18112\",\"18113\",\"18114\",\"18115\",\"18116\",\"18117\",\"18118\",\"18119\",\"18120\",\"18121\",\"18122\",\"18123\",\"18124\",\"18125\",\"18126\",\"18127\",\"18128\",\"18129\",\"18130\",\"18131\",\"18132\",\"18133\",\"18134\",\"18135\",\"18136\",\"18137\",\"18138\",\"18139\",\"18140\",\"18141\",\"18142\",\"18143\",\"18144\",\"18145\",\"18146\",\"18147\",\"18148\",\"18149\",\"18150\",\"18151\",\"18152\",\"18153\",\"18154\",\"18155\",\"18156\",\"18157\",\"18158\",\"18159\",\"18160\",\"18161\",\"18162\",\"18163\",\"18164\",\"18165\",\"18166\",\"18167\",\"18168\",\"18169\",\"18170\",\"18171\",\"18172\",\"18173\",\"18174\",\"18175\",\"18176\",\"18177\",\"18178\",\"18179\",\"18180\",\"18181\",\"18182\",\"18183\",\"18184\",\"18185\",\"18186\",\"18187\",\"18188\",\"18189\",\"18190\",\"18191\",\"18192\",\"18193\",\"18194\",\"18195\",\"18196\",\"18197\",\"18198\",\"18199\",\"18200\",\"18201\",\"18202\",\"18203\",\"18204\",\"18205\",\"18206\",\"18207\",\"18208\",\"18209\",\"18210\",\"18211\",\"18212\",\"18213\",\"18214\",\"18215\",\"18216\",\"18217\",\"18218\",\"18219\",\"18220\",\"18221\",\"18222\",\"18223\",\"18224\",\"18225\",\"18226\",\"18227\",\"18228\",\"18229\",\"18230\",\"18231\",\"18232\",\"18233\",\"18234\",\"18235\",\"18236\",\"18237\",\"18238\",\"18239\",\"18240\",\"18241\",\"18242\",\"18243\",\"18244\",\"18245\",\"18246\",\"18247\",\"18248\",\"18249\",\"18250\",\"18251\",\"18252\",\"18253\",\"18254\",\"18255\",\"18256\",\"18257\",\"18258\",\"18259\",\"18260\",\"18261\",\"18262\",\"18263\",\"18264\",\"18265\",\"18266\",\"18267\",\"18268\",\"18269\",\"18270\",\"18271\",\"18272\",\"18273\",\"18274\",\"18275\",\"18276\",\"18277\",\"18278\",\"18279\",\"18280\",\"18281\",\"18282\",\"18283\",\"18284\",\"18285\",\"18286\",\"18287\",\"18288\",\"18289\",\"18290\",\"18291\",\"18292\",\"18293\",\"18294\",\"18295\",\"18296\",\"18297\",\"18298\",\"18299\",\"18300\",\"18301\",\"18302\",\"18303\",\"18304\",\"18305\",\"18306\",\"18307\",\"18308\",\"18309\",\"18310\",\"18311\",\"18312\",\"18313\",\"18314\",\"18315\",\"18316\",\"18317\",\"18318\",\"18319\",\"18320\",\"18321\",\"18322\",\"18323\",\"18324\",\"18325\",\"18326\",\"18327\",\"18328\",\"18329\",\"18330\",\"18331\",\"18332\",\"18333\",\"18334\",\"18335\",\"18336\",\"18337\",\"18338\",\"18339\",\"18340\",\"18341\",\"18342\",\"18343\",\"18344\",\"18345\",\"18346\",\"18347\",\"18348\",\"18349\",\"18350\",\"18351\",\"18352\",\"18353\",\"18354\",\"18355\",\"18356\",\"18357\",\"18358\",\"18359\",\"18360\",\"18361\",\"18362\",\"18363\",\"18364\",\"18365\",\"18366\",\"18367\",\"18368\",\"18369\",\"18370\",\"18371\",\"18372\",\"18373\",\"18374\",\"18375\",\"18376\",\"18377\",\"18378\",\"18379\",\"18380\",\"18381\",\"18382\",\"18383\",\"18384\",\"18385\",\"18386\",\"18387\",\"18388\",\"18389\",\"18390\",\"18391\",\"18392\",\"18393\",\"18394\",\"18395\",\"18396\",\"18397\",\"18398\",\"18399\",\"18400\",\"18401\",\"18402\",\"18403\",\"18404\",\"18405\",\"18406\",\"18407\",\"18408\",\"18409\",\"18410\",\"18411\",\"18412\",\"18413\",\"18414\",\"18415\",\"18416\",\"18417\",\"18418\",\"18419\",\"18420\",\"18421\",\"18422\",\"18423\",\"18424\",\"18425\",\"18426\",\"18427\",\"18428\",\"18429\",\"18430\",\"18431\",\"18432\",\"18433\",\"18434\",\"18435\",\"18436\",\"18437\",\"18438\",\"18439\",\"18440\",\"18441\",\"18442\",\"18443\",\"18444\",\"18445\",\"18446\",\"18447\",\"18448\",\"18449\",\"18450\",\"18451\",\"18452\",\"18453\",\"18454\",\"18455\",\"18456\",\"18457\",\"18458\",\"18459\",\"18460\",\"18461\",\"18462\",\"18463\",\"18464\",\"18465\",\"18466\",\"18467\",\"18468\",\"18469\",\"18470\",\"18471\",\"18472\",\"18473\",\"18474\",\"18475\",\"18476\",\"18477\",\"18478\",\"18479\",\"18480\",\"18481\",\"18482\",\"18483\",\"18484\",\"18485\",\"18486\",\"18487\",\"18488\",\"18489\",\"18490\",\"18491\",\"18492\",\"18493\",\"18494\",\"18495\",\"18496\",\"18497\",\"18498\",\"18499\",\"18500\",\"18501\",\"18502\",\"18503\",\"18504\",\"18505\",\"18506\",\"18507\",\"18508\",\"18509\",\"18510\",\"18511\",\"18512\",\"18513\",\"18514\",\"18515\",\"18516\",\"18517\",\"18518\",\"18519\",\"18520\",\"18521\",\"18522\",\"18523\",\"18524\",\"18525\",\"18526\",\"18527\",\"18528\",\"18529\",\"18530\",\"18531\",\"18532\",\"18533\",\"18534\",\"18535\",\"18536\",\"18537\",\"18538\",\"18539\",\"18540\",\"18541\",\"18542\",\"18543\",\"18544\",\"18545\",\"18546\",\"18547\",\"18548\",\"18549\",\"18550\",\"18551\",\"18552\",\"18553\",\"18554\",\"18555\",\"18556\",\"18557\",\"18558\",\"18559\",\"18560\",\"18561\",\"18562\",\"18563\",\"18564\",\"18565\",\"18566\",\"18567\",\"18568\",\"18569\",\"18570\",\"18571\",\"18572\",\"18573\",\"18574\",\"18575\",\"18576\",\"18577\",\"18578\",\"18579\",\"18580\",\"18581\",\"18582\",\"18583\",\"18584\",\"18585\",\"18586\",\"18587\",\"18588\",\"18589\",\"18590\",\"18591\",\"18592\",\"18593\",\"18594\",\"18595\",\"18596\",\"18597\",\"18598\",\"18599\",\"18600\",\"18601\",\"18602\",\"18603\",\"18604\",\"18605\",\"18606\",\"18607\",\"18608\",\"18609\",\"18610\",\"18611\",\"18612\",\"18613\",\"18614\",\"18615\",\"18616\",\"18617\",\"18618\",\"18619\",\"18620\",\"18621\",\"18622\",\"18623\",\"18624\",\"18625\",\"18626\",\"18627\",\"18628\",\"18629\",\"18630\",\"18631\",\"18632\",\"18633\",\"18634\",\"18635\",\"18636\",\"18637\",\"18638\",\"18639\",\"18640\",\"18641\",\"18642\",\"18643\",\"18644\",\"18645\",\"18646\",\"18647\",\"18648\",\"18649\",\"18650\",\"18651\",\"18652\",\"18653\",\"18654\",\"18655\",\"18656\",\"18657\",\"18658\",\"18659\",\"18660\",\"18661\",\"18662\",\"18663\",\"18664\",\"18665\",\"18666\",\"18667\",\"18668\",\"18669\",\"18670\",\"18671\",\"18672\",\"18673\",\"18674\",\"18675\",\"18676\",\"18677\",\"18678\",\"18679\",\"18680\",\"18681\",\"18682\",\"18683\",\"18684\",\"18685\",\"18686\",\"18687\",\"18688\",\"18689\",\"18690\",\"18691\",\"18692\",\"18693\",\"18694\",\"18695\",\"18696\",\"18697\",\"18698\",\"18699\",\"18700\",\"18701\",\"18702\",\"18703\",\"18704\",\"18705\",\"18706\",\"18707\",\"18708\",\"18709\",\"18710\",\"18711\",\"18712\",\"18713\",\"18714\",\"18715\",\"18716\",\"18717\",\"18718\",\"18719\",\"18720\",\"18721\",\"18722\",\"18723\",\"18724\",\"18725\",\"18726\",\"18727\",\"18728\",\"18729\",\"18730\",\"18731\",\"18732\",\"18733\",\"18734\",\"18735\",\"18736\",\"18737\",\"18738\",\"18739\",\"18740\",\"18741\",\"18742\",\"18743\",\"18744\",\"18745\",\"18746\",\"18747\",\"18748\",\"18749\",\"18750\",\"18751\",\"18752\",\"18753\",\"18754\",\"18755\",\"18756\",\"18757\",\"18758\",\"18759\",\"18760\",\"18761\",\"18762\",\"18763\",\"18764\",\"18765\",\"18766\",\"18767\",\"18768\",\"18769\",\"18770\",\"18771\",\"18772\",\"18773\",\"18774\",\"18775\",\"18776\",\"18777\",\"18778\",\"18779\",\"18780\",\"18781\",\"18782\",\"18783\",\"18784\",\"18785\",\"18786\",\"18787\",\"18788\",\"18789\",\"18790\",\"18791\",\"18792\",\"18793\",\"18794\",\"18795\",\"18796\",\"18797\",\"18798\",\"18799\",\"18800\",\"18801\",\"18802\",\"18803\",\"18804\",\"18805\",\"18806\",\"18807\",\"18808\",\"18809\",\"18810\",\"18811\",\"18812\",\"18813\",\"18814\",\"18815\",\"18816\",\"18817\",\"18818\",\"18819\",\"18820\",\"18821\",\"18822\",\"18823\",\"18824\",\"18825\",\"18826\",\"18827\",\"18828\",\"18829\",\"18830\",\"18831\",\"18832\",\"18833\",\"18834\",\"18835\",\"18836\",\"18837\",\"18838\",\"18839\",\"18840\",\"18841\",\"18842\",\"18843\",\"18844\",\"18845\",\"18846\",\"18847\",\"18848\",\"18849\",\"18850\",\"18851\",\"18852\",\"18853\",\"18854\",\"18855\",\"18856\",\"18857\",\"18858\",\"18859\",\"18860\",\"18861\",\"18862\",\"18863\",\"18864\",\"18865\",\"18866\",\"18867\",\"18868\",\"18869\",\"18870\",\"18871\",\"18872\",\"18873\",\"18874\",\"18875\",\"18876\",\"18877\",\"18878\",\"18879\",\"18880\",\"18881\",\"18882\",\"18883\",\"18884\",\"18885\",\"18886\",\"18887\",\"18888\",\"18889\",\"18890\",\"18891\",\"18892\",\"18893\",\"18894\",\"18895\",\"18896\",\"18897\",\"18898\",\"18899\",\"18900\",\"18901\",\"18902\",\"18903\",\"18904\",\"18905\",\"18906\",\"18907\",\"18908\",\"18909\",\"18910\",\"18911\",\"18912\",\"18913\",\"18914\",\"18915\",\"18916\",\"18917\",\"18918\",\"18919\",\"18920\",\"18921\",\"18922\",\"18923\",\"18924\",\"18925\",\"18926\",\"18927\",\"18928\",\"18929\",\"18930\",\"18931\",\"18932\",\"18933\",\"18934\",\"18935\",\"18936\",\"18937\",\"18938\",\"18939\",\"18940\",\"18941\",\"18942\",\"18943\",\"18944\",\"18945\",\"18946\",\"18947\",\"18948\",\"18949\",\"18950\",\"18951\",\"18952\",\"18953\",\"18954\",\"18955\",\"18956\",\"18957\",\"18958\",\"18959\",\"18960\",\"18961\",\"18962\",\"18963\",\"18964\",\"18965\",\"18966\",\"18967\",\"18968\",\"18969\",\"18970\",\"18971\",\"18972\",\"18973\",\"18974\",\"18975\",\"18976\",\"18977\",\"18978\",\"18979\",\"18980\",\"18981\",\"18982\",\"18983\",\"18984\",\"18985\",\"18986\",\"18987\",\"18988\",\"18989\",\"18990\",\"18991\",\"18992\",\"18993\",\"18994\",\"18995\",\"18996\",\"18997\",\"18998\",\"18999\",\"19000\",\"19001\",\"19002\",\"19003\",\"19004\",\"19005\",\"19006\",\"19007\",\"19008\",\"19009\",\"19010\",\"19011\",\"19012\",\"19013\",\"19014\",\"19015\",\"19016\",\"19017\",\"19018\",\"19019\",\"19020\",\"19021\",\"19022\",\"19023\",\"19024\",\"19025\",\"19026\",\"19027\",\"19028\",\"19029\",\"19030\",\"19031\",\"19032\",\"19033\",\"19034\",\"19035\",\"19036\",\"19037\",\"19038\",\"19039\",\"19040\",\"19041\",\"19042\",\"19043\",\"19044\",\"19045\",\"19046\",\"19047\",\"19048\",\"19049\",\"19050\",\"19051\",\"19052\",\"19053\",\"19054\",\"19055\",\"19056\",\"19057\",\"19058\",\"19059\",\"19060\",\"19061\",\"19062\",\"19063\",\"19064\",\"19065\",\"19066\",\"19067\",\"19068\",\"19069\",\"19070\",\"19071\",\"19072\",\"19073\",\"19074\",\"19075\",\"19076\",\"19077\",\"19078\",\"19079\",\"19080\",\"19081\",\"19082\",\"19083\",\"19084\",\"19085\",\"19086\",\"19087\",\"19088\",\"19089\",\"19090\",\"19091\",\"19092\",\"19093\",\"19094\",\"19095\",\"19096\",\"19097\",\"19098\",\"19099\",\"19100\",\"19101\",\"19102\",\"19103\",\"19104\",\"19105\",\"19106\",\"19107\",\"19108\",\"19109\",\"19110\",\"19111\",\"19112\",\"19113\",\"19114\",\"19115\",\"19116\",\"19117\",\"19118\",\"19119\",\"19120\",\"19121\",\"19122\",\"19123\",\"19124\",\"19125\",\"19126\",\"19127\",\"19128\",\"19129\",\"19130\",\"19131\",\"19132\",\"19133\",\"19134\",\"19135\",\"19136\",\"19137\",\"19138\",\"19139\",\"19140\",\"19141\",\"19142\",\"19143\",\"19144\",\"19145\",\"19146\",\"19147\",\"19148\",\"19149\",\"19150\",\"19151\",\"19152\",\"19153\",\"19154\",\"19155\",\"19156\",\"19157\",\"19158\",\"19159\",\"19160\",\"19161\",\"19162\",\"19163\",\"19164\",\"19165\",\"19166\",\"19167\",\"19168\",\"19169\",\"19170\",\"19171\",\"19172\",\"19173\",\"19174\",\"19175\",\"19176\",\"19177\",\"19178\",\"19179\",\"19180\",\"19181\",\"19182\",\"19183\",\"19184\",\"19185\",\"19186\",\"19187\",\"19188\",\"19189\",\"19190\",\"19191\",\"19192\",\"19193\",\"19194\",\"19195\",\"19196\",\"19197\",\"19198\",\"19199\",\"19200\",\"19201\",\"19202\",\"19203\",\"19204\",\"19205\",\"19206\",\"19207\",\"19208\",\"19209\",\"19210\",\"19211\",\"19212\",\"19213\",\"19214\",\"19215\",\"19216\",\"19217\",\"19218\",\"19219\",\"19220\",\"19221\",\"19222\",\"19223\",\"19224\",\"19225\",\"19226\",\"19227\",\"19228\",\"19229\",\"19230\",\"19231\",\"19232\",\"19233\",\"19234\",\"19235\",\"19236\",\"19237\",\"19238\",\"19239\",\"19240\",\"19241\",\"19242\",\"19243\",\"19244\",\"19245\",\"19246\",\"19247\",\"19248\",\"19249\",\"19250\",\"19251\",\"19252\",\"19253\",\"19254\",\"19255\",\"19256\",\"19257\",\"19258\",\"19259\",\"19260\",\"19261\",\"19262\",\"19263\",\"19264\",\"19265\",\"19266\",\"19267\",\"19268\",\"19269\",\"19270\",\"19271\",\"19272\",\"19273\",\"19274\",\"19275\",\"19276\",\"19277\",\"19278\",\"19279\",\"19280\",\"19281\",\"19282\",\"19283\",\"19284\",\"19285\",\"19286\",\"19287\",\"19288\",\"19289\",\"19290\",\"19291\",\"19292\",\"19293\",\"19294\",\"19295\",\"19296\",\"19297\",\"19298\",\"19299\",\"19300\",\"19301\",\"19302\",\"19303\",\"19304\",\"19305\",\"19306\",\"19307\",\"19308\",\"19309\",\"19310\",\"19311\",\"19312\",\"19313\",\"19314\",\"19315\",\"19316\",\"19317\",\"19318\",\"19319\",\"19320\",\"19321\",\"19322\",\"19323\",\"19324\",\"19325\",\"19326\",\"19327\",\"19328\",\"19329\",\"19330\",\"19331\",\"19332\",\"19333\",\"19334\",\"19335\",\"19336\",\"19337\",\"19338\",\"19339\",\"19340\",\"19341\",\"19342\",\"19343\",\"19344\",\"19345\",\"19346\",\"19347\",\"19348\",\"19349\",\"19350\",\"19351\",\"19352\",\"19353\",\"19354\",\"19355\",\"19356\",\"19357\",\"19358\",\"19359\",\"19360\",\"19361\",\"19362\",\"19363\",\"19364\",\"19365\",\"19366\",\"19367\",\"19368\",\"19369\",\"19370\",\"19371\",\"19372\",\"19373\",\"19374\",\"19375\",\"19376\",\"19377\",\"19378\",\"19379\",\"19380\",\"19381\",\"19382\",\"19383\",\"19384\",\"19385\",\"19386\",\"19387\",\"19388\",\"19389\",\"19390\",\"19391\",\"19392\",\"19393\",\"19394\",\"19395\",\"19396\",\"19397\",\"19398\",\"19399\",\"19400\",\"19401\",\"19402\",\"19403\",\"19404\",\"19405\",\"19406\",\"19407\",\"19408\",\"19409\",\"19410\",\"19411\",\"19412\",\"19413\",\"19414\",\"19415\",\"19416\",\"19417\",\"19418\",\"19419\",\"19420\",\"19421\",\"19422\",\"19423\",\"19424\",\"19425\",\"19426\",\"19427\",\"19428\",\"19429\",\"19430\",\"19431\",\"19432\",\"19433\",\"19434\",\"19435\",\"19436\",\"19437\",\"19438\",\"19439\",\"19440\",\"19441\",\"19442\",\"19443\",\"19444\",\"19445\",\"19446\",\"19447\",\"19448\",\"19449\",\"19450\",\"19451\",\"19452\",\"19453\",\"19454\",\"19455\",\"19456\",\"19457\",\"19458\",\"19459\",\"19460\",\"19461\",\"19462\",\"19463\",\"19464\",\"19465\",\"19466\",\"19467\",\"19468\",\"19469\",\"19470\",\"19471\",\"19472\",\"19473\",\"19474\",\"19475\",\"19476\",\"19477\",\"19478\",\"19479\",\"19480\",\"19481\",\"19482\",\"19483\",\"19484\",\"19485\",\"19486\",\"19487\",\"19488\",\"19489\",\"19490\",\"19491\",\"19492\",\"19493\",\"19494\",\"19495\",\"19496\",\"19497\",\"19498\",\"19499\",\"19500\",\"19501\",\"19502\",\"19503\",\"19504\",\"19505\",\"19506\",\"19507\",\"19508\",\"19509\",\"19510\",\"19511\",\"19512\",\"19513\",\"19514\",\"19515\",\"19516\",\"19517\",\"19518\",\"19519\",\"19520\",\"19521\",\"19522\",\"19523\",\"19524\",\"19525\",\"19526\",\"19527\",\"19528\",\"19529\",\"19530\",\"19531\",\"19532\",\"19533\",\"19534\",\"19535\",\"19536\",\"19537\",\"19538\",\"19539\",\"19540\",\"19541\",\"19542\",\"19543\",\"19544\",\"19545\",\"19546\",\"19547\",\"19548\",\"19549\",\"19550\",\"19551\",\"19552\",\"19553\",\"19554\",\"19555\",\"19556\",\"19557\",\"19558\",\"19559\",\"19560\",\"19561\",\"19562\",\"19563\",\"19564\",\"19565\",\"19566\",\"19567\",\"19568\",\"19569\",\"19570\",\"19571\",\"19572\",\"19573\",\"19574\",\"19575\",\"19576\",\"19577\",\"19578\",\"19579\",\"19580\",\"19581\",\"19582\",\"19583\",\"19584\",\"19585\",\"19586\",\"19587\",\"19588\",\"19589\",\"19590\",\"19591\",\"19592\",\"19593\",\"19594\",\"19595\",\"19596\",\"19597\",\"19598\",\"19599\",\"19600\",\"19601\",\"19602\",\"19603\",\"19604\",\"19605\",\"19606\",\"19607\",\"19608\",\"19609\",\"19610\",\"19611\",\"19612\",\"19613\",\"19614\",\"19615\",\"19616\",\"19617\",\"19618\",\"19619\",\"19620\",\"19621\",\"19622\",\"19623\",\"19624\",\"19625\",\"19626\",\"19627\",\"19628\",\"19629\",\"19630\",\"19631\",\"19632\",\"19633\",\"19634\",\"19635\",\"19636\",\"19637\",\"19638\",\"19639\",\"19640\",\"19641\",\"19642\",\"19643\",\"19644\",\"19645\",\"19646\",\"19647\",\"19648\",\"19649\",\"19650\",\"19651\",\"19652\",\"19653\",\"19654\",\"19655\",\"19656\",\"19657\",\"19658\",\"19659\",\"19660\",\"19661\",\"19662\",\"19663\",\"19664\",\"19665\",\"19666\",\"19667\",\"19668\",\"19669\",\"19670\",\"19671\",\"19672\",\"19673\",\"19674\",\"19675\",\"19676\",\"19677\",\"19678\",\"19679\",\"19680\",\"19681\",\"19682\",\"19683\",\"19684\",\"19685\",\"19686\",\"19687\",\"19688\",\"19689\",\"19690\",\"19691\",\"19692\",\"19693\",\"19694\",\"19695\",\"19696\",\"19697\",\"19698\",\"19699\",\"19700\",\"19701\",\"19702\",\"19703\",\"19704\",\"19705\",\"19706\",\"19707\",\"19708\",\"19709\",\"19710\",\"19711\",\"19712\",\"19713\",\"19714\",\"19715\",\"19716\",\"19717\",\"19718\",\"19719\",\"19720\",\"19721\",\"19722\",\"19723\",\"19724\",\"19725\",\"19726\",\"19727\",\"19728\",\"19729\",\"19730\",\"19731\",\"19732\",\"19733\",\"19734\",\"19735\",\"19736\",\"19737\",\"19738\"]');
INSERT INTO `tmp_browse` (`id`, `sid`, `data`, `object_data`) VALUES
(3, '92324b406f8526eaee07a3741abd1633', '{\"base\":\"SELECT %%SELECT%% FROM `album` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`album`.`id`\"],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"album\",\"ak\":\"album\",\"total\":20}', '[\"946\",\"944\",\"958\",\"957\",\"962\",\"961\",\"941\",\"960\",\"956\",\"955\",\"945\",\"943\",\"942\",\"950\",\"953\",\"951\",\"952\",\"959\",\"937\",\"936\"]'),
(4, '92324b406f8526eaee07a3741abd1633', '{\"base\":\"SELECT %%SELECT%% FROM `album` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`album`.`id`\"],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"album\",\"ak\":\"album\",\"total\":20}', '[\"946\",\"944\",\"958\",\"957\",\"962\",\"961\",\"941\",\"960\",\"956\",\"955\",\"945\",\"943\",\"942\",\"950\",\"953\",\"951\",\"952\",\"959\",\"937\",\"936\"]'),
(5, '92324b406f8526eaee07a3741abd1633', '{\"base\":\"SELECT %%SELECT%% FROM `album` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`album`.`id`\"],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"album\",\"ak\":\"album\",\"total\":30}', '[\"485\",\"475\",\"463\",\"469\",\"465\",\"490\",\"472\",\"482\",\"480\",\"474\",\"487\",\"481\",\"464\",\"486\",\"477\",\"478\",\"467\",\"471\",\"473\",\"468\",\"470\",\"488\",\"476\",\"479\",\"462\",\"484\",\"483\",\"466\",\"491\",\"492\"]'),
(6, '92324b406f8526eaee07a3741abd1633', '{\"base\":\"SELECT %%SELECT%% FROM `album` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`album`.`id`\"],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"album\",\"ak\":\"album\",\"total\":30}', '[\"485\",\"475\",\"463\",\"469\",\"465\",\"490\",\"472\",\"482\",\"480\",\"474\",\"487\",\"481\",\"464\",\"486\",\"477\",\"478\",\"467\",\"471\",\"473\",\"468\",\"470\",\"488\",\"476\",\"479\",\"462\",\"484\",\"483\",\"466\",\"491\",\"492\"]'),
(7, '92324b406f8526eaee07a3741abd1633', '{\"base\":\"SELECT %%SELECT%% FROM `song` \",\"filter\":{\"regex_not_match\":\"\",\"album\":\"473\"},\"select\":[\"`song`.`id`\"],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"song\",\"sort\":{\"track\":\"ASC\"},\"total\":18}', NULL),
(8, '92324b406f8526eaee07a3741abd1633', '{\"base\":\"SELECT %%SELECT%% FROM `song` \",\"filter\":{\"regex_not_match\":\"\",\"album\":\"473\"},\"select\":[\"`song`.`id`\"],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"song\",\"sort\":{\"track\":\"ASC\"},\"total\":18}', NULL),
(9, '92324b406f8526eaee07a3741abd1633', '{\"base\":\"SELECT %%SELECT%% FROM `song` \",\"filter\":{\"regex_not_match\":\"\",\"album\":\"473\"},\"select\":[\"`song`.`id`\"],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"song\",\"sort\":{\"track\":\"ASC\"},\"total\":18}', NULL),
(57, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\",\"catalog\":0},\"select\":[\"`artist`.`id`\"],\"static\":false,\"simple\":true,\"start\":50,\"offset\":50,\"use_pages\":false,\"use_alpha\":false,\"grid_view\":true,\"type\":\"artist\",\"update_session\":true,\"sort\":{\"name\":\"ASC\"},\"total\":166}', NULL),
(58, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `album` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`album`.`id`\"],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":false,\"use_alpha\":false,\"grid_view\":true,\"type\":\"album\",\"ak\":\"album\",\"total\":32}', '[\"1141\",\"1148\",\"1147\",\"1149\",\"1140\",\"1139\",\"1143\",\"1133\",\"1154\",\"1130\",\"1152\",\"1151\",\"1153\",\"1142\",\"1123\",\"1126\",\"1124\",\"1127\",\"1135\",\"1122\",\"1134\",\"1136\",\"1128\",\"1125\",\"1132\",\"1144\",\"1138\",\"1129\",\"1137\",\"1145\",\"1155\",\"1131\"]'),
(59, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `album` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`album`.`id`\"],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":false,\"use_alpha\":false,\"grid_view\":true,\"type\":\"album\",\"ak\":\"album\",\"total\":20}', '[\"1071\",\"1070\",\"1072\",\"1077\",\"1069\",\"1064\",\"1063\",\"1060\",\"1061\",\"1065\",\"1066\",\"1062\",\"1076\",\"1075\",\"1074\",\"1073\",\"1067\",\"1058\",\"1059\",\"1068\"]'),
(60, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `album` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`album`.`id`\"],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":false,\"use_alpha\":false,\"grid_view\":true,\"type\":\"album\",\"ak\":\"album\",\"total\":39}', '[\"357\",\"347\",\"350\",\"327\",\"334\",\"337\",\"356\",\"339\",\"335\",\"331\",\"329\",\"932\",\"349\",\"358\",\"332\",\"360\",\"934\",\"342\",\"340\",\"343\",\"326\",\"931\",\"933\",\"336\",\"345\",\"344\",\"328\",\"348\",\"338\",\"352\",\"930\",\"330\",\"333\",\"346\",\"351\",\"353\",\"354\",\"359\",\"355\"]'),
(61, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"catalog\":0,\"regex_not_match\":\"\"},\"select\":[\"`artist`.`id`\"],\"static\":false,\"simple\":true,\"start\":50,\"offset\":50,\"use_pages\":false,\"use_alpha\":false,\"grid_view\":false,\"type\":\"artist\",\"update_session\":true,\"sort\":{\"name\":\"ASC\"},\"total\":166}', NULL),
(62, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `album` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`album`.`id`\"],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":false,\"use_alpha\":false,\"grid_view\":true,\"type\":\"album\",\"ak\":\"album\",\"total\":20}', '[\"810\",\"811\",\"785\",\"802\",\"796\",\"777\",\"813\",\"812\",\"799\",\"781\",\"804\",\"803\",\"792\",\"797\",\"808\",\"807\",\"779\",\"788\",\"783\",\"793\"]'),
(63, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `tag` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`tag`.`id`\"],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"tag\",\"join\":{\"1\":{\"tag_map\":\"LEFT JOIN tag_map ON `tag_map`.`tag_id`=`tag`.`id`\"}},\"update_session\":true,\"total\":65}', '{\"53\":{\"id\":\"53\",\"name\":\"Acoustic\",\"is_hidden\":\"0\",\"count\":\"14\"},\"51\":{\"id\":\"51\",\"name\":\"Alt. Rock\",\"is_hidden\":\"0\",\"count\":\"6\"},\"64\":{\"id\":\"64\",\"name\":\"Alternative\",\"is_hidden\":\"0\",\"count\":\"688\"},\"93\":{\"id\":\"93\",\"name\":\"Alternativo\",\"is_hidden\":\"0\",\"count\":\"49\"},\"56\":{\"id\":\"56\",\"name\":\"Blues\",\"is_hidden\":\"0\",\"count\":\"849\"},\"99\":{\"id\":\"99\",\"name\":\"Classic Prog\",\"is_hidden\":\"0\",\"count\":\"52\"},\"50\":{\"id\":\"50\",\"name\":\"Classic Rock\",\"is_hidden\":\"0\",\"count\":\"105\"},\"91\":{\"id\":\"91\",\"name\":\"Covered By 3\",\"is_hidden\":\"0\",\"count\":\"9\"},\"62\":{\"id\":\"62\",\"name\":\"default\",\"is_hidden\":\"0\",\"count\":\"4\"},\"39\":{\"id\":\"39\",\"name\":\"Disco\",\"is_hidden\":\"0\",\"count\":\"638\"},\"95\":{\"id\":\"95\",\"name\":\"Dubstep\",\"is_hidden\":\"0\",\"count\":\"53\"},\"3\":{\"id\":\"3\",\"name\":\"Electronic\",\"is_hidden\":\"0\",\"count\":\"769\"},\"90\":{\"id\":\"90\",\"name\":\"Folk\",\"is_hidden\":\"0\",\"count\":\"45\"},\"60\":{\"id\":\"60\",\"name\":\"Folk-Rock\",\"is_hidden\":\"0\",\"count\":\"10\"},\"40\":{\"id\":\"40\",\"name\":\"Funk\",\"is_hidden\":\"0\",\"count\":\"638\"},\"88\":{\"id\":\"88\",\"name\":\"General Latin Pop\",\"is_hidden\":\"0\",\"count\":\"5\"},\"55\":{\"id\":\"55\",\"name\":\"General Rock\",\"is_hidden\":\"0\",\"count\":\"9\"},\"52\":{\"id\":\"52\",\"name\":\"genre\",\"is_hidden\":\"0\",\"count\":\"30\"},\"75\":{\"id\":\"75\",\"name\":\"Hard\",\"is_hidden\":\"0\",\"count\":\"26\"},\"47\":{\"id\":\"47\",\"name\":\"Hard Rock\",\"is_hidden\":\"0\",\"count\":\"757\"},\"79\":{\"id\":\"79\",\"name\":\"Hardcore Punk\",\"is_hidden\":\"0\",\"count\":\"46\"},\"76\":{\"id\":\"76\",\"name\":\"Heavy\",\"is_hidden\":\"0\",\"count\":\"26\"},\"48\":{\"id\":\"48\",\"name\":\"Heavy Metal\",\"is_hidden\":\"0\",\"count\":\"492\"},\"86\":{\"id\":\"86\",\"name\":\"Hip-Hop\",\"is_hidden\":\"0\",\"count\":\"135\"},\"41\":{\"id\":\"41\",\"name\":\"House\",\"is_hidden\":\"0\",\"count\":\"10\"},\"65\":{\"id\":\"65\",\"name\":\"Industrial\",\"is_hidden\":\"0\",\"count\":\"24\"},\"66\":{\"id\":\"66\",\"name\":\"Industrial Metal\",\"is_hidden\":\"0\",\"count\":\"60\"},\"58\":{\"id\":\"58\",\"name\":\"KaZaa\",\"is_hidden\":\"0\",\"count\":\"5\"},\"89\":{\"id\":\"89\",\"name\":\"Latin\",\"is_hidden\":\"0\",\"count\":\"95\"},\"92\":{\"id\":\"92\",\"name\":\"Live\",\"is_hidden\":\"0\",\"count\":\"103\"},\"98\":{\"id\":\"98\",\"name\":\"Manguebeat\",\"is_hidden\":\"0\",\"count\":\"945\"},\"83\":{\"id\":\"83\",\"name\":\"Melodic Death Metal\",\"is_hidden\":\"0\",\"count\":\"258\"},\"49\":{\"id\":\"49\",\"name\":\"Metal\",\"is_hidden\":\"0\",\"count\":\"206\"},\"73\":{\"id\":\"73\",\"name\":\"Mpb\",\"is_hidden\":\"0\",\"count\":\"1400\"},\"100\":{\"id\":\"100\",\"name\":\"M\\u00fasica Popular Brasileira\",\"is_hidden\":\"0\",\"count\":\"284\"},\"61\":{\"id\":\"61\",\"name\":\"New Age\",\"is_hidden\":\"0\",\"count\":\"4\"},\"103\":{\"id\":\"103\",\"name\":\"Nu-Metal\",\"is_hidden\":\"0\",\"count\":\"41\"},\"44\":{\"id\":\"44\",\"name\":\"Oldies\",\"is_hidden\":\"0\",\"count\":\"99\"},\"54\":{\"id\":\"54\",\"name\":\"Other\",\"is_hidden\":\"0\",\"count\":\"338\"},\"67\":{\"id\":\"67\",\"name\":\"Other Reggae\",\"is_hidden\":\"0\",\"count\":\"180\"},\"13\":{\"id\":\"13\",\"name\":\"Pop\",\"is_hidden\":\"0\",\"count\":\"1803\"},\"102\":{\"id\":\"102\",\"name\":\"Progressive Metal\",\"is_hidden\":\"0\",\"count\":\"137\"},\"59\":{\"id\":\"59\",\"name\":\"Progressive Rock\",\"is_hidden\":\"0\",\"count\":\"393\"},\"96\":{\"id\":\"96\",\"name\":\"Psy Trance\",\"is_hidden\":\"0\",\"count\":\"225\"},\"77\":{\"id\":\"77\",\"name\":\"Psy-Trance\",\"is_hidden\":\"0\",\"count\":\"15\"},\"94\":{\"id\":\"94\",\"name\":\"Psychedelic\",\"is_hidden\":\"0\",\"count\":\"91\"},\"57\":{\"id\":\"57\",\"name\":\"Psychedelic Rock\",\"is_hidden\":\"0\",\"count\":\"6\"},\"97\":{\"id\":\"97\",\"name\":\"Psytrance\",\"is_hidden\":\"0\",\"count\":\"38\"},\"81\":{\"id\":\"81\",\"name\":\"Punk\",\"is_hidden\":\"0\",\"count\":\"160\"},\"80\":{\"id\":\"80\",\"name\":\"Punk Rock\",\"is_hidden\":\"0\",\"count\":\"349\"},\"85\":{\"id\":\"85\",\"name\":\"R&B\",\"is_hidden\":\"0\",\"count\":\"169\"},\"70\":{\"id\":\"70\",\"name\":\"Rap\",\"is_hidden\":\"0\",\"count\":\"51\"},\"69\":{\"id\":\"69\",\"name\":\"Reggae\",\"is_hidden\":\"0\",\"count\":\"314\"},\"68\":{\"id\":\"68\",\"name\":\"Reggae(Acoustic)\",\"is_hidden\":\"0\",\"count\":\"8\"},\"45\":{\"id\":\"45\",\"name\":\"Rock\",\"is_hidden\":\"0\",\"count\":\"2702\"},\"43\":{\"id\":\"43\",\"name\":\"Rock & Roll\",\"is_hidden\":\"0\",\"count\":\"575\"},\"78\":{\"id\":\"78\",\"name\":\"Rock brasileiro\",\"is_hidden\":\"0\",\"count\":\"202\"},\"71\":{\"id\":\"71\",\"name\":\"Rock Nacional\",\"is_hidden\":\"0\",\"count\":\"27\"},\"46\":{\"id\":\"46\",\"name\":\"Rock\'n\'Roll\",\"is_hidden\":\"0\",\"count\":\"50\"},\"74\":{\"id\":\"74\",\"name\":\"Soul\",\"is_hidden\":\"0\",\"count\":\"50\"},\"101\":{\"id\":\"101\",\"name\":\"Soul Funk\",\"is_hidden\":\"0\",\"count\":\"14\"},\"87\":{\"id\":\"87\",\"name\":\"Soundtrack\",\"is_hidden\":\"0\",\"count\":\"5\"},\"63\":{\"id\":\"63\",\"name\":\"Symphonic Rock\",\"is_hidden\":\"0\",\"count\":\"5\"},\"42\":{\"id\":\"42\",\"name\":\"Trance GOA\",\"is_hidden\":\"0\",\"count\":\"6\"},\"72\":{\"id\":\"72\",\"name\":\"World\",\"is_hidden\":\"0\",\"count\":\"6\"}}'),
(64, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`id`\"],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":false,\"use_alpha\":false,\"grid_view\":false,\"type\":\"artist\"}', NULL),
(65, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT `user_flag`.`object_id` as `id`, `user_flag`.`object_type` as `type`, `user_flag`.`user` as `user` FROM `user_flag` WHERE `user_flag`.`object_type` = \'album\' AND `user_flag`.`user` = \'1\' ORDER BY `user_flag`.`date` DESC \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":false,\"use_alpha\":false,\"grid_view\":true,\"type\":\"album\",\"custom\":true,\"total\":0}', NULL),
(66, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT `user_flag`.`object_id` as `id`, `user_flag`.`object_type` as `type`, `user_flag`.`user` as `user` FROM `user_flag` WHERE `user_flag`.`object_type` = \'artist\' AND `user_flag`.`user` = \'1\' ORDER BY `user_flag`.`date` DESC \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":false,\"use_alpha\":false,\"grid_view\":false,\"type\":\"artist\",\"custom\":true,\"total\":0}', NULL),
(67, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT `user_flag`.`object_id` as `id`, `user_flag`.`object_type` as `type`, `user_flag`.`user` as `user` FROM `user_flag` WHERE `user_flag`.`object_type` = \'song\' AND `user_flag`.`user` = \'1\' ORDER BY `user_flag`.`date` DESC \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"song\",\"custom\":true,\"total\":0}', NULL),
(68, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT `user_flag`.`object_id` as `id`, `user_flag`.`object_type` as `type`, `user_flag`.`user` as `user` FROM `user_flag` WHERE `user_flag`.`object_type` = \'video\' AND `user_flag`.`user` = \'1\' ORDER BY `user_flag`.`date` DESC \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"video\",\"custom\":true,\"total\":0}', NULL),
(69, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT `user_flag`.`object_id` as `id`, `user_flag`.`object_type` as `type`, `user_flag`.`user` as `user` FROM `user_flag` WHERE `user_flag`.`object_type` = \'playlist\' AND `user_flag`.`user` = \'1\' ORDER BY `user_flag`.`date` DESC \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[],\"static\":false,\"simple\":true,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"playlist\",\"custom\":true,\"total\":0}', NULL),
(70, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":null,\"filter\":[],\"select\":[],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50}', '[\"660\",\"375\",\"1107\",\"493\",\"473\"]'),
(71, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":null,\"filter\":[],\"select\":[],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50}', '[\"1170\",\"1169\",\"1168\",\"1166\",\"1167\",\"1165\"]'),
(72, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":null,\"filter\":[],\"select\":[],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50}', '[\"660\",\"375\",\"1107\",\"493\",\"473\"]'),
(73, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":1}', '[\"17\"]'),
(74, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":1}', '[\"17\"]'),
(75, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":null,\"filter\":[],\"select\":[],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50}', '[\"189\",\"100\",\"230\",\"281\",\"132\",\"130\"]'),
(76, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":null,\"filter\":[],\"select\":[],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50}', '[\"286\",\"285\",\"284\",\"283\",\"282\",\"281\"]'),
(77, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":null,\"filter\":[],\"select\":[],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50}', '[\"189\",\"100\",\"230\",\"281\",\"132\",\"130\"]'),
(78, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\",\"catalog\":0},\"select\":[\"`artist`.`id`\"],\"static\":false,\"simple\":true,\"start\":100,\"offset\":50,\"use_pages\":false,\"use_alpha\":false,\"grid_view\":false,\"type\":\"artist\",\"update_session\":true,\"sort\":{\"name\":\"ASC\"},\"total\":166}', NULL),
(83, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `album` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`album`.`id`\"],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":false,\"use_alpha\":false,\"grid_view\":true,\"type\":\"album\",\"ak\":\"album\",\"total\":7}', '[\"373\",\"378\",\"385\",\"381\",\"368\",\"371\",\"375\"]'),
(84, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `album` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`album`.`id`\"],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":false,\"use_alpha\":false,\"grid_view\":true,\"type\":\"album\",\"ak\":\"album\",\"total\":7}', '[\"373\",\"378\",\"385\",\"381\",\"368\",\"371\",\"375\"]'),
(85, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":1}', '[\"17\"]'),
(86, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":1}', '[\"17\"]'),
(87, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":0}', '[]'),
(88, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":null,\"filter\":[],\"select\":[],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50}', '[\"189\",\"100\",\"281\",\"230\",\"132\",\"130\"]'),
(89, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":null,\"filter\":[],\"select\":[],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50}', '[\"152\",\"153\",\"154\",\"151\",\"150\",\"148\"]'),
(90, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":null,\"filter\":[],\"select\":[],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50}', '[\"189\",\"100\",\"281\",\"230\",\"132\",\"130\"]'),
(91, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\",\"catalog\":0},\"select\":[\"`artist`.`id`\"],\"static\":false,\"simple\":true,\"start\":150,\"offset\":50,\"use_pages\":false,\"use_alpha\":false,\"grid_view\":false,\"type\":\"artist\",\"update_session\":true,\"sort\":{\"name\":\"ASC\"},\"total\":166}', NULL),
(92, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":0}', '[]'),
(93, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":0}', '[]'),
(94, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":0}', '[]'),
(95, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":null,\"filter\":[],\"select\":[],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50}', '[]'),
(96, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":null,\"filter\":[],\"select\":[],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50}', '[\"152\",\"153\",\"154\",\"151\",\"150\",\"148\"]'),
(97, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":null,\"filter\":[],\"select\":[],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50}', '[]'),
(98, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":null,\"filter\":[],\"select\":[],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50}', '[]'),
(99, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":null,\"filter\":[],\"select\":[],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50}', '[\"152\",\"153\",\"154\",\"151\",\"150\",\"148\"]'),
(100, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":null,\"filter\":[],\"select\":[],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50}', '[]'),
(101, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":0}', '[]'),
(102, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":\"SELECT %%SELECT%% FROM `artist` \",\"filter\":{\"regex_not_match\":\"\"},\"select\":[\"`artist`.`name`\"],\"static\":true,\"simple\":false,\"start\":0,\"offset\":50,\"use_pages\":true,\"use_alpha\":false,\"grid_view\":true,\"type\":\"catalog\",\"total\":0}', '[]'),
(103, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":null,\"filter\":[],\"select\":[],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50}', '[]'),
(104, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":null,\"filter\":[],\"select\":[],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50}', '[\"152\",\"153\",\"154\",\"151\",\"150\",\"148\"]'),
(105, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":null,\"filter\":[],\"select\":[],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50}', '[]'),
(106, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":null,\"filter\":[],\"select\":[],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50}', '[]'),
(107, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":null,\"filter\":[],\"select\":[],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50}', '[]'),
(108, 'c5d4fa814f8b7fbcab141cb2fbf636f8', '{\"base\":null,\"filter\":[],\"select\":[],\"static\":false,\"simple\":false,\"start\":0,\"offset\":50}', '[]');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tmp_playlist`
--

CREATE TABLE `tmp_playlist` (
  `id` int(11) UNSIGNED NOT NULL,
  `session` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `type` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `object_type` varchar(32) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tmp_playlist`
--

INSERT INTO `tmp_playlist` (`id`, `session`, `type`, `object_type`) VALUES
(1, 'c5d4fa814f8b7fbcab141cb2fbf636f8', 'user', 'song'),
(3, '711b7ff36e33dd4761ee556c041760d8', 'user', 'song'),
(4, '92324b406f8526eaee07a3741abd1633', 'user', 'song');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tmp_playlist_data`
--

CREATE TABLE `tmp_playlist_data` (
  `id` int(11) UNSIGNED NOT NULL,
  `tmp_playlist` int(11) UNSIGNED NOT NULL,
  `object_type` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `track` int(11) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tmp_playlist_data`
--

INSERT INTO `tmp_playlist_data` (`id`, `tmp_playlist`, `object_type`, `object_id`, `track`) VALUES
(1, 3, 'song', 6418, NULL),
(2, 3, 'song', 16571, NULL),
(3, 3, 'song', 16572, NULL),
(4, 3, 'song', 6412, NULL),
(5, 3, 'song', 6419, NULL),
(6, 3, 'song', 16573, NULL),
(7, 3, 'song', 6415, NULL),
(8, 3, 'song', 6413, NULL),
(9, 3, 'song', 6420, NULL),
(10, 3, 'song', 6417, NULL),
(11, 3, 'song', 6414, NULL),
(12, 3, 'song', 16565, NULL),
(13, 3, 'song', 16570, NULL),
(14, 3, 'song', 6416, NULL),
(15, 3, 'song', 16566, NULL),
(16, 3, 'song', 16567, NULL),
(17, 3, 'song', 16569, NULL),
(18, 3, 'song', 16568, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tvshow`
--

CREATE TABLE `tvshow` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `summary` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `year` int(11) UNSIGNED DEFAULT NULL,
  `prefix` varchar(32) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tvshow_episode`
--

CREATE TABLE `tvshow_episode` (
  `id` int(11) UNSIGNED NOT NULL,
  `original_name` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `season` int(11) UNSIGNED NOT NULL,
  `episode_number` int(11) UNSIGNED NOT NULL,
  `summary` varchar(256) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tvshow_season`
--

CREATE TABLE `tvshow_season` (
  `id` int(11) UNSIGNED NOT NULL,
  `season_number` int(11) UNSIGNED NOT NULL,
  `tvshow` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `update_info`
--

CREATE TABLE `update_info` (
  `key` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `update_info`
--

INSERT INTO `update_info` (`key`, `value`) VALUES
('db_version', '380012'),
('Plugin_Last.FM', '000005');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `apikey` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `access` tinyint(4) UNSIGNED NOT NULL,
  `disabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `last_seen` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `create_date` int(11) UNSIGNED DEFAULT NULL,
  `validation` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `state` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `city` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `fullname_public` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `user`
--

INSERT INTO `user` (`id`, `username`, `fullname`, `email`, `website`, `apikey`, `password`, `access`, `disabled`, `last_seen`, `create_date`, `validation`, `state`, `city`, `fullname_public`) VALUES
(1, 'codex', 'Marcelo Motta', 'admin@marcelomotta.com', 'www.marcelomotta.com', NULL, '909e717339aaaf6d682b6cb10789c4cc797597e18ab2124c99a93e36f80146c0', 100, 0, 1570379066, 1570372199, NULL, 'RJ', 'Arraial do Cabo', 1),
(2, 'laysy', 'Laysy Soares', 'laysyhippie@gmail.com', NULL, NULL, '35d0a1b4fcc65795bd41c39e7787dca5302b4a3720266a5bc47515846c8b12a4', 25, 0, 0, 1570374189, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_activity`
--

CREATE TABLE `user_activity` (
  `id` int(11) UNSIGNED NOT NULL,
  `user` int(11) UNSIGNED NOT NULL,
  `action` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `object_type` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `activity_date` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `user_activity`
--

INSERT INTO `user_activity` (`id`, `user`, `action`, `object_id`, `object_type`, `activity_date`) VALUES
(12, 1, 'userflag', 6646, 'song', 1570378223);

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_catalog`
--

CREATE TABLE `user_catalog` (
  `user` int(11) UNSIGNED NOT NULL,
  `catalog` int(11) UNSIGNED NOT NULL,
  `level` smallint(4) UNSIGNED NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_flag`
--

CREATE TABLE `user_flag` (
  `id` int(11) UNSIGNED NOT NULL,
  `user` int(11) NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `object_type` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `date` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `user_flag`
--

INSERT INTO `user_flag` (`id`, `user`, `object_id`, `object_type`, `date`) VALUES
(1, 1, 6646, 'song', 1570378223);

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_follower`
--

CREATE TABLE `user_follower` (
  `id` int(11) UNSIGNED NOT NULL,
  `user` int(11) UNSIGNED NOT NULL,
  `follow_user` int(11) UNSIGNED NOT NULL,
  `follow_date` int(11) UNSIGNED DEFAULT NULL,
  `creation_date` int(11) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_preference`
--

CREATE TABLE `user_preference` (
  `user` int(11) NOT NULL,
  `preference` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `value` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `user_preference`
--

INSERT INTO `user_preference` (`user`, `preference`, `value`) VALUES
(-1, 1, '1'),
(-1, 4, '10'),
(-1, 19, '32'),
(-1, 22, 'Ampache :: For the love of Music'),
(-1, 23, '0'),
(-1, 24, '0'),
(-1, 25, '80'),
(-1, 41, 'mpd'),
(-1, 29, 'web_player'),
(-1, 31, 'pt_BR'),
(-1, 32, 'm3u'),
(-1, 33, 'reborn'),
(-1, 34, '27'),
(-1, 35, '27'),
(-1, 36, '27'),
(-1, 51, '50'),
(-1, 40, '100'),
(-1, 44, '1'),
(-1, 45, '1'),
(-1, 46, '1'),
(-1, 47, '7'),
(-1, 49, '1'),
(-1, 52, '8192'),
(-1, 53, 'default'),
(-1, 55, 'default'),
(-1, 57, ''),
(-1, 69, '0'),
(-1, 70, '0'),
(-1, 71, '0'),
(-1, 72, '0'),
(-1, 77, ''),
(-1, 78, ''),
(-1, 114, '1'),
(-1, 113, '0'),
(-1, 112, '-1'),
(-1, 111, '1'),
(-1, 110, '0'),
(-1, 109, '0'),
(-1, 108, '0'),
(-1, 107, '0'),
(-1, 106, '0'),
(-1, 105, '0'),
(-1, 104, '0'),
(-1, 103, '7'),
(-1, 102, '0'),
(-1, 101, '0'),
(-1, 100, '1'),
(-1, 99, '0'),
(-1, 95, '1'),
(-1, 94, '0'),
(-1, 93, '1'),
(-1, 92, '1'),
(-1, 91, '1'),
(-1, 90, '1'),
(-1, 89, '1'),
(-1, 88, '1'),
(-1, 87, '0'),
(-1, 86, '1'),
(-1, 85, '1'),
(-1, 84, '0'),
(-1, 83, 'default'),
(-1, 79, '50'),
(-1, 80, '50'),
(-1, 82, '1'),
(-1, 81, '1'),
(-1, 115, '0'),
(-1, 116, ''),
(-1, 117, '1'),
(-1, 118, '0'),
(-1, 119, ''),
(-1, 120, '0'),
(-1, 121, '1'),
(-1, 122, '1'),
(-1, 123, '1'),
(-1, 124, '0'),
(-1, 125, '1'),
(-1, 126, '1'),
(-1, 127, '1'),
(-1, 128, '1'),
(-1, 129, ''),
(-1, 130, 'album,ep,live,single'),
(-1, 131, '1'),
(-1, 132, '10'),
(-1, 133, '0'),
(-1, 134, '1'),
(-1, 135, '1'),
(-1, 136, ''),
(-1, 137, ''),
(-1, 138, ''),
(-1, 139, '0'),
(-1, 140, '0'),
(-1, 141, 'dark'),
(-1, 142, ''),
(-1, 143, ''),
(-1, 96, ''),
(-1, 97, ''),
(-1, 98, ''),
(-1, 144, '10'),
(-1, 145, '1'),
(1, 1, '1'),
(1, 4, '10'),
(1, 19, '32'),
(1, 22, 'CodeXMusic :: Para quem é Apaixonado por Música'),
(1, 41, 'mpd'),
(1, 29, 'web_player'),
(1, 31, 'pt_BR'),
(1, 32, 'm3u'),
(1, 33, 'reborn'),
(1, 51, '50'),
(1, 40, '100'),
(1, 44, '1'),
(1, 45, '1'),
(1, 46, '1'),
(1, 47, '7'),
(1, 52, '8192'),
(1, 53, 'default'),
(1, 55, 'default'),
(1, 69, '0'),
(1, 70, '0'),
(1, 71, '0'),
(1, 72, '0'),
(1, 77, ''),
(1, 78, ''),
(1, 102, '0'),
(1, 123, '1'),
(1, 82, '1'),
(1, 83, 'default'),
(1, 84, '1'),
(1, 85, '1'),
(1, 88, '1'),
(1, 89, '1'),
(1, 90, '1'),
(1, 91, '1'),
(1, 92, '1'),
(1, 93, '1'),
(1, 94, '0'),
(1, 96, '1570376078'),
(1, 97, '5.0.0-pre-release'),
(1, 98, '1'),
(1, 99, '1'),
(1, 100, '1'),
(1, 101, '0'),
(1, 104, '0'),
(1, 105, '0'),
(1, 106, '0'),
(1, 107, '0'),
(1, 108, '0'),
(1, 109, '0'),
(1, 110, '0'),
(1, 111, '1'),
(1, 121, '1'),
(1, 122, '1'),
(1, 124, '0'),
(1, 125, '1'),
(1, 126, '1'),
(1, 127, '1'),
(1, 128, '1'),
(1, 129, ''),
(1, 130, 'album,ep,live,single'),
(1, 131, '1'),
(1, 132, '10'),
(1, 133, '0'),
(1, 134, '1'),
(1, 136, ''),
(1, 137, ''),
(1, 138, ''),
(1, 140, '0'),
(1, 141, 'dark'),
(-1, 146, '1'),
(-1, 147, '0'),
(-1, 148, '0'),
(-1, 149, '1'),
(-1, 150, '0'),
(-1, 151, ''),
(-1, 152, ''),
(-1, 153, ''),
(1, 146, '1'),
(1, 149, '1'),
(1, 150, '0'),
(1, 151, ''),
(1, 152, ''),
(1, 153, ''),
(2, 1, '1'),
(2, 4, '10'),
(2, 19, '32'),
(2, 22, 'Ampache :: For the love of Music'),
(2, 41, 'mpd'),
(2, 29, 'web_player'),
(2, 31, 'pt_BR'),
(2, 32, 'm3u'),
(2, 33, 'reborn'),
(2, 51, '50'),
(2, 40, '100'),
(2, 44, '1'),
(2, 45, '1'),
(2, 46, '1'),
(2, 47, '7'),
(2, 52, '8192'),
(2, 53, 'default'),
(2, 55, 'default'),
(2, 69, '0'),
(2, 70, '0'),
(2, 71, '0'),
(2, 72, '0'),
(2, 77, ''),
(2, 78, ''),
(2, 102, '0'),
(2, 123, '1'),
(2, 82, '1'),
(2, 83, 'default'),
(2, 84, '0'),
(2, 85, '1'),
(2, 88, '1'),
(2, 89, '1'),
(2, 90, '1'),
(2, 91, '1'),
(2, 92, '1'),
(2, 93, '1'),
(2, 94, '0'),
(2, 96, ''),
(2, 97, ''),
(2, 98, ''),
(2, 99, '0'),
(2, 100, '1'),
(2, 101, '0'),
(2, 104, '0'),
(2, 105, '0'),
(2, 106, '0'),
(2, 107, '0'),
(2, 108, '0'),
(2, 109, '0'),
(2, 110, '0'),
(2, 111, '1'),
(2, 121, '1'),
(2, 122, '1'),
(2, 124, '0'),
(2, 125, '1'),
(2, 126, '1'),
(2, 127, '1'),
(2, 128, '1'),
(2, 129, ''),
(2, 130, 'album,ep,live,single'),
(2, 131, '1'),
(2, 132, '10'),
(2, 133, '0'),
(2, 134, '1'),
(2, 136, ''),
(2, 137, ''),
(2, 138, ''),
(2, 140, '0'),
(2, 141, 'dark'),
(2, 146, '1'),
(2, 149, '1'),
(2, 150, '0'),
(2, 151, ''),
(2, 152, ''),
(2, 153, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_pvmsg`
--

CREATE TABLE `user_pvmsg` (
  `id` int(11) UNSIGNED NOT NULL,
  `subject` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `message` text CHARACTER SET utf8,
  `from_user` int(11) UNSIGNED NOT NULL,
  `to_user` int(11) UNSIGNED NOT NULL,
  `is_read` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `creation_date` int(11) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_shout`
--

CREATE TABLE `user_shout` (
  `id` int(11) UNSIGNED NOT NULL,
  `user` int(11) NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `date` int(11) UNSIGNED NOT NULL,
  `sticky` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `object_id` int(11) UNSIGNED NOT NULL,
  `object_type` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `data` varchar(256) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_vote`
--

CREATE TABLE `user_vote` (
  `user` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `date` int(11) UNSIGNED NOT NULL,
  `sid` varchar(256) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `video`
--

CREATE TABLE `video` (
  `id` int(11) UNSIGNED NOT NULL,
  `file` varchar(4096) CHARACTER SET utf8 DEFAULT NULL,
  `catalog` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `video_codec` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `audio_codec` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `resolution_x` mediumint(8) UNSIGNED NOT NULL,
  `resolution_y` mediumint(8) UNSIGNED NOT NULL,
  `time` int(11) UNSIGNED NOT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `mime` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `addition_time` int(11) UNSIGNED NOT NULL,
  `update_time` int(11) UNSIGNED DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `played` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `release_date` int(11) DEFAULT NULL,
  `channels` mediumint(9) DEFAULT NULL,
  `bitrate` mediumint(8) DEFAULT NULL,
  `video_bitrate` mediumint(8) DEFAULT NULL,
  `display_x` mediumint(8) DEFAULT NULL,
  `display_y` mediumint(8) DEFAULT NULL,
  `frame_rate` float DEFAULT NULL,
  `mode` enum('abr','vbr','cbr') CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `wanted`
--

CREATE TABLE `wanted` (
  `id` int(11) UNSIGNED NOT NULL,
  `user` int(11) NOT NULL,
  `artist` int(11) DEFAULT NULL,
  `artist_mbid` varchar(1369) CHARACTER SET utf8 DEFAULT NULL,
  `mbid` varchar(36) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `date` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `accepted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_list`
--
ALTER TABLE `access_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `start` (`start`),
  ADD KEY `end` (`end`),
  ADD KEY `level` (`level`),
  ADD KEY `enabled` (`enabled`);

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `year` (`year`),
  ADD KEY `disk` (`disk`);
ALTER TABLE `album` ADD FULLTEXT KEY `name_2` (`name`);

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);
ALTER TABLE `artist` ADD FULLTEXT KEY `name_2` (`name`);

--
-- Indexes for table `bookmark`
--
ALTER TABLE `bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `broadcast`
--
ALTER TABLE `broadcast`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enabled` (`enabled`);

--
-- Indexes for table `catalog_local`
--
ALTER TABLE `catalog_local`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catalog_remote`
--
ALTER TABLE `catalog_remote`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `channel`
--
ALTER TABLE `channel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clip`
--
ALTER TABLE `clip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `daap_session`
--
ALTER TABLE `daap_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `democratic`
--
ALTER TABLE `democratic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `level` (`level`),
  ADD KEY `primary_2` (`primary`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `object_type` (`object_type`),
  ADD KEY `object_id` (`object_id`);

--
-- Indexes for table `ip_history`
--
ALTER TABLE `ip_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`user`),
  ADD KEY `date` (`date`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `label`
--
ALTER TABLE `label`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `label_asso`
--
ALTER TABLE `label_asso`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `license`
--
ALTER TABLE `license`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `live_stream`
--
ALTER TABLE `live_stream`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catalog` (`catalog`),
  ADD KEY `genre` (`genre`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `localplay_httpq`
--
ALTER TABLE `localplay_httpq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `localplay_mpd`
--
ALTER TABLE `localplay_mpd`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `localplay_shoutcast`
--
ALTER TABLE `localplay_shoutcast`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `metadata`
--
ALTER TABLE `metadata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field` (`field`),
  ADD KEY `object_id` (`object_id`),
  ADD KEY `type` (`type`),
  ADD KEY `objecttype` (`object_id`,`type`),
  ADD KEY `objectfield` (`object_id`,`field`,`type`);

--
-- Indexes for table `metadata_field`
--
ALTER TABLE `metadata_field`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `now_playing`
--
ALTER TABLE `now_playing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `object_count`
--
ALTER TABLE `object_count`
  ADD PRIMARY KEY (`id`),
  ADD KEY `object_type` (`object_type`),
  ADD KEY `object_id` (`object_id`),
  ADD KEY `userid` (`user`),
  ADD KEY `date` (`date`);

--
-- Indexes for table `personal_video`
--
ALTER TABLE `personal_video`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `player_control`
--
ALTER TABLE `player_control`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `playlist_data`
--
ALTER TABLE `playlist_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `playlist` (`playlist`);

--
-- Indexes for table `podcast`
--
ALTER TABLE `podcast`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `podcast_episode`
--
ALTER TABLE `podcast_episode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `preference`
--
ALTER TABLE `preference`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catagory` (`catagory`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_rating` (`user`,`object_type`,`object_id`),
  ADD KEY `object_id` (`object_id`);

--
-- Indexes for table `recommendation`
--
ALTER TABLE `recommendation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recommendation_item`
--
ALTER TABLE `recommendation_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search`
--
ALTER TABLE `search`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expire` (`expire`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `session_remember`
--
ALTER TABLE `session_remember`
  ADD PRIMARY KEY (`username`,`token`);

--
-- Indexes for table `session_stream`
--
ALTER TABLE `session_stream`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `share`
--
ALTER TABLE `share`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `song`
--
ALTER TABLE `song`
  ADD PRIMARY KEY (`id`),
  ADD KEY `album` (`album`),
  ADD KEY `artist` (`artist`),
  ADD KEY `file` (`file`(333)),
  ADD KEY `update_time` (`update_time`),
  ADD KEY `addition_time` (`addition_time`),
  ADD KEY `catalog` (`catalog`),
  ADD KEY `played` (`played`),
  ADD KEY `enabled` (`enabled`);
ALTER TABLE `song` ADD FULLTEXT KEY `title` (`title`);

--
-- Indexes for table `song_data`
--
ALTER TABLE `song_data`
  ADD UNIQUE KEY `song_id` (`song_id`);

--
-- Indexes for table `song_preview`
--
ALTER TABLE `song_preview`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stream_playlist`
--
ALTER TABLE `stream_playlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sid` (`sid`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `map_id` (`id`);

--
-- Indexes for table `tag_map`
--
ALTER TABLE `tag_map`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_tag_map` (`object_id`,`object_type`,`user`,`tag_id`);

--
-- Indexes for table `tag_merge`
--
ALTER TABLE `tag_merge`
  ADD PRIMARY KEY (`tag_id`,`merged_to`),
  ADD KEY `merged_to` (`merged_to`);

--
-- Indexes for table `tmp_browse`
--
ALTER TABLE `tmp_browse`
  ADD PRIMARY KEY (`sid`,`id`);

--
-- Indexes for table `tmp_playlist`
--
ALTER TABLE `tmp_playlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session` (`session`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `tmp_playlist_data`
--
ALTER TABLE `tmp_playlist_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tmp_playlist` (`tmp_playlist`);

--
-- Indexes for table `tvshow`
--
ALTER TABLE `tvshow`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tvshow_episode`
--
ALTER TABLE `tvshow_episode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tvshow_season`
--
ALTER TABLE `tvshow_season`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `update_info`
--
ALTER TABLE `update_info`
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_activity`
--
ALTER TABLE `user_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_catalog`
--
ALTER TABLE `user_catalog`
  ADD KEY `user` (`user`),
  ADD KEY `catalog` (`catalog`);

--
-- Indexes for table `user_flag`
--
ALTER TABLE `user_flag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_userflag` (`user`,`object_type`,`object_id`),
  ADD KEY `object_id` (`object_id`);

--
-- Indexes for table `user_follower`
--
ALTER TABLE `user_follower`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_preference`
--
ALTER TABLE `user_preference`
  ADD KEY `user` (`user`),
  ADD KEY `preference` (`preference`);

--
-- Indexes for table `user_pvmsg`
--
ALTER TABLE `user_pvmsg`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_shout`
--
ALTER TABLE `user_shout`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sticky` (`sticky`),
  ADD KEY `date` (`date`),
  ADD KEY `user` (`user`);

--
-- Indexes for table `user_vote`
--
ALTER TABLE `user_vote`
  ADD KEY `user` (`user`),
  ADD KEY `object_id` (`object_id`),
  ADD KEY `date` (`date`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`),
  ADD KEY `file` (`file`(333)),
  ADD KEY `enabled` (`enabled`),
  ADD KEY `title` (`title`),
  ADD KEY `addition_time` (`addition_time`),
  ADD KEY `update_time` (`update_time`);

--
-- Indexes for table `wanted`
--
ALTER TABLE `wanted`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_wanted` (`user`,`artist`,`mbid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_list`
--
ALTER TABLE `access_list`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookmark`
--
ALTER TABLE `bookmark`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `broadcast`
--
ALTER TABLE `broadcast`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `catalog_local`
--
ALTER TABLE `catalog_local`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `catalog_remote`
--
ALTER TABLE `catalog_remote`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `channel`
--
ALTER TABLE `channel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `daap_session`
--
ALTER TABLE `daap_session`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `democratic`
--
ALTER TABLE `democratic`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ip_history`
--
ALTER TABLE `ip_history`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `label`
--
ALTER TABLE `label`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `label_asso`
--
ALTER TABLE `label_asso`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `license`
--
ALTER TABLE `license`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `live_stream`
--
ALTER TABLE `live_stream`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `localplay_httpq`
--
ALTER TABLE `localplay_httpq`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `localplay_mpd`
--
ALTER TABLE `localplay_mpd`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `localplay_shoutcast`
--
ALTER TABLE `localplay_shoutcast`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `metadata`
--
ALTER TABLE `metadata`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `metadata_field`
--
ALTER TABLE `metadata_field`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `object_count`
--
ALTER TABLE `object_count`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_control`
--
ALTER TABLE `player_control`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `playlist`
--
ALTER TABLE `playlist`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `playlist_data`
--
ALTER TABLE `playlist_data`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `podcast`
--
ALTER TABLE `podcast`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `podcast_episode`
--
ALTER TABLE `podcast_episode`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `preference`
--
ALTER TABLE `preference`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=465;

--
-- AUTO_INCREMENT for table `recommendation`
--
ALTER TABLE `recommendation`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recommendation_item`
--
ALTER TABLE `recommendation_item`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `search`
--
ALTER TABLE `search`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `share`
--
ALTER TABLE `share`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `song`
--
ALTER TABLE `song`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `song_preview`
--
ALTER TABLE `song_preview`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stream_playlist`
--
ALTER TABLE `stream_playlist`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=308;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `tag_map`
--
ALTER TABLE `tag_map`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23000;

--
-- AUTO_INCREMENT for table `tmp_browse`
--
ALTER TABLE `tmp_browse`
  MODIFY `id` int(13) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_playlist`
--
ALTER TABLE `tmp_playlist`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tmp_playlist_data`
--
ALTER TABLE `tmp_playlist_data`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tvshow`
--
ALTER TABLE `tvshow`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tvshow_season`
--
ALTER TABLE `tvshow_season`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_activity`
--
ALTER TABLE `user_activity`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_flag`
--
ALTER TABLE `user_flag`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_follower`
--
ALTER TABLE `user_follower`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_pvmsg`
--
ALTER TABLE `user_pvmsg`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_shout`
--
ALTER TABLE `user_shout`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wanted`
--
ALTER TABLE `wanted`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
