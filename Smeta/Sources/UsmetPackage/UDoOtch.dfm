object frmDoOtch: TfrmDoOtch
  Left = 294
  Top = 199
  Width = 617
  Height = 359
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1074#1110#1076#1088#1072#1093#1091#1074#1072#1085#1085#1103#1084#1080' '#1084#1110#1078' '#1073#1102#1076#1078#1077#1090#1072#1084#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 280
    Width = 601
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 192
      Top = 8
      Width = 265
      Height = 25
      Caption = #1055#1086#1095#1072#1090#1080' '#1087#1088#1086#1094#1077#1089
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 464
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 601
    Height = 280
    Align = alClient
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 89
      Width = 599
      Height = 190
      Align = alClient
      Caption = 'Panel3'
      TabOrder = 0
      object cxMemo1: TcxMemo
        Left = 1
        Top = 1
        Width = 597
        Height = 188
        Align = alClient
        Lines.Strings = (
          '')
        Properties.ReadOnly = True
        Style.Color = clInfoBk
        TabOrder = 0
      end
      object Panel5: TPanel
        Left = 152
        Top = 72
        Width = 321
        Height = 65
        Caption = #1063#1077#1082#1072#1081#1090#1077', '#1081#1076#1077' '#1088#1086#1079#1088#1072#1093#1091#1085#1086#1082'.'
        TabOrder = 1
        Visible = False
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 599
      Height = 88
      Align = alTop
      TabOrder = 1
      object Label3: TLabel
        Left = 16
        Top = 8
        Width = 296
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091' '#1087#1077#1088#1110#1086#1076#1091' '#1087#1077#1088#1077#1088#1072#1093#1091#1074#1072#1085#1085#1103' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 8
        Top = 33
        Width = 304
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1044#1072#1090#1072' '#1082#1110#1085#1094#1103' '#1087#1077#1088#1110#1086#1076#1091' '#1087#1077#1088#1077#1088#1072#1093#1091#1074#1072#1085#1085#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 10
        Top = 61
        Width = 164
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1030#1085#1076#1110#1082#1072#1090#1086#1088' '#1087#1088#1086#1094#1077#1089#1091
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object cbMonthDateFrom: TComboBox
        Left = 319
        Top = 8
        Width = 128
        Height = 22
        Style = csOwnerDrawFixed
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 16
        ParentFont = False
        TabOrder = 0
        TabStop = False
      end
      object cbYearDateFrom: TComboBox
        Left = 448
        Top = 8
        Width = 79
        Height = 22
        Style = csOwnerDrawFixed
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 16
        ParentFont = False
        TabOrder = 1
        TabStop = False
      end
      object cbMonthDateTo: TComboBox
        Left = 319
        Top = 32
        Width = 129
        Height = 22
        Style = csOwnerDrawFixed
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 16
        ParentFont = False
        TabOrder = 2
        TabStop = False
      end
      object cbYearDateTo: TComboBox
        Left = 449
        Top = 32
        Width = 79
        Height = 22
        Style = csOwnerDrawFixed
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 16
        ParentFont = False
        TabOrder = 3
        TabStop = False
      end
      object CalcProgressBar: TProgressBar
        Left = 184
        Top = 60
        Width = 345
        Height = 21
        TabOrder = 4
        Visible = False
      end
    end
  end
  object WorkDatabase: TpFIBDatabase
    DefaultTransaction = OTransaction
    DefaultUpdateTransaction = OTransaction
    SQLDialect = 3
    Timeout = 0
    SynchronizeTime = False
    DesignDBOptions = []
    UseRepositories = []
    WaitForRestoreConnect = 0
    Left = 8
    Top = 208
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 9
    Top = 241
  end
  object OTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    Timeout = 3000000
    TimeoutAction = TARollback
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 41
    Top = 209
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    Timeout = 3000000
    TimeoutAction = TARollback
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 73
    Top = 209
  end
end
