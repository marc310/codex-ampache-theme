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
namespace Tmdb\Api;

/**
 * Class Genres
 * @package Tmdb\Api
 * @see http://docs.themoviedb.apiary.io/#genres
 */
class Genres extends AbstractApi
{
    /**
     * Get the list of genres, and return one by id
     *
     * @param  integer $id
     * @param  array   $parameters
     * @param  array   $headers
     * @return mixed
     */
    public function getGenre($id, array $parameters = [], array $headers = [])
    {
        $response = $this->getGenres($parameters, $headers);

        if (null !== $response && array_key_exists('genres', $response)) {
            return $this->extractGenreByIdFromResponse($id, $response['genres']);
        }

        return null;
    }

    /**
     * Get the list of genres.
     *
     * @param  array $parameters
     * @param  array $headers
     * @return mixed
     */
    public function getGenres(array $parameters = [], array $headers = [])
    {
        $data = array_merge_recursive(
            $this->getMovieGenres($parameters, $headers),
            $this->getTvGenres($parameters, $headers)
        );
        
        return $data;
    }

    /**
     * Get the list of movie genres.
     *
     * @param  array $parameters
     * @param  array $headers
     * @return mixed
     */
    public function getMovieGenres(array $parameters = [], array $headers = [])
    {
        return $this->get('genre/movie/list', $parameters, $headers);
    }

    /**
     * Get the list of TV genres.
     *
     * @param  array $parameters
     * @param  array $headers
     * @return mixed
     */
    public function getTvGenres(array $parameters = [], array $headers = [])
    {
        return $this->get('genre/tv/list', $parameters, $headers);
    }

    /**
     * Get the list of movies for a particular genre by id. By default, only movies with 10 or more votes are included.
     *
     * @param $genre_id
     * @param  array $parameters
     * @param  array $headers
     * @return mixed
     */
    public function getMovies($genre_id, array $parameters = [], array $headers = [])
    {
        return $this->get('genre/' . $genre_id . '/movies', $parameters, $headers);
    }

    /**
     * @param  integer $id
     * @param  array   $data
     * @return mixed
     */
    private function extractGenreByIdFromResponse($id, array $data = [])
    {
        foreach ($data as $genre) {
            if ($id == $genre['id']) {
                return $genre;
            }
        }

        return null;
    }
}
