object frmToNextCurs: TfrmToNextCurs
  Left = 544
  Top = 325
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmToNextCurs'
  ClientHeight = 247
  ClientWidth = 272
  Color = 14731702
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  DesignSize = (
    272
    247)
  PixelsPerInch = 96
  TextHeight = 13
  object Memo: TcxMemo
    Left = 0
    Top = 209
    Width = 272
    Height = 89
    Align = alTop
    Style.Color = clInfoBk
    TabOrder = 4
    Visible = False
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Width = 272
    Height = 153
    Align = alTop
    Alignment = alTopLeft
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
    CaptionBkColor = 14731702
    Color = 14731702
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    TabStop = False
    object Label1: TLabel
      Left = 23
      Top = 128
      Width = 216
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074' '#1086#1090#1073#1086#1088#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10903571
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Params_Button: TSpeedButton
      Left = 21
      Top = 125
      Width = 220
      Height = 22
      Flat = True
      OnClick = Params_ButtonClick
    end
    object NewPeriod_Label: TLabel
      Left = 18
      Top = 13
      Width = 84
      Height = 13
      Caption = 'NewPeriod_Label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object ord_ae_NomOrder_Label: TLabel
      Left = 19
      Top = 50
      Width = 72
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1085#1072#1082#1072#1079#1091
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object ord_ae_DateOrder_Label: TLabel
      Left = 138
      Top = 50
      Width = 64
      Height = 13
      Caption = #1044#1072#1090#1072' '#1085#1072#1082#1072#1079#1091
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object ForEach_Box: TcxCheckBox
      Left = 16
      Top = 85
      Width = 225
      Height = 21
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077' '#1076#1083#1103' '#1082#1072#1078#1076#1086#1075#1086' '#1089#1090#1091#1076#1077#1085#1090#1072
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 2
      OnKeyPress = ForEach_BoxKeyPress
    end
    object Avto_Box: TcxCheckBox
      Left = 16
      Top = 103
      Width = 225
      Height = 21
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1088#1072#1089#1090#1086#1088#1075#1072#1090#1100' '#1082#1086#1085#1090#1088#1072#1082#1090#1099
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.Shadow = False
      Style.TransparentBorder = True
      TabOrder = 3
      OnKeyPress = Avto_BoxKeyPress
    end
    object DateBegEdit: TcxDateEdit
      Left = 18
      Top = 28
      Width = 105
      Height = 21
      ParentFont = False
      Properties.ReadOnly = False
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 0
      OnKeyPress = DateBegEditKeyPress
    end
    object DateEndEdit: TcxDateEdit
      Left = 136
      Top = 28
      Width = 105
      Height = 21
      ParentFont = False
      Properties.ReadOnly = False
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 1
      OnExit = DateEndEditExit
      OnKeyPress = DateEndEditKeyPress
    end
    object ord_ae_Nom_Ord: TcxTextEdit
      Left = 18
      Top = 63
      Width = 113
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 50
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 4
      OnKeyPress = ord_ae_Nom_OrdKeyPress
    end
    object ord_ae_Date_Ord: TcxDateEdit
      Left = 135
      Top = 63
      Width = 105
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 5
      OnKeyPress = ord_ae_Date_OrdKeyPress
    end
  end
  object OkButton: TcxButton
    Left = 89
    Top = 217
    Width = 87
    Height = 24
    Anchors = [akLeft, akBottom]
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 183
    Top = 217
    Width = 85
    Height = 24
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 153
    Width = 272
    Height = 56
    Align = alTop
    Alignment = alTopLeft
    Caption = #1055#1088#1086#1094#1077#1085#1090' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
    CaptionBkColor = 14731702
    Color = 14731702
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 10897960
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 3
    TabStop = False
    object MaxLabel: TLabel
      Left = 8
      Top = 39
      Width = 40
      Height = 13
      AutoSize = False
      Caption = '1000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10897960
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object CurrentLabel: TLabel
      Left = 44
      Top = 39
      Width = 35
      Height = 13
      AutoSize = False
      Caption = '1000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10897960
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object ProgressBar: TcxProgressBar
      Left = 6
      Top = 16
      Width = 257
      Height = 21
      TabStop = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 0
    end
  end
  object Styles: TcxStyleRepository
    Left = 616
    Top = 160
    object BackGround: TcxStyle
      AssignedValues = [svColor]
      Color = 14601118
    end
    object FocusedRecord: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 11037222
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clDefault
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Header: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object DesabledRecord: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 14601118
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = 13875838
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor]
      Color = 15850428
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15850428
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14531001
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object Default_StyleSheet: TcxGridTableViewStyleSheet
      Styles.Background = BackGround
      Styles.Content = BackGround
      Styles.ContentEven = cxStyle1
      Styles.ContentOdd = cxStyle2
      Styles.Inactive = DesabledRecord
      Styles.Selection = FocusedRecord
      Styles.Header = Header
      BuiltIn = True
    end
    object DevExpress_Style: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle3
      Styles.Content = cxStyle4
      Styles.ContentEven = cxStyle5
      Styles.ContentOdd = cxStyle6
      Styles.Inactive = cxStyle12
      Styles.IncSearch = cxStyle13
      Styles.Selection = cxStyle16
      Styles.FilterBox = cxStyle7
      Styles.Footer = cxStyle8
      Styles.Group = cxStyle9
      Styles.GroupByBox = cxStyle10
      Styles.Header = cxStyle11
      Styles.Indicator = cxStyle14
      Styles.Preview = cxStyle15
      BuiltIn = True
    end
  end
end
