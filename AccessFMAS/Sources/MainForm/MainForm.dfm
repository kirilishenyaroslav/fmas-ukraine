object FormMain: TFormMain
  Left = 306
  Top = 168
  Width = 742
  Height = 547
  Caption = #1057#1080#1089#1090#1077#1084#1072' '#1091#1087#1088#1072#1074#1083#1110#1085#1085#1103' '#1076#1086#1089#1090#1091#1087#1086#1084
  Color = clGrayText
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbNativeCustomer: TLabel
    Left = 16
    Top = 72
    Width = 11
    Height = 37
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSilver
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 490
    Width = 726
    Height = 19
    Panels = <
      item
        Width = 250
      end>
  end
  object dxBarManager1: TdxBarManager
    AutoDockColor = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Bars = <
      item
        Caption = 'Main Menu'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 0
        FloatTop = 0
        FloatClientWidth = 0
        FloatClientHeight = 0
        IsMainMenu = True
        ItemLinks = <
          item
            Item = N1
            Visible = True
          end
          item
            Item = N4
            Visible = True
          end
          item
            Item = N10
            Visible = True
          end
          item
            Item = N2
            Visible = True
          end>
        MultiLine = True
        Name = 'Main Menu'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.Strings = (
      'Default'
      #1056#1086#1073#1086#1090#1072
      #1044#1086#1074#1110#1076#1085#1080#1082#1080
      #1044#1086#1074#1110#1076#1082#1072
      'Menus')
    Categories.ItemsVisibles = (
      2
      2
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True
      True
      True)
    DockColor = clBtnFace
    NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    Style = bmsOffice11
    UseSystemFont = True
    Left = 8
    Top = 40
    DockControlHeights = (
      0
      0
      26
      0)
    object N1: TdxBarSubItem
      Caption = #1056#1086#1073#1086#1090#1072
      Category = 4
      Visible = ivAlways
      ItemLinks = <
        item
          Item = N3
          Visible = True
        end
        item
          Item = N7
          Visible = True
        end
        item
          Item = SetCryptPAssword
          Visible = True
        end
        item
          Item = dxBarButton1
          Visible = True
        end
        item
          Item = N9
          Visible = True
        end
        item
          Item = dxBarButton2
          Visible = True
        end>
    end
    object N3: TdxBarButton
      Caption = #1054#1073'`'#1108#1082#1090#1080' '#1090#1072' '#1076#1110#1111
      Category = 1
      Visible = ivAlways
      ImageIndex = 14
      OnClick = N3Click
    end
    object N7: TdxBarButton
      Caption = #1043#1088#1091#1087#1080' '#1090#1072' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110
      Category = 1
      Visible = ivAlways
      OnClick = N7Click
    end
    object SetCryptPAssword: TdxBarButton
      Caption = #1047#1084#1110#1085#1080#1090#1080' '#1079#1072#1082#1088#1080#1087#1090#1086#1074#1072#1085#1080#1081' '#1087#1072#1088#1086#1083#1100' '#1076#1086#1089#1090#1091#1087#1091' '#1076#1086' '#1041#1044
      Category = 1
      Visible = ivAlways
      OnClick = SetCryptPAsswordClick
    end
    object N9: TdxBarButton
      Caption = #1057#1075#1077#1085#1077#1088#1091#1074#1072#1090#1080' '#1061#1045#1064'-'#1087#1072#1088#1086#1083#1110
      Category = 1
      Visible = ivAlways
      OnClick = N9Click
    end
    object N4: TdxBarSubItem
      Caption = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Category = 4
      Visible = ivAlways
      ItemLinks = <
        item
          Item = N5
          Visible = True
        end
        item
          Item = N6
          Visible = True
        end
        item
          Item = N8
          Visible = True
        end>
    end
    object N5: TdxBarButton
      Caption = #1044#1110#1111
      Category = 2
      Visible = ivAlways
      ImageIndex = 10
      OnClick = N5Click
    end
    object N6: TdxBarButton
      Caption = #1043#1088#1091#1087#1080
      Category = 2
      Visible = ivAlways
      ImageIndex = 12
      OnClick = N6Click
    end
    object N8: TdxBarButton
      Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110
      Category = 2
      Visible = ivAlways
      ImageIndex = 13
      OnClick = N8Click
    end
    object N10: TdxBarSubItem
      Caption = #1044#1086#1074#1110#1076#1082#1072
      Category = 4
      Visible = ivAlways
      ItemLinks = <
        item
          Item = N11
          Visible = True
        end>
    end
    object N2: TdxBarButton
      Caption = #1055#1088#1086' '#1087#1088#1086#1075#1088#1072#1084#1091
      Category = 3
      Visible = ivAlways
      OnClick = N2Click
    end
    object N11: TdxBarButton
      Caption = #1040#1082#1090#1080#1074#1085#1110' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110
      Category = 3
      Visible = ivAlways
      OnClick = N11Click
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object CustomdxBarCombo1: TCustomdxBarCombo
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Width = 100
    end
    object dxBarButton1: TdxBarButton
      Caption = #1047#1084#1110#1085#1080#1090#1080' '#1079#1072#1082#1088#1080#1087#1090#1086#1074#1072#1085#1080#1081' '#1087#1072#1088#1086#1083#1100' '#1076#1086#1089#1090#1091#1087#1091' '#1076#1086' '#1041#1044' '#1079#1086#1073#1088#1072#1078#1077#1085#1100
      Category = 0
      Hint = #1047#1084#1110#1085#1080#1090#1080' '#1079#1072#1082#1088#1080#1087#1090#1086#1074#1072#1085#1080#1081' '#1087#1072#1088#1086#1083#1100' '#1076#1086#1089#1090#1091#1087#1091' '#1076#1086' '#1041#1044' '#1079#1086#1073#1088#1072#1078#1077#1085#1100
      Visible = ivAlways
      OnClick = dxBarButton1Click
    end
    object dxBarButton2: TdxBarButton
      Caption = #1044#1086#1076#1072#1090#1080' '#1087#1072#1088#1086#1083#1100' ZSuperUser'
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080' '#1087#1072#1088#1086#1083#1100' ZSuperUser'
      Visible = ivNever
      OnClick = dxBarButton2Click
    end
  end
end
