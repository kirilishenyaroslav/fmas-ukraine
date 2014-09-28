object frmAddEditBalance: TfrmAddEditBalance
  Left = 524
  Top = 312
  BorderStyle = bsDialog
  Caption = 'frmAddEditBalance'
  ClientHeight = 183
  ClientWidth = 416
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 416
    Height = 142
    Align = alClient
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 8
      Top = 6
      Width = 145
      Height = 19
      TabStop = False
      AutoSize = False
      ParentFont = False
      TabOrder = 6
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1073#1072#1083#1072#1085#1089#1072':'
    end
    object cxLabel2: TcxLabel
      Left = 8
      Top = 52
      Width = 41
      Height = 17
      TabStop = False
      ParentFont = False
      TabOrder = 7
      Caption = #1044#1050#1059#1044
    end
    object TextEdit_BalanceName: TcxTextEdit
      Left = 8
      Top = 24
      Width = 401
      Height = 21
      ParentFont = False
      Style.Shadow = False
      Style.StyleController = frmBalance.cxEditStyleController1
      TabOrder = 0
    end
    object cxLabel3: TcxLabel
      Left = 150
      Top = 52
      Width = 40
      Height = 17
      TabStop = False
      ParentFont = False
      TabOrder = 4
      Caption = #1050#1054#1044#1059
    end
    object cxLabel4: TcxLabel
      Left = 288
      Top = 52
      Width = 95
      Height = 19
      TabStop = False
      AutoSize = False
      ParentFont = False
      TabOrder = 5
      Caption = #1054#1082#1088#1091#1075#1083#1103#1090#1100' '#1076#1086':'
    end
    object cxComboBox1: TcxComboBox
      Left = 288
      Top = 70
      Width = 120
      Height = 21
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #1075#1088#1085'.'#1082#1086#1087'.'
        #1075#1088#1085'.'
        '10 '#1075#1088#1085'.'
        '100 '#1075#1088#1085'.'
        '1000 '#1075#1088#1085'.')
      Properties.ReadOnly = False
      Style.Shadow = False
      Style.StyleController = frmBalance.cxEditStyleController1
      TabOrder = 3
      Text = #1075#1088#1085'.'#1082#1086#1087'.'
    end
    object TextEdit_DKUD: TcxMaskEdit
      Left = 8
      Top = 70
      Width = 121
      Height = 21
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?'
      Properties.MaxLength = 0
      Style.StyleController = frmBalance.cxEditStyleController1
      TabOrder = 1
    end
    object TextEdit_KODU: TcxMaskEdit
      Left = 148
      Top = 70
      Width = 121
      Height = 21
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?'
      Properties.MaxLength = 0
      Style.StyleController = frmBalance.cxEditStyleController1
      TabOrder = 2
    end
    object TextEdit_CodeVyd: TcxTextEdit
      Left = 8
      Top = 115
      Width = 401
      Height = 21
      ParentFont = False
      Properties.MaxLength = 100
      Style.Shadow = False
      Style.StyleController = frmBalance.cxEditStyleController1
      TabOrder = 8
    end
    object cxLabel_CodeVyd: TcxLabel
      Left = 8
      Top = 97
      Width = 305
      Height = 19
      TabStop = False
      AutoSize = False
      ParentFont = False
      TabOrder = 9
      Caption = 'cxLabel_CodeVyd'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 142
    Width = 416
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button_Cancel: TcxButton
      Left = 329
      Top = 8
      Width = 79
      Height = 25
      Action = act_CANCEL
      ModalResult = 2
      TabOrder = 1
    end
    object Button_Ok: TcxButton
      Left = 241
      Top = 8
      Width = 79
      Height = 25
      Action = act_OK
      Default = True
      TabOrder = 0
    end
  end
  object ActionList1: TActionList
    Left = 40
    Top = 109
    object act_OK: TAction
      Caption = 'act_OK'
      ShortCut = 13
      OnExecute = act_OKExecute
    end
    object act_CANCEL: TAction
      Caption = 'act_CANCEL'
      ShortCut = 27
      OnExecute = act_CANCELExecute
    end
  end
end
