# GitHub Repo Viewer

Production-grade project developed during the Reso Coder Academy Flutter Bootcamp.

It's a mobile Github repository viewer

More info at Reso Coder or at Reso Coder Academy

![WhatsApp Image 2023-09-26 at 16 24 16](https://github.com/karthik14344/Repository-Viewer/assets/130294636/03978403-d8f4-4b53-825e-a1bf47e9d74e) ![WhatsApp Image 2023-09-26 at 16 24 16](https://github.com/karthik14344/Repository-Viewer/assets/130294636/ef68ece1-6107-42a1-b968-a17e565cd8c4)
![WhatsApp Image 2023-09-26 at 16 24 17](https://github.com/karthik14344/Repository-Viewer/assets/130294636/b6232207-ae01-4dbb-952c-e9ff25dcad8b)

## How to Start

Step 1:

Download or clone this repo by using the link below:
(https://github.com/karthik14344/Repository-Viewer.git)

Step 2:

Go to project root and execute the following command in console to get the required dependencies:

flutter pub get

Step 3:

This project uses libraries that works with code generation, execute the following command to generate files:

flutter packages pub run build_runner build --delete-conflicting-outputs
or watch command in order to keep the source code synced automatically:

flutter packages pub run build_runner watch
Step 4:

Create an Github OAuth App on Github Settings|Developer settings|OAuth Apps with http://localhost:8080 as Homepage URL

Save the CLIENT_ID and CLIENT_SECRET in a .env file (see .env.sample file as example)

## Code Snippets
## Upgrade pubspec.yaml
make upgrade
## Build iOS
make build_ios_mobile
## Build and watch automatic code generation
flutter pub run build_runner watch --delete-conflicting-outputs
