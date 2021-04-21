class Main {
	public static int[] nextDay(int[] date){
		int monthDays;
		if(date[2]==2){
			boolean leap=false;
			if(date[3]%4==0){
				leap = true;
				if(date[3]%100==0){
					leap = false;
					if(date[3]%400==0){
						leap=true;
					}
				}
			}
			if(leap){
				monthDays=29;
			} else{
				monthDays=28;
			}
		} else if(date[1]==4||date[1]==6||date[1]==9||date[1]==11){
			monthDays=30;
		} else {
			monthDays=31;
		}
		if(date[0]==monthDays){
			date[0]=1;
			if(date[1]==12){
				date[1]=1;
				date[2]++;
			} else {
				date[1]++;
			}
		} else {
			date[0]++;
		}
		date[3]++;
		if(date[3]==8){
			date[3]=1;
		}
		return(date);
	}
	public static void main(String[] args) {
    int sundays=0;
	int[] currentDay = new int[4];
	currentDay[0]=1;
	currentDay[1]=1;
	currentDay[2]=1901;
	currentDay[3]=2;
	while(currentDay[2]!=2001){
		if(currentDay[0]==1&&currentDay[3]==7){
			sundays++;
		}
		currentDay=nextDay(currentDay);
	}
	System.out.println(sundays);
	}
}