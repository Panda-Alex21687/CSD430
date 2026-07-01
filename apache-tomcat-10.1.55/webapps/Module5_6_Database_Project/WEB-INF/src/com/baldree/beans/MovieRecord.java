package com.baldree.beans;

/*
 * Alexander Baldree
 * CSD430 Module 6 Assignment
 * MovieRecord.java
 * This JavaBean stores one movie record from the alex_movies_data table.
 */

import java.io.Serializable;

public class MovieRecord implements Serializable {
    private int movieId;
    private String title;
    private String genre;
    private int releaseYear;
    private String rating;
    private String director;

    public MovieRecord() {
    }

    public MovieRecord(int movieId, String title, String genre, int releaseYear, String rating, String director) {
        this.movieId = movieId;
        this.title = title;
        this.genre = genre;
        this.releaseYear = releaseYear;
        this.rating = rating;
        this.director = director;
    }

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public int getReleaseYear() {
        return releaseYear;
    }

    public void setReleaseYear(int releaseYear) {
        this.releaseYear = releaseYear;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }
}
