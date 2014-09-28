object fmPersonPrint: TfmPersonPrint
  Left = 454
  Top = 361
  BorderStyle = bsDialog
  Caption = #1044#1088#1091#1082' '#1089#1087#1088#1072#1074#1082#1080' ('#1092#1110#1079'.'#1086#1089#1086#1073#1072')'
  ClientHeight = 138
  ClientWidth = 473
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 473
    Height = 138
    Align = alClient
    TabOrder = 0
    object YesBtn: TcxButton
      Left = 288
      Top = 104
      Width = 75
      Height = 25
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = YesBtnClick
      LookAndFeel.Kind = lfFlat
    end
    object CancelBtn: TcxButton
      Left = 376
      Top = 104
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = CancelBtnClick
      LookAndFeel.Kind = lfFlat
    end
    object BoxKodSetup: TcxGroupBox
      Left = 1
      Top = 1
      Width = 471
      Height = 48
      Align = alTop
      Alignment = alTopLeft
      Caption = #1055#1077#1088#1110#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      TabStop = False
      object Label1: TLabel
        Left = 24
        Top = 22
        Width = 8
        Height = 26
        Caption = #1079#13#10
      end
      object Label2: TLabel
        Left = 248
        Top = 22
        Width = 15
        Height = 13
        Caption = #1087#1086
      end
      object MonthesListBeg: TcxComboBox
        Left = 33
        Top = 18
        Width = 104
        Height = 21
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'January'
          'February')
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 0
      end
      object YearSpinEditBeg: TcxSpinEdit
        Left = 135
        Top = 18
        Width = 82
        Height = 21
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxValue = 2100.000000000000000000
        Properties.MinValue = 1995.000000000000000000
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 1
        Value = 2000
      end
      object MonthesListEnd: TcxComboBox
        Left = 265
        Top = 18
        Width = 104
        Height = 21
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'January'
          'February')
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 2
      end
      object YearSpinEditEnd: TcxSpinEdit
        Left = 367
        Top = 18
        Width = 82
        Height = 21
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxValue = 2100.000000000000000000
        Properties.MinValue = 1995.000000000000000000
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 3
        Value = 2000
      end
    end
    object BoxDataFilter: TcxGroupBox
      Left = 1
      Top = 49
      Width = 471
      Height = 48
      Align = alTop
      Alignment = alTopLeft
      Caption = #1060#1110#1079#1080#1095#1085#1072' '#1086#1089#1086#1073#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      TabStop = False
      object EditDataFilter: TcxButtonEdit
        Left = 21
        Top = 18
        Width = 68
        Height = 21
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d?\d?\d?\d?\d?\d?\d?\d?'
        Properties.MaxLength = 0
        Properties.ReadOnly = False
        Properties.OnButtonClick = EditDataFilterPropertiesButtonClick
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 0
        OnExit = EditDataFilterExit
      end
      object LabelManData: TcxLabel
        Left = 89
        Top = 18
        Width = 376
        Height = 21
        AutoSize = False
        ParentColor = False
        ParentFont = False
        Style.BorderColor = clInactiveCaption
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
  end
end
