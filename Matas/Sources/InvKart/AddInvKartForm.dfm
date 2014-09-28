object fmInvKartAdd: TfmInvKartAdd
  Left = 323
  Top = 300
  HorzScrollBar.Color = 16776176
  HorzScrollBar.ParentColor = False
  VertScrollBar.Color = 16776176
  VertScrollBar.ParentColor = False
  Anchors = []
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'fmInvKartAdd'
  ClientHeight = 439
  ClientWidth = 695
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PageControlAddKart: TPageControl
    Left = 0
    Top = 0
    Width = 695
    Height = 397
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      object cxLabelSelSch: TLabel
        Left = 3
        Top = 44
        Width = 84
        Height = 13
        Caption = 'cxLabelSelSch'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxLabelGrpNum: TLabel
        Left = 163
        Top = 43
        Width = 89
        Height = 13
        Caption = 'cxLabelGrpNum'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxLabelTipKrt: TLabel
        Left = 3
        Top = 74
        Width = 78
        Height = 13
        Caption = 'cxLabelTipKrt'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxLabelKartNum: TLabel
        Left = 240
        Top = 264
        Width = 92
        Height = 13
        Caption = 'cxLabelKartNum'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxLabelBegPrice: TLabel
        Left = 2
        Top = 150
        Width = 95
        Height = 13
        Caption = 'cxLabelBegPrice'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxLabelOstPrice: TLabel
        Left = 2
        Top = 178
        Width = 92
        Height = 13
        Caption = 'cxLabelOstPrice'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxLabelOpr: TLabel
        Left = 468
        Top = 121
        Width = 64
        Height = 13
        Caption = 'cxLabelOpr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxLabelDateExpl: TLabel
        Left = 468
        Top = 150
        Width = 95
        Height = 13
        Caption = 'cxLabelDateExpl'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxLabelSelNomn: TLabel
        Left = 3
        Top = 10
        Width = 94
        Height = 13
        Caption = 'cxLabelSelNomn'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxLabelInvNum: TLabel
        Left = 304
        Top = 43
        Width = 87
        Height = 13
        Caption = 'cxLabelInvNum'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxLabelFullInvNum: TLabel
        Left = 427
        Top = 43
        Width = 107
        Height = 13
        Caption = 'cxLabelFullInvNum'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxLabelSelMOL: TLabel
        Left = 180
        Top = 74
        Width = 88
        Height = 13
        Caption = 'cxLabelSelMOL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxLabelBegIznos: TLabel
        Left = 2
        Top = 203
        Width = 96
        Height = 13
        Caption = 'cxLabelBegIznos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxLabelOstIznos: TLabel
        Left = 2
        Top = 229
        Width = 93
        Height = 13
        Caption = 'cxLabelOstIznos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxLabelOst: TLabel
        Left = 468
        Top = 177
        Width = 63
        Height = 13
        Caption = 'cxLabelOst'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxLabelDateUpdate: TLabel
        Left = 468
        Top = 202
        Width = 112
        Height = 13
        Caption = 'cxLabelDateUpdate'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxLabelDateOut: TLabel
        Left = 468
        Top = 227
        Width = 91
        Height = 13
        Caption = 'cxLabelDateOut'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 2
        Top = 125
        Width = 81
        Height = 13
        Caption = #1041#1072#1083'. '#1074#1072#1088#1090'i'#1089#1090#1100
      end
      object lbl6: TLabel
        Left = 240
        Top = 229
        Width = 59
        Height = 13
        Caption = #1057#1091#1084'. '#1079#1085#1086#1089
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl5: TLabel
        Left = 240
        Top = 203
        Width = 71
        Height = 13
        Caption = #1055#1086#1095#1072#1090'. '#1079#1085#1086#1089
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl4: TLabel
        Left = 240
        Top = 178
        Width = 70
        Height = 13
        Caption = #1047#1072#1083#1080#1096'. '#1094#1110#1085#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl3: TLabel
        Left = 240
        Top = 150
        Width = 67
        Height = 13
        Caption = #1055#1086#1095#1072#1090'. '#1094#1110#1085#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxButtonEditSelNomn: TcxButtonEdit
        Left = 83
        Top = 7
        Width = 590
        Height = 23
        BeepOnEnter = False
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = cxButtonEditSelNomnPropertiesButtonClick
        Style.Color = clInfoBk
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -12
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = []
        TabOrder = 0
        OnKeyPress = cxButtonEditSelNomnKeyPress
      end
      object cxButtonEditSelMOL: TcxButtonEdit
        Left = 235
        Top = 71
        Width = 438
        Height = 23
        BeepOnEnter = False
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = cxButtonEditSelMOLPropertiesButtonClick
        Style.Color = clInfoBk
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -12
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = []
        TabOrder = 3
      end
      object cxButtonEditSelSch: TcxButtonEdit
        Left = 75
        Top = 39
        Width = 89
        Height = 23
        BeepOnEnter = False
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = cxButtonEditSelSchPropertiesButtonClick
        Style.Color = clInfoBk
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -12
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = []
        TabOrder = 1
      end
      object cxComboBoxTipKrt: TcxComboBox
        Left = 83
        Top = 71
        Width = 65
        Height = 23
        BeepOnEnter = False
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          ''
          '1'
          '2'
          '3'
          '3'#1046
          '3'#1053
          '4')
        Style.Color = clInfoBk
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -12
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = []
        TabOrder = 2
      end
      object TcxLabel
        Left = 252
        Top = 186
        Width = 0
        Height = 4
        ParentColor = False
        ParentFont = False
        Style.Color = clBtnFace
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 14
      end
      object cxDateEditOst: TcxDateEdit
        Left = 573
        Top = 169
        Width = 105
        Height = 23
        BeepOnEnter = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -12
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = []
        TabOrder = 6
      end
      object cxDateEditDateOut: TcxTextEdit
        Left = 573
        Top = 223
        Width = 105
        Height = 23
        BeepOnEnter = False
        ParentFont = False
        Properties.ReadOnly = True
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = []
        TabOrder = 8
      end
      object cxDateEditDateUpdate: TcxTextEdit
        Left = 573
        Top = 196
        Width = 105
        Height = 23
        BeepOnEnter = False
        ParentFont = False
        Properties.ReadOnly = True
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = []
        TabOrder = 7
      end
      object cxTextEditFullInvNum: TcxTextEdit
        Left = 543
        Top = 40
        Width = 130
        Height = 23
        BeepOnEnter = False
        Enabled = False
        ParentFont = False
        Properties.MaxLength = 4
        Style.Color = clInfoBk
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -12
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = []
        TabOrder = 15
        OnKeyPress = cxTextEditInvNumKeyPress
      end
      object cxDateEditOpr: TcxDateEdit
        Left = 573
        Top = 115
        Width = 105
        Height = 23
        BeepOnEnter = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -12
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = []
        TabOrder = 4
      end
      object cxDateEditDateExpl: TcxDateEdit
        Left = 573
        Top = 143
        Width = 105
        Height = 23
        BeepOnEnter = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -12
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = []
        TabOrder = 5
      end
      object cxTextEditBegPrice2: TcxCurrencyEdit
        Left = 4
        Top = 250
        Width = 17
        Height = 21
        Properties.AutoSelect = False
        Properties.DisplayFormat = ',0.00;-,0.00'
        Properties.NullString = '0,00'
        Style.Color = clInfoBk
        TabOrder = 16
        Visible = False
        OnExit = cxTextEditBegPrice2Exit
      end
      object CheckBoxOst: TCheckBox
        Left = 1
        Top = 318
        Width = 456
        Height = 17
        TabOrder = 10
        OnClick = CheckBoxOstClick
      end
      object cxButtonEditSaveOst: TcxButtonEdit
        Left = 1
        Top = 338
        Width = 673
        Height = 21
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = cxButtonEditSaveOstPropertiesButtonClick
        Style.Color = clInfoBk
        TabOrder = 11
        OnKeyPress = cxButtonEditSaveOstKeyPress
      end
      object cxCheckBox1: TRadioButton
        Left = 240
        Top = 101
        Width = 217
        Height = 17
        TabOrder = 13
        OnClick = cxCheckBox1Click
      end
      object cxCheckBox2: TRadioButton
        Left = 2
        Top = 99
        Width = 217
        Height = 17
        TabOrder = 12
        OnClick = cxCheckBox2Click
      end
      object cxButtonEditShowBal: TcxButtonEdit
        Left = 109
        Top = 122
        Width = 105
        Height = 21
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxButtonEditShowBalPropertiesButtonClick
        TabOrder = 17
        OnExit = cxButtonEditShowBalExit
        OnKeyPress = cxButtonEditShowBalKeyPress
      end
      object Combo_box_IS_INV_OBJ: TcxComboBox
        Left = 345
        Top = 287
        Width = 213
        Height = 21
        Properties.Items.Strings = (
          #1085#1077' '#1080#1085#1074#1077#1085#1090#1072#1088#1085#1099#1081' '#1086#1073#1098#1077#1082#1090
          #1080#1085#1074#1077#1085#1090#1072#1088#1085#1099#1081' '#1086#1073#1098#1077#1082#1090)
        TabOrder = 9
      end
      object cxTextEditOstIznosNal: TcxTextEdit
        Left = 344
        Top = 224
        Width = 105
        Height = 23
        BeepOnEnter = False
        ParentFont = False
        Style.Color = clInfoBk
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = []
        TabOrder = 18
        Text = '0,00'
        OnExit = cxTextEditOstIznosNalExit
        OnKeyPress = cxTextEditOstIznosNalKeyPress
      end
      object cxTextEditBegIznosNal: TcxTextEdit
        Left = 345
        Top = 198
        Width = 105
        Height = 23
        BeepOnEnter = False
        ParentFont = False
        Style.Color = clInfoBk
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = []
        TabOrder = 19
        Text = '0,00'
        OnExit = cxTextEditBegIznosNalExit
        OnKeyPress = cxTextEditBegIznosNalKeyPress
      end
      object cxTextEditOstPriceNal: TcxTextEdit
        Left = 346
        Top = 173
        Width = 105
        Height = 23
        BeepOnEnter = False
        ParentFont = False
        Style.Color = clInfoBk
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = []
        TabOrder = 20
        Text = '0,00'
        OnExit = cxTextEditOstPriceNalExit
        OnKeyPress = cxTextEditOstPriceNalKeyPress
      end
      object cxTextEditBegPriceNal: TcxTextEdit
        Left = 345
        Top = 145
        Width = 105
        Height = 23
        BeepOnEnter = False
        ParentFont = False
        Style.Color = clInfoBk
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = []
        TabOrder = 21
        Text = '0,00'
        OnExit = cxTextEditBegPriceNalExit
        OnKeyPress = cxTextEditBegPriceNalKeyPress
      end
      object cxLabel1: TcxLabel
        Left = 613
        Top = 314
        Width = 60
        Height = 17
        TabOrder = 22
        Visible = False
      end
      object cxTextEditKartNum: TcxCurrencyEdit
        Left = 344
        Top = 264
        Width = 217
        Height = 21
        Properties.DisplayFormat = ',0;-,0'
        Style.Color = clInfoBk
        TabOrder = 23
        OnKeyPress = cxTextEditKartNumKeyPress
      end
      object cxTextEditGrpNum: TcxCurrencyEdit
        Left = 256
        Top = 40
        Width = 41
        Height = 21
        Properties.DisplayFormat = ',0;-,0'
        Style.Color = clInfoBk
        TabOrder = 24
        OnEnter = cxTextEditGrpNumEnter
        OnExit = cxTextEditGrpNumExit
        OnKeyPress = cxTextEditGrpNumKeyPress
      end
      object cxTextEditInvNum: TcxCurrencyEdit
        Left = 384
        Top = 40
        Width = 41
        Height = 21
        Properties.DisplayFormat = ',0;-,0'
        Style.Color = clInfoBk
        TabOrder = 25
        OnEnter = cxTextEditInvNumEnter
        OnExit = cxTextEditInvNumExit
        OnKeyPress = cxTextEditInvNumKeyPress
      end
      object cxTextEditBegPrice: TcxCurrencyEdit
        Left = 110
        Top = 149
        Width = 104
        Height = 21
        Properties.DisplayFormat = ',0.00;-,0.00'
        Style.Color = clInfoBk
        TabOrder = 26
        OnExit = cxTextEditBegPriceExit
        OnKeyPress = cxTextEditBegPriceKeyPress
      end
      object cxTextEditOstPrice: TcxCurrencyEdit
        Left = 110
        Top = 176
        Width = 104
        Height = 21
        Properties.DisplayFormat = ',0.00;-,0.00'
        Style.Color = clInfoBk
        TabOrder = 27
        OnExit = cxTextEditOstPriceExit
        OnKeyPress = cxTextEditOstPriceKeyPress
      end
      object cxTextEditBegIznos: TcxCurrencyEdit
        Left = 110
        Top = 200
        Width = 104
        Height = 21
        Properties.DisplayFormat = ',0.00;-,0.00'
        Style.Color = clInfoBk
        TabOrder = 28
        OnExit = cxTextEditBegIznosExit
        OnKeyPress = cxTextEditBegIznosKeyPress
      end
      object cxTextEditOstIznos: TcxCurrencyEdit
        Left = 110
        Top = 224
        Width = 104
        Height = 21
        Properties.DisplayFormat = ',0.00;-,0.00'
        Style.Color = clInfoBk
        TabOrder = 29
        OnExit = cxTextEditOstIznosExit
        OnKeyPress = cxTextEditOstIznosKeyPress
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      OnShow = TabSheet2Show
      object cxGroupBox1: TcxGroupBox
        Left = 0
        Top = 0
        Width = 687
        Height = 161
        Align = alTop
        Alignment = alTopLeft
        Color = clBtnFace
        ParentColor = False
        TabOrder = 0
        object LabelBuh_id_db_sch: TLabel
          Left = 4
          Top = 89
          Width = 118
          Height = 13
          Caption = 'LabelBuh_id_db_sch'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelBuh_id_kr_sch: TLabel
          Left = 3
          Top = 117
          Width = 115
          Height = 13
          Caption = 'LabelBuh_id_kr_sch'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelID_Am_grp: TLabel
          Left = 4
          Top = 10
          Width = 93
          Height = 13
          Caption = 'LabelID_Am_grp'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelYear: TLabel
          Left = 4
          Top = 36
          Width = 57
          Height = 13
          Caption = 'LabelYear'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelMonth: TLabel
          Left = 4
          Top = 63
          Width = 66
          Height = 13
          Caption = 'LabelMonth'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelSelMethod: TLabel
          Left = 323
          Top = 11
          Width = 91
          Height = 13
          Caption = 'LabelSelMethod'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelMinPrice: TLabel
          Left = 323
          Top = 38
          Width = 80
          Height = 13
          Caption = 'LabelMinPrice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelPercent: TLabel
          Left = 323
          Top = 64
          Width = 75
          Height = 13
          Caption = 'LabelPercent'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelPer_Nachisl: TLabel
          Left = 323
          Top = 89
          Width = 99
          Height = 13
          Caption = 'LabelPer_Nachisl'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object cxButtonEditBuh_id_db_sch: TcxButtonEdit
          Left = 144
          Top = 85
          Width = 171
          Height = 23
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = cxButtonEditBuh_id_db_schPropertiesButtonClick
          Style.Color = clInfoBk
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -12
          Style.Font.Name = 'Microsoft Sans Serif'
          Style.Font.Style = []
          TabOrder = 3
          OnExit = cxButtonEditBuh_id_db_schExit
          OnKeyPress = cxButtonEditBuh_id_db_schKeyPress
        end
        object cxButtonEditBuh_id_kr_sch: TcxButtonEdit
          Left = 144
          Top = 111
          Width = 171
          Height = 23
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = cxButtonEditBuh_id_kr_schPropertiesButtonClick
          Style.Color = clInfoBk
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -12
          Style.Font.Name = 'Microsoft Sans Serif'
          Style.Font.Style = []
          TabOrder = 4
          OnExit = cxButtonEditBuh_id_kr_schExit
          OnKeyPress = cxButtonEditBuh_id_kr_schKeyPress
        end
        object cxCurrencyEditPersent: TcxCurrencyEdit
          Left = 472
          Top = 58
          Width = 171
          Height = 23
          ParentFont = False
          Properties.DisplayFormat = ',0.00;-,0.00'
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -12
          Style.Font.Name = 'Microsoft Sans Serif'
          Style.Font.Style = []
          TabOrder = 7
          OnExit = cxCurrencyEditPersentExit
        end
        object cxButtonEditID_Am_grp: TcxButtonEdit
          Left = 144
          Top = 8
          Width = 171
          Height = 23
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = False
          Properties.OnButtonClick = cxButtonEditID_Am_grpPropertiesButtonClick
          Style.Color = clInfoBk
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -12
          Style.Font.Name = 'Microsoft Sans Serif'
          Style.Font.Style = []
          TabOrder = 0
          OnKeyPress = cxButtonEditID_Am_grpKeyPress
        end
        object cxTextEditYear: TcxTextEdit
          Left = 144
          Top = 34
          Width = 171
          Height = 23
          ParentFont = False
          Properties.MaxLength = 3
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -12
          Style.Font.Name = 'Microsoft Sans Serif'
          Style.Font.Style = []
          TabOrder = 1
          Text = '0'
        end
        object cxComboBoxMonth: TcxComboBox
          Left = 144
          Top = 60
          Width = 171
          Height = 23
          ParentFont = False
          Properties.ItemHeight = 20
          Properties.Items.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7'
            '8'
            '9'
            '10'
            '11')
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -12
          Style.Font.Name = 'Microsoft Sans Serif'
          Style.Font.Style = []
          TabOrder = 2
        end
        object cxComboBoxPeriodNach: TcxComboBox
          Left = 472
          Top = 83
          Width = 171
          Height = 23
          ParentFont = False
          Properties.Items.Strings = (
            #1065#1086#1084#1110#1089#1103#1095#1085#1086
            #1065#1086#1082#1074#1072#1088#1090#1072#1083#1100#1085#1086
            #1065#1086#1088#1110#1095#1085#1086)
          Properties.ReadOnly = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -12
          Style.Font.Name = 'Microsoft Sans Serif'
          Style.Font.Style = []
          TabOrder = 8
        end
        object cxComboBoxMethod: TcxTextEdit
          Left = 472
          Top = 8
          Width = 171
          Height = 23
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = 'Microsoft Sans Serif'
          Style.Font.Style = []
          TabOrder = 5
        end
        object cxCurrencyEditMinPrice: TcxTextEdit
          Left = 472
          Top = 33
          Width = 171
          Height = 23
          ParentFont = False
          Style.Color = clInfoBk
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = 'Microsoft Sans Serif'
          Style.Font.Style = []
          TabOrder = 6
          Text = '0,00'
          OnExit = cxCurrencyEditMinPriceExit
          OnKeyPress = cxCurrencyEditMinPriceKeyPress
        end
      end
      object cxGroupBox2: TcxGroupBox
        Left = 0
        Top = 161
        Width = 687
        Height = 208
        Align = alClient
        Alignment = alTopLeft
        Color = clBtnFace
        ParentColor = False
        TabOrder = 1
        Visible = False
        object LabelNal_id_kr_sch: TLabel
          Left = 3
          Top = 116
          Width = 115
          Height = 13
          Caption = 'LabelBuh_id_kr_sch'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelNal_id_db_sch: TLabel
          Left = 4
          Top = 90
          Width = 118
          Height = 13
          Caption = 'LabelBuh_id_db_sch'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label_Nal_Am_grp: TLabel
          Left = 4
          Top = 11
          Width = 93
          Height = 13
          Caption = 'LabelID_Am_grp'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label_Nal_Year: TLabel
          Left = 4
          Top = 37
          Width = 57
          Height = 13
          Caption = 'LabelYear'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label_Nal_month: TLabel
          Left = 4
          Top = 63
          Width = 66
          Height = 13
          Caption = 'LabelMonth'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label_Nal_Method: TLabel
          Left = 320
          Top = 12
          Width = 91
          Height = 13
          Caption = 'LabelSelMethod'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label_Nal_Per_Nach: TLabel
          Left = 320
          Top = 90
          Width = 99
          Height = 13
          Caption = 'LabelPer_Nachisl'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label_Nal_Percent: TLabel
          Left = 320
          Top = 65
          Width = 75
          Height = 13
          Caption = 'LabelPercent'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label_Nal_Min_Price: TLabel
          Left = 320
          Top = 39
          Width = 80
          Height = 13
          Caption = 'LabelMinPrice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object cxButtonEditNal_id_db_sch: TcxButtonEdit
          Left = 143
          Top = 86
          Width = 172
          Height = 23
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = cxButtonEditNal_id_db_schPropertiesButtonClick
          Style.Color = clInfoBk
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -12
          Style.Font.Name = 'Microsoft Sans Serif'
          Style.Font.Style = []
          TabOrder = 2
          OnKeyPress = cxButtonEditNal_id_db_schKeyPress
        end
        object cxButtonEditNal_id_kr_sch: TcxButtonEdit
          Left = 143
          Top = 112
          Width = 172
          Height = 23
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = cxButtonEditNal_id_kr_schPropertiesButtonClick
          Style.Color = clInfoBk
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -12
          Style.Font.Name = 'Microsoft Sans Serif'
          Style.Font.Style = []
          TabOrder = 3
          OnKeyPress = cxButtonEditNal_id_kr_schKeyPress
        end
        object cxButtonEdit_Nal_am_grp: TcxButtonEdit
          Left = 143
          Top = 8
          Width = 172
          Height = 23
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = False
          Properties.OnButtonClick = cxButtonEdit_Nal_am_grpPropertiesButtonClick
          Style.Color = clInfoBk
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -12
          Style.Font.Name = 'Microsoft Sans Serif'
          Style.Font.Style = []
          TabOrder = 0
          OnKeyPress = cxButtonEdit_Nal_am_grpKeyPress
        end
        object cxTextEdit_Nal_Year: TcxTextEdit
          Left = 143
          Top = 34
          Width = 172
          Height = 23
          ParentFont = False
          Properties.MaxLength = 3
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -12
          Style.Font.Name = 'Microsoft Sans Serif'
          Style.Font.Style = []
          TabOrder = 4
          Text = '0'
        end
        object cxComboBox_Nal_month: TcxComboBox
          Left = 143
          Top = 60
          Width = 172
          Height = 23
          ParentFont = False
          Properties.ItemHeight = 20
          Properties.Items.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7'
            '8'
            '9'
            '10'
            '11')
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -12
          Style.Font.Name = 'Microsoft Sans Serif'
          Style.Font.Style = []
          TabOrder = 5
        end
        object cxCurrencyEdit_Nal_Percent: TcxCurrencyEdit
          Left = 470
          Top = 58
          Width = 172
          Height = 23
          ParentFont = False
          Properties.DisplayFormat = ',0.00;-,0.00'
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -12
          Style.Font.Name = 'Microsoft Sans Serif'
          Style.Font.Style = []
          TabOrder = 6
          OnExit = cxCurrencyEdit_Nal_PercentExit
        end
        object cxComboBox_Nal_Per_Nach: TcxComboBox
          Left = 470
          Top = 83
          Width = 172
          Height = 23
          ParentFont = False
          Properties.Items.Strings = (
            #1065#1086#1084#1110#1089#1103#1095#1085#1086
            #1065#1086#1082#1074#1072#1088#1090#1072#1083#1100#1085#1086
            #1065#1086#1088#1110#1095#1085#1086)
          Properties.ReadOnly = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -12
          Style.Font.Name = 'Microsoft Sans Serif'
          Style.Font.Style = []
          TabOrder = 7
        end
        object cxComboBox_Nal_Method: TcxTextEdit
          Left = 470
          Top = 8
          Width = 172
          Height = 23
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = 'Microsoft Sans Serif'
          Style.Font.Style = []
          TabOrder = 8
        end
        object cxCurrencyEdit_Nal_Min_Price: TcxTextEdit
          Left = 470
          Top = 33
          Width = 172
          Height = 23
          ParentFont = False
          Style.Color = clInfoBk
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = 'Microsoft Sans Serif'
          Style.Font.Style = []
          TabOrder = 1
          Text = '0,00'
          OnExit = cxCurrencyEdit_Nal_Min_PriceExit
          OnKeyPress = cxCurrencyEdit_Nal_Min_PriceKeyPress
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 2
      object cxLabelZavNum: TLabel
        Left = 1
        Top = 7
        Width = 92
        Height = 13
        Caption = 'cxLabelZavNum'
      end
      object cxLabelPasNum: TLabel
        Left = 1
        Top = 35
        Width = 91
        Height = 13
        Caption = 'cxLabelPasNum'
      end
      object cxLabelDocReg: TLabel
        Left = 1
        Top = 62
        Width = 91
        Height = 13
        Caption = 'cxLabelDocReg'
      end
      object cxLabelMark: TLabel
        Left = 1
        Top = 88
        Width = 73
        Height = 13
        Caption = 'cxLabelMark'
      end
      object cxLabelModel: TLabel
        Left = 1
        Top = 113
        Width = 79
        Height = 13
        Caption = 'cxLabelModel'
      end
      object LabelNote: TLabel
        Left = 1
        Top = 139
        Width = 59
        Height = 13
        Caption = 'LabelNote'
      end
      object cxLabelDateCreate: TLabel
        Left = 340
        Top = 8
        Width = 109
        Height = 13
        Caption = 'cxLabelDateCreate'
      end
      object cxLabelDateReg: TLabel
        Left = 340
        Top = 35
        Width = 95
        Height = 13
        Caption = 'cxLabelDateReg'
      end
      object lbl1: TLabel
        Left = 4
        Top = 239
        Width = 77
        Height = 13
        Caption = #1055#1086#1074#1085#1072' '#1085#1072#1079#1074#1072
      end
      object cxTextEditZavNum: TcxTextEdit
        Left = 139
        Top = 4
        Width = 191
        Height = 23
        ParentFont = False
        Properties.MaxLength = 30
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -12
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = []
        TabOrder = 0
      end
      object cxTextEditPasNum: TcxTextEdit
        Left = 139
        Top = 31
        Width = 191
        Height = 23
        ParentFont = False
        Properties.MaxLength = 30
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -12
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = []
        TabOrder = 1
      end
      object cxDateEditDateCreate: TcxDateEdit
        Left = 488
        Top = 4
        Width = 193
        Height = 23
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -12
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = []
        TabOrder = 2
      end
      object cxDateEditDateReg: TcxDateEdit
        Left = 488
        Top = 31
        Width = 193
        Height = 23
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -12
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = []
        TabOrder = 3
      end
      object cxTextEditDocReg: TcxTextEdit
        Left = 138
        Top = 58
        Width = 543
        Height = 23
        ParentFont = False
        Properties.MaxLength = 30
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -12
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = []
        TabOrder = 4
      end
      object cxTextEditMark: TcxTextEdit
        Left = 138
        Top = 84
        Width = 543
        Height = 23
        ParentFont = False
        Properties.MaxLength = 50
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -12
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = []
        TabOrder = 5
      end
      object cxTextEditModel: TcxTextEdit
        Left = 138
        Top = 110
        Width = 543
        Height = 23
        ParentFont = False
        Properties.MaxLength = 50
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -12
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = []
        TabOrder = 6
      end
      object cxMemoNote: TcxMemo
        Left = 138
        Top = 136
        Width = 543
        Height = 99
        ParentFont = False
        Properties.MaxLength = 500
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -12
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = []
        TabOrder = 7
      end
      object cxMemoFullName: TcxMemo
        Left = 139
        Top = 238
        Width = 543
        Height = 101
        ParentFont = False
        Properties.MaxLength = 500
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -12
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = []
        TabOrder = 8
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 397
    Width = 695
    Height = 42
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      695
      42)
    object cxButtonAdd: TcxButton
      Left = 421
      Top = 7
      Width = 120
      Height = 25
      Action = Action1
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        2000000000000008000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000066000000660000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF006565650065656500FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00006600001EB231001FB1330000660000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00656565009A9A9A009A9A9A0065656500FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000066000031C24F0022B738001AB02D0021B4370000660000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0065656500ABABAB009E9E9E00979797009C9C9C0065656500FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000066000047D36D003BCB5E0025A83B00006600001BA92E001DB132000066
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0065656500BFBFBF00B5B5B500989898006565650094949400999999006565
        6500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000066
        00004FD6790053DE7F0031B54D0000660000FF00FF0000660000179D27001EAE
        310000660000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF006565
        6500C4C4C400CACACA00A5A5A50065656500FF00FF00656565008C8C8C009898
        980065656500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000066000041C5630000660000FF00FF00FF00FF00FF00FF00FF00FF000066
        000019AA2B0000660000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0065656500B5B5B50065656500FF00FF00FF00FF00FF00FF00FF00FF006565
        65009393930065656500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000660000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0000660000149D210000660000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0065656500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00656565008A8A8A0065656500FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000066000000660000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF006565650065656500FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000066000000660000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF006565650065656500FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      NumGlyphs = 2
      UseSystemPaint = False
    end
    object cxButtonClose: TcxButton
      Left = 559
      Top = 7
      Width = 120
      Height = 25
      Hint = 'Esc'
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'cxButtonClose'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = cxButtonCloseClick
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        2000000000000008000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000009A0000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000009A0000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF006B6B6B006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF006B6B6B006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0000009A00174AFD00103BF40000009A00FF00FF00FF00FF00FF00FF00FF00
        FF0000009A00002CF8000030FC0000009A00FF00FF00FF00FF00FF00FF00FF00
        FF006B6B6B00A8A8A800A0A0A0006B6B6B00FF00FF00FF00FF00FF00FF00FF00
        FF006B6B6B009A9A9A009C9C9C006B6B6B00FF00FF00FF00FF00FF00FF00FF00
        FF0000009A001A47F8001A4CFF00123BF10000009A00FF00FF00FF00FF000000
        9A00012DF6000132FF00002AF30000009A00FF00FF00FF00FF00FF00FF00FF00
        FF006B6B6B00A7A7A700AAAAAA009F9F9F006B6B6B00FF00FF00FF00FF006B6B
        6B00999999009E9E9E00979797006B6B6B00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000009A001C47F6001B4DFF00143EF40000009A0000009A00002D
        F8000134FF00032BF20000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF006B6B6B00A7A7A700ABABAB00A2A2A2006B6B6B006B6B6B009A9A
        9A009E9E9E00989898006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000009A001D48F6001D50FF00103DFB000431FE000132
        FF00002CF60000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF006B6B6B00A7A7A700ACACAC00A3A3A3009F9F9F009E9E
        9E00999999006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000009A001A48F9001342FF000C3CFF000733
        F60000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF006B6B6B00A7A7A700A7A7A700A3A3A3009C9C
        9C006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000009A00214EFC001D4BFF001847FF001743
        F60000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF006B6B6B00ACACAC00ACACAC00A9A9A900A4A4
        A4006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000009A002E5BF9002C5FFF00224DF800204BF8002355
        FF001B46F60000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF006B6B6B00B1B1B100B3B3B300ABABAB00AAAAAA00AFAF
        AF00A6A6A6006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000009A003664FA00386BFF002D59F40000009A0000009A00224C
        F4002558FF001D49F60000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF006B6B6B00B6B6B600B9B9B900AEAEAE006B6B6B006B6B6B00A9A9
        A900B0B0B000A7A7A7006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0000009A004071FA004274FF00325DF10000009A00FF00FF00FF00FF000000
        9A00224DF100275AFF00204CF80000009A00FF00FF00FF00FF00FF00FF00FF00
        FF006B6B6B00BBBBBB00BEBEBE00AFAFAF006B6B6B00FF00FF00FF00FF006B6B
        6B00A7A7A700B1B1B100AAAAAA006B6B6B00FF00FF00FF00FF00FF00FF00FF00
        FF0000009A00497AFC003B66F30000009A00FF00FF00FF00FF00FF00FF00FF00
        FF0000009A002550F4002655FA0000009A00FF00FF00FF00FF00FF00FF00FF00
        FF006B6B6B00C0C0C000B5B5B5006B6B6B00FF00FF00FF00FF00FF00FF00FF00
        FF006B6B6B00AAAAAA00AEAEAE006B6B6B00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000009A0000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000009A0000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF006B6B6B006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF006B6B6B006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      NumGlyphs = 2
      UseSystemPaint = False
    end
  end
  object ActionList1: TActionList
    Left = 142
    Top = 270
    object Action1: TAction
      Caption = 'F10'
      ShortCut = 121
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 49233
      OnExecute = Action2Execute
    end
    object Action3: TAction
      Caption = 'Action3'
      ShortCut = 49239
      OnExecute = Action3Execute
    end
  end
  object StoredProcWorkWithFullInv: TpFIBStoredProc
    Left = 108
    Top = 267
  end
end
