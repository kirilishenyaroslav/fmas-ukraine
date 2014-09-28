object fmMain: TfmMain
  Left = 313
  Top = 155
  Width = 694
  Height = 478
  Caption = #1057#1080#1089#1090#1077#1084#1072' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1110#1074' '#1079#1072#1088#1086#1073#1110#1090#1085#1100#1086#1111' '#1087#1083#1072#1090#1080' '#1090#1072' '#1089#1090#1080#1087#1077#1085#1076#1110#1111' ['#1046'/'#1054' 5]'
  Color = clGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  FormStyle = fsMDIForm
  Icon.Data = {
    0000010001002020040000000000E80200001600000028000000200000004000
    0000010004000000000000020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000222000000000000000000000000000022222200000000000000
    000000000002A288222200000000000000000000002AA2877722220000000000
    0000000002666628777722220000000000000000266622FF8877772222000000
    000000026622F2FFFF887777222200000000002622FF2FF87FFF887777220000
    00000222FFF2FFFFF87FFF8877800000000066FFFF2FF87FFFF78FFF88850000
    0006FFFFF2FFFFF78FFFF78FFF850000006FFFFF2FF87FFFF87FFFFFF8550000
    06FFFFF2FFFFF78FFFF87FFF855500006FFFFF2FF78FFFF87FFFFFF855550006
    FFFF66FFFFF87FFFF87FFF855555006FFF660088FFFFF78FFFFFF855555506FF
    6600009888FFFFF87FFF855555556F66000000989988FFFFFFF8555555556600
    00000098999988FFFF8D5555555500000000009899994788F85D555555550000
    0000009833394744845D5555555500000000009899994744445D555555550000
    0000009833394744445D5555555500000000009899994744445D555555550000
    000000989999444F745D5555555500000000009811191474F75D555555550000
    000000911F7111474F5D5555555500000000000991F7911474555F7555550000
    00000000991F79114405D5F7D5550000000000000991119100005D5F7D550000
    0000000000910011000005D555D500000000000000000000000000550055FFFF
    8FFFFFFF03FFFFFE00FFFFFC003FFFF8000FFFF00003FFE00000FFC00000FF80
    0001FF000000FE000000FC000000F8000000F0000000E0000000C0C0000083C0
    00000FC000003FC00000FFC00000FFC00000FFC00000FFC00000FFC00000FFC0
    0000FFC00000FFC00000FFE00000FFF00200FFF80F00FFFCCF80FFFFFFCC}
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object stbMain: TdxStatusBar
    Left = 0
    Top = 432
    Width = 686
    Height = 19
    Images = dmdDataModul.imlMainMenu
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.ImageIndex = 20
        PanelStyle.EllipsisType = dxetSmartPath
        Fixed = False
        Text = #1041#1072#1079#1072' '#1076#1072#1085#1080#1093' : '
        Width = 200
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Color = clBtnFace
        PanelStyle.ImageIndex = 21
        PanelStyle.EllipsisType = dxetTruncate
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = clWindowText
        PanelStyle.Font.Height = -11
        PanelStyle.Font.Name = 'MS Sans Serif'
        PanelStyle.Font.Style = []
        PanelStyle.ParentFont = False
        Fixed = False
        Text = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095': '
        Width = 250
      end
      item
        PanelStyleClassName = 'TdxStatusBarKeyboardStatePanelStyle'
        PanelStyle.KeyboardStates = [dxksCapsLock, dxksNumLock, dxksInsert]
        PanelStyle.CapsLockKeyAppearance.ActiveFontColor = clBlue
        PanelStyle.CapsLockKeyAppearance.ActiveCaption = 'CAPS'
        PanelStyle.CapsLockKeyAppearance.InactiveCaption = 'CAPS'
        PanelStyle.NumLockKeyAppearance.ActiveFontColor = 234
        PanelStyle.NumLockKeyAppearance.ActiveCaption = 'NUM'
        PanelStyle.NumLockKeyAppearance.InactiveCaption = 'NUM'
        PanelStyle.ScrollLockKeyAppearance.ActiveFontColor = 234
        PanelStyle.ScrollLockKeyAppearance.ActiveCaption = 'SCRL'
        PanelStyle.ScrollLockKeyAppearance.InactiveCaption = 'SCRL'
        PanelStyle.InsertKeyAppearance.ActiveFontColor = clBtnShadow
        PanelStyle.InsertKeyAppearance.InactiveFontColor = clBlue
        PanelStyle.InsertKeyAppearance.ActiveCaption = 'OVR'
        PanelStyle.InsertKeyAppearance.InactiveCaption = 'INS'
      end>
    PaintStyle = stpsFlat
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object brmMain: TdxBarManager
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        BorderStyle = bbsNone
        Caption = #1043#1086#1083#1086#1074#1085#1077' '#1052#1077#1085#1102
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 0
        FloatTop = 0
        FloatClientWidth = 75
        FloatClientHeight = 148
        IsMainMenu = True
        ItemLinks = <
          item
            Item = mnuWork
            Visible = True
          end
          item
            Item = mnuSprav
            Visible = True
          end
          item
            Item = mnuReports
            Visible = True
          end
          item
            Item = mnuService
            Visible = True
          end
          item
            Item = mnuWindow
            Visible = True
          end
          item
            Item = mnuHelp
            Visible = True
          end
          item
            Item = mnuExit
            Visible = True
          end
          item
            Item = mnuCurrPeriod
            Visible = True
          end>
        MultiLine = True
        Name = 'mmnuMain'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    CanCustomize = False
    Categories.Strings = (
      'Service'
      'Window'
      'Work'
      'Sprav'
      'Reports'
      'Help'
      'Exit'
      'CurrPeriod')
    Categories.ItemsVisibles = (
      2
      2
      2
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
      True
      True
      True
      True)
    Images = dmdDataModul.imlMainMenu
    LookAndFeel.NativeStyle = False
    MenuAnimations = maUnfold
    PopupMenuLinks = <>
    Style = bmsFlat
    UseSystemFont = True
    Left = 12
    Top = 32
    DockControlHeights = (
      0
      0
      24
      0)
    object mnuWork: TdxBarSubItem
      Caption = #1056#1086#1073#1086#1090#1072
      Category = 2
      Enabled = False
      Visible = ivAlways
      ItemLinks = <
        item
          Item = smnWatchJO5
          Visible = True
        end
        item
          BeginGroup = True
          Item = smnInputProvs
          Visible = True
        end
        item
          Item = smnImportProvs
          Visible = True
        end
        item
          BeginGroup = True
          Item = smnCreateOstatki
          Visible = True
        end>
    end
    object smnWatchJO5: TdxBarButton
      Caption = #1055#1077#1088#1077#1075#1083#1103#1076' '#1078#1091#1088#1085#1072#1083#1091
      Category = 2
      Hint = #1055#1077#1088#1077#1075#1083#1103#1076' '#1078#1091#1088#1085#1072#1083#1091
      Visible = ivAlways
      ImageIndex = 15
      OnClick = smnWatchJO5Click
    end
    object smnInputProvs: TdxBarButton
      Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084#1080
      Category = 2
      Hint = #1056#1086#1073#1086#1090#1072' '#1079' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084#1080
      Visible = ivAlways
      ImageIndex = 16
      OnClick = smnInputProvsClick
    end
    object smnImportProvs: TdxBarButton
      Caption = #1030#1084#1087#1086#1088#1090' '#1087#1088#1086#1074#1086#1076#1086#1082
      Category = 2
      Hint = #1030#1084#1087#1086#1088#1090' '#1087#1088#1086#1074#1086#1076#1086#1082
      Visible = ivNever
      ImageIndex = 14
      OnClick = smnImportProvsClick
    end
    object mnuSprav: TdxBarButton
      Caption = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Category = 3
      Enabled = False
      Hint = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Visible = ivNever
      OnClick = mnuSpravClick
    end
    object smnCreateOstatki: TdxBarButton
      Caption = #1060#1086#1088#1084#1091#1074#1072#1085#1085#1103' '#1079#1072#1083#1080#1096#1082#1110#1074
      Category = 2
      Hint = #1060#1086#1088#1084#1091#1074#1072#1085#1085#1103' '#1079#1072#1083#1080#1096#1082#1110#1074
      Visible = ivNever
      ImageIndex = 8
      OnClick = smnCreateOstatkiClick
    end
    object mnuHelp: TdxBarSubItem
      Caption = #1044#1086#1087#1086#1084#1086#1075#1072
      Category = 5
      Visible = ivAlways
      ItemLinks = <
        item
          Item = smnHelp
          Visible = True
        end
        item
          Item = smnAbout
          Visible = True
        end>
    end
    object smnHelp: TdxBarButton
      Caption = #1044#1086#1087#1086#1084#1086#1075#1072
      Category = 5
      Hint = #1044#1086#1087#1086#1084#1086#1075#1072
      Visible = ivAlways
      ImageIndex = 0
      OnClick = smnHelpClick
    end
    object mnuExit: TdxBarButton
      Caption = #1042#1080#1093#1110#1076
      Category = 6
      Hint = #1042#1080#1093#1110#1076
      Visible = ivAlways
      OnClick = mnuExitClick
    end
    object smnAbout: TdxBarButton
      Caption = #1055#1088#1086' '#1087#1088#1086#1075#1088#1072#1084#1091
      Category = 5
      Hint = #1055#1088#1086' '#1087#1088#1086#1075#1088#1072#1084#1091
      Visible = ivAlways
      ImageIndex = 1
      OnClick = smnAboutClick
    end
    object mnuWindow: TdxBarSubItem
      Caption = #1042#1110#1082#1085#1086
      Category = 1
      Enabled = False
      Visible = ivAlways
      ItemLinks = <
        item
          Item = smnCascade
          Visible = True
        end
        item
          Item = smnTileHor
          Visible = True
        end
        item
          Item = smnTileVert
          Visible = True
        end
        item
          BeginGroup = True
          Item = smnMinimizeAll
          Visible = True
        end
        item
          Item = smnCloseAll
          Visible = True
        end>
    end
    object smnCascade: TdxBarButton
      Action = actWinCascade
      Category = 1
      AllowAllUp = True
    end
    object smnTileHor: TdxBarButton
      Action = actWinTileVert
      Caption = #1052#1086#1079#1072#1110#1082#1072' '#1074#1077#1088#1090#1080#1082#1072#1083#1100#1085#1086
      Category = 1
    end
    object smnTileVert: TdxBarButton
      Action = actWinTileHor
      Caption = #1052#1086#1079#1072#1110#1082#1072' '#1075#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1086
      Category = 1
    end
    object smnMinimizeAll: TdxBarButton
      Action = actWinMinAll
      Caption = #1047#1074#1077#1088#1085#1091#1090#1080' '#1074#1089#1077
      Category = 1
    end
    object smnCloseAll: TdxBarButton
      Action = actWinCloseAll
      Caption = #1047#1072#1082#1088#1080#1090#1080' '#1074#1089#1105
      Category = 1
      Hint = #1047#1072#1082#1088#1080#1090#1080' '#1074#1089#1105
    end
    object mnuService: TdxBarSubItem
      Caption = #1057#1077#1088#1074#1110#1089
      Category = 0
      Enabled = False
      Visible = ivAlways
      ItemLinks = <
        item
          Item = smnNextPeriod
          Visible = True
        end
        item
          Item = smnPreviousPeriod
          Visible = True
        end>
    end
    object mnuReports: TdxBarSubItem
      Caption = #1047#1074#1110#1090
      Category = 4
      Enabled = False
      Visible = ivAlways
      ItemLinks = <
        item
          Item = smnPrtJournal
          Visible = True
        end>
    end
    object smnNextPeriod: TdxBarButton
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1091' '#1085#1072#1089#1090#1091#1087#1085#1080#1081' '#1087#1077#1088#1110#1086#1076
      Category = 0
      Hint = #1055#1077#1088#1077#1081#1090#1080' '#1091' '#1085#1072#1089#1090#1091#1087#1085#1080#1081' '#1087#1077#1088#1110#1086#1076
      Visible = ivAlways
      ImageIndex = 13
      ShortCut = 16417
      OnClick = smnNextPeriodClick
    end
    object smnPrtJournal: TdxBarButton
      Caption = #1044#1088#1091#1082' '#1078#1091#1088#1085#1072#1083#1091
      Category = 4
      Hint = #1044#1088#1091#1082' '#1078#1091#1088#1085#1072#1083#1091
      Visible = ivAlways
      ImageIndex = 19
      OnClick = smnPrtJournalClick
    end
    object smnPreviousPeriod: TdxBarButton
      Caption = #1042#1110#1076#1082#1086#1090#1080#1090#1080#1089#1103' '#1091' '#1087#1086#1087#1077#1088#1077#1076#1085#1110#1081' '#1087#1077#1088#1110#1086#1076
      Category = 0
      Hint = #1042#1110#1076#1082#1086#1090#1080#1090#1080#1089#1103' '#1091' '#1087#1086#1087#1077#1088#1077#1076#1085#1110#1081' '#1087#1077#1088#1110#1086#1076
      Visible = ivAlways
      ImageIndex = 12
      ShortCut = 16418
      OnClick = smnPreviousPeriodClick
    end
    object mnuCurrPeriod: TdxBarStatic
      Align = iaRight
      Caption = #1055#1086#1090#1086#1095#1085#1080#1081' '#1087#1077#1088#1110#1086#1076':'
      Category = 7
      Hint = #1055#1086#1090#1086#1095#1085#1080#1081' '#1087#1077#1088#1110#1086#1076
      Visible = ivAlways
      Alignment = taLeftJustify
      BorderStyle = sbsLowered
      ImageIndex = 18
      LeftIndent = 3
      RightIndent = 3
    end
  end
  object aclMain: TActionList
    Images = dmdDataModul.imlMainMenu
    Left = 70
    Top = 32
    object actWinCascade: TWindowCascade
      Category = 'Window'
      Caption = #1050#1072#1089#1082#1072#1076#1086#1084
      Hint = #1056#1072#1089#1087#1086#1083#1086#1078#1080#1090#1100' '#1074#1089#1077' '#1076#1086#1095#1077#1088#1085#1080#1077' '#1086#1082#1085#1072' '#1082#1072#1089#1082#1072#1076#1086#1084
      ImageIndex = 5
    end
    object actWinTileVert: TWindowTileVertical
      Category = 'Window'
      Caption = #1052#1086#1079#1072#1080#1082#1072' '#1074#1077#1088#1090#1080#1082#1072#1083#1100#1085#1086
      Hint = #1056#1072#1089#1087#1086#1083#1086#1078#1080#1090#1100' '#1074#1089#1077' '#1076#1086#1095#1077#1088#1085#1080#1077' '#1086#1082#1085#1072' '#1084#1086#1079#1072#1080#1082#1086#1081' '#1074#1077#1088#1090#1080#1082#1072#1083#1100#1085#1086
      ImageIndex = 7
    end
    object actWinTileHor: TWindowTileHorizontal
      Category = 'Window'
      Caption = #1052#1086#1079#1072#1080#1082#1072' '#1075#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1086
      Hint = #1056#1072#1089#1087#1086#1083#1086#1078#1080#1090#1100' '#1074#1089#1077' '#1076#1086#1095#1077#1088#1085#1080#1077' '#1086#1082#1085#1072' '#1084#1086#1079#1072#1080#1082#1086#1081' '#1075#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1086
      ImageIndex = 6
    end
    object actWinMinAll: TWindowMinimizeAll
      Category = 'Window'
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1105
      Hint = #1057#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077' '#1076#1086#1095#1077#1088#1085#1080#1077' '#1086#1082#1085#1072
      ImageIndex = 4
    end
    object actWinCloseAll: TAction
      Category = 'Window'
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1074#1089#1105
      ImageIndex = 2
      OnExecute = actWinCloseAllExecute
      OnUpdate = actWinCloseAllUpdate
    end
  end
  object dstMain: TpFIBDataSet
    Database = dmdDataModul.dbJO5
    Transaction = dmdDataModul.trRead
    UpdateTransaction = dmdDataModul.trWrite
    Left = 12
    Top = 80
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object spcMain: TpFIBStoredProc
    Database = dmdDataModul.dbJO5
    Transaction = dmdDataModul.trWrite
    Left = 70
    Top = 80
  end
  object dstBuffer: TRxMemoryData
    FieldDefs = <>
    Left = 12
    Top = 173
    object fldSCH_NUMBER: TStringField
      FieldName = 'SCH_NUMBER'
      Size = 60
    end
    object fldSCH_TITLE: TStringField
      FieldName = 'SCH_TITLE'
      Size = 120
    end
    object fldSCH_ERROR: TStringField
      FieldName = 'SCH_ERROR'
      Size = 255
    end
  end
  object dstAllDocs: TRxMemoryData
    FieldDefs = <>
    Left = 11
    Top = 127
  end
  object dstAllProvs: TRxMemoryData
    FieldDefs = <>
    Left = 69
    Top = 127
  end
end
