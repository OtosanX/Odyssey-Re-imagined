'use strict';
// Source-art profiles; piece coordinates are independent of drawing layers.
module.exports=[
  {
    "id": "castle-moat",
    "kind": "ground",
    "tiles": [
      92,
      97,
      99,
      104,
      106,
      111,
      113,
      114,
      117,
      118
    ]
  },
  {
    "id": "castle-bridge",
    "kind": "bridge",
    "tiles": [
      115,
      116
    ]
  },
  {
    "id": "flat-decals-and-carpets",
    "kind": "ground",
    "tiles": [
      84,
      91,
      98,
      121,
      122,
      123,
      128,
      144,
      145,
      146,
      153,
      154,
      156,
      157,
      158,
      159,
      160,
      161,
      162,
      163,
      164,
      165,
      166,
      167,
      168,
      169,
      170,
      171,
      172,
      173,
      174,
      175,
      182,
      183,
      196,
      1065,
      1066,
      1071,
      1072,
      1073,
      1074,
      1078,
      1079,
      1080,
      1081,
      1085,
      1090,
      1091,
      1092,
      1349,
      1350,
      1351,
      1393
    ]
  },
  {
    "id": "standing-furnishings",
    "kind": "object",
    "tiles": [
      43,
      44,
      48,
      49,
      50,
      53,
      54,
      57,
      58,
      85,
      125,
      126,
      130,
      132,
      133,
      134,
      135,
      136,
      137,
      138,
      139,
      176,
      177,
      178,
      179,
      180,
      181,
      184,
      187,
      188,
      189,
      190,
      191,
      192,
      193,
      194,
      195,
      197,
      198,
      202,
      203,
      204,
      205,
      206,
      207,
      208,
      1102,
      1104,
      1106,
      1107,
      1109,
      1214,
      1215,
      1236,
      1237,
      1238,
      1248,
      1249,
      1300,
      1338,
      1339,
      1340,
      1341,
      1342,
      1345,
      1346,
      1348,
      3047,
      3048,
      3053,
      3054,
      3055
    ]
  },
  {
    "id": "timber-room-walls",
    "kind": "wall",
    "tiles": [
      1305,
      1306,
      1307,
      1308,
      1310,
      1311,
      1313,
      1316,
      1317,
      1319
    ]
  },
  {
    "id": "stone-gatehouse",
    "kind": "building",
    "tiles": [
      79,
      80,
      81,
      82,
      86,
      87,
      88,
      89,
      93,
      94,
      95,
      96,
      100,
      101,
      102,
      103,
      107,
      108,
      109,
      110
    ],
    "join": "assembly",
    "maxHeight": 8,
    "depth": 1.3,
    "model": "gatehouse"
  },
  {
    "id": "native-houses",
    "kind": "building",
    "tiles": [
      396,
      397,
      403,
      404,
      410,
      411,
      417,
      418,
      426,
      427,
      432,
      433,
      439,
      440,
      441,
      981,
      982,
      983,
      984,
      988,
      989,
      990,
      992,
      993,
      994,
      995,
      997,
      998,
      999,
      1000,
      1001,
      1002,
      1003,
      1004,
      1005,
      1006,
      1007,
      1009,
      1010,
      1011,
      1012,
      1013,
      1014,
      1016,
      1017,
      1018,
      1021,
      1023,
      1024,
      1026,
      1027,
      1028,
      1029,
      1032,
      1033,
      1034,
      1035,
      1037,
      1038,
      1039,
      1040,
      1041,
      1044,
      1045,
      1046,
      1047,
      1048,
      1049,
      1051,
      1052,
      1053,
      1054,
      1055,
      1056,
      1058,
      1059,
      1060,
      1061,
      1062,
      1063,
      1069,
      1075,
      1076,
      1082,
      1083,
      59,
      60,
      61,
      62
    ],
    "join": "source",
    "maxHeight": 8,
    "depth": 1.1
  },
  {
    "id": "straw-roof",
    "kind": "building",
    "tiles": [
      400,
      401,
      402,
      407,
      408,
      409,
      414,
      415,
      416,
      422
    ],
    "join": "source",
    "maxHeight": 6,
    "depth": 0.7
  },
  {
    "id": "native-trees",
    "kind": "plant",
    "tiles": [
      55,
      56,
      63,
      428,
      429,
      430,
      435,
      436,
      437,
      442,
      445,
      452,
      459,
      497,
      652,
      666,
      691,
      1184,
      1302,
      1492,
      1493,
      1494,
      1495,
      1496,
      1497,
      1498,
      1499,
      1500,
      1501,
      1502,
      1503,
      1504,
      1505,
      1506,
      1507,
      1508,
      1509,
      1510,
      1511,
      1512,
      1516,
      1517,
      1518,
      1519,
      1534,
      1541,
      1547,
      443,
      446,
      447,
      453,
      454,
      460
    ],
    "join": "individual",
    "maxHeight": 4,
    "depth": 0.035,
    "model": "tree",
    "form": "tree"
  },
  {
    "id": "tables-and-beds",
    "kind": "object",
    "tiles": [
      148,
      149,
      150,
      185,
      186,
      199,
      200,
      201
    ],
    "join": "source",
    "maxHeight": 3,
    "depth": 0.3
  },
  {
    "id": "reviewed-side-walls",
    "kind": "wall",
    "tiles": [
      269,
      270,
      291,
      292,
      308,
      309,
      355,
      503,
      515,
      516,
      543,
      544,
      729,
      736,
      737,
      740,
      741,
      744,
      786,
      788,
      880,
      881,
      886,
      887,
      902,
      928,
      929,
      945,
      946,
      1290,
      1298,
      1411,
      1412,
      1425,
      1426,
      1439,
      1440,
      1453,
      1454,
      1467,
      1468
    ]
  },
  {
    "id": "palms",
    "kind": "plant",
    "tiles": [
      217,
      224
    ],
    "join": "source",
    "maxHeight": 8,
    "depth": 0.035,
    "form": "tree",
    "pieces": {
      "217": [
        0,
        0
      ],
      "224": [
        0,
        1
      ]
    }
  },
  {
    "id": "stone-fountains",
    "kind": "object",
    "tiles": [
      233,
      234,
      235
    ],
    "join": "source",
    "maxHeight": 3,
    "depth": 0.35
  },
  {
    "id": "stairs-surfaces",
    "kind": "ground",
    "tiles": [
      250,
      251,
      252
    ]
  },
  {
    "id": "stone-room-frames",
    "kind": "wall",
    "tiles": [
      239
    ]
  },
  {
    "id": "round-stools",
    "kind": "object",
    "tiles": [
      148
    ],
    "join": "source",
    "model": "round-table",
    "depth": 0.5
  },
  {
    "id": "round-tables",
    "kind": "object",
    "tiles": [
      220
    ],
    "join": "source",
    "model": "round-table",
    "depth": 0.8
  },
  {
    "id": "wooden-barrels",
    "kind": "object",
    "tiles": [
      188,
      189
    ],
    "join": "source",
    "model": "barrel",
    "depth": 0.65
  },
  {
    "id": "reviewed-non-tree-surfaces",
    "kind": "ground",
    "tiles": [
      512,
      513,
      1331,
      1332,
      1363,
      1364,
      1365,
      1369,
      1370,
      1372,
      1377,
      1378,
      1379,
      1538,
      1539,
      1562,
      1594
    ]
  },
  {
    "id": "reviewed-non-tree-props",
    "kind": "object",
    "tiles": [
      1295,
      1320,
      1321,
      1322,
      1325,
      1326,
      1535,
      1540,
      1546,
      1560
    ]
  },
  {
    "id": "snow-shelters",
    "kind": "building",
    "join": "source",
    "tiles": [
      1548,
      1561,
      1565,
      1566,
      1567,
      1568
    ],
    "maxHeight": 4
  },
  {
    "id": "reviewed-masonry",
    "kind": "wall",
    "tiles": [
      1595,
      3039,
      3040,
      3041,
      3042,
      3046,
      3063,
      3064
    ]
  },
  {
    "id": "tavern-timber-walls",
    "kind": "wall",
    "tiles": [
      540,
      547
    ]
  },
  {
    "id": "classic-round-tree",
    "tiles": [
      56,
      63
    ],
    "kind": "plant",
    "join": "source",
    "model": "tree",
    "maxHeight": 3,
    "depth": 0.035,
    "form": "tree",
    "pieces": {
      "56": [
        0,
        0
      ],
      "63": [
        0,
        1
      ]
    }
  },
  {
    "id": "classic-orchard-tree",
    "tiles": [
      428,
      429,
      430,
      435,
      436,
      437,
      442,
      443,
      444
    ],
    "kind": "plant",
    "join": "source",
    "model": "tree",
    "maxHeight": 3,
    "depth": 0.035,
    "form": "tree",
    "pieces": {
      "428": [
        0,
        0
      ],
      "429": [
        1,
        0
      ],
      "430": [
        2,
        0
      ],
      "435": [
        0,
        1
      ],
      "436": [
        1,
        1
      ],
      "437": [
        2,
        1
      ],
      "442": [
        0,
        2
      ],
      "443": [
        1,
        2
      ],
      "444": [
        2,
        2
      ]
    }
  },
  {
    "id": "classic-broadleaf-tree",
    "tiles": [
      445,
      446,
      452,
      453,
      459,
      460
    ],
    "kind": "plant",
    "join": "source",
    "model": "tree",
    "maxHeight": 3,
    "depth": 0.035,
    "form": "tree",
    "pieces": {
      "445": [
        0,
        0
      ],
      "446": [
        1,
        0
      ],
      "452": [
        0,
        1
      ],
      "453": [
        1,
        1
      ],
      "459": [
        0,
        2
      ],
      "460": [
        1,
        2
      ]
    }
  },
  {
    "id": "classic-willow-tree",
    "tiles": [
      447,
      454
    ],
    "kind": "plant",
    "join": "source",
    "model": "tree",
    "maxHeight": 3,
    "depth": 0.035,
    "form": "tree",
    "pieces": {
      "447": [
        0,
        0
      ],
      "454": [
        0,
        1
      ]
    }
  },
  {
    "id": "classic-four-piece-house",
    "kind": "building",
    "tiles": [
      59,
      60,
      61,
      62
    ],
    "join": "house-four",
    "maxHeight": 2,
    "model": "house"
  },
  {
    "id": "small-bushes",
    "kind": "plant",
    "tiles": [
      50,
      53,
      496,
      666
    ],
    "join": "individual",
    "form": "shrub",
    "model": "tree",
    "depth": 0.08
  },
  {
    "id": "small-ground-plants",
    "kind": "plant",
    "tiles": [
      49
    ],
    "join": "individual",
    "form": "ground-plant",
    "model": "tree",
    "depth": 0.035
  },
  {
    "id": "wall-lookalike-actors",
    "kind": "object",
    "tiles": [
      44,
      239
    ]
  },
  {
    "id": "structural-masonry-surfaces",
    "kind": "wall",
    "tiles": [
      944,
      307,
      1408,
      1436,
      512,
      513,
      525,
      787,
      1291,
      311,
      310,
      514,
      1438,
      1409,
      1464,
      883,
      1410,
      542,
      541,
      267,
      524,
      1465,
      1421,
      1422,
      1435,
      1466,
      1596,
      1419,
      266
    ],
    "collisionOnly": true,
    "closed": true
  },
  {
    "id": "structural-cave-rock",
    "kind": "wall",
    "tiles": [
      717,
      719,
      710,
      718,
      725,
      734,
      724,
      726,
      733,
      713,
      723
    ],
    "collisionOnly": true
  },
  {
    "id": "intentional-wall-openings",
    "kind": "wall",
    "tiles": [
      245,
      547,
      269,
      270,
      740,
      741,
      786,
      788
    ],
    "opening": true
  },
  {
    "id": "portal-openings",
    "kind": "object",
    "tiles": [
      268
    ]
  },
  {
    "id": "classic-pine",
    "kind": "plant",
    "tiles": [
      497,
      504
    ],
    "join": "source",
    "model": "tree",
    "form": "tree",
    "depth": 0.12,
    "pieces": {
      "497": [
        0,
        0
      ],
      "504": [
        0,
        1
      ]
    }
  },
  {
    "id": "classic-fir",
    "kind": "plant",
    "tiles": [
      652,
      659
    ],
    "join": "source",
    "model": "tree",
    "form": "tree",
    "depth": 0.12,
    "pieces": {
      "652": [
        0,
        0
      ],
      "659": [
        0,
        1
      ]
    }
  },
  {
    "id": "classic-dead-tree",
    "kind": "plant",
    "tiles": [
      1295,
      1302
    ],
    "join": "source",
    "model": "tree",
    "form": "tree",
    "depth": 0.12,
    "pieces": {
      "1295": [
        0,
        0
      ],
      "1302": [
        0,
        1
      ]
    }
  },
  {
    "id": "native-pine",
    "kind": "plant",
    "tiles": [
      1492,
      1499
    ],
    "join": "source",
    "model": "tree",
    "form": "tree",
    "depth": 0.12,
    "pieces": {
      "1492": [
        0,
        0
      ],
      "1499": [
        0,
        1
      ]
    }
  },
  {
    "id": "native-tall-pine",
    "kind": "plant",
    "tiles": [
      1493,
      1500,
      1507
    ],
    "join": "source",
    "model": "tree",
    "form": "tree",
    "depth": 0.12,
    "pieces": {
      "1493": [
        0,
        0
      ],
      "1500": [
        0,
        1
      ],
      "1507": [
        0,
        2
      ]
    }
  },
  {
    "id": "native-red-tree",
    "kind": "plant",
    "tiles": [
      1494,
      1501
    ],
    "join": "source",
    "model": "tree",
    "form": "tree",
    "depth": 0.12,
    "pieces": {
      "1494": [
        0,
        0
      ],
      "1501": [
        0,
        1
      ]
    }
  },
  {
    "id": "native-branched-tree",
    "kind": "plant",
    "tiles": [
      1495,
      1496,
      1502,
      1503
    ],
    "join": "source",
    "model": "tree",
    "form": "tree",
    "depth": 0.12,
    "pieces": {
      "1495": [
        0,
        0
      ],
      "1496": [
        1,
        0
      ],
      "1502": [
        0,
        1
      ],
      "1503": [
        1,
        1
      ]
    }
  },
  {
    "id": "native-spruce",
    "kind": "plant",
    "tiles": [
      1498,
      1505
    ],
    "join": "source",
    "model": "tree",
    "form": "tree",
    "depth": 0.12,
    "pieces": {
      "1498": [
        0,
        0
      ],
      "1505": [
        0,
        1
      ]
    }
  },
  {
    "id": "native-weeping-tree",
    "kind": "plant",
    "tiles": [
      1509,
      1516
    ],
    "join": "source",
    "model": "tree",
    "form": "tree",
    "depth": 0.12,
    "pieces": {
      "1509": [
        0,
        0
      ],
      "1516": [
        0,
        1
      ]
    }
  },
  {
    "id": "native-young-pine",
    "kind": "plant",
    "tiles": [
      1510,
      1517
    ],
    "join": "source",
    "model": "tree",
    "form": "tree",
    "depth": 0.12,
    "pieces": {
      "1510": [
        0,
        0
      ],
      "1517": [
        0,
        1
      ]
    }
  },
  {
    "id": "snow-gold-tree",
    "kind": "plant",
    "tiles": [
      1534,
      1541
    ],
    "join": "source",
    "model": "tree",
    "form": "tree",
    "depth": 0.12,
    "pieces": {
      "1534": [
        0,
        0
      ],
      "1541": [
        0,
        1
      ]
    }
  },
  {
    "id": "snow-dead-tree",
    "kind": "plant",
    "tiles": [
      1540,
      1547
    ],
    "join": "source",
    "model": "tree",
    "form": "tree",
    "depth": 0.12,
    "pieces": {
      "1540": [
        0,
        0
      ],
      "1547": [
        0,
        1
      ]
    }
  },
  {
    "id": "snow-pine",
    "kind": "plant",
    "tiles": [
      1539,
      1546
    ],
    "join": "source",
    "model": "tree",
    "form": "tree",
    "depth": 0.12,
    "pieces": {
      "1539": [
        0,
        0
      ],
      "1546": [
        0,
        1
      ]
    }
  },
  {
    "id": "snow-fir",
    "kind": "plant",
    "tiles": [
      1548,
      1555
    ],
    "join": "source",
    "model": "tree",
    "form": "tree",
    "depth": 0.12,
    "pieces": {
      "1548": [
        0,
        0
      ],
      "1555": [
        0,
        1
      ]
    }
  },
  {
    "id": "dragon-decoration",
    "kind": "object",
    "tiles": [
      1184
    ],
    "join": "individual"
  },
  {
    "id": "small-cactus",
    "kind": "plant",
    "tiles": [
      1519
    ],
    "join": "individual",
    "model": "tree",
    "form": "cactus",
    "depth": 0.1
  },
  {
    "id": "classic-bare-tree",
    "kind": "plant",
    "tiles": [
      653,
      660
    ],
    "join": "source",
    "model": "tree",
    "form": "tree",
    "depth": 0.12,
    "pieces": {
      "653": [
        0,
        0
      ],
      "660": [
        0,
        1
      ]
    }
  },
  {
    "id": "classic-branched-bare-tree",
    "kind": "plant",
    "tiles": [
      654,
      661
    ],
    "join": "source",
    "model": "tree",
    "form": "tree",
    "depth": 0.12,
    "pieces": {
      "654": [
        0,
        0
      ],
      "661": [
        0,
        1
      ]
    }
  },
  {
    "id": "classic-leafy-tree",
    "kind": "plant",
    "tiles": [
      666,
      673
    ],
    "join": "source",
    "model": "tree",
    "form": "tree",
    "depth": 0.12,
    "pieces": {
      "666": [
        0,
        0
      ],
      "673": [
        0,
        1
      ]
    }
  },
  {
    "id": "classic-young-fir",
    "kind": "plant",
    "tiles": [
      675,
      682
    ],
    "join": "source",
    "model": "tree",
    "form": "tree",
    "depth": 0.12,
    "pieces": {
      "675": [
        0,
        0
      ],
      "682": [
        0,
        1
      ]
    }
  },
  {
    "id": "classic-dark-fir",
    "kind": "plant",
    "tiles": [
      684,
      691
    ],
    "join": "source",
    "model": "tree",
    "form": "tree",
    "depth": 0.12,
    "pieces": {
      "684": [
        0,
        0
      ],
      "691": [
        0,
        1
      ]
    }
  },
  {
    "id": "classic-golden-tree",
    "kind": "plant",
    "tiles": [
      685,
      692
    ],
    "join": "source",
    "model": "tree",
    "form": "tree",
    "depth": 0.12,
    "pieces": {
      "685": [
        0,
        0
      ],
      "692": [
        0,
        1
      ]
    }
  },
  {
    "id": "classic-red-leaf-tree",
    "kind": "plant",
    "tiles": [
      686,
      693
    ],
    "join": "source",
    "model": "tree",
    "form": "tree",
    "depth": 0.12,
    "pieces": {
      "686": [
        0,
        0
      ],
      "693": [
        0,
        1
      ]
    }
  },
  {
    "id": "classic-red-dead-tree",
    "kind": "plant",
    "tiles": [
      689,
      696
    ],
    "join": "source",
    "model": "tree",
    "form": "tree",
    "depth": 0.12,
    "pieces": {
      "689": [
        0,
        0
      ],
      "696": [
        0,
        1
      ]
    }
  },
  {
    "id": "reviewed-ground-surfaces-and-scatter",
    "kind": "ground",
    "tiles": [
      47,
      105,
      147,
      507,
      735,
      751,
      965,
      1228,
      1229,
      1450
    ]
  }
];
