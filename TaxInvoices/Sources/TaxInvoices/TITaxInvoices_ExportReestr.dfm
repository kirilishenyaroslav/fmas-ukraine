object ExportReestrForm: TExportReestrForm
  Left = 608
  Top = 405
  BorderStyle = bsDialog
  Caption = 'ExportReestrForm'
  ClientHeight = 254
  ClientWidth = 440
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
  object FileOpenGroup: TGroupBox
    Left = 8
    Top = 96
    Width = 425
    Height = 65
    Caption = #1050#1091#1076#1080' '#1090#1088#1077#1073#1072' '#1077#1082#1089#1087#1086#1088#1090#1091#1074#1072#1090#1080' ('#1092#1072#1081#1083' .dbf)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
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
      Properties.ReadOnly = True
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
  object ImportPanel: TGroupBox
    Left = 8
    Top = 168
    Width = 425
    Height = 81
    Caption = #1045#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1080#1093
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 0
    Width = 425
    Height = 49
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object PeriodLabel: TcxLabel
      Left = 8
      Top = 16
      Width = 58
      Height = 20
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      Caption = #1087#1077#1088#1110#1086#1076
    end
    object PeriodDBTextEdit: TcxDBTextEdit
      Left = 64
      Top = 16
      Width = 121
      Height = 21
      DataBinding.DataField = 'KOD_SETUP_OUT'
      DataBinding.DataSource = TaxInvoicesDM.ReestrDSource
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clMenuBar
      TabOrder = 1
    end
    object NumReestrLabel: TcxLabel
      Left = 192
      Top = 16
      Width = 89
      Height = 20
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
      Caption = #8470' '#1088#1077#1108#1089#1090#1088#1091
    end
    object NumReestrDBTextEdit: TcxDBTextEdit
      Left = 280
      Top = 16
      Width = 105
      Height = 21
      DataBinding.DataField = 'num_reestr'
      DataBinding.DataSource = TaxInvoicesDM.ReestrDSource
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Style.Color = clMenuBar
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 48
    Width = 425
    Height = 41
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object NaklLabel: TcxLabel
      Left = 88
      Top = 13
      Width = 265
      Height = 20
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      Caption = #1045#1082#1089#1087#1086#1088#1090' '#1086#1090#1088#1080#1084#1072#1085#1080#1093' '#1085#1072#1082#1083#1072#1076#1085#1080#1093
    end
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'dbf'
    Filter = '*.dbf|*.dbf'
    Left = 384
    Top = 64
  end
end
