// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_rows.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeRowsAdapter extends TypeAdapter<RecipeRows> {
  @override
  final int typeId = 0;

  @override
  RecipeRows read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeRows(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      fields[7] as String,
      fields[8] as String,
      fields[9] as String,
      fields[10] as String,
      fields[11] as String,
      fields[12] as String,
      fields[13] as String,
      fields[14] as String,
      fields[15] as String,
      fields[16] as String,
      fields[17] as String,
      fields[18] as String,
      fields[19] as String,
      fields[20] as String,
      fields[21] as String,
      fields[22] as String,
      fields[23] as String,
      fields[24] as String,
      fields[25] as String,
      fields[26] as String,
      fields[27] as String,
      fields[28] as String,
      fields[29] as String,
      fields[30] as String,
      fields[31] as String,
      fields[32] as String,
      fields[33] as String,
      fields[34] as String,
      fields[35] as String,
      fields[36] as String,
      fields[37] as String,
      fields[38] as String,
      fields[39] as String,
      fields[40] as String,
      fields[41] as String,
      fields[42] as String,
      fields[43] as String,
      fields[44] as String,
      fields[45] as String,
      fields[46] as String,
      fields[47] as String,
      fields[48] as String,
      fields[49] as String,
      fields[50] as String,
      fields[51] as String,
      fields[52] as String,
      fields[53] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RecipeRows obj) {
    writer
      ..writeByte(54)
      ..writeByte(0)
      ..write(obj.RCP_PARTS_DTLS)
      ..writeByte(1)
      ..write(obj.RCP_WAY2)
      ..writeByte(2)
      ..write(obj.MANUAL_IMG20)
      ..writeByte(3)
      ..write(obj.MANUAL20)
      ..writeByte(4)
      ..write(obj.RCP_SEQ)
      ..writeByte(5)
      ..write(obj.INFO_NA)
      ..writeByte(6)
      ..write(obj.INFO_WGT)
      ..writeByte(7)
      ..write(obj.INFO_PRO)
      ..writeByte(8)
      ..write(obj.MANUAL_IMG13)
      ..writeByte(9)
      ..write(obj.MANUAL_IMG14)
      ..writeByte(10)
      ..write(obj.MANUAL_IMG15)
      ..writeByte(11)
      ..write(obj.MANUAL_IMG16)
      ..writeByte(12)
      ..write(obj.MANUAL_IMG10)
      ..writeByte(13)
      ..write(obj.MANUAL_IMG11)
      ..writeByte(14)
      ..write(obj.MANUAL_IMG12)
      ..writeByte(15)
      ..write(obj.MANUAL_IMG17)
      ..writeByte(16)
      ..write(obj.MANUAL_IMG18)
      ..writeByte(17)
      ..write(obj.MANUAL_IMG19)
      ..writeByte(18)
      ..write(obj.INFO_FAT)
      ..writeByte(19)
      ..write(obj.HASH_TAG)
      ..writeByte(20)
      ..write(obj.MANUAL_IMG02)
      ..writeByte(21)
      ..write(obj.MANUAL_IMG03)
      ..writeByte(22)
      ..write(obj.RCP_PAT2)
      ..writeByte(23)
      ..write(obj.MANUAL_IMG04)
      ..writeByte(24)
      ..write(obj.MANUAL_IMG05)
      ..writeByte(25)
      ..write(obj.MANUAL_IMG01)
      ..writeByte(26)
      ..write(obj.MANUAL01)
      ..writeByte(27)
      ..write(obj.ATT_FILE_NO_MK)
      ..writeByte(28)
      ..write(obj.MANUAL_IMG06)
      ..writeByte(29)
      ..write(obj.MANUAL_IMG07)
      ..writeByte(30)
      ..write(obj.MANUAL_IMG08)
      ..writeByte(31)
      ..write(obj.MANUAL_IMG09)
      ..writeByte(32)
      ..write(obj.MANUAL08)
      ..writeByte(33)
      ..write(obj.MANUAL09)
      ..writeByte(34)
      ..write(obj.MANUAL06)
      ..writeByte(35)
      ..write(obj.MANUAL07)
      ..writeByte(36)
      ..write(obj.MANUAL04)
      ..writeByte(37)
      ..write(obj.MANUAL05)
      ..writeByte(38)
      ..write(obj.MANUAL02)
      ..writeByte(39)
      ..write(obj.MANUAL03)
      ..writeByte(40)
      ..write(obj.ATT_FILE_NO_MAIN)
      ..writeByte(41)
      ..write(obj.MANUAL11)
      ..writeByte(42)
      ..write(obj.MANUAL12)
      ..writeByte(43)
      ..write(obj.MANUAL10)
      ..writeByte(44)
      ..write(obj.INFO_CAR)
      ..writeByte(45)
      ..write(obj.MANUAL19)
      ..writeByte(46)
      ..write(obj.INFO_ENG)
      ..writeByte(47)
      ..write(obj.MANUAL17)
      ..writeByte(48)
      ..write(obj.MANUAL18)
      ..writeByte(49)
      ..write(obj.RCP_NM)
      ..writeByte(50)
      ..write(obj.MANUAL15)
      ..writeByte(51)
      ..write(obj.MANUAL16)
      ..writeByte(52)
      ..write(obj.MANUAL13)
      ..writeByte(53)
      ..write(obj.MANUAL14);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeRowsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
