object FormOptions: TFormOptions
  Left = 431
  Top = 163
  BorderStyle = bsDialog
  Caption = 'FormOptions'
  ClientHeight = 259
  ClientWidth = 478
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = -8
    Width = 477
    Height = 217
    Shape = bsFrame
  end
  object YesBtn: TcxButton
    Left = 288
    Top = 232
    Width = 91
    Height = 22
    Action = YesAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 384
    Top = 232
    Width = 89
    Height = 22
    Action = CancelAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    LookAndFeel.Kind = lfFlat
  end
  object EditDepartment: TcxButtonEdit
    Left = 8
    Top = 75
    Width = 465
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = EditDepartmentPropertiesButtonClick
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 3
  end
  object LabelDepartment: TcxLabel
    Left = 8
    Top = 55
    Width = 465
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
  end
  object CheckBoxWithChild: TcxCheckBox
    Left = 6
    Top = 96
    Width = 467
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    State = cbsChecked
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
  end
  object LabelDateForm: TcxLabel
    Left = 8
    Top = 186
    Width = 336
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 9
  end
  object DateEdit: TcxDateEdit
    Left = 352
    Top = 184
    Width = 122
    Height = 21
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.DateButtons = [btnToday]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 10
  end
  object cxTypePost: TcxCheckBox
    Left = 6
    Top = 120
    Width = 115
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1058#1080#1087' '#1087#1077#1088#1089#1086#1085#1072#1083#1091
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 5
    OnClick = cxTypePostClick
  end
  object ComboTypePost: TcxLookupComboBox
    Left = 120
    Top = 119
    Width = 353
    Height = 21
    Enabled = False
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'ID_TYPE_POST'
    Properties.ListColumns = <
      item
        FieldName = 'NAME_TYPE_POST'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DSource
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 6
  end
  object cxKodSm: TcxCheckBox
    Left = 6
    Top = 152
    Width = 83
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1050#1086#1096#1090#1086#1088#1080#1089
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 7
    OnClick = cxKodSmClick
  end
  object KodSmEdit: TcxButtonEdit
    Left = 88
    Top = 152
    Width = 385
    Height = 21
    Enabled = False
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = KodSmEditPropertiesButtonClick
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 8
  end
  object SR: TcxButtonEdit
    Left = 8
    Top = 27
    Width = 465
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = SRPropertiesButtonClick
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 1
  end
  object LabelShtatDoc: TcxLabel
    Left = 8
    Top = 7
    Width = 465
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
  end
  object ActionList: TActionList
    Left = 8
    Top = 224
    object YesAction: TAction
      Caption = 'YesAction'
      ShortCut = 16464
      OnExecute = YesActionExecute
    end
    object CancelAction: TAction
      Caption = 'CancelAction'
      ShortCut = 27
      OnExecute = CancelActionExecute
    end
    object DesRep: TAction
      Caption = 'DesRep'
      OnExecute = DesRepExecute
    end
  end
  object DSet: TpFIBDataSet
    Left = 40
    Top = 224
    poSQLINT64ToBCD = True
  end
  object DSource: TDataSource
    DataSet = DSetTypePost
    Left = 112
    Top = 224
  end
  object DSetTypePost: TpFIBDataSet
    Left = 72
    Top = 224
    poSQLINT64ToBCD = True
  end
end
