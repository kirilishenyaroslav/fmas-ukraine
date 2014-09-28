object Fsp_customer_ADD: TFsp_customer_ADD
  Left = 462
  Top = 167
  BorderStyle = bsDialog
  ClientHeight = 388
  ClientWidth = 530
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 513
    Height = 340
    Shape = bsFrame
  end
  object LabelTitle: TLabel
    Left = 18
    Top = 15
    Width = 38
    Height = 13
    Caption = #1053#1072#1079#1074#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelClass: TLabel
    Left = 16
    Top = 157
    Width = 25
    Height = 13
    Caption = #1050#1083#1072#1089
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelShortTitle: TLabel
    Left = 18
    Top = 124
    Width = 60
    Height = 13
    Caption = #1057#1082#1086#1088#1086#1095#1077#1085#1085#1103
  end
  object LabelBranch: TLabel
    Left = 17
    Top = 191
    Width = 35
    Height = 13
    Caption = #1043#1072#1083#1091#1079#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 16
    Top = 91
    Width = 84
    Height = 13
    Caption = #1056#1086#1089#1110#1081#1089#1100#1082#1072' '#1085#1072#1079#1074#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 368
    Top = 224
    Width = 93
    Height = 13
    Caption = #1054#1089#1086#1073#1086#1074#1080#1081' '#1088#1072#1093#1091#1085#1086#1082
  end
  object Label3: TLabel
    Left = 17
    Top = 265
    Width = 37
    Height = 13
    Caption = #1040#1076#1088#1077#1089#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 224
    Top = 16
    Width = 98
    Height = 13
    Caption = #1050'i'#1083#1100#1082'i'#1089#1090#1100' '#1089#1080#1084#1074#1086#1083'i'#1074':'
  end
  object CntLabel: TLabel
    Left = 328
    Top = 16
    Width = 3
    Height = 13
  end
  object Label5: TLabel
    Left = 33
    Top = 54
    Width = 65
    Height = 13
    Caption = #1055#1086#1074#1085#1072' '#1085#1072#1079#1074#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 17
    Top = 304
    Width = 71
    Height = 13
    Caption = #1055#1086#1074#1085#1072' '#1072#1076#1088#1077#1089#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object nalogGroup: TGroupBox
    Left = 368
    Top = 24
    Width = 145
    Height = 97
    TabOrder = 5
    object LabelNDSNOMER: TLabel
      Left = 8
      Top = 11
      Width = 37
      Height = 13
      Caption = #1053#1086#1084#1077#1088':'
    end
    object LabelNDS_DATE: TLabel
      Left = 8
      Top = 48
      Width = 29
      Height = 13
      Caption = #1044#1072#1090#1072':'
    end
    object nnsEdit: TcxTextEdit
      Left = 8
      Top = 25
      Width = 129
      Height = 21
      BeepOnEnter = False
      Properties.MaxLength = 16
      Style.Color = clMoneyGreen
      TabOrder = 0
      OnKeyDown = nnsEditKeyDown
      OnKeyPress = nnsEditKeyPress
    end
    object DatennsEdit: TcxDateEdit
      Left = 8
      Top = 66
      Width = 129
      Height = 21
      Properties.ShowTime = False
      Style.Color = clMoneyGreen
      TabOrder = 1
      OnKeyPress = DatennsEditKeyPress
    end
  end
  object InstanceEdit: TcxButtonEdit
    Left = 16
    Top = 170
    Width = 345
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.HideCursor = True
    Properties.ReadOnly = True
    Properties.OnButtonClick = InstanceEditButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 2
  end
  object BranchEdit: TcxButtonEdit
    Left = 16
    Top = 206
    Width = 345
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.HideCursor = True
    Properties.ReadOnly = True
    Properties.OnButtonClick = BranchEditButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 3
  end
  object NameEdit: TcxTextEdit
    Left = 16
    Top = 31
    Width = 345
    Height = 21
    BeepOnEnter = False
    Properties.MaxLength = 180
    Properties.OnChange = NameEditPropertiesChange
    Style.Color = clMoneyGreen
    TabOrder = 0
    OnExit = NameEditExit
    OnKeyPress = NameEditKeyPress
  end
  object ShortNameEdit: TcxTextEdit
    Left = 16
    Top = 137
    Width = 185
    Height = 21
    BeepOnEnter = False
    Properties.MaxLength = 40
    Style.Color = clMoneyGreen
    TabOrder = 1
    OnKeyPress = ShortNameEditKeyPress
  end
  object OKButton1: TcxButton
    Left = 333
    Top = 355
    Width = 91
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 8
    OnClick = OKButton1Click
  end
  object CancelButton: TcxButton
    Left = 429
    Top = 355
    Width = 91
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 9
    OnClick = CancelButtonClick
  end
  object cxButton1: TcxButton
    Left = 8
    Top = 355
    Width = 129
    Height = 25
    Caption = #1040#1076#1088#1077#1089
    TabOrder = 7
    Visible = False
    OnClick = cxButton1Click
  end
  object FizLicoCheck: TcxCheckBox
    Left = 216
    Top = 137
    Width = 121
    Height = 21
    ParentColor = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1060'i'#1079#1080#1095#1085#1072' '#1086#1089#1086#1073#1072
    Style.Color = clBtnFace
    TabOrder = 6
  end
  object PlatNdsCheck: TcxCheckBox
    Left = 380
    Top = 19
    Width = 117
    Height = 21
    ParentColor = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1055#1083#1072#1090#1085#1080#1082' '#1055#1044#1042
    Style.Color = clBtnFace
    Style.TransparentBorder = True
    TabOrder = 4
  end
  object NameUkrEdit: TcxTextEdit
    Left = 16
    Top = 103
    Width = 345
    Height = 21
    BeepOnEnter = False
    Properties.MaxLength = 180
    Style.Color = clMoneyGreen
    TabOrder = 10
  end
  object DepCheck: TcxCheckBox
    Left = 16
    Top = 224
    Width = 161
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090' '#1108' '#1087#1110#1076#1088#1086#1079#1076#1110#1083#1086#1084
    TabOrder = 11
    OnClick = DepCheckClick
  end
  object DepEdit: TcxButtonEdit
    Left = 16
    Top = 240
    Width = 345
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.HideCursor = True
    Properties.ReadOnly = True
    Properties.OnButtonClick = DepEditPropertiesButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 12
  end
  object GroupBox1: TGroupBox
    Left = 368
    Top = 120
    Width = 145
    Height = 97
    TabOrder = 13
    object LabelEDRPOU: TLabel
      Left = 9
      Top = 12
      Width = 58
      Height = 13
      Caption = #1045#1044#1056#1055#1054#1059':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelNALOGNOMER: TLabel
      Left = 8
      Top = 52
      Width = 96
      Height = 13
      Caption = #1055#1086#1076#1072#1090#1082#1086#1074#1080#1081' '#1085#1086#1084#1077#1088
    end
    object edrpouEdit: TcxTextEdit
      Left = 8
      Top = 28
      Width = 129
      Height = 21
      BeepOnEnter = False
      Properties.MaxLength = 16
      Style.Color = clMoneyGreen
      TabOrder = 0
      OnKeyDown = edrpouEditKeyDown
    end
    object nalogEdit: TcxTextEdit
      Left = 8
      Top = 68
      Width = 129
      Height = 21
      BeepOnEnter = False
      Properties.MaxLength = 20
      Style.Color = clMoneyGreen
      TabOrder = 1
      OnKeyDown = NalogEditKeyDown
    end
  end
  object DnDzIDEdit: TcxTextEdit
    Left = 368
    Top = 240
    Width = 145
    Height = 21
    BeepOnEnter = False
    Properties.MaxLength = 16
    Style.Color = clMoneyGreen
    TabOrder = 14
    OnKeyDown = NalogEditKeyDown
  end
  object AdrEdit: TcxButtonEdit
    Left = 16
    Top = 280
    Width = 497
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.HideCursor = True
    Properties.ReadOnly = True
    Properties.OnButtonClick = AdrEditPropertiesButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 15
  end
  object NameFullEdit: TcxTextEdit
    Left = 16
    Top = 69
    Width = 345
    Height = 21
    BeepOnEnter = False
    Properties.MaxLength = 180
    Style.Color = clMoneyGreen
    TabOrder = 16
  end
  object AdrFullEdit: TcxTextEdit
    Left = 16
    Top = 318
    Width = 498
    Height = 21
    BeepOnEnter = False
    Properties.MaxLength = 180
    Style.Color = clMoneyGreen
    TabOrder = 17
  end
  object pFIBStoredProc1: TpFIBStoredProc
    Left = 264
    Top = 232
  end
  object pFIBDataSet1: TpFIBDataSet
    Left = 224
    Top = 232
    poSQLINT64ToBCD = True
  end
end
