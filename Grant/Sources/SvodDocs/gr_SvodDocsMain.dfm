object GrFOptionsSvod: TGrFOptionsSvod
  Left = 253
  Top = 643
  Width = 720
  Height = 51
  AlphaBlend = True
  Caption = 'GrFOptionsSvod'
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object dxBarDockControl1: TdxBarDockControl
    Left = 0
    Top = 0
    Width = 712
    Height = 24
    Align = dalTop
    BarManager = dxBarManager
  end
  object dxBarManager: TdxBarManager
    AllowReset = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = 'Main'
        DockControl = dxBarDockControl1
        DockedDockControl = dxBarDockControl1
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 292
        FloatTop = 377
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = LabelKodSetup
            Visible = True
          end
          item
            Item = MonthesList
            Visible = True
          end
          item
            Item = YearSpinEdit
            Visible = True
          end
          item
            Item = SvodSub
            Visible = True
          end
          item
            BeginGroup = True
            Item = ReestrSub
            Visible = True
          end
          item
            BeginGroup = True
            Item = RaschVedBtn
            Visible = True
          end
          item
            Item = ExitBtn
            Visible = True
          end>
        Name = 'Main'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        ShowMark = False
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = True
      end>
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    Style = bmsOffice11
    SunkenBorder = True
    UseSystemFont = True
    Left = 544
    DockControlHeights = (
      0
      0
      0
      0)
    object YearSpinEdit: TdxBarSpinEdit
      Caption = 'YearSpin'
      Category = 0
      Hint = 'YearSpin'
      Visible = ivAlways
      Width = 100
      MaxValue = 2100.000000000000000000
      MinValue = 1995.000000000000000000
      Value = 1995.000000000000000000
    end
    object SvodSub: TdxBarSubItem
      Caption = 'SvodSub'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = SvodBySchBtn
          Visible = True
        end
        item
          Item = dxBarButton1
          Visible = True
        end
        item
          Item = SvodBySmBtn
          Visible = True
        end
        item
          Item = SvodByDepartmentBtn
          Visible = True
        end>
    end
    object ReestrSub: TdxBarSubItem
      Caption = 'ReestrSub'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = ReeAlimonyBtn
          Visible = True
        end>
    end
    object RaschVedBtn: TdxBarButton
      Caption = 'RaschVedBtn'
      Category = 0
      Hint = 'RaschVedBtn'
      Visible = ivAlways
      OnClick = RaschVedBtnClick
    end
    object LabelKodSetup: TdxBarStatic
      Caption = 'LabelKodSetup:'
      Category = 0
      Hint = 'LabelKodSetup:'
      Visible = ivAlways
    end
    object MonthesList: TdxBarCombo
      Caption = 'MonthesList'
      Category = 0
      Hint = 'MonthesList'
      Visible = ivAlways
      Width = 100
      ShowEditor = False
      ItemIndex = -1
    end
    object SvodBySchBtn: TdxBarButton
      Caption = 'SvodBySchBtn'
      Category = 0
      Hint = 'SvodBySchBtn'
      Visible = ivAlways
      OnClick = SvodBySchBtnClick
    end
    object SvodByDepartmentBtn: TdxBarButton
      Caption = 'SvodByDepartmentBtn'
      Category = 0
      Hint = 'SvodByDepartmentBtn'
      Visible = ivAlways
      OnClick = SvodByDepartmentBtnClick
    end
    object ReeAlimonyBtn: TdxBarButton
      Caption = 'ReeAlimonyBtn'
      Category = 0
      Hint = 'ReeAlimonyBtn'
      Visible = ivAlways
    end
    object ExitBtn: TdxBarButton
      Align = iaRight
      Caption = 'ExitBtn'
      Category = 0
      Hint = 'ExitBtn'
      Visible = ivAlways
      ShortCut = 27
      OnClick = ExitBtnClick
    end
    object dxBarButton1: TdxBarButton
      Caption = #1047#1072#1075#1072#1083#1100#1085#1080#1081' '#1079#1074#1110#1090
      Category = 0
      Hint = #1047#1072#1075#1072#1083#1100#1085#1080#1081' '#1079#1074#1110#1090
      Visible = ivAlways
      OnClick = dxBarButton1Click
    end
    object SvodBySmBtn: TdxBarButton
      Caption = #1047#1074#1110#1090' '#1079#1072' '#1089#1084#1077#1090#1086#1102
      Category = 0
      Hint = #1047#1074#1110#1090' '#1079#1072' '#1089#1084#1077#1090#1086#1102
      Visible = ivAlways
    end
  end
end
