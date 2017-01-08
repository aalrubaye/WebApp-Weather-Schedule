package com.webapp.pkg;

import java.util.Calendar;
import java.util.Date;

import com.github.dvdme.ForecastIOLib.FIOCurrently;
import com.github.dvdme.ForecastIOLib.FIODaily;
import com.github.dvdme.ForecastIOLib.ForecastIO;

public class ForcastServer {
	
	private static final String apikey = "c518008b051ba9b4b70b7362d97a6e85";

	
	public static String weather(String city){
		
		String[] melbourne_geo_coordinates = {"28.0833333", "-80.6083333"};
		String[] orlando_geo_coordinates = {"28.5380556", "-81.3794444"};
		String[] tampa_geo_coordinates = {"27.9472222", "-82.4586111"};
		String[] miami_geo_coordinates = {"25.7738889", "-80.1938889"};
		
		ForecastIO fio = new ForecastIO(apikey);
		fio.setUnits(ForecastIO.UNITS_SI);
		fio.setLang(ForecastIO.LANG_ENGLISH);
		
		if (city.equals("Melbourne")) {
			fio.getForecast(melbourne_geo_coordinates[0] , melbourne_geo_coordinates[1]);
		}
		else
			if (city.equals("Orlando")) {
				fio.getForecast(orlando_geo_coordinates[0] , orlando_geo_coordinates[1]);
			}
			else
				if (city.equals("Tampa")) {
					fio.getForecast(tampa_geo_coordinates[0] , tampa_geo_coordinates[1]);
				}
				else
					if (city.equals("Miami")) {
						fio.getForecast(miami_geo_coordinates[0] , miami_geo_coordinates[1]);
					}
	
		
		
		
		//Currently data
		FIOCurrently currently = new FIOCurrently(fio);
		String [] f  = currently.get().getFieldsArray();
		
		String output = "";
		String summary="";
		String icon="";
		String today_summary = "";
		String today_temperature="";

		
		for(int i = 0; i<f.length;i++) {
			if (f[i].toString().equals("summary")) {
				summary = (currently.get().getByKey(f[i])).toString();
				today_summary = summary.substring(1, summary.length()-1);
				output += today_summary.toString()+",";//add today's condition to the output string
			} 
			else
				if (f[i].toString().equals("icon")) {
					icon = (currently.get().getByKey(f[i])).toString();
					icon = icon.substring(1, icon.length()-1);
					output += icon.toString()+",";//add today's condition to the output string
				} 
				else
					if (f[i].toString().equals("temperature")) {
						int temp_c = (int) Math.round(Double.parseDouble(currently.get().getByKey(f[i])));//today's temperature in C
						output += Integer.toString(temp_c)+",";
						int temp = (int) Math.round((Double.parseDouble(currently.get().getByKey(f[i])) * 9/5.0) +32);//Convert to Fahrenheit and round up the temperature to the closest integer 
						today_temperature = Integer.toString(temp);
						output += today_temperature+",";//add today's temperature to the output string
					}
		}

		
	    Calendar nowCal = Calendar.getInstance(); // a Calendar date
	    Date now = new Date(nowCal.getTimeInMillis()); // convert to Date
	    String [] arr = now.toString().split(" ", 2);
	    String today = arr[0];
	    String [] week = {"Mon","Tue","Wed","Thu","Fri","Sat","Sun"};
	    int T=0;
	    for (int i=0; i<week.length; i++){
	    	if (week[i].toString().equals(today.toString())){
	    		T = i;
	    	}
	    }
	    
	    
		//Daily forecast data (limited to show only 3 next days)
		FIODaily daily = new FIODaily(fio);		
		for(int i = 1; i<4; i++){
			String [] h = daily.getDay(i).getFieldsArray();
			output+=(week[(T+i) % 7])+",";//append the day's name to the output string
			for(int j=0; j<h.length; j++){
				
				if (h[j].toString().equals("summary")) {
					summary = (daily.getDay(i).getByKey(h[j])).toString();
					output+= summary.substring(1, summary.length()-1)+",";//appends the daily weather condition to the output string 
				} 
				else
					if (h[j].toString().equals("icon")) {
						icon = (daily.getDay(i).getByKey(h[j])).toString();
						output+= icon.substring(1, icon.length()-1)+",";//appends the related icon representing the condition					
					}
					else
						if (h[j].toString().equals("temperatureMin")){
							int temp_c = (int) Math.round(Double.parseDouble(daily.getDay(i).getByKey(h[j])));//today's temp in C
							output += Integer.toString(temp_c)+",";
							int temp = (int) Math.round((Double.parseDouble(daily.getDay(i).getByKey(h[j]))* 9/5.0) +32);//Convert to Fahrenheit and round up the min_temp to the closest integer
							output += Integer.toString(temp)+",";//appends the daily min_temp to the output string
						}
						else 
							if (h[j].toString().equals("temperatureMax")){
								int temp_c = (int) Math.round(Double.parseDouble(daily.getDay(i).getByKey(h[j])));//today's temp in C
								output += Integer.toString(temp_c)+",";
								int temp = (int) Math.round((Double.parseDouble(daily.getDay(i).getByKey(h[j]))* 9/5.0) +32);//Convert to Fahrenheit and round up the max_temp to the closest integer
								output += Integer.toString(temp)+",";//appends the daily max_temp to the output string
							}
			}

		}
		
		
		output = output.substring(0, output.length() - 1);
		
		return output;
		
	}//class_weather
		
	
	public static void main(String[] args) {
		
		//example - check Melbourne's weather
		System.out.println(weather("Melbourne"));
	
	}//class_main

}//class_ForcastServer
