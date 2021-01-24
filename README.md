# NoCorona

### Germ Tracker
Apps keep track of our steps; Apple map keeps track of everything including our “home,” “parking location,” etc. Pokemon Go. Rewards. Idek. 
Issue: people like me don’t wash their hands because subconsciously we don’t believe it's such a big deal. But in the phone age, notifications are what keeps us alive. Imagine driving somewhere (or walking, more realistic) and then coming home after long hours, then you get a buzz saying “yo, *insert info that incentivizes me and informs me of the importance of washing hands*. 

Kids are always being told to have good social media hygiene, but what about hygiene social media

Difficulties: 1) is there any way to somehow figure out “amount of germs” based on (miles?) (location?). 2) driving in a car versus walking. 
Nuances: 1) We can even have settings that change notifications 2) maybe we can connect to other users (like “most frequent washer,” “users in your community”) 3) if I reside at the Link, and there are other Link users, (if they allow it in their settings) the app can disclose where they traveled and if they wash their hands (accountability, if they allow such privacy intrusion). 

### Specifications:
- It should use location data
- It should track distance/time traveled to infer germs accumulated
- It should track frequently visited places (home)
- It should alert the user when they reach a frequently visited place
- It should distinguish between safe and possibly less safe activities-- (driving is pretty safe). 
- It should have a 
Home page with quick facts, germs accumulated since last handwash, and a handwash button  
‘Your data’ page with aggregated handwashing and germ accumulation data  
Notifications/settings page with personal configuration options  
  
### Tools:
- Flutter
- Maps API (Google or Apple)
- Firebase
- pubdev (workmanager, location)

### Further extensions:
- It could include a timer for hand-washing
- It could collect user data and inform the user if they were in a covid positive area

It could have two different options for people who feel uncomfortable with the app tracking location. One: a more accurate, location tracking option. And two: a less accurate, time-based option. (Counts the number of germs based on time since the last hand wash?)

### Contributions
Ben Wagrez:  
Luke Chen:  notifications
Melody Liu:  germ tracker
Orien Zhang:  UI, fact banners, 

### Resources
https://medium.com/@mx_tino/flutter-themes-9cebc0fecd1d
https://medium.com/vrt-digital-studio/flutter-workmanager-81e0cfbd6f6e
https://stackoverflow.com/questions/60262425/how-to-make-flutter-workmanager-plugin-and-location-plugin-work-together
https://mightytechno.com/flutter-app-bar/
https://www.geeksforgeeks.org/background-local-notifications-in-flutter/
https://medium.com/flutterdevs/local-push-notification-in-flutter-763605b84985
