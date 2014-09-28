object TaxInvoicesFilterCustomerForm: TTaxInvoicesFilterCustomerForm
  Left = 441
  Top = 220
  BorderStyle = bsDialog
  Caption = 'TaxInvoicesFilterCustomerForm'
  ClientHeight = 362
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
    Top = 288
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
    Height = 41
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object NaklLabel: TcxLabel
      Left = 0
      Top = 13
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
      Caption = #1060#1110#1083#1100#1090#1088' '#1087#1086#1076#1072#1090#1082#1086#1074#1080#1093' '#1085#1072#1082#1083#1072#1076#1085#1080#1093' '#1079#1072' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1086#1084
    end
  end
  object PeriodGroupBox: TGroupBox
    Left = 8
    Top = 224
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
      Left = 56
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
      Left = 264
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
      Left = 88
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
    end
    object DateEndDateEdit: TcxDateEdit
      Left = 312
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
    end
  end
  object CustomerGroupBox: TGroupBox
    Left = 8
    Top = 112
    Width = 513
    Height = 105
    Caption = #1082#1086#1085#1090#1088#1072#1075#1077#1085#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object IPNLabel: TLabel
      Left = 24
      Top = 32
      Width = 125
      Height = 16
      Caption = #1030#1055#1053' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object NameCustomerLabel: TLabel
      Left = 24
      Top = 64
      Width = 109
      Height = 16
      Caption = #1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object CustomerButtonEdit: TcxButtonEdit
      Left = 152
      Top = 64
      Width = 337
      Height = 24
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = CustomerButtonEditPropertiesButtonClick
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      Text = 'CustomerButtonEdit'
    end
    object IPNCustomerTextEdit: TEdit
      Left = 155
      Top = 32
      Width = 270
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Text = 'IPNCustomerTextEdit'
      OnKeyPress = IPNCustomerTextEditKeyPress
    end
  end
  object TypeDocumentGroupBox: TcxGroupBox
    Left = 16
    Top = 496
    Width = 513
    Height = 153
    Alignment = alTopLeft
    Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object TypeDocVidNaklButtonEdit: TcxButtonEdit
      Left = 40
      Top = 48
      Width = 449
      Height = 24
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = TypeDocVidNaklButtonEditPropertiesButtonClick
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      Text = 'TypeDocVidNaklButtonEdit'
    end
    object TypeDocVidNaklCheckBox: TCheckBox
      Left = 24
      Top = 24
      Width = 369
      Height = 17
      Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1091' ('#1074#1080#1076#1072#1085#1110' '#1087#1086#1076'. '#1085#1072#1082#1083#1072#1076#1085#1110')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = TypeDocVidNaklCheckBoxClick
    end
    object TypeDocOtrNaklCheckBox: TCheckBox
      Left = 24
      Top = 96
      Width = 409
      Height = 17
      Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1091' ('#1086#1090#1088#1080#1084#1072#1085#1110' '#1087#1086#1076'. '#1085#1072#1082#1083#1072#1076#1085#1110')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = TypeDocOtrNaklCheckBoxClick
    end
    object TypeDocOtrNaklButtonEdit: TcxButtonEdit
      Left = 40
      Top = 120
      Width = 449
      Height = 24
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = TypeDocOtrNaklButtonEditPropertiesButtonClick
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
      Text = 'TypeDocOtrNaklButtonEdit'
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 56
    Width = 513
    Height = 49
    Caption = #1042#1080#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
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
