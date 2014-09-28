object Form1: TForm1
  Left = 401
  Top = 261
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1091#1089#1083#1091#1075#1080
  ClientHeight = 329
  ClientWidth = 338
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = -4
    Width = 337
    Height = 221
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
      Left = 192
      Top = 196
      Width = 29
      Height = 13
      Caption = #1057#1091#1084#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 195
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
    object NameEdit: TcxTextEdit
      Left = 128
      Top = 24
      Width = 201
      Height = 21
      Style.Color = clMoneyGreen
      TabOrder = 1
    end
    object CodeEdit: TcxTextEdit
      Left = 8
      Top = 24
      Width = 113
      Height = 21
      Style.Color = clMoneyGreen
      TabOrder = 0
    end
    object DateBeg: TcxDateEdit
      Left = 56
      Top = 64
      Width = 97
      Height = 21
      Style.Color = clMoneyGreen
      TabOrder = 2
    end
    object DateEnd: TcxDateEdit
      Left = 232
      Top = 64
      Width = 97
      Height = 21
      Style.Color = clMoneyGreen
      TabOrder = 3
    end
    object EdizmEdit: TcxButtonEdit
      Left = 96
      Top = 192
      Width = 89
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = EdizmEditPropertiesButtonClick
      Style.Color = clMoneyGreen
      TabOrder = 5
    end
    object GroupBox3: TGroupBox
      Left = 8
      Top = 96
      Width = 321
      Height = 89
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
      end
      object cxCheckBox2: TcxCheckBox
        Left = 8
        Top = 44
        Width = 217
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.ReadOnly = True
        Properties.Caption = #1065#1086#1084#1110#1089#1103#1095#1085#1072' '#1086#1087#1083#1072#1090#1072
        TabOrder = 1
      end
      object cxCheckBox1: TcxCheckBox
        Left = 8
        Top = 60
        Width = 217
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.ReadOnly = True
        Properties.Caption = #1056#1086#1079#1088#1072#1093#1086#1074#1091#1108#1090#1089#1103' '#1085#1072' '#1073#1072#1079#1110' '#1083#1110#1095#1080#1083#1100#1085#1080#1082#1110#1074
        TabOrder = 2
      end
    end
    object SumEdit: TcxCurrencyEdit
      Left = 232
      Top = 192
      Width = 97
      Height = 21
      EditValue = 0c
      Properties.Alignment.Horz = taLeftJustify
      Properties.DisplayFormat = ',0.00'#39#39';-,0.00'
      Style.Color = clMoneyGreen
      TabOrder = 7
    end
    object SumEditButton: TcxButton
      Left = 310
      Top = 194
      Width = 17
      Height = 17
      Caption = '...'
      TabOrder = 6
      OnClick = SumEditButtonClick
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
    end
  end
  object cxButton3: TcxButton
    Left = 261
    Top = 307
    Width = 75
    Height = 20
    Caption = #1042#1110#1076#1084#1110#1085#1072
    ModalResult = 2
    TabOrder = 3
  end
  object cxButton2: TcxButton
    Left = 170
    Top = 307
    Width = 75
    Height = 20
    Caption = #1047#1073#1077#1088#1077#1075#1090#1080
    TabOrder = 2
    OnClick = cxButton2Click
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 220
    Width = 337
    Height = 85
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
