// ignore_for_file: non_constant_identifier_names

import 'package:hive/hive.dart';

part 'recipe_rows.g.dart';

@HiveType(typeId: 0)
class RecipeRows extends HiveObject {
  @HiveField(0)
  final String RCP_PARTS_DTLS;
  @HiveField(1)
  final String RCP_WAY2;
  @HiveField(2)
  final String MANUAL_IMG20;
  @HiveField(3)
  final String MANUAL20;
  @HiveField(4)
  final String RCP_SEQ;
  @HiveField(5)
  final String INFO_NA;
  @HiveField(6)
  final String INFO_WGT;
  @HiveField(7)
  final String INFO_PRO;
  @HiveField(8)
  final String MANUAL_IMG13;
  @HiveField(9)
  final String MANUAL_IMG14;
  @HiveField(10)
  final String MANUAL_IMG15;
  @HiveField(11)
  final String MANUAL_IMG16;
  @HiveField(12)
  final String MANUAL_IMG10;
  @HiveField(13)
  final String MANUAL_IMG11;
  @HiveField(14)
  final String MANUAL_IMG12;
  @HiveField(15)
  final String MANUAL_IMG17;
  @HiveField(16)
  final String MANUAL_IMG18;
  @HiveField(17)
  final String MANUAL_IMG19;
  @HiveField(18)
  final String INFO_FAT;
  @HiveField(19)
  final String HASH_TAG;
  @HiveField(20)
  final String MANUAL_IMG02;
  @HiveField(21)
  final String MANUAL_IMG03;
  @HiveField(22)
  final String RCP_PAT2;
  @HiveField(23)
  final String MANUAL_IMG04;
  @HiveField(24)
  final String MANUAL_IMG05;
  @HiveField(25)
  final String MANUAL_IMG01;
  @HiveField(26)
  final String MANUAL01;
  @HiveField(27)
  final String ATT_FILE_NO_MK;
  @HiveField(28)
  final String MANUAL_IMG06;
  @HiveField(29)
  final String MANUAL_IMG07;
  @HiveField(30)
  final String MANUAL_IMG08;
  @HiveField(31)
  final String MANUAL_IMG09;
  @HiveField(32)
  final String MANUAL08;
  @HiveField(33)
  final String MANUAL09;
  @HiveField(34)
  final String MANUAL06;
  @HiveField(35)
  final String MANUAL07;
  @HiveField(36)
  final String MANUAL04;
  @HiveField(37)
  final String MANUAL05;
  @HiveField(38)
  final String MANUAL02;
  @HiveField(39)
  final String MANUAL03;
  @HiveField(40)
  final String ATT_FILE_NO_MAIN;
  @HiveField(41)
  final String MANUAL11;
  @HiveField(42)
  final String MANUAL12;
  @HiveField(43)
  final String MANUAL10;
  @HiveField(44)
  final String INFO_CAR;
  @HiveField(45)
  final String MANUAL19;
  @HiveField(46)
  final String INFO_ENG;
  @HiveField(47)
  final String MANUAL17;
  @HiveField(48)
  final String MANUAL18;
  @HiveField(49)
  final String RCP_NM;
  @HiveField(50)
  final String MANUAL15;
  @HiveField(51)
  final String MANUAL16;
  @HiveField(52)
  final String MANUAL13;
  @HiveField(53)
  final String MANUAL14;

  RecipeRows(
      this.RCP_PARTS_DTLS,
      this.RCP_WAY2,
      this.MANUAL_IMG20,
      this.MANUAL20,
      this.RCP_SEQ,
      this.INFO_NA,
      this.INFO_WGT,
      this.INFO_PRO,
      this.MANUAL_IMG13,
      this.MANUAL_IMG14,
      this.MANUAL_IMG15,
      this.MANUAL_IMG16,
      this.MANUAL_IMG10,
      this.MANUAL_IMG11,
      this.MANUAL_IMG12,
      this.MANUAL_IMG17,
      this.MANUAL_IMG18,
      this.MANUAL_IMG19,
      this.INFO_FAT,
      this.HASH_TAG,
      this.MANUAL_IMG02,
      this.MANUAL_IMG03,
      this.RCP_PAT2,
      this.MANUAL_IMG04,
      this.MANUAL_IMG05,
      this.MANUAL_IMG01,
      this.MANUAL01,
      this.ATT_FILE_NO_MK,
      this.MANUAL_IMG06,
      this.MANUAL_IMG07,
      this.MANUAL_IMG08,
      this.MANUAL_IMG09,
      this.MANUAL08,
      this.MANUAL09,
      this.MANUAL06,
      this.MANUAL07,
      this.MANUAL04,
      this.MANUAL05,
      this.MANUAL02,
      this.MANUAL03,
      this.ATT_FILE_NO_MAIN,
      this.MANUAL11,
      this.MANUAL12,
      this.MANUAL10,
      this.INFO_CAR,
      this.MANUAL19,
      this.INFO_ENG,
      this.MANUAL17,
      this.MANUAL18,
      this.RCP_NM,
      this.MANUAL15,
      this.MANUAL16,
      this.MANUAL13,
      this.MANUAL14);

