<?php
/**
 * This file is part of the Tmdb PHP API created by Michael Roterman.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * @package Tmdb
 * @author Michael Roterman <michael@wtfz.net>
 * @copyright (c) 2013, Michael Roterman
 * @version 0.0.1
 */
namespace Tmdb\Model\Tv;

use Tmdb\Model\AbstractModel;
use Tmdb\Model\Collection\Changes;
use Tmdb\Model\Collection\CreditsCollection;
use Tmdb\Model\Collection\Images;
use Tmdb\Model\Collection\Videos;
use Tmdb\Model\Common\ExternalIds;
use Tmdb\Model\Common\GenericCollection;
use Tmdb\Model\Image\PosterImage;

/**
 * Class Season
 * @package Tmdb\Model\Tv
 */
class Season extends AbstractModel
{
    /**
     * @var \DateTime
     */
    private $airDate;

    /**
     * @var GenericCollection|Episode[]
     */
    private $episodes;

    /**
     * @var string
     */
    private $name;

    /**
     * @var string
     */
    private $overview;

    /**
     * @var integer
     */
    private $id;

    /**
     * @var string
     */
    private $posterPath;

    /**
     * @var integer
     */
    private $seasonNumber;

    /**
     * Credits
     *
     * @var CreditsCollection
     */
    protected $credits;

    /**
     * External Ids
     *
     * @var ExternalIds
     */
    protected $externalIds;

    /**
     * Images
     *
     * @var Images
     */
    protected $images;

    /**
     * @var PosterImage
     */
    protected $poster;

    /**
     * @var Videos
     */
    protected $videos;

    /**
     * @var \Tmdb\Model\Collection\Changes
     */
    protected $changes;

    /**
     * Properties that are available in the API
     *
     * These properties are hydrated by the ObjectHydrator, all the other properties are handled by the factory.
     *
     * @var array
     */
    public static $properties = [
        'air_date',
        'name',
        'overview',
        'id',
        'poster_path',
        'season_number'
    ];

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->credits     = new CreditsCollection();
        $this->externalIds = new ExternalIds();
        $this->images      = new Images();
        $this->episodes    = new GenericCollection();
        $this->videos      = new Videos();
        $this->changes     = new Changes();
    }

    /**
     * @param  \DateTime $airDate
     * @return $this
     */
    public function setAirDate($airDate)
    {
        $this->airDate = new \DateTime($airDate);

        return $this;
    }

    /**
     * @return \DateTime
     */
    public function getAirDate()
    {
        return $this->airDate;
    }

    /**
     * @param  GenericCollection $episodes
     * @return $this
     */
    public function setEpisodes($episodes)
    {
        $this->episodes = $episodes;

        return $this;
    }

    /**
     * @return GenericCollection|Episode[]
     */
    public function getEpisodes()
    {
        return $this->episodes;
    }

    /**
     * @param  int   $id
     * @return $this
     */
    public function setId($id)
    {
        $this->id = (int) $id;

        return $this;
    }

    /**
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param  string $name
     * @return $this
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @param  string $overview
     * @return $this
     */
    public function setOverview($overview)
    {
        $this->overview = $overview;

        return $this;
    }

    /**
     * @return string
     */
    public function getOverview()
    {
        return $this->overview;
    }

    /**
     * @param  string $posterPath
     * @return $this
     */
    public function setPosterPath($posterPath)
    {
        $this->posterPath = $posterPath;

        return $this;
    }

    /**
     * @return string
     */
    public function getPosterPath()
    {
        return $this->posterPath;
    }

    /**
     * @param  int   $seasonNumber
     * @return $this
     */
    public function setSeasonNumber($seasonNumber)
    {
        $this->seasonNumber = $seasonNumber;

        return $this;
    }

    /**
     * @return int
     */
    public function getSeasonNumber()
    {
        return $this->seasonNumber;
    }

    /**
     * @param  CreditsCollection $credits
     * @return $this
     */
    public function setCredits($credits)
    {
        $this->credits = $credits;

        return $this;
    }

    /**
     * @return CreditsCollection
     */
    public function getCredits()
    {
        return $this->credits;
    }

    /**
     * @param  ExternalIds $externalIds
     * @return $this
     */
    public function setExternalIds($externalIds)
    {
        $this->externalIds = $externalIds;

        return $this;
    }

    /**
     * @return ExternalIds
     */
    public function getExternalIds()
    {
        return $this->externalIds;
    }

    /**
     * @param  Images $images
     * @return $this
     */
    public function setImages($images)
    {
        $this->images = $images;

        return $this;
    }

    /**
     * @return Images
     */
    public function getImages()
    {
        return $this->images;
    }

    /**
     * @param  PosterImage $poster
     * @return $this
     */
    public function setPosterImage($poster)
    {
        $this->poster = $poster;

        return $this;
    }

    /**
     * @return PosterImage
     */
    public function getPosterImage()
    {
        return $this->poster;
    }

    /**
     * @param  Videos $videos
     * @return $this
     */
    public function setVideos($videos)
    {
        $this->videos = $videos;

        return $this;
    }

    /**
     * @return Videos
     */
    public function getVideos()
    {
        return $this->videos;
    }

    /**
     * @param  Changes $changes
     * @return $this
     */
    public function setChanges($changes)
    {
        $this->changes = $changes;

        return $this;
    }

    /**
     * @return Changes
     */
    public function getChanges()
    {
        return $this->changes;
    }
}
