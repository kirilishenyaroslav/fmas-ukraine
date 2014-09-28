object fmBankFindForm: TfmBankFindForm
  Left = 494
  Top = 218
  Width = 559
  Height = 561
  Caption = 's'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 0
    Width = 543
    Height = 460
    ActivePage = cxTabSheet2
    Align = alClient
    TabOrder = 0
    object cxTabSheet1: TcxTabSheet
      Caption = 'cxTabSheet1'
      ImageIndex = 0
      DesignSize = (
        543
        437)
      object cxGroupBox4: TcxGroupBox
        Left = 8
        Top = 1
        Width = 537
        Height = 41
        Alignment = alTopLeft
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          537
          41)
        object cxCheckBox3: TcxCheckBox
          Left = 16
          Top = 12
          Width = 195
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1055#1086' '#1088'/'#1089' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103' ('#1085#1072#1096#1080' '#1088'/'#1089')'
          TabOrder = 0
          OnClick = cxCheckBox3Click
        end
        object cxLabel10: TcxLabel
          Left = 224
          Top = 16
          Width = 305
          Height = 17
          AutoSize = False
          TabOrder = 2
          Caption = #1041#1077#1079' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103' '#1085#1072' '#1088'/'#1089
        end
        object cxButtonEdit4: TcxButtonEdit
          Left = 248
          Top = 12
          Width = 281
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = cxButtonEdit4PropertiesButtonClick
          TabOrder = 1
          Visible = False
        end
      end
      object cxGroupBox6: TcxGroupBox
        Left = 8
        Top = 45
        Width = 537
        Height = 68
        Alignment = alTopLeft
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        object SpeedButton1: TSpeedButton
          Left = 235
          Top = 14
          Width = 12
          Height = 19
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFF00F
            FFFFFFFFFFFF000FFFFFFFFFFFF0000FFFFFFFFFFF00000FFFFFFFFFFF00000F
            FFFFFFFFFFF0000FFFFFFFFFFFFF000FFFFFFFFFFFFFF00FFFFFFFFFFFFFFF0F
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = SpeedButton1Click
        end
        object SpeedButton2: TSpeedButton
          Left = 361
          Top = 16
          Width = 12
          Height = 17
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFF00FFFFF
            FFFFFFFFF000FFFFFFFFFFFFF0000FFFFFFFFFFFF00000FFFFFFFFFFF00000FF
            FFFFFFFFF0000FFFFFFFFFFFF000FFFFFFFFFFFFF00FFFFFFFFFFFFFF0FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = SpeedButton2Click
        end
        object SpeedButton3: TSpeedButton
          Left = 403
          Top = 14
          Width = 12
          Height = 19
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFF00F
            FFFFFFFFFFFF000FFFFFFFFFFFF0000FFFFFFFFFFF00000FFFFFFFFFFF00000F
            FFFFFFFFFFF0000FFFFFFFFFFFFF000FFFFFFFFFFFFFF00FFFFFFFFFFFFFFF0F
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = SpeedButton3Click
        end
        object SpeedButton4: TSpeedButton
          Left = 521
          Top = 14
          Width = 12
          Height = 19
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFF00FFFFF
            FFFFFFFFF000FFFFFFFFFFFFF0000FFFFFFFFFFFF00000FFFFFFFFFFF00000FF
            FFFFFFFFF0000FFFFFFFFFFFF000FFFFFFFFFFFFF00FFFFFFFFFFFFFF0FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = SpeedButton4Click
        end
        object SpeedButton5: TSpeedButton
          Left = 235
          Top = 40
          Width = 12
          Height = 19
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFF00F
            FFFFFFFFFFFF000FFFFFFFFFFFF0000FFFFFFFFFFF00000FFFFFFFFFFF00000F
            FFFFFFFFFFF0000FFFFFFFFFFFFF000FFFFFFFFFFFFFF00FFFFFFFFFFFFFFF0F
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = SpeedButton5Click
        end
        object SpeedButton6: TSpeedButton
          Left = 361
          Top = 40
          Width = 12
          Height = 19
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFF00FFFFF
            FFFFFFFFF000FFFFFFFFFFFFF0000FFFFFFFFFFFF00000FFFFFFFFFFF00000FF
            FFFFFFFFF0000FFFFFFFFFFFF000FFFFFFFFFFFFF00FFFFFFFFFFFFFF0FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = SpeedButton6Click
        end
        object SpeedButton7: TSpeedButton
          Left = 403
          Top = 41
          Width = 12
          Height = 19
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFF00F
            FFFFFFFFFFFF000FFFFFFFFFFFF0000FFFFFFFFFFF00000FFFFFFFFFFF00000F
            FFFFFFFFFFF0000FFFFFFFFFFFFF000FFFFFFFFFFFFFF00FFFFFFFFFFFFFFF0F
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = SpeedButton7Click
        end
        object SpeedButton8: TSpeedButton
          Left = 520
          Top = 41
          Width = 12
          Height = 19
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFF00FFFFF
            FFFFFFFFF000FFFFFFFFFFFFF0000FFFFFFFFFFFF00000FFFFFFFFFFF00000FF
            FFFFFFFFF0000FFFFFFFFFFFF000FFFFFFFFFFFFF00FFFFFFFFFFFFFF0FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = SpeedButton8Click
        end
        object cxLabel2: TcxLabel
          Left = 216
          Top = 16
          Width = 25
          Height = 17
          AutoSize = False
          Properties.Alignment.Horz = taCenter
          TabOrder = 6
          Caption = #1089
        end
        object cxDateEditFrom: TcxDateEdit
          Left = 248
          Top = 13
          Width = 113
          Height = 21
          TabOrder = 1
          OnKeyPress = cxTextEditToKeyPress
        end
        object cxLabel3: TcxLabel
          Left = 376
          Top = 16
          Width = 29
          Height = 17
          AutoSize = False
          Properties.Alignment.Horz = taCenter
          TabOrder = 7
          Caption = #1087#1086
        end
        object cxDateEditTo: TcxDateEdit
          Left = 416
          Top = 13
          Width = 105
          Height = 21
          TabOrder = 2
          OnKeyPress = cxDateEditToKeyPress
        end
        object cxRadioButton1: TcxRadioButton
          Left = 16
          Top = 16
          Width = 201
          Height = 17
          Caption = 'cxRadioButton1'
          TabOrder = 0
          OnClick = cxRadioButton1Click
        end
        object cxRadioButton2: TcxRadioButton
          Left = 16
          Top = 40
          Width = 201
          Height = 17
          Caption = 'cxRadioButton2'
          TabOrder = 3
          OnClick = cxRadioButton2Click
        end
        object cxLabel11: TcxLabel
          Left = 216
          Top = 41
          Width = 21
          Height = 17
          AutoSize = False
          Properties.Alignment.Horz = taCenter
          TabOrder = 8
          Caption = #1089
        end
        object cxDateEditProvFrom: TcxDateEdit
          Left = 248
          Top = 39
          Width = 113
          Height = 21
          TabOrder = 4
          OnKeyPress = cxTextEditToKeyPress
        end
        object cxLabel12: TcxLabel
          Left = 376
          Top = 42
          Width = 29
          Height = 17
          AutoSize = False
          Properties.Alignment.Horz = taCenter
          TabOrder = 9
          Caption = #1087#1086
        end
        object cxDateEditProvTo: TcxDateEdit
          Left = 416
          Top = 40
          Width = 105
          Height = 21
          TabOrder = 5
          OnKeyPress = cxDateEditToKeyPress
        end
      end
      object cxRadioGroup1: TcxRadioGroup
        Left = 8
        Top = 343
        Width = 249
        Height = 87
        Properties.Items = <>
        TabOrder = 2
        Caption = ''
      end
      object cxRadioButtonPrihod: TcxRadioButton
        Left = 19
        Top = 355
        Width = 198
        Height = 19
        Caption = #1058#1086#1083#1100#1082#1086' '#1055#1088#1080#1093#1086#1076#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
        TabOrder = 3
      end
      object cxRadioButton3: TcxRadioButton
        Left = 19
        Top = 379
        Width = 230
        Height = 19
        Caption = #1058#1086#1083#1100#1082#1086' '#1056#1072#1089#1093#1086#1076#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
        TabOrder = 4
      end
      object cxRadioButtonAll: TcxRadioButton
        Left = 19
        Top = 403
        Width = 232
        Height = 19
        Caption = #1055#1088#1080#1093#1086#1076#1085#1099#1077' '#1080' '#1056#1072#1089#1093#1086#1076#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
        Checked = True
        TabOrder = 5
        TabStop = True
      end
      object cxGroupBox1: TcxGroupBox
        Left = 8
        Top = 117
        Width = 537
        Height = 111
        Alignment = alTopLeft
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
        DesignSize = (
          537
          111)
        object cxCheckBoxSumma: TcxCheckBox
          Left = 14
          Top = 16
          Width = 203
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1055#1086' '#1057#1091#1084#1084#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' :'
          TabOrder = 0
          OnClick = cxCheckBoxSummaClick
        end
        object cxCheckBoxNote: TcxCheckBox
          Left = 14
          Top = 46
          Width = 195
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1055#1086' '#1092#1088#1072#1075#1084#1077#1085#1090#1091' '#1054#1089#1085#1086#1074#1072#1085#1080#1103' :'
          TabOrder = 3
          OnClick = cxCheckBoxNoteClick
        end
        object cxLabel4: TcxLabel
          Left = 224
          Top = 16
          Width = 305
          Height = 17
          AutoSize = False
          TabOrder = 5
          Caption = #1041#1077#1079' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103' '#1087#1086' '#1057#1091#1084#1084#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        end
        object cxLabel6: TcxLabel
          Left = 224
          Top = 48
          Width = 305
          Height = 17
          AutoSize = False
          TabOrder = 6
          Caption = #1041#1077#1079' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103' '#1085#1072' '#1054#1089#1085#1086#1074#1072#1085#1080#1077
        end
        object cxTextEditFrom: TcxTextEdit
          Left = 248
          Top = 16
          Width = 121
          Height = 21
          Properties.OnChange = cxTextEditFromPropertiesChange
          TabOrder = 1
          Visible = False
          OnKeyPress = cxTextEditFromKeyPress
        end
        object cxTextEditTo: TcxTextEdit
          Left = 404
          Top = 16
          Width = 121
          Height = 21
          TabOrder = 2
          Visible = False
          OnKeyPress = cxTextEditToKeyPress
        end
        object cxLabel7: TcxLabel
          Left = 227
          Top = 15
          Width = 14
          Height = 17
          Properties.Alignment.Horz = taCenter
          TabOrder = 7
          Visible = False
          Caption = 'c'
        end
        object cxLabel8: TcxLabel
          Left = 378
          Top = 16
          Width = 20
          Height = 17
          Properties.Alignment.Horz = taCenter
          TabOrder = 8
          Visible = False
          Caption = #1087#1086
        end
        object cxTextEditNote: TcxTextEdit
          Left = 248
          Top = 47
          Width = 278
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
          Visible = False
          OnKeyPress = cxTextEditNoteKeyPress
        end
        object cxCheckBox8: TcxCheckBox
          Left = 14
          Top = 78
          Width = 209
          Height = 21
          Properties.DisplayUnchecked = 'False'
          TabOrder = 9
          OnClick = cxCheckBox8Click
        end
        object cxLabel14: TcxLabel
          Left = 224
          Top = 82
          Width = 305
          Height = 17
          AutoSize = False
          TabOrder = 10
          Caption = #1041#1077#1079' '#1086#1073#1084#1077#1078#1077#1085#1085#1103' '#1085#1072' '#1053#1054#1052#1045#1056' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        end
        object cxTextEdit_Num: TcxTextEdit
          Left = 248
          Top = 78
          Width = 280
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 11
          Visible = False
        end
      end
      object cxGroupBox5: TcxGroupBox
        Left = 8
        Top = 230
        Width = 537
        Height = 111
        Alignment = alTopLeft
        Anchors = [akLeft, akTop, akRight]
        Caption = #1055#1086' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1091
        TabOrder = 7
        DesignSize = (
          537
          111)
        object cxCheckBoxFio: TcxCheckBox
          Left = 14
          Top = 14
          Width = 203
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1055#1086' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1091' :'
          TabOrder = 0
          OnClick = cxCheckBoxFioClick
        end
        object cxLabel5: TcxLabel
          Left = 216
          Top = 16
          Width = 305
          Height = 17
          AutoSize = False
          TabOrder = 7
          Caption = #1041#1077#1079' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103' '#1085#1072' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
        end
        object cxButtonEdit3: TcxButtonEdit
          Left = 247
          Top = 34
          Width = 281
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = cxButtonEdit3PropertiesButtonClick
          TabOrder = 4
          Visible = False
        end
        object RadioButton1: TRadioButton
          Left = 56
          Top = 37
          Width = 185
          Height = 17
          Caption = #1055#1086' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1091' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
          Checked = True
          TabOrder = 1
          TabStop = True
          Visible = False
          OnClick = RadioButton1Click
        end
        object RadioButton2: TRadioButton
          Left = 56
          Top = 61
          Width = 185
          Height = 17
          Caption = #1055#1086' '#1088'/'#1089' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
          TabOrder = 2
          Visible = False
          OnClick = RadioButton2Click
        end
        object RadioButton3: TRadioButton
          Left = 56
          Top = 87
          Width = 185
          Height = 17
          Caption = #1055#1086' '#1074#1082#1083#1102#1095#1077#1085#1080#1102' '#1074' '#1085#1072#1079#1074#1072#1085#1080#1077
          TabOrder = 3
          Visible = False
          OnClick = RadioButton3Click
        end
        object cxButtonEdit5: TcxButtonEdit
          Left = 248
          Top = 61
          Width = 281
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Enabled = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = cxButtonEdit5PropertiesButtonClick
          TabOrder = 5
          Visible = False
        end
        object cxTextEdit1: TcxTextEdit
          Left = 248
          Top = 85
          Width = 281
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Enabled = False
          TabOrder = 6
          Visible = False
          OnExit = cxTextEdit1Exit
        end
      end
      object cxGroupBox9: TcxGroupBox
        Left = 264
        Top = 343
        Width = 273
        Height = 88
        Alignment = alTopLeft
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 8
        object cxRadioButton6: TcxRadioButton
          Left = 19
          Top = 11
          Width = 222
          Height = 17
          Caption = 'cxRadioButton4'
          TabOrder = 0
        end
        object cxRadioButton7: TcxRadioButton
          Left = 19
          Top = 37
          Width = 222
          Height = 17
          Caption = 'cxRadioButton5'
          TabOrder = 1
        end
        object cxRadioButton8: TcxRadioButton
          Left = 19
          Top = 63
          Width = 222
          Height = 17
          Caption = 'cxRadioButton6'
          Checked = True
          TabOrder = 2
          TabStop = True
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'cxTabSheet2'
      ImageIndex = 1
      DesignSize = (
        543
        437)
      object cxGroupBox3: TcxGroupBox
        Left = 8
        Top = 4
        Width = 537
        Height = 81
        Alignment = alTopLeft
        Anchors = [akLeft, akTop, akRight]
        Caption = #1055#1086' '#1082#1086#1088#1088#1077#1089#1087#1086#1085#1076#1077#1085#1094#1080#1080' '#1073#1072#1083#1072#1085#1089#1086#1074#1099#1093' '#1089#1095#1077#1090#1086#1074
        TabOrder = 0
        DesignSize = (
          537
          81)
        object cxCheckBox2: TcxCheckBox
          Left = 16
          Top = 17
          Width = 201
          Height = 21
          Properties.DisplayUnchecked = 'False'
          TabOrder = 0
          OnClick = cxCheckBox2Click
        end
        object cxLabel1: TcxLabel
          Left = 234
          Top = 17
          Width = 209
          Height = 17
          AutoSize = False
          TabOrder = 4
          Caption = #1042#1089#1077' '#1086#1089#1085#1086#1074#1085#1099#1077' '#1089#1095#1077#1090#1072
        end
        object cxButtonEdit1: TcxButtonEdit
          Left = 232
          Top = 17
          Width = 296
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
          TabOrder = 1
          Visible = False
        end
        object cxCheckBox1: TcxCheckBox
          Left = 16
          Top = 49
          Width = 209
          Height = 21
          Properties.DisplayUnchecked = 'False'
          TabOrder = 2
          OnClick = cxCheckBox1Click
        end
        object cxButtonEdit2: TcxButtonEdit
          Left = 232
          Top = 49
          Width = 296
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnButtonClick = cxButtonEdit2PropertiesButtonClick
          TabOrder = 3
          Visible = False
        end
        object cxLabel9: TcxLabel
          Left = 232
          Top = 51
          Width = 289
          Height = 17
          AutoSize = False
          TabOrder = 5
          Caption = #1041#1077#1079' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103' '#1085#1072' '#1082#1086#1088#1088#1077#1089#1087#1086#1085#1076#1080#1088#1091#1102#1097#1080#1077' '#1089#1095#1077#1090#1072
        end
      end
      object cxGroupBox7: TcxGroupBox
        Left = 8
        Top = 176
        Width = 537
        Height = 70
        Alignment = alTopLeft
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        DesignSize = (
          537
          70)
        object cxCheckBox4: TcxCheckBox
          Left = 14
          Top = 13
          Width = 203
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1055#1086' '#1076#1086#1075#1086#1074#1086#1088#1091' '#1060#1061#1044' :'
          TabOrder = 0
          OnClick = cxCheckBox4Click
        end
        object cxLabel13: TcxLabel
          Left = 226
          Top = 14
          Width = 311
          Height = 17
          TabStop = False
          AutoSize = False
          TabOrder = 2
          Caption = #1041#1077#1079' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103' '#1085#1072' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
        end
        object cxButtonEdit6: TcxButtonEdit
          Left = 229
          Top = 12
          Width = 298
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnButtonClick = cxButtonEdit6PropertiesButtonClick
          TabOrder = 1
          Visible = False
        end
        object cxCheckBox7: TcxCheckBox
          Left = 14
          Top = 41
          Width = 203
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1055#1086' '#1076#1086#1075#1086#1074#1086#1088#1091'  '#1079#1072' '#1086#1073#1091#1095#1077#1085#1077':'
          TabOrder = 3
          OnClick = cxCheckBox7Click
        end
        object cxButtonEdit11: TcxButtonEdit
          Left = 229
          Top = 40
          Width = 298
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnButtonClick = cxButtonEdit11PropertiesButtonClick
          TabOrder = 4
          Visible = False
        end
        object cxLabel17: TcxLabel
          Left = 226
          Top = 39
          Width = 311
          Height = 17
          TabStop = False
          AutoSize = False
          TabOrder = 5
          Caption = #1041#1077#1079' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103' '#1085#1072' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
        end
      end
      object cxGroupBox8: TcxGroupBox
        Left = 7
        Top = 255
        Width = 537
        Height = 175
        Alignment = alTopLeft
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        DesignSize = (
          537
          175)
        object cxCheckBox5: TcxCheckBox
          Left = 16
          Top = 8
          Width = 209
          Height = 21
          AutoSize = False
          Properties.DisplayUnchecked = 'False'
          TabOrder = 0
          OnClick = cxCheckBox5Click
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
        object cxButtonEdit7: TcxButtonEdit
          Left = 227
          Top = 9
          Width = 300
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnButtonClick = cxButtonEdit7PropertiesButtonClick
          TabOrder = 2
          Visible = False
        end
        object cxButtonEdit8: TcxButtonEdit
          Left = 227
          Top = 103
          Width = 300
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnButtonClick = cxButtonEdit8PropertiesButtonClick
          TabOrder = 3
          Visible = False
        end
        object cxButtonEdit9: TcxButtonEdit
          Left = 227
          Top = 128
          Width = 300
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnButtonClick = cxButtonEdit9PropertiesButtonClick
          TabOrder = 4
          Visible = False
        end
        object cxButtonEdit10: TcxButtonEdit
          Left = 227
          Top = 33
          Width = 300
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnButtonClick = cxButtonEdit10PropertiesButtonClick
          TabOrder = 5
          Visible = False
        end
        object cxCheckBox9: TcxCheckBox
          Left = 16
          Top = 83
          Width = 201
          Height = 21
          Properties.DisplayUnchecked = 'False'
          TabOrder = 6
          OnClick = cxCheckBox9Click
        end
        object cxRadioButton4: TcxRadioButton
          Left = 62
          Top = 103
          Width = 113
          Height = 17
          Caption = 'cxCheckBox4'
          TabOrder = 7
          Visible = False
          OnClick = cxRadioButton4Click
        end
        object cxRadioButton5: TcxRadioButton
          Left = 62
          Top = 128
          Width = 155
          Height = 17
          Caption = 'cxCheckBox5'
          TabOrder = 8
          Visible = False
          OnClick = cxRadioButton5Click
        end
        object cxButtonEdit12: TcxButtonEdit
          Left = 227
          Top = 58
          Width = 300
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnButtonClick = cxButtonEdit12PropertiesButtonClick
          TabOrder = 9
          Visible = False
        end
        object cxCheckBox10: TcxCheckBox
          Left = 16
          Top = 58
          Width = 209
          Height = 21
          AutoSize = False
          Properties.DisplayUnchecked = 'False'
          TabOrder = 10
          OnClick = cxCheckBox10Click
        end
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 94
        Width = 537
        Height = 75
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        DesignSize = (
          537
          75)
        object cxTextEditComment: TcxTextEdit
          Left = 233
          Top = 19
          Width = 291
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Visible = False
          OnKeyPress = cxTextEditNoteKeyPress
        end
        object cxCheckBoxComment: TcxCheckBox
          Left = 14
          Top = 19
          Width = 219
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1047#1072' '#1092#1088#1072#1075#1084#1077#1085#1090#1086#1080' '#1087#1088#1080#1084#1110#1090#1082#1080' '#1076#1086' '#1087#1088#1086#1074#1086#1076#1082#1080
          TabOrder = 1
          OnClick = cxCheckBoxCommentClick
        end
        object cxLabel16: TcxLabel
          Left = 226
          Top = 20
          Width = 292
          Height = 17
          AutoSize = False
          TabOrder = 2
          Caption = #1041#1077#1079' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103' '#1085#1072' '#1054#1089#1085#1086#1074#1072#1085#1080#1077
        end
        object cxCheckBoxMen: TcxCheckBox
          Left = 14
          Top = 45
          Width = 219
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1047#1072' '#1092#1110#1079#1080#1095#1085#1086#1102' '#1086#1089#1086#1073#1086#1102
          TabOrder = 3
          OnClick = cxCheckBoxMenClick
        end
        object cxLabel15: TcxLabel
          Left = 227
          Top = 44
          Width = 297
          Height = 17
          AutoSize = False
          TabOrder = 4
          Caption = #1041#1077#1079' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103' '#1085#1072' '#1054#1089#1085#1086#1074#1072#1085#1080#1077
        end
        object cxButtonEditMen: TcxButtonEdit
          Left = 232
          Top = 44
          Width = 293
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnButtonClick = cxButtonEditMenPropertiesButtonClick
          TabOrder = 5
          Visible = False
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 460
    Width = 543
    Height = 63
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      543
      63)
    object cxGroupBox2: TcxGroupBox
      Left = 8
      Top = 6
      Width = 529
      Height = 50
      Alignment = alTopLeft
      Anchors = [akLeft, akRight, akBottom]
      Caption = 'cxGroupBox2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        529
        50)
      object cxButton1: TcxButton
        Left = 368
        Top = 13
        Width = 153
        Height = 29
        Action = ActionClose
        Anchors = [akLeft, akBottom]
        TabOrder = 1
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
        Left = 159
        Top = 13
        Width = 193
        Height = 29
        Action = ActionPrint
        Anchors = [akLeft, akBottom]
        TabOrder = 0
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF006600006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0066001EB2311FB13300
          6600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF00660031C24F22B7381AB02D21B437006600FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF00660047D36D3BCB5E25A83B0066001B
          A92E1DB132006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600
          4FD67953DE7F31B54D006600FF00FF006600179D271EAE31006600FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF00660041C563006600FF00FFFF00FFFF
          00FFFF00FF00660019AA2B006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600149D210066
          00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF006600006600FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FF006600006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        UseSystemPaint = False
      end
    end
  end
  object ActionList1: TActionList
    Images = ImageList1
    Left = 320
    Top = 272
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
    Left = 288
    Top = 272
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
    Database = D
    Left = 352
    Top = 272
    poSQLINT64ToBCD = True
  end
  object D: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'password=masterkey'
      'user_name=SYSDBA')
    DefaultTransaction = pFIBTransaction1
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 384
    Top = 272
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = D
    TimeoutAction = TARollback
    Left = 416
    Top = 272
  end
  object TWr: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 512
    Top = 280
  end
  object DataSet: TpFIBDataSet
    Left = 472
    Top = 368
    poSQLINT64ToBCD = True
  end
  object FormStorage1: TFormStorage
    Options = [fpState]
    UseRegistry = True
    StoredValues = <>
    Left = 24
    Top = 360
  end
end
