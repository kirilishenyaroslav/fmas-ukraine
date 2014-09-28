object Form1: TForm1
  Left = 192
  Top = 107
  Width = 696
  Height = 154
  Caption = #1054#1096#1080#1073#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 80
    Width = 688
    Height = 9
    Shape = bsBottomLine
  end
  object OpenFileEdit: TcxButtonEdit
    Left = 96
    Top = 30
    Width = 586
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 32
    Width = 90
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 1
    Caption = #1060#1072#1081#1083' '#1086#1096#1080#1073#1086#1082
  end
  object SaveFileEdit: TcxButtonEdit
    Left = 96
    Top = 54
    Width = 586
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = SaveFileEditPropertiesButtonClick
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 56
    Width = 85
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 3
    Caption = 'DBF-'#1090#1072#1073#1083#1080#1094#1072
  end
  object cxButton1: TcxButton
    Left = 480
    Top = 96
    Width = 75
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100
    TabOrder = 4
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 560
    Top = 96
    Width = 75
    Height = 25
    Caption = #1042#1099#1081#1090#1080
    TabOrder = 5
    OnClick = cxButton2Click
  end
  object OpenDialog1: TOpenDialog
    Left = 8
  end
  object DSet: THalcyonDataSet
    AutoFlush = False
    Exclusive = False
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TranslateASCII = True
    UseDeleted = False
    UserID = 0
    Left = 48
  end
  object CreateHalcyonDataSet1: TCreateHalcyonDataSet
    AutoOverwrite = True
    CreateFields.Strings = (
      'KOD_SETUP1;N;8;0'
      'KOD_SETUP2;N;8;0'
      'KOD_SETUP3;N;8;0'
      'KOD_SET_O1;N;8;0'
      'KOD_SET_O2;N;8;0'
      'TN;N;8;0'
      'VO;N;8;0'
      'NDAY;N;8;0'
      'WORK_CAL;L;1;0'
      'CLOCK;N;8;3'
      'SUM_CLOCK;N;9;2'
      'SUMMA;N;13;2'
      'P1;L;1;0'
      'P2;L;1;0'
      'P3;L;1;0'
      'P4;L;1;0'
      'P5;L;1;0'
      'P6;L;1;0'
      'P_OLD;L;1;0'
      'UCH_ST;L;1;0'
      'VPN;N;8;0'
      'KOD_ACCESS;N;8;0'
      'KOD_SMET;N;8;0'
      'KOD_ST;N;8;0'
      'KOD_TOPER;N;8;0'
      'KOD_STR;N;8;0'
      'KOD_DIV;N;8;0'
      'KOD_CAT;N;8;0'
      'PROP_ST;N;8;0'
      'DATE_ACC;D;8;0'
      'KOD_GROUP;N;8;0'
      'DATE_BEG;D;8;0'
      'DATE_END;D;8;0'
      'PROFSOUZ;L;1;0'
      'PNOT_CALCS;L;1;0'
      'P_CURRENT;L;1;0'
      'P_PENSION;L;1;0'
      'TYPE_WORK;N;8;0'
      'TYPE_FIN;N;8;0'
      'KOD_POST;N;8;0'
      'STAVKA;N;7;3'
      'SNOT_SOC;L;1;0')
    DBFTable = DSet
    DBFType = DBaseIV
    Left = 80
  end
  object SaveDialog1: TSaveDialog
    Left = 120
  end
end
