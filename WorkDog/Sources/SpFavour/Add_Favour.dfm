object Form1: TForm1
  Left = 671
  Top = 142
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1091#1089#1083#1091#1075#1080
  ClientHeight = 450
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 184
    Top = 241
    Width = 36
    Height = 13
    Caption = #1058#1072#1088#1080#1092':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 1
    Top = -3
    Width = 333
    Height = 324
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 65
      Height = 13
      Caption = #1050#1086#1076' '#1087#1086#1089#1083#1091#1075#1080':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 128
      Top = 8
      Width = 78
      Height = 13
      Caption = #1053#1072#1079#1074#1072' '#1087#1086#1089#1083#1091#1075#1080':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 68
      Width = 45
      Height = 13
      Caption = #1055#1086#1095#1072#1090#1086#1082':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 168
      Top = 68
      Width = 59
      Height = 13
      Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 184
      Top = 217
      Width = 36
      Height = 13
      Caption = #1058#1072#1088#1080#1092':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 216
      Width = 83
      Height = 13
      Caption = #1054#1076#1080#1085#1080#1094#1103' '#1074#1080#1084#1110#1088#1091':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 8
      Top = 48
      Width = 154
      Height = 13
      Caption = #1055#1077#1088#1110#1086#1076' '#1092#1091#1085#1082#1094#1110#1102#1074#1072#1085#1085#1103' '#1087#1086#1089#1083#1091#1075#1080':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 60
      Top = 243
      Width = 159
      Height = 13
      Caption = #1055#1088#1086#1094#1077#1085#1090' '#1074' '#1088#1086#1079#1087#1086#1088#1103#1076#1078#1077#1085#1085#1110' '#1042#1053#1047':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 8
      Top = 264
      Width = 270
      Height = 26
      Caption = 
        #1053#1072#1079#1074#1072' '#1087#1086#1089#1083#1091#1075#1080' ('#1079#1072#1087#1086#1074#1085#1110#1090#1100', '#1103#1082#1097#1086' '#1042#1080' '#1073#1072#1078#1072#1108#1090#1077' '#1079#1084#1110#1085#1080#1090#1080' '#13#10#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103 +
        ' '#1087#1086#1089#1083#1091#1075#1080' '#1091' '#1072#1082#1090#1110' '#1090#1072' '#1088#1072#1093#1091#1085#1082#1091'):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object NameEdit: TcxTextEdit
      Left = 128
      Top = 24
      Width = 201
      Height = 21
      Style.Color = clMoneyGreen
      TabOrder = 1
      OnKeyPress = NameEditKeyPress
    end
    object CodeEdit: TcxTextEdit
      Left = 8
      Top = 24
      Width = 113
      Height = 21
      Style.Color = clMoneyGreen
      TabOrder = 0
      OnKeyPress = CodeEditKeyPress
    end
    object DateBeg: TcxDateEdit
      Left = 56
      Top = 64
      Width = 97
      Height = 21
      Style.Color = clMoneyGreen
      TabOrder = 2
      OnKeyPress = DateBegKeyPress
    end
    object DateEnd: TcxDateEdit
      Left = 232
      Top = 64
      Width = 97
      Height = 21
      Style.Color = clMoneyGreen
      TabOrder = 3
      OnKeyPress = DateEndKeyPress
    end
    object EdizmEdit: TcxButtonEdit
      Left = 96
      Top = 213
      Width = 73
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = EdizmEditPropertiesButtonClick
      Style.Color = clMoneyGreen
      TabOrder = 5
      OnKeyPress = EdizmEditKeyPress
    end
    object GroupBox3: TGroupBox
      Left = 3
      Top = 96
      Width = 326
      Height = 113
      Caption = ' '#1058#1080#1087' '#1087#1086#1089#1083#1091#1075#1080' '
      TabOrder = 4
      object TypeEdit: TcxButtonEdit
        Left = 8
        Top = 20
        Width = 305
        Height = 21
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = TypeEditPropertiesButtonClick
        Style.Color = clMoneyGreen
        TabOrder = 0
        OnKeyPress = TypeEditKeyPress
      end
      object AllowSumBox: TcxCheckBox
        Left = 8
        Top = 44
        Width = 153
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.ReadOnly = True
        Properties.Caption = #1056#1077#1076#1072#1075'.'#1089#1091#1084#1091
        TabOrder = 1
      end
      object NdsBox: TcxCheckBox
        Left = 8
        Top = 60
        Width = 153
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.ReadOnly = True
        Properties.Caption = #1042#1088#1072#1093#1086#1074#1091#1074#1072#1090#1080' '#1055#1044#1042
        TabOrder = 2
      end
      object DblNdsBox: TcxCheckBox
        Left = 8
        Top = 76
        Width = 233
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.ReadOnly = True
        Properties.Caption = #1055#1086#1076#1074#1086#1108#1085#1080#1081' '#1055#1044#1042
        TabOrder = 3
      end
      object TarBox: TcxCheckBox
        Left = 8
        Top = 92
        Width = 233
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.ReadOnly = True
        Properties.Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1090#1072#1088#1080#1092' '#1091' '#1072#1082#1090#1110
        TabOrder = 4
      end
    end
    object SumEdit: TcxCurrencyEdit
      Left = 230
      Top = 213
      Width = 96
      Height = 21
      EditValue = 0c
      Properties.Alignment.Horz = taLeftJustify
      Properties.DecimalPlaces = 6
      Properties.DisplayFormat = ',0.000000      '#39#39';-,0.000000      '
      Style.Color = clMoneyGreen
      TabOrder = 7
      OnKeyPress = SumEditKeyPress
    end
    object SumEditButton: TcxButton
      Left = 308
      Top = 215
      Width = 17
      Height = 17
      Caption = '...'
      TabOrder = 6
      OnClick = SumEditButtonClick
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
    end
    object NameEdit2: TcxTextEdit
      Left = 12
      Top = 296
      Width = 313
      Height = 21
      Style.Color = clMoneyGreen
      TabOrder = 8
      OnKeyPress = NameEditKeyPress
    end
  end
  object GroupBox2: TGroupBox
    Left = 1
    Top = 323
    Width = 333
    Height = 107
    Align = alCustom
    Caption = #1044#1086#1076#1072#1090#1082#1086#1074#1072' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1103
    TabOrder = 1
    object Label18: TLabel
      Left = 5
      Top = 18
      Width = 53
      Height = 13
      Caption = #1050#1086#1096#1090#1086#1088#1080#1089':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object S_Label: TLabel
      Left = 88
      Top = 18
      Width = 241
      Height = 13
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object R_Label: TLabel
      Left = 88
      Top = 36
      Width = 241
      Height = 13
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label19: TLabel
      Left = 5
      Top = 36
      Width = 36
      Height = 13
      Caption = #1056#1086#1079#1076#1110#1083':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label20: TLabel
      Left = 5
      Top = 52
      Width = 37
      Height = 13
      Caption = #1057#1090#1072#1090#1090#1103':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object St_Label: TLabel
      Left = 88
      Top = 52
      Width = 241
      Height = 13
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label15: TLabel
      Left = 5
      Top = 68
      Width = 31
      Height = 13
      Caption = #1050#1045#1050#1042':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object KEKV_Label: TLabel
      Left = 88
      Top = 68
      Width = 241
      Height = 13
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Sn: TLabel
      Left = 62
      Top = 18
      Width = 3
      Height = 13
    end
    object Rn: TLabel
      Left = 62
      Top = 36
      Width = 3
      Height = 13
    end
    object Stn: TLabel
      Left = 62
      Top = 52
      Width = 3
      Height = 13
    end
    object Kn: TLabel
      Left = 62
      Top = 68
      Width = 3
      Height = 13
    end
    object cxButton2: TcxButton
      Left = 168
      Top = 82
      Width = 75
      Height = 20
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080
      TabOrder = 0
      OnClick = cxButton2Click
    end
    object cxButton3: TcxButton
      Left = 254
      Top = 82
      Width = 75
      Height = 20
      Caption = #1042#1110#1076#1084#1110#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  object EditPR_VNZ: TcxCurrencyEdit
    Left = 230
    Top = 237
    Width = 97
    Height = 21
    EditValue = '0'
    Properties.Alignment.Horz = taLeftJustify
    Properties.DecimalPlaces = 3
    Properties.DisplayFormat = ',0.000      '#39#39';-,0.000   '
    Style.Color = clMoneyGreen
    TabOrder = 2
    OnKeyPress = SumEditKeyPress
  end
  object MainDB: TpFIBDatabase
    DBName = 'E:\HAI_ARND\Base\FULL_DB.IB'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = pFIBTransaction1
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 472
    Top = 208
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = MainDB
    TimeoutAction = TARollback
    Left = 472
    Top = 48
  end
  object pFIBStoredProc1: TpFIBStoredProc
    Database = MainDB
    Transaction = pFIBTransaction1
    Left = 472
    Top = 176
  end
  object ActionList1: TActionList
    Left = 472
    Top = 79
    object Action1: TAction
      Caption = 'Esc'
      ShortCut = 27
      OnExecute = Action1Execute
    end
  end
  object SaveProc: TpFIBStoredProc
    Database = MainDB
    Transaction = pFIBTransaction2
    Left = 472
    Top = 112
  end
  object pFIBTransaction2: TpFIBTransaction
    DefaultDatabase = MainDB
    TimeoutAction = TARollback
    Left = 472
    Top = 144
  end
end
