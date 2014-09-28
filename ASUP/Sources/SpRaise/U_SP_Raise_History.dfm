object F_SP_Raise_Hist: TF_SP_Raise_Hist
  Left = 173
  Top = 233
  Width = 774
  Height = 497
  Caption = #1030#1089#1090#1086#1088#1110#1103' '#1079#1084#1110#1085
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid: TDBGrid
    Left = 0
    Top = 0
    Width = 766
    Height = 407
    Align = alClient
    Color = clInfoBk
    DataSource = DS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'name'
        Title.Caption = #1053#1072#1079#1074#1072
        Width = 253
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'raise_min'
        Title.Caption = #1052#1110#1085#1110#1084#1091#1084
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'raise_max'
        Title.Caption = #1052#1072#1082#1089#1080#1084#1091#1084
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'raise_default'
        Title.Caption = #1047#1072' '#1079#1074#1080#1095#1072#1108#1084
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'special'
        Title.Caption = #1057#1087#1077#1094#1110#1072#1083#1100#1085#1072
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'use_date_beg'
        Title.Caption = #1055#1086#1095#1072#1090#1086#1082' '#1076#1110#1111
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'use_date_end'
        Title.Caption = #1050#1110#1085#1077#1094' '#1076#1110#1111
        Width = 70
        Visible = True
      end>
  end
  inline SearchFrame: TfmSearch
    Left = 0
    Top = 407
    Width = 766
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    inherited AllLabel: TLabel
      Left = 642
    end
  end
  object DS: TDataSource
    Left = 280
    Top = 128
  end
end
