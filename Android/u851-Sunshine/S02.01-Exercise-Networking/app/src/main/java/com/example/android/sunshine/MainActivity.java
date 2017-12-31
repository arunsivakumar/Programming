/*
 * Copyright (C) 2016 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.example.android.sunshine;

import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import com.example.android.sunshine.utilities.NetworkUtils;

import java.io.IOException;
import java.net.URL;

import static android.R.attr.button;

public class MainActivity extends AppCompatActivity {

    private TextView mWeatherTextView;
//    private EditText mLocationEditText;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_forecast);

        /*
         * Using findViewById, we get a reference to our TextView from xml. This allows us to
         * do things like set the text of the TextView.
         */
        mWeatherTextView = (TextView) findViewById(R.id.tv_weather_data);
//        mLocationEditText = (EditText) findViewById(R.id.et_user_input);


        loadweatherData();
        // TODO (4) Delete the dummy weather data. You will be getting REAL data from the Internet in this lesson.

        // TODO (3) Delete the for loop that populates the TextView with dummy data


        // TODO (9) Call loadWeatherData to perform the network request to get the weather
    }


    private void loadweatherData(){
        String userLocation = "Denver";
        URL weatherURL = NetworkUtils.buildUrl(userLocation);
        new WeatherQueryTask().execute(weatherURL);

    }

    // TODO (8) Create a method that will get the user's preferred location and execute your new AsyncTask and call it loadWeatherData

    // TODO (5) Create a class that extends AsyncTask to perform network requests
    public class WeatherQueryTask extends AsyncTask<URL,Void,String>{


        @Override
        protected void onPreExecute(){
            super.onPreExecute();
        }

        @Override
        protected String doInBackground(URL... params){
            URL weatherURL = params[0];
            String results = null;
            try{
                results = NetworkUtils.getResponseFromHttpUrl(weatherURL);
                System.out.print(results);

            }catch(IOException e){
                e.printStackTrace();
            }
            return results;
        }

        @Override
        protected void onPostExecute(String results){
         if(results != "" && results.equals("")){
             mWeatherTextView.setText(results);
         }else{
             //error
         }
        }
    }
    // TODO (6) Override the doInBackground method to perform your network requests
    // TODO (7) Override the onPostExecute method to display the results of the network request
}