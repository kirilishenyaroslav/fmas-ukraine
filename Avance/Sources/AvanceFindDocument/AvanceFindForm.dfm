object fmAvanceFindForm: TfmAvanceFindForm
  Left = 555
  Top = 180
  Width = 568
  Height = 614
  Caption = 'fmAvanceFindForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object cxRadioGroup1: TcxRadioGroup
    Left = 64
    Top = 430
    Width = 481
    Height = 79
    Properties.Items = <>
    TabOrder = 0
    Caption = ''
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 73
    Width = 537
    Height = 208
    Alignment = alTopLeft
    TabOrder = 1
    object cxCheckBoxDate: TcxCheckBox
      Left = 14
      Top = 13
      Width = 203
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1086' '#1044#1072#1090#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' :'
      State = cbsChecked
      TabOrder = 0
      OnClick = cxCheckBoxDateClick
      OnEditing = cxCheckBoxDateEditing
    end
    object cxDateEditFrom: TcxDateEdit
      Left = 248
      Top = 12
      Width = 121
      Height = 21
      TabOrder = 1
      OnKeyPress = cxTextEditToKeyPress
    end
    object cxDateEditTo: TcxDateEdit
      Left = 408
      Top = 12
      Width = 121
      Height = 21
      TabOrder = 2
      OnKeyPress = cxDateEditToKeyPress
    end
    object cxCheckBoxSumma: TcxCheckBox
      Left = 14
      Top = 38
      Width = 203
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1086' '#1057#1091#1084#1084#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' :'
      TabOrder = 3
      OnClick = cxCheckBoxSummaClick
    end
    object cxCheckBoxFio: TcxCheckBox
      Left = 14
      Top = 125
      Width = 203
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1086' '#1092#1088#1072#1075#1084#1077#1085#1090#1091' '#1060#1048#1054' :'
      TabOrder = 4
      OnClick = cxCheckBoxFioClick
    end
    object cxCheckBoxNote: TcxCheckBox
      Left = 14
      Top = 95
      Width = 195
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1086' '#1092#1088#1072#1075#1084#1077#1085#1090#1091' '#1054#1089#1085#1086#1074#1072#1085#1080#1103' :'
      TabOrder = 5
      OnClick = cxCheckBoxNoteClick
    end
    object cxLabel2: TcxLabel
      Left = 225
      Top = 14
      Width = 21
      Height = 17
      AutoSize = False
      Properties.Alignment.Horz = taCenter
      TabOrder = 6
      Caption = #1089
    end
    object cxLabel3: TcxLabel
      Left = 373
      Top = 16
      Width = 32
      Height = 15
      AutoSize = False
      Properties.Alignment.Horz = taCenter
      TabOrder = 7
      Caption = #1087#1086
    end
    object cxLabel4: TcxLabel
      Left = 224
      Top = 40
      Width = 305
      Height = 17
      AutoSize = False
      TabOrder = 8
      Caption = #1041#1077#1079' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103' '#1087#1086' '#1057#1091#1084#1084#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    end
    object cxLabel5: TcxLabel
      Left = 224
      Top = 125
      Width = 305
      Height = 17
      AutoSize = False
      TabOrder = 9
      Caption = #1041#1077#1079' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103' '#1085#1072' '#1060#1048#1054
    end
    object cxLabel6: TcxLabel
      Left = 224
      Top = 97
      Width = 305
      Height = 17
      AutoSize = False
      TabOrder = 10
      Caption = #1041#1077#1079' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103' '#1085#1072' '#1054#1089#1085#1086#1074#1072#1085#1080#1077
    end
    object cxTextEditFrom: TcxTextEdit
      Left = 248
      Top = 38
      Width = 121
      Height = 21
      OnFocusChanged = cxTextEditFromFocusChanged
      TabOrder = 11
      Visible = False
      OnKeyPress = cxTextEditFromKeyPress
    end
    object cxTextEditTo: TcxTextEdit
      Left = 408
      Top = 38
      Width = 121
      Height = 21
      OnFocusChanged = cxTextEditToFocusChanged
      TabOrder = 12
      Visible = False
      OnKeyPress = cxTextEditToKeyPress
    end
    object cxLabel7: TcxLabel
      Left = 227
      Top = 37
      Width = 14
      Height = 17
      Properties.Alignment.Horz = taCenter
      TabOrder = 13
      Visible = False
      Caption = 'c'
    end
    object cxLabel8: TcxLabel
      Left = 378
      Top = 38
      Width = 20
      Height = 17
      Properties.Alignment.Horz = taCenter
      TabOrder = 14
      Visible = False
      Caption = #1087#1086
    end
    object cxTextEditFio: TcxTextEdit
      Left = 248
      Top = 174
      Width = 281
      Height = 21
      TabOrder = 15
      Visible = False
    end
    object cxTextEditNote: TcxTextEdit
      Left = 312
      Top = 97
      Width = 217
      Height = 21
      TabOrder = 16
      Visible = False
      OnKeyPress = cxTextEditNoteKeyPress
    end
    object cxCheckBoxNumber: TcxCheckBox
      Left = 15
      Top = 67
      Width = 121
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 17
      OnClick = cxCheckBoxNumberClick
    end
    object cxLabel10: TcxLabel
      Left = 224
      Top = 72
      Width = 305
      Height = 17
      AutoSize = False
      TabOrder = 18
    end
    object cxTextEditNumber: TcxTextEdit
      Left = 248
      Top = 70
      Width = 281
      Height = 21
      TabOrder = 19
      Visible = False
    end
    object cxRadioButton2: TcxRadioButton
      Left = 48
      Top = 152
      Width = 193
      Height = 17
      Caption = 'cxRadioButton2'
      Checked = True
      Enabled = False
      TabOrder = 20
      TabStop = True
      OnClick = cxRadioButton2Click
    end
    object cxRadioButton4: TcxRadioButton
      Left = 48
      Top = 176
      Width = 193
      Height = 17
      Caption = 'cxRadioButton4'
      Enabled = False
      TabOrder = 21
      OnClick = cxRadioButton4Click
    end
    object cxButtonEdit3: TcxButtonEdit
      Left = 248
      Top = 149
      Width = 281
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit3PropertiesButtonClick
      TabOrder = 22
      Visible = False
    end
  end
  object cxRadioButtonAll: TcxRadioButton
    Left = 88
    Top = 487
    Width = 225
    Height = 17
    Caption = #1044#1045#1041#1045#1058#1054#1042#1030' '#1090#1072' '#1050#1056#1045#1044#1048#1058#1054#1042#1030' '#1076#1086#1082#1091#1084#1077#1085#1090#1080
    Checked = True
    TabOrder = 2
    TabStop = True
  end
  object cxRadioButtonPrihod: TcxRadioButton
    Left = 88
    Top = 441
    Width = 225
    Height = 17
    Caption = #1058#1110#1083#1100#1082#1080' '#1044#1045#1041#1045#1058#1054#1042#1030' '#1076#1086#1082#1091#1084#1077#1085#1090#1080
    TabOrder = 3
  end
  object cxRadioButton3: TcxRadioButton
    Left = 88
    Top = 465
    Width = 225
    Height = 17
    Caption = #1058#1110#1083#1100#1082#1080' '#1050#1056#1045#1044#1048#1058#1048#1042#1030' '#1076#1086#1082#1091#1084#1077#1085#1090#1080
    TabOrder = 4
  end
  object cxGroupBox2: TcxGroupBox
    Left = 11
    Top = 513
    Width = 537
    Height = 46
    Alignment = alTopLeft
    Caption = 'cxGroupBox2'
    TabOrder = 5
    object cxButton1: TcxButton
      Left = 368
      Top = 13
      Width = 153
      Height = 25
      Action = ActionClose
      TabOrder = 0
      Glyph.Data = {
        32040000424D3204000000000000360000002800000014000000110000000100
        180000000000FC030000120B0000120B00000000000000000000C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4B54A009C31009C3100C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4B54A00FFEFA5FFEFA55A31185A3118C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4B54A00FFEFA5FFEFA5FFE78CFFE78C313131313131C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        FF6331B54A00FFEFA5FFEFA5FFE78CFFE78CFFCE63FFC65A3131319C31009C31
        00C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF31FFFF6331B5
        4A00FFEFA5FFEFA5FFE78CFFE78CFFCE63FFC65AFF9C00FF9C639C3100C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331B54A00FFEF
        A5FFEFA5000000080808FFCE63FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4080808C8D0D4C8D0D4FF6331B54A00FFEFA5FFEFA5
        FFDE84FFDE84FFCE63FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4000000000000C8D0D4C8D0D4FF6331B54A00F7FFFFFFDE84FFDE84FF
        DE84FFDE84FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4C8D0D4000000
        FFFFCE000000000000000000000000B54A00F7FFFFFFEFA5FFDE84FFDE84FFDE
        84FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4000000FFFFCEFFFFCEFF
        FFBDFFC65AFFA510FF9C00B54A00F7FFFFFFEFA5FFDE84FFDE84FFCE63FFC65A
        FF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4C8D0D4000000FFFFCE0000000000
        00000000080808B54A00F7FFFFFFFFFFFFDE84FFDE84FFCE63FFC65AFF9C00FF
        9C639C3100C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4080808000000C8D0D4C8D0D4
        FF6331B54A00F7FFFFFFFFFFFFDE84FFDE84FFCE63FFC65AFF9C00FF9C639C31
        00C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0D4FF31FFFF6331C6
        5A00C65A00FFFFFFFFDE84FFDE84FFCE63FFC65AFF9C00FF9C009C3100C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331FFD673FFD6
        73C65A00C65A00CE6363FFCE63FFC65AFF9C00FF9C009C3100C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331FFD673FFD673FFD673
        FFD673C65A00C65A00CE6363FF9C00FF9C009C3100C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331FFDE84FFDE84FFDE84FFDE84FF
        DE84FFDE84C65A00C65A00C65A009C3100C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4FF6331FF6331FF6331FF6331FF6331FF6331FF63
        31FF6331FF6331FF6331FF6331C8D0D4C8D0D4C8D0D4}
      UseSystemPaint = False
    end
    object cxButton2: TcxButton
      Left = 160
      Top = 13
      Width = 193
      Height = 25
      Action = ActionPrint
      TabOrder = 1
      Glyph.Data = {
        62010000424D620100000000000082000000280000000F0000000E0000000100
        080000000000E0000000C20E0000C20E0000130000001300000000000000FFFF
        FF009C6B6B00B58C8C00FFE7D600F7DEC600FFF7EF00FFD6A500F7E7CE00FFFF
        F70000FF0000C8D0D4000000FF00C5C5C500C0C0C00084848400808080003939
        3900FFFFFF000B11111111111111111111110B0B0B001110101010100F0F0F0F
        0F11110B0B0011111111111111111111111111110B00110E0E0E0E0E0D0D0D0D
        0D0F11110B00110E0E0E0E0E0A0A0C0C0D0F0F111100110E0E0E0E0E0D0D0D0D
        0D0F0F0F11000B111111111111111111110D0F0F11000B0B0301080808080808
        01020D0F11000B0B0301070707070707090211110B000B0B0301060805080508
        09020B0B0B000B0B0B030907070707070701020B0B000B0B0B03090904040404
        0401020B0B000B0B0B0B030101010101010101020B000B0B0B0B0B0303030303
        030303020B00}
      UseSystemPaint = False
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 8
    Top = 4
    Width = 537
    Height = 69
    Alignment = alTopLeft
    TabOrder = 6
    object cxCheckBox2: TcxCheckBox
      Left = 16
      Top = 11
      Width = 201
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 0
      OnClick = cxCheckBox2Click
    end
    object cxLabel1: TcxLabel
      Left = 224
      Top = 11
      Width = 209
      Height = 17
      AutoSize = False
      TabOrder = 1
      Caption = #1042#1089#1077' '#1086#1089#1085#1086#1074#1085#1099#1077' '#1089#1095#1077#1090#1072
    end
    object cxButtonEdit1: TcxButtonEdit
      Left = 248
      Top = 11
      Width = 281
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      TabOrder = 2
      Visible = False
    end
    object cxCheckBox1: TcxCheckBox
      Left = 16
      Top = 43
      Width = 209
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 3
      OnClick = cxCheckBox1Click
    end
    object cxButtonEdit2: TcxButtonEdit
      Left = 248
      Top = 43
      Width = 281
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = cxButtonEdit2PropertiesButtonClick
      TabOrder = 4
      Visible = False
    end
    object cxLabel9: TcxLabel
      Left = 224
      Top = 45
      Width = 289
      Height = 17
      AutoSize = False
      TabOrder = 5
      Caption = #1041#1077#1079' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103' '#1085#1072' '#1082#1086#1088#1088#1077#1089#1087#1086#1085#1076#1080#1088#1091#1102#1097#1080#1077' '#1089#1095#1077#1090#1072
    end
  end
  object cxGroupBox4: TcxGroupBox
    Left = 8
    Top = 286
    Width = 537
    Height = 140
    Alignment = alTopLeft
    TabOrder = 7
    object cxCheckBox3: TcxCheckBox
      Left = 16
      Top = 8
      Width = 209
      Height = 21
      AutoSize = False
      Properties.DisplayUnchecked = 'False'
      TabOrder = 0
      OnClick = cxCheckBox3Click
    end
    object cxCheckBox6: TcxCheckBox
      Left = 16
      Top = 33
      Width = 209
      Height = 22
      AutoSize = False
      Properties.DisplayUnchecked = 'False'
      TabOrder = 1
      OnClick = cxCheckBox6Click
    end
    object cxButtonEdit4: TcxButtonEdit
      Left = 227
      Top = 9
      Width = 300
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit4PropertiesButtonClick
      TabOrder = 2
      Visible = False
    end
    object cxButtonEdit5: TcxButtonEdit
      Left = 227
      Top = 87
      Width = 300
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit5PropertiesButtonClick
      TabOrder = 3
      Visible = False
    end
    object cxButtonEdit6: TcxButtonEdit
      Left = 227
      Top = 111
      Width = 300
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit6PropertiesButtonClick
      TabOrder = 4
      Visible = False
    end
    object cxButtonEdit7: TcxButtonEdit
      Left = 227
      Top = 33
      Width = 300
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit7PropertiesButtonClick
      TabOrder = 5
      Visible = False
    end
    object cxCheckBox9: TcxCheckBox
      Left = 16
      Top = 59
      Width = 201
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 6
      OnClick = cxCheckBox9Click
    end
    object cxCheckBox4: TcxRadioButton
      Left = 62
      Top = 87
      Width = 113
      Height = 17
      Caption = 'cxCheckBox4'
      TabOrder = 7
      Visible = False
      OnClick = cxCheckBox4Click
    end
    object cxCheckBox5: TcxRadioButton
      Left = 62
      Top = 111
      Width = 155
      Height = 17
      Caption = 'cxCheckBox5'
      TabOrder = 8
      Visible = False
      OnClick = cxCheckBox5Click
    end
  end
  object cxCheckBoxKom: TcxCheckBox
    Left = 312
    Top = 443
    Width = 209
    Height = 21
    Properties.DisplayUnchecked = 'False'
    TabOrder = 8
    OnClick = cxCheckBoxKomClick
  end
  object cxDateKomFrom: TcxDateEdit
    Left = 328
    Top = 468
    Width = 89
    Height = 21
    TabOrder = 9
    Visible = False
    OnKeyPress = cxTextEditToKeyPress
  end
  object cxDateKomTo: TcxDateEdit
    Left = 440
    Top = 468
    Width = 89
    Height = 21
    TabOrder = 10
    Visible = False
    OnKeyPress = cxTextEditToKeyPress
  end
  object cxLabelFrom: TcxLabel
    Left = 312
    Top = 469
    Width = 14
    Height = 17
    TabOrder = 11
    Visible = False
    Caption = #1079
  end
  object cxLabelTo: TcxLabel
    Left = 418
    Top = 469
    Width = 20
    Height = 17
    TabOrder = 12
    Visible = False
    Caption = #1076#1086
  end
  object ActionList1: TActionList
    Images = ImageList1
    Left = 368
    Top = 240
    object ActionPrint: TAction
      Caption = 'ActionPrint'
      ImageIndex = 0
      ShortCut = 121
      OnExecute = ActionPrintExecute
    end
    object ActionClose: TAction
      Caption = 'ActionClose'
      ImageIndex = 1
      ShortCut = 27
      OnExecute = ActionCloseExecute
    end
  end
  object ImageList1: TImageList
    Left = 336
    Top = 240
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C3100009C3100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000039393900393939003939
      3900393939003939390039393900393939003939390039393900393939003939
      3900000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFEFA500FFEFA5005A3118005A311800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003939390080808000808080008080
      8000808080008080800084848400848484008484840084848400848484003939
      3900393939000000000000000000000000000000000000000000000000000000
      00000000000000000000FFEFA500FFEFA500FFE78C00FFE78C00313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003939390039393900393939003939
      3900393939003939390039393900393939003939390039393900393939003939
      3900393939003939390000000000000000000000000000000000000000000000
      000000000000FF633100FFEFA500FFEFA500FFE78C00FFE78C00FFC65A003131
      31009C3100009C31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000039393900C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C5C5C500C5C5C500C5C5C500C5C5C500C5C5C5008484
      8400393939003939390000000000000000000000000000000000000000000000
      0000FF31FF00FF633100FFEFA500FFEFA500FFE78C00FFE78C00FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000039393900C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000FF000000FF00000000FF000000FF00C5C5C5008484
      8400848484003939390039393900000000000000000000000000000000000000
      000000000000FF633100FFEFA500FFEFA5000000000008080800FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000039393900C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C5C5C500C5C5C500C5C5C500C5C5C500C5C5C5008484
      8400848484008484840039393900000000000000000000000000080808000000
      000000000000FF633100FFEFA500FFEFA500FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000039393900393939003939
      390039393900393939003939390039393900393939003939390039393900C5C5
      C500848484008484840039393900000000000000000000000000000000000000
      000000000000FF633100F7FFFF00FFDE8400FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B58C8C00FFFF
      FF00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00FFFFFF009C6B
      6B00C5C5C50084848400393939000000000000000000FFFFCE00FFFFBD00FFC6
      5A00FFA51000FF9C0000F7FFFF00FFEFA500FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B58C8C00FFFF
      FF00FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFFFF7009C6B
      6B00393939003939390000000000000000000000000000000000000000000000
      00000000000008080800F7FFFF00FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B58C8C00FFFF
      FF00FFF7EF00F7E7CE00F7DEC600F7E7CE00F7DEC600F7E7CE00FFFFF7009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100F7FFFF00FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFF700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFFF
      FF009C6B6B000000000000000000000000000000000000000000000000000000
      0000FF31FF00FF633100C65A0000FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C00009C31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFF700FFFFF700FFE7D600FFE7D600FFE7D600FFE7D600FFE7D600FFFF
      FF009C6B6B000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFD67300C65A0000C65A0000CE636300FFC65A00FF9C
      0000FF9C00009C31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009C6B6B0000000000000000000000000000000000000000000000
      000000000000FF633100FFD67300FFD67300FFD67300C65A0000CE636300FF9C
      0000FF9C00009C31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C
      8C00B58C8C009C6B6B0000000000000000000000000000000000000000000000
      000000000000FF633100FFDE8400FFDE8400FFDE8400FFDE8400C65A0000C65A
      0000C65A00009C31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FF633100FF633100FF633100FF633100FF633100FF63
      3100FF633100FF63310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFCFF00000000800FFC3F00000000
      0007FC1F000000000003F803000000000003F003000000000001F80300000000
      0001D803000000008001D80300000000C001000300000000C003800300000000
      C00FD80300000000E007D00300000000E007F80300000000F003F80300000000
      F803F80300000000FFFFF8030000000000000000000000000000000000000000
      000000000000}
  end
  object pFIBDataSet1: TpFIBDataSet
    Database = pFIBDatabase1
    Left = 400
    Top = 240
    poSQLINT64ToBCD = True
  end
  object pFIBDatabase1: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'password=masterkey'
      'user_name=SYSDBA')
    DefaultTransaction = pFIBTransaction1
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 432
    Top = 240
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = pFIBDatabase1
    TimeoutAction = TARollback
    Left = 464
    Top = 240
  end
end
