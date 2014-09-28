object FFilterComulativeList: TFFilterComulativeList
  Left = 642
  Top = 529
  BorderStyle = bsDialog
  Caption = 'FFilterComulativeList'
  ClientHeight = 122
  ClientWidth = 383
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 87
    Width = 383
    Height = 35
    Align = alBottom
    TabOrder = 0
    object YesBtn: TcxButton
      Left = 229
      Top = 5
      Width = 67
      Height = 25
      Action = ActionYesF10
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
    end
    object CancelBtn: TcxButton
      Left = 302
      Top = 5
      Width = 67
      Height = 25
      Caption = 'CancelBtn'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
      OnClick = CancelBtnClick
      LookAndFeel.Kind = lfFlat
    end
  end
  object cxGroupBox11: TcxGroupBox
    Left = 0
    Top = -1
    Width = 382
    Height = 47
    Alignment = alTopLeft
    Caption = #1042#1088#1077#1084#1103
    TabOrder = 1
    object MonthesList: TcxComboBox
      Left = 91
      Top = 18
      Width = 288
      Height = 24
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'January'
        'February')
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 0
    end
    object YearSpinEdit: TcxSpinEdit
      Left = 5
      Top = 18
      Width = 85
      Height = 24
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.MaxValue = 2100.000000000000000000
      Properties.MinValue = 1995.000000000000000000
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 1
      Value = 2000
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 45
    Width = 382
    Height = 44
    Alignment = alTopLeft
    Caption = #1040#1074#1090#1086#1084#1086#1073#1080#1083#1100
    TabOrder = 2
    object cxButtonEdit1: TcxButtonEdit
      Left = 6
      Top = 16
      Width = 83
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = 
        '(\d+)?([a-zA-Z'#1072'-'#1103#1040'-'#1071']+)?(\d+)?([a-zA-Z'#1072'-'#1103#1040'-'#1071']+)?(\d+)?([a-zA-Z'#1072'-' +
        #1103#1040'-'#1071']+)?(\d+)?([a-zA-Z'#1072'-'#1103#1040'-'#1071']+)?(\d+)?([a-zA-Z'#1072'-'#1103#1040'-'#1071']+)?'
      Properties.MaxLength = 0
      Properties.ReadOnly = False
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Properties.OnEditValueChanged = cxButtonEdit1PropertiesEditValueChanged
      TabOrder = 0
    end
    object cxLabel1: TcxLabel
      Left = 89
      Top = 18
      Width = 290
      Height = 21
      AutoSize = False
      ParentColor = False
      Style.BorderColor = clHotLight
      Style.BorderStyle = ebsSingle
      Style.Color = clWhite
      TabOrder = 1
      Caption = ''
    end
  end
  object Actions: TActionList
    Left = 24
    Top = 88
    object ActionYesF10: TAction
      Caption = 'ActionYes'
      ShortCut = 121
      OnExecute = ActionYesF10Execute
    end
    object ActionYesCtrlEnd: TAction
      Caption = 'ActionYesCtrlEnd'
      ShortCut = 16419
      OnExecute = ActionYesF10Execute
    end
  end
end
