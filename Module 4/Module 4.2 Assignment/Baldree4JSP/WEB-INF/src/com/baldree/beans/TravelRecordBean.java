/*
 * Name: Alexander Baldree
 * Date: June 24, 2026
 * Assignment: CSD430 JavaBean Data Display Assignment
 * This JavaBean stores travel record data for display on a JSP page.
 */

package com.baldree.beans;

import java.io.Serializable;

public class TravelRecordBean implements Serializable {

    private static final long serialVersionUID = 1L;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    private String placeName;
    private String locationType;
    private String bestKnownFor;
    private String favoriteActivity;
    private int yearVisited;

    public TravelRecordBean() {
    }

    public TravelRecordBean(String placeName, String locationType, String bestKnownFor,
            String favoriteActivity, int yearVisited) {
        this.placeName = placeName;
        this.locationType = locationType;
        this.bestKnownFor = bestKnownFor;
        this.favoriteActivity = favoriteActivity;
        this.yearVisited = yearVisited;
    }

    public String getPlaceName() {
        return placeName;
    }

    public void setPlaceName(String placeName) {
        this.placeName = placeName;
    }

    public String getLocationType() {
        return locationType;
    }

    public void setLocationType(String locationType) {
        this.locationType = locationType;
    }

    public String getBestKnownFor() {
        return bestKnownFor;
    }

    public void setBestKnownFor(String bestKnownFor) {
        this.bestKnownFor = bestKnownFor;
    }

    public String getFavoriteActivity() {
        return favoriteActivity;
    }

    public void setFavoriteActivity(String favoriteActivity) {
        this.favoriteActivity = favoriteActivity;
    }

    public int getYearVisited() {
        return yearVisited;
    }

    public void setYearVisited(int yearVisited) {
        this.yearVisited = yearVisited;
    }
}