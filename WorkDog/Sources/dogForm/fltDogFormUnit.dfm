object fltDogForm: TfltDogForm
  Left = 485
  Top = 345
  BorderStyle = bsDialog
  Caption = #1060#1110#1083#1100#1090#1088' '#1085#1072' '#1076#1086#1075#1086#1074#1086#1088#1072
  ClientHeight = 700
  ClientWidth = 422
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    422
    700)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 1
    Width = 423
    Height = 392
    Style = bsRaised
  end
  object Label1: TLabel
    Left = 314
    Top = 116
    Width = 103
    Height = 13
    AutoSize = False
    Caption = #1076#1086
  end
  object OKButton: TcxButton
    Left = 128
    Top = 674
    Width = 105
    Height = 25
    Anchors = [akLeft, akRight, akBottom]
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080' '#1092#1110#1083#1100#1090#1088
    TabOrder = 0
    OnClick = OKButtonClick
  end
  object cxButton2: TcxButton
    Left = 239
    Top = 674
    Width = 105
    Height = 25
    Anchors = [akLeft, akRight, akBottom]
    Caption = #1057#1082#1072#1089#1091#1074#1072#1090#1080' '#1092#1110#1083#1100#1090#1088
    TabOrder = 1
    OnClick = cxButton2Click
  end
  object cxButton3: TcxButton
    Left = 352
    Top = 674
    Width = 67
    Height = 25
    Anchors = [akLeft, akRight, akBottom]
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 2
    OnClick = cxButton3Click
  end
  object repGroupBox: TcxGroupBox
    Left = 0
    Top = 450
    Width = 425
    Height = 137
    Alignment = alTopLeft
    Caption = ' '#1053#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103' '#1079#1074#1110#1090#1091' '
    TabOrder = 3
    Visible = False
    object cxGroupBox3: TcxGroupBox
      Left = 8
      Top = 12
      Width = 273
      Height = 117
      Alignment = alTopLeft
      Caption = #1042#1110#1076#1086#1073#1088#1072#1078#1072#1090#1080
      TabOrder = 0
      object repRegNumCheck: TcxCheckBox
        Left = 8
        Top = 12
        Width = 121
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1056#1077#1101#1089#1090#1088'. '#8470
        State = cbsChecked
        TabOrder = 0
      end
      object repNumDogCheck: TcxCheckBox
        Left = 8
        Top = 28
        Width = 121
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #8470' '#1076#1086#1075#1086#1074#1086#1088#1091
        State = cbsChecked
        TabOrder = 1
      end
      object repSumCheck: TcxCheckBox
        Left = 8
        Top = 44
        Width = 121
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1057#1091#1084#1072' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1091
        State = cbsChecked
        TabOrder = 2
      end
      object repSumPayCheck: TcxCheckBox
        Left = 8
        Top = 60
        Width = 121
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1057#1091#1084#1072' '#1086#1087#1083#1072#1090#1080
        State = cbsChecked
        TabOrder = 3
      end
      object repSumFulfilCheck: TcxCheckBox
        Left = 8
        Top = 76
        Width = 121
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1057#1091#1084#1072' '#1074#1080#1082#1086#1085#1072#1085#1085#1103
        State = cbsChecked
        TabOrder = 4
      end
      object repRestCheck: TcxCheckBox
        Left = 128
        Top = 12
        Width = 121
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1047#1072#1083#1080#1096#1086#1082
        State = cbsChecked
        TabOrder = 5
      end
      object repDocPaycheck: TcxCheckBox
        Left = 128
        Top = 44
        Width = 121
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1080' '#1086#1087#1083#1072#1090#1080
        State = cbsChecked
        TabOrder = 6
      end
      object repPercentCheck: TcxCheckBox
        Left = 128
        Top = 28
        Width = 121
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = '% '#1074#1080#1082#1086#1085#1072#1085#1085#1103
        State = cbsChecked
        TabOrder = 7
      end
      object repDocFulfilCheck: TcxCheckBox
        Left = 128
        Top = 60
        Width = 145
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1080' '#1074#1080#1082#1086#1085#1072#1085#1085#1103
        State = cbsChecked
        TabOrder = 8
      end
      object repNoteCheck: TcxCheckBox
        Left = 128
        Top = 76
        Width = 121
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1055#1110#1076#1089#1090#1072#1074#1072
        TabOrder = 9
      end
      object repNumDateDogCheck: TcxCheckBox
        Left = 8
        Top = 92
        Width = 121
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #8470' '#1076#1086#1075#1086#1074#1086#1088#1091', '#1076#1072#1090#1072
        TabOrder = 10
      end
    end
    object cxGroupBox2: TcxGroupBox
      Left = 288
      Top = 12
      Width = 129
      Height = 117
      Alignment = alTopLeft
      Caption = ' '#1041#1091#1084#1072#1075#1072' '
      TabOrder = 1
      object Image1: TImage
        Left = 32
        Top = 64
        Width = 24
        Height = 24
        AutoSize = True
        Picture.Data = {
          07544269746D6170FE020000424DFE02000000000000BE000000280000001800
          000018000000010008000000000040020000120B0000120B0000220000002200
          0000FF00FF00A9817E00A77F7B00F2EBEA00A1726600B47A6200B6846F00EBC7
          A300EBCAA500FFC57E00F3D5B200FFC98100FFCC8800F6DCBB00EBD3B500EBD9
          C100FFCC8400FFCE8600FFD59A00FFD08800FFD38A00FFD18B00FFDD9D00FFE3
          AF00FFE6AD00FFEEBD00FFF2C600FFF3CB00FFF8DC00FFFFDE00FFFFE600FFFF
          FA00FFFFFF000000000000000000050404040404040404040404040404040404
          000000000000060F0F0E0E0E0D0D07070808080A0A1414040000000606200606
          2006062006062006062006062020090400000006202020202020202020202020
          2020202020041304000000202020202020202020202020202020202020040B04
          0000000620202020202020202020202020202020202010040000000620202020
          2020202020202020202020202004110400000020202020202020202020202020
          2020202020040B04000000062020202020202020202020202020202020201504
          000000062020202020202020202020202020202020040C040000002020202020
          2020202020202020202020202004160400000006202020202020202020202020
          2020202020201204000000062020202020202020202020202020202020041804
          0000002020202020202020202020202020202020200417040000000620202020
          2020202020202020202020202020190400000006202020202020202020202020
          2020202020041A04000000202020202020202020202020202020202020041B04
          000000062020202020202020202020202020202020201D040000000620202020
          20202020202020202020202020041C0400000002202020202020202020202020
          2020202020041F04000000202020202020202020202020202020202020201E04
          0000000620202020202020202020202020202020200404040000000620202020
          2020202020202020202020202004000000000020060603060620060620060120
          01012001012000000000}
        Transparent = True
      end
      object Image2: TImage
        Left = 88
        Top = 64
        Width = 24
        Height = 24
        AutoSize = True
        Picture.Data = {
          07544269746D6170FE020000424DFE02000000000000BE000000280000001800
          000018000000010008000000000040020000120B0000120B0000220000002200
          0000FF00FF00A9817E00A77F7B00F2EBEA00A1726600B47A6200B6846F00EBC7
          A300EBCAA500FFC57E00F3D5B200FFC98100FFCC8800F6DCBB00EBD3B500EBD9
          C100FFCC8400FFCE8600FFD59A00FFD08800FFD38A00FFD18B00FFDD9D00FFE3
          AF00FFE6AD00FFEEBD00FFF2C600FFF3CB00FFF8DC00FFFFDE00FFFFE600FFFF
          FA00FFFFFF000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000004040404
          0404040404040404040404040404040404040000041E1F1C1D1B1A1917181216
          0C150B11100B1309140420040420040420040420040420040420040420040420
          1404012020202020202020202020202020202020202020200A04012020202020
          202020202020202020202020202020060A042020202020202020202020202020
          2020202020202006080401202020202020202020202020202020202020202020
          0804012020202020202020202020202020202020202020060804202020202020
          2020202020202020202020202020200607040120202020202020202020202020
          2020202020202020070406202020202020202020202020202020202020202006
          0D04202020202020202020202020202020202020202020060D04062020202020
          202020202020202020202020202020200E040620202020202020202020202020
          20202020202020060E0420202020202020202020202020202020202020202006
          0E04062020202020202020202020202020202020202020200F04062020202020
          202020202020202020202020202020060F040320202020202020202020202020
          2020202020202006060506202020202020202020202020202020202020202020
          0000062020202020202020202020202020202020202020060000200606200206
          0620060620060620060620060620060600000000000000000000000000000000
          00000000000000000000}
        Transparent = True
      end
      object repBook: TcxRadioButton
        Left = 16
        Top = 72
        Width = 17
        Height = 17
        TabOrder = 0
      end
      object repAlb: TcxRadioButton
        Left = 72
        Top = 72
        Width = 17
        Height = 17
        Checked = True
        TabOrder = 1
        TabStop = True
      end
      object Panel1: TPanel
        Left = 8
        Top = 16
        Width = 113
        Height = 25
        BevelOuter = bvNone
        TabOrder = 2
        object repA3: TcxRadioButton
          Tag = 1
          Left = 8
          Top = 8
          Width = 41
          Height = 17
          Caption = #1040'3'
          TabOrder = 0
        end
        object repA4: TcxRadioButton
          Tag = 1
          Left = 64
          Top = 8
          Width = 41
          Height = 17
          Caption = #1040'4'
          Checked = True
          TabOrder = 1
          TabStop = True
        end
      end
    end
  end
  object fltRegNumCheck: TcxCheckBox
    Left = 12
    Top = 1
    Width = 117
    Height = 21
    AutoSize = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1056#1077#1108#1089#1090#1088#1072#1094#1110#1081#1085#1080#1081' '#8470
    TabOrder = 4
    OnClick = fltRegNumCheckClick
  end
  object fltRegNumEdit: TcxTextEdit
    Left = 8
    Top = 19
    Width = 169
    Height = 21
    Enabled = False
    Properties.MaxLength = 50
    Style.Color = clMoneyGreen
    TabOrder = 5
    OnKeyDown = fltRegNumEditKeyDown
    OnKeyPress = fltRegNumEditKeyPress
  end
  object chNumDog: TcxCheckBox
    Left = 188
    Top = 1
    Width = 85
    Height = 21
    AutoSize = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #8470' '#1076#1086#1075#1086#1074#1086#1088#1091
    TabOrder = 6
    OnClick = chNumDogClick
  end
  object NumDogEdit: TcxTextEdit
    Left = 184
    Top = 19
    Width = 121
    Height = 21
    Enabled = False
    Properties.MaxLength = 20
    Style.Color = clMoneyGreen
    TabOrder = 7
    OnKeyDown = fltRegNumEditKeyDown
  end
  object chId_dog: TcxCheckBox
    Left = 0
    Top = 580
    Width = 69
    Height = 21
    AutoSize = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = 'ID_DOG'
    TabOrder = 8
    Visible = False
    OnClick = chId_dogClick
  end
  object id_dogEdit: TcxTextEdit
    Left = 0
    Top = 600
    Width = 121
    Height = 21
    Enabled = False
    Properties.MaxLength = 10
    Style.Color = clMoneyGreen
    TabOrder = 9
    Visible = False
    OnKeyDown = id_dogEditKeyDown
  end
  object fltCustCheck: TcxCheckBox
    Left = 4
    Top = 39
    Width = 309
    Height = 21
    AutoSize = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090'/'#1055'I'#1041'('#1079#1072' '#1074#1082#1083#1102#1095#1077#1085#1085#1103#1084')'
    TabOrder = 10
    OnClick = fltCustCheckClick
  end
  object fltCustEdit: TcxButtonEdit
    Left = 8
    Top = 55
    Width = 409
    Height = 21
    Enabled = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = False
    Properties.OnButtonClick = fltCustEditPropertiesButtonClick
    Properties.OnChange = fltCustEditPropertiesChange
    Style.Color = clMoneyGreen
    TabOrder = 11
    OnKeyPress = fltCustEditKeyPress
  end
  object fltTipDogCheck: TcxCheckBox
    Left = 4
    Top = 76
    Width = 229
    Height = 21
    AutoSize = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1058#1080#1087' '#1076#1086#1075#1086#1074#1086#1088#1091
    TabOrder = 12
    OnClick = fltTipDogCheckClick
  end
  object fltTipDogEdit: TcxButtonEdit
    Left = 8
    Top = 93
    Width = 409
    Height = 21
    Enabled = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = fltTipDogEditPropertiesButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 13
    OnKeyPress = fltTipDogEditKeyPress
  end
  object fltDatePeriodCheck: TcxCheckBox
    Left = 4
    Top = 114
    Width = 89
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1047#1072' '#1087#1077#1088#1110#1086#1076' '#1079
    TabOrder = 14
    OnClick = fltDatePeriodCheckClick
  end
  object fltDateBegEdit: TcxDateEdit
    Left = 8
    Top = 131
    Width = 89
    Height = 21
    Enabled = False
    PopupMenu = PopupMenu1
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.Color = clMoneyGreen
    TabOrder = 15
    OnKeyPress = fltDateBegEditKeyPress
  end
  object fltDateEndEdit: TcxDateEdit
    Left = 104
    Top = 131
    Width = 89
    Height = 21
    Enabled = False
    PopupMenu = PopupMenu1
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.Color = clMoneyGreen
    TabOrder = 16
    OnKeyPress = fltDateEndEditKeyPress
  end
  object cxLabel10: TcxLabel
    Left = 101
    Top = 116
    Width = 92
    Height = 17
    AutoSize = False
    TabOrder = 17
    Caption = #1087#1086
  end
  object fltSumFromEdit: TcxCurrencyEdit
    Left = 200
    Top = 131
    Width = 105
    Height = 21
    OnFocusChanged = fltSumFromEditFocusChanged
    BeepOnEnter = False
    Enabled = False
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0.00;-,0.00'
    Style.Color = clMoneyGreen
    TabOrder = 18
    OnKeyPress = fltSumFromEditKeyPress
  end
  object fltSumCheck: TcxCheckBox
    Left = 196
    Top = 113
    Width = 109
    Height = 21
    AutoSize = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1057#1091#1084#1072' '#1074#1110#1076
    TabOrder = 19
    OnClick = fltSumCheckClick
  end
  object fltSumToEdit: TcxCurrencyEdit
    Left = 312
    Top = 131
    Width = 105
    Height = 21
    BeepOnEnter = False
    Enabled = False
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0.00;-,0.00'
    Style.Color = clMoneyGreen
    TabOrder = 20
    OnKeyPress = fltSumToEditKeyPress
  end
  object depCheck: TcxCheckBox
    Left = 4
    Top = 152
    Width = 413
    Height = 21
    AutoSize = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1055'i'#1076#1088#1086#1079#1076'i'#1083
    TabOrder = 21
    OnClick = depCheckClick
  end
  object depEdit: TcxButtonEdit
    Left = 8
    Top = 169
    Width = 409
    Height = 21
    Enabled = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = depEditPropertiesButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 22
  end
  object dateactCheck: TcxCheckBox
    Left = 4
    Top = 189
    Width = 89
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1058#1077#1088#1084#1110#1085' '#1076#1110#1110' '#1079
    TabOrder = 23
    OnClick = dateactCheckClick
  end
  object DateActBegEdit: TcxDateEdit
    Left = 8
    Top = 205
    Width = 97
    Height = 21
    Enabled = False
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.Color = clMoneyGreen
    TabOrder = 24
    OnKeyPress = DateActBegEditKeyPress
  end
  object DateActEndEdit: TcxDateEdit
    Left = 110
    Top = 205
    Width = 97
    Height = 21
    Enabled = False
    PopupMenu = PopupMenu1
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.Color = clMoneyGreen
    TabOrder = 25
    OnKeyPress = fltDateEndEditKeyPress
  end
  object cxLabel1: TcxLabel
    Left = 108
    Top = 189
    Width = 92
    Height = 17
    AutoSize = False
    TabOrder = 26
    Caption = #1087#1086
  end
  object NomnCheck: TcxCheckBox
    Left = 211
    Top = 189
    Width = 149
    Height = 21
    AutoSize = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1085#1080#1081' '#1085#1086#1084#1077#1088
    TabOrder = 27
    OnClick = NomnCheckClick
  end
  object nomnEdit: TcxTextEdit
    Left = 213
    Top = 205
    Width = 185
    Height = 21
    Enabled = False
    Properties.MaxLength = 20
    Style.Color = clMoneyGreen
    TabOrder = 28
    OnKeyDown = fltRegNumEditKeyDown
    OnKeyPress = nomnEditKeyPress
  end
  object DateNomnEndEdit: TcxDateEdit
    Left = 152
    Top = 279
    Width = 89
    Height = 21
    Enabled = False
    PopupMenu = PopupMenu1
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.Color = clMoneyGreen
    TabOrder = 29
    OnKeyPress = fltDateEndEditKeyPress
  end
  object cxLabel2: TcxLabel
    Left = 152
    Top = 263
    Width = 84
    Height = 18
    AutoSize = False
    TabOrder = 30
    Caption = #1087#1086
  end
  object DateNomnBegEdit: TcxDateEdit
    Left = 8
    Top = 279
    Width = 137
    Height = 21
    Enabled = False
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.Color = clMoneyGreen
    TabOrder = 31
    OnKeyPress = DateNomnBegEditKeyPress
  end
  object DateNomnCheck: TcxCheckBox
    Left = 5
    Top = 261
    Width = 145
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1085#1072' '#1076#1072#1090#1072' '#1079
    TabOrder = 32
    OnClick = DateNomnCheckClick
  end
  object ShowClosedCheck: TcxCheckBox
    Left = 4
    Top = 303
    Width = 237
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1042#1110#1076#1086#1073#1088#1072#1078#1072#1090#1080' '#1079#1072#1082#1088#1080#1090#1110' '#1076#1086#1075#1086#1074#1086#1088#1080
    TabOrder = 33
    OnClick = ShowClosedCheckClick
  end
  object chSumPayFulfil1: TcxCheckBox
    Left = 4
    Top = 319
    Width = 237
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1057#1091#1084#1072' '#1086#1087#1083#1072#1090#1080' '#1085#1077' '#1076#1086#1088'i'#1074#1085#1102#1108' '#1089#1091#1084#1110' '#1074#1080#1082#1086#1085#1072#1085#1085#1103
    TabOrder = 34
    OnClick = ShowClosedCheckClick
  end
  object chSumPayFulfil2: TcxCheckBox
    Left = 4
    Top = 335
    Width = 237
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1057#1091#1084#1072' '#1086#1087#1083#1072#1090#1080' = '#1057#1091#1084#1072' '#1074#1080#1082#1086#1085#1072#1085#1085#1103
    TabOrder = 35
    OnClick = ShowClosedCheckClick
  end
  object MatEdit: TcxButtonEdit
    Left = 6
    Top = 411
    Width = 201
    Height = 21
    Enabled = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = MatEditPropertiesButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 36
  end
  object cbMat: TcxCheckBox
    Left = 5
    Top = 391
    Width = 201
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1086#1088
    TabOrder = 37
    OnClick = cbMatClick
  end
  object cbRateAccNative: TcxCheckBox
    Left = 248
    Top = 262
    Width = 169
    Height = 22
    AutoSize = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1056#1072#1093#1091#1085#1086#1082' '
    TabOrder = 38
    OnClick = cbRateAccNativeClick
  end
  object RateAccNativeEdit: TcxButtonEdit
    Left = 246
    Top = 279
    Width = 171
    Height = 21
    Enabled = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = RateAccNativeEditPropertiesButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 39
  end
  object cbNote: TcxCheckBox
    Left = 244
    Top = 301
    Width = 117
    Height = 22
    AutoSize = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1055#1110#1076#1089#1090#1072#1074#1072
    TabOrder = 40
    OnClick = cbNoteClick
  end
  object eNote: TcxTextEdit
    Left = 248
    Top = 319
    Width = 169
    Height = 21
    Enabled = False
    Properties.MaxLength = 100
    Style.Color = clMoneyGreen
    TabOrder = 41
    OnKeyDown = fltRegNumEditKeyDown
    OnKeyPress = fltRegNumEditKeyPress
  end
  object cbEnds: TcxCheckBox
    Left = 308
    Top = 2
    Width = 109
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1047#1072#1082#1110#1085#1095#1091#1108#1090#1100#1089#1103' '#1076#1086
    TabOrder = 42
    OnClick = cbEndsClick
  end
  object deEnds: TcxDateEdit
    Left = 312
    Top = 19
    Width = 105
    Height = 21
    Enabled = False
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.Color = clMoneyGreen
    TabOrder = 43
    OnKeyPress = fltDateEndEditKeyPress
  end
  object cxClassEdit: TcxButtonEdit
    Left = 213
    Top = 411
    Width = 201
    Height = 21
    Enabled = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 44
  end
  object cbClass: TcxCheckBox
    Left = 214
    Top = 391
    Width = 201
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1050#1083#1072#1089#1080#1092#1110#1082#1072#1090#1086#1088
    TabOrder = 45
    OnClick = cbClassClick
  end
  object fltClassBox: TcxCheckBox
    Left = 4
    Top = 367
    Width = 213
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1042#1110#1076#1086#1073#1088#1072#1078#1072#1090#1080' '#1073#1077#1079' '#1082#1083#1072#1089#1089#1080#1092#1110#1082#1072#1090#1086#1088#1072
    State = cbsChecked
    TabOrder = 46
    Visible = False
  end
  object EditDateBegNarah: TcxDateEdit
    Left = 8
    Top = 243
    Width = 97
    Height = 21
    Enabled = False
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.Color = clMoneyGreen
    TabOrder = 48
    OnKeyPress = DateActBegEditKeyPress
  end
  object CheckBoxPeriodNarah: TcxCheckBox
    Left = 4
    Top = 225
    Width = 221
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1053#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103'  '#1079
    TabOrder = 47
    OnClick = CheckBoxPeriodNarahClick
  end
  object cxLabel3: TcxLabel
    Left = 108
    Top = 227
    Width = 92
    Height = 17
    AutoSize = False
    TabOrder = 51
    Caption = #1087#1086
  end
  object EditDateEndNarah: TcxDateEdit
    Left = 110
    Top = 243
    Width = 97
    Height = 21
    Enabled = False
    PopupMenu = PopupMenu1
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.Color = clMoneyGreen
    TabOrder = 49
    OnKeyPress = fltDateEndEditKeyPress
  end
  object CheckBoxNotNarah: TcxCheckBox
    Left = 208
    Top = 234
    Width = 206
    Height = 21
    Enabled = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1053#1077' '#1074#1080#1089#1090#1072#1074#1083#1077#1085#1086' '#1087#1077#1088#1110#1086#1076' '#1074' '#1076#1086#1075#1086#1074#1086#1088#1110
    TabOrder = 50
  end
  object CheckBoxNotSch: TcxCheckBox
    Left = 208
    Top = 248
    Width = 214
    Height = 21
    Enabled = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1042#1110#1076#1089#1091#1090#1085#1110#1081' '#1088#1072#1093#1091#1085#1086#1082' '#1079#1072' '#1074#1082#1072#1079#1072#1085#1080#1081' '#1087#1077#1088#1110#1086#1076
    TabOrder = 52
  end
  object chSumDogPay: TcxCheckBox
    Left = 4
    Top = 351
    Width = 237
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1057#1091#1084#1072' '#1076#1086#1075#1086#1074#1086#1088#1091' '#1085#1077' '#1076#1086#1088'i'#1074#1085#1102#1108' '#1089#1091#1084#1110' '#1086#1087#1083#1072#1090#1080
    TabOrder = 53
    OnClick = ShowClosedCheckClick
  end
  object PopupMenu1: TPopupMenu
    Left = 318
    Top = 342
    object i1: TMenuItem
      Caption = #1057#1100#1086#1075#1086#1076#1085'i'
      OnClick = i1Click
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object N1: TMenuItem
      Caption = #1055#1086#1090#1086#1095#1085#1080#1081' '#1088#1110#1082
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1055#1086#1087#1077#1088#1077#1076#1085#1110#1081' '#1088#1110#1082
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = '-'
      Visible = False
    end
    object N4: TMenuItem
      Caption = #1055#1077#1088#1096#1080#1081' '#1082#1074#1072#1088#1090#1072#1083' '#1087#1086#1090#1086#1095#1085#1086#1075#1086' '#1088#1086#1082#1091
      Visible = False
    end
    object N5: TMenuItem
      Caption = #1044#1088#1091#1075#1080#1081' '#1082#1074#1072#1088#1090#1072#1083' '#1087#1086#1090#1086#1095#1085#1086#1075#1086' '#1088#1086#1082#1091
      Visible = False
    end
    object N6: TMenuItem
      Caption = #1058#1088#1077#1090#1110#1081' '#1082#1074#1072#1088#1090#1072#1083' '#1087#1086#1090#1086#1095#1085#1086#1075#1086' '#1088#1086#1082#1091
      Visible = False
    end
    object N7: TMenuItem
      Caption = #1063#1077#1090#1074#1077#1088#1090#1099#1081' '#1082#1074#1072#1088#1090#1072#1083' '#1087#1086#1090#1086#1095#1085#1086#1075#1086' '#1088#1086#1082#1091
      Visible = False
    end
  end
  object ActionList1: TActionList
    Left = 277
    Top = 340
    object Action1: TAction
      Caption = 'actApplyFilter'
      ShortCut = 16419
      SecondaryShortCuts.Strings = (
        'F10')
      OnExecute = Action1Execute
    end
  end
  object pFIBDatabase1: TpFIBDatabase
    SQLDialect = 1
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 357
    Top = 342
  end
  object StoredProc: TpFIBStoredProc
    Database = dogForm.WorkDatabase
    Transaction = dogForm.WriteTransaction
    Left = 392
    Top = 342
  end
end
