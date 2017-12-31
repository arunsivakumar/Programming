package com.example.android.quakereport;

/**
 * Created by Arun Sivakumar on 7/1/17.
 */

public class Earthquake {

    private double mMaginitude;
    private String mLocation;
    private long mTimeInMilliseconds;
    private String mURL;

    public Earthquake(double magnitude, String location, long timeInMilliseconds,String url) {
        mMaginitude = magnitude;
        mLocation = location;
        mTimeInMilliseconds = timeInMilliseconds;
        mURL = url;
    }



    public double getMaginitude() {
        return mMaginitude;
    }

    public String getLocation() {
        return mLocation;
    }

//    public String getDate() {
//        return mDate;
////    }

    public long getTimeInMilliseconds() {
        return mTimeInMilliseconds;
    }

    public String getURL() {
        return mURL;
    }
}


