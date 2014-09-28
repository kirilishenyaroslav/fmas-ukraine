object MainForm: TMainForm
  Left = 692
  Top = 361
  BorderStyle = bsDialog
  Caption = #1045#1082#1089#1087#1086#1088#1090' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1086#1074#1080#1093' '#1076#1072#1085#1085#1080#1093
  ClientHeight = 271
  ClientWidth = 444
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
    Top = 184
    Width = 425
    Height = 81
    Caption = #1045#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1080#1093
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
      Left = 176
      Top = 48
      Width = 75
      Height = 25
      Caption = #1055#1086#1095#1072#1090#1080
      TabOrder = 0
      OnClick = StartBtnClick
    end
    object ProgressBar: TcxProgressBar
      Left = 40
      Top = 24
      Width = 345
      Height = 21
      TabOrder = 1
    end
  end
  object FileOpenGroup: TGroupBox
    Left = 8
    Top = 8
    Width = 425
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
    object eFileNameEdit: TcxButtonEdit
      Left = 16
      Top = 24
      Width = 393
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
      Text = 'eFileNameEdit'
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 72
    Width = 425
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
      Left = 8
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
      Left = 156
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
    Top = 128
    Width = 425
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
      Left = 8
      Top = 18
      Width = 60
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
      Left = 68
      Top = 18
      Width = 353
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
  object SaveDialog: TSaveDialog
    DefaultExt = 'dbf'
    Filter = '*.dbf|*.dbf'
    Left = 400
    Top = 56
  end
  object DbfExport: THalcyonDataSet
    AutoFlush = False
    Exclusive = False
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TranslateASCII = False
    UseDeleted = False
    UserID = 0
    Left = 400
    Top = 88
  end
  object CreateDBAccount: TCreateHalcyonDataSet
    AutoOverwrite = False
    DBFTable = DbfExport
    DBFType = DBaseIV
    Left = 400
    Top = 120
  end
end
