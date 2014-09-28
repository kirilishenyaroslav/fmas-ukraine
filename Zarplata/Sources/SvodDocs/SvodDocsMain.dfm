object FOptionsSvod: TFOptionsSvod
  Left = 297
  Top = 301
  Width = 979
  Height = 544
  AlphaBlend = True
  Caption = 'FOptionsSvod'
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
    Width = 963
    Height = 24
    Align = dalTop
    BarManager = dxBarManager
  end
  object dxBarManager: TdxBarManager
    AllowReset = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
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
            Item = dxBarStatic1
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
            Item = dxBarSubItem3
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
    Left = 651
    Top = 29
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
      Caption = #1047#1072#1075#1072#1083#1100#1085#1072' '#1079#1074#1110#1090#1085#1110#1095#1090#1100
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = dxBarSubItem5
          Visible = True
        end
        item
          Item = ReeHospListSub
          Visible = True
        end
        item
          Item = ReeAccrualSingle
          Visible = True
        end
        item
          Item = ReeAccrualSingleForMan
          Visible = True
        end
        item
          Item = ReePererahBtn
          Visible = True
        end
        item
          BeginGroup = True
          Item = SvodByFOTSub
          Visible = True
        end
        item
          Item = SvodByFODBtn
          Visible = True
        end
        item
          Item = SvodByDepartmentBtn
          Visible = True
        end
        item
          Item = SvodOtchislBtn
          Visible = True
        end>
    end
    object ReestrSub: TdxBarSubItem
      Caption = #1047#1074#1110#1090#1085#1110#1089#1090#1100' '#1079#1072' '#1088#1072#1093#1091#1085#1082#1086#1084
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = SvodBySchBtn
          Visible = True
        end
        item
          Item = SvodBySchBtnNP7
          Visible = True
        end
        item
          Item = ReeAccrualSingleBySch
          Visible = True
        end
        item
          Item = dxBarLargeButton2
          Visible = True
        end
        item
          BeginGroup = True
          Item = ReeDutyBtn
          Visible = True
        end
        item
          Item = ReeDopPlatBtn
          Visible = True
        end
        item
          Item = ReeStrahBtn
          Visible = True
        end
        item
          Item = ReeAlimonyBtn
          Visible = True
        end
        item
          Item = ReeOtherUdBtn
          Visible = True
        end
        item
          Item = ReePFUBtn
          Visible = True
        end
        item
          Item = ReeInvalidBtn
          Visible = True
        end
        item
          Item = ReeCreditBtn
          Visible = True
        end
        item
          Item = dxBarLargeButton1
          Visible = True
        end
        item
          BeginGroup = True
          Item = dxBarButton1
          Visible = False
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
    object SvodByFOTSub: TdxBarSubItem
      Caption = #1044#1086#1074#1110#1076#1082#1072' '#1087#1086' '#1060#1054#1055' '#1090#1072' '#1110#1085#1096#1080#1084' '#1074#1080#1087#1083#1072#1090#1072#1084
      Category = 0
      Visible = ivNever
      ItemLinks = <
        item
          Item = SvodByFOTFullBtn
          Visible = True
        end
        item
          Item = SvodByFOTShortBtn
          Visible = True
        end>
    end
    object SvodByFOTFullBtn: TdxBarButton
      Caption = 'SvodByFOTFullBtn'
      Category = 0
      Hint = 'SvodByFOTFullBtn'
      Visible = ivAlways
      OnClick = SvodByFOTFullBtnClick
    end
    object SvodByFOTShortBtn: TdxBarButton
      Caption = 'SvodByFOTShortBtn'
      Category = 0
      Hint = 'SvodByFOTShortBtn'
      Visible = ivAlways
      OnClick = SvodByFOTShortBtnClick
    end
    object SvodByDepartmentBtn: TdxBarButton
      Caption = 'SvodByDepartmentBtn'
      Category = 0
      Hint = 'SvodByDepartmentBtn'
      Visible = ivNever
      OnClick = SvodByDepartmentBtnClick
    end
    object SvodByFODBtn: TdxBarButton
      Caption = 'SvodByFODBtn'
      Category = 0
      Hint = 'SvodByFODBtn'
      Visible = ivNever
      OnClick = SvodByFODBtnClick
    end
    object ReeHospListSub: TdxBarSubItem
      Caption = 'ReeHospListSub'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = ReeHospListByTnBtn
          Visible = True
        end
        item
          Item = ReeHospListByDepartmentBtn
          Visible = True
        end>
    end
    object ReeHospListByTnBtn: TdxBarButton
      Caption = 'ReeHospListByTnBtn'
      Category = 0
      Hint = 'ReeHospListByTnBtn'
      Visible = ivAlways
      OnClick = ReeHospListByTnBtnClick
    end
    object ReeHospListByDepartmentBtn: TdxBarButton
      Caption = 'ReeHospListByDepartmentBtn'
      Category = 0
      Hint = 'ReeHospListByDepartmentBtn'
      Visible = ivAlways
      OnClick = ReeHospListByDepartmentBtnClick
    end
    object ReeDutyBtn: TdxBarButton
      Caption = #1056#1077#1108#1089#1090#1088' '#1073#1086#1088#1075#1110#1074
      Category = 0
      Hint = #1056#1077#1108#1089#1090#1088' '#1073#1086#1088#1075#1110#1074
      Visible = ivAlways
      OnClick = ReeDutyBtnClick
    end
    object ReeDopPlatBtn: TdxBarButton
      Caption = #1056#1077#1108#1089#1090#1088' '#1076#1086#1076#1072#1090#1082#1086#1074#1080#1093' '#1087#1083#1072#1090#1077#1078#1110#1074
      Category = 0
      Hint = #1056#1077#1108#1089#1090#1088' '#1076#1086#1076#1072#1090#1082#1086#1074#1080#1093' '#1087#1083#1072#1090#1077#1078#1110#1074
      Visible = ivAlways
      OnClick = ReeDopPlatBtnClick
    end
    object ReeStrahBtn: TdxBarButton
      Caption = #1056#1077#1108#1089#1090#1088' '#1089#1090#1088#1072#1093#1086#1074#1080#1093' '#1074#1085#1077#1089#1082#1110#1074
      Category = 0
      Hint = #1056#1077#1108#1089#1090#1088' '#1089#1090#1088#1072#1093#1086#1074#1080#1093' '#1074#1085#1077#1089#1082#1110#1074
      Visible = ivAlways
      OnClick = ReeStrahBtnClick
    end
    object ReeAlimonyBtn: TdxBarButton
      Caption = #1056#1077#1108#1089#1090#1088' '#1072#1083#1110#1084#1077#1085#1090#1110#1074' '#1090#1072' '#1110#1085#1096#1080#1093' '#1074#1080#1082'. '#1083#1080#1089#1090#1110#1074
      Category = 0
      Hint = #1056#1077#1108#1089#1090#1088' '#1072#1083#1110#1084#1077#1085#1090#1110#1074' '#1090#1072' '#1110#1085#1096#1080#1093' '#1074#1080#1082'. '#1083#1080#1089#1090#1110#1074
      Visible = ivAlways
      OnClick = ReeAlimonyBtnClick
    end
    object ReeOtherUdBtn: TdxBarButton
      Caption = #1056#1077#1108#1089#1090#1088' '#1110#1085#1096#1080#1093' '#1091#1090#1088#1080#1084#1072#1085#1100
      Category = 0
      Hint = #1056#1077#1108#1089#1090#1088' '#1110#1085#1096#1080#1093' '#1091#1090#1088#1080#1084#1072#1085#1100
      Visible = ivAlways
      OnClick = ReeOtherUdBtnClick
    end
    object ReePFUBtn: TdxBarButton
      Caption = #1056#1077#1108#1089#1090#1088' '#1074#1110#1076#1088#1072#1093#1091#1074#1072#1085#1100' '#1076#1086' '#1055#1044#1060#1059#13#10
      Category = 0
      Hint = #1056#1077#1108#1089#1090#1088' '#1074#1110#1076#1088#1072#1093#1091#1074#1072#1085#1100' '#1076#1086' '#1055#1044#1060#1059#13#10
      Visible = ivNever
      OnClick = ReePFUBtnClick
    end
    object ReeMoreSumBtn: TdxBarButton
      Caption = #1056#1077#1108#1089#1090#1088' '#1110#1085#1074#1072#1083#1110#1076#1110#1074
      Category = 0
      Hint = #1056#1077#1108#1089#1090#1088' '#1110#1085#1074#1072#1083#1110#1076#1110#1074
      Visible = ivAlways
      OnClick = ReeInvalidBtn2Click
    end
    object ReeInvalidBtn: TdxBarButton
      Caption = #1056#1077#1108#1089#1090#1088' '#1110#1085#1074#1072#1083#1110#1076#1110#1074
      Category = 0
      Hint = #1056#1077#1108#1089#1090#1088' '#1110#1085#1074#1072#1083#1110#1076#1110#1074
      Visible = ivNever
      OnClick = ReeInvalidBtnClick
    end
    object ReePererahBtn: TdxBarButton
      Caption = #1056#1077#1108#1089#1090#1088' '#1087#1077#1088#1077#1088#1072#1093#1091#1085#1082#1110#1074
      Category = 0
      Hint = #1056#1077#1108#1089#1090#1088' '#1087#1077#1088#1077#1088#1072#1093#1091#1085#1082#1110#1074
      Visible = ivAlways
      OnClick = ReePererahBtnClick
    end
    object ReeCreditBtn: TdxBarButton
      Caption = #1056#1077#1108#1089#1090#1088' '#1091#1090#1088#1080#1084#1072#1085#1085#1103' '#1082#1088#1077#1076#1080#1090#1110#1074
      Category = 0
      Hint = #1056#1077#1108#1089#1090#1088' '#1091#1090#1088#1080#1084#1072#1085#1085#1103' '#1082#1088#1077#1076#1080#1090#1110#1074
      Visible = ivNever
      OnClick = ReeCreditBtnClick
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
    object dxBarStatic1: TdxBarStatic
      Category = 0
      Enabled = False
      Visible = ivAlways
      ShowCaption = False
    end
    object SvodOtchislBtn: TdxBarButton
      Caption = 'SvodOtchislBtn'
      Category = 0
      Hint = 'SvodOtchislBtn'
      Visible = ivNever
      OnClick = SvodOtchislBtnClick
    end
    object dxBarButton1: TdxBarButton
      Caption = #1047#1072#1075#1072#1083#1100#1085#1080#1081' '#1079#1074#1110#1090
      Category = 0
      Hint = #1047#1072#1075#1072#1083#1100#1085#1080#1081' '#1079#1074#1110#1090
      Visible = ivNever
      OnClick = dxBarButton1Click
    end
    object SvodBySmBtn: TdxBarButton
      Caption = #1047#1074#1110#1090' '#1087#1088#1086' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1090#1072' '#1091#1090#1088#1080#1084#1072#1085#1085#1103'('#1047#1072' '#1075#1088#1091#1087#1086#1102' '#1073#1102#1076#1078#1077#1090#1110#1074')'
      Category = 0
      Hint = #1047#1074#1110#1090' '#1087#1088#1086' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1090#1072' '#1091#1090#1088#1080#1084#1072#1085#1085#1103'('#1047#1072' '#1075#1088#1091#1087#1086#1102' '#1073#1102#1076#1078#1077#1090#1110#1074')'
      Visible = ivAlways
      OnClick = SvodBySmBtnClick
    end
    object ReeInvalidBtn2: TdxBarButton
      Caption = #1056#1077#1108#1089#1090#1088' '#1110#1085#1074#1072#1083#1110#1076#1110#1074' '#1074' '#1088#1086#1079#1088#1110#1079#1110' '#1082#1086#1096#1090#1086#1088#1080#1089#1110#1074
      Category = 0
      Hint = #1056#1077#1108#1089#1090#1088' '#1110#1085#1074#1072#1083#1110#1076#1110#1074' '#1074' '#1088#1086#1079#1088#1110#1079#1110' '#1082#1086#1096#1090#1086#1088#1080#1089#1110#1074
      Visible = ivNever
      OnClick = ReeInvalidBtn2Click
    end
    object dxBarButton2: TdxBarButton
      Caption = #1056#1077#1108#1089#1090#1088' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1100
      Category = 0
      Hint = #1056#1077#1108#1089#1090#1088' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1100
      Visible = ivAlways
    end
    object RaschVedByShifrBtn: TdxBarButton
      Caption = #1047#1072' '#1096#1080#1092#1088#1086#1084
      Category = 0
      Hint = #1047#1072' '#1096#1080#1092#1088#1086#1084
      Visible = ivAlways
      OnClick = RaschVedByShifrBtnClick
    end
    object RaschVedShortBtn: TdxBarButton
      Caption = 'RaschVedShortBtn'
      Category = 0
      Hint = 'RaschVedShortBtn'
      Visible = ivAlways
      OnClick = RaschVedShortBtnClick
    end
    object SvodByGroupSmBtn: TdxBarButton
      Caption = #1047#1074#1110#1090' '#1087#1088#1086' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1090#1072' '#1091#1090#1088#1080#1084#1072#1085#1085#1103'('#1047#1072' '#1087#1088#1086#1075#1088#1072#1084#1086#1102')'
      Category = 0
      Hint = #1047#1074#1110#1090' '#1087#1088#1086' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1090#1072' '#1091#1090#1088#1080#1084#1072#1085#1085#1103'('#1047#1072' '#1087#1088#1086#1075#1088#1072#1084#1086#1102')'
      Visible = ivAlways
      OnClick = SvodByGroupSmBtnClick
    end
    object ReeAccrualSingle: TdxBarButton
      Caption = #1056#1077#1108#1089#1090#1088' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1100' '#1028#1057#1042' ('#1059#1079#1072#1075#1072#1083#1100#1085#1077#1085#1080#1081')'
      Category = 0
      Hint = #1056#1077#1108#1089#1090#1088' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1100' '#1028#1057#1042' ('#1059#1079#1072#1075#1072#1083#1100#1085#1077#1085#1080#1081')'
      Visible = ivAlways
      OnClick = ReeAccrualSingleClick
    end
    object dxBarButton3: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarSubItem2: TdxBarSubItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object ReeAccrualSingleForMan: TdxBarSubItem
      Caption = #1056#1077#1108#1089#1090#1088' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1100' '#1028#1057#1042' ('#1047#1072' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1072#1084#1080')'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = ReeAccrualSingleForManAll
          Visible = True
        end
        item
          Item = ReeAccrualSingleForManInvalid
          Visible = True
        end
        item
          Item = ReeAccrualSingleForManOwer
          Visible = True
        end>
    end
    object ReeAccrualSingleForManAll: TdxBarButton
      Caption = 'ReeAccrualSingleForManAll'
      Category = 0
      Hint = 'ReeAccrualSingleForManAll'
      Visible = ivAlways
      OnClick = ReeAccrualSingleForManAllClick
    end
    object ReeAccrualSingleForManOwer: TdxBarButton
      Caption = 'ReeAccrualSingleForManOwer'
      Category = 0
      Hint = 'ReeAccrualSingleForManOwer'
      Visible = ivAlways
      OnClick = ReeAccrualSingleForManOwerClick
    end
    object ReeAccrualSingleForManInvalid: TdxBarButton
      Caption = 'ReeAccrualSingleForManInvalid'
      Category = 0
      Hint = 'ReeAccrualSingleForManInvalid'
      Visible = ivAlways
      OnClick = ReeAccrualSingleForManInvalidClick
    end
    object SvodBySchBtnNP7: TdxBarButton
      Caption = 'SvodBySchBtnNP7'
      Category = 0
      Hint = 'SvodBySchBtnNP7'
      Visible = ivAlways
      OnClick = SvodBySchBtnNP7Click
    end
    object dxBarSubItem3: TdxBarSubItem
      Caption = #1047#1074#1110#1090#1085#1110#1089#1090#1100' '#1079#1072' '#1073#1102#1076#1078#1077#1090#1072#1084#1080
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = dxBarButton5
          Visible = True
        end
        item
          Item = SvodBySmBtn
          Visible = True
        end
        item
          Item = SvodByGroupSmBtn
          Visible = True
        end
        item
          BeginGroup = True
          Item = dxBarButton6
          Visible = True
        end
        item
          Item = ReeMoreSumBtn
          Visible = True
        end
        item
          Item = ReeInvalidBtn2
          Visible = True
        end>
    end
    object dxBarButton4: TdxBarButton
      Caption = #1047#1072' '#1092#1086#1088#1084#1086#1102' '#8470' '#1055'6'
      Category = 0
      Hint = #1047#1072' '#1092#1086#1088#1084#1086#1102' '#8470' '#1055'6'
      Visible = ivAlways
      OnClick = dxBarButton4Click
    end
    object dxBarButton5: TdxBarButton
      Caption = #1047#1074#1110#1090' '#1087#1088#1086' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1090#1072' '#1091#1090#1088#1080#1084#1072#1085#1085#1103'('#1047#1072#1075#1072#1083#1100#1085#1080#1081')'
      Category = 0
      Hint = #1047#1074#1110#1090' '#1087#1088#1086' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1090#1072' '#1091#1090#1088#1080#1084#1072#1085#1085#1103'('#1047#1072#1075#1072#1083#1100#1085#1080#1081')'
      Visible = ivAlways
      OnClick = dxBarButton5Click
    end
    object SvodP49Btn: TdxBarButton
      Caption = #1056#1086#1079#1088#1072#1093#1091#1085#1082#1086#1074#1086'-'#1087#1083#1072#1090#1110#1078#1085#1072' '#1074#1110#1076#1086#1084#1110#1089#1090#1100
      Category = 0
      Hint = #1056#1086#1079#1088#1072#1093#1091#1085#1082#1086#1074#1086'-'#1087#1083#1072#1090#1110#1078#1085#1072' '#1074#1110#1076#1086#1084#1110#1089#1090#1100
      Visible = ivAlways
      OnClick = SvodP49BtnClick
    end
    object dxBarButton6: TdxBarButton
      Caption = #1056#1077#1108#1089#1090#1088' '#1072#1083#1110#1084#1077#1085#1090#1110#1074' '#1090#1072' '#1110#1085#1096#1080#1093' '#1074#1080#1082#1086#1085#1072#1074#1095#1080#1093' '#1083#1080#1089#1090#1110#1074
      Category = 0
      Hint = #1056#1077#1108#1089#1090#1088' '#1072#1083#1110#1084#1077#1085#1090#1110#1074' '#1090#1072' '#1110#1085#1096#1080#1093' '#1074#1080#1082#1086#1085#1072#1074#1095#1080#1093' '#1083#1080#1089#1090#1110#1074
      Visible = ivAlways
      OnClick = dxBarButton6Click
    end
    object dxBarButton7: TdxBarButton
      Caption = #1056#1086#1079#1088#1072#1093#1091#1085#1082#1086#1074#1072' '#1074#1110#1076#1086#1084#1086#1089#1090#1100
      Category = 0
      Hint = #1056#1086#1079#1088#1072#1093#1091#1085#1082#1086#1074#1072' '#1074#1110#1076#1086#1084#1086#1089#1090#1100
      Visible = ivAlways
    end
    object dxBarSubItem4: TdxBarSubItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarSubItem5: TdxBarSubItem
      Caption = #1056#1086#1079#1088#1072#1093#1091#1085#1082#1086#1074#1072' '#1079#1074#1110#1090#1085#1110#1089#1090#1100
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = RaschVedBtn
          Visible = True
        end
        item
          Item = RaschVedByShifrBtn
          Visible = True
        end
        item
          Item = RaschVedShortBtn
          Visible = True
        end
        item
          Item = dxBarButton4
          Visible = True
        end
        item
          Item = dxBarButton8
          Visible = True
        end
        item
          BeginGroup = True
          Item = SvodP49Btn
          Visible = True
        end>
    end
    object ReeAccrualSingleBySch: TdxBarButton
      Caption = #1047#1074#1110#1090' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1100' '#1028#1057#1042' ('#1059#1079#1072#1075#1072#1083#1100#1085#1077#1085#1080#1081') '#1079#1072' '#1088#1072#1093#1091#1085#1082#1072#1084#1080
      Category = 0
      Hint = #1047#1074#1110#1090' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1100' '#1028#1057#1042' ('#1059#1079#1072#1075#1072#1083#1100#1085#1077#1085#1080#1081') '#1079#1072' '#1088#1072#1093#1091#1085#1082#1072#1084#1080
      Visible = ivAlways
      OnClick = ReeAccrualSingleBySchClick
    end
    object dxBarButton8: TdxBarButton
      Caption = #1057#1082#1086#1088#1086#1095#1077#1085#1072'('#1086#1076#1080#1085#1072#1088#1085#1072')'
      Category = 0
      Hint = #1057#1082#1086#1088#1086#1095#1077#1085#1072'('#1086#1076#1080#1085#1072#1088#1085#1072')'
      Visible = ivNever
      OnClick = dxBarButton8Click
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = #1047#1074#1110#1090' '#1087#1088#1086' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1090#1072' '#1091#1090#1088#1080#1084#1072#1085#1085#1103'('#1041#1102#1076#1078#1077#1090#1080')'
      Category = 0
      Hint = #1047#1074#1110#1090' '#1087#1088#1086' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1090#1072' '#1091#1090#1088#1080#1084#1072#1085#1085#1103'('#1041#1102#1076#1078#1077#1090#1080')'
      Visible = ivAlways
      OnClick = dxBarLargeButton1Click
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Caption = #1047#1074#1110#1090' '#1087#1088#1086' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1090#1072' '#1091#1090#1088#1080#1084#1072#1085#1085#1103'('#1079#1074#1110#1090'+'#1073#1102#1076#1078#1077#1090')'
      Category = 0
      Hint = #1047#1074#1110#1090' '#1087#1088#1086' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1090#1072' '#1091#1090#1088#1080#1084#1072#1085#1085#1103'('#1079#1074#1110#1090'+'#1073#1102#1076#1078#1077#1090')'
      Visible = ivAlways
      OnClick = dxBarLargeButton2Click
    end
  end
end
