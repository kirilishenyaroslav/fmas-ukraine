object frmArray: TfrmArray
  Left = 849
  Top = 359
  Width = 431
  Height = 471
  Caption = #1057#1086#1076#1077#1088#1078#1080#1084#1086#1077' '#1084#1072#1089#1089#1080#1074#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 417
    Width = 423
    Height = 27
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      423
      27)
    object cxButton1: TcxButton
      Left = 332
      Top = 2
      Width = 91
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Tag = 1
      Left = 2
      Top = 2
      Width = 63
      Height = 25
      Cancel = True
      Caption = #1069#1082#1089#1087#1086#1088#1090
      TabOrder = 1
      OnClick = cxButton2Click
    end
    object cxButton3: TcxButton
      Tag = 2
      Left = 74
      Top = 2
      Width = 119
      Height = 25
      Cancel = True
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1082#1072#1082' '#1076#1077#1088#1077#1074#1086
      TabOrder = 2
      OnClick = cxButton2Click
    end
  end
  object tl: TcxTreeList
    Left = 0
    Top = 0
    Width = 423
    Height = 417
    Styles.StyleSheet = TreeListStyleSheetDevExpress
    Align = alClient
    Bands = <
      item
        Caption.Text = 'Band1'
        Width = 200
      end>
    BufferedPaint = False
    LookAndFeel.Kind = lfFlat
    OptionsBehavior.ExpandOnIncSearch = True
    OptionsBehavior.IncSearchItem = tlcxTreeListColumn1
    OptionsBehavior.IncSearch = True
    OptionsCustomizing.BandCustomizing = False
    OptionsCustomizing.BandHorzSizing = False
    OptionsCustomizing.BandMoving = False
    OptionsCustomizing.BandVertSizing = False
    OptionsCustomizing.ColumnCustomizing = False
    OptionsCustomizing.ColumnMoving = False
    OptionsCustomizing.ColumnVertSizing = False
    OptionsData.Editing = False
    OptionsData.Deleting = False
    OptionsSelection.CellSelect = False
    OptionsView.ColumnAutoWidth = True
    OptionsView.GridLines = tlglBoth
    TabOrder = 1
    OnCustomDrawCell = tlCustomDrawCell
    OnKeyDown = tlKeyDown
    object tlcxTreeListColumn1: TcxTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.Text = #1050#1083#1102#1095
      DataBinding.ValueType = 'String'
      Options.Customizing = False
      Options.Editing = False
      Options.Focusing = False
      Options.Moving = False
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      Width = 136
    end
    object tlcxTreeListColumn2: TcxTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.Text = #1047#1085#1072#1095#1077#1085#1080#1077
      DataBinding.ValueType = 'String'
      Options.Customizing = False
      Options.Editing = False
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      Width = 206
    end
    object tlcxTreeListColumn3: TcxTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.Text = #1058#1080#1087
      DataBinding.ValueType = 'String'
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
      Width = 79
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 8
    Top = 24
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clMoneyGreen
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = clBtnFace
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clMoneyGreen
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clMoneyGreen
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14084566
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16711164
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clSilver
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clNavy
      TextColor = clWhite
    end
    object TreeListStyleSheetDevExpress: TcxTreeListStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle5
      Styles.Inactive = cxStyle9
      Styles.Selection = cxStyle13
      Styles.BandBackground = cxStyle2
      Styles.BandHeader = cxStyle3
      Styles.ColumnHeader = cxStyle4
      Styles.ContentEven = cxStyle6
      Styles.ContentOdd = cxStyle7
      Styles.Footer = cxStyle8
      Styles.IncSearch = cxStyle10
      Styles.Indicator = cxStyle11
      Styles.Preview = cxStyle12
      BuiltIn = True
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.txt'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099'(*.txt)|*.txt|'#1042#1089#1077' '#1092#1072#1081#1083#1099'(*.*)|*.*'
    Left = 40
    Top = 24
  end
end
