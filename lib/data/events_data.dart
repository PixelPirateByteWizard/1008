import '../models/event.dart';

// 定义事件类型常量
const String TYPE_HISTORY = 'history'; // 历史事件
const String TYPE_RANDOM = 'random'; // 随机事件
const String TYPE_SPECIAL = 'special'; // 特殊事件

final List<Event> events = [
  Event(
    id: 'yellow_turban_rebellion',
    title: '黄巾起义爆发',
    description:
        '汉灵帝光和七年（184年），张角、张宝、张梁三兄弟发动黄巾起义。他们以"苍天已死，黄天当立"为口号，号召农民起义反抗东汉朝廷。起义军发展迅速，波及八州，天下大乱。朝廷派遣大将军何进等人率军镇压。在这个动荡的时局中，你将如何自处？',
    triggerYear: 184,
    tags: ['战争', '起义', TYPE_HISTORY],
    choices: [
      EventChoice(
        text: '响应张角，加入黄巾军',
        effects: {
          'military': 2,
          'leadership': 1,
          'politics': -2,
          'intelligence': -1,
        },
        outcome: '你加入了黄巾军，在战斗中获得了一些军事经验，但也因此被朝廷通缉。',
      ),
      EventChoice(
        text: '加入官军讨伐黄巾',
        effects: {
          'military': 2,
          'leadership': 2,
          'politics': 1,
          'intelligence': -1,
        },
        outcome: '你加入了官军，参与平定黄巾之乱，获得了一定的声望。',
      ),
      EventChoice(
        text: '保持中立，避世隐居',
        effects: {
          'intelligence': 2,
          'politics': -2,
          'military': -1,
        },
        outcome: '你选择避世隐居，虽然免于战乱，但也错过了建功立业的机会。',
      ),
    ],
  ),
  Event(
    id: 'dong_zhuo_chaos',
    title: '董卓之乱',
    description:
        '汉灵帝驾崩后，何进召外兵入京，但被宦官设计杀害。混乱中，凉州军阀董卓率军进入洛阳，废立皇帝，独揽朝政。他暴虐无道，祸乱朝纲，导致天下群雄纷纷起兵讨伐。面对这场政治风暴，你将如何选择自己的道路？',
    triggerYear: 189,
    tags: ['政治', '战争', TYPE_HISTORY],
    choices: [
      EventChoice(
        text: '追随董卓',
        effects: {
          'military': 3,
          'politics': -3,
          'leadership': 2,
          'intelligence': -1,
        },
        outcome: '你追随董卓，获得了权势，但也背负了骂名。',
      ),
      EventChoice(
        text: '加入反董联军',
        effects: {
          'military': 2,
          'leadership': 2,
          'politics': 1,
          'intelligence': -2,
        },
        outcome: '你加入了讨伐董卓的联军，与各路诸侯结交。',
      ),
    ],
  ),
  Event(
    id: 'join_cao_cao',
    title: '曹操招贤',
    description:
        '董卓乱政之后，曹操在陈留开始起兵。他广布告示，招揽天下英才，承诺"唯才是举"，不论出身。许多文武之士被他的诚意打动，纷纷投奔。现在，你也收到了曹操的邀请，这是一个施展才华的好机会，但也意味着要与其他诸侯对立。你将如何抉择？',
    triggerYear: 190,
    requirements: {
      'intelligence': 6,
      'politics': 4,
    },
    tags: ['政治', '个人', TYPE_HISTORY],
    choices: [
      EventChoice(
        text: '投奔曹操',
        effects: {
          'politics': 3,
          'leadership': 2,
          'military': -1,
          'intelligence': -1,
        },
        outcome: '你成功投奔曹操，被委以重任。',
      ),
      EventChoice(
        text: '婉拒招揽',
        effects: {
          'intelligence': 2,
          'leadership': -1,
          'politics': -2,
        },
        outcome: '你婉拒了曹操的招揽，保持独立。',
      ),
    ],
  ),
  Event(
    id: 'battle_of_guandu',
    title: '官渡之战',
    description:
        '建安五年（200年），曹操与袁绍在官渡展开决战。袁绍兵多粮足，号称数十万众，而曹操兵少，处于劣势。但曹操用兵神速，把握战机，派徐晃、史涣偷袭袁绍粮草，一举奠定胜局。这是一场改变天下格局的大战，你愿意追随哪一方？',
    triggerYear: 200,
    requirements: {
      'military': 5,
      'leadership': 5,
    },
    tags: ['战争', '决战', TYPE_HISTORY],
    choices: [
      EventChoice(
        text: '追随曹操',
        effects: {
          'military': 3,
          'leadership': 2,
          'politics': 1,
          'intelligence': -2,
        },
        outcome: '你参与了官渡之战的胜利，立下赫赫战功。',
      ),
      EventChoice(
        text: '追随袁绍',
        effects: {
          'military': -2,
          'leadership': -2,
          'politics': -1,
          'intelligence': 1,
        },
        outcome: '你追随袁绍却遭遇惨败，从此落魄。',
      ),
    ],
  ),
  Event(
    id: 'three_kingdoms_form',
    title: '三国鼎立',
    description:
        '魏文帝黄初元年（220年），曹丕代汉称帝，建立魏国。次年，刘备在成都称帝，建立蜀汉。孙权则称吴王，后于229年称帝，建立东吴。至此，魏、蜀、吴三国鼎立的格局正式形成。在这个新的时代，每个势力都有其优势与劣势：魏国地广人多，占据中原；蜀汉据守西蜀，声称正统；东吴拥有长江天险，水军强大。面对这三足鼎立的局面，你将选择追随哪一方？',
    triggerYear: 220,
    tags: ['政治', '历史', TYPE_HISTORY],
    choices: [
      EventChoice(
        text: '归顺魏国',
        effects: {
          'politics': 2,
          'leadership': 2,
          'military': -1,
          'intelligence': -1,
        },
        outcome: '你选择归顺魏国，在曹魏政权中任职。',
      ),
      EventChoice(
        text: '投奔蜀汉',
        effects: {
          'military': 2,
          'leadership': 2,
          'politics': -1,
          'intelligence': -1,
        },
        outcome: '你投奔蜀汉，追随刘备集团。',
      ),
      EventChoice(
        text: '加入东吴',
        effects: {
          'intelligence': 2,
          'politics': 2,
          'military': -1,
          'leadership': -1,
        },
        outcome: '你加入东吴，在江东大地施展才华。',
      ),
    ],
  ),
  Event(
    id: 'red_cliff_battle',
    title: '赤壁之战',
    description:
        '建安十三年冬（208年），曹操率领号称八十万众的大军南下，意图一举吞并江东。孙权与刘备结盟，共同抵抗。周瑜、诸葛亮运用火攻，利用东南风焚烧曹军战船，创造了以少胜多的奇迹。这场改变历史走向的大战中，江北的曹操军势力庞大但不适水战，江南的孙刘联军则以火攻智取胜算。此时此刻，你将如何抉择？',
    triggerYear: 208,
    tags: ['战争', '决战', TYPE_HISTORY],
    requirements: {
      'military': 6,
      'intelligence': 6,
    },
    choices: [
      EventChoice(
        text: '加入孙刘联军',
        effects: {
          'military': 3,
          'leadership': 2,
          'intelligence': 1,
          'politics': -2,
        },
        outcome: '你参与了火烧赤壁的伟大战役，成为了一段传奇。',
      ),
      EventChoice(
        text: '追随曹操',
        effects: {
          'military': -2,
          'leadership': -1,
          'politics': -1,
          'intelligence': 1,
        },
        outcome: '曹军大败，你随军北撤，声望受损。',
      ),
    ],
  ),
  Event(
    id: 'liu_bei_take_shu',
    title: '刘备入蜀',
    description:
        '建安十六年（211年），刘备在诸葛亮的辅佐下，决定入蜀发展。蜀地险要，物产丰富，是建立基业的理想之地。刘备表面上是受益州牧刘璋邀请，共同抵抗张鲁和曹操，实则有吞并益州之心。这是一次充满机遇与风险的远征，既可能成就霸业，也可能一败涂地。在这个关键时刻，你是选择追随刘备入蜀打拼，还是留在荆州守成呢？',
    triggerYear: 211,
    tags: ['政治', '机遇', TYPE_HISTORY],
    requirements: {
      'intelligence': 5,
      'politics': 5,
    },
    choices: [
      EventChoice(
        text: '追随刘备入蜀',
        effects: {
          'politics': 2,
          'leadership': 2,
          'military': 1,
          'intelligence': -2,
        },
        outcome: '你追随刘备入蜀，参与建立蜀汉政权。',
      ),
      EventChoice(
        text: '留在荆州发展',
        effects: {
          'politics': 1,
          'military': 1,
          'leadership': -1,
          'intelligence': -1,
        },
        outcome: '你选择留在荆州，但此地终究难以久守。',
      ),
    ],
  ),
  Event(
    id: 'guan_yu_death',
    title: '关羽被杀',
    description:
        '建安二十四年（219年），关羽率军北伐曹魏，水淹七军，威震华北。然而在他攻打樊城时，孙权背盟，派吕蒙偷袭荆州，断其后路。关羽腹背受敌，在麦城被孙权军所杀。这一事件不仅导致荆州的失守，更成为蜀汉与东吴关系彻底破裂的导火索。刘备悲愤交加，决意兴兵伐吴，为关羽报仇。面对这场即将爆发的大战，你将如何建议？',
    triggerYear: 219,
    tags: ['战争', '转折点', TYPE_HISTORY],
    choices: [
      EventChoice(
        text: '劝说刘备理性对待',
        effects: {
          'intelligence': 2,
          'politics': 1,
          'military': -1,
          'leadership': -1,
        },
        outcome: '你的建议未被采纳，刘备仍决定伐吴。',
      ),
      EventChoice(
        text: '支持刘备伐吴',
        effects: {
          'military': 2,
          'leadership': 1,
          'intelligence': -2,
          'politics': -1,
        },
        outcome: '你随军出征，但北伐最终以失败告终。',
      ),
    ],
  ),
  Event(
    id: 'cao_cao_death',
    title: '曹操逝世',
    description:
        '建安二十五年（220年），曹操在洛阳病逝，临终前留下遗命，将魏国托付给长子曹丕。曹操一生戎马，统一北方，为魏国奠定了强大基础。他的去世标志着一个时代的结束，也预示着新时代的开始。曹丕继位后，面临是否废汉自立的重大抉择。在这个权力更迭的关键时刻，你将如何自处？',
    triggerYear: 220,
    tags: ['政治', '转折点', TYPE_HISTORY],
    choices: [
      EventChoice(
        text: '支持曹丕称帝',
        effects: {
          'politics': 2,
          'leadership': 2,
          'intelligence': -1,
          'military': -1,
        },
        outcome: '你支持魏国建立，获得重用。',
      ),
      EventChoice(
        text: '保持中立观望',
        effects: {
          'intelligence': 2,
          'politics': -1,
          'leadership': 1,
          'military': -2,
        },
        outcome: '你谨慎处事，等待局势明朗。',
      ),
    ],
  ),
  Event(
    id: 'liu_bei_emperor',
    title: '刘备称帝',
    description:
        '章武元年（221年），刘备在成都正式称帝，建立蜀汉政权，自称汉室正统。这是他历经数十年浮沉后终于完成的夙愿。蜀汉虽地处偏安，但有诸葛亮等能臣辅佐，加上天险之利，足以与魏国分庭抗礼。此时的蜀汉，既面临着建立新政权的机遇，也要应对内政、军事等各种挑战。在这个充满希望与挑战的时刻，你将作何选择？',
    triggerYear: 221,
    tags: ['政治', '建国', TYPE_HISTORY],
    choices: [
      EventChoice(
        text: '效忠蜀汉',
        effects: {
          'politics': 2,
          'leadership': 2,
          'military': -1,
          'intelligence': -1,
        },
        outcome: '你成为蜀汉重臣，参与治国。',
      ),
      EventChoice(
        text: '远离政治中心',
        effects: {
          'military': 2,
          'intelligence': 1,
          'politics': -2,
          'leadership': -1,
        },
        outcome: '你选择在边境发展，保持独立。',
      ),
    ],
  ),
  Event(
    id: 'yi_ling_battle',
    title: '夷陵之战',
    description:
        '章武二年（222年），刘备为报关羽之仇，亲率大军攻打东吴。孙权派年轻的陆逊为都督，与刘备在夷陵展开决战。陆逊采取坚壁清野之计，诱使蜀军深入，然后利用天气炎热，地形险要，对蜀军发动火攻。这场大战最终以蜀军惨败告终，不仅折损大量兵力，更打击了蜀汉的元气。在这场关系蜀汉命运的大战前夕，你将如何建议？',
    triggerYear: 222,
    tags: ['战争', '重大战役', TYPE_HISTORY],
    choices: [
      EventChoice(
        text: '参与进攻',
        effects: {
          'military': 2,
          'leadership': 1,
          'intelligence': -2,
          'politics': -1,
        },
        outcome: '蜀军大败，你随军撤退。',
      ),
      EventChoice(
        text: '劝阻出兵',
        effects: {
          'intelligence': 2,
          'politics': 1,
          'military': -2,
          'leadership': -1,
        },
        outcome: '你的建议未被采纳，但显示了远见。',
      ),
    ],
  ),
  Event(
    id: 'liu_bei_death',
    title: '刘备驾崩',
    description:
        '章武三年（223年），刘备在白帝城病重，临终前将年幼的太子刘禅托付给诸葛亮，请他辅佐新君治理国家。刘备一生传奇，从织席贩履的贩夫，成长为一代枭雄，最终建立蜀汉政权。他的去世不仅是一个时代的终结，更是蜀汉面临的重大考验。此时的蜀汉，既要应对内部权力交接，又要防备外部威胁。在这个关键时刻，你将如何选择自己的位置？',
    triggerYear: 223,
    tags: ['政治', '转折点', TYPE_HISTORY],
    choices: [
      EventChoice(
        text: '支持诸葛亮摄政',
        effects: {
          'politics': 2,
          'intelligence': 2,
          'military': -1,
          'leadership': -1,
        },
        outcome: '你成为蜀汉新政权的重要支持者。',
      ),
      EventChoice(
        text: '选择告老还乡',
        effects: {
          'intelligence': 2,
          'politics': -2,
          'military': -1,
          'leadership': -1,
        },
        outcome: '你选择退出政治舞台。',
      ),
    ],
  ),
  Event(
    id: 'northern_expeditions',
    title: '北伐魏国',
    description:
        '建兴五年（227年），诸葛亮开始实施北伐计划，欲恢复汉室河山。他多次率军出祁山，与魏国展开拉锯战。这些战役虽然没有取得决定性胜利，但打出了蜀汉的声威，也磨练了军队。然而，频繁的北伐也消耗了蜀汉大量的人力物力，是否应当继续北伐成为朝廷争论的焦点。面对这个攸关国运的重大抉择，你将作何选择？',
    triggerYear: 227,
    tags: ['战争', '军事行动', TYPE_HISTORY],
    choices: [
      EventChoice(
        text: '随军北伐',
        effects: {
          'military': 2,
          'leadership': 2,
          'intelligence': -1,
          'politics': -1,
        },
        outcome: '你在军中得到历练，但北伐未能成功。',
      ),
      EventChoice(
        text: '留守后方',
        effects: {
          'politics': 2,
          'intelligence': 2,
          'military': -2,
          'leadership': -1,
        },
        outcome: '你协助治理后方，保障军需供给。',
      ),
    ],
  ),
  Event(
    id: 'zhuge_liang_death',
    title: '诸葛亮逝世',
    description:
        '建兴十二年（234年），诸葛亮在五丈原病逝，享年54岁。他一生鞠躬尽瘁，为蜀汉呕心沥血，既是杰出的军事家，也是卓越的政治家。他的去世对蜀汉来说是巨大的损失，不仅失去了最重要的支柱，更动摇了蜀汉的根基。此时的蜀汉朝廷面临着是否继续北伐的重大抉择：姜维主张继承诸葛亮的遗志，继续北伐；而以费祎为首的一些大臣则主张休养生息。在这个关键时刻，你支持哪一方的主张？',
    triggerYear: 234,
    tags: ['政治', '转折点', TYPE_HISTORY],
    choices: [
      EventChoice(
        text: '支持姜维继续北伐',
        effects: {
          'military': 2,
          'leadership': 1,
          'intelligence': -2,
          'politics': -1,
        },
        outcome: '你支持继续北伐政策，但消耗巨大。',
      ),
      EventChoice(
        text: '主张休养生息',
        effects: {
          'intelligence': 2,
          'politics': 2,
          'military': -2,
          'leadership': -1,
        },
        outcome: '你的建议未被采纳，北伐仍在继续。',
      ),
    ],
  ),
  Event(
    id: 'goguryeo_invasion',
    title: '魏伐高句丽',
    description:
        '正始四年（238年），魏国派遣大将军司马懿率领三万精锐讨伐高句丽。这次远征不仅是为了打击高句丽的嚣张气焰，更是为了展示魏国的军事实力。司马懿率军长驱直入，攻克丸都，迫使高句丽王迁都避敌。这场大规模的对外战争，既是建功立业的机会，也充满危险和挑战。面对这次远征，你将如何选择？',
    triggerYear: 238,
    tags: ['战争', '对外战争', TYPE_HISTORY],
    choices: [
      EventChoice(
        text: '参与远征',
        effects: {
          'military': 2,
          'leadership': 2,
          'intelligence': -1,
          'politics': -1,
        },
        outcome: '你在远征中获得宝贵经验。',
      ),
      EventChoice(
        text: '留守国内',
        effects: {
          'politics': 2,
          'intelligence': 2,
          'military': -2,
          'leadership': -1,
        },
        outcome: '你选择专注内政发展。',
      ),
    ],
  ),
  Event(
    id: 'sima_yi_coup',
    title: '高平陵政变',
    description:
        '正始十年（249年），魏国发生震惊朝野的高平陵政变。曹爽专权，引起司马懿的不满。司马懿装病数年，在关键时刻发动政变，一举夺取曹爽等人的权力。这次政变标志着司马氏家族开始掌控魏国朝政，为日后代魏奠定基础。在这场惊心动魄的权力之争中，你将如何自处？支持司马懿可能会被视为背叛曹魏，保持中立则可能错失良机。',
    triggerYear: 249,
    tags: ['政治', '政变', TYPE_HISTORY],
    choices: [
      EventChoice(
        text: '支持司马懿',
        effects: {
          'politics': 2,
          'leadership': 2,
          'intelligence': -1,
          'military': -1,
        },
        outcome: '你获得司马氏信任，但背负骂名。',
      ),
      EventChoice(
        text: '保持中立',
        effects: {
          'intelligence': 2,
          'politics': 1,
          'leadership': -2,
          'military': -1,
        },
        outcome: '你谨慎度过政变，保全自身。',
      ),
    ],
  ),
  Event(
    id: 'zhuge_ke_death',
    title: '诸葛恪被杀',
    description:
        '建兴十一年（253年），吴国大将诸葛恪因进攻合肥失利，加上在朝中树敌太多，最终被孙峻所杀。诸葛恪本是东吴的重臣，有一定的政治和军事才能，但为人刚愎自用，且在军事上屡次失利，最终落得身死族灭的下场。这一事件反映了东吴政局的动荡，权力斗争的残酷。在这个危险的时局中，你将如何自处？',
    triggerYear: 253,
    tags: ['政治', '权力斗争', TYPE_HISTORY],
    choices: [
      EventChoice(
        text: '支持新政权',
        effects: {
          'politics': 2,
          'leadership': 1,
          'intelligence': -1,
          'military': -1,
        },
        outcome: '你适应新的政治格局。',
      ),
      EventChoice(
        text: '隐居避祸',
        effects: {
          'intelligence': 2,
          'politics': -2,
          'leadership': -1,
          'military': -1,
        },
        outcome: '你选择远离政治漩涡。',
      ),
    ],
  ),
  Event(
    id: 'shu_han_fall',
    title: '蜀汉灭亡',
    description:
        '景耀六年（263年），魏国派钟会、邓艾分道伐蜀。邓艾率军走阴平小道，翻越崇山峻岭，奇袭成都，而钟会则率主力正面进攻。面对强敌，蜀汉朝廷内部出现分歧：有人主张死守，有人主张投降。最终，刘禅选择投降，蜀汉灭亡。这是三国时代的重要转折点，标志着天下即将统一。在这个国破家亡的危急时刻，你将作何选择？',
    triggerYear: 263,
    tags: ['战争', '亡国', TYPE_HISTORY],
    choices: [
      EventChoice(
        text: '随刘禅投降',
        effects: {
          'politics': 1,
          'intelligence': 2,
          'military': -2,
          'leadership': -2,
        },
        outcome: '你保全性命，但失去地位。',
      ),
      EventChoice(
        text: '誓死抵抗',
        effects: {
          'military': 2,
          'leadership': 2,
          'politics': -2,
          'intelligence': -1,
        },
        outcome: '你在最后的抵抗中身受重伤。',
      ),
    ],
  ),
  Event(
    id: 'zhong_hui_rebellion',
    title: '钟会邓艾之乱',
    description:
        '景元元年（264年），在蜀地发生了一场震惊朝野的内乱。立下灭蜀大功的钟会、邓艾，因权力之争反目成仇。钟会诬陷邓艾谋反，同时自己也密谋造反。这场权力斗争最终以两人双双败亡告终，充分展现了乱世中人性的复杂和权力的诱惑。在这场突如其来的动乱中，你将如何自处？',
    triggerYear: 264,
    tags: ['战争', '叛乱', TYPE_HISTORY],
    choices: [
      EventChoice(
        text: '支持朝廷镇压',
        effects: {
          'politics': 2,
          'military': 1,
        },
        outcome: '你协助平定叛乱，获得赏识。',
      ),
      EventChoice(
        text: '明哲保身',
        effects: {
          'intelligence': 2,
          'politics': 1,
        },
        outcome: '你成功避开这场动乱。',
      ),
    ],
  ),
  Event(
    id: 'sima_yan_emperor',
    title: '司马炎称帝',
    description:
        '泰始元年（266年），司马炎废黜魏帝曹奂，自立为帝，国号晋。这标志着司马氏家族完成了夺取魏国政权的最后一步。司马炎建立晋朝后，开始着手统一天下的大业。此时的晋朝，拥有强大的军事力量和完善的政治体系，统一天下指日可待。在这个改朝换代的重要时刻，你将如何选择？',
    triggerYear: 266,
    tags: ['政治', '改朝换代', TYPE_HISTORY],
    choices: [
      EventChoice(
        text: '支持晋朝建立',
        effects: {
          'politics': 2,
          'leadership': 1,
        },
        outcome: '你在新朝获得重用。',
      ),
      EventChoice(
        text: '保持低调',
        effects: {
          'intelligence': 1,
          'politics': 1,
        },
        outcome: '你平稳度过政权更替。',
      ),
    ],
  ),
  Event(
    id: 'sun_hao_surrender',
    title: '吴国投降',
    description:
        '太康元年（280年），晋朝大将杜预、王浚率军攻打东吴。吴主孙皓在军事压力下，最终选择投降晋朝。至此，历经近百年的三国时代正式落下帷幕，天下重归一统。这不仅是一个时代的终结，更预示着新的历史篇章即将开启。面对这场历史性的统一，朝廷将对原吴地区展开全面治理，你将如何在这个新时代中定位自己？',
    triggerYear: 280,
    tags: ['政治', '统一', TYPE_HISTORY],
    choices: [
      EventChoice(
        text: '协助统一大业',
        effects: {
          'politics': 2,
          'leadership': 2,
        },
        outcome: '你参与完成统一，建立功勋。',
      ),
      EventChoice(
        text: '归隐山林',
        effects: {
          'intelligence': 2,
          'politics': -1,
        },
        outcome: '你选择退出仕途，归隐田园。',
      ),
    ],
  ),
  Event(
    id: 'xiongnu_invasion',
    title: '匈奴南下',
    description:
        '正始十二年（251年），魏国内部权力斗争正酣，司马氏与曹氏争权日趋激烈。匈奴首领刘渊察觉到魏国内部的混乱，率领大军南下入侵。这次入侵不仅威胁边境安全，更考验着魏国的军事调度和政治稳定。面对外患与内忧的双重挑战，朝廷既要应对匈奴的军事威胁，又要平衡内部各方势力。在这个危急时刻，边疆的防务成为关系国家安危的重中之重。',
    triggerYear: 251,
    tags: ['战争', '边患', TYPE_HISTORY],
    choices: [
      EventChoice(
        text: '参与边防',
        effects: {
          'military': 2,
          'leadership': 2,
        },
        outcome: '你在边境获得军事经验。',
      ),
      EventChoice(
        text: '专注内政',
        effects: {
          'politics': 2,
          'intelligence': 1,
        },
        outcome: '你协助处理后勤补给工作。',
      ),
    ],
  ),
  Event(
    id: 'jiang_wei_death',
    title: '姜维之死',
    description:
        '景耀七年（264年），蜀汉灭亡后，姜维被魏将钟会所擒。钟会密谋反叛，欲拉拢姜维为己所用。然而事情败露，钟会被诛。姜维作为蜀汉的重臣，继承诸葛亮北伐志向，多次率军攻魏。如今国破君亡，不愿降魏的姜维最终选择自尽，以死明志。他的结局象征着蜀汉最后一位军事统帅的陨落，也标志着三国鼎立格局的终结。',
    triggerYear: 264,
    tags: ['政治', '人物', TYPE_HISTORY],
    choices: [
      EventChoice(
        text: '追念旧主',
        effects: {
          'intelligence': 1,
          'politics': 1,
        },
        outcome: '你对汉室忠心获得后人称赞。',
      ),
      EventChoice(
        text: '适应新朝',
        effects: {
          'politics': 2,
          'leadership': 1,
        },
        outcome: '你成功在新政权下立足。',
      ),
    ],
  ),
  Event(
    id: 'deng_ai_death',
    title: '邓艾被诛',
    description:
        '景耀七年（264年），邓艾作为魏国名将，凭借出其不意的进军，从阴平小道突袭汉中，直取成都，成功灭亡蜀汉。然而功高震主，加上钟会的离间，司马昭对邓艾产生猜忌。最终，邓艾被诬告谋反，与其子邓忠一同被司马昭下令处死，其部下亦多遭牵连。这一事件再次印证了"功高盖主"的历史教训。',
    triggerYear: 264,
    tags: ['政治', '人物', TYPE_HISTORY],
    choices: [
      EventChoice(
        text: '为邓艾申辩',
        effects: {
          'politics': -1,
          'intelligence': 2,
        },
        outcome: '你的忠义之举受到敬重，但失去升迁机会。',
      ),
      EventChoice(
        text: '明哲保身',
        effects: {
          'politics': 1,
          'intelligence': 1,
        },
        outcome: '你谨慎处事，避免卷入是非。',
      ),
    ],
  ),
  Event(
    id: 'wu_rebellion',
    title: '吴国内乱',
    description:
        '永安三年（258年），吴国权臣孙綝专权跋扈，残害忠良。吴主孙亮年幼，朝廷大权被孙綝把持。孙綝滥杀大臣，导致朝廷动荡不安。后在孙休即位后，孙綝终被诛杀，其党羽亦遭清算。这场政变反映了东吴统治集团的内部矛盾。',
    triggerYear: 258,
    tags: ['政治', '内乱', TYPE_HISTORY],
    choices: [
      EventChoice(
        text: '支持孙休清君侧',
        effects: {
          'politics': 2,
          'leadership': 1,
        },
        outcome: '你参与铲除奸佞，获得重用。',
      ),
      EventChoice(
        text: '置身事外',
        effects: {
          'intelligence': 2,
          'politics': 1,
        },
        outcome: '你成功避开政治斗争。',
      ),
    ],
  ),
  Event(
    id: 'sima_shi_death',
    title: '司马师病逝',
    description:
        '正始六年（255年），魏国大将军、录尚书事司马师因眼疾发作，在征讨叛乱的途中病逝于许昌。司马师是司马懿之子，掌控魏国军政大权多年，对巩固司马氏家族的统治地位功不可没。他的弟弟司马昭继任其职位，进一步加强了司马氏对魏国的控制。这一事件标志着魏国权力的进一步转移。',
    triggerYear: 255,
    tags: ['政治', '权力更替', TYPE_HISTORY],
    choices: [
      EventChoice(
        text: '支持司马昭继位',
        effects: {
          'politics': 2,
          'leadership': 1,
        },
        outcome: '你获得新任实权者的信任。',
      ),
      EventChoice(
        text: '保持中立',
        effects: {
          'intelligence': 1,
          'politics': 1,
        },
        outcome: '你谨慎度过权力交替期。',
      ),
    ],
  ),
  Event(
    id: 'zhuge_dan_rebellion',
    title: '诸葛诞之乱',
    description:
        '甘露元年（257年），魏国淮南都督诸葛诞因不满司马昭独揽大权，在寿春起兵反叛。他联合吴国军队，与魏国展开激战。司马昭亲自率军围攻寿春，历时数月，最终攻破城池。诸葛诞兵败自尽，其家族被诛。这次叛乱失败后，司马氏对魏国的控制更加稳固。',
    triggerYear: 257,
    tags: ['战争', '叛乱', TYPE_HISTORY],
    choices: [
      EventChoice(
        text: '参与平叛',
        effects: {
          'military': 2,
          'leadership': 1,
        },
        outcome: '你在平定叛乱中立下战功。',
      ),
      EventChoice(
        text: '按兵不动',
        effects: {
          'intelligence': 2,
          'politics': 1,
        },
        outcome: '你保持中立，等待局势明朗。',
      ),
    ],
  ),
  Event(
    id: 'wang_ling_rebellion',
    title: '王凌谋反',
    description:
        '正始十二年（251年），魏国大将王凌与其弟王肃密谋废黜魏帝曹芳，改立曹叡之子东海王曹霖为帝。此事被司马师发觉，王凌被迫自尽，其家族遭到诛杀。这次谋反失败后，司马氏在魏国的势力进一步加强。',
    triggerYear: 251,
    tags: ['政治', '阴谋', TYPE_HISTORY],
    choices: [
      EventChoice(
        text: '检举阴谋',
        effects: {
          'politics': 2,
          'intelligence': 1,
        },
        outcome: '你及时揭发阴谋，获得赏识。',
      ),
      EventChoice(
        text: '静观其变',
        effects: {
          'intelligence': 2,
          'politics': 1,
        },
        outcome: '你谨慎对待，避免卷入。',
      ),
    ],
  ),
  Event(
    id: 'meet_master',
    title: '遇见名师',
    description:
        '在一次游历途中，你遇到了一位饱学之士。这位学者精通兵法、天文、地理等多门学问，见你资质聪颖，言谈不凡，便主动提出要收你为徒。这是一个难得的机会，但拜师学艺也意味着要投入大量时间和精力。',
    tags: ['个人', '机遇', TYPE_RANDOM],
    choices: [
      EventChoice(
        text: '拜师学习',
        effects: {
          'intelligence': 2,
          'politics': 1,
        },
        outcome: '你在师父的指导下学习兵法和治国之道。',
      ),
      EventChoice(
        text: '婉拒离去',
        effects: {
          'military': 1,
        },
        outcome: '你选择继续自己的道路。',
      ),
    ],
  ),
  Event(
    id: 'local_conflict',
    title: '地方动乱',
    description:
        '当地因税赋过重引发了一场动乱，农民揭竿而起，官府镇压不力。暴乱迅速蔓延到周边地区，导致商旅断绝、田地荒芜。百姓流离失所，盗匪乘机横行，地方秩序陷入混乱。朝廷已派兵前来平叛，但局势依然动荡不安。',
    tags: ['战争', '机遇', TYPE_RANDOM],
    choices: [
      EventChoice(
        text: '挺身而出平乱',
        effects: {
          'military': 2,
          'leadership': 1,
          'politics': -1,
        },
        outcome: '你成功平定了动乱，获得了声望。',
      ),
      EventChoice(
        text: '明哲保身',
        effects: {
          'politics': 1,
          'military': -1,
        },
        outcome: '你选择避开是非，保全自身。',
      ),
    ],
  ),
  Event(
    id: 'village_famine',
    title: '村庄饥荒',
    description:
        '连月无雨，天气炎热，农田龟裂，庄稼枯萎。一场严重的旱灾导致当地粮食歉收，百姓颗粒无收。村民们已经开始食用树皮草根充饥，不少人已经外出逃荒。留下的老弱妇孺面黄肌瘦，苦不堪言。若不及时救助，恐怕会有人饿死。',
    tags: ['灾害', '机遇', TYPE_RANDOM],
    choices: [
      EventChoice(
        text: '捐粮赈灾',
        effects: {
          'politics': 2,
          'leadership': 1,
          'military': -1,
        },
        outcome: '你的善举获得百姓爱戴。',
      ),
      EventChoice(
        text: '借机囤积居奇',
        effects: {
          'politics': -2,
          'intelligence': 1,
        },
        outcome: '你获得了利益，但失去了民心。',
      ),
    ],
  ),
  Event(
    id: 'bandit_raid',
    title: '山贼来袭',
    description:
        '一伙凶悍的山贼突然从山中杀出，正在劫掠附近的村庄。他们烧杀抢掠，无恶不作，村民们惊慌失措四处逃散。贼人打砸房屋，抢夺财物，甚至还绑架了一些妇孺。若不尽快采取行动，这些无辜百姓的生命财产都将受到严重威胁。',
    tags: ['战斗', '机遇', TYPE_RANDOM],
    choices: [
      EventChoice(
        text: '率众剿匪',
        effects: {
          'military': 2,
          'leadership': 2,
        },
        outcome: '你成功击退山贼，保护了百姓。',
      ),
      EventChoice(
        text: '与贼议和',
        effects: {
          'politics': 1,
          'intelligence': 1,
          'leadership': -1,
        },
        outcome: '你成功说服山贼停止劫掠，但声誉受损。',
      ),
    ],
  ),
  Event(
    id: 'merchant_dispute',
    title: '商贾纠纷',
    description:
        '城中两个商人因货物交易价格和质量问题发生激烈争执。一方声称对方提供的丝绸品质低劣，另一方则坚称货物完全合乎约定。双方各执一词，甚至在街市上大打出手，引来众多围观。现在他们都来到你面前，请求你主持公道。这个判决不仅关系到两家商铺的利益，更会影响本地的商业秩序。',
    tags: ['政治', '机遇', TYPE_RANDOM],
    choices: [
      EventChoice(
        text: '公正裁决',
        effects: {
          'politics': 2,
          'intelligence': 1,
        },
        outcome: '你的公正判决赢得了声誉。',
      ),
      EventChoice(
        text: '偏袒富商',
        effects: {
          'politics': -1,
          'intelligence': 2,
        },
        outcome: '你获得了好处，但失去了公信力。',
      ),
    ],
  ),
  Event(
    id: 'talented_youth',
    title: '遇见少年',
    description:
        '在一个阳光明媚的午后，你在城郊遇到一位气质不凡的少年。他博览群书，才华横溢，无论是诗词歌赋还是兵法谋略都有独到见解。这位少年虽出身寒门，却志向远大，正在四处寻求施展才华的机会。他听闻你的名声，特地前来投奔。这或许是一个提携人才的好机会。',
    tags: ['人才', '机遇', TYPE_RANDOM],
    choices: [
      EventChoice(
        text: '收为门客',
        effects: {
          'leadership': 2,
          'intelligence': 1,
        },
        outcome: '你获得了一个得力助手。',
      ),
      EventChoice(
        text: '推荐给他人',
        effects: {
          'politics': 1,
          'intelligence': 1,
        },
        outcome: '你结交了新的人脉。',
      ),
    ],
  ),
  Event(
    id: 'local_festival',
    title: '地方节庆',
    description:
        '当地正在举办一场盛大的传统节日庆典。街道上张灯结彩，热闹非凡。各地商贩纷纷赶来设摊，街头巷尾飘着诱人的小吃香气。民众们穿着节日盛装，载歌载舞。不仅有传统的舞狮表演，还有各种民间艺人展示绝活。这是一个难得的与民同乐的机会，也是了解民情、拉近与百姓距离的良机。',
    tags: ['文化', '机遇', TYPE_RANDOM],
    choices: [
      EventChoice(
        text: '参与庆典',
        effects: {
          'politics': 2,
          'leadership': 1,
        },
        outcome: '你通过庆典增进了与民众的感情。',
      ),
      EventChoice(
        text: '闭门不出',
        effects: {
          'intelligence': 1,
          'politics': -1,
        },
        outcome: '你错过了与民同乐的机会。',
      ),
    ],
  ),
  Event(
    id: 'family_feud',
    title: '家族纷争',
    description:
        '当地两个世代交好的大家族因为一片肥沃的土地的归属问题闹得不可开交。双方都拿出了祖辈传下来的地契，互不相让。随着争执升级，两家的年轻子弟已经发生多次冲突。如果不尽快解决，恐怕会影响地方安定。作为地方官员，你的处理方式将直接影响两个家族的未来关系。',
    tags: ['政治', '机遇', TYPE_RANDOM],
    choices: [
      EventChoice(
        text: '调解纷争',
        effects: {
          'politics': 2,
          'intelligence': 2,
        },
        outcome: '你成功化解了矛盾，获得两家感激。',
      ),
      EventChoice(
        text: '置身事外',
        effects: {
          'politics': -1,
          'intelligence': 1,
        },
        outcome: '你避免卷入纷争，但失去了立威机会。',
      ),
    ],
  ),
  Event(
    id: 'drought_crisis',
    title: '干旱危机',
    description:
        '连月来滴雨未下，大地龟裂，农田颗粒无收。农民们愁眉不展，牲畜也因缺水而日渐消瘦。若再得不到及时雨水，不仅会影响今年的收成，明年的播种也将成问题。作为地方官员，你必须想办法解决这场危机，否则百姓将无以为生。',
    tags: ['灾害', '机遇', TYPE_RANDOM],
    choices: [
      EventChoice(
        text: '组织水利工程',
        effects: {
          'leadership': 2,
          'politics': 2,
          'military': -1,
        },
        outcome: '你带领民众修建水利，解决了灌溉问题。',
      ),
      EventChoice(
        text: '向朝廷求援',
        effects: {
          'politics': 1,
          'intelligence': 1,
        },
        outcome: '你获得了朝廷的支援。',
      ),
    ],
  ),
  Event(
    id: 'wandering_scholar',
    title: '游学之士',
    description:
        '一位饱学之士途经此地，据说此人博览群书、学富五车，精通诗词歌赋和经史子集。他正在各地游历，寻找一个能施展才华的地方。若能延揽这样的人才，对地方文教发展必定大有裨益。',
    tags: ['文化', '机遇', TYPE_RANDOM],
    choices: [
      EventChoice(
        text: '延揽入府',
        effects: {
          'intelligence': 2,
          'politics': 1,
        },
        outcome: '你获得了一位良师益友。',
      ),
      EventChoice(
        text: '礼送离开',
        effects: {
          'politics': 1,
        },
        outcome: '你与其建立了友好关系。',
      ),
    ],
  ),
  Event(
    id: 'border_dispute',
    title: '边界纠纷',
    description:
        '与邻近地区因土地、水源和山林资源的归属问题发生了边界争端。双方各执一词，都声称对争议区域拥有历史管辖权。当地百姓也因此时常发生摩擦，若不妥善处理，恐将影响地方安定。作为地方官员，你需要在维护本地利益与保持邻里和睦之间做出权衡。',
    tags: ['政治', '机遇', TYPE_RANDOM],
    choices: [
      EventChoice(
        text: '强硬处理',
        effects: {
          'military': 2,
          'leadership': 1,
          'politics': -1,
        },
        outcome: '你维护了地方利益，但加剧了矛盾。',
      ),
      EventChoice(
        text: '和平协商',
        effects: {
          'politics': 2,
          'intelligence': 1,
        },
        outcome: '你通过外交手段解决了争端。',
      ),
    ],
  ),
  Event(
    id: 'market_opportunity',
    title: '市场机遇',
    description:
        '商人来报，邻近州府最近开辟了新的商道，使得商贸往来更加便利。不少商家看准时机，纷纷在当地设立商铺，开展贸易。这是一个难得的商业机会，若能把握住，不仅能促进本地经济发展，还能增加税收。然而投资经商终究有风险，需要慎重考虑。',
    tags: ['经济', '机遇', TYPE_RANDOM],
    choices: [
      EventChoice(
        text: '投资发展',
        effects: {
          'intelligence': 2,
          'politics': 1,
        },
        outcome: '你的投资获得了丰厚回报。',
      ),
      EventChoice(
        text: '谨慎观望',
        effects: {
          'intelligence': 1,
        },
        outcome: '你避免了可能的风险。',
      ),
    ],
  ),
  Event(
    id: 'military_training',
    title: '军事演练',
    description:
        '朝廷下令在各地举行大规模军事演练，以检验各地军备和将领能力。这次演练将汇集周边数个州府的精锐部队，进行对抗演习、阵法操练等多个科目。作为地方官员，这是一个难得的机会既能展示本地军事实力，又能学习其他地区的长处。演练规模宏大，将持续数日，各地将领都倾尽全力准备。',
    tags: ['军事', '机遇', TYPE_RANDOM],
    choices: [
      EventChoice(
        text: '积极参与',
        effects: {
          'military': 2,
          'leadership': 2,
        },
        outcome: '你在演练中展现了军事才能。',
      ),
      EventChoice(
        text: '派人观摩',
        effects: {
          'intelligence': 1,
          'military': 1,
        },
        outcome: '你获得了一些军事见识。',
      ),
    ],
  ),
  Event(
    id: 'plague_outbreak',
    title: '瘟疫爆发',
    description:
        '一场严重的瘟疫突然在当地蔓延开来。街道上人心惶惶,不少百姓已经染病倒下。医馆人满为患,大夫们日夜奔波救治。疫情有向周边扩散的趋势,如果不及时采取措施,后果不堪设想。作为地方官员,你必须尽快决定如何应对这场危机。',
    tags: ['灾害', '机遇', TYPE_RANDOM],
    choices: [
      EventChoice(
        text: '组织救治',
        effects: {
          'leadership': 2,
          'politics': 2,
          'military': -1,
        },
        outcome: '你的果断行动挽救了许多生命。',
      ),
      EventChoice(
        text: '封锁隔离',
        effects: {
          'politics': -1,
          'intelligence': 2,
        },
        outcome: '你控制住了疫情，但民心受损。',
      ),
    ],
  ),
  Event(
    id: 'local_celebration',
    title: '地方庆典',
    description:
        '当地正在举办一场盛大的传统庆典，四面八方的达官显贵、文人雅士纷纷前来参加。街道上张灯结彩、锣鼓喧天，百姓们欢聚庆祝，歌舞升平。这是一个难得的社交机会，也是展示自己的绝佳时机。',
    tags: ['文化', '机遇', TYPE_RANDOM],
    choices: [
      EventChoice(
        text: '主持庆典',
        effects: {
          'politics': 2,
          'leadership': 1,
        },
        outcome: '你成功举办庆典，提升了威望。',
      ),
      EventChoice(
        text: '低调参与',
        effects: {
          'intelligence': 1,
          'politics': 1,
        },
        outcome: '你结识了一些重要人物。',
      ),
    ],
  ),
  Event(
    id: 'talent_competition',
    title: '才艺比试',
    description:
        '当地官府举办了一场规模盛大的文武才艺大比，吸引了四方英才前来参加。文人比试诗词歌赋、书法绘画，武者角逐弓马骑射、兵器格斗。这是展现才能、结交贤士的绝佳机会。',
    tags: ['文化', '机遇', TYPE_RANDOM],
    choices: [
      EventChoice(
        text: '参加比试',
        effects: {
          'military': 2,
          'intelligence': 2,
        },
        outcome: '你在比试中崭露头角。',
      ),
      EventChoice(
        text: '担任评判',
        effects: {
          'politics': 2,
          'leadership': 1,
        },
        outcome: '你公正评判，赢得声誉。',
      ),
    ],
  ),
  Event(
    id: 'flood_disaster',
    title: '洪水灾害',
    description:
        '连日暴雨导致河水泛滥，多处堤防出现险情。城镇低洼地区已经开始积水，农田被淹，百姓流离失所。如果不尽快采取措施，将会造成更大的损失。这是一次考验治理能力的危机，也是展现领导才能的机会。',
    tags: ['灾害', '机遇', TYPE_RANDOM],
    choices: [
      EventChoice(
        text: '亲临指挥',
        effects: {
          'leadership': 3,
          'military': 1,
          'politics': 1,
        },
        outcome: '你成功组织抗洪，挽救了灾情。',
      ),
      EventChoice(
        text: '调拨物资',
        effects: {
          'politics': 2,
          'intelligence': 1,
        },
        outcome: '你的支援帮助民众度过难关。',
      ),
    ],
  ),
  Event(
    id: 'diplomatic_visit',
    title: '外地使者',
    description:
        '邻近地区派来使者，携带丰厚礼物拜访。使者表示希望建立长期友好往来，共同发展。这是一个加强区域联系、促进贸易往来的好机会，但也需要权衡各方利益和可能的政治影响。',
    tags: ['政治', '机遇', TYPE_RANDOM],
    choices: [
      EventChoice(
        text: '热情接待',
        effects: {
          'politics': 2,
          'intelligence': 1,
        },
        outcome: '你成功建立了友好关系。',
      ),
      EventChoice(
        text: '冷淡应对',
        effects: {
          'military': 1,
          'politics': -1,
        },
        outcome: '你保持了独立，但错失合作机会。',
      ),
    ],
  ),
  Event(
    id: 'construction_project',
    title: '工程建设',
    description:
        '地方官员报告当地基础设施年久失修，城墙有裂痕，水利设施效能低下，道路坑洼不平。百姓多有怨言，商旅往来不便。若能妥善规划整修，不仅可以改善民生，还能促进商贸发展。但工程浩大，需要投入大量人力物力，如何权衡利弊？',
    tags: ['发展', '机遇', TYPE_RANDOM],
    choices: [
      EventChoice(
        text: '全力支持',
        effects: {
          'leadership': 2,
          'politics': 2,
          'military': -1,
        },
        outcome: '你的建设改善了民生，获得赞誉。',
      ),
      EventChoice(
        text: '适度投入',
        effects: {
          'politics': 1,
          'intelligence': 1,
        },
        outcome: '你平衡了各方利益。',
      ),
    ],
  ),
  Event(
    id: 'hunting_expedition',
    title: '围猎活动',
    description:
        '当地官府组织了一场大规模围猎活动，邀请各路豪杰参与。这不仅是一场狩猎，更是展示武艺、建立人脉的重要场合。众多武将、官员都将出席，甚至可能有朝廷重臣莅临。围猎场地选在郊外的山林之中，猎物丰富，地形复杂。这是一个展现个人能力、结交权贵的绝佳机会。',
    tags: ['军事', '机遇', TYPE_RANDOM],
    choices: [
      EventChoice(
        text: '带队参与',
        effects: {
          'military': 2,
          'leadership': 2,
        },
        outcome: '你在围猎中展现了非凡的武艺。',
      ),
      EventChoice(
        text: '礼节性出席',
        effects: {
          'politics': 1,
          'intelligence': 1,
        },
        outcome: '你与其他参与者建立了联系。',
      ),
    ],
  ),
  Event(
    id: 'tax_collection',
    title: '赋税征收',
    description:
        '地方官府开始进行年度赋税征收工作。各地百姓需要缴纳田赋、人头税等多项税收。作为地方官员，你需要权衡朝廷税收任务和百姓负担，合理安排征税工作。近来天灾频发，许多农户收成不佳，这使得征税工作更加棘手。',
    tags: ['政治', '机遇', TYPE_RANDOM],
    choices: [
      EventChoice(
        text: '严格征收',
        effects: {
          'politics': -1,
          'leadership': 2,
          'military': 1,
        },
        outcome: '你完成了任务，但民怨四起。',
      ),
      EventChoice(
        text: '体恤民情',
        effects: {
          'politics': 2,
          'intelligence': 1,
          'military': -1,
        },
        outcome: '你获得民心，但影响了收入。',
      ),
    ],
  ),
  Event(
    id: 'religious_conflict',
    title: '宗教冲突',
    description:
        '城中不同信仰的民众因宗教仪式和教义解释发生激烈冲突。双方信徒在街头对峙，甚至发生了肢体冲突。随着事态升级，已经影响到了市场贸易和民众日常生活。若不及时处理，恐怕会演变成更大规模的动乱。',
    tags: ['政治', '机遇', TYPE_RANDOM],
    choices: [
      EventChoice(
        text: '调解矛盾',
        effects: {
          'politics': 2,
          'intelligence': 2,
        },
        outcome: '你成功化解了矛盾，维护了安定。',
      ),
      EventChoice(
        text: '取缔集会',
        effects: {
          'military': 1,
          'politics': -1,
          'leadership': 1,
        },
        outcome: '你强制平息了冲突，但引发不满。',
      ),
    ],
  ),
  Event(
    id: 'military_fame',
    title: '武艺超群',
    description:
        '你的武艺已经闻名遐迩，在江湖上声名鹊起。你精通刀枪剑戟，格斗技艺出神入化，曾在多次战役中一马当先，斩将夺旗。不论是单打独斗还是领军作战，都展现出非凡的武力。如今各路诸侯都派出使者，带着重金和高位来招揽你。你的威名让敌人闻风丧胆，也让盟友倍感安心。江湖传言你已达到了武学的极高境界，是当世少有的顶尖猛将。',
    tags: ['个人', '机遇', TYPE_SPECIAL],
    requirements: {
      'military': 8,
    },
    choices: [
      EventChoice(
        text: '选择最强大的势力',
        effects: {
          'politics': 2,
          'leadership': 1,
        },
        outcome: '你加入了强大的势力，获得重用。',
      ),
      EventChoice(
        text: '保持独立',
        effects: {
          'military': 1,
          'leadership': 2,
        },
        outcome: '你保持独立，成为一方豪强。',
      ),
    ],
  ),
  Event(
    id: 'strategic_talent',
    title: '谋略过人',
    description:
        '你的智谋之名传扬四方，被称为当世奇才。你善于运筹帷幄，决胜千里，不论是治国安邦还是行军布阵，都有独到见解。各路诸侯闻名而来，都想请你出山相助。文人学士也经常登门请教，希望能学习你的谋略智慧。你的一些策略建议不仅帮助他人化解了危机，更为天下大势指明了方向。如今你的声望达到巅峰，是时候决定如何运用这份才能了。',
    tags: ['个人', '机遇', TYPE_SPECIAL],
    requirements: {
      'intelligence': 8,
    },
    choices: [
      EventChoice(
        text: '出仕辅佐明主',
        effects: {
          'politics': 3,
          'leadership': 2,
        },
        outcome: '你找到明主，施展才华，声名鹊起。',
      ),
      EventChoice(
        text: '著书立说',
        effects: {
          'intelligence': 2,
          'politics': 1,
        },
        outcome: '你撰写兵法谋略，流传后世。',
      ),
    ],
  ),
  Event(
    id: 'leadership_talent',
    title: '统帅之才',
    description:
        '你展现出非凡的统兵才能，在多次战役中表现出色。你善于布阵调度，能准确把握战机，更重要的是深得军心。士兵们都称赞你体恤下属，关心将士，是个难得的统帅。在你的带领下，部队士气高昂，战斗力显著提升。不少诸侯都想招揽你为将，但你仍在思考该如何运用这份难得的才能。',
    tags: ['个人', '机遇', TYPE_SPECIAL],
    requirements: {
      'leadership': 8,
    },
    choices: [
      EventChoice(
        text: '组建精锐部队',
        effects: {
          'military': 3,
          'leadership': 2,
        },
        outcome: '你训练出一支精锐之师，战无不胜。',
      ),
      EventChoice(
        text: '担任军事顾问',
        effects: {
          'politics': 2,
          'intelligence': 2,
        },
        outcome: '你为诸侯出谋划策，建立军功。',
      ),
    ],
  ),
  Event(
    id: 'political_genius',
    title: '治世能臣',
    description:
        '你在政务治理上展现出卓越的才能，不仅精通税收、农业、水利等各项政务，更善于安抚民心、调解纷争。你的治理之下，百姓安居乐业，商贾往来频繁，城池日渐繁华。许多诸侯都慕名而来，希望能请你出山辅佐。你被誉为当世罕见的治世能臣，名声远播四方。',
    tags: ['个人', '机遇', TYPE_SPECIAL],
    requirements: {
      'politics': 8,
    },
    choices: [
      EventChoice(
        text: '主政一方',
        effects: {
          'politics': 3,
          'leadership': 2,
        },
        outcome: '你治理一方，政绩斐然。',
      ),
      EventChoice(
        text: '辅佐君主',
        effects: {
          'intelligence': 2,
          'politics': 2,
        },
        outcome: '你成为君主的得力助手。',
      ),
    ],
  ),
  Event(
    id: 'combat_master',
    title: '武艺绝伦',
    description:
        '经过多年的刻苦修炼和实战历练，你的武艺已达登峰造极之境。无论是刀法、剑术还是骑射技巧，都已臻至化境。江湖上提起你的名字，无不肃然起敬。在战场上，你更是所向披靡，能以一当百。你精妙的武艺不仅让敌人闻风丧胆，更让友军士气大振。',
    tags: ['个人', '机遇', TYPE_SPECIAL],
    requirements: {
      'military': 9,
    },
    choices: [
      EventChoice(
        text: '开创武艺流派',
        effects: {
          'military': 3,
          'leadership': 2,
        },
        outcome: '你创立了自己的武艺流派，广收门徒。',
      ),
      EventChoice(
        text: '担任军队统帅',
        effects: {
          'leadership': 3,
          'military': 2,
        },
        outcome: '你率领军队屡建战功。',
      ),
    ],
  ),
  Event(
    id: 'economic_talent',
    title: '经济才能',
    description:
        '你在经济管理方面展现出惊人的才能。无论是赋税征收、商业发展还是财政调控，你都能运筹帷幄、决胜千里。你提出的经济政策不仅让国库充盈，更让百姓安居乐业。你对市场规律的深刻理解和对经济形势的准确把握，让你成为了一位令人敬佩的经济管理人才。',
    tags: ['个人', '机遇', TYPE_SPECIAL],
    requirements: {
      'intelligence': 7,
      'politics': 5,
    },
    choices: [
      EventChoice(
        text: '管理国库',
        effects: {
          'politics': 3,
          'intelligence': 2,
        },
        outcome: '你管理国库有方，国力大增。',
      ),
      EventChoice(
        text: '发展商业',
        effects: {
          'intelligence': 3,
          'politics': 1,
        },
        outcome: '你建立商业网络，积累巨额财富。',
      ),
    ],
  ),
  Event(
    id: 'diplomatic_genius',
    title: '外交才能',
    description:
        '你在处理邦交事务时展现出非凡的外交才能。无论是与敌对势力谈判，还是与友好势力建立同盟，你总能找到恰当的方式化解矛盾、增进友谊。你的外交手腕不仅帮助化解了多次危机，更为自己赢得了"外交奇才"的美誉。各方势力都愿意与你打交道，这让你在复杂的政治局势中占据了独特的优势。',
    tags: ['个人', '机遇', TYPE_SPECIAL],
    requirements: {
      'politics': 7,
      'intelligence': 6,
    },
    choices: [
      EventChoice(
        text: '周旋列国',
        effects: {
          'politics': 3,
          'intelligence': 2,
        },
        outcome: '你成功在各国间建立同盟关系。',
      ),
      EventChoice(
        text: '担任使节',
        effects: {
          'intelligence': 2,
          'politics': 2,
        },
        outcome: '你作为使节出访他国，建立友好关系。',
      ),
    ],
  ),
  Event(
    id: 'popular_support',
    title: '民心所向',
    description:
        '随着你为政日久，爱民如子的治理方式和清廉正直的品格赢得了百姓的由衷爱戴。无论你走到哪里，都能听到百姓们的称颂和赞美。你在民间的声望达到了前所未有的高度，这不仅体现了你的政治智慧，更展现出你深厚的为官品德。这份民心的支持，将成为你日后建功立业的重要基石。',
    tags: ['个人', '机遇', TYPE_SPECIAL],
    requirements: {
      'politics': 6,
      'leadership': 6,
    },
    choices: [
      EventChoice(
        text: '建立基业',
        effects: {
          'leadership': 3,
          'politics': 2,
        },
        outcome: '你获得民心，建立了自己的势力。',
      ),
      EventChoice(
        text: '为民请命',
        effects: {
          'politics': 3,
          'intelligence': 1,
        },
        outcome: '你为百姓发声，赢得更多支持。',
      ),
    ],
  ),
  Event(
    id: 'strategic_marriage',
    title: '联姻机遇',
    description:
        '随着你的声望日渐提升，一个显赫的权贵家族向你抛出了橄榄枝，提议通过联姻来加强双方的政治联系。这个家族在朝廷中拥有重要影响力，若能结为姻亲，对你未来的发展必将大有裨益。然而，政治联姻往往意味着需要在个人情感和政治利益之间做出权衡。这个决定不仅关系到你个人的幸福，更会影响到你日后在政坛上的发展道路。',
    tags: ['个人', '机遇', TYPE_SPECIAL],
    requirements: {
      'politics': 7,
    },
    choices: [
      EventChoice(
        text: '接受联姻',
        effects: {
          'politics': 3,
          'leadership': 1,
        },
        outcome: '你通过联姻扩大了政治影响力。',
      ),
      EventChoice(
        text: '婉拒请求',
        effects: {
          'intelligence': 2,
          'politics': -1,
        },
        outcome: '你保持独立，但错过了一次机会。',
      ),
    ],
  ),
  Event(
    id: 'military_reform',
    title: '军制改革',
    description:
        '在统帅军队的过程中，你发现现有的军事体制存在诸多弊端。经过深入研究和实践，你对兵员选拔、军队编制、训练方式、后勤保障等方面都有了创新性的想法。这些改革思路可能会显著提升军队的战斗力，但同时也会触动一些将领的既得利益。你需要权衡如何推进这场改革。',
    tags: ['个人', '机遇', TYPE_SPECIAL],
    requirements: {
      'military': 7,
      'leadership': 6,
    },
    choices: [
      EventChoice(
        text: '推行改革',
        effects: {
          'military': 3,
          'leadership': 2,
        },
        outcome: '你的改革使军队战斗力大增。',
      ),
      EventChoice(
        text: '循序渐进',
        effects: {
          'intelligence': 2,
          'leadership': 1,
        },
        outcome: '你稳步推进改革，避免引起动荡。',
      ),
    ],
  ),
  Event(
    id: 'agricultural_innovation',
    title: '农业创新',
    description:
        '在治理地方期间，你深入研究农业生产，发现了一些提高产量的创新方法。这些方法包括改良耕作技术、优化灌溉系统、培育抗旱品种等。如果推广这些方法，可能会大大提高粮食产量，改善百姓生活。但新方法的推广需要投入大量人力物力，且可能会遇到农民的抵制。你需要权衡利弊，决定如何实施这些创新。',
    tags: ['个人', '机遇', TYPE_SPECIAL],
    requirements: {
      'intelligence': 6,
      'politics': 6,
    },
    choices: [
      EventChoice(
        text: '推广新法',
        effects: {
          'politics': 3,
          'intelligence': 2,
        },
        outcome: '你的方法大大提高了粮食产量。',
      ),
      EventChoice(
        text: '小范围试验',
        effects: {
          'intelligence': 2,
          'politics': 1,
        },
        outcome: '你谨慎地进行试验，积累经验。',
      ),
    ],
  ),
  Event(
    id: 'legal_reform',
    title: '法制改革',
    description:
        '在长期的政务实践中，你发现现行法律制度存在诸多弊端。有些法令过于严苛，有些处罚不够公平，还有一些条文已经不适应当前的社会状况。经过深入研究和思考，你提出了一系列改革建议，包括简化诉讼程序、统一量刑标准、完善监督机制等。这些建议引起了朝廷重臣的关注，但改革之路并非一帆风顺，你需要在坚持理想与务实妥协之间做出选择。',
    tags: ['个人', '机遇', TYPE_SPECIAL],
    requirements: {
      'politics': 8,
      'intelligence': 5,
    },
    choices: [
      EventChoice(
        text: '大刀阔斧',
        effects: {
          'politics': 3,
          'leadership': 2,
        },
        outcome: '你的改革使社会更加公平有序。',
      ),
      EventChoice(
        text: '温和改良',
        effects: {
          'intelligence': 2,
          'politics': 2,
        },
        outcome: '你采取温和方式推进改革。',
      ),
    ],
  ),
  Event(
    id: 'education_reform',
    title: '教育改革',
    description:
        '经过长期的教学实践和深入思考，你对当前的教育制度提出了创新性的改革方案。你认为现有的教学方式过于死板，不利于培养人才。你提出要改变课程设置，创新教学方法，注重因材施教。你的想法得到了一些开明官员的支持，但也面临着保守势力的质疑和阻碍。现在你需要决定如何推进这场教育改革。',
    tags: ['个人', '机遇', TYPE_SPECIAL],
    requirements: {
      'intelligence': 7,
      'politics': 5,
    },
    choices: [
      EventChoice(
        text: '创办学院',
        effects: {
          'intelligence': 3,
          'politics': 2,
        },
        outcome: '你创办学院，培养人才。',
      ),
      EventChoice(
        text: '编撰教材',
        effects: {
          'intelligence': 2,
          'politics': 1,
        },
        outcome: '你编写教材，推广新知识。',
      ),
    ],
  ),
  Event(
    id: 'medical_breakthrough',
    title: '医术精进',
    description:
        '经过多年的潜心研究和实践，你在医术上取得了重大突破。你不仅掌握了前人的医学精华，还创新性地发展出新的治疗方法。你对人体经络、药物性质都有着深刻的理解，能够准确诊断病症并对症下药。你开创的针灸手法和独特的药方在医学界引起轰动。现在你面临着是广泛推广新医术造福百姓，还是继续深入研究的选择。',
    tags: ['个人', '机遇', TYPE_SPECIAL],
    requirements: {
      'intelligence': 7,
    },
    choices: [
      EventChoice(
        text: '广济天下',
        effects: {
          'politics': 2,
          'intelligence': 3,
        },
        outcome: '你救治百姓，名声远播。',
      ),
      EventChoice(
        text: '专注研究',
        effects: {
          'intelligence': 3,
          'politics': 1,
        },
        outcome: '你潜心研究，医术更进一步。',
      ),
    ],
  ),
  Event(
    id: 'engineering_talent',
    title: '工程才能',
    description:
        '你天生就对建筑工程有着独特的见解。经过多年的实践和钻研，你已经成为一名出色的工程师。你精通各种建筑材料的特性和使用方法，能够根据地形和需求来设计最合适的建筑方案。在你的指导下，工程项目进展顺利，质量上乘。你对建筑技术的改良和工匠队伍的培训都很有研究，这让工程效率得到极大提升。你的工程才能已经声名远扬，不少势力都想请你主持重大工程。',
    tags: ['个人', '机遇', TYPE_SPECIAL],
    requirements: {
      'intelligence': 6,
      'leadership': 6,
    },
    choices: [
      EventChoice(
        text: '主持大工程',
        effects: {
          'leadership': 3,
          'intelligence': 2,
        },
        outcome: '你成功完成重大工程项目。',
      ),
      EventChoice(
        text: '改进技术',
        effects: {
          'intelligence': 3,
          'leadership': 1,
        },
        outcome: '你改进工程技术，提高效率。',
      ),
    ],
  ),
  Event(
    id: 'logistics_expert',
    title: '后勤专家',
    description:
        '你天生就对军需后勤有着独特的见解。经过多年的实践和钻研，你已经成为一名出色的后勤专家。你精通各种物资的调配和运输，能够根据战况和地形来制定最佳的补给方案。在你的管理下，后勤系统运转有序，保证前线将士衣食无忧。你对仓储管理的改良和运输队伍的训练都很有研究，这让军队的战斗力得到极大提升。你的后勤才能已经声名远扬，不少势力都想请你出山。',
    tags: ['个人', '机遇', TYPE_SPECIAL],
    requirements: {
      'intelligence': 6,
      'military': 6,
    },
    choices: [
      EventChoice(
        text: '管理军需',
        effects: {
          'military': 2,
          'intelligence': 3,
        },
        outcome: '你优化军需供应，提升战斗力。',
      ),
      EventChoice(
        text: '改革制度',
        effects: {
          'intelligence': 2,
          'leadership': 2,
        },
        outcome: '你改革后勤制度，提高效率。',
      ),
    ],
  ),
  Event(
    id: 'siege_expert',
    title: '攻城专家',
    description:
        '你天生就对攻城战有着独特的见解。经过多年的实战历练，你已经成为一名出色的攻城专家。你精通各种攻城器械的设计和使用，能够根据城防结构和地形来制定最佳的攻城方案。在你的指挥下，攻城部队可以有条不紊地展开行动，或是强攻突破，或是围困消耗。你对攻城器械的改良和攻城部队的训练都很有研究，这让你在攻城战中往往能事半功倍。你的攻城才能已经声名远扬，不少势力都想请你出山。',
    tags: ['个人', '机遇', TYPE_SPECIAL],
    requirements: {
      'military': 7,
      'intelligence': 5,
    },
    choices: [
      EventChoice(
        text: '研发器械',
        effects: {
          'military': 3,
          'intelligence': 2,
        },
        outcome: '你发明新的攻城器械，威力强大。',
      ),
      EventChoice(
        text: '训练部队',
        effects: {
          'military': 2,
          'leadership': 2,
        },
        outcome: '你训练特殊攻城部队。',
      ),
    ],
  ),
  Event(
    id: 'naval_expert',
    title: '水战专家',
    description:
        '你天生就对水战有着独特的天赋。经过多年的实战历练，你已经成为一名出色的水军统帅。你精通各种水战战术，能够根据风向、水流和地形来制定最佳的作战计划。在你的指挥下，水军可以灵活运用进退，或是分散包抄，或是集中突击。你对船只的改造和水军的训练都很有研究，这让你在水战中总能占据优势。你的水战才能已经声名远扬，不少势力都想招揽你。',
    tags: ['个人', '机遇', TYPE_SPECIAL],
    requirements: {
      'military': 7,
      'leadership': 5,
    },
    choices: [
      EventChoice(
        text: '发展水军',
        effects: {
          'military': 3,
          'leadership': 2,
        },
        outcome: '你建立强大水军，称霸水域。',
      ),
      EventChoice(
        text: '研究战术',
        effects: {
          'intelligence': 2,
          'military': 2,
        },
        outcome: '你创新水战战术，屡建战功。',
      ),
    ],
  ),
  Event(
    id: 'cavalry_expert',
    title: '骑战专家',
    description:
        '你天生就对骑术和骑兵作战有着独特的天赋。经过多年的训练和实战，你已经成为一名出类拔萃的骑兵统帅。你不仅能够在奔驰的战马上精准射箭，还精通各种骑兵战术和阵型变化。在你的指挥下，骑兵能够灵活机动，或是如疾风般突袭敌阵，或是如铁壁般稳固防守。你对马匹的驯养和骑兵的训练都有着独到的见解，这使你在战场上总能充分发挥骑兵的优势。你的骑战才能已经得到各路诸侯的认可，不少人都想请你出山相助。',
    tags: ['个人', '机遇', TYPE_SPECIAL],
    requirements: {
      'military': 7,
      'leadership': 5,
    },
    choices: [
      EventChoice(
        text: '训练骑兵',
        effects: {
          'military': 3,
          'leadership': 2,
        },
        outcome: '你训练出一支精锐骑兵。',
      ),
      EventChoice(
        text: '创新战术',
        effects: {
          'intelligence': 2,
          'military': 2,
        },
        outcome: '你创新骑兵战术，战功显著。',
      ),
    ],
  ),
  Event(
    id: 'archery_expert',
    title: '神射手',
    description:
        '你天生就具有非凡的箭术天赋，经过多年的刻苦练习，已经达到出神入化的境界。无论是在百步之外还是在奔马之上，你都能百发百中。你不仅能在战场上一箭封喉，更能在比武场上技惊四座。你对弓箭之道有着独到的见解，不仅精通各种射术技巧，还深谙弓弩制作之法。你的箭术威名远播，各路英雄豪杰都对你敬佩有加。',
    tags: ['个人', '机遇', TYPE_SPECIAL],
    requirements: {
      'military': 8,
    },
    choices: [
      EventChoice(
        text: '训练弓兵',
        effects: {
          'military': 3,
          'leadership': 2,
        },
        outcome: '你训练出一支神射手部队。',
      ),
      EventChoice(
        text: '建立射院',
        effects: {
          'military': 2,
          'leadership': 2,
        },
        outcome: '你创办射艺学院，培养人才。',
      ),
    ],
  ),
  Event(
    id: 'spy_master',
    title: '情报大师',
    description:
        '你天生就具有敏锐的洞察力和缜密的分析能力，善于从细微处发现关键线索。在收集和运用情报方面展现出非凡的才能，不仅能够建立起庞大的情报网络，还能准确分析和预判各种局势。你的这份能力让你在暗中运筹帷幄，往往能在关键时刻掌握先机。无论是军事情报还是政治动向，你都能运用自如，成为一位真正的情报大师。',
    tags: ['个人', '机遇', TYPE_SPECIAL],
    requirements: {
      'intelligence': 7,
      'politics': 5,
    },
    choices: [
      EventChoice(
        text: '建立谍网',
        effects: {
          'intelligence': 3,
          'politics': 2,
        },
        outcome: '你建立庞大情报网络。',
      ),
      EventChoice(
        text: '专注分析',
        effects: {
          'intelligence': 2,
          'politics': 2,
        },
        outcome: '你善于分析情报，预测局势。',
      ),
    ],
  ),
  Event(
    id: 'debate_master',
    title: '辩论大师',
    description:
        '你天生就具有出众的口才和说服力。在辩论中，你总能抓住要点，以清晰的逻辑和巧妙的论证打动他人。无论是在朝堂之上还是民间议事，你的言辞都能引起共鸣，让人信服。这份独特的才能让你在交涉和议政方面都占据优势。',
    tags: ['个人', '机遇', TYPE_SPECIAL],
    requirements: {
      'intelligence': 7,
      'politics': 5,
    },
    choices: [
      EventChoice(
        text: '从政议政',
        effects: {
          'politics': 3,
          'intelligence': 2,
        },
        outcome: '你在朝堂上运用辩才，建立威望。',
      ),
      EventChoice(
        text: '游说列国',
        effects: {
          'intelligence': 2,
          'politics': 2,
        },
        outcome: '你四处游说，建立广泛联系。',
      ),
    ],
  ),
  Event(
    id: 'cao_cao_death',
    title: '曹操逝世',
    description: '曹操因病在邺城逝世，其子曹丕继承丞相之位。朝中大臣纷纷劝进，魏国建立已成大势。这是魏蜀吴三国鼎立格局形成的重要转折点。',
    triggerYear: 220,
    tags: ['政治', '历史', TYPE_HISTORY],
    choices: [
      EventChoice(
        text: '支持曹丕称帝',
        effects: {
          'politics': 2,
          'leadership': 1,
        },
        outcome: '你支持曹丕称帝，参与建立魏国。',
      ),
      EventChoice(
        text: '保持中立',
        effects: {
          'intelligence': 1,
        },
        outcome: '你选择保持中立，静观其变。',
      ),
    ],
  ),
];

// 按年份获取历史事件
List<Event> getHistoricalEventsByYear(int year) {
  return events
      .where((event) =>
          event.tags.contains(TYPE_HISTORY) && event.triggerYear == year)
      .toList();
}

// 获取随机事件
List<Event> getRandomEvents() {
  return events.where((event) => event.tags.contains(TYPE_RANDOM)).toList();
}

// 获取特殊事件
List<Event> getSpecialEvents(Map<String, int> attributes) {
  return events
      .where((event) =>
              event.tags.contains(TYPE_SPECIAL) &&
              event.checkRequirements(attributes, 0) // 年份参数传0因为特殊事件不需要年份判断
          )
      .toList();
}
