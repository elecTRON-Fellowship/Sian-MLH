

## Inspiration🌠
Since the start of the pandemic, everyone has been living inside their homes. With all the travel restrictions, many tourist spots which used to be flooded with tourists all across the world have suddenly become empty with little to no visitors. **This has not only affected the tourism sector of different regions but has also affected the local businesses** that were dependent on the tourism sector for their daily livelihood. We saw this as a problem and to tackle it, we built Sian.

## What it does🚀

Sian is one of a kind mobile application— **A gamified tourism app**, that helps not only in promoting tourism in the most fun way possible but also helps in supporting those for whom tourism is the life support. 
People love traveling, and people love taking lots and lots of selfies! Sian leverages just these two things in a bid to revolutionize and revive the tourism industry. We reward our users with reward points for visiting some of the popular tourist destinations in the world. These reward points can then be exchanged for discounts and gift cards at our partner stores, thus empowering businesses. 

A user can log in to the application using our regular authentication method but to make things even easier we also have **Google authentication** that helps in saving up time for the user by 1-tap logins. 

Once logged in, Sian unlocks a whole set of functionalities for the user! 

* We know how difficult planning and keeping track of your trips can get. The **Google Calendar** integration allows the users to plan their travels right from the app. 
* The in-app **Google Map**, with some of the most popular tourist destinations marked on it, lets the users find their way to the tourist destination that they wish to visit. A single tap on the navigation button guides the users to their desired location with proper directions and in no time. 
* The locations on the map are dynamically fetched from **Firebase Cloud Firestore**, which means we can add/remove more locations in the future without making changes to the app code.
* Once the user is at a place, they can use our application to either click a selfie or click a picture of their surroundings and share it on social media platforms with their family and friends. 

Every time the user shares clicks and shares images, they receive some reward points. These reward points can be later redeemed in our redeem section that gives the users discount coupons to the partner local hotels and cafes, which they can redeem to have a comfortable stay and that too at an affordable price. This also helps the local businesses around the place! *Win-Win!*

## How we built it🔨
![image](https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white)  ![image](https://img.shields.io/badge/adobe-%23FF0000.svg?style=for-the-badge&logo=adobe&logoColor=white)  ![image](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)  ![image](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)  ![image](https://img.shields.io/badge/Google%20Cloud-4285F4?style=for-the-badge&logo=google-cloud&logoColor=white)  ![image](https://img.shields.io/badge/firebase-%23039BE5.svg?style=for-the-badge&logo=firebase)  ![image](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white) </br>
We started off by creating a prototype in **Figma**. The mobile application was built using **Flutter** and Dart. We made use of **Firebase** for authentication and for saving user data. We made use of **Google Maps SDK** to integrate a map in our application. We used the Flutter Camera module to capture and share images on social media. We also used Flutter module and the **Calender SDK** to add a calendar and for adding events to it in the application. All in all, Sian relies heavily on **Google Could** and the suite of SDKs and functionalities it provides to deliver our users a feature-rich experience.


## Challenges we ran into🔴
We ran into some problems with authentication as connecting applications with firebase can be troublesome sometimes. Flutter still being a little new to all of us, we faced some issues with the compatibility of the app with different devices and had to spend a lot of time fixing that.
The app uses multiple functionalities, and integrating those for the perfect UX was a challenge in itself.

## Accomplishments that we're proud of🎖
We were able to create our proper authentication system along with Google Auth which we had never really tried before. We also explored Firestore in a deep way and got to understand how a few things worked a particular way. Getting the camera and the maps module to work was tough but we were successful in making it work.

## What we learned📚
We got more experience in flutter and firebase by building this application.  Got to learn about different authentication systems and how everything interacts in the flutter application during auth. We also got to learn about various flutter modules that came in handy while building Sian. We also wished to integrate smart contracts in the app and hence got a chance to work around with solidity as well.

## What's next for Sian🎉
The current point system that we have is dynamic but we would love to introduce smart contracts into the application to make the whole experience even more rewarding.

