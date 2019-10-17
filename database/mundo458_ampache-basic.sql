-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 12-Out-2019 às 22:42
-- Versão do servidor: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ampache`
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
(115, 'upload_user_artist', '0', 'Upload: consider the user sender as the track''s artist', 75, 'boolean', 'system', 'upload'),
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
(148, 'catalog_check_duplicate', '0', 'Check library item at import time and don''t import duplicates', 100, 'boolean', 'system', 'catalog'),
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
('b0c03d4decb78937872d53339fc1c7b7', '', 1570937987, ' ', 0x00000000000000000000000000000001, 'stream', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', NULL, NULL, NULL),
('8080037b03573ac8d8a8299d4ede47fd', '', 1570937957, ' ', 0x00000000000000000000000000000001, 'stream', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', NULL, NULL, NULL),
('f2cd7aba9bfd0914885547550ee1eb27', '', 1570937954, ' ', 0x00000000000000000000000000000001, 'stream', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', NULL, NULL, NULL),
('3da4bbfbfcbdbce36d22d8e4e0ae0046', '', 1570937953, ' ', 0x00000000000000000000000000000001, 'stream', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', NULL, NULL, NULL),
('f6ed9a0c899102b39be7d4721d69686e', '', 1570937515, ' ', 0x00000000000000000000000000000001, 'stream', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', NULL, NULL, NULL),
('nn3atnjh3535tjvj1v4s5j2v65', 'codex', 1570934535, 'userdata|a:5:{s:7:"success";b:1;s:4:"type";s:5:"mysql";s:8:"username";s:5:"codex";s:3:"uid";i:1;s:11:"preferences";a:100:{s:8:"download";s:1:"1";s:17:"popular_threshold";s:2:"10";s:17:"transcode_bitrate";s:2:"32";s:10:"site_title";s:49:"CodeXMusic :: Para quem é Apaixonado por Música";s:10:"lock_songs";N;s:15:"force_http_play";N;s:20:"localplay_controller";s:3:"mpd";s:9:"play_type";s:10:"web_player";s:4:"lang";s:5:"pt_BR";s:13:"playlist_type";s:3:"m3u";s:10:"theme_name";s:5:"codex";s:12:"offset_limit";s:2:"50";s:15:"localplay_level";s:3:"100";s:21:"allow_stream_playback";s:1:"1";s:25:"allow_democratic_playback";s:1:"1";s:24:"allow_localplay_playback";s:1:"1";s:15:"stats_threshold";s:1:"7";s:10:"rate_limit";s:4:"8192";s:15:"playlist_method";s:7:"default";s:9:"transcode";s:7:"default";s:11:"show_lyrics";s:1:"0";s:10:"mpd_active";s:1:"0";s:12:"httpq_active";s:1:"0";s:16:"shoutcast_active";s:1:"0";s:17:"lastfm_grant_link";s:0:"";s:16:"lastfm_challenge";s:0:"";s:5:"share";s:1:"0";s:9:"ajax_load";s:1:"1";s:20:"now_playing_per_user";s:1:"1";s:10:"album_sort";s:7:"default";s:17:"show_played_times";s:1:"1";s:15:"song_page_title";s:1:"1";s:16:"subsonic_backend";s:1:"1";s:12:"plex_backend";N;s:15:"webplayer_flash";s:1:"1";s:15:"webplayer_html5";s:1:"1";s:23:"allow_personal_info_now";s:1:"1";s:26:"allow_personal_info_recent";s:1:"1";s:24:"allow_personal_info_time";s:1:"1";s:25:"allow_personal_info_agent";s:1:"1";s:8:"ui_fixed";s:1:"0";s:10:"autoupdate";s:1:"1";s:20:"autoupdate_lastcheck";s:10:"1570930308";s:22:"autoupdate_lastversion";s:17:"5.0.0-pre-release";s:26:"autoupdate_lastversion_new";s:1:"1";s:22:"webplayer_confirmclose";s:1:"1";s:19:"webplayer_pausetabs";s:1:"1";s:20:"stream_beautiful_url";s:1:"0";s:12:"share_expire";s:1:"7";s:14:"slideshow_time";s:1:"0";s:20:"broadcast_by_default";s:1:"0";s:21:"concerts_limit_future";s:1:"0";s:19:"concerts_limit_past";s:1:"0";s:11:"album_group";s:1:"0";s:7:"topmenu";s:1:"0";s:19:"demo_clear_sessions";s:1:"0";s:11:"show_donate";s:1:"1";s:14:"upload_catalog";s:2:"-1";s:12:"allow_upload";N;s:13:"upload_subdir";s:1:"1";s:18:"upload_user_artist";N;s:13:"upload_script";N;s:17:"upload_allow_edit";s:1:"1";s:12:"daap_backend";N;s:9:"daap_pass";N;s:12:"upnp_backend";N;s:11:"allow_video";s:1:"1";s:18:"album_release_type";s:1:"1";s:17:"direct_play_limit";s:1:"0";s:18:"home_moment_albums";s:1:"1";s:18:"home_moment_videos";s:1:"1";s:20:"home_recently_played";s:1:"1";s:16:"home_now_playing";s:1:"1";s:11:"custom_logo";s:0:"";s:23:"album_release_type_sort";s:20:"album,ep,live,single";s:14:"browser_notify";s:1:"1";s:22:"browser_notify_timeout";s:2:"10";s:11:"geolocation";s:1:"0";s:16:"webplayer_aurora";s:1:"1";s:19:"upload_allow_remove";s:1:"1";s:17:"custom_login_logo";s:0:"";s:14:"custom_favicon";s:0:"";s:18:"custom_text_footer";s:0:"";s:14:"webdav_backend";N;s:12:"notify_email";s:1:"0";s:11:"theme_color";s:4:"dark";s:31:"disabled_custom_metadata_fields";N;s:37:"disabled_custom_metadata_fields_input";N;s:12:"podcast_keep";s:2:"10";s:20:"podcast_new_download";s:1:"1";s:19:"libitem_contextmenu";s:1:"1";s:22:"upload_catalog_pattern";N;s:23:"catalog_check_duplicate";N;s:13:"browse_filter";s:1:"1";s:13:"sidebar_light";s:1:"0";s:17:"custom_blankalbum";s:0:"";s:17:"custom_blankmovie";s:0:"";s:20:"libitem_browse_alpha";s:0:"";s:10:"theme_path";s:13:"/themes/codex";s:14:"theme_css_base";a:1:{i:0;a:2:{i:0;s:11:"default.css";i:1;s:6:"screen";}}}}art_enabled|b:1;login|b:0;state|a:1:{s:11:"sidebar_tab";s:4:"home";}catalog|i:0;forms|a:1:{s:32:"13a9649e0ee7eeb4017fff2ec30cce87";a:2:{s:4:"name";s:17:"update_preference";s:6:"expire";i:1570934387;}}', 0x00000000000000000000000000000001, 'mysql', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', NULL, NULL, NULL),
('8e048da42229b6634e0304f221e08e6a', '', 1570937509, ' ', 0x00000000000000000000000000000001, 'stream', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', NULL, NULL, NULL);

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
(46, 'Rock''n''Roll', 0),
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
(2, 'nn3atnjh3535tjvj1v4s5j2v65', '{"base":"SELECT %%SELECT%% FROM `artist` ","filter":{"regex_not_match":""},"select":["`artist`.`name`"],"static":true,"simple":false,"start":0,"offset":50,"use_pages":true,"use_alpha":false,"grid_view":true,"type":"catalog","total":0}', '[]'),
(1, 'nn3atnjh3535tjvj1v4s5j2v65', '{"base":"SELECT %%SELECT%% FROM `artist` ","filter":{"regex_not_match":""},"select":["`artist`.`name`"],"static":true,"simple":false,"start":0,"offset":50,"use_pages":true,"use_alpha":false,"grid_view":true,"type":"catalog","total":0}', '[]');

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
(5, 'nn3atnjh3535tjvj1v4s5j2v65', 'user', 'song');

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
(1, 'codex', 'Marcelo Motta', 'admin@marcelomotta.com', 'www.marcelomotta.com', NULL, '909e717339aaaf6d682b6cb10789c4cc797597e18ab2124c99a93e36f80146c0', 100, 0, 1570930935, 1570372199, NULL, 'RJ', 'Arraial do Cabo', 1),
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
(1, 33, 'codex'),
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
(1, 96, '1570930308'),
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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
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
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
