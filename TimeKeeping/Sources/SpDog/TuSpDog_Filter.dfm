object Form3: TForm3
  Left = 450
  Top = 113
  Width = 489
  Height = 301
  Caption = 'Form3'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 473
    Height = 227
    Align = alClient
    TabOrder = 0
    object cxGroupBox3: TcxGroupBox
      Left = 4
      Top = 54
      Width = 463
      Height = 55
      Alignment = alTopLeft
      TabOrder = 0
      object EditMan: TcxButtonEdit
        Left = 37
        Top = 27
        Width = 420
        Height = 21
        Enabled = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        TabOrder = 0
      end
      object CheckBoxMan: TcxCheckBox
        Left = 6
        Top = 8
        Width = 121
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1060#1110#1079#1080#1095#1085#1072' '#1086#1089#1086#1073#1072
        TabOrder = 1
      end
    end
    object cxGroupBox5: TcxGroupBox
      Left = 4
      Top = 111
      Width = 464
      Height = 55
      Alignment = alTopLeft
      TabOrder = 1
      object CheckBoxWorkMode: TcxCheckBox
        Left = 6
        Top = 6
        Width = 248
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Properties.Caption = #1056#1077#1078#1080#1084
        TabOrder = 0
      end
      object EditWorkMode: TcxButtonEdit
        Left = 36
        Top = 27
        Width = 421
        Height = 21
        Enabled = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        TabOrder = 1
      end
    end
    object GroupBoxPeriod: TcxGroupBox
      Left = 3
      Top = 3
      Width = 464
      Height = 52
      Alignment = alTopLeft
      TabOrder = 2
      object CheckBoPeriod: TcxCheckBox
        Left = 5
        Top = 5
        Width = 121
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1055#1077#1088#1110#1086#1076
        TabOrder = 0
      end
      object EditDateEnd: TcxDateEdit
        Left = 284
        Top = 23
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object cxLabel4: TcxLabel
        Left = 218
        Top = 25
        Width = 67
        Height = 17
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 2
        Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103':'
      end
      object EditDateBeg: TcxDateEdit
        Left = 72
        Top = 24
        Width = 121
        Height = 21
        TabOrder = 3
      end
      object cxLabel3: TcxLabel
        Left = 21
        Top = 25
        Width = 53
        Height = 17
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 4
        Caption = #1055#1086#1095#1072#1090#1086#1082':'
      end
    end
    object cxGroupBox1: TcxGroupBox
      Left = 4
      Top = 165
      Width = 464
      Height = 55
      Alignment = alTopLeft
      TabOrder = 3
      object CheckBoxTemplet: TcxCheckBox
        Left = 6
        Top = 6
        Width = 248
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Properties.Caption = #1064#1072#1073#1083#1086#1085
        TabOrder = 0
      end
      object EditTemplet: TcxButtonEdit
        Left = 36
        Top = 27
        Width = 421
        Height = 21
        Enabled = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        TabOrder = 1
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 227
    Width = 473
    Height = 36
    Align = alBottom
    TabOrder = 1
    object ButtonYes: TcxButton
      Left = 251
      Top = 5
      Width = 75
      Height = 25
      Action = ActionYes
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
    end
    object ButtonCancel: TcxButton
      Left = 329
      Top = 5
      Width = 75
      Height = 25
      Action = ActionCancel
      TabOrder = 1
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
    end
  end
  object ActionList: TActionList
    Left = 433
    Top = 65535
    object ActionYes: TAction
      Caption = #1054#1073#1088#1072#1090#1080
      ShortCut = 13
    end
    object ActionCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      ShortCut = 27
    end
  end
end
