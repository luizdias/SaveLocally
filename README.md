# SaveLocally

iOS Project dealing with Storyboards, AutoLayout, CoreData and TableViews.
by [Luiz Fernando Dias](http://www.linkedin.com/in/luizfernandodias)

### About

SaveLocally is an iOS App made for a Programming Test for ACTO, written in Swift.

## Instructions

1. Browse the git [repository](https://github.com/luizdias/SaveLocally)
2. Clone locally using `git clone https://github.com/luizdias/SaveLocally.git`
3. At the folder, double click the file **SaveLocally.xcodeproj** or, on your terminal window type `open SaveLocally.xcodeproj`
4. Press CMD + R to **Build and Run** the project on your selected device (or Simulator)
5. Press CMD + U to **Run Tests** on the Xcode

## Notes

I used iOS native APIs only in order to keep the project clean and easy to run.
In a enterprise and more guaranteed approach I could use CocoaPods (or Carthage) and integrate some well-known and stable lib for ex.: Realm.

## Worth mentioning

- I tried to focus on meeting all user requirements. Therefore, UI/UX were not really my main concern at this time;
- Some parts of the code could be divided into smaller parts and functions, although I tried to follow the _Clean Code_ principles;
- The code style is following Xcode original presets. But a code formatting tool could assure consistent styling through all codebase;
- Did not include Unit Tests, but definitely would use them on a enterprise project;
- In a enterprise app, user input handling code could be more robust and cover as many scenarios as possible, considering more cases like incorrect, invalid or missing values, for instance.
- Did not include code //comments on purpose, in order to keep things clean and let the code explain itself.
- Assuming ~Local file~ can also be an SQLite database, in this case I used CoreData, but it could also be a local sequential file, a JSON or a .plist
- Did not set an order to the comments saved on the database.

## Requirements

- Mac OS
- XCode 10.x
- Swift 4.2
