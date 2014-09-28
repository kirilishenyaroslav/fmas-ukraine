object EditForm: TEditForm
  Left = 635
  Top = 0
  BorderStyle = bsDialog
  Caption = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080
  ClientHeight = 265
  ClientWidth = 372
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 353
    Height = 73
    Caption = #1057#1091#1084#1072
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 18
      Width = 60
      Height = 13
      Caption = #1058#1080#1087' '#1089#1091#1084#1080':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 43
      Width = 35
      Height = 13
      Caption = #1057#1091#1084#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SumEdit: TcxMaskEdit
      Left = 72
      Top = 40
      Width = 73
      Height = 21
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? ([,]\d\d?)?'
      Properties.MaxLength = 0
      TabOrder = 0
    end
    object ConstTypeEdit: TcxTextEdit
      Left = 72
      Top = 16
      Width = 273
      Height = 21
      Properties.ReadOnly = True
      TabOrder = 1
    end
  end
  object OkBtn: TcxButton
    Left = 144
    Top = 234
    Width = 105
    Height = 25
    Caption = #1047#1073#1077#1088#1077#1075#1090#1080
    TabOrder = 1
    OnClick = OkBtnClick
  end
  object CancelBtn: TcxButton
    Left = 256
    Top = 234
    Width = 105
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    ModalResult = 2
    TabOrder = 2
    OnClick = CancelBtnClick
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 152
    Width = 353
    Height = 73
    Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 3
    object Label4: TLabel
      Left = 8
      Top = 20
      Width = 92
      Height = 13
      Caption = #1056#1110#1082' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 176
      Top = 20
      Width = 115
      Height = 13
      Caption = #1052#1110#1089#1103#1094#1100' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object YearEndEdit: TcxSpinEdit
      Left = 104
      Top = 17
      Width = 57
      Height = 21
      TabOrder = 0
      Value = 2006
    end
    object MonthEndEdit: TcxSpinEdit
      Left = 288
      Top = 17
      Width = 57
      Height = 21
      Properties.MaxValue = 12.000000000000000000
      Properties.MinValue = 1.000000000000000000
      TabOrder = 1
      Value = 1
    end
    object NoEndCheckBox: TCheckBox
      Left = 8
      Top = 48
      Width = 97
      Height = 17
      Caption = #1041#1077#1079#1089#1090#1088#1086#1082#1086#1074#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = NoEndCheckBoxClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 88
    Width = 353
    Height = 57
    Caption = #1055#1086#1095#1072#1090#1086#1082
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 4
    object Label2: TLabel
      Left = 8
      Top = 20
      Width = 73
      Height = 13
      Caption = #1056#1110#1082' '#1087#1086#1095#1072#1090#1082#1091':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 176
      Top = 20
      Width = 96
      Height = 13
      Caption = #1052#1110#1089#1103#1094#1100' '#1087#1086#1095#1072#1090#1082#1091':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object YearBegEdit: TcxSpinEdit
      Left = 104
      Top = 17
      Width = 57
      Height = 21
      Properties.OnChange = YearBegEditPropertiesChange
      TabOrder = 0
      Value = 2000
    end
    object MonthBegEdit: TcxSpinEdit
      Left = 288
      Top = 17
      Width = 57
      Height = 21
      Properties.MaxValue = 12.000000000000000000
      Properties.MinValue = 1.000000000000000000
      TabOrder = 1
      Value = 1
    end
  end
  object DB: TpFIBDatabase
    DefaultTransaction = DefaultTransaction
    DefaultUpdateTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 78
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = DefaultTransaction
    Left = 24
    Top = 47
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 24
    Top = 16
  end
end
