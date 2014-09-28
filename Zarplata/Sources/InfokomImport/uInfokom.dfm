object MainForm: TMainForm
  Left = 493
  Top = 254
  BorderStyle = bsDialog
  Caption = #1030#1084#1087#1086#1088#1090' '#1087#1086#1090#1086#1095#1085#1080#1093' '#1086#1087#1077#1088#1072#1094#1110#1081
  ClientHeight = 597
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ImportPanel: TGroupBox
    Left = 8
    Top = 176
    Width = 569
    Height = 81
    Caption = #1030#1084#1087#1086#1088#1090' '#1076#1072#1085#1085#1080#1093
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    object StartBtn: TcxButton
      Left = 248
      Top = 48
      Width = 75
      Height = 25
      Caption = #1055#1086#1095#1072#1090#1080
      TabOrder = 0
      OnClick = StartBtnClick
    end
    object ProgressBar: TcxProgressBar
      Left = 56
      Top = 24
      Width = 465
      Height = 21
      TabOrder = 1
    end
  end
  object FileOpenGroup: TGroupBox
    Left = 8
    Top = 0
    Width = 569
    Height = 57
    Caption = #1042#1080#1073#1088#1072#1090#1080' '#1092#1072#1081#1083
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    object FileNameEdit: TcxTextEdit
      Left = 56
      Top = 24
      Width = 425
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 0
    end
    object OpenFileDialogBtn: TcxButton
      Left = 480
      Top = 22
      Width = 33
      Height = 25
      Caption = '...'
      TabOrder = 1
      OnClick = OpenFileDialogBtnClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 64
    Width = 569
    Height = 49
    Caption = #1055#1077#1088#1110#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object MonthesList: TcxComboBox
      Left = 56
      Top = 16
      Width = 148
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 0
    end
    object YearSpinEdit: TcxSpinEdit
      Left = 204
      Top = 16
      Width = 85
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 1
      Value = 2000
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 120
    Width = 569
    Height = 49
    Caption = #1042#1080#1076' '#1086#1087#1077#1088#1072#1094#1110#1111
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object EditVidOpl: TcxButtonEdit
      Left = 56
      Top = 18
      Width = 73
      Height = 21
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d?\d?\d?\d?\d?\d?\d?\d?'
      Properties.MaxLength = 0
      Properties.OnButtonClick = EditVidOplPropertiesButtonClick
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 0
      OnExit = EditVidOplExit
    end
    object LabelVidOplData: TcxLabel
      Left = 124
      Top = 18
      Width = 397
      Height = 21
      AutoSize = False
      ParentColor = False
      ParentFont = False
      Style.BorderColor = clHotLight
      Style.BorderStyle = ebsSingle
      Style.Color = clWhite
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 1
      Caption = ''
    end
  end
  object MessagesList: TListBox
    Left = 9
    Top = 288
    Width = 568
    Height = 297
    Style = lbOwnerDrawVariable
    Color = clInactiveCaption
    ItemHeight = 13
    TabOrder = 4
  end
  object Panel1: TPanel
    Left = 8
    Top = 260
    Width = 569
    Height = 32
    Alignment = taLeftJustify
    Caption = '    '#1055#1088#1086#1090#1086#1082#1086#1083' '#1087#1086#1084#1080#1083#1086#1082':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    object eFileNameEdit: TcxButtonEdit
      Left = 136
      Top = 5
      Width = 329
      Height = 21
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = eFileNameEditPropertiesButtonClick
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 464
      Top = 5
      Width = 81
      Height = 20
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 260
    Width = 9
    Height = 325
    TabOrder = 6
  end
  object Panel3: TPanel
    Left = 573
    Top = 260
    Width = 9
    Height = 325
    TabOrder = 7
  end
  object Panel4: TPanel
    Left = 0
    Top = 586
    Width = 584
    Height = 11
    Align = alBottom
    TabOrder = 8
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'dbf'
    Left = 432
    Top = 64
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'txt'
    Filter = '*.txt|*.txt'
    Left = 536
    Top = 224
  end
end
