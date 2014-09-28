object ImportXMLReestrForm: TImportXMLReestrForm
  Left = 474
  Top = 296
  BorderStyle = bsDialog
  Caption = 'ImportXMLReestrForm'
  ClientHeight = 304
  ClientWidth = 441
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
    Caption = #1054#1073#1077#1088#1110#1090#1100' '#1092#1072#1081#1083'  .xml'
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
    Top = 240
    Width = 425
    Height = 57
    Caption = #1030#1084#1087#1086#1088#1090' '#1076#1072#1085#1085#1080#1093
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object StartBtn: TcxButton
      Left = 176
      Top = 16
      Width = 75
      Height = 25
      Caption = #1055#1086#1095#1072#1090#1080
      TabOrder = 0
      OnClick = StartBtnClick
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
      TabOrder = 1
      Caption = #8470' '#1088#1077#1108#1089#1090#1088#1091
    end
    object PeriodValLabel: TcxLabel
      Left = 64
      Top = 16
      Width = 94
      Height = 17
      AutoSize = False
      TabOrder = 2
    end
    object NumReestrValLabel: TcxLabel
      Left = 280
      Top = 16
      Width = 113
      Height = 17
      AutoSize = False
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
      Left = 96
      Top = 13
      Width = 241
      Height = 20
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      Caption = #1030#1084#1087#1086#1088#1090' '#1085#1072#1082#1083#1072#1076#1085#1080#1093' '#1079' XML-'#1092#1072#1081#1083#1091
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 168
    Width = 425
    Height = 65
    Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083', '#1076#1072#1085#1085#1110' '#1103#1082#1086#1111' '#1110#1084#1087#1086#1088#1090#1091#1102#1090#1100#1089#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object SubdivisionButtonEdit: TcxButtonEdit
      Left = 16
      Top = 24
      Width = 393
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = SubdivisionButtonEditPropertiesButtonClick
      TabOrder = 0
      Text = 'SubdivisionButtonEdit'
    end
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'xml'
    Filter = '*.xml'
    Left = 384
    Top = 64
  end
  object OpenDialog: TOpenDialog
    Left = 344
    Top = 64
  end
end
