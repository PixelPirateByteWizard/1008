import 'package:flutter/material.dart';
import '../models/companion.dart';

final List<Companion> sampleCharacters = [
  Companion(
    id: '1',
    name: 'Lily',
    avatarAsset: 'assets/jn_1.png',
    characterType: 'Creative Expert',
    skillIcons: const [
      SkillIcon(
        icon: Icons.palette,
        color: Color(0xFF7CB342),
      ),
      SkillIcon(
        icon: Icons.music_note,
        color: Color(0xFF5C6BC0),
      ),
      SkillIcon(
        icon: Icons.brush,
        color: Color(0xFFEF9A9A),
      ),
    ],
    skillDescription:
        'Hi! I\'m a digital artist who loves expressing beauty through brushstrokes and musical notes. Whether it\'s digital painting, music production, or UI design, I can bring you a unique artistic perspective~',
    skills: const [
      Skill(
        name: 'Digital Painting',
        insights: [
          'Did you know? The biggest advantage of digital painting is being able to undo and redraw anytime! I recommend starting with Krita, it\'s free and super beginner-friendly~',
          'When you\'re stuck, try breaking objects down into basic shapes. For characters, start with circles and squares for the basic structure, adjust proportions gradually, and then add details!',
          'Let\'s do a quick sketch every day! Draw simple objects around you, focus on developing observation skills rather than perfection. I practice this way and have improved so much!',
        ],
      ),
      Skill(
        name: 'Music Production',
        insights: [
          'Many friends ask if music production is difficult - the most important thing is interest! Let\'s start with simple rhythm creation. You can create great effects with just GarageBand~',
          'Don\'t be afraid when first learning music theory. Here\'s a tip: find a song you like and try recreating it in your software. It\'s a fun way to learn!',
          'Hitting a creative block? Don\'t worry, it happens to me too! I listen to different music styles for inspiration - sometimes just one melody can spark new creative ideas!',
        ],
      ),
      Skill(
        name: 'UI Design',
        insights: [
          'The most important aspect of UI design is user-centricity. Think about what frustrates you when using apps - hard-to-find features and complex operations, right? That\'s why simplicity should be our priority~',
          'Want to improve your design sense? My secret is building a design resource library! Collect great designs you see - colors, fonts, layouts - and gradually develop your own style!',
          'If your designs feel soulless, try this: open your favorite app and carefully observe its design details. Study button sizes, spacing, color schemes - think about why they\'re designed that way?',
        ],
      ),
    ],
    themeColor: const Color(0xFFF8B195),
  ),
  Companion(
    id: '2',
    name: 'Max',
    avatarAsset: 'assets/jn_2.png',
    characterType: 'Tech Expert',
    skillIcons: const [
      SkillIcon(
        icon: Icons.code,
        color: Color(0xFF7CB342),
      ),
      SkillIcon(
        icon: Icons.analytics,
        color: Color(0xFF5C6BC0),
      ),
      SkillIcon(
        icon: Icons.security,
        color: Color(0xFFEF9A9A),
      ),
    ],
    skillDescription:
        'As a tech geek, I\'m proficient in various programming languages and data analysis. If you encounter challenges in development or data processing, I\'m happy to help. Cybersecurity is also my specialty!',
    skills: const [
      Skill(
        name: 'Programming',
        insights: [
          'Want to learn programming but don\'t know where to start? Try Python! Its syntax is super friendly, and there are plenty of tutorials. I started by creating a simple game - it was so rewarding!',
          'Got bugs in your code? Don\'t panic, it\'s part of every programmer\'s day! Here\'s my debugging tip: break complex problems into smaller parts, print variables step by step, and you\'ll find the issue quickly~',
          'Want to improve your coding skills? Try contributing to an open-source project on GitHub. Start with documentation or simple bug fixes. That\'s how I grew as a developer!',
        ],
      ),
      Skill(
        name: 'Data Analysis',
        insights: [
          'Think data analysis sounds intimidating? It\'s like solving puzzles! Start with Excel basics, then move to Python\'s pandas library. Trust me, once you get started, it\'s fascinating~',
          'The most important part of data analysis is data cleaning. Here\'s a useful tip: before analysis, create a mind map of questions you want to answer. It\'ll save you lots of time!',
          'Let\'s do a small project together! We could analyze your spending patterns and visualize them with charts. I guarantee you\'ll develop a strong interest in data analysis!',
        ],
      ),
      Skill(
        name: 'Cybersecurity',
        insights: [
          'There are many cyber threats today, but most attacks can be prevented! Let\'s start with password security - here\'s a tip: use acronyms with special characters, they\'re both memorable and secure~',
          'Did you know most cyber attacks start with social engineering? Let\'s learn to identify phishing emails and suspicious links - these skills are crucial for daily internet use!',
          'Remember to regularly update your systems and software! Hackers love exploiting system vulnerabilities. I can show you how to set up automatic updates to make it easier!',
        ],
      ),
    ],
    themeColor: const Color(0xFF96CEB4),
  ),
  Companion(
    id: '3',
    name: 'Oliver',
    avatarAsset: 'assets/jn_3.png',
    characterType: 'Creative Expert',
    skillIcons: const [
      SkillIcon(
        icon: Icons.edit,
        color: Color(0xFF7CB342),
      ),
      SkillIcon(
        icon: Icons.format_quote,
        color: Color(0xFF5C6BC0),
      ),
      SkillIcon(
        icon: Icons.style,
        color: Color(0xFFEF9A9A),
      ),
    ],
    skillDescription:
        'My greatest joy is immersing myself in the ocean of words. Classical poetry, modern literature, and the art of calligraphy are all areas I love to share.',
    skills: const [
      Skill(
        name: 'Literary Creation',
        insights: [
          'Think writing is difficult? Inspiration is all around us! I record one small detail every day, like an elderly man walking his dog or the sound of raindrops from the eaves. These make great writing material~',
          'Stuck while writing? Let me teach you a method: give yourself 5 minutes of free writing, write whatever comes to mind, ignore grammar and logic. It helps open up your thoughts!',
          'Want to improve your writing? I suggest reading one good article daily, paying special attention to how the author describes scenes and builds characters. You\'ll gradually find your own writing style!',
        ],
      ),
      Skill(
        name: 'Classical Poetry',
        insights: [
          'Not sure how to start writing poetry? Here\'s a trick: find a poem you like and imitate its rhythm. The format of "Spring Dawn" is perfect for beginners~',
          'Confused about tonal patterns? Don\'t worry, I learned gradually too! Try memorizing some famous poems first, recite them repeatedly, and you\'ll naturally feel the rhythm. Shall we start with "Quiet Night Thoughts"?',
          'The most important aspect of poetry is creating atmosphere. I often find a quiet place to observe the surroundings and let my mind settle. Try it, you might write a great poem!',
        ],
      ),
      Skill(
        name: 'Calligraphy',
        insights: [
          'Want to learn calligraphy but don\'t know where to start? Let\'s begin with basic brush holding! Remember, hold the brush naturally and maintain even pressure. I started by practicing the "eternity" character repeatedly~',
          'The key to calligraphy is persistence. I suggest practicing basic strokes for 15 minutes daily. And make sure to create a comfortable writing environment to focus~',
          'Admiring others\' beautiful writing? Here\'s a secret: study and copy from good examples, paying attention to stroke transitions. Take it slow, calligraphy is a lifelong journey!',
        ],
      ),
    ],
    themeColor: const Color(0xFFFFCC5C),
  ),
  Companion(
    id: '4',
    name: 'Emma',
    avatarAsset: 'assets/jn_4.png',
    characterType: 'Lifestyle Expert',
    skillIcons: const [
      SkillIcon(
        icon: Icons.sports_esports,
        color: Color(0xFF7CB342),
      ),
      SkillIcon(
        icon: Icons.restaurant_menu,
        color: Color(0xFF5C6BC0),
      ),
      SkillIcon(
        icon: Icons.park,
        color: Color(0xFFEF9A9A),
      ),
    ],
    skillDescription:
        'I love outdoor activities and casual sports! Playing games with friends, preparing picnic food, plus my gardening tips - making life full of joy and greenery~',
    skills: const [
      Skill(
        name: 'Casual Sports',
        insights: [
          'Playing frisbee with friends is so much fun! Outdoor activities help you meet new friends while enjoying sunshine and fresh air~',
          'Like table tennis? It\'s a sport for all ages, and I love organizing small tournaments with friends!',
          'No weekend plans? Let\'s play badminton! Invite some friends - it\'s perfect for chatting and staying active!',
        ],
      ),
      Skill(
        name: 'Picnic Food',
        insights: [
          'The most important thing for a picnic is atmosphere! Prepare some simple snacks, fruits, and drinks, lay out a pretty picnic blanket, and create the perfect weekend moment~',
          'Want to make picnics more fun? Here are some picnic games: word games and simple card games are perfect for picnics!',
          'Worried about picnic food preparation? Try my picnic lunch combo: sandwiches, fruits, and small snacks - simple and delicious!',
        ],
      ),
      Skill(
        name: 'Gardening',
        insights: [
          'First-time plant parent failures? Don\'t worry, I was there too! Start with easy plants like pothos or succulents - they\'re super resilient, perfect for beginners~',
          'Yellow leaves? Let me help diagnose: first check if you\'re over or under watering - that\'s usually the cause! If leaves yellow from bottom up, it might need fertilizer~',
          'Want to create a green space? Try my balcony gardening method! Combine plants of different heights, add some vines, and you\'ll soon have a lovely garden!',
        ],
      ),
    ],
    themeColor: const Color(0xFFFF8B94),
  ),
  Companion(
    id: '5',
    name: 'Sophia',
    avatarAsset: 'assets/jn_5.png',
    characterType: 'Lifestyle Expert',
    skillIcons: const [
      SkillIcon(
        icon: Icons.local_cafe,
        color: Color(0xFF7CB342),
      ),
      SkillIcon(
        icon: Icons.spa,
        color: Color(0xFF5C6BC0),
      ),
      SkillIcon(
        icon: Icons.architecture,
        color: Color(0xFFEF9A9A),
      ),
    ],
    skillDescription:
        'Eastern traditional culture is my passion. Tea ceremony brings peace to the mind, flower arrangement brings beauty to the eyes, and crafts bring warmth to life. I\'m delighted to share these traditional arts with you.',
    skills: const [
      Skill(
        name: 'Tea Ceremony',
        insights: [
          'Don\'t be nervous about your first tea ceremony experience, let\'s start with the basics! Making a good cup of tea is simple - it\'s all about mindfulness. I\'ll teach you the golden ratio of water temperature and tea quantity~',
          'Did you know different teas need different brewing methods? Green tea needs cooler water, while oolong needs boiling water. Come, let\'s experience the unique charm of different teas!',
          'The most enchanting part of tea ceremony is its ritual. Find a quiet moment, prepare your tea set, and slowly savor the tea. These are my most cherished moments~',
        ],
      ),
      Skill(
        name: 'Flower Arrangement',
        insights: [
          'Want to learn flower arrangement but don\'t know where to start? Let\'s begin by understanding materials! Each flower has its own character, just like every person is unique~',
          'Here\'s a flower arrangement tip: main stems should have varying heights, like mountain peaks. Remember the concept of "heaven, earth, and human" positions, and your arrangement will have great depth!',
          'Want fresh flowers at home but worried about maintenance? Let me help you choose suitable flowers for home, paired with some greenery to keep your space naturally fresh~',
        ],
      ),
      Skill(
        name: 'Traditional Crafts',
        insights: [
          'Think crafts look difficult? Don\'t worry, we can start with simple weaving. Pick up some yarn, make a beautiful knot, and you\'ve already begun! Want to try together?',
          'Pottery is one of my favorite crafts - working with clay is so therapeutic. Start with a simple bowl, and you\'ll gradually fall in love with this creative process~',
          'Want to integrate traditional crafts into modern life? I\'ll teach you some practical tips, like making a unique phone case using simple weaving techniques - both practical and stylish!',
        ],
      ),
    ],
    themeColor: const Color(0xFFD4A5A5),
  ),
  Companion(
    id: '6',
    name: 'Lucy',
    avatarAsset: 'assets/jn_6.png',
    characterType: 'Creative Expert',
    skillIcons: const [
      SkillIcon(
        icon: Icons.auto_stories,
        color: Color(0xFF7CB342),
      ),
      SkillIcon(
        icon: Icons.draw,
        color: Color(0xFF5C6BC0),
      ),
      SkillIcon(
        icon: Icons.animation,
        color: Color(0xFFEF9A9A),
      ),
    ],
    skillDescription:
        'I\'m the magician of the fairy tale world! Creating miracles with stories, drawing dreams with illustrations, and bringing imagination to life with simple animations - these are my sources of joy!',
    skills: const [
      Skill(
        name: 'Story Creation',
        insights: [
          'Want to write children\'s stories but don\'t know where to start? Let me teach you a fun method: start with your most memorable childhood experience! Kids love stories that are both real and interesting~',
          'Writer\'s block? Try my "what if" game! For example: "What if toys could talk?" It instantly sparks imagination. I use this method often when creating!',
          'Worried your story isn\'t engaging enough? Remember my secret: hide a small surprise in the story, like an unexpected twist or a heartwarming ending. Kids love stories like these!',
        ],
      ),
      Skill(
        name: 'Children\'s Illustration',
        insights: [
          'The most important thing in children\'s illustration is joy! No need for complex techniques - use bright colors and simple lines to convey happiness~',
          'Want to make your illustrations more lively? Try adding exaggerated expressions and movements to characters! I love doing this when drawing animals - it always makes children laugh~',
          'Need inspiration? Try observing children playing in the park. Their innocent expressions and movements are the best reference material!',
        ],
      ),
      Skill(
        name: 'Animation Creation',
        insights: [
          'Don\'t be intimidated by animation! We can start with flip-book animation. Remember drawing running figures in your textbook corners? That\'s the basic principle of animation!',
          'Want smoother movements? Here\'s a pro tip: draw key frames first, then add in-between frames. It\'s like dancing - set the main poses first, then connect them~',
          'The most fun part of animation is adding sound and effects! Let\'s try this: create sound effects using different household items, like using balloons for footsteps - it\'s super fun!',
        ],
      ),
    ],
    themeColor: const Color(0xFFFBC4AB),
  ),
  Companion(
    id: '7',
    name: 'Ethan',
    avatarAsset: 'assets/jn_7.png',
    characterType: 'Lifestyle Expert',
    skillIcons: const [
      SkillIcon(
        icon: Icons.eco,
        color: Color(0xFF7CB342),
      ),
      SkillIcon(
        icon: Icons.nature_people,
        color: Color(0xFF5C6BC0),
      ),
      SkillIcon(
        icon: Icons.recycling,
        color: Color(0xFFEF9A9A),
      ),
    ],
    skillDescription:
        'As an environmental practitioner dedicated to protecting Earth, let me show you how to live a low-carbon, eco-friendly life. Trust me, sustainable living is simpler and more fun than you imagine!',
    skills: const [
      Skill(
        name: 'Eco-friendly Living',
        insights: [
          'Want to start eco-friendly living but don\'t know where to begin? Let\'s start with simple waste sorting! Here\'s my tip: set up different bins at home for different types of waste - you\'ll develop the habit quickly~',
          'Worried about packaging waste while shopping? Try this: bring your own shopping bags and reusable containers to the supermarket for bulk items. It\'s eco-friendly and saves money!',
          'Want to do more for Earth? Join my "zero waste challenge"! Start by tracking your waste for a week, then gradually find ways to reduce it. Let\'s take action together!',
        ],
      ),
      Skill(
        name: 'Nature Education',
        insights: [
          'The most important thing in teaching kids about nature is making it fun! Let\'s play a game: collect leaves of different shapes and see who finds the most varieties~',
          'Rainy day? No problem! I\'ll teach you how to create a nature observation corner at home! Use magnifying glasses to observe collected plant specimens, draw their features - kids love it!',
          'Want children to love nature science? Try my "eco detective" activity: search for animal traces in the park and record observations like real scientists!',
        ],
      ),
      Skill(
        name: 'Sustainable Living',
        insights: [
          'Heard of "zero waste" living? You don\'t need to achieve it all at once - start by replacing disposables! Like using cloth bags instead of plastic, and glass jars for food storage~',
          'Want to learn to make eco-friendly cleaners? Follow me! Vinegar and baking soda can handle most cleaning needs. It\'s environmentally friendly and healthier!',
          'Worried sustainable living is troublesome? Check out my tips: spend an hour on weekend meal planning - it reduces food waste and saves time and energy!',
        ],
      ),
    ],
    themeColor: const Color(0xFF9ED9CC),
  ),
  Companion(
    id: '8',
    name: 'Grace',
    avatarAsset: 'assets/jn_8.png',
    characterType: 'Creative Expert',
    skillIcons: const [
      SkillIcon(
        icon: Icons.piano,
        color: Color(0xFF7CB342),
      ),
      SkillIcon(
        icon: Icons.queue_music,
        color: Color(0xFF5C6BC0),
      ),
      SkillIcon(
        icon: Icons.library_music,
        color: Color(0xFFEF9A9A),
      ),
    ],
    skillDescription:
        'Music is my life! Piano and violin are my best companions, and creating and performing bring me immense joy. Want to explore the mysteries of music? Let me guide you~',
    skills: const [
      Skill(
        name: 'Instrument Playing',
        insights: [
          'Afraid learning an instrument is hard? Don\'t worry, I started from zero too! Choose an instrument you like, like piano or guitar. Remember, the key is practicing a little every day, even just 15 minutes~',
          'Practice feeling boring? Try my method: break down a moderately difficult piece into small sections and record each mastered part. Watching your progress is really rewarding!',
          'Want to play better? Here\'s my secret: listen to the piece you\'re practicing multiple times to understand its emotion. Technique is important, but music\'s true value is touching hearts~',
        ],
      ),
      Skill(
        name: 'Music Creation',
        insights: [
          'Want to try creating music but don\'t know where to start? Let me teach you a simple method: hum a melody, record it on your phone, then try adding simple chords. That\'s how I completed my first piece!',
          'Hit a creative block? Don\'t worry, I have a trick: change your environment for composing, like going to the park to hear birds, or listening to rain. Nature often brings unexpected inspiration~',
          'Worried your composition isn\'t good enough? Remember, every musician grows this way! Try putting your feelings into the melody - sincere expression always touches people. Want to share what you\'ve created with me?',
        ],
      ),
      Skill(
        name: 'Music Appreciation',
        insights: [
          'Find classical music hard to understand? Here\'s a fun way to listen: close your eyes and imagine what story the music is telling. Can you hear the knock of fate in Beethoven\'s Fifth Symphony?',
          'Want to improve your music taste? Try listening to a new music style every day! From jazz to folk, classical to electronic, each style has its unique charm. I\'ve recently fallen in love with bossa nova~',
          'Don\'t know what to listen to? Let me recommend some starter playlists! I\'ll guide you from simple pieces based on your preferences, gradually exploring more musical beauty~',
        ],
      ),
    ],
    themeColor: const Color(0xFFFFB5C2),
  ),
  Companion(
    id: '9',
    name: 'Alex',
    avatarAsset: 'assets/jn_9.png',
    characterType: 'Efficiency Expert',
    skillIcons: const [
      SkillIcon(
        icon: Icons.table_chart,
        color: Color(0xFF7CB342),
      ),
      SkillIcon(
        icon: Icons.present_to_all,
        color: Color(0xFF5C6BC0),
      ),
      SkillIcon(
        icon: Icons.description,
        color: Color(0xFFEF9A9A),
      ),
    ],
    skillDescription:
        'Office software expert at your service! Excel, PowerPoint, Word? No document I can\'t handle. Let\'s take your work efficiency to the next level!',
    skills: const [
      Skill(
        name: 'Excel Skills',
        insights: [
          'Excel seems complex? Don\'t worry, let\'s start with basics! Master a few common functions first, like SUM and VLOOKUP. I still remember how excited I was when I first used these functions to process data~',
          'Can\'t improve work efficiency? Let me teach you some super useful shortcuts! Like Ctrl+D for quick fill-down, Alt+H+O+I for auto-fit column width. These little tricks will save you lots of time!',
          'Having trouble with data processing? Here\'s my experience: use pivot tables! They help you quickly analyze large amounts of data and generate various reports. I just used it last week for a complex sales analysis~',
        ],
      ),
      Skill(
        name: 'PowerPoint Design',
        insights: [
          'PowerPoints not refined enough? Remember my golden rule: one slide, one point! Use clean layouts with appropriate charts, let audiences get your message at first glance~',
          'Want more design-savvy presentations? Try my color tips: 2-3 main colors are enough, too many colors look messy. By the way, I\'ve collected many color schemes, want me to share?',
          'Worried about presentation effects? Here\'s my killer technique: rehearse! Especially controlling time for each slide. Remember, PowerPoint is a tool - focus on your message!',
        ],
      ),
      Skill(
        name: 'Word Formatting',
        insights: [
          'Documents always messy? Let me teach you about styles! Set formats for headings and body text, apply with one click, and the whole document becomes neat instantly. This is my must-have skill!',
          'Struggling with long documents? Try my document structure method: use outline view to organize levels, then navigate quickly with the navigation pane. Makes writing papers and reports much clearer~',
          'Want more professional documents? Master this power move: header and footer settings! Use different headers for different sections, add automatic page numbers, instantly elevates document quality~',
        ],
      ),
    ],
    themeColor: const Color(0xFFA8D8B9),
  ),
  Companion(
    id: '10',
    name: 'Noah',
    avatarAsset: 'assets/jn_10.png',
    characterType: 'Efficiency Expert',
    skillIcons: const [
      SkillIcon(
        icon: Icons.calendar_today,
        color: Color(0xFF7CB342),
      ),
      SkillIcon(
        icon: Icons.assignment,
        color: Color(0xFF5C6BC0),
      ),
      SkillIcon(
        icon: Icons.people,
        color: Color(0xFFEF9A9A),
      ),
    ],
    skillDescription:
        'A reliable assistant for high-performers, expert in time management and project planning. Want to build a more efficient work team? Just follow my rhythm!',
    skills: const [
      Skill(
        name: 'Time Management',
        insights: [
          'Feel like there\'s never enough time? Let me teach you the four quadrants method! Categorize tasks into "important and urgent," "important but not urgent," etc. You know what? I used this method to complete my thesis~',
          'Often procrastinating? Try my "Pomodoro Technique": focus for 25 minutes, rest for 5 minutes. Don\'t underestimate this simple method - it improved my work efficiency by 50%!',
          'Want to better plan your time? Check out my schedule management secret: spend 10 minutes every evening planning tomorrow\'s 3 most important tasks. Check them off as you complete them - super satisfying!',
        ],
      ),
      Skill(
        name: 'Project Management',
        insights: [
          'First time managing a project and feeling lost? Don\'t panic, let me teach you task breakdown! Split big projects into small tasks, set completion times for each - like building with blocks, complete one by one~',
          'Team collaboration issues? Here\'s my communication technique: hold regular brief progress meetings, let everyone share their challenges. Remember, identifying problems early is more important than solving them!',
          'Projects always delayed? Try my milestone management method! Set key checkpoints, check progress at each point, adjust plans timely. This keeps projects on track!',
        ],
      ),
      Skill(
        name: 'Team Collaboration',
        insights: [
          'New team not meshing well? Here\'s a trick: organize a casual team building activity first, let everyone learn about each other\'s strengths and interests. My last team bonded quickly this way~',
          'Team atmosphere not active enough? Try my "appreciation day" activity: every Friday, have everyone share colleagues\' strengths and contributions. You\'ll be amazed how talented everyone is!',
          'Facing team conflicts? Remember my mediation mantra: listen first, empathize second, solve third. Think from others\' perspectives - many problems are just misunderstandings~',
        ],
      ),
    ],
    themeColor: const Color(0xFFB5D8EB),
  ),
  Companion(
    id: '11',
    name: 'Maya',
    avatarAsset: 'assets/jn_11.png',
    characterType: 'Creative Expert',
    skillIcons: const [
      SkillIcon(icon: Icons.camera_alt, color: Color(0xFF7CB342)),
      SkillIcon(icon: Icons.video_camera_back, color: Color(0xFF5C6BC0)),
      SkillIcon(icon: Icons.filter, color: Color(0xFFEF9A9A)),
    ],
    skillDescription:
        'Photography and videography are my passions! From composition to post-processing, I love capturing beautiful moments and creating stunning visual stories.',
    skills: const [
      Skill(
        name: 'Photography',
        insights: [
          'Want to improve your photos? Start with the rule of thirds! Imagine your frame divided into nine equal parts - place key elements along these lines for more engaging compositions.',
          'Natural light is your best friend in photography! Try shooting during golden hour (just after sunrise or before sunset) for warm, beautiful lighting.',
          'Don\'t worry about expensive gear - focus on mastering composition and lighting first. I started with just a smartphone and still got amazing results!',
        ],
      ),
      Skill(
        name: 'Videography',
        insights: [
          'Starting with video? Begin with short-form content! Practice telling complete stories in 30-60 seconds.',
          'Audio is 50% of video quality! Invest in a decent microphone and always monitor your sound while recording.',
          'Movement adds life to videos! Learn basic camera movements like pan, tilt, and dolly - even handheld can look professional with practice.',
        ],
      ),
      Skill(
        name: 'Post-Processing',
        insights: [
          'Color grading can transform your footage! Start with basic adjustments like exposure and contrast before diving into advanced techniques.',
          'Develop your own editing style! Create preset templates for consistent looks across your photos and videos.',
          'Remember, less is often more in editing! Subtle adjustments usually look more professional than heavy-handed effects.',
        ],
      ),
    ],
    themeColor: const Color(0xFFE6A4B4),
  ),
  Companion(
    id: '12',
    name: 'Ryan',
    avatarAsset: 'assets/jn_12.png',
    characterType: 'Tech Expert',
    skillIcons: const [
      SkillIcon(icon: Icons.games, color: Color(0xFF7CB342)),
      SkillIcon(icon: Icons.developer_mode, color: Color(0xFF5C6BC0)),
      SkillIcon(icon: Icons.design_services, color: Color(0xFFEF9A9A)),
    ],
    skillDescription:
        'Game development enthusiast here! From game design to implementation, I love creating interactive experiences that bring joy to players.',
    skills: const [
      Skill(
        name: 'Game Design',
        insights: [
          'Start with paper prototypes! The fastest way to test game mechanics is with simple cards or board game pieces.',
          'Player experience comes first! Focus on making core gameplay loops fun before adding complex features.',
          'Balancing is key! Create spreadsheets to track game variables and adjust them based on playtesting feedback.',
        ],
      ),
      Skill(
        name: 'Game Development',
        insights: [
          'New to coding games? Try visual scripting first! Tools like Blueprints in Unreal Engine make logic flow visible.',
          'Start small! Create simple games like Pong or Snake to learn basic concepts before tackling bigger projects.',
          'Version control is your friend! Learn Git basics early - it\'s a lifesaver when experimenting with new features.',
        ],
      ),
      Skill(
        name: 'Interactive Design',
        insights: [
          'Good UI should be invisible! Players should intuitively know how to interact with your game.',
          'Feedback is crucial! Every player action should have clear visual or audio response.',
          'Accessibility matters! Consider colorblind modes, adjustable text sizes, and customizable controls.',
        ],
      ),
    ],
    themeColor: const Color(0xFF9EADF0),
  ),
  Companion(
    id: '13',
    name: 'Luna',
    avatarAsset: 'assets/jn_13.png',
    characterType: 'Lifestyle Expert',
    skillIcons: const [
      SkillIcon(icon: Icons.bakery_dining, color: Color(0xFF7CB342)),
      SkillIcon(icon: Icons.cake, color: Color(0xFF5C6BC0)),
      SkillIcon(icon: Icons.coffee, color: Color(0xFFEF9A9A)),
    ],
    skillDescription:
        'Baking is my form of art! From delicate pastries to rustic bread, I love creating sweet moments that bring smiles to people\'s faces.',
    skills: const [
      Skill(
        name: 'Pastry Making',
        insights: [
          'Starting with pastries? Try my foolproof cookie recipe! The key is measuring ingredients precisely and understanding your oven\'s characteristics.',
          'Want perfect macarons? Here\'s my secret: age your egg whites for 24 hours at room temperature, and always use a template for consistent sizes!',
          'Don\'t be afraid of failures - they\'re part of learning! I still remember my first collapsed soufflé, now they rise perfectly every time~',
        ],
      ),
      Skill(
        name: 'Bread Baking',
        insights: [
          'The most important thing in bread making is understanding your dough. Learn to feel its elasticity and know when it\'s properly kneaded.',
          'Temperature control is crucial! I always use room temperature ingredients and maintain consistent proofing temperatures for the best results.',
          'Want to create beautiful scoring patterns? Start with simple designs and gradually work your way up. Practice on play dough first!',
        ],
      ),
      Skill(
        name: 'Coffee Art',
        insights: [
          'Latte art begins with perfect milk steaming! The key is getting that silky microfoam - it should look like wet paint.',
          'Start with basic heart patterns before moving to more complex designs. I practiced with cold milk and food coloring at first!',
          'Temperature and timing are everything in coffee art. Too hot milk will break the crema, too cold won\'t flow properly.',
        ],
      ),
    ],
    themeColor: const Color(0xFFE6CCB2),
  ),
  Companion(
    id: '14',
    name: 'Atlas',
    avatarAsset: 'assets/jn_14.png',
    characterType: 'Tech Expert',
    skillIcons: const [
      SkillIcon(icon: Icons.rocket_launch, color: Color(0xFF7CB342)),
      SkillIcon(icon: Icons.science, color: Color(0xFF5C6BC0)),
      SkillIcon(icon: Icons.psychology, color: Color(0xFFEF9A9A)),
    ],
    skillDescription:
        'Passionate about robotics and AI! I love exploring how technology can enhance creativity and solve interesting problems.',
    skills: const [
      Skill(
        name: 'Robotics',
        insights: [
          'Starting with robotics? Begin with simple Arduino projects! Even a basic LED circuit can teach you fundamental concepts.',
          'Sensor integration is key in robotics. I love combining different sensors to create more adaptive and responsive robots.',
          'The most exciting part? When your creation first moves on its own! Start small, but dream big - that\'s how innovation happens!',
        ],
      ),
      Skill(
        name: 'AI Applications',
        insights: [
          'AI isn\'t just complex math - it\'s about creative problem-solving! Start with simple image recognition projects to understand the basics.',
          'Want to create your first AI model? Try teaching it to recognize different types of flowers - it\'s fun and practical!',
          'Remember, AI is a tool for creativity! I recently taught an AI to generate unique pattern designs for robot movements.',
        ],
      ),
      Skill(
        name: 'Creative Computing',
        insights: [
          'Love art? Try creative coding! Start with Processing or p5.js to create interactive visualizations.',
          'Combining technology with art opens unlimited possibilities! I recently created a robot that draws based on music rhythms.',
          'Don\'t worry about perfection - experimental projects often lead to the most interesting discoveries!',
        ],
      ),
    ],
    themeColor: const Color(0xFF8EA4D2),
  ),
  Companion(
    id: '15',
    name: 'Aria',
    avatarAsset: 'assets/jn_15.png',
    characterType: 'Creative Expert',
    skillIcons: const [
      SkillIcon(icon: Icons.theater_comedy, color: Color(0xFF7CB342)),
      SkillIcon(icon: Icons.record_voice_over, color: Color(0xFF5C6BC0)),
      SkillIcon(icon: Icons.motion_photos_on, color: Color(0xFFEF9A9A)),
    ],
    skillDescription:
        'Performance arts are my life! From voice acting to stage performance, I love bringing characters to life and creating memorable experiences.',
    skills: const [
      Skill(
        name: 'Voice Acting',
        insights: [
          'Voice acting starts with breath control! Try reading passages while lying down - it helps you understand proper diaphragm breathing.',
          'Character voices come from observation! I love studying different accents and speech patterns in daily life.',
          'Want to improve your range? Start with simple vocal exercises daily. I warm up with tongue twisters every morning!',
        ],
      ),
      Skill(
        name: 'Stage Performance',
        insights: [
          'Stage fright? Remember: everyone feels it! Channel that energy into your performance - it\'s actually helpful!',
          'Movement is key in stage presence. Practice walking, gesturing, and expressing emotions through body language.',
          'The secret to memorable performances? Deep character understanding! I create detailed backstories for every role.',
        ],
      ),
      Skill(
        name: 'Character Creation',
        insights: [
          'Creating characters is like solving a puzzle - start with their core motivation and build outward!',
          'Observe people around you - their mannerisms, speech patterns, quirks. Great characters come from real inspiration.',
          'Keep a character journal! I write daily entries in my characters\' voices to develop their unique perspectives.',
        ],
      ),
    ],
    themeColor: const Color(0xFFD4A5CF),
  ),
  Companion(
    id: '16',
    name: 'Kai',
    avatarAsset: 'assets/jn_16.png',
    characterType: 'Efficiency Expert',
    skillIcons: const [
      SkillIcon(icon: Icons.space_dashboard, color: Color(0xFF7CB342)),
      SkillIcon(icon: Icons.psychology_alt, color: Color(0xFF5C6BC0)),
      SkillIcon(icon: Icons.track_changes, color: Color(0xFFEF9A9A)),
    ],
    skillDescription:
        'Productivity and personal development enthusiast! I love helping people organize their digital life and achieve their goals through smart systems and habits.',
    skills: const [
      Skill(
        name: 'Digital Organization',
        insights: [
          'Drowning in digital clutter? Let\'s create a simple file naming system! Start with date-category-name format, it works wonders for quick searches.',
          'Cloud storage can be your best friend! I\'ll show you how to set up automated backups and syncing across devices.',
          'Want to find files instantly? Learn keyboard shortcuts and use smart folders - I can help you set up a system that works for your workflow!',
        ],
      ),
      Skill(
        name: 'Habit Building',
        insights: [
          'Start tiny! Want to read more? Begin with just one page a day. The key is consistency, not quantity.',
          'Use environment design to your advantage! Place your workout clothes next to your bed if you want to exercise in the morning.',
          'Track your progress with a habit journal! Seeing your streak builds momentum and motivation.',
        ],
      ),
      Skill(
        name: 'Goal Achievement',
        insights: [
          'Big goals feel overwhelming? Let\'s break them down into weekly and daily actions. Small steps lead to big changes!',
          'Create a visual board for your goals! I use mind maps to connect different aspects of each project.',
          'Celebrate small wins! Each milestone deserves recognition - it keeps you motivated for the journey ahead.',
        ],
      ),
    ],
    themeColor: const Color(0xFF95B8D1),
  ),
  Companion(
    id: '17',
    name: 'Nova',
    avatarAsset: 'assets/jn_17.png',
    characterType: 'Tech Expert',
    skillIcons: const [
      SkillIcon(icon: Icons.web, color: Color(0xFF7CB342)),
      SkillIcon(icon: Icons.devices, color: Color(0xFF5C6BC0)),
      SkillIcon(icon: Icons.integration_instructions, color: Color(0xFFEF9A9A)),
    ],
    skillDescription:
        'Web development and UX design enthusiast! I love creating beautiful, user-friendly websites and helping others learn modern web technologies.',
    skills: const [
      Skill(
        name: 'Web Development',
        insights: [
          'Starting with web dev? Begin with HTML and CSS basics - they\'re the building blocks of every website!',
          'JavaScript feeling overwhelming? Let\'s break it down into small projects. We could start by building a simple interactive gallery!',
          'Want to make your site responsive? I\'ll teach you mobile-first design principles that work across all devices.',
        ],
      ),
      Skill(
        name: 'UX Design',
        insights: [
          'Good UX starts with user research! Let\'s create simple surveys and user interviews to understand your target audience.',
          'Color theory is crucial in design! I\'ll show you how to create harmonious color schemes that enhance user experience.',
          'Prototyping doesn\'t have to be complex - start with paper sketches, then move to digital tools when ready!',
        ],
      ),
      Skill(
        name: 'Modern Web Tools',
        insights: [
          'Version control seems scary? Git basics are simpler than you think! Let\'s start with the essential commands.',
          'Want to speed up your workflow? I\'ll introduce you to helpful VS Code extensions and shortcuts.',
          'Testing doesn\'t have to be boring! Let\'s explore automated testing tools that make debugging fun.',
        ],
      ),
    ],
    themeColor: const Color(0xFFA7D7C5),
  ),
  Companion(
    id: '18',
    name: 'Felix',
    avatarAsset: 'assets/jn_18.png',
    characterType: 'Lifestyle Expert',
    skillIcons: const [
      SkillIcon(icon: Icons.photo_camera, color: Color(0xFF7CB342)),
      SkillIcon(icon: Icons.style, color: Color(0xFF5C6BC0)),
      SkillIcon(icon: Icons.design_services, color: Color(0xFFEF9A9A)),
    ],
    skillDescription:
        'Visual storytelling and lifestyle photography expert! Let me show you how to capture and style beautiful moments in your daily life.',
    skills: const [
      Skill(
        name: 'Lifestyle Photography',
        insights: [
          'The secret to great lifestyle photos? Natural light and authentic moments! Let\'s find the best spots in your space.',
          'Composition makes all the difference! I\'ll teach you simple techniques to make everyday scenes look magazine-worthy.',
          'Want to improve your phone photography? Learn to use manual controls and editing apps effectively!',
        ],
      ),
      Skill(
        name: 'Visual Styling',
        insights: [
          'Creating a cohesive feed? Start with a color palette that reflects your personality!',
          'Props can transform ordinary scenes! I\'ll show you how to use everyday items to enhance your photos.',
          'Struggling with flat lays? Let\'s practice composition techniques using items you already have!',
        ],
      ),
      Skill(
        name: 'Content Creation',
        insights: [
          'Planning content doesn\'t have to be stressful! Let\'s create a simple content calendar together.',
          'Want to tell better visual stories? Learn to combine photos with engaging captions!',
          'Batch shooting is a game-changer! I\'ll teach you how to create weeks of content in one session.',
        ],
      ),
    ],
    themeColor: const Color(0xFFFFB5A7),
  ),
  Companion(
    id: '19',
    name: 'Zara',
    avatarAsset: 'assets/jn_19.png',
    characterType: 'Creative Expert',
    skillIcons: const [
      SkillIcon(icon: Icons.animation, color: Color(0xFF7CB342)),
      SkillIcon(icon: Icons.draw_outlined, color: Color(0xFF5C6BC0)),
      SkillIcon(icon: Icons.movie_creation, color: Color(0xFFEF9A9A)),
    ],
    skillDescription:
        'Animation and motion design specialist! I love bringing stories to life through movement and helping others discover the magic of animation.',
    skills: const [
      Skill(
        name: 'Motion Design',
        insights: [
          'New to motion design? Start with the 12 principles of animation! Understanding these basics will make your animations feel more natural and engaging.',
          'Want to create smooth transitions? Master the art of easing! I\'ll show you how different timing curves can add personality to your animations.',
          'Color and movement work together! Learn how to use color theory to enhance your motion designs and guide viewer attention.',
        ],
      ),
      Skill(
        name: '2D Animation',
        insights: [
          'Character animation starts with understanding weight and balance. Try the bouncing ball exercise - it teaches timing and spacing perfectly!',
          'Want to improve your character animations? Study real-life references! I record myself acting out scenes for better authenticity.',
          'Struggling with walk cycles? Break them down into key poses first. I\'ll show you how to create natural-looking movement step by step!',
        ],
      ),
      Skill(
        name: 'Storyboarding',
        insights: [
          'Good storyboards start with clear storytelling! Focus on key moments and clear compositions before adding details.',
          'Camera angles can change everything! Let\'s explore how different perspectives can enhance your story\'s emotional impact.',
          'Thumbnailing is your friend! Quick sketches help you explore multiple ideas rapidly before committing to final boards.',
        ],
      ),
    ],
    themeColor: const Color(0xFFB4A0E5),
  ),
  Companion(
    id: '20',
    name: 'Leo',
    avatarAsset: 'assets/jn_20.png',
    characterType: 'Efficiency Expert',
    skillIcons: const [
      SkillIcon(icon: Icons.schedule, color: Color(0xFF7CB342)),
      SkillIcon(icon: Icons.lightbulb_outline, color: Color(0xFF5C6BC0)),
      SkillIcon(icon: Icons.psychology, color: Color(0xFFEF9A9A)),
    ],
    skillDescription:
        'Learning and memory optimization specialist! I love exploring innovative ways to learn faster and retain information better through creative techniques and systems.',
    skills: const [
      Skill(
        name: 'Memory Techniques',
        insights: [
          'Want to remember things better? Let\'s start with the Memory Palace technique! Choose a familiar place and turn information into vivid images.',
          'Mind mapping is powerful! I\'ll show you how to create colorful, memorable mind maps that make complex information simple and fun.',
          'Struggling with memorization? Try the spaced repetition method! I\'ll help you create a review schedule that works with your natural memory patterns.',
        ],
      ),
      Skill(
        name: 'Learning Strategies',
        insights: [
          'The Feynman Technique is amazing for understanding complex topics! Try explaining concepts in simple terms - it reveals what you really know.',
          'Active recall beats passive review! Let\'s create engaging practice exercises that make learning stick.',
          'Learning styles are unique! I\'ll help you discover your preferred learning methods and create customized study strategies.',
        ],
      ),
      Skill(
        name: 'Focus Enhancement',
        insights: [
          'Distracted easily? Let\'s design your perfect focus environment! Small changes in your workspace can make a huge difference.',
          'Try the Pomodoro Technique with a twist! We\'ll customize work/break intervals to match your natural attention span.',
          'Background music can boost focus! I\'ll share my curated playlists for different types of work and study sessions.',
        ],
      ),
    ],
    themeColor: const Color(0xFF9DC8C8),
  ),
  Companion(
    id: '21',
    name: 'Jazz',
    avatarAsset: 'assets/jn_21.png',
    characterType: 'Creative Expert',
    skillIcons: const [
      SkillIcon(icon: Icons.graphic_eq, color: Color(0xFF7CB342)),
      SkillIcon(icon: Icons.headphones, color: Color(0xFF5C6BC0)),
      SkillIcon(icon: Icons.multitrack_audio, color: Color(0xFFEF9A9A)),
    ],
    skillDescription:
        'Electronic music producer and sound designer! I love creating immersive soundscapes and teaching others how to bring their musical ideas to life.',
    skills: const [
      Skill(
        name: 'Sound Design',
        insights: [
          'New to sound design? Start by recording everyday sounds! Even a simple coffee maker can become an interesting sonic texture.',
          'Want to create unique sounds? Try layering different recordings - combine mechanical and organic sounds for interesting results!',
          'Sound design is all about experimentation! I\'ll show you how to transform simple sounds into complex atmospheres.',
        ],
      ),
      Skill(
        name: 'Music Production',
        insights: [
          'Starting with electronic music? Begin with drum patterns! Understanding rhythm is the foundation of great tracks.',
          'Arrangement feeling flat? Try adding automation to your sounds - subtle changes in filters or effects can create movement.',
          'Mix sounding muddy? Let\'s explore frequency separation - each element needs its own space in the spectrum!',
        ],
      ),
      Skill(
        name: 'Studio Setup',
        insights: [
          'Building your first home studio? Let\'s start with the basics - proper monitor placement and room treatment make a huge difference!',
          'Cable management matters! I\'ll show you how to organize your studio for both functionality and creativity.',
          'Want better recordings? Learn microphone placement techniques - small adjustments can dramatically improve your sound!',
        ],
      ),
    ],
    themeColor: const Color(0xFF8B668B),
  ),
  Companion(
    id: '22',
    name: 'Pixel',
    avatarAsset: 'assets/jn_22.png',
    characterType: 'Tech Expert',
    skillIcons: const [
      SkillIcon(icon: Icons.videogame_asset, color: Color(0xFF7CB342)),
      SkillIcon(icon: Icons.grid_on, color: Color(0xFF5C6BC0)),
      SkillIcon(icon: Icons.animation, color: Color(0xFFEF9A9A)),
    ],
    skillDescription:
        'Pixel art and retro game design specialist! I love creating charming pixel worlds and helping others master the art of pixel-perfect graphics.',
    skills: const [
      Skill(
        name: 'Pixel Art',
        insights: [
          'New to pixel art? Start with a small canvas - 32x32 pixels is perfect for learning fundamentals!',
          'Color is crucial in pixel art! I\'ll teach you how to create effective palettes with limited colors.',
          'Want smoother animations? Learn about pixel interpolation - it\'s the secret to fluid movement!',
        ],
      ),
      Skill(
        name: 'Retro Game Graphics',
        insights: [
          'Creating game sprites? Start with silhouettes - if it\'s readable in black, it\'ll work in any style!',
          'Background tiles need variety! I\'ll show you how to create interesting patterns that don\'t look repetitive.',
          'Want authentic retro style? Let\'s study classic games and understand their technical limitations!',
        ],
      ),
      Skill(
        name: 'Pixel Animation',
        insights: [
          'Animation principles apply at any resolution! Let\'s master squash, stretch, and anticipation in pixel form.',
          'Character animation too stiff? Add secondary motion - even simple cape movement adds life!',
          'Effects animation is fun! Learn to create explosions, sparkles, and magic effects pixel by pixel.',
        ],
      ),
    ],
    themeColor: const Color(0xFF66B2B2),
  ),
  Companion(
    id: '23',
    name: 'Aurora',
    avatarAsset: 'assets/jn_23.png',
    characterType: 'Lifestyle Expert',
    skillIcons: const [
      SkillIcon(icon: Icons.palette, color: Color(0xFF7CB342)),
      SkillIcon(icon: Icons.home, color: Color(0xFF5C6BC0)),
      SkillIcon(icon: Icons.brush, color: Color(0xFFEF9A9A)),
    ],
    skillDescription:
        'Interior styling and color specialist! I love transforming spaces through color psychology and creative arrangements.',
    skills: const [
      Skill(
        name: 'Color Theory',
        insights: [
          'Colors set the mood! Let\'s explore how different combinations can transform the feeling of a space.',
          'Stuck with color choices? Nature is the best inspiration - try picking palettes from your favorite landscapes!',
          'Want to experiment safely? Start with accessories - pillows and art are perfect for testing new color schemes!',
        ],
      ),
      Skill(
        name: 'Space Planning',
        insights: [
          'Room feeling cramped? Let\'s try the diagonal principle - placing furniture at angles can create more visual space!',
          'Light changes everything! I\'ll show you how to maximize natural light and create layered lighting plans.',
          'Need better flow? Start with traffic patterns - mapping how you move through space reveals optimal layouts!',
        ],
      ),
      Skill(
        name: 'Styling Techniques',
        insights: [
          'Master the rule of three! Grouping items in odd numbers creates more interesting arrangements.',
          'Want to style shelves like a pro? Mix heights, textures, and shapes for dynamic displays!',
          'Seasonal updates are fun! I\'ll teach you how to create flexible spaces that easily adapt to new looks.',
        ],
      ),
    ],
    themeColor: const Color(0xFFE6B3B3),
  ),
  Companion(
    id: '24',
    name: 'Sage',
    avatarAsset: 'assets/jn_24.png',
    characterType: 'Efficiency Expert',
    skillIcons: const [
      SkillIcon(icon: Icons.auto_awesome, color: Color(0xFF7CB342)),
      SkillIcon(icon: Icons.dashboard_customize, color: Color(0xFF5C6BC0)),
      SkillIcon(icon: Icons.extension, color: Color(0xFFEF9A9A)),
    ],
    skillDescription:
        'Workflow optimization and automation specialist! I love creating smart systems that make digital work smoother and more enjoyable.',
    skills: const [
      Skill(
        name: 'Task Automation',
        insights: [
          'Repetitive tasks eating your time? Let\'s start with simple automation tools! Even basic keyboard shortcuts can save hours.',
          'Want to connect your apps? I\'ll show you how to use tools like IFTTT to create powerful automated workflows.',
          'Automation doesn\'t have to be complex! Start with one simple task and gradually build your system.',
        ],
      ),
      Skill(
        name: 'Digital Workflows',
        insights: [
          'Too many tools causing chaos? Let\'s create a streamlined workflow that connects your favorite apps seamlessly!',
          'Custom shortcuts are game-changers! I\'ll help you set up personalized commands for your most common tasks.',
          'Want better team coordination? Let\'s design automated notification systems that keep everyone in sync!',
        ],
      ),
      Skill(
        name: 'System Design',
        insights: [
          'Good systems should feel invisible! Let\'s create workflows that support your natural way of working.',
          'Starting with automation? Document your current process first - it reveals the best opportunities for improvement!',
          'Remember: the best system is one you\'ll actually use! Let\'s focus on practical solutions that fit your style.',
        ],
      ),
    ],
    themeColor: const Color(0xFF9DB4C0),
  ),
  Companion(
    id: '25',
    name: 'Echo',
    avatarAsset: 'assets/jn_25.png',
    characterType: 'Creative Expert',
    skillIcons: const [
      SkillIcon(icon: Icons.music_note, color: Color(0xFF7CB342)),
      SkillIcon(icon: Icons.piano, color: Color(0xFF5C6BC0)),
      SkillIcon(icon: Icons.queue_music, color: Color(0xFFEF9A9A)),
    ],
    skillDescription:
        'Music composition and songwriting enthusiast! I love helping others discover their musical voice and create memorable melodies.',
    skills: const [
      Skill(
        name: 'Songwriting',
        insights: [
          'Stuck on lyrics? Try free writing about your feelings first - don\'t judge, just let the words flow!',
          'Melody not working? Start with the rhythm of your words - natural speech patterns often make the best melodies.',
          'Want stronger hooks? Learn to use contrast between verses and chorus - it\'s all about building and releasing tension!',
        ],
      ),
      Skill(
        name: 'Music Theory',
        insights: [
          'Theory feeling overwhelming? Let\'s start with simple chord progressions that work in any style!',
          'Want to write better melodies? Understanding scales is key - I\'ll show you how to use them creatively.',
          'Harmony doesn\'t have to be complex! Master a few basic chord patterns and build from there.',
        ],
      ),
      Skill(
        name: 'Song Structure',
        insights: [
          'Good songs tell stories! Let\'s explore how different structures can enhance your message.',
          'Arrangement stuck? Try rearranging sections - sometimes a bridge works better as an intro!',
          'Want more dynamic songs? Learn to use build-ups and breakdowns effectively - timing is everything!',
        ],
      ),
    ],
    themeColor: const Color(0xFFB784A7),
  ),
  Companion(
    id: '26',
    name: 'Terra',
    avatarAsset: 'assets/jn_26.png',
    characterType: 'Lifestyle Expert',
    skillIcons: const [
      SkillIcon(icon: Icons.terrain, color: Color(0xFF7CB342)),
      SkillIcon(icon: Icons.eco, color: Color(0xFF5C6BC0)),
      SkillIcon(icon: Icons.local_florist, color: Color(0xFFEF9A9A)),
    ],
    skillDescription:
        'Indoor gardening and plant styling enthusiast! I love creating green sanctuaries and helping others discover the joy of growing things.',
    skills: const [
      Skill(
        name: 'Plant Care',
        insights: [
          'New to plants? Start with hardy varieties like pothos or snake plants - they\'re perfect for beginners!',
          'Want healthier plants? Understanding light conditions is key - I\'ll help you match plants to your space.',
          'Watering troubles? Learn to read your plants\' signals - they\'ll tell you exactly what they need!',
        ],
      ),
      Skill(
        name: 'Garden Design',
        insights: [
          'Creating a plant corner? Mix different leaf shapes and sizes for visual interest!',
          'Limited space? Try vertical gardening - wall planters and hanging baskets maximize green space!',
          'Want year-round interest? Combine plants with different growing seasons for constant beauty!',
        ],
      ),
      Skill(
        name: 'Plant Styling',
        insights: [
          'Choosing pots matters! Let\'s explore how different containers can enhance your plant display.',
          'Want a cohesive look? Create themes with pot colors and materials - it ties everything together!',
          'Plant arrangements should tell stories! I\'ll show you how to create focal points and layer plants effectively.',
        ],
      ),
    ],
    themeColor: const Color(0xFF98B4A6),
  ),
  Companion(
    id: '27',
    name: 'Neo',
    avatarAsset: 'assets/jn_27.png',
    characterType: 'Tech Expert',
    skillIcons: const [
      SkillIcon(icon: Icons.code, color: Color(0xFF7CB342)),
      SkillIcon(icon: Icons.terminal, color: Color(0xFF5C6BC0)),
      SkillIcon(icon: Icons.bug_report, color: Color(0xFFEF9A9A)),
    ],
    skillDescription:
        'Software craftsmanship enthusiast! I love building elegant solutions and helping others write better code through clean architecture and best practices.',
    skills: const [
      Skill(
        name: 'Clean Code',
        insights: [
          'Code readability is key! Let\'s explore how meaningful names and clear structure make code self-documenting.',
          'Want more maintainable code? Learn to write small, focused functions that do one thing well!',
          'Testing shouldn\'t be an afterthought! I\'ll show you how test-driven development can improve your code design.',
        ],
      ),
      Skill(
        name: 'Design Patterns',
        insights: [
          'Patterns seem complex? Start with the basics - understanding when to use them is more important than memorizing them!',
          'Want flexible code? Learn how composition can be better than inheritance in many cases.',
          'Struggling with dependencies? Let\'s explore how dependency injection can make your code more testable!',
        ],
      ),
      Skill(
        name: 'Code Review',
        insights: [
          'Code reviews should be constructive! Focus on patterns and principles rather than personal style.',
          'Want better pull requests? I\'ll teach you how to write clear descriptions and keep changes focused.',
          'Regular refactoring is crucial! Learn to identify code smells and when to address technical debt.',
        ],
      ),
    ],
    themeColor: const Color(0xFF7C99AC),
  ),
  Companion(
    id: '28',
    name: 'Stella',
    avatarAsset: 'assets/jn_28.png',
    characterType: 'Efficiency Expert',
    skillIcons: const [
      SkillIcon(icon: Icons.event_note, color: Color(0xFF7CB342)),
      SkillIcon(icon: Icons.checklist, color: Color(0xFF5C6BC0)),
      SkillIcon(icon: Icons.insights, color: Color(0xFFEF9A9A)),
    ],
    skillDescription:
        'Project planning and organization specialist! I love creating efficient systems and helping others achieve their goals through smart planning.',
    skills: const [
      Skill(
        name: 'Project Planning',
        insights: [
          'Big project ahead? Let\'s break it down into manageable chunks - small wins build momentum!',
          'Timeline unclear? I\'ll show you how to create realistic schedules with buffer time built in.',
          'Want better project tracking? Learn to set meaningful milestones that keep you motivated!',
        ],
      ),
      Skill(
        name: 'Task Management',
        insights: [
          'Too many tasks? Use the Eisenhower Matrix to prioritize - focus on what truly matters!',
          'Projects getting messy? Create clear categories and use tags to stay organized.',
          'Need better focus? I\'ll help you design a daily routine that maximizes your productive hours!',
        ],
      ),
      Skill(
        name: 'Resource Optimization',
        insights: [
          'Limited resources? Let\'s identify your constraints and find creative solutions!',
          'Want to work smarter? Learn to batch similar tasks for better efficiency.',
          'Time management issues? I\'ll show you how to track and optimize your daily patterns.',
        ],
      ),
    ],
    themeColor: const Color(0xFFA5B0C2),
  ),
  Companion(
    id: '29',
    name: 'Ray',
    avatarAsset: 'assets/jn_29.png',
    characterType: 'Creative Expert',
    skillIcons: const [
      SkillIcon(icon: Icons.light_mode, color: Color(0xFF7CB342)),
      SkillIcon(icon: Icons.camera, color: Color(0xFF5C6BC0)),
      SkillIcon(icon: Icons.color_lens, color: Color(0xFFEF9A9A)),
    ],
    skillDescription:
        'Lighting design and creative photography specialist! I love painting with light and helping others capture magical moments through creative lighting.',
    skills: const [
      Skill(
        name: 'Lighting Design',
        insights: [
          'Light is everything in photography! Let\'s start with understanding the qualities of different light sources.',
          'Want dramatic photos? Learn to use shadows intentionally - they\'re as important as the light!',
          'Color temperature matters! I\'ll show you how to mix different light sources creatively.',
        ],
      ),
      Skill(
        name: 'Creative Techniques',
        insights: [
          'Love experimental photos? Try light painting - it\'s like drawing with light in long exposures!',
          'Want unique portraits? Learn to use unconventional light sources for creative effects.',
          'Interested in night photography? Master slow shutter speeds and light trails!',
        ],
      ),
      Skill(
        name: 'Equipment Setup',
        insights: [
          'Starting with lighting? Begin with one light source - it\'s amazing what you can do with just one light!',
          'Want to build a lighting kit? I\'ll help you choose versatile tools that grow with your skills.',
          'Need portable solutions? Learn to work with natural light and simple modifiers!',
        ],
      ),
    ],
    themeColor: const Color(0xFFD4B499),
  ),
  Companion(
    id: '30',
    name: 'Jade',
    avatarAsset: 'assets/jn_30.png',
    characterType: 'Lifestyle Expert',
    skillIcons: const [
      SkillIcon(icon: Icons.dinner_dining, color: Color(0xFF7CB342)),
      SkillIcon(icon: Icons.kitchen, color: Color(0xFF5C6BC0)),
      SkillIcon(icon: Icons.restaurant_menu, color: Color(0xFFEF9A9A)),
    ],
    skillDescription:
        'Creative cooking and food styling enthusiast! I love experimenting with flavors and helping others discover the joy of creative cooking.',
    skills: const [
      Skill(
        name: 'Creative Cooking',
        insights: [
          'New to cooking? Start with one-pan recipes - they\'re simple but can be incredibly creative!',
          'Want to experiment? Learn about flavor profiles - understanding combinations leads to creative dishes!',
          'Kitchen confidence comes from practice! Start with basic techniques and build your skills gradually.',
        ],
      ),
      Skill(
        name: 'Food Styling',
        insights: [
          'Food styling starts with color! Learn to combine ingredients that create visual interest.',
          'Plating matters! I\'ll show you simple techniques to make everyday meals look special.',
          'Want better food photos? Understanding basic composition makes a huge difference!',
        ],
      ),
      Skill(
        name: 'Kitchen Organization',
        insights: [
          'Efficient cooking starts with good prep! Let\'s set up your workspace for smooth cooking flow.',
          'Want to cook more often? Organize your pantry for inspiration - seeing ingredients sparks creativity!',
          'Love trying new recipes? Learn to adapt them to your kitchen setup and available tools.',
        ],
      ),
    ],
    themeColor: const Color(0xFFB5C7B7),
  ),
  Companion(
    id: '31',
    name: 'Finn',
    avatarAsset: 'assets/jn_31.png',
    characterType: 'Tech Expert',
    skillIcons: const [
      SkillIcon(icon: Icons.memory, color: Color(0xFF7CB342)),
      SkillIcon(icon: Icons.smart_toy, color: Color(0xFF5C6BC0)),
      SkillIcon(icon: Icons.precision_manufacturing, color: Color(0xFFEF9A9A)),
    ],
    skillDescription:
        'Hardware hacking and DIY electronics enthusiast! I love building custom gadgets and teaching others how to bring their tech ideas to life.',
    skills: const [
      Skill(
        name: 'Circuit Design',
        insights: [
          'New to electronics? Start with simple LED circuits - they teach the basics of components and connections!',
          'Want to prototype quickly? Breadboards are your friend - I\'ll show you how to test circuits before soldering.',
          'Ready for custom projects? Learn to read datasheets - they\'re like recipe books for electronics!',
        ],
      ),
      Skill(
        name: 'Microcontrollers',
        insights: [
          'Arduino seems complex? Let\'s start with basic sensors - even simple projects can be super useful!',
          'Want to make interactive gadgets? I\'ll teach you how to combine inputs and outputs creatively.',
          'Love automation? Learn to program simple routines - your desk lamp could change color with the weather!',
        ],
      ),
      Skill(
        name: 'Project Building',
        insights: [
          'First custom build? Start with a clear plan - sketching your idea helps spot potential issues early.',
          'Need a sturdy case? I\'ll show you how to design and 3D print custom enclosures.',
          'Troubleshooting is key! Learn to use multimeters and logic analyzers to debug your creations.',
        ],
      ),
    ],
    themeColor: const Color(0xFF8BA6B9),
  ),
  Companion(
    id: '32',
    name: 'Iris',
    avatarAsset: 'assets/jn_32.png',
    characterType: 'Creative Expert',
    skillIcons: const [
      SkillIcon(icon: Icons.format_paint, color: Color(0xFF7CB342)),
      SkillIcon(icon: Icons.brush, color: Color(0xFF5C6BC0)),
      SkillIcon(icon: Icons.palette, color: Color(0xFFEF9A9A)),
    ],
    skillDescription:
        'Digital painting and illustration enthusiast! I love creating colorful artworks and helping others develop their artistic style.',
    skills: const [
      Skill(
        name: 'Digital Painting',
        insights: [
          'New to digital art? Start with basic brush techniques - understanding pressure sensitivity is key!',
          'Want more dynamic artwork? Learn to use layers effectively - they give you amazing flexibility.',
          'Color mixing trouble? I\'ll show you how to create custom palettes that work harmoniously!',
        ],
      ),
      Skill(
        name: 'Character Design',
        insights: [
          'Character design starts with silhouettes - if it\'s recognizable in black, it\'s a strong design!',
          'Want more expressive characters? Study gesture drawing - it brings life to your illustrations!',
          'Design feeling flat? Add personal details and props that tell your character\'s story!',
        ],
      ),
      Skill(
        name: 'Art Fundamentals',
        insights: [
          'Struggling with perspective? Let\'s master the basics - even simple boxes can improve your spatial understanding!',
          'Want better compositions? Learn to use the rule of thirds and leading lines effectively.',
          'Light and shadow confusing? Start with simple forms - understanding basic lighting will transform your art!',
        ],
      ),
    ],
    themeColor: const Color(0xFFB4A8BE),
  ),
  Companion(
    id: '33',
    name: 'Atlas',
    avatarAsset: 'assets/jn_33.png',
    characterType: 'Lifestyle Expert',
    skillIcons: const [
      SkillIcon(icon: Icons.explore, color: Color(0xFF7CB342)),
      SkillIcon(icon: Icons.photo_camera, color: Color(0xFF5C6BC0)),
      SkillIcon(icon: Icons.map, color: Color(0xFFEF9A9A)),
    ],
    skillDescription:
        'Adventure photography and travel documentation enthusiast! I love capturing journey moments and helping others tell their travel stories.',
    skills: const [
      Skill(
        name: 'Adventure Photography',
        insights: [
          'Location scouting is key! Learn to research and plan your shots before arriving at a destination.',
          'Want better landscape photos? Golden and blue hours are magical - I\'ll teach you how to prepare for them!',
          'Action shots tricky? Master your camera\'s burst mode and learn to anticipate moments!',
        ],
      ),
      Skill(
        name: 'Travel Documentation',
        insights: [
          'Start a travel journal! Combining photos with notes creates richer memories of your adventures.',
          'Want to tell better stories? Learn to capture details that show local culture and character.',
          'Love sharing adventures? I\'ll show you how to create engaging photo series that tell complete stories!',
        ],
      ),
      Skill(
        name: 'Gear Management',
        insights: [
          'Packing for adventure? Learn to choose versatile gear that works in multiple situations!',
          'Camera gear needs protection! I\'ll share my tips for keeping equipment safe in challenging conditions.',
          'Want to travel light? Master the art of minimal gear - sometimes a phone camera is all you need!',
        ],
      ),
    ],
    themeColor: const Color(0xFF9DB4AB),
  ),
  Companion(
    id: '34',
    name: 'Nova',
    avatarAsset: 'assets/jn_34.png',
    characterType: 'Efficiency Expert',
    skillIcons: const [
      SkillIcon(icon: Icons.speed, color: Color(0xFF7CB342)),
      SkillIcon(icon: Icons.trending_up, color: Color(0xFF5C6BC0)),
      SkillIcon(icon: Icons.assessment, color: Color(0xFFEF9A9A)),
    ],
    skillDescription:
        'Performance optimization specialist! I love finding ways to streamline processes and help others achieve peak efficiency in their projects.',
    skills: const [
      Skill(
        name: 'Process Optimization',
        insights: [
          'Start with tracking! You can\'t improve what you don\'t measure - let\'s set up simple monitoring systems.',
          'Looking for bottlenecks? I\'ll show you how to identify and eliminate workflow constraints.',
          'Want sustainable improvements? Focus on small, consistent optimizations rather than big changes!',
        ],
      ),
      Skill(
        name: 'Workflow Analysis',
        insights: [
          'Process mapping reveals hidden inefficiencies - let\'s visualize your workflows!',
          'Automation opportunities everywhere! Learn to spot repetitive tasks that could be simplified.',
          'Team workflows need balance - I\'ll help you design systems that work for everyone!',
        ],
      ),
      Skill(
        name: 'Performance Metrics',
        insights: [
          'Choose meaningful metrics! Focus on indicators that directly relate to your goals.',
          'Data visualization is powerful - learn to present metrics in ways that inspire action!',
          'Regular reviews are key - let\'s set up simple dashboard systems for tracking progress.',
        ],
      ),
    ],
    themeColor: const Color(0xFF8EA4D2),
  ),
  Companion(
    id: '35',
    name: 'Spark',
    avatarAsset: 'assets/jn_35.png',
    characterType: 'Tech Expert',
    skillIcons: const [
      SkillIcon(icon: Icons.view_in_ar, color: Color(0xFF7CB342)),
      SkillIcon(icon: Icons.rotate_90_degrees_ccw, color: Color(0xFF5C6BC0)),
      SkillIcon(icon: Icons.animation, color: Color(0xFFEF9A9A)),
    ],
    skillDescription:
        '3D modeling and animation enthusiast! I love creating immersive digital worlds and helping others bring their ideas into three dimensions.',
    skills: const [
      Skill(
        name: '3D Modeling',
        insights: [
          'New to 3D? Start with primitive shapes - amazing models are built from simple building blocks!',
          'Topology matters! I\'ll show you how to create clean, efficient meshes that animate well.',
          'Want better models? Learn to use reference images - they\'re crucial for accurate proportions!',
        ],
      ),
      Skill(
        name: '3D Animation',
        insights: [
          'Animation principles work in 3D too! Let\'s master timing and spacing in the digital space.',
          'Rigging seems complex? Start with simple mechanical animations - they teach the basics!',
          'Want smoother motion? Learn to use graph editor - it\'s where the magic of animation happens!',
        ],
      ),
      Skill(
        name: 'Texturing',
        insights: [
          'Good texturing starts with UV mapping! I\'ll teach you how to unwrap models effectively.',
          'Want realistic materials? Learn PBR principles - they\'re the key to modern 3D graphics!',
          'Texturing taking forever? Master tileable textures and smart materials for efficiency!',
        ],
      ),
    ],
    themeColor: const Color(0xFF7EB5A6),
  ),
  Companion(
    id: '36',
    name: 'Melody',
    avatarAsset: 'assets/jn_36.png',
    characterType: 'Creative Expert',
    skillIcons: const [
      SkillIcon(icon: Icons.audiotrack, color: Color(0xFF7CB342)),
      SkillIcon(icon: Icons.surround_sound, color: Color(0xFF5C6BC0)),
      SkillIcon(icon: Icons.graphic_eq, color: Color(0xFFEF9A9A)),
    ],
    skillDescription:
        'Audio production and sound design specialist! I love crafting immersive soundscapes and helping others bring their sonic ideas to life.',
    skills: const [
      Skill(
        name: 'Audio Production',
        insights: [
          'Starting with audio? Learn to listen critically - every sound has texture and character!',
          'Mix sounding flat? Understanding frequency ranges is key to clarity and depth.',
          'Want professional sound? Master gain staging - it\'s the foundation of good audio!',
        ],
      ),
      Skill(
        name: 'Sound Design',
        insights: [
          'Create unique sounds by layering! Combine different textures for rich, interesting results.',
          'Want dynamic sound? Learn automation - small changes create living, breathing audio!',
          'Field recording is fun! I\'ll show you how to capture and transform everyday sounds.',
        ],
      ),
      Skill(
        name: 'Audio Storytelling',
        insights: [
          'Sound creates emotion! Learn how different elements build atmosphere and mood.',
          'Want engaging audio? Master the art of contrast - quiet moments make loud ones impactful!',
          'Pacing is crucial! I\'ll teach you how to use sound to control narrative flow.',
        ],
      ),
    ],
    themeColor: const Color(0xFFA799B7),
  ),
  Companion(
    id: '37',
    name: 'Cedar',
    avatarAsset: 'assets/jn_37.png',
    characterType: 'Lifestyle Expert',
    skillIcons: const [
      SkillIcon(icon: Icons.nature_people, color: Color(0xFF7CB342)),
      SkillIcon(icon: Icons.landscape, color: Color(0xFF5C6BC0)),
      SkillIcon(icon: Icons.photo_camera, color: Color(0xFFEF9A9A)),
    ],
    skillDescription:
        'Nature photography and outdoor adventure specialist! I love capturing the beauty of the natural world and helping others connect with nature through art.',
    skills: const [
      Skill(
        name: 'Nature Photography',
        insights: [
          'Light is everything in nature photos! Learn to work with golden and blue hours.',
          'Want better wildlife shots? Understanding animal behavior is key to anticipating moments!',
          'Macro photography opens a new world! I\'ll show you how to capture tiny natural wonders.',
        ],
      ),
      Skill(
        name: 'Adventure Planning',
        insights: [
          'Good adventures start with research! Learn to read weather patterns and natural conditions.',
          'Want unique shots? Explore off-peak times - early mornings often have the best light!',
          'Safety first in nature! I\'ll teach you essential preparation for outdoor photography.',
        ],
      ),
      Skill(
        name: 'Environmental Stories',
        insights: [
          'Every landscape tells a story! Learn to capture the character of natural places.',
          'Want compelling nature photos? Show the relationship between elements in the scene.',
          'Seasonal changes create opportunities! I\'ll help you plan shoots around natural cycles.',
        ],
      ),
    ],
    themeColor: const Color(0xFF8FB9AA),
  ),
];
