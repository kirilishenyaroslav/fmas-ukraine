object frmEditOper: TfrmEditOper
  Left = 620
  Top = 116
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  ClientHeight = 397
  ClientWidth = 644
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Bevel3: TBevel
    Left = 24
    Top = 71
    Width = 289
    Height = 95
  end
  object Bevel2: TBevel
    Left = 343
    Top = 71
    Width = 289
    Height = 95
  end
  object Label2: TLabel
    Left = 351
    Top = 79
    Width = 250
    Height = 29
    Alignment = taCenter
    AutoSize = False
    Color = clBtnFace
    ParentColor = False
    WordWrap = True
  end
  object Label3: TLabel
    Left = 350
    Top = 121
    Width = 252
    Height = 33
    Alignment = taCenter
    AutoSize = False
    Color = clBtnFace
    ParentColor = False
    WordWrap = True
  end
  object Label4: TLabel
    Left = 39
    Top = 79
    Width = 246
    Height = 29
    Alignment = taCenter
    AutoSize = False
    Caption = ' '
    Color = clBtnFace
    ParentColor = False
    WordWrap = True
  end
  object Label5: TLabel
    Left = 36
    Top = 121
    Width = 252
    Height = 33
    Alignment = taCenter
    AutoSize = False
    Caption = ' '
    Color = clBtnFace
    ParentColor = False
    WordWrap = True
  end
  object Label1: TLabel
    Left = 24
    Top = 296
    Width = 73
    Height = 16
    Caption = #1050#1086#1084#1077#1085#1090#1072#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 80
    Top = 3
    Width = 167
    Height = 24
    Caption = #1056#1072#1093#1091#1085#1086#1082' '#1091' '#1076#1077#1073#1077#1090#1110
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 403
    Top = 3
    Width = 177
    Height = 24
    Caption = #1056#1072#1093#1091#1085#1086#1082' '#1091' '#1082#1088#1077#1076#1080#1090#1110
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 338
    Top = 217
    Width = 193
    Height = 16
    Caption = #1052#1077#1084#1086#1088#1110#1072#1083#1100#1085#1080#1081' '#1086#1088#1076#1077#1088' '#1074' '#1076#1077#1073#1077#1090#1110
  end
  object Label9: TLabel
    Left = 336
    Top = 185
    Width = 208
    Height = 16
    Caption = #1052#1077#1084#1086#1088#1110#1072#1083#1100#1085#1080#1081' '#1086#1088#1076#1077#1088' '#1087#1086' '#1082#1088#1077#1076#1080#1090#1110
  end
  object moComents: TMemo
    Left = 24
    Top = 315
    Width = 609
    Height = 41
    Color = clInfoBk
    Ctl3D = False
    Lines.Strings = (
      '')
    MaxLength = 60
    ParentCtl3D = False
    TabOrder = 4
  end
  object cbCR_PROV: TComboBox
    Left = 97
    Top = 319
    Width = 81
    Height = 22
    Style = csOwnerDrawFixed
    Color = clInfoBk
    ItemHeight = 16
    ItemIndex = 1
    TabOrder = 0
    Text = #1053#1077#1090
    Visible = False
    Items.Strings = (
      #1044#1072
      #1053#1077#1090)
  end
  object cbCR_DOC: TComboBox
    Left = 97
    Top = 341
    Width = 81
    Height = 22
    Style = csOwnerDrawFixed
    Color = clInfoBk
    ItemHeight = 16
    ItemIndex = 1
    TabOrder = 1
    Text = #1053#1077#1090
    Visible = False
    Items.Strings = (
      #1044#1072
      #1053#1077#1090)
  end
  object cbDB_PROV: TComboBox
    Left = 25
    Top = 319
    Width = 73
    Height = 22
    Style = csOwnerDrawFixed
    Color = clInfoBk
    ItemHeight = 16
    ItemIndex = 1
    TabOrder = 2
    Text = #1053#1077#1090
    Visible = False
    Items.Strings = (
      #1044#1072
      #1053#1077#1090)
  end
  object cbDB_DOC: TComboBox
    Left = 25
    Top = 341
    Width = 73
    Height = 22
    Style = csOwnerDrawFixed
    Color = clInfoBk
    ItemHeight = 16
    ItemIndex = 1
    TabOrder = 3
    Text = #1053#1077#1090
    Visible = False
    Items.Strings = (
      #1044#1072
      #1053#1077#1090)
  end
  object DbSchTitle: TEdit
    Left = 24
    Top = 32
    Width = 289
    Height = 22
    Color = clMenu
    Ctl3D = False
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 5
  end
  object KrSchTitle: TEdit
    Left = 343
    Top = 32
    Width = 289
    Height = 22
    Color = clMenu
    Ctl3D = False
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 6
  end
  object cxDB_DOC: TcxCheckBox
    Left = 288
    Top = 123
    Width = 22
    Height = 24
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = cxDB_DOCPropertiesChange
    Properties.Caption = ''
    TabOrder = 7
  end
  object cxCR_DOC: TcxCheckBox
    Left = 603
    Top = 123
    Width = 22
    Height = 24
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = cxCR_DOCPropertiesChange
    Properties.Caption = ''
    TabOrder = 8
  end
  object rbDB_PROV: TcxRadioButton
    Left = 291
    Top = 85
    Width = 17
    Height = 17
    TabOrder = 9
    OnClick = rbDB_PROVClick
  end
  object rbKR_PROV: TcxRadioButton
    Left = 607
    Top = 85
    Width = 17
    Height = 17
    TabOrder = 10
    OnClick = rbKR_PROVClick
  end
  object ConfirmButton: TcxButton
    Left = 475
    Top = 362
    Width = 78
    Height = 25
    Caption = #1054#1050
    TabOrder = 11
    OnClick = ConfirmButtonClick
  end
  object CancelButton: TcxButton
    Left = 555
    Top = 362
    Width = 78
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 12
    OnClick = CancelButtonClick
  end
  object CALC_IN_DB_OBOR: TcxRadioGroup
    Left = 24
    Top = 174
    Width = 609
    Height = 110
    ItemIndex = 1
    ParentFont = False
    Properties.Items = <
      item
        Caption = #1074' '#1082#1088#1077#1076#1080#1090#1110' '#1088#1072#1093#1091#1085#1082#1072' '#1086#1087#1077#1088#1072#1094#1110#1111
      end
      item
        Caption = #1074' '#1076#1077#1073#1077#1090#1110' '#1088#1072#1093#1091#1085#1082#1072' '#1086#1087#1077#1088#1072#1094#1110#1111
      end>
    Properties.OnChange = CALC_IN_DB_OBORPropertiesChange
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 13
    Caption = 
      #1057#1091#1084#1091' '#1087#1088#1086#1074#1086#1076#1082#1080' '#1087#1086' '#1086#1087#1077#1088#1072#1094#1110#1111' '#1088#1072#1093#1091#1074#1072#1090#1080' '#1076#1086' '#1086#1073#1086#1088#1086#1090#1110#1074' '#1084#1077#1084#1086#1088#1110#1072#1083#1100#1085#1086#1075#1086' '#1086#1088#1076 +
      #1077#1088#1072
  end
  object DbMOrders: TcxLookupComboBox
    Left = 263
    Top = 244
    Width = 353
    Height = 24
    Enabled = False
    ParentFont = False
    Properties.KeyFieldNames = 'ID_REG'
    Properties.ListColumns = <
      item
        FieldName = 'REG_TITLE'
      end>
    Properties.ListSource = DbDataSource
    Style.Color = clInfoBk
    TabOrder = 14
  end
  object KrMOrders: TcxLookupComboBox
    Left = 263
    Top = 202
    Width = 353
    Height = 24
    Enabled = False
    ParentFont = False
    Properties.KeyFieldNames = 'ID_REG'
    Properties.ListColumns = <
      item
        FieldName = 'REG_TITLE'
      end>
    Properties.ListSource = KrDataSource
    Style.Color = clInfoBk
    TabOrder = 15
  end
  object cxButton1: TcxButton
    Left = 291
    Top = 32
    Width = 22
    Height = 22
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
    OnClick = cxButton1Click
    LookAndFeel.Kind = lfUltraFlat
  end
  object ActionList1: TActionList
    Left = 472
    Top = 8
    object Esc: TAction
      Caption = 'Esc'
      ShortCut = 27
      OnExecute = EscExecute
    end
    object Enter: TAction
      Caption = 'Enter'
      ShortCut = 13
      OnExecute = EnterExecute
    end
  end
  object DbRegDataSet: TpFIBDataSet
    Left = 64
    Top = 280
    poSQLINT64ToBCD = True
  end
  object KrRegDataSet: TpFIBDataSet
    Left = 344
    Top = 328
    poSQLINT64ToBCD = True
  end
  object DbDataSource: TDataSource
    DataSet = DbRegDataSet
    Left = 96
    Top = 280
  end
  object KrDataSource: TDataSource
    DataSet = KrRegDataSet
    Left = 376
    Top = 328
  end
end
