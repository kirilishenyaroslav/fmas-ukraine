object TaxInvoicesFilterSubdivisionForm: TTaxInvoicesFilterSubdivisionForm
  Left = 444
  Top = 210
  BorderStyle = bsDialog
  Caption = 'TaxInvoicesFilterSubdivisionForm'
  ClientHeight = 257
  ClientWidth = 532
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
  object ImportPanel: TGroupBox
    Left = 8
    Top = 192
    Width = 513
    Height = 57
    Caption = #1042#1110#1076#1073#1110#1088' '#1076#1072#1085#1080#1093
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object StartBtn: TcxButton
      Left = 192
      Top = 20
      Width = 137
      Height = 25
      Caption = #1055#1086#1095#1072#1090#1080
      TabOrder = 0
      OnClick = StartBtnClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 8
    Width = 513
    Height = 57
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object NaklLabel: TcxLabel
      Left = 0
      Top = 21
      Width = 513
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      Caption = #1060#1110#1083#1100#1090#1088' '#1087#1086#1076#1072#1090#1082#1086#1074#1080#1093' '#1085#1072#1082#1083#1072#1076#1085#1080#1093' ('#1087#1110#1076#1088#1086#1079#1076#1110#1083')'
    end
  end
  object PeriodGroupBox: TGroupBox
    Left = 8
    Top = 128
    Width = 513
    Height = 57
    Caption = #1055#1077#1088#1110#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object ZLabel: TcxLabel
      Left = 80
      Top = 24
      Width = 18
      Height = 20
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      Caption = #1079
    end
    object POLabel: TcxLabel
      Left = 280
      Top = 24
      Width = 27
      Height = 20
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Caption = #1087#1086
    end
    object DateBegDateEdit: TcxDateEdit
      Left = 104
      Top = 24
      Width = 121
      Height = 24
      ParentFont = False
      Properties.ShowTime = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
      EditValue = 0d
    end
    object DateEndDateEdit: TcxDateEdit
      Left = 304
      Top = 24
      Width = 121
      Height = 24
      ParentFont = False
      Properties.ShowTime = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
      EditValue = 0d
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 72
    Width = 513
    Height = 49
    Caption = #1042#1080#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object VidNaklRadioButton: TRadioButton
      Left = 64
      Top = 24
      Width = 177
      Height = 17
      Caption = #1042#1080#1076#1072#1085#1110' '#1087#1086#1076'. '#1085#1072#1082#1076#1072#1076#1085#1110
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object OtrNaklRadioButton: TRadioButton
      Left = 256
      Top = 24
      Width = 209
      Height = 17
      Caption = #1054#1090#1088#1080#1084#1072#1085#1110' '#1087#1086#1076'. '#1085#1072#1082#1083#1072#1076#1085#1110
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
end
