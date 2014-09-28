object FTnAccessControl: TFTnAccessControl
  Left = 533
  Top = 536
  BorderStyle = bsDialog
  Caption = 'FTnAccessControl'
  ClientHeight = 242
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object YesBtn: TcxButton
    Left = 336
    Top = 192
    Width = 81
    Height = 25
    Action = Action1
    TabOrder = 2
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 424
    Top = 192
    Width = 81
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
    OnClick = CancelBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object BoxMan: TcxGroupBox
    Left = 0
    Top = -3
    Width = 553
    Height = 41
    Alignment = alTopLeft
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object EditMan: TcxButtonEdit
      Left = 136
      Top = 13
      Width = 409
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
          Visible = False
        end>
      Properties.MaskKind = emkRegExpr
      Properties.ReadOnly = True
      Style.Color = clWindow
      TabOrder = 0
    end
    object LabelMan: TcxLabel
      Left = 0
      Top = 15
      Width = 137
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Caption = 'LabelMan'
    end
  end
  object BoxPriv: TcxGroupBox
    Left = 0
    Top = 39
    Width = 553
    Height = 68
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object LabelTypeViplata: TcxLabel
      Left = 0
      Top = 15
      Width = 137
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      Caption = 'LabelTypeViplata'
    end
    object LabelAcctCard: TcxLabel
      Left = 0
      Top = 39
      Width = 137
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Visible = False
      Caption = 'LabelAcctCard'
    end
    object MaskEditCard: TcxMaskEdit
      Left = 136
      Top = 38
      Width = 289
      Height = 24
      TabOrder = 2
      Visible = False
      OnKeyPress = MaskEditCardKeyPress
    end
    object ClearBtn: TcxButton
      Left = 464
      Top = 40
      Width = 81
      Height = 23
      Caption = 'ClearBtn'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Visible = False
      OnClick = ClearBtnClick
      LookAndFeel.Kind = lfFlat
    end
    object LookupCBoxTypePayment: TcxLookupComboBox
      Left = 136
      Top = 12
      Width = 409
      Height = 24
      Properties.KeyFieldNames = 'ID_TYPE_PAYMENT'
      Properties.ListColumns = <
        item
          FieldName = 'SHORT_NAME_TYPE_PAYMENT'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.OnChange = LookupCBoxTypePaymentPropertiesChange
      Properties.OnEditValueChanged = LookupCBoxTypePaymentPropertiesChange
      TabOrder = 4
    end
  end
  object BpxShifr: TcxGroupBox
    Left = 0
    Top = 109
    Width = 553
    Height = 76
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object LabelShifr: TcxLabel
      Left = 0
      Top = 47
      Width = 137
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      Caption = 'LabelShifr'
    end
    object MaskEditShifr: TcxMaskEdit
      Left = 136
      Top = 44
      Width = 289
      Height = 24
      Enabled = False
      Properties.ReadOnly = False
      TabOrder = 1
      OnKeyPress = MaskEditShifrKeyPress
    end
    object CheckBoxShifrIsEdit: TcxCheckBox
      Left = 24
      Top = 16
      Width = 217
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = CheckBoxShifrIsEditPropertiesChange
      TabOrder = 2
    end
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 222
    Width = 554
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Width = 170
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Width = 170
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
      end>
    PaintStyle = stpsOffice11
    LookAndFeel.Kind = lfStandard
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object Actions: TActionList
    Left = 192
    Top = 184
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 121
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 120
      OnExecute = Action2Execute
    end
    object Action3: TAction
      Caption = 'Action3'
      ShortCut = 13
      OnExecute = Action3Execute
    end
  end
end
