object FZSetup: TFZSetup
  Left = 336
  Top = 412
  BorderStyle = bsDialog
  Caption = 'FZSetup'
  ClientHeight = 319
  ClientWidth = 811
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object PanelControlButtonGroup: TPanel
    Left = 0
    Top = 292
    Width = 811
    Height = 27
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object YesBtn: TcxButton
      Left = 630
      Top = 0
      Width = 75
      Height = 25
      Action = ActionYes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
    end
    object CancelBtn: TcxButton
      Left = 718
      Top = 0
      Width = 75
      Height = 25
      Action = ActionCancel
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.Kind = lfFlat
    end
  end
  object Pages: TPageControl
    Left = 0
    Top = 0
    Width = 811
    Height = 289
    ActivePage = PagePosadoviOsobu
    Align = alTop
    TabOrder = 1
    object PageNameFirm: TTabSheet
      Caption = 'PageNameFirm'
      object LabelTown: TLabel
        Left = 78
        Top = 137
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'LabelTown'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelShortName: TcxLabel
        Left = 26
        Top = 58
        Width = 119
        Height = 17
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 3
      end
      object MaskEditShortName: TcxMaskEdit
        Left = 144
        Top = 57
        Width = 473
        Height = 24
        ParentFont = False
        Properties.ReadOnly = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 8
        Text = 'MaskEditShortName'
      end
      object LabelOkpo: TcxLabel
        Left = 8
        Top = 33
        Width = 137
        Height = 17
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 1
      end
      object MaskEditOkpo: TcxMaskEdit
        Left = 145
        Top = 31
        Width = 121
        Height = 24
        ParentFont = False
        Properties.ReadOnly = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 7
        Text = 'MaskEditOkpo'
      end
      object MaskEditFullName: TcxMaskEdit
        Left = 145
        Top = 83
        Width = 472
        Height = 24
        ParentFont = False
        Properties.ReadOnly = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 0
        Text = 'MaskEditFullName'
      end
      object LabelFullName: TcxLabel
        Left = 10
        Top = 83
        Width = 135
        Height = 17
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 2
      end
      object LabelCommonTel: TcxLabel
        Left = 40
        Top = 188
        Width = 103
        Height = 17
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 9
      end
      object MaskEditCommonTel: TcxMaskEdit
        Left = 145
        Top = 186
        Width = 209
        Height = 24
        ParentFont = False
        Properties.ReadOnly = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 4
        Text = 'MaskEditCommonTel'
      end
      object MaskEditTown: TcxMaskEdit
        Left = 145
        Top = 134
        Width = 472
        Height = 24
        ParentFont = False
        Properties.ReadOnly = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 6
        Text = 'MaskEditTown'
      end
      object MaskEditAddress: TcxMaskEdit
        Left = 145
        Top = 160
        Width = 472
        Height = 24
        ParentFont = False
        Properties.ReadOnly = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 5
        Text = 'MaskEditAddress'
      end
      object LabelAddress: TcxLabel
        Left = 42
        Top = 162
        Width = 103
        Height = 17
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 10
      end
    end
    object PagePosadoviOsobu: TTabSheet
      Caption = 'PagePosadoviOsobu'
      ImageIndex = 2
      object Panel8: TPanel
        Left = 0
        Top = 185
        Width = 803
        Height = 61
        Align = alTop
        TabOrder = 20
      end
      object Panel4: TPanel
        Left = 0
        Top = 97
        Width = 803
        Height = 88
        Align = alTop
        TabOrder = 19
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 803
        Height = 97
        Align = alTop
        TabOrder = 18
      end
      object LabelDirector: TcxLabel
        Left = 288
        Top = 32
        Width = 105
        Height = 17
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 0
      end
      object LabelDirectorTin: TcxLabel
        Left = 32
        Top = 32
        Width = 113
        Height = 17
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 1
      end
      object MaskEditDirectorTel: TcxMaskEdit
        Left = 148
        Top = 56
        Width = 129
        Height = 21
        ParentFont = False
        Properties.ReadOnly = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 2
        Text = 'MaskEditDirectorTel'
      end
      object LabelDirectorTel: TcxLabel
        Left = 32
        Top = 56
        Width = 113
        Height = 17
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 3
      end
      object LabelDirectorPost: TcxLabel
        Left = 288
        Top = 56
        Width = 105
        Height = 17
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 4
      end
      object MaskEditNameManeg: TcxMaskEdit
        Left = 392
        Top = 56
        Width = 313
        Height = 21
        ParentFont = False
        Properties.ReadOnly = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 5
        Text = 'MaskEditNameManeg'
      end
      object ButtonEditDirectorTin: TcxButtonEdit
        Left = 148
        Top = 32
        Width = 129
        Height = 21
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = ButtonEditDirectorTinPropertiesButtonClick
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 6
        Text = 'ButtonEditDirectorTin'
      end
      object EditDirector: TcxLabel
        Left = 392
        Top = 32
        Width = 313
        Height = 21
        AutoSize = False
        ParentColor = False
        ParentFont = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 7
      end
      object LabelGlBuhgTin: TcxLabel
        Left = 32
        Top = 123
        Width = 113
        Height = 17
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 8
      end
      object ButtonEditGlBuhgTin: TcxButtonEdit
        Left = 148
        Top = 123
        Width = 129
        Height = 21
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = ButtonEditGlBuhgTinPropertiesButtonClick
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 9
        Text = 'ButtonEditGlBuhgTin_'
      end
      object MaskEditGlBuhgTel: TcxMaskEdit
        Left = 148
        Top = 146
        Width = 129
        Height = 21
        ParentFont = False
        Properties.ReadOnly = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 10
        Text = 'MaskEditGlBuhgTel'
      end
      object LabelGlBuhgTel: TcxLabel
        Left = 32
        Top = 146
        Width = 113
        Height = 17
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 11
        Caption = 'LabelGlBuhgTel'
      end
      object LabelglBuhg: TcxLabel
        Left = 288
        Top = 123
        Width = 105
        Height = 17
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 12
      end
      object LabelGlavBuhgPost: TcxLabel
        Left = 288
        Top = 146
        Width = 105
        Height = 17
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 13
      end
      object EditGlBuhg: TcxLabel
        Left = 394
        Top = 123
        Width = 311
        Height = 21
        AutoSize = False
        ParentColor = False
        ParentFont = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 14
      end
      object MaskEditGlavBuhgPost: TcxMaskEdit
        Left = 394
        Top = 146
        Width = 311
        Height = 21
        ParentFont = False
        Properties.ReadOnly = False
        Style.BorderStyle = ebsUltraFlat
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 15
        Text = 'MaskEditNameManeg'
      end
      object LabelNachOk: TcxLabel
        Left = 40
        Top = 216
        Width = 105
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 16
      end
      object ButtonEditNachOk: TcxButtonEdit
        Left = 148
        Top = 216
        Width = 425
        Height = 21
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = ButtonEditNachOkPropertiesButtonClick
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 17
        Text = 'ButtonEditNachOk'
      end
      object Label_Director: TcxLabel
        Left = 32
        Top = 8
        Width = 67
        Height = 17
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 21
        Caption = #1044#1080#1088#1077#1082#1090#1086#1088
      end
      object Label_Buh: TcxLabel
        Left = 32
        Top = 104
        Width = 257
        Height = 17
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 22
      end
      object Label_Nach_OK: TcxLabel
        Left = 32
        Top = 192
        Width = 289
        Height = 17
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 23
      end
    end
    object PageFond: TTabSheet
      Caption = 'PageFond'
      ImageIndex = 7
      object Panel9: TPanel
        Left = 0
        Top = 193
        Width = 803
        Height = 70
        Align = alTop
        TabOrder = 29
      end
      object Panel2: TPanel
        Left = 0
        Top = 100
        Width = 803
        Height = 93
        Align = alTop
        TabOrder = 25
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 803
        Height = 100
        Align = alTop
        TabOrder = 24
        object MaskEditNameFondNetrud: TcxMaskEdit
          Left = 180
          Top = 28
          Width = 421
          Height = 21
          ParentFont = False
          Properties.ReadOnly = False
          Style.Color = clMoneyGreen
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 0
          Text = 'MaskEditNameFondNetrud'
        end
      end
      object MaskEditRegKodStraxNetrud: TcxMaskEdit
        Left = 180
        Top = 50
        Width = 157
        Height = 21
        ParentFont = False
        Properties.ReadOnly = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 0
        Text = 'MaskEditRegKodStraxNetrud'
      end
      object LabelDPI: TcxLabel
        Left = 32
        Top = 215
        Width = 145
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 1
      end
      object MaskEditDPI: TcxMaskEdit
        Left = 180
        Top = 215
        Width = 589
        Height = 21
        ParentFont = False
        Properties.MaxLength = 80
        Properties.ReadOnly = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 2
        Text = 'MaskEditDPI'
      end
      object MaskEditKodDPI: TcxMaskEdit
        Left = 180
        Top = 237
        Width = 121
        Height = 21
        ParentFont = False
        Properties.ReadOnly = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 3
        Text = 'MaskEditKodDPI'
      end
      object LabelKodDPI: TcxLabel
        Left = 32
        Top = 238
        Width = 145
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 4
      end
      object MaskEditRahunokNetrud: TcxMaskEdit
        Left = 180
        Top = 72
        Width = 157
        Height = 21
        ParentFont = False
        Properties.ReadOnly = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 5
        Text = 'MaskEditRahunokNetrud'
      end
      object MaskEditBankNetrud: TcxMaskEdit
        Left = 388
        Top = 72
        Width = 173
        Height = 21
        ParentFont = False
        Properties.ReadOnly = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 6
        Text = 'MaskEditBankNetrud'
      end
      object MaskEditRegKodStraxNSluch: TcxMaskEdit
        Left = 180
        Top = 146
        Width = 157
        Height = 21
        ParentFont = False
        Properties.ReadOnly = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 7
        Text = 'MaskEditRegKodStraxNSluch'
      end
      object MaskEditRahunokNSluch: TcxMaskEdit
        Left = 180
        Top = 168
        Width = 157
        Height = 21
        ParentFont = False
        Properties.ReadOnly = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 8
        Text = 'MaskEditRahunokNSluch'
      end
      object LabelRegKodStrax: TcxLabel
        Left = 16
        Top = 50
        Width = 161
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 9
      end
      object LabelNameFondNepacezd: TcxLabel
        Left = 32
        Top = 8
        Width = 417
        Height = 17
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 10
      end
      object LabelName: TcxLabel
        Left = 48
        Top = 28
        Width = 129
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 11
      end
      object LabelNameDirectorFondNepracezd: TcxLabel
        Left = 372
        Top = 50
        Width = 137
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 12
      end
      object LabelRahunokNepracezd: TcxLabel
        Left = 32
        Top = 72
        Width = 145
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 13
      end
      object LabelRegKod: TcxLabel
        Left = 16
        Top = 146
        Width = 161
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 14
      end
      object LabelBankNepracezd: TcxLabel
        Left = 336
        Top = 72
        Width = 49
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 15
      end
      object LabelMFO_Nepracezd: TcxLabel
        Left = 560
        Top = 73
        Width = 49
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 16
        Caption = #1052#1060#1054
      end
      object LabelNameFondNSluch: TcxLabel
        Left = 32
        Top = 103
        Width = 481
        Height = 17
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 17
      end
      object MaskEditMFONetrud: TcxMaskEdit
        Left = 612
        Top = 72
        Width = 157
        Height = 21
        ParentFont = False
        Properties.ReadOnly = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 18
        Text = 'MaskEditMFONetrud'
      end
      object LabelRahunokNSluch: TcxLabel
        Left = 32
        Top = 168
        Width = 145
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 19
      end
      object LabelBankNSluch: TcxLabel
        Left = 336
        Top = 168
        Width = 49
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 20
      end
      object LabelMFO_NSluch: TcxLabel
        Left = 560
        Top = 169
        Width = 49
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 21
        Caption = #1052#1060#1054
      end
      object MaskEditMFONSluch: TcxMaskEdit
        Left = 612
        Top = 168
        Width = 157
        Height = 21
        ParentFont = False
        Properties.ReadOnly = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 22
        Text = 'MaskEditMFONSluch'
      end
      object MaskEditBankNSluch: TcxMaskEdit
        Left = 388
        Top = 168
        Width = 173
        Height = 21
        ParentFont = False
        Properties.ReadOnly = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 23
        Text = 'MaskEditBankNSluch'
      end
      object LabelNameDPI: TcxLabel
        Left = 32
        Top = 199
        Width = 393
        Height = 17
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 26
      end
      object LabelMaska: TcxLabel
        Left = 384
        Top = 238
        Width = 145
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 27
      end
      object MaskEditMaska: TcxMaskEdit
        Left = 548
        Top = 237
        Width = 121
        Height = 21
        ParentFont = False
        Properties.ReadOnly = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 28
        Text = 'MaskEditMaska'
      end
      object LabelNameFond: TcxLabel
        Left = 48
        Top = 124
        Width = 129
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 30
      end
      object MaskEditNameFondNSluch: TcxMaskEdit
        Left = 180
        Top = 124
        Width = 421
        Height = 21
        ParentFont = False
        Properties.ReadOnly = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 31
        Text = 'MaskEditNameFondNSluch'
      end
      object MaskEditFIODirector: TcxMaskEdit
        Left = 508
        Top = 50
        Width = 181
        Height = 21
        ParentFont = False
        Properties.ReadOnly = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 32
        Text = 'MaskEditFIODirector'
      end
    end
    object Other: TTabSheet
      Caption = #1053#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103
      ImageIndex = 6
      object Panel7: TPanel
        Left = 0
        Top = 160
        Width = 803
        Height = 105
        TabOrder = 30
        object Label3: TLabel
          Left = 40
          Top = 19
          Width = 86
          Height = 13
          Caption = #1042#1080#1076#1080' '#1086#1087#1077#1088#1072#1094#1110#1081
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 41
        Width = 803
        Height = 136
        Align = alTop
        TabOrder = 29
        object Label4: TLabel
          Left = 32
          Top = 12
          Width = 60
          Height = 13
          Caption = #1057#1090#1080#1087#1077#1085#1076#1110#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 803
        Height = 41
        Align = alTop
        TabOrder = 28
      end
      object LabelCurrentKod: TcxLabel
        Left = 24
        Top = 8
        Width = 89
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 0
      end
      object SpinEditYear: TcxSpinEdit
        Left = 232
        Top = 8
        Width = 57
        Height = 21
        ParentFont = False
        Properties.MaxValue = 2050.000000000000000000
        Properties.MinValue = 1995.000000000000000000
        Properties.ReadOnly = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 1
        Value = 1995
      end
      object ComboBoxMonth: TcxComboBox
        Left = 112
        Top = 8
        Width = 121
        Height = 21
        ParentFont = False
        Properties.ReadOnly = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 2
        Text = 'ComboBoxMonth'
      end
      object LabelDateBeg: TcxLabel
        Left = 320
        Top = 8
        Width = 97
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 3
      end
      object DateBeg: TcxLabel
        Left = 416
        Top = 8
        Width = 129
        Height = 21
        AutoSize = False
        ParentColor = False
        ParentFont = False
        Style.BorderStyle = ebsNone
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 4
      end
      object LabelCurrent: TcxLabel
        Left = 40
        Top = 200
        Width = 135
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 5
      end
      object LabelDedconst: TcxLabel
        Left = 40
        Top = 224
        Width = 135
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 6
      end
      object LabelDopnach: TcxLabel
        Left = 424
        Top = 200
        Width = 129
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 7
      end
      object LabelNonspisok: TcxLabel
        Left = 424
        Top = 224
        Width = 129
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 8
      end
      object ButtonEditCurrent: TcxButtonEdit
        Left = 176
        Top = 200
        Width = 233
        Height = 21
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = ButtonEditCurrentPropertiesButtonClick
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 9
        Text = 'ButtonEditCurrent'
      end
      object ButtonEditDedconst: TcxButtonEdit
        Left = 176
        Top = 224
        Width = 233
        Height = 21
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = ButtonEditDedconstPropertiesButtonClick
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 10
        Text = 'ButtonEditDedconst'
      end
      object ButtonEditDopnach: TcxButtonEdit
        Left = 552
        Top = 200
        Width = 225
        Height = 21
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = ButtonEditDopnachPropertiesButtonClick
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 11
        Text = 'ButtonEditDopnach'
      end
      object ButtonEditNonspisok: TcxButtonEdit
        Left = 552
        Top = 224
        Width = 225
        Height = 21
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = ButtonEditNonspisokPropertiesButtonClick
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 12
        Text = 'ButtonEditNonspisok'
      end
      object LabelForwHol: TcxLabel
        Left = 584
        Top = 8
        Width = 137
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 13
      end
      object MaskEditForwHol: TcxMaskEdit
        Left = 720
        Top = 8
        Width = 73
        Height = 21
        ParentFont = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 14
        Text = 'MaskEditForwHol'
      end
      object LabelKodSetup: TcxLabel
        Left = 0
        Top = 66
        Width = 177
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 15
      end
      object ComboBoxGrantMonth: TcxComboBox
        Left = 176
        Top = 66
        Width = 153
        Height = 21
        ParentFont = False
        Properties.ReadOnly = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 16
        Text = 'ComboBoxGrantMonth'
      end
      object LabelIndexKodSetup: TcxLabel
        Left = 448
        Top = 64
        Width = 105
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 17
      end
      object ComboBoxIndexMonth: TcxComboBox
        Left = 552
        Top = 64
        Width = 153
        Height = 21
        ParentFont = False
        Properties.ReadOnly = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 18
      end
      object SpinEditGrantYear: TcxSpinEdit
        Left = 328
        Top = 66
        Width = 57
        Height = 21
        ParentFont = False
        Properties.MaxValue = 2050.000000000000000000
        Properties.MinValue = 1995.000000000000000000
        Properties.ReadOnly = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 19
        Value = 1995
      end
      object SpinEditIndexYear: TcxSpinEdit
        Left = 704
        Top = 64
        Width = 57
        Height = 21
        ParentFont = False
        Properties.MaxValue = 2050.000000000000000000
        Properties.MinValue = 1995.000000000000000000
        Properties.ReadOnly = True
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 20
        Value = 1995
      end
      object LabelDefaultSmeta: TcxLabel
        Left = 0
        Top = 120
        Width = 175
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 21
      end
      object ButtonEditDefaultSmeta: TcxButtonEdit
        Left = 176
        Top = 117
        Width = 65
        Height = 21
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = ButtonEditDefaultSmetaPropertiesButtonClick
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 22
        Text = 'ButtonEditDefaultSmeta'
        OnExit = ButtonEditDefaultSmeta_Exit
      end
      object EditDefaultSmeta: TcxLabel
        Left = 241
        Top = 117
        Width = 456
        Height = 21
        AutoSize = False
        ParentColor = False
        ParentFont = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 23
      end
      object LabelPropFaculty: TcxLabel
        Left = 0
        Top = 88
        Width = 175
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 24
      end
      object ButtonEditPropFaculty: TcxButtonEdit
        Left = 176
        Top = 91
        Width = 353
        Height = 21
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = ButtonEditPropFacultyPropertiesButtonClick
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 25
        Text = 'ButtonEditPropFaculty'
      end
      object LabelBudgetGrant: TcxLabel
        Left = 0
        Top = 144
        Width = 175
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 26
      end
      object ButtonEditBudgetGrant: TcxButtonEdit
        Left = 176
        Top = 144
        Width = 521
        Height = 21
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = ButtonEditBudgetGrantPropertiesButtonClick
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 27
        Text = 'ButtonEditBudgetGrant'
      end
    end
    object System: TTabSheet
      Caption = 'System'
      ImageIndex = 7
      object LabelZSystem: TcxLabel
        Left = 8
        Top = 0
        Width = 105
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 0
      end
      object MaskEditZSystem: TcxMaskEdit
        Left = 128
        Top = 0
        Width = 217
        Height = 21
        ParentFont = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 1
        Text = 'MaskEditZSystem'
      end
      object LabelGrSystem: TcxLabel
        Left = 368
        Top = 0
        Width = 105
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 2
      end
      object MaskEditGrSystem: TcxMaskEdit
        Left = 480
        Top = 0
        Width = 217
        Height = 21
        ParentFont = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 3
        Text = 'MaskEditGrSystem'
      end
      object CheckBoxRmoving: TcxCheckBox
        Left = 8
        Top = 45
        Width = 200
        Height = 21
        Properties.Alignment = taLeftJustify
        Properties.DisplayUnchecked = 'False'
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Properties.Caption = 'CheckBoxRmoving'
        TabOrder = 4
      end
      object CheckBoxVirtual: TcxCheckBox
        Left = 248
        Top = 45
        Width = 200
        Height = 21
        Properties.Alignment = taLeftJustify
        Properties.DisplayUnchecked = 'False'
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        TabOrder = 5
      end
      object CheckBoxIsFss: TcxCheckBox
        Left = 488
        Top = 45
        Width = 200
        Height = 21
        Properties.Alignment = taLeftJustify
        Properties.DisplayUnchecked = 'False'
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        TabOrder = 6
      end
      object LabelOrderLevel: TcxLabel
        Left = 24
        Top = 24
        Width = 97
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 7
      end
      object ButtonEditOrderLevel: TcxButtonEdit
        Left = 128
        Top = 24
        Width = 569
        Height = 21
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = ButtonEditOrderLevelPropertiesButtonClick
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 8
        Text = 'ButtonEditOrderLevel'
      end
    end
  end
  object DataSource: TDataSource
    DataSet = DataSet
    Left = 776
    Top = 56
  end
  object Database: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 776
    Top = 120
  end
  object DataSet: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    Left = 776
    Top = 184
    poSQLINT64ToBCD = True
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 776
    Top = 216
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 776
    Top = 152
  end
  object StoredProc: TpFIBStoredProc
    Database = Database
    Transaction = WriteTransaction
    Left = 776
    Top = 88
  end
  object ActionList: TActionList
    Left = 772
    Top = 24
    object ActionYes: TAction
      Caption = 'ActionYes'
      ShortCut = 121
      OnExecute = ActionYesExecute
    end
    object ActionCancel: TAction
      Caption = 'ActionCancel'
      ShortCut = 27
      OnExecute = ActionCancelExecute
    end
  end
end
