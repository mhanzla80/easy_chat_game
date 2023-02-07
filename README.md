# Easy Chat Game

[![pub package](https://img.shields.io/pub/v/easy_chat_game.svg?logo=dart&logoColor=00b9fc)](https://pub.dartlang.org/packages/easy_chat_game)
[![Last Commits](https://img.shields.io/github/last-commit/nooralibutt/easy_chat_game?logo=git&logoColor=white)](https://github.com/nooralibutt/easy_chat_game/commits/master)
[![Pull Requests](https://img.shields.io/github/issues-pr/nooralibutt/easy_chat_game?logo=github&logoColor=white)](https://github.com/nooralibutt/easy_chat_game/pulls)
[![Code size](https://img.shields.io/github/languages/code-size/nooralibutt/easy_chat_game?logo=github&logoColor=white)](https://github.com/nooralibutt/easy_chat_game)
[![License](https://img.shields.io/github/license/nooralibutt/easy_chat_game?logo=open-source-initiative&logoColor=green)](https://github.com/nooralibutt/easy_chat_game/blob/master/LICENSE)

**Show some 💙, 👍 the package & ⭐️ the repo to support the project**

## Features
- Support chat game for fun
- Support light & dark modes

## How to use
There are two ways to use Easy Wallpaper.


### 1: Stand-Alone App mode

```dart
EasyPrankCallApp.launchApp(
  title: 'Scary Teacher Prank',
  levels: ChatData.allLevels(),
  placementBuilder: _addPlacements,
  onTapEvent: _onTapEvent,
)
```

### 2: Add to Widget-Tree

```dart
EasyPrankCallApp(
  title: 'Scary Teacher Prank',
  levels: ChatData.allLevels(),
  placementBuilder: _addPlacements,
  onTapEvent: _onTapEvent,
)
```

## Additional Info

### Data Model
Prepare model list and pass it to the `EasyChatGameApp()` widget.

```dart

class ChatData {
  static List<ChatLevel> allLevels() {
    return [
      level1(),
      level2(),
      level3(),
    ];
  }

  static ChatLevel level1() {
    Map<String, List<String>> chatList = {};

    chatList[ChatLevel.botKey] = ['where were you yesterday?'];
    chatList['where were you yesterday?'] = [
      'My dog was sick?(Lie)',
      'Pirates kidnap me(Lie)'
    ];
    chatList['My dog was sick?(Lie)'] = ['You have a dog?'];
    chatList['Pirates kidnap me(Lie)'] = ['Pirates?! In Ohio?'];
    chatList['You have a dog?'] = [
      'No i just overslept(Truth)',
      'Her name is Cindy(Lie)'
    ];
    chatList['No i just overslept(Truth)'] = ['Okay enough you are expelled'];
    chatList['Her name is Cindy(Lie)'] = ['I love dogs but call me next time'];
    chatList['Pirates?! In Ohio?'] = [
      'Yes they are very dangerous',
      'Sounds weird.But it\'s true'
    ];
    chatList['Yes they are very dangerous'] = ['But you are free now. Right?'];
    chatList['Sounds weird.But it\'s true'] = ['But you are free now. Right?'];
    chatList['But you are free now. Right?'] = [
      'I escaped them',
      'they let me go'
    ];
    chatList['I escaped them'] = [
      'i don\'t really believe you! Meet me in my office'
    ];
    chatList['they let me go'] = ['Why?'];
    chatList['Why?'] = ['They were Scared of me', 'I made them my friends'];
    chatList['They were Scared of me'] = [
      'i don\'t really believe you! Meet me in my office'
    ];
    chatList['I made them my friends'] = ['uh, Okay'];
    return ChatLevel(
      levelName: 'Find excuse',
      botName: 'Scary Teacher',
      botImg: 'assets/kids/kid1.png',
      userImg: 'assets/kids/kid1.png',
      chatList: chatList,
      successMessages: [
        'I love dogs but call me next time',
        'Oh it\'s okay. Sorry for bothering you',
        'uh, Okay'
      ],
      failureMessages: [
        'Okay enough you are expelled',
        'i don\'t really believe you! Meet me in my office'
      ],
    );
  }

  static ChatLevel level2() {
    Map<String, List<String>> chatList = {};

    chatList[ChatLevel.userKey] = ['OMG!', 'Hey Teacher'];
    chatList['OMG!'] = ['What?'];
    chatList['Hey Teacher'] = ['What?'];
    chatList['What?'] = ['i had an accident', 'i got expelled from school'];
    chatList['i had an accident'] = ['What happened?'];
    chatList['What happened?'] = ['i burned my eyebrows', 'i crashed your car'];
    chatList['i burned my eyebrows'] = ['How? 😟'];

    chatList['How? 😟'] = ['During my fireshow', 'with flamethrower'];

    chatList['During my fireshow'] = ['You are Kidding me!!'];
    chatList['You are Kidding me!!'] = ['HAHA I pranked you'];
    chatList['with flamethrower'] = ['OMG! WHAT Now!?'];
    chatList['OMG! WHAT Now!?'] = ['Pranked'];
    chatList['i crashed your car'] = ['No you did not'];
    chatList['No you did not'] = ['How do you know', 'yes i did'];
    chatList['How do you know'] = ['Because i am sitting in it now'];
    chatList['yes i did'] = ['Because i am sitting in it now'];
    chatList['i got expelled from school'] = ['How?'];
    chatList['How?'] = ['I escaped from there', 'i beat up another teacher'];
    chatList['I escaped from there'] = ['Why?'];
    chatList['i beat up another teacher'] = ['Why? 😡'];
    chatList['Why?'] = ['He was rude', 'He gave me F'];
    chatList['Why? 😡'] = ['I hate it there', 'I was so bored'];
    chatList['He was rude'] = ['come to my office Now! I am so angry at you!!'];
    chatList['He gave me F'] = [
      'come to my office Now! I am so angry at you!!'
    ];
    chatList['I hate it there'] = [
      'come to my office Now! I am so angry at you!!'
    ];
    chatList['I was so bored'] = [
      'come to my office Now! I am so angry at you!!'
    ];
    chatList['come to my office Now! I am so angry at you!!'] = [
      'hehehe PRANKED😂'
    ];
    chatList['hehehe PRANKED😂'] = ['Thank GOD'];
    return ChatLevel(
      levelName: 'Prank Teacher!',
      botName: 'Teacher',
      botImg: 'assets/kids/kid1.png',
      userImg: 'assets/kids/kid7.png',
      chatList: chatList,
      successMessages: ['HAHA I pranked you', 'Pranked', 'Thank GOD'],
      failureMessages: [
        'Because i am sitting in it now',
      ],
    );
  }

  static ChatLevel level3() {
    Map<String, List<String>> chatList = {};

    chatList[ChatLevel.userKey] = ['Hello Teacher!'];
    chatList['Hello Teacher!'] = ['What do you want?'];
    chatList['What do you want?'] = ['Nothing', 'Go out with you 😊😘'];
    chatList['Nothing'] = ['Leave me alone'];
    chatList['Go out with you 😊😘'] = ['really'];
    chatList['really'] = ['Yes, you seem really cool', 'no lol 😂'];
    chatList['no lol 😂'] = ['son of a biscuit!..'];
    chatList['Yes, you seem really cool'] = ['you are also kinda cute'];
    chatList['you are also kinda cute'] = [
      'Will you marry me? 😍',
      'Wanna hang out?'
    ];
    chatList['Will you marry me? 😍'] = [
      'No, You are my student. Are you crazy?'
    ];
    chatList['Wanna hang out?'] = ['yes!'];
    return ChatLevel(
      levelName: 'Ask her out',
      botName: 'Pretty Teacher',
      botImg: 'assets/kids/kid6.png',
      userImg: 'assets/kids/kid4.png',
      chatList: chatList,
      successMessages: ['yes!'],
      failureMessages: [
        'Leave me alone',
        'No, You are my student. Are you crazy?',
        'son of a biscuit!..'
      ],
    );
  }
}
```

See [Example](https://pub.dev/packages/easy_chat_game/example) for better understanding.

## Authors
##### Noor Ali Butt
[![GitHub Follow](https://img.shields.io/badge/Connect--blue.svg?logo=Github&longCache=true&style=social&label=Follow)](https://github.com/nooralibutt) [![LinkedIn Link](https://img.shields.io/badge/Connect--blue.svg?logo=linkedin&longCache=true&style=social&label=Connect
)](https://www.linkedin.com/in/nooralibutt)
##### Hanzla Waheed
[![GitHub Follow](https://img.shields.io/badge/Connect--blue.svg?logo=Github&longCache=true&style=social&label=Follow)](https://github.com/mhanzla80) [![LinkedIn Link](https://img.shields.io/badge/Connect--blue.svg?logo=linkedin&longCache=true&style=social&label=Connect
)](https://www.linkedin.com/in/mhanzla80)