object TestUnitForm: TTestUnitForm
  Left = 312
  Top = 12
  Width = 946
  Height = 706
  Caption = #1058#1077#1089#1090#1086#1074#1086#1077' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1077' '#1076#1083#1103' '#1088#1072#1073#1086#1090#1099' '#1089' '#1045#1044#1045#1041#1054
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 930
    Height = 668
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'EDBOGuides'
      object Panel1: TPanel
        Left = 393
        Top = 0
        Width = 529
        Height = 640
        Align = alClient
        Caption = 'Panel1'
        TabOrder = 0
        object DBGrid1: TDBGrid
          Left = 1
          Top = 1
          Width = 527
          Height = 621
          Align = alClient
          DataSource = DataSource1
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
        object ProgressBar1: TProgressBar
          Left = 1
          Top = 622
          Width = 527
          Height = 17
          Align = alBottom
          TabOrder = 1
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 393
        Height = 640
        Align = alLeft
        TabOrder = 1
        object Button1: TButton
          Left = 20
          Top = 18
          Width = 230
          Height = 25
          Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1089#1103' '#1082' web-'#1089#1077#1088#1074#1080#1089#1091
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 20
          Top = 50
          Width = 230
          Height = 25
          Caption = 'EDBOGuides ('#1082#1091#1088#1089#1099')'
          Enabled = False
          TabOrder = 1
          OnClick = Button2Click
        end
        object Button4: TButton
          Left = 20
          Top = 76
          Width = 230
          Height = 25
          Caption = 'EDBOGuides ('#1091#1085#1080#1074#1077#1088'c'#1080#1090#1077#1090#1099')'
          Enabled = False
          TabOrder = 2
          OnClick = Button4Click
        end
        object Button5: TButton
          Left = 20
          Top = 103
          Width = 230
          Height = 25
          Caption = 'EDBOGuides ('#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1080' '#1042#1059#1047#1072')'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = Button5Click
        end
        object Button6: TButton
          Left = 20
          Top = 129
          Width = 230
          Height = 25
          Caption = 'EDBOGuides ('#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1077#1081')'
          Enabled = False
          TabOrder = 4
          OnClick = Button6Click
        end
        object Button7: TButton
          Left = 20
          Top = 156
          Width = 230
          Height = 25
          Caption = 'EDBOGuides ('#1092#1072#1082#1091#1083#1100#1090#1077#1090#1099')'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          OnClick = Button7Click
        end
        object Button11: TButton
          Left = 20
          Top = 213
          Width = 230
          Height = 25
          Caption = 'EDBOGuides ('#1058#1080#1087#1099' '#1091#1083#1080#1094')'
          Enabled = False
          TabOrder = 6
          OnClick = Button11Click
        end
        object Button12: TButton
          Left = 20
          Top = 239
          Width = 230
          Height = 25
          Caption = 'EDBOGuides (KOATUU)'
          Enabled = False
          TabOrder = 7
          OnClick = Button12Click
        end
        object Button13: TButton
          Left = 20
          Top = 265
          Width = 230
          Height = 25
          Caption = 'EDBOGuides (KOATUUL1 '#1086#1073#1083#1072#1089#1090#1080')'
          Enabled = False
          TabOrder = 8
          OnClick = Button13Click
        end
        object Button14: TButton
          Left = 20
          Top = 291
          Width = 230
          Height = 25
          Caption = 'EDBOGuides (KOATUUL2 '#1088#1072#1081#1086#1085#1080'/'#1084#1110#1089#1090#1072')'
          Enabled = False
          TabOrder = 9
          OnClick = Button14Click
        end
        object Button15: TButton
          Left = 20
          Top = 317
          Width = 230
          Height = 25
          Caption = 'EDBOGuides (KOATUUL3 '#1084#1110#1089#1090#1072'/'#1089#1077#1083#1072')'
          Enabled = False
          TabOrder = 10
          OnClick = Button15Click
        end
        object Edit2: TEdit
          Left = 259
          Top = 240
          Width = 121
          Height = 21
          TabOrder = 11
          Text = #1076#1086#1085'*'
        end
        object Edit6: TEdit
          Left = 259
          Top = 291
          Width = 121
          Height = 21
          TabOrder = 12
          Text = '3200000000'
        end
        object Edit7: TEdit
          Left = 259
          Top = 317
          Width = 121
          Height = 21
          TabOrder = 13
          Text = '3225500000'
        end
        object Button21: TButton
          Left = 20
          Top = 368
          Width = 230
          Height = 25
          Caption = 'EDBOGuides ('#1103#1079#1099#1082#1080' '#1076#1072#1085#1085#1099#1093')'
          Enabled = False
          TabOrder = 14
          OnClick = Button21Click
        end
        object Button23: TButton
          Left = 20
          Top = 396
          Width = 230
          Height = 25
          Caption = 'EDBOGuides ('#1040#1082#1072#1076'.'#1075#1086#1076#1072')'
          Enabled = False
          TabOrder = 15
          OnClick = Button23Click
        end
        object Button37: TButton
          Left = 19
          Top = 424
          Width = 231
          Height = 25
          Caption = 'EDBOPerson ('#1079#1072#1103#1074#1082#1080' '#1042#1059#1047#1072')'
          Enabled = False
          TabOrder = 16
          OnClick = Button37Click
        end
        object Edit16: TEdit
          Left = 254
          Top = 426
          Width = 131
          Height = 21
          TabOrder = 17
          Text = 'd915af83-aa7c-413e-a8ec-64228fddb576'
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'EDBOPerson'
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 433
        Height = 640
        Align = alLeft
        TabOrder = 0
        object Label1: TLabel
          Left = 254
          Top = 398
          Width = 30
          Height = 13
          Caption = 'Status'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 312
          Top = 398
          Width = 24
          Height = 13
          Caption = 'Type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 368
          Top = 398
          Width = 29
          Height = 13
          Caption = 'AYear'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 254
          Top = 423
          Width = 39
          Height = 13
          Caption = 'Id_order'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 254
          Top = 449
          Width = 39
          Height = 13
          Caption = 'Id_order'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Button9: TButton
          Left = 5
          Top = 2
          Width = 249
          Height = 25
          Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1089#1103' '#1082' web-'#1089#1077#1088#1074#1080#1089#1091
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = Button9Click
        end
        object Button8: TButton
          Left = 5
          Top = 28
          Width = 249
          Height = 25
          Caption = 'EDBOPerson ('#1054#1050#1056')'
          Enabled = False
          TabOrder = 1
          OnClick = Button8Click
        end
        object Button3: TButton
          Left = 5
          Top = 54
          Width = 249
          Height = 25
          Caption = 'EDBOPerson ('#1060#1086#1088#1084#1072' '#1086#1073#1091#1095#1077#1085#1080#1077')'
          Enabled = False
          TabOrder = 2
          OnClick = Button3Click
        end
        object Button10: TButton
          Left = 5
          Top = 81
          Width = 249
          Height = 25
          Caption = 'EDBOPerson ('#1055#1088'.'#1082#1086#1084#1087#1072#1085#1080#1080')'
          Enabled = False
          TabOrder = 3
          OnClick = Button10Click
        end
        object Button16: TButton
          Left = 5
          Top = 135
          Width = 249
          Height = 25
          Caption = 'EDBOPerson ('#1051#1102#1076#1080' '#1087#1086' '#1060#1048#1054')'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          OnClick = Button16Click
        end
        object Button17: TButton
          Left = 5
          Top = 161
          Width = 249
          Height = 25
          Caption = 'EDBOPerson ('#1051#1102#1076#1080' '#1087#1086' '#1087#1072#1089#1087#1086#1088#1090#1091')'
          Enabled = False
          TabOrder = 5
          OnClick = Button17Click
        end
        object Button18: TButton
          Left = 5
          Top = 212
          Width = 249
          Height = 25
          Caption = 'EDBOPerson ('#1040#1076#1088#1077#1089#1072' '#1095#1077#1083#1086#1074#1077#1082#1072')'
          Enabled = False
          TabOrder = 6
          OnClick = Button18Click
        end
        object Button19: TButton
          Left = 5
          Top = 108
          Width = 249
          Height = 25
          Caption = 'EDBOPerson (C'#1090#1088#1072#1085#1099')'
          Enabled = False
          TabOrder = 7
          OnClick = Button19Click
        end
        object Button20: TButton
          Left = 5
          Top = 238
          Width = 249
          Height = 25
          Caption = 'EDBOPerson ('#1050#1086#1085#1090#1072#1082#1090#1099' '#1095#1077#1083#1086#1074#1077#1082#1072')'
          Enabled = False
          TabOrder = 8
          OnClick = Button20Click
        end
        object Edit1: TEdit
          Left = 255
          Top = 135
          Width = 172
          Height = 21
          TabOrder = 9
          Text = #1030#1074#1072#1085#1086#1074'*'
        end
        object Edit3: TEdit
          Left = 311
          Top = 161
          Width = 63
          Height = 21
          TabOrder = 10
          Text = '391831'
        end
        object Edit4: TEdit
          Left = 255
          Top = 161
          Width = 52
          Height = 21
          TabOrder = 11
          Text = 'HM'
        end
        object Edit5: TEdit
          Left = 255
          Top = 212
          Width = 176
          Height = 21
          TabOrder = 12
          Text = 'abc58a65-aae3-428c-8031-930d42aac704'
        end
        object Edit8: TEdit
          Left = 255
          Top = 238
          Width = 176
          Height = 21
          TabOrder = 13
          Text = 'abc58a65-aae3-428c-8031-930d42aac704'
        end
        object Button22: TButton
          Left = 5
          Top = 263
          Width = 249
          Height = 25
          Caption = 'EDBOPerson ('#1040#1082#1072#1076#1077#1084#1075#1088#1091#1087#1087#1099')'
          Enabled = False
          TabOrder = 14
          OnClick = Button22Click
        end
        object Edit9: TEdit
          Left = 255
          Top = 263
          Width = 26
          Height = 21
          TabOrder = 15
          Text = '101'
        end
        object Button25: TButton
          Left = 5
          Top = 289
          Width = 249
          Height = 25
          Caption = 'EDBOPerson ('#1058#1080#1087#1099' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074' '#1092#1080#1079#1083#1080#1094#1072')'
          Enabled = False
          TabOrder = 16
          OnClick = Button25Click
        end
        object Button26: TButton
          Left = 5
          Top = 315
          Width = 249
          Height = 25
          Caption = 'EDBOPerson ('#1044#1086#1082#1091#1084'.'#1087#1086' '#1092#1080#1079#1083#1080#1094#1091'+'#1090#1080#1087#1091')'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 17
          OnClick = Button26Click
        end
        object Edit11: TEdit
          Left = 255
          Top = 315
          Width = 142
          Height = 21
          TabOrder = 18
          Text = '05ba3956-08b1-4cf6-9980-c22ccc4561f2'
        end
        object Edit12: TEdit
          Left = 405
          Top = 315
          Width = 26
          Height = 21
          TabOrder = 19
          Text = '3'
        end
        object Button27: TButton
          Left = 5
          Top = 342
          Width = 249
          Height = 25
          Caption = 'EDBOPerson ('#1057#1090#1072#1090#1091#1089#1099' '#1087#1088#1080#1082#1072#1079#1086#1074')'
          Enabled = False
          TabOrder = 20
          OnClick = Button27Click
        end
        object Button28: TButton
          Left = 5
          Top = 392
          Width = 249
          Height = 25
          Caption = 'EDBOPerson ('#1055#1088#1080#1082#1072#1079#1099' '#1087#1086' '#1090#1080#1087#1091' '#1080' '#1075#1086#1076#1091')'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 21
          OnClick = Button28Click
        end
        object Edit13: TEdit
          Left = 293
          Top = 392
          Width = 18
          Height = 21
          TabOrder = 22
          Text = '3'
        end
        object Edit14: TEdit
          Left = 344
          Top = 392
          Width = 22
          Height = 21
          TabOrder = 23
          Text = '60'
        end
        object Button29: TButton
          Left = 5
          Top = 367
          Width = 249
          Height = 25
          Caption = 'EDBOPerson ('#1058#1080#1087#1099' '#1087#1088#1080#1082#1072#1079#1086#1074')'
          Enabled = False
          TabOrder = 24
          OnClick = Button29Click
        end
        object Edit15: TEdit
          Left = 405
          Top = 392
          Width = 27
          Height = 21
          TabOrder = 25
          Text = '101'
        end
        object Button31: TButton
          Left = 5
          Top = 418
          Width = 249
          Height = 25
          Caption = 'EDBOPerson ('#1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1087#1088#1080#1082#1072#1079#1072')'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 26
          OnClick = Button31Click
        end
        object Button32: TButton
          Left = 5
          Top = 187
          Width = 249
          Height = 25
          Caption = 'EDBOPerson ('#1063#1077#1083#1086#1074#1077#1082' '#1087#1086' PersonCode)'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 27
          OnClick = Button32Click
        end
        object Edit17: TEdit
          Left = 255
          Top = 187
          Width = 176
          Height = 21
          TabOrder = 28
          Text = 'abc58a65-aae3-428c-8031-930d42aac704'
        end
        object Edit18: TEdit
          Left = 306
          Top = 418
          Width = 125
          Height = 21
          TabOrder = 29
          Text = '101005'
        end
        object Button42: TButton
          Left = 5
          Top = 470
          Width = 249
          Height = 25
          Caption = 'EDBOPerson ('#1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1086#1073#1091#1095#1077#1085#1080#1103' '#1092#1083#1080#1094#1072')'
          Enabled = False
          TabOrder = 30
          OnClick = Button42Click
        end
        object Edit10: TEdit
          Left = 255
          Top = 470
          Width = 176
          Height = 21
          TabOrder = 31
          Text = 'abc58a65-aae3-428c-8031-930d42aac704'
        end
        object Button24: TButton
          Left = 5
          Top = 444
          Width = 249
          Height = 25
          Caption = 'EDBOPerson ('#1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1087#1088#1080#1082#1072#1079#1072' '#1085#1072' '#1110#1084#1077#1085')'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 32
          OnClick = Button24Click
        end
        object Edit19: TEdit
          Left = 306
          Top = 444
          Width = 125
          Height = 21
          TabOrder = 33
          Text = '99507'
        end
        object Button33: TButton
          Left = 5
          Top = 495
          Width = 249
          Height = 25
          Caption = 'EDBOPerson ('#1051#1080#1095#1085#1072#1103' '#1082#1072#1088#1090#1086#1095#1082#1072' '#1089#1090#1091#1076#1077#1085#1090#1072')'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 34
          OnClick = Button33Click
        end
        object Edit20: TEdit
          Left = 255
          Top = 495
          Width = 78
          Height = 21
          TabOrder = 35
          Text = 'b56cca04-3fbe-4234-a310-2ea2a768ef8f'
        end
        object Edit21: TEdit
          Left = 343
          Top = 495
          Width = 78
          Height = 21
          TabOrder = 36
          Text = '486456'
        end
        object Edit23: TEdit
          Left = 290
          Top = 263
          Width = 132
          Height = 21
          TabOrder = 37
        end
        object Button35: TButton
          Left = 5
          Top = 520
          Width = 249
          Height = 25
          Caption = 'EDBOPerson ('#1058#1080#1087#1099' '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103')'
          Enabled = False
          TabOrder = 38
          OnClick = Button35Click
        end
        object Button36: TButton
          Left = 5
          Top = 546
          Width = 249
          Height = 25
          Caption = 'EDBOPerson ('#1079#1072#1103#1074#1082#1080' '#1092#1083#1080#1094#1072')'
          Enabled = False
          TabOrder = 39
          OnClick = Button36Click
        end
        object Edit24: TEdit
          Left = 255
          Top = 547
          Width = 176
          Height = 21
          TabOrder = 40
          Text = 'abc58a65-aae3-428c-8031-930d42aac704'
        end
        object Button38: TButton
          Left = 5
          Top = 572
          Width = 249
          Height = 25
          Caption = 'EDBOPerson ('#1057#1090#1091#1076#1077#1085#1090#1099')'
          Enabled = False
          TabOrder = 41
          OnClick = Button38Click
        end
        object Button99: TButton
          Left = 5
          Top = 597
          Width = 249
          Height = 25
          Caption = 'EDBOPerson ('#1057#1087#1080#1089#1082#1080' '#1089#1090#1091#1076#1077#1085#1090#1086#1074')'
          Enabled = False
          TabOrder = 42
          OnClick = Button99Click
        end
      end
      object Panel4: TPanel
        Left = 433
        Top = 0
        Width = 489
        Height = 640
        Align = alClient
        Caption = 'Panel4'
        TabOrder = 1
        object DBGrid2: TDBGrid
          Left = 1
          Top = 1
          Width = 487
          Height = 621
          Align = alClient
          DataSource = DataSource2
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
        object ProgressBar2: TProgressBar
          Left = 1
          Top = 622
          Width = 487
          Height = 17
          Align = alBottom
          TabOrder = 1
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1060#1086#1090#1086#1075#1088#1072#1092#1080#1080
      ImageIndex = 2
      object Image2: TImage
        Left = 267
        Top = 48
        Width = 198
        Height = 193
      end
      object Button34: TButton
        Left = 13
        Top = 12
        Width = 249
        Height = 25
        Caption = 'EDBOPerson ('#1060#1086#1090#1086')'
        Enabled = False
        TabOrder = 0
        OnClick = Button34Click
      end
      object Edit22: TEdit
        Left = 267
        Top = 14
        Width = 358
        Height = 21
        TabOrder = 1
        Text = 'a798e0b3-4a2a-4362-97ee-3e88a6b7052c'
      end
      object DBGrid3: TDBGrid
        Left = 488
        Top = 44
        Width = 409
        Height = 237
        DataSource = DataSource3
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
  end
  object RxMemoryData: TRxMemoryData
    FieldDefs = <>
    Left = 88
    Top = 176
  end
  object DataSource1: TDataSource
    DataSet = RxMemoryData
    Left = 120
    Top = 176
  end
  object RxMemoryData1: TRxMemoryData
    FieldDefs = <>
    Left = 88
    Top = 216
  end
  object DataSource2: TDataSource
    DataSet = RxMemoryData1
    Left = 120
    Top = 216
  end
  object DataSource3: TDataSource
    DataSet = RxMemoryData2
    Left = 120
    Top = 248
  end
  object RxMemoryData2: TRxMemoryData
    FieldDefs = <>
    Left = 88
    Top = 248
  end
end
