object FilterForm: TFilterForm
  Left = 519
  Top = 278
  Width = 458
  Height = 576
  Caption = #1060#1110#1083#1100#1090#1088' '#1076#1086#1075#1086#1074#1086#1088#1110#1074
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 497
    Width = 442
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 224
      Top = 8
      Width = 113
      Height = 25
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080' '#1092#1110#1083#1100#1090#1088
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 352
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 442
    Height = 497
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object FiltrParamPageControl: TcxPageControl
      Left = 1
      Top = 1
      Width = 440
      Height = 495
      ActivePage = FiltrParamUrFnTabSheet
      Align = alClient
      TabOrder = 0
      object FiltrParamMainTabSheet: TcxTabSheet
        Caption = #1054#1089#1085#1086#1074#1085#1110' '#1087#1072#1088#1072#1084#1077#1090#1088#1080' '#1074#1110#1076#1073#1086#1088#1091' '#1076#1086#1075#1086#1074#1086#1088#1110#1074
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImageIndex = 0
        ParentFont = False
        object Bevel1: TBevel
          Left = 8
          Top = 57
          Width = 417
          Height = 370
          Style = bsRaised
        end
        object Label1: TLabel
          Left = 130
          Top = 116
          Width = 103
          Height = 13
          AutoSize = False
          Caption = #1076#1086
        end
        object fltRegNumCheck: TcxCheckBox
          Left = 12
          Top = 1
          Width = 117
          Height = 21
          AutoSize = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1056#1077#1108#1089#1090#1088#1072#1094#1110#1081#1085#1080#1081' '#8470
          TabOrder = 0
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
          TabOrder = 1
        end
        object chNumDog: TcxCheckBox
          Left = 188
          Top = 1
          Width = 85
          Height = 21
          AutoSize = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #8470' '#1076#1086#1075#1086#1074#1086#1088#1091
          TabOrder = 2
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
          TabOrder = 3
        end
        object fltCustCheck: TcxCheckBox
          Left = 12
          Top = 39
          Width = 309
          Height = 21
          AutoSize = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090'/'#1055'I'#1041'('#1079#1072' '#1074#1082#1083#1102#1095#1077#1085#1085#1103#1084')'
          TabOrder = 4
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
          TabOrder = 5
        end
        object fltTipDogCheck: TcxCheckBox
          Left = 12
          Top = 76
          Width = 229
          Height = 21
          AutoSize = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1058#1080#1087' '#1076#1086#1075#1086#1074#1086#1088#1091
          TabOrder = 6
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
          TabOrder = 7
        end
        object fltDatePeriodCheck: TcxCheckBox
          Left = 244
          Top = 114
          Width = 89
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1047#1072' '#1087#1077#1088#1110#1086#1076' '#1079
          State = cbsChecked
          TabOrder = 8
          Visible = False
          OnClick = fltDatePeriodCheckClick
        end
        object fltDateBegEdit: TcxDateEdit
          Left = 328
          Top = 131
          Width = 89
          Height = 21
          Enabled = False
          PopupMenu = PopupMenu1
          Properties.SaveTime = False
          Properties.ShowTime = False
          Style.Color = clMoneyGreen
          TabOrder = 9
          Visible = False
        end
        object fltDateEndEdit: TcxDateEdit
          Left = 240
          Top = 131
          Width = 89
          Height = 21
          Enabled = False
          PopupMenu = PopupMenu1
          Properties.SaveTime = False
          Properties.ShowTime = False
          Style.Color = clMoneyGreen
          TabOrder = 10
          Visible = False
        end
        object cxLabel10: TcxLabel
          Left = 341
          Top = 116
          Width = 92
          Height = 17
          AutoSize = False
          TabOrder = 11
          Visible = False
          Caption = #1087#1086
        end
        object fltSumFromEdit: TcxCurrencyEdit
          Left = 8
          Top = 131
          Width = 105
          Height = 21
          BeepOnEnter = False
          Enabled = False
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
          Style.Color = clMoneyGreen
          TabOrder = 12
        end
        object fltSumCheck: TcxCheckBox
          Left = 12
          Top = 113
          Width = 109
          Height = 21
          AutoSize = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1057#1091#1084#1072' '#1074#1110#1076
          TabOrder = 13
          OnClick = fltSumCheckClick
        end
        object fltSumToEdit: TcxCurrencyEdit
          Left = 128
          Top = 131
          Width = 105
          Height = 21
          BeepOnEnter = False
          Enabled = False
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
          Style.Color = clMoneyGreen
          TabOrder = 14
        end
        object depCheck: TcxCheckBox
          Left = 4
          Top = 152
          Width = 413
          Height = 21
          AutoSize = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1055'i'#1076#1088#1086#1079#1076'i'#1083
          TabOrder = 15
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
          TabOrder = 16
        end
        object dateactCheck: TcxCheckBox
          Left = 4
          Top = 189
          Width = 89
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1058#1077#1088#1084#1110#1085' '#1076#1110#1110' '#1079
          TabOrder = 17
          OnClick = dateactCheckClick
        end
        object DateActBegEdit: TcxDateEdit
          Left = 8
          Top = 213
          Width = 97
          Height = 21
          Enabled = False
          Properties.SaveTime = False
          Properties.ShowTime = False
          Style.Color = clMoneyGreen
          TabOrder = 18
        end
        object DateActEndEdit: TcxDateEdit
          Left = 110
          Top = 213
          Width = 97
          Height = 21
          Enabled = False
          PopupMenu = PopupMenu1
          Properties.SaveTime = False
          Properties.ShowTime = False
          Style.Color = clMoneyGreen
          TabOrder = 19
        end
        object cxLabel1: TcxLabel
          Left = 108
          Top = 189
          Width = 92
          Height = 17
          AutoSize = False
          TabOrder = 20
          Caption = #1087#1086
        end
        object NomnCheck: TcxCheckBox
          Left = 211
          Top = 197
          Width = 149
          Height = 21
          AutoSize = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1085#1080#1081' '#1085#1086#1084#1077#1088
          TabOrder = 21
          OnClick = NomnCheckClick
        end
        object nomnEdit: TcxTextEdit
          Left = 213
          Top = 213
          Width = 185
          Height = 21
          Enabled = False
          Properties.MaxLength = 20
          Style.Color = clMoneyGreen
          TabOrder = 22
        end
        object DateNomnEndEdit: TcxDateEdit
          Left = 152
          Top = 287
          Width = 89
          Height = 21
          Enabled = False
          PopupMenu = PopupMenu1
          Properties.SaveTime = False
          Properties.ShowTime = False
          Style.Color = clMoneyGreen
          TabOrder = 23
        end
        object cxLabel2: TcxLabel
          Left = 152
          Top = 271
          Width = 84
          Height = 18
          AutoSize = False
          TabOrder = 24
          Caption = #1087#1086
        end
        object DateNomnBegEdit: TcxDateEdit
          Left = 8
          Top = 287
          Width = 137
          Height = 21
          Enabled = False
          Properties.SaveTime = False
          Properties.ShowTime = False
          Style.Color = clMoneyGreen
          TabOrder = 25
        end
        object DateNomnCheck: TcxCheckBox
          Left = 5
          Top = 269
          Width = 145
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1085#1072' '#1076#1072#1090#1072' '#1079
          TabOrder = 26
          OnClick = DateNomnCheckClick
        end
        object ShowClosedCheck: TcxCheckBox
          Left = 4
          Top = 311
          Width = 237
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1042#1110#1076#1086#1073#1088#1072#1078#1072#1090#1080' '#1079#1072#1082#1088#1080#1090#1110' '#1076#1086#1075#1086#1074#1086#1088#1080
          TabOrder = 27
          OnClick = ShowClosedCheckClick
        end
        object chSumPayFulfil1: TcxCheckBox
          Left = 4
          Top = 327
          Width = 237
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1057#1091#1084#1072' '#1086#1087#1083#1072#1090#1080' '#1085#1077' '#1076#1086#1088'i'#1074#1085#1102#1108' '#1089#1091#1084#1110' '#1074#1080#1082#1086#1085#1072#1085#1085#1103
          TabOrder = 28
          OnClick = chSumPayFulfil1Click
        end
        object chSumPayFulfil2: TcxCheckBox
          Left = 4
          Top = 343
          Width = 237
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1057#1091#1084#1072' '#1086#1087#1083#1072#1090#1080' = '#1057#1091#1084#1072' '#1074#1080#1082#1086#1085#1072#1085#1085#1103
          TabOrder = 29
          OnClick = chSumPayFulfil2Click
        end
        object MatEdit: TcxButtonEdit
          Left = 6
          Top = 396
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
          TabOrder = 30
        end
        object cbMat: TcxCheckBox
          Left = 6
          Top = 378
          Width = 201
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1086#1088
          TabOrder = 31
          OnClick = cbMatClick
        end
        object cbRateAccNative: TcxCheckBox
          Left = 248
          Top = 270
          Width = 169
          Height = 22
          AutoSize = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1056#1072#1093#1091#1085#1086#1082' '
          TabOrder = 32
          OnClick = cbRateAccNativeClick
        end
        object RateAccNativeEdit: TcxButtonEdit
          Left = 246
          Top = 287
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
          TabOrder = 33
        end
        object cbNote: TcxCheckBox
          Left = 244
          Top = 309
          Width = 117
          Height = 22
          AutoSize = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1055#1110#1076#1089#1090#1072#1074#1072
          TabOrder = 34
          OnClick = cbNoteClick
        end
        object eNote: TcxTextEdit
          Left = 248
          Top = 327
          Width = 169
          Height = 21
          Enabled = False
          Properties.MaxLength = 100
          Style.Color = clMoneyGreen
          TabOrder = 35
        end
        object cbEnds: TcxCheckBox
          Left = 308
          Top = 2
          Width = 109
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1047#1072#1082#1110#1085#1095#1091#1108#1090#1100#1089#1103' '#1076#1086
          TabOrder = 36
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
          TabOrder = 37
        end
        object cxClassEdit: TcxButtonEdit
          Left = 214
          Top = 396
          Width = 201
          Height = 21
          Enabled = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = cxClassEditPropertiesButtonClick
          Style.Color = clMoneyGreen
          TabOrder = 38
        end
        object cbClass: TcxCheckBox
          Left = 214
          Top = 378
          Width = 201
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = cbClassPropertiesChange
          Properties.Caption = #1050#1083#1072#1089#1080#1092#1110#1082#1072#1090#1086#1088
          TabOrder = 39
        end
        object fltClassBox: TcxCheckBox
          Left = 4
          Top = 359
          Width = 213
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1042#1110#1076#1086#1073#1088#1072#1078#1072#1090#1080' '#1073#1077#1079' '#1082#1083#1072#1089#1089#1080#1092#1110#1082#1072#1090#1086#1088#1072
          State = cbsChecked
          TabOrder = 40
          Visible = False
        end
        object EditDateBegNarah: TcxDateEdit
          Left = 8
          Top = 251
          Width = 97
          Height = 21
          Enabled = False
          Properties.SaveTime = False
          Properties.ShowTime = False
          Style.Color = clMoneyGreen
          TabOrder = 41
        end
        object CheckBoxPeriodNarah: TcxCheckBox
          Left = 4
          Top = 233
          Width = 221
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1053#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103'  '#1079
          TabOrder = 42
          OnClick = CheckBoxPeriodNarahClick
        end
        object cxLabel3: TcxLabel
          Left = 108
          Top = 235
          Width = 92
          Height = 17
          AutoSize = False
          TabOrder = 43
          Caption = #1087#1086
        end
        object EditDateEndNarah: TcxDateEdit
          Left = 110
          Top = 251
          Width = 97
          Height = 21
          Enabled = False
          PopupMenu = PopupMenu1
          Properties.SaveTime = False
          Properties.ShowTime = False
          Style.Color = clMoneyGreen
          TabOrder = 44
        end
        object CheckBoxNotNarah: TcxCheckBox
          Left = 208
          Top = 242
          Width = 206
          Height = 21
          Enabled = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1053#1077' '#1074#1080#1089#1090#1072#1074#1083#1077#1085#1086' '#1087#1077#1088#1110#1086#1076' '#1074' '#1076#1086#1075#1086#1074#1086#1088#1110
          TabOrder = 45
        end
        object CheckBoxNotSch: TcxCheckBox
          Left = 208
          Top = 256
          Width = 214
          Height = 21
          Enabled = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1042#1110#1076#1089#1091#1090#1085#1110#1081' '#1088#1072#1093#1091#1085#1086#1082' '#1079#1072' '#1074#1082#1072#1079#1072#1085#1080#1081' '#1087#1077#1088#1110#1086#1076
          TabOrder = 46
        end
      end
      object FiltrParamUrFnTabSheet: TcxTabSheet
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1102#1088'/'#1092#1110#1085' '#1079#1086#1073#1086#1074'`'#1103#1079#1072#1085#1100
        ImageIndex = 1
        object PeriodGroupBox: TGroupBox
          Left = 8
          Top = 8
          Width = 425
          Height = 57
          Caption = #1047#1074#1110#1090' '#1092#1086#1088#1084#1091#1108#1090#1100#1089#1103' '#1076#1083#1103' '#1087#1077#1088#1110#1086#1076#1091':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label2: TLabel
            Left = 56
            Top = 24
            Width = 10
            Height = 16
            Caption = #1079
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 208
            Top = 24
            Width = 19
            Height = 16
            Caption = #1087#1086
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object cxDateBegIn: TcxDateEdit
            Left = 72
            Top = 24
            Width = 121
            Height = 24
            ParentFont = False
            Properties.SaveTime = False
            Properties.ShowTime = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -13
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            TabOrder = 0
          end
          object cxDateEndIn: TcxDateEdit
            Left = 232
            Top = 24
            Width = 121
            Height = 24
            ParentFont = False
            Properties.SaveTime = False
            Properties.ShowTime = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -13
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UrFnGroupBox: TGroupBox
          Left = 8
          Top = 72
          Width = 425
          Height = 225
          Caption = #1044#1086' '#1079#1074#1110#1090#1091' '#1074#1082#1083#1102#1095#1080#1090#1080' '#1085#1072#1089#1090#1091#1087#1085#1110' '#1076#1086#1075#1086#1074#1086#1088#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object Label4: TLabel
            Left = 40
            Top = 56
            Width = 303
            Height = 16
            Caption = #1076#1072#1090#1080' '#1103#1082#1080#1093' '#1087#1086#1087#1072#1076#1072#1102#1090#1100' '#1091' '#1074#1074#1077#1076#1077#1085#1080#1081' '#1087#1077#1088#1110#1086#1076' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 40
            Top = 104
            Width = 368
            Height = 16
            Caption = #1079#1086#1073#1086#1074'`'#1103#1079#1072#1085#1085#1103' '#1074' '#1088#1086#1079#1075#1083#1103#1085#1091#1090#1086#1084#1091' '#1074#1074#1077#1076#1077#1085#1086#1084#1091' '#1087#1077#1088#1110#1086#1076#1110
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 40
            Top = 152
            Width = 346
            Height = 16
            Caption = #1076#1086#1088#1091#1095#1077#1085#1085#1103' '#1074' '#1088#1086#1079#1075#1083#1103#1085#1091#1090#1086#1084#1091' '#1074#1074#1077#1076#1077#1085#1086#1084#1091' '#1087#1077#1088#1110#1086#1076#1110
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 32
            Top = 200
            Width = 163
            Height = 16
            Caption = ' '#1079' '#1074#1074#1077#1076#1077#1085#1080#1084' '#1087#1077#1088#1110#1086#1076#1086#1084
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object UrObCheckBox: TcxCheckBox
            Left = 16
            Top = 32
            Width = 385
            Height = 24
            ParentFont = False
            Properties.DisplayUnchecked = 'False'
            Properties.Caption = #1074#1110#1076#1110#1073#1088#1072#1090#1080' '#1076#1086#1075#1086#1074#1086#1088#1072', '#1103#1082#1110' '#1079#1072#1088#1077#1108#1089#1090#1088#1086#1074#1072#1085#1110' '#1102#1088'.'#1079#1086#1073'., '
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            TabOrder = 0
          end
          object FnObCheckBox: TcxCheckBox
            Left = 16
            Top = 80
            Width = 353
            Height = 24
            ParentFont = False
            Properties.DisplayUnchecked = 'False'
            Properties.Caption = #1074#1110#1076#1110#1073#1088#1072#1090#1080' '#1076#1086#1075#1086#1074#1086#1088#1072', '#1076#1083#1103' '#1103#1082#1080#1093' '#1088#1077#1108#1089#1090#1088#1091#1074#1072#1083#1080#1089#1100' '#1092#1110#1085#1072#1085#1089#1086#1074#1110' '
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            TabOrder = 1
          end
          object FactPlCheckBox: TcxCheckBox
            Left = 16
            Top = 128
            Width = 401
            Height = 24
            ParentFont = False
            Properties.DisplayUnchecked = 'False'
            Properties.Caption = #1074#1110#1076#1110#1073#1088#1072#1090#1080' '#1076#1086#1075#1086#1074#1086#1088#1072', '#1087#1086' '#1103#1082#1080#1084' '#1073#1091#1083#1080' '#1089#1092#1086#1088#1084'. '#1087#1083#1072#1090#1110#1078#1085#1110' '
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            TabOrder = 2
          end
          object PerDogCheckBox: TcxCheckBox
            Left = 16
            Top = 176
            Width = 401
            Height = 24
            ParentFont = False
            Properties.DisplayUnchecked = 'False'
            Properties.Caption = #1074#1110#1076#1110#1073#1088#1072#1090#1080' '#1076#1086#1075#1086#1074#1086#1088#1072', '#1087#1077#1088#1110#1086#1076' '#1076#1110#1111' '#1103#1082#1080#1093' '#1087#1077#1088#1077#1090#1080#1085#1072#1108#1090#1100#1089#1103
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            TabOrder = 3
          end
        end
        object RadioGroup1: TRadioGroup
          Left = 8
          Top = 296
          Width = 425
          Height = 73
          Caption = #1043#1088#1091#1087#1087#1091#1074#1072#1085#1085#1103' '#1076#1086#1075#1086#1074#1086#1088#1110#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object GroupByRazdRadioButton: TRadioButton
          Left = 96
          Top = 344
          Width = 249
          Height = 17
          Caption = #1075#1088#1091#1087#1087#1091#1074#1072#1085#1085#1103' '#1079#1072' '#1088#1086#1079#1076#1110#1083#1072#1084#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
        object GroupByKEKVRadioButton: TRadioButton
          Left = 96
          Top = 320
          Width = 201
          Height = 17
          Caption = #1075#1088#1091#1087#1087#1091#1074#1072#1085#1085#1103' '#1079#1072' '#1050#1045#1050#1042
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
        end
        object GroupBox1: TGroupBox
          Left = 8
          Top = 376
          Width = 425
          Height = 89
          Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1092#1110#1083#1100#1090#1088#1091' '#1076#1086#1075#1086#1074#1086#1088#1110#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          object CheckBoxRazdel: TCheckBox
            Left = 24
            Top = 24
            Width = 73
            Height = 17
            Caption = #1088#1086#1079#1076#1110#1083
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = CheckBoxRazdelClick
          end
          object CheckBoxKEKV: TCheckBox
            Left = 24
            Top = 56
            Width = 73
            Height = 17
            Caption = #1082#1077#1082#1074
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = CheckBoxKEKVClick
          end
          object cxButtonEditRazdel: TcxButtonEdit
            Left = 104
            Top = 24
            Width = 305
            Height = 24
            ParentFont = False
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.OnButtonClick = cxButtonEditRazdelPropertiesButtonClick
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -13
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            TabOrder = 2
            Text = 'cxButtonEditRazdel'
          end
          object cxButtonEditKEKV: TcxButtonEdit
            Left = 104
            Top = 56
            Width = 305
            Height = 24
            ParentFont = False
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.OnButtonClick = cxButtonEditKEKVPropertiesButtonClick
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -13
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            TabOrder = 3
            Text = 'cxButtonEditKEKV'
          end
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 392
    Top = 368
    object i1: TMenuItem
      Caption = #1057#1100#1086#1075#1086#1076#1085'i'
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object N1: TMenuItem
      Caption = #1055#1086#1090#1086#1095#1085#1080#1081' '#1088#1110#1082
    end
    object N2: TMenuItem
      Caption = #1055#1086#1087#1077#1088#1077#1076#1085#1110#1081' '#1088#1110#1082
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
    Left = 360
    Top = 368
    object Action1: TAction
      Caption = 'actApplyFilter'
      ShortCut = 16419
      SecondaryShortCuts.Strings = (
        'F10')
    end
  end
  object StoredProc: TpFIBStoredProc
    Left = 360
    Top = 336
  end
  object DataSet: TpFIBDataSet
    Left = 393
    Top = 336
    poSQLINT64ToBCD = True
  end
end
