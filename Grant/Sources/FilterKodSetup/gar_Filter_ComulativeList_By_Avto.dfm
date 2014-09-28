object FFilterComulativeList: TFFilterComulativeList
  Left = 605
  Top = 324
  BorderStyle = bsDialog
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 87
    Width = 383
    Height = 35
    Align = alBottom
    TabOrder = 2
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
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 45
    Width = 382
    Height = 44
    Alignment = alTopLeft
    Caption = #1040#1074#1090#1086#1084#1086#1073#1080#1083#1100
    TabOrder = 1
    TabStop = False
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
      TabStop = False
      AutoSize = False
      ParentColor = False
      Style.BorderColor = clHotLight
      Style.BorderStyle = ebsSingle
      Style.Color = clWhite
      TabOrder = 1
      Caption = ''
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = -2
    Top = 0
    Width = 385
    Height = 49
    Alignment = alTopLeft
    Caption = #1055#1077#1088#1080#1086#1076
    TabOrder = 0
    TabStop = False
    object LabelVidopl: TcxLabel
      Left = 136
      Top = 18
      Width = 49
      Height = 20
      TabStop = False
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Caption = #1053#1072#1095#1072#1083#1086
    end
    object cxLabel2: TcxLabel
      Left = 204
      Top = 18
      Width = 51
      Height = 20
      TabStop = False
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
      Caption = #1050#1086#1085#1077#1094
    end
    object cxDateEdit1: TcxDateEdit
      Left = 8
      Top = 18
      Width = 129
      Height = 24
      TabOrder = 0
    end
    object cxDateEdit2: TcxDateEdit
      Left = 253
      Top = 18
      Width = 125
      Height = 24
      TabOrder = 3
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
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 13
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 27
      OnExecute = CancelBtnClick
    end
  end
end
