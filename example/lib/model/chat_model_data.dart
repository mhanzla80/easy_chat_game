import 'package:easy_chat_game/easy_chat_game.dart';

class ChatData {
  static List<ChatLevel> allLevels() {
    return [
      level1(),
      level2(),
      level3(),
      level4(),
      level5(),
      level6(),
      level7(),
      level8(),
      level9(),
      level10(),
      level1(),
      level2(),
      level3(),
      level4(),
      level5(),
      level6(),
      level7(),
      level8(),
      level9(),
      level10(),
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

  static ChatLevel level4() {
    Map<String, List<String>> chatList = {};

    chatList[ChatLevel.userKey] = ['are you hiring?'];
    chatList['are you hiring?'] = ['What do you want to do?'];
    chatList['What do you want to do?'] = ['teaching kids', 'teaching grads'];
    chatList['teaching grads'] = ['it is a bit risky know'];
    chatList['teaching kids'] = ['that\'s a really dangerous job!'];
    chatList['that\'s a really dangerous job!'] = [
      'why?',
      'is teaching grads is safer?'
    ];
    chatList['why?'] = ['the last teacher was beaten'];
    chatList['the last teacher was beaten'] = [
      'Uff.I\'ll do something else',
      'I\'m not scared 😎'
    ];
    chatList['Uff.I\'ll do something else'] = ['You can teach the kids'];
    chatList['You can teach the kids'] = ['That\'s great!'];
    chatList['That\'s great!'] = ['it is a bit risky you know'];
    chatList['it is a bit risky you know'] = ['Why?'];
    chatList['Why?'] = ['Grads burnt car of the last guy.'];
    chatList['Grads burnt car of the last guy.'] = [
      'I changed my mind...',
      'Do I get good salary'
    ];
    chatList['I changed my mind...'] = ['okay...'];
    chatList['Do I get good salary'] = ['500\$ month. No health insurance'];
    chatList['I\'m not scared 😎'] = ['700\$ month.No health insurance'];
    chatList['700\$ month.No health insurance'] = [
      'I take it',
      'I need better offer'
    ];
    chatList['I take it'] = ['Good! see you monday'];
    chatList['I need a better offer'] = ['Why? 🙄'];
    chatList['Why? 🙄'] = ['It is dangerous 😵', 'I\'m really good with grads'];
    chatList['It is dangerous 😵'] = ['So what?'];
    chatList['So what?'] = ['I\'m not doing it! 😠', 'Ok I take the deal'];
    chatList['I\'m not doing it! 😠'] = ['okay...'];
    chatList['Ok I take the deal'] = ['Good! see you monday'];
    chatList['I\'m really good with grads'] = ['How good?'];
    chatList['How good?'] = [
      'I have two grads in my house',
      'I have seen grads documentary'
    ];
    chatList['I have two grads in my house'] = ['1000\$+health insurance'];
    chatList['I have seen grads documentary'] = ['1000\$+health insurance'];

    chatList['is teaching grads is safer?'] = [
      'Grads burnt car of the last guy.'
    ];
    chatList['Grads burnt car of the last guy.'] = [
      'I changed my mind...',
      'do i get a good salary?'
    ];

    chatList['it is a bit risky know'] = ['Why? 😒'];
    chatList['Why? 😒'] = ['Grads burnt car of the last guy.'];
    chatList['do i get a good salary?'] = ['500\$ month. No health insurance'];
    chatList['500\$ month. No health insurance'] = [
      'I need better offer',
      'Great! 😊'
    ];
    chatList['I need better offer'] = ['why? 🤔'];
    chatList['why? 🤔'] = [
      'I\'m best kids teacher in town 😎',
      'It is dangerous'
    ];
    chatList['It is dangerous'] = ['So What?'];
    chatList['So What?'] = ['I\'m not doing it! 😠', 'Ok i take the deal'];
    chatList['Ok i take the deal'] = ['see you monday'];
    chatList['I\'m best kids teacher in town 😎'] = [
      'How many kids you taught?'
    ];
    chatList['How many kids you taught?'] = ['1000', '100'];
    chatList['100'] = ['1000\$+health insurance'];
    chatList['1000'] = ['1000\$+health insurance'];
    chatList['1000\$+health insurance'] = ['Still not good'];
    chatList['Still not good'] = ['I can\'t give you a better offer'];
    chatList['I can\'t give you a better offer'] = [
      'Bye!',
      'Ok 1000\$ is good enough'
    ];
    chatList['Bye!'] = ['OK wait.1500\$'];
    chatList['OK wait.1500\$'] = ['Great😎'];
    chatList['Ok 1000\$ is good enough'] = ['Great😎'];
    chatList['Great😎'] = ['see you monday'];
    chatList['Great! 😊'] = ['see you monday'];

    return ChatLevel(
      levelName: 'Get Teachers Job',
      botName: 'School HR',
      botImg: 'assets/kids/kid5.png',
      userImg: 'assets/kids/kid1.png',
      chatList: chatList,
      successMessages: ['see you monday', 'Good! see you monday'],
      failureMessages: ['okay...', 'Okay...'],
    );
  }

  static ChatLevel level5() {
    Map<String, List<String>> chatList = {};

    chatList[ChatLevel.botKey] = ['Where are you?'];
    chatList['Where are you?'] = ['In school(Lie)', 'Party(Truth)'];
    chatList['In school(Lie)'] = ['No you are not it\'s 8 p.m'];
    chatList['No you are not it\'s 8 p.m'] = [
      'Ok. I\'m at the party(Truth)',
      'I\'m working on a project(Lie)'
    ];
    chatList['I\'m working on a project(Lie)'] = [
      'i don\'t believe you. I\'m driving there right now'
    ];
    chatList['Party(Truth)'] = ['Who is there with you?'];
    chatList['Randy(BAD KID 😈)'] = ['OMG! Coming there rn!'];
    chatList['Ok. I\'m at the party(Truth)'] = ['Who is there with you?'];
    chatList['Who is there with you?'] = ['Randy(BAD KID 😈)', 'Oliver(NERD)'];
    chatList['Oliver(NERD)'] = ['When are you coming home?'];
    chatList['When are you coming home?'] = [
      'I\'m on my way!(Lie)',
      'Morning, probably(Truth)'
    ];
    chatList['I\'m on my way!(Lie)'] = ['Okay honey i\'ll waiting for you'];
    chatList['Morning, probably(Truth)'] = ['Okay honey i\'ll waiting for you'];

    return ChatLevel(
      levelName: 'Calm down mom',
      botName: 'MOM',
      botImg: 'assets/kids/kid8.png',
      userImg: 'assets/kids/kid7.png',
      chatList: chatList,
      successMessages: ['Okay honey i\'ll waiting for you'],
      failureMessages: [
        'i don\'t believe you. I\'m driving there right now',
        'OMG! Coming there rn!'
      ],
    );
  }

  static ChatLevel level6() {
    Map<String, List<String>> chatList = {};

    chatList[ChatLevel.botKey] = ['let\'s do something crazy! 😛'];
    chatList['let\'s do something crazy! 😛'] = [
      'Like What? 😂',
      'What do you mean?'
    ];
    chatList['Like What? 😂'] = ['Adventure or something..'];
    chatList['What do you mean?'] = ['Adventure or something..'];
    chatList['Adventure or something..'] = ['Good idea', 'Great idea 😎'];
    chatList['Good idea'] = ['Do you have some ideas?'];
    chatList['Great idea 😎'] = ['Do you have some ideas?'];
    chatList['Do you have some ideas?'] = ['Let\'s go on a road trip'];
    chatList['Let\'s go on a road trip'] = ['Where? 😃'];
    chatList['Where? 😃'] = ['Canada', 'Slovakia'];
    chatList['Canada'] = ['Good but i Don\'t have a car...'];
    chatList['Slovakia'] = ['Where is Slovakia'];
    chatList['Good but i Don\'t have a car...'] = [
      'i\'ll take my dad\'s',
      'We can hitchhike'
    ];
    chatList['Where is Slovakia'] = ['In South East Asia', 'In middle Europe'];
    chatList['In middle Europe'] = ['So we need plane tickets right?'];
    chatList['So we need plane tickets right?'] = [
      'We\'ll go by a boat',
      'Yes sir!'
    ];
    chatList['In South East Asia'] = ['So we need plane tickets right?'];
    chatList['We\'ll go by a boat'] = ['Now this is an adventure! 😂'];
    chatList['Yes sir!'] = ['But i have no money 😢'];
    chatList['But i have no money 😢'] = [
      'we\'ll steal a plane',
      'we will find a job'
    ];
    chatList['we\'ll steal a plane'] = ['Now this is an adventure! 😂'];
    chatList['we will find a job'] = ['What job?'];
    chatList['What job?'] = [
      'We can be park rangers',
      'We can invest in stocks'
    ];
    chatList['We can be park rangers'] = ['sounds like a plan. I\'m in 🥳'];
    chatList['We can invest in stocks'] = ['No i don\'t have enough money😩'];

    chatList['i\'ll take my dad\'s'] = ['sounds like a plan. I\'m in 🥳'];
    chatList['We can hitchhike'] = ['Now this is an adventure! 😂'];

    return ChatLevel(
      levelName: 'Go on an adventure with teacher',
      botName: 'Teacher',
      botImg: 'assets/kids/kid1.png',
      userImg: 'assets/kids/kid7.png',
      chatList: chatList,
      successMessages: [
        'Now this is an adventure! 😂',
        'sounds like a plan. I\'m in 🥳'
      ],
      failureMessages: ['No i don\'t have enough money😩'],
    );
  }

  static ChatLevel level7() {
    Map<String, List<String>> chatList = {};

    chatList[ChatLevel.userKey] = ['Hi Al! 😎', 'Hello there'];
    chatList['Hi Al! 😎'] = ['Do we know each other?'];
    chatList['Hello there'] = ['Do we know each other?'];
    chatList['Do we know each other?'] = ['I want to play in your movie 😎'];
    chatList['I want to play in your movie 😎'] = ['What role can you play?'];
    chatList['What role can you play?'] = ['Sheriff', 'Bandit'];
    chatList['Sheriff'] = ['Okay. But you need to bring your own horse'];
    chatList['Bandit'] = ['Can you look scary?'];
    chatList['Okay. But you need to bring your own horse'] = [
      'What?!',
      'I don\'t have a horse'
    ];
    chatList['Can you look scary?'] = [
      'Strangers run away from me',
      'more ugly than scary'
    ];
    chatList['What?!'] = ['We don\'t have budget for a horse'];
    chatList['We don\'t have budget for a horse'] = ['I don\'t have a horse'];
    chatList['I don\'t have a horse'] = ['Then you can\'t play sheriff!'];
    chatList['Then you can\'t play sheriff!'] = [
      'Can i be a bandit?',
      'What else can i play?'
    ];
    chatList['Can i be a bandit?'] = ['Can you look scary?'];
    chatList['What else can i play?'] = ['you can be drunk jimmy'];

    chatList['Strangers run away from me'] = ['Very good see you on set! 😎'];
    chatList['more ugly than scary'] = ['That is not really good'];
    chatList['That is not really good'] = [
      'Sorry for bothering mister 😟',
      'Can i get another role?'
    ];
    chatList['Sorry for bothering mister 😟'] = ['Bye!'];
    chatList['Can i get another role?'] = ['you can be drunk jimmy'];
    chatList['you can be drunk jimmy'] = [
      'Sounds great maestro! 😃',
      'I don\'t want to be drunk jimmy'
    ];
    chatList['I don\'t want to be drunk jimmy'] = ['Stop bothering me 😠'];
    chatList['Sounds great maestro! 😃'] = ['Very good see you on set! 😎'];

    return ChatLevel(
      levelName: 'Get the Acting role',
      botName: 'Al',
      botImg: 'assets/kids/kid3.png',
      userImg: 'assets/kids/kid1.png',
      chatList: chatList,
      successMessages: ['Very good see you on set! 😎'],
      failureMessages: ['Stop bothering me 😠', 'Bye!'],
    );
  }

  static ChatLevel level8() {
    Map<String, List<String>> chatList = {};

    chatList[ChatLevel.botKey] = ['Hello student!'];
    chatList['Hello student!'] = ['Hi Teacher!', 'Hello 😃'];
    chatList['Hi Teacher!'] = ['I am looking for an investor'];
    chatList['Hello 😃'] = ['I am looking for an investor'];
    chatList['I am looking for an investor'] = [
      'What for?',
      'Well, look elsewhere'
    ];
    chatList['What for?'] = ['I got a million dollar idea!'];
    chatList['Well, look elsewhere'] = ['You\'ve got to hear me out!'];
    chatList['You\'ve got to hear me out!'] = [
      'No Sorry',
      'Okay what\'s the idea'
    ];
    chatList['No Sorry'] = [
      'You just missed once in a lifetime opportunity 🤯'
    ];
    chatList['Okay what\'s the idea'] = [
      'I\'m going to make pen that writes under water'
    ];
    chatList['I got a million dollar idea!'] = [
      'Not Interested',
      'What\'s the idea'
    ];
    chatList['Not Interested'] = [
      'You just missed once in a lifetime opportunity 🤯'
    ];
    chatList['What\'s the idea'] = [
      'I\'m going to make pen that writes under water'
    ];
    chatList['I\'m going to make pen that writes under water'] = [
      'that\'s pretty useless',
      'Great idea!'
    ];
    chatList['that\'s pretty useless'] = [
      'You just missed once in a lifetime opportunity 🤯'
    ];
    chatList['Great idea!'] = ['Yeah I know! 😎'];
    chatList['Yeah I know! 😎'] = ['How much do you need?', 'I am kidding 😂'];
    chatList['How much do you need?'] = ['100000\$'];
    chatList['100000\$'] = ['I can take a loan!', 'i don\'t have that much'];
    chatList['i don\'t have that much'] = ['How much do you have?'];
    chatList['How much do you have?'] = ['1000\$', '100\$'];
    chatList['100\$'] = ['that\'s too little 😒'];
    chatList['I am kidding 😂'] = [
      'You just missed once in a lifetime opportunity 🤯'
    ];
    chatList['I can take a loan!'] = [
      'That\'s great. We will be rich in no time. 😍'
    ];
    chatList['1000\$'] = ['That\'s great. We will be rich in no time. 😍'];

    return ChatLevel(
      levelName: 'Hear him out',
      botName: 'Scary Teacher',
      botImg: 'assets/kids/kid1.png',
      userImg: 'assets/kids/kid1.png',
      chatList: chatList,
      successMessages: ['That\'s great. We will be rich in no time. 😍'],
      failureMessages: [
        'that\'s too little 😒',
        'You just missed once in a lifetime opportunity 🤯'
      ],
    );
  }

  static ChatLevel level9() {
    Map<String, List<String>> chatList = {};

    chatList[ChatLevel.botKey] = [
      'Name\'s Mr. Rhyme and now It\'s my time to shine'
    ];
    chatList['Name\'s Mr. Rhyme and now It\'s my time to shine'] = [
      'Mr. Ryme smells all the time',
      'Don\'t play with me I\'ve a rhyme degree'
    ];
    chatList['Mr. Ryme smells all the time'] = [
      'That was kinda good but I\'ll ruin your childhood'
    ];
    chatList['Don\'t play with me I\'ve a rhyme degree'] = [
      'That was kinda good but I\'ll ruin your childhood'
    ];
    chatList['That was kinda good but I\'ll ruin your childhood'] = [
      'Mr. Rhyme is stupid your brain must be polluted',
      'Give up or I\'ll erupt'
    ];
    chatList['Mr. Rhyme is stupid your brain must be polluted'] = [
      'I don\'t like your face we can close this case'
    ];
    chatList['Give up or I\'ll erupt'] = [
      'I don\'t like your face we can close this case'
    ];
    chatList['I don\'t like your face we can close this case'] = [
      'I\'m so pretty your mom calls me kitty',
      'You got me...'
    ];
    chatList['I\'m so pretty your mom calls me kitty'] = ['uhh you won'];
    chatList['You got me...'] = ['HAHAHA Take it!'];

    return ChatLevel(
      levelName: 'Challenge him',
      botName: 'Scary Teacher',
      botImg: 'assets/kids/kid1.png',
      userImg: 'assets/kids/kid3.png',
      chatList: chatList,
      successMessages: ['uhh you won'],
      failureMessages: ['HAHAHA Take it!'],
    );
  }

  static ChatLevel level10() {
    Map<String, List<String>> chatList = {};

    chatList[ChatLevel.botKey] = ['Wanna hear a good joke?'];
    chatList['Wanna hear a good joke?'] = ['No', 'Yes'];
    chatList['No'] = ['I\'ll tell you anyway 😃'];
    chatList['Yes'] = ['What do you call someone with no body and no nose?'];
    chatList['I\'ll tell you anyway 😃'] = ['Uhh', 'Ok'];
    chatList['Uhh'] = ['What do you call someone with no body and no nose?'];
    chatList['Ok'] = ['What do you call someone with no body and no nose?'];
    chatList['What do you call someone with no body and no nose?'] = [
      '?',
      'How you call them?'
    ];
    chatList['?'] = ['Nobody knows 😂😂'];
    chatList['How you call them?'] = ['Nobody knows 😂😂'];
    chatList['Nobody knows 😂😂'] = [
      'I don\'t get it...',
      'Good joke teacher..'
    ];
    chatList['I don\'t get it...'] = ['Wanna hear another?'];
    chatList['Good joke teacher..'] = ['Wanna hear another?'];
    chatList['Wanna hear another?'] = ['Please NO!!', 'Alright'];
    chatList['Please NO!!'] = ['Bruhh .... 😡'];
    chatList['Please NO!!'] = ['Bruhh .... 😡'];
    chatList['Alright'] = ['What\'s brown and sticky?'];
    chatList['What\'s brown and sticky?'] = ['What is', 'A stick'];
    chatList['What is'] = ['A stick 😂😂'];
    chatList['A stick'] = ['How do you know?'];
    chatList['A stick 😂😂'] = ['😂', 'Teacher stop!'];
    chatList['How do you know?'] = [
      'I heard it like 100X',
      'I\'m really smart'
    ];
    chatList['I\'m really smart'] = ['Last one'];
    chatList['I heard it like 100X'] = ['Last one'];
    chatList['😂'] = ['Last one'];
    chatList['Teacher stop!'] = ['Bruhh .... 😡'];
    chatList['Last one'] = ['Teacher please...', 'ok'];
    chatList['ok'] = ['Don\'t trust atoms.'];
    chatList['Teacher please...'] = ['Don\'t trust atoms.'];
    chatList['Don\'t trust atoms.'] = ['why?'];
    chatList['why?'] = ['They make up everything.'];

    return ChatLevel(
      levelName: 'Hear the jokes',
      botName: 'Scary Teacher',
      botImg: 'assets/kids/kid1.png',
      userImg: 'assets/kids/kid7.png',
      chatList: chatList,
      successMessages: ['They make up everything.'],
      failureMessages: ['Bruhh .... 😡'],
    );
  }
}