  Map<String, dynamic> toMap() {
    return {
      'TITLE': {
        'RCP_NM': RCP_NM,
        'ATT_FILE_NO_MAIN': ATT_FILE_NO_MAIN,
      },
      'INTEGRATION': {
        'RCP_PARTS_DTLS': RCP_PARTS_DTLS,
      },
      // 'RCP_WAY2': RCP_WAY2,
      // 'RCP_PAT2': RCP_PAT2,
      'INFOMATION': {
        'INFO_NA': '나트륨 : $INFO_NA',
        'INFO_WGT': INFO_WGT == "" ? "" : '중량(1인분) : $INFO_WGT',
        'INFO_PRO': '단백질 : $INFO_PRO',
        'INFO_FAT': '지방 : $INFO_FAT',
        'INFO_CAR': '탄수화물 : $INFO_CAR',
        'INFO_ENG': '열량 : $INFO_ENG',
      },
      'HASHTAG': {
        'HASH_TAG': HASH_TAG,
      },
      'MANUAL1': {
        'MANUAL_IMG01': MANUAL_IMG01,
        'MANUAL01': MANUAL01,
      },
      'MANUAL2': {
        'MANUAL_IMG02': MANUAL_IMG02,
        'MANUAL02': MANUAL02,
      },
      'MANUAL3': {
        'MANUAL_IMG03': MANUAL_IMG03,
        'MANUAL03': MANUAL03,
      },
      'MANUAL4': {
        'MANUAL_IMG04': MANUAL_IMG04,
        'MANUAL04': MANUAL04,
      },
      'MANUAL5': {
        'MANUAL_IMG05': MANUAL_IMG05,
        'MANUAL05': MANUAL05,
      },
      'MANUAL6': {
        'MANUAL_IMG06': MANUAL_IMG06,
        'MANUAL06': MANUAL06,
      },
      'MANUAL7': {
        'MANUAL_IMG07': MANUAL_IMG07,
        'MANUAL07': MANUAL07,
      },
      'MANUAL8': {
        'MANUAL_IMG08': MANUAL_IMG08,
        'MANUAL08': MANUAL08,
      },
      'MANUAL9': {
        'MANUAL_IMG09': MANUAL_IMG09,
        'MANUAL09': MANUAL09,
      },
      'MANUAL10': {
        'MANUAL_IMG10': MANUAL_IMG10,
        'MANUAL10': MANUAL10,
      },
      'MANUAL11': {
        'MANUAL_IMG11': MANUAL_IMG11,
        'MANUAL11': MANUAL11,
      },
      'MANUAL12': {
        'MANUAL_IMG12': MANUAL_IMG12,
        'MANUAL12': MANUAL12,
      },
      'MANUAL13': {
        'MANUAL_IMG13': MANUAL_IMG13,
        'MANUAL13': MANUAL13,
      },
      'MANUAL14': {
        'MANUAL_IMG14': MANUAL_IMG14,
        'MANUAL14': MANUAL14,
      },
      'MANUAL15': {
        'MANUAL_IMG15': MANUAL_IMG15,
        'MANUAL15': MANUAL15,
      },
      'MANUAL16': {
        'MANUAL_IMG16': MANUAL_IMG16,
        'MANUAL16': MANUAL16,
      },
      'MANUAL17': {
        'MANUAL_IMG17': MANUAL_IMG17,
        'MANUAL17': MANUAL17,
      },
      'MANUAL18': {
        'MANUAL_IMG18': MANUAL_IMG18,
        'MANUAL18': MANUAL18,
      },
      'MANUAL19': {
        'MANUAL_IMG19': MANUAL_IMG19,
        'MANUAL19': MANUAL19,
      },
      'MANUAL20': {
        'MANUAL_IMG20': MANUAL_IMG20,
        'MANUAL20': MANUAL20,
      },
      'LASTIMAGE': {
        'ATT_FILE_NO_MK': ATT_FILE_NO_MK,
      },
    };
  }

  factory RecipeRows.fromJson(Map<String, dynamic> json) => RecipeRows(
      json['RCP_PARTS_DTLS'],
      json['RCP_WAY2'],
      json['MANUAL_IMG20'],
      json['MANUAL20'],
      json['RCP_SEQ'],
      json['INFO_NA'],
      json['INFO_WGT'],
      json['INFO_PRO'],
      json['MANUAL_IMG13'],
      json['MANUAL_IMG14'],
      json['MANUAL_IMG15'],
      json['MANUAL_IMG16'],
      json['MANUAL_IMG10'],
      json['MANUAL_IMG11'],
      json['MANUAL_IMG12'],
      json['MANUAL_IMG17'],
      json['MANUAL_IMG18'],
      json['MANUAL_IMG19'],
      json['INFO_FAT'],
      json['HASH_TAG'],
      json['MANUAL_IMG02'],
      json['MANUAL_IMG03'],
      json['RCP_PAT2'],
      json['MANUAL_IMG04'],
      json['MANUAL_IMG05'],
      json['MANUAL_IMG01'],
      json['MANUAL01'],
      json['ATT_FILE_NO_MK'],
      json['MANUAL_IMG06'],
      json['MANUAL_IMG07'],
      json['MANUAL_IMG08'],
      json['MANUAL_IMG09'],
      json['MANUAL08'],
      json['MANUAL09'],
      json['MANUAL06'],
      json['MANUAL07'],
      json['MANUAL04'],
      json['MANUAL05'],
      json['MANUAL02'],
      json['MANUAL03'],
      json['ATT_FILE_NO_MAIN'],
      json['MANUAL11'],
      json['MANUAL12'],
      json['MANUAL10'],
      json['INFO_CAR'],
      json['MANUAL19'],
      json['INFO_ENG'],
      json['MANUAL17'],
      json['MANUAL18'],
      json['RCP_NM'],
      json['MANUAL15'],
      json['MANUAL16'],
      json['MANUAL13'],
      json['MANUAL14']);
}
