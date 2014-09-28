object ReestrFillForm: TReestrFillForm
  Left = 91
  Top = 117
  Width = 720
  Height = 594
  Caption = #1047#1072#1087#1086#1074#1085#1080#1090#1080' '#1088#1077#1108#1089#1090#1088
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 408
    Top = 352
    Width = 37
    Height = 24
    Caption = '>>>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Splitter1: TSplitter
    Left = 457
    Top = 0
    Width = 8
    Height = 528
  end
  object RepHospGrid: TcxGrid
    Left = 465
    Top = 0
    Width = 247
    Height = 528
    Align = alClient
    PopupMenu = PopupMenu
    TabOrder = 0
    object RepHospGridDBTV: TcxGridDBTableView
      OnDblClick = RepHospGridDBTVDblClick
      DataController.DataSource = ListSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = GridTableViewStyleSheetEggplant
      object RepHospGridDBTVTN: TcxGridDBColumn
        Caption = #1058#1072#1073'. '#1085#1086#1084'.'
        Width = 82
        DataBinding.FieldName = 'TN'
      end
      object RepHospGridDBTVFAMILIA: TcxGridDBColumn
        Caption = #1060#1072#1084#1110#1083#1110#1103
        Width = 94
        DataBinding.FieldName = 'FAMILIA'
      end
      object RepHospGridDBTVDATE_BEG: TcxGridDBColumn
        Caption = #1047
        Width = 79
        DataBinding.FieldName = 'DATE_BEG'
      end
      object RepHospGridDBTVDATE_END: TcxGridDBColumn
        Caption = #1055#1086
        Width = 80
        DataBinding.FieldName = 'DATE_END'
      end
      object RepHospGridDBTVSERIA: TcxGridDBColumn
        Caption = #1057#1077#1088#1110#1103
        Width = 79
        DataBinding.FieldName = 'SERIA'
      end
      object RepHospGridDBTVNOMER: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088
        Width = 79
        DataBinding.FieldName = 'NOMER'
      end
    end
    object RepHospGridLevel1: TcxGridLevel
      GridView = RepHospGridDBTV
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 457
    Height = 528
    Align = alLeft
    TabOrder = 1
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 455
      Height = 136
      Align = alTop
      TabOrder = 0
      object Label2: TLabel
        Left = 1
        Top = 1
        Width = 453
        Height = 13
        Align = alTop
        Caption = #1051#1110#1082#1072#1088'. '#1083#1080#1089#1090#1080', '#1103#1082#1110' '#1085#1077' '#1091#1074#1110#1081#1096#1083#1080' '#1074' '#1078#1086#1076#1085#1080#1081' '#1088#1077#1108#1089#1090#1088':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 8
        Top = 19
        Width = 62
        Height = 13
        Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 8
        Top = 52
        Width = 79
        Height = 13
        Caption = #1058#1080#1087' '#1093#1074#1086#1088#1086#1073#1080':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DepartmentEdit: TEdit
        Left = 90
        Top = 17
        Width = 247
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object DepartmentButton: TBitBtn
        Left = 347
        Top = 18
        Width = 20
        Height = 20
        Caption = '...'
        TabOrder = 1
        OnClick = DepartmentButtonClick
      end
      object IllTypeBox: TComboBox
        Left = 88
        Top = 48
        Width = 249
        Height = 21
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 13
        ItemIndex = 0
        ParentFont = False
        TabOrder = 2
        Text = '1  - '#1079#1072#1075#1072#1083#1100#1085#1077
        OnChange = IllTypeBoxChange
        Items.Strings = (
          '1  - '#1079#1072#1075#1072#1083#1100#1085#1077
          '2  - '#1087#1088#1086#1092#1077#1089#1110#1081#1085#1077
          '3  - '#1085#1072#1089#1083#1110#1076#1086#1082' '#1072#1074#1072#1088#1110#1111' '#1085#1072' '#1063#1040#1045#1057
          '4  - '#1085#1077#1097#1072#1089#1085#1080#1081' '#1074#1080#1087#1072#1076#1086#1082' '#1085#1072' '#1074#1080#1088#1086#1073#1085#1080#1094#1090#1074#1110
          '5  - '#1085#1077#1097#1072#1089#1085#1080#1081' '#1074#1080#1087#1072#1076#1086#1082' '#1087#1086' '#1076#1086#1088#1086#1079#1110' '#1085#1072' '#1088#1086#1073#1086#1090#1091
          '6  - '#1085#1077#1097#1072#1089#1085#1080#1081' '#1074#1080#1087#1072#1076#1086#1082' '#1091' '#1087#1086#1073#1091#1090#1110
          '7  - '#1082#1072#1088#1072#1085#1090#1080#1085' '#1090#1072' '#1073#1072#1082#1090#1077#1088#1110#1086#1085#1086#1089#1110#1081#1089#1090#1074#1086
          '8  - '#1076#1086#1075#1083#1103#1076
          '9  - '#1089#1072#1085#1082#1091#1088#1083#1110#1082#1091#1074#1072#1085#1085#1103
          '10- '#1074#1072#1075#1110#1090#1085#1110#1089#1090#1100' '#1090#1072' '#1087#1086#1083#1086#1075#1080
          '11- '#1087#1088#1086#1090#1077#1079#1091#1074#1072#1085#1085#1103
          '12- '#1076#1110#1072#1075#1085#1086#1089#1090#1080#1095#1085#1077' '#1086#1073#1089#1090#1077#1078#1077#1085#1085#1103
          '13- '#1110#1085#1096#1110)
      end
      object Panel4: TPanel
        Left = 1
        Top = 72
        Width = 453
        Height = 63
        Align = alBottom
        TabOrder = 3
        object DetailsButton: TSpeedButton
          Left = 6
          Top = 3
          Width = 65
          Height = 57
          Caption = #1044#1086#1082#1083#1072#1076#1085#1086
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            B60D0000424DB60D000000000000360000002800000030000000180000000100
            180000000000800D0000C40E0000C40E00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF885D406947316947
            31885D40FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            939393808080808080939393FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF694731B09A8BC3B0A3C3B0A2AF9889694731FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FF808080C2C2C2D1D1D1D1D1D1C1C1C1808080FF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF694731AF998ADDCFC6E3D6CEE1D3
            CBD9C9C0AD9787694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080C2C2C2
            E4E4E4E8E8E8E6E6E6E1E1E1C0C0C0808080FF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF69
            4731B09A8CDFD2CAE6DAD3983000983000E1D3CBD8C9BFAD9787694731FF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FF808080C2C2C2E6E6E6EBEBEB6A6A6A6A6A6AE6E6E6E0E0E0C0
            C0C0808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF694731B29D8EE3D8D1E9E0DA983000C86000C860
            00983000E1D3CBD9C9C0AF9989694731FF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080C4C4C4E9E9E9EEEEEE
            6A6A6A8E8E8E8E8E8E6A6A6AE6E6E6E1E1E1C2C2C2808080FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF694731B49F90E8
            E0DAEDE4DF983000C86000DA8338D77D2FC86000983000E1D3CBDCCCC3B29C8D
            694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FF808080C6C6C6EEEEEEF0F0F06A6A6A8E8E8EADADADA9A9A98E8E8E6A6A6AE6
            E6E6E2E2E2C3C3C3808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF694731B5A092F2ECE8ECE2DB983000C86000E08E4BDD8942DA83
            38D77D2FC86000983000DFCDC4E1D2C9B29C8D694731FF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FF808080C6C6C6F5F5F5EFEFEF6A6A6A8E8E8E
            B6B6B6B2B2B2ADADADA9A9A98E8E8E6A6A6AE3E3E3E6E6E6C3C3C3808080FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF694731B4A092EEE8E4EFE6E198
            3000F68B56E59A5DD79D80C59075C38C71C08361C08361C86000983000DFCDC4
            DCCDC4AF9989694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080C6C6
            C6F2F2F2F1F1F16A6A6AB9B9B9BFBFBFC5C5C5BCBCBCB9B9B9B2B2B2B2B2B28E
            8E8E6A6A6AE3E3E3E3E3E3C2C2C2808080FF00FFFF00FFFF00FFFF00FFFF00FF
            694731B4A193EDE8E4F7F3F1983000F68B56ECA670F7BD9FFFFFFFFFFFFFFFFF
            FFFFFFFFC08361D77D2FC86000983000E2D4CCDACAC1AE9788694731FF00FFFF
            00FFFF00FFFF00FF808080C7C7C7F2F2F2F8F8F86A6A6AB9B9B9C8C8C8DADADA
            FFFFFFFFFFFFFFFFFFFFFFFFB2B2B2A9A9A98E8E8E6A6A6AE7E7E7E1E1E1C0C0
            C0808080FF00FFFF00FFFF00FF694731B5A294EFEAE7FAF8F7983000F68B56F2
            B282EFAC79F7A175EBA882FFFFFFFFFFFFC08361DD8942DA8338D77D2FC86000
            983000E2D4CCD9C9C0AE9788694731FF00FFFF00FF808080C8C8C8F4F4F4FBFB
            FB6A6A6AB9B9B9D0D0D0CCCCCCC8C8C8CCCCCCFFFFFFFFFFFFB2B2B2B2B2B2AD
            ADADA9A9A98E8E8E6A6A6AE7E7E7E1E1E1C0C0C0808080FF00FFB7A293C2AFA2
            F3EFEDFDFDFD983000F68B56F8BE95F5B88CF2B282F9AC81EBA882FFFFFFFFFF
            FFC08361E08E4BDD8942DA8338D77D2FC86000983000E2D4CCDACAC1AF998A88
            5D40C8C8C8D0D0D0F6F6F6FEFEFE6A6A6AB9B9B9D8D8D8D5D5D5D0D0D0CECECE
            CCCCCCFFFFFFFFFFFFB2B2B2B6B6B6B2B2B2ADADADA9A9A98E8E8E6A6A6AE7E7
            E7E1E1E1C2C2C2939393B7A293FAF8F6FFFFFFC86000F68B56FBC39FFBC39FF8
            BE95F5B88CF9B187EBA882FFFFFFFFFFFFC08361E29453E08E4BDD8942DA8338
            D77D2FC86000983000E3D5CDC3B0A3694731C8C8C8FBFBFBFFFFFF8E8E8EB9B9
            B9DCDCDCDCDCDCD8D8D8D5D5D5D2D2D2CCCCCCFFFFFFFFFFFFB2B2B2BBBBBBB6
            B6B6B2B2B2ADADADA9A9A98E8E8E6A6A6AE8E8E8D1D1D1808080D0BBACFFFFFF
            FFFFFFC86000F6BF9CFBC39FFBC39FFBC39FF8BE95F9B78FEBA882FFFFFFFFFF
            FFC08361E59A5DE29453E08E4BDE8B46DB863DC86000983000E4D8D0C3B1A469
            4731D7D7D7FFFFFFFFFFFF8E8E8EDADADADCDCDCDCDCDCDCDCDCD8D8D8D5D5D5
            CCCCCCFFFFFFFFFFFFB2B2B2BFBFBFBBBBBBB6B6B6B4B4B4AFAFAF8E8E8E6A6A
            6AE9E9E9D2D2D2808080D0BBACF5F1EDFFFFFFFFFFFFC86000F6BF9CFBC39FFB
            C39FFBC39FEFBEA0EBA882FFFFFFFFFFFFD29674EAA36BE79D61E49758E1914F
            C86000983000E7DCD6DED1C8B09A8B885D40D7D7D7F8F8F8FFFFFFFFFFFF8E8E
            8EDADADADCDCDCDCDCDCDCDCDCDADADACCCCCCFFFFFFFFFFFFC0C0C0C6C6C6C1
            C1C1BCBCBCB9B9B98E8E8E6A6A6AECECECE5E5E5C2C2C2939393FF00FFD0BBAC
            F3EEEAFFFFFFFFFFFFC86000F6BF9CFBC39FFBC39FFABF99FFFFFFFFFFFFFFFF
            FFF0AF7EEDA974EAA36BE79D61C86000983000EAE1DCE0D3CCAF9A8B694731FF
            00FFFF00FFD7D7D7F6F6F6FFFFFFFFFFFF8E8E8EDADADADCDCDCDCDCDCDADADA
            FFFFFFFFFFFFFFFFFFCECECEC9C9C9C6C6C6C1C1C18E8E8E6A6A6AEFEFEFE6E6
            E6C2C2C2808080FF00FFFF00FFFF00FFD0BBACF3EEEAFFFFFFFFFFFFC86000F6
            BF9CFBC39FFBC39FFBC39FC49375C49375F3B587F0AF7EEDA974F68B56983000
            EEE6E1E3D9D2B09B8C694731FF00FFFF00FFFF00FFFF00FFD7D7D7F6F6F6FFFF
            FFFFFFFF8E8E8EDADADADCDCDCDCDCDCDCDCDCBDBDBDBDBDBDD2D2D2CECECEC9
            C9C9B9B9B96A6A6AF1F1F1EAEAEAC3C3C3808080FF00FFFF00FFFF00FFFF00FF
            FF00FFD0BBACF5F1EEFFFFFFFCF8F4C86000F6BF9CFBC39FEDD7C9FFFFFFD0BF
            B4C49375F3B587F68B56983000EEE4DEEAE1DCB29D8E694731FF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFD7D7D7F8F8F8FFFFFFFBFBFB8E8E8EDADADADCDCDC
            E8E8E8FFFFFFDADADABDBDBDD2D2D2B9B9B96A6A6AF0F0F0EFEFEFC4C4C48080
            80FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD0BBACF9F6F4FFFFFFFC
            F8F4C86000F6BF9CFFFFFFFFFEFEFFFFFFC49375F68B56983000F1E8E3F3EEEA
            B49F91694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD7D7
            D7FAFAFAFFFFFFFBFBFB8E8E8EDADADAFFFFFFFEFEFEFFFFFFBDBDBDB9B9B96A
            6A6AF2F2F2F6F6F6C6C6C6808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFD0BBACF9F6F4FFFFFFFFFFFFC86000F6BF9CFFFFFFD296
            74F68B56983000F8F5F3EFEAE6B5A092694731FF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFD7D7D7FAFAFAFFFFFFFFFFFF8E8E8E
            DADADAFFFFFFC0C0C0B9B9B96A6A6AFAFAFAF4F4F4C6C6C6808080FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD0BBACF5
            F1EDFFFFFFFFFFFFC86000F6BF9CF68B56983000FBFAF9EEE9E5B4A092694731
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFD7D7D7F8F8F8FFFFFFFFFFFF8E8E8EDADADAB9B9B96A6A6AFCFCFCF3
            F3F3C6C6C6808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFD0BBACF3EEEAFFFFFFFFFFFFC86000C860
            00FEFEFEF0ECE9B4A194694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD7D7D7F6F6F6FFFFFF
            FFFFFF8E8E8E8E8E8EFEFEFEF5F5F5C7C7C7808080FF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFD0BBACF7EFEBFFFFFFFFFFFFFFFFFFF3EFEDB5A295694731FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFD7D7D7F6F6F6FFFFFFFFFFFFFFFFFFF6F6F6C8C8C880
            8080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD0BBACF5F1EEFFFFFFFAF8
            F6C2AEA1694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD7D7D7
            F8F8F8FFFFFFFBFBFBCFCFCF808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFD0BBACD0BBACB7A293B7A293FF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFD7D7D7D7D7D7C8C8C8C8C8C8FF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentFont = False
          OnClick = DetailsButtonClick
        end
        object SetFilterButton: TSpeedButton
          Left = 80
          Top = 3
          Width = 65
          Height = 57
          Caption = #1060#1110#1083#1100#1090#1088
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C0060000630B0000630B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA08281FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            A0828186624DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFA08281E9B89586624DFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFA08281FDFAF7E9B89586624DFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA08281FDFAF7E9B8
            9586624DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            A08281FDFAF7E9B89586624DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFA08281FDFAF7E9B89586624DFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFA08281FDFAF7E9B89586624DFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA08281FDFAF7F6E3D5F5E0
            D1E9B89586624DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA08281FDFAF7
            F7E6DAF6E3D5F5E0D1EFCAB1E9B89586624DFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA0
            8281FDFAF7F8E9DEF7E6DAF6E3D5F5E0D1F4DCCCEFCAB1E9B89586624DFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFA08281FDFAF7F9ECE3F8E9DEF7E6DAF6E3D5F5E0D1F4DCCCF3D9C7EF
            CAB1E9B89586624DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFA08C7DFDFAF7FAEFE7F9ECE3F8E9DEF7E6DAF6E3D5F5E0
            D1F4DCCCF3D9C7F2D6C3EFCAB1E9B89586624DFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFA08C7DFDFAF7FBF2ECFAEFE7F9ECE3F8E9DE
            A08C7D86624DA08C7DF4DCCCF3D9C7F2D6C3F1D3BEEFCAB1E9B89586624DFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA08281FDFAF7FCF6F1FBF2ECA0
            8C7D86624D86624D9CDEFF9CDEFF009CCE86624D86624D86624DA08C7DEFCAB1
            EFCAB1E9B89586624DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA08281A08C
            7D86624D86624D9CFFFF9CFFFF00BDFF9CDEFF9CDEFF9CDEFF009CCE00009C00
            009CC7AB9786624DA08C7DE9B89586624DFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFA08281C7AB97C7AB9700BDFFE9FFFF9CFFFF9CFFFF00A5EF9CDEFF009C
            CE0000C800009C0000C800009CC7AB97C7AB9786624D86624DFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFA082819C6B6338839800A5EFE9FFFF9CFFFF
            9CFFFF00A5EF0000C800009C0000DE0000DE0000C800009C86624DFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF633131CE63009C6B639C
            6B6300A5EFE9FFFF00BDFF0000B40000B40000DE0000DE0000DE0000DE0000C8
            00009CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6331
            31CE6300CE6300CE63009C310000BDFF0000B48B9EF1718BED0000B40000DE00
            00DE0000DE00009CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF633131FFAD4A9C31009C3100CE6300CE63009C31000000B48B9E
            F1718BED0000B40000DE00009CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FF633131633131FFCE9CFFAD4AD68400D68400
            D684006331310000B40000B40000B40000B4FF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF633131633131FF
            CE9CFFCE9C633131633131FF00FFFF00FF0000B4FF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FF633131633131FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Layout = blGlyphTop
          ParentFont = False
          OnClick = SetFilterButtonClick
        end
        object RemoveFilterButton: TSpeedButton
          Left = 153
          Top = 3
          Width = 80
          Height = 57
          Caption = #1042#1110#1076#1084'. '#1092#1110#1083#1100#1090#1088
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000230B0000230B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFB7552AC84200FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAF5C32D76632C84200FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFAF5C32D76733C84200FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAF5C32D76632C842
            00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFDC7443EE8A58CE5F2DCE5F2DFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAF5C32EE8A
            58C84200FF00FFFF00FFFF00FFC56A3198300098300098300098300098300098
            3000FF00FFFF00FFFF00FFAF5C32EE8A58DC7443D17043FF00FFFF00FFC56A31
            EE8A58EE8A58EE8A58EE8A58983000FF00FFFF00FFFF00FFFF00FFAF5C32EE8A
            58DC7443C84200FF00FFFF00FFC56A31EE8A58E68F63E58B5EE28556983000FF
            00FFFF00FFFF00FFFF00FFAF5C32EE8A58DC7443C84200FF00FFFF00FFC56A31
            EE8A58F6B190E68F63E58B5ED17043983000FF00FFFF00FF983000F6B190EE8A
            58DC7443CE5F2DFF00FFFF00FFC56A31F6B190C56A31F6B190E68F64E58C5FD2
            7044983000983000F6B190EE8A58EE8A58DC7443D17043FF00FFFF00FFC56A31
            C56A31FF00FFC56A31F6B190E69064E58C5FE3875AE18254E18051EE8A58DC74
            43CE5F2DFF00FFFF00FFFF00FFC56A31FF00FFFF00FFFF00FFC56A31F6B190F6
            B190F6B190F6B190EE8A58CE5F2DD17043FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFF56F2DC56A31C56A31C56A31F56F2DFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Layout = blGlyphTop
          ParentFont = False
          OnClick = RemoveFilterButtonClick
        end
      end
    end
    object HospListGrid: TcxGrid
      Left = 1
      Top = 137
      Width = 455
      Height = 390
      Align = alClient
      PopupMenu = PopupMenu
      TabOrder = 1
      object HospListGridDBTV: TcxGridDBTableView
        OnDblClick = HospListGridDBTVDblClick
        DataController.DataModeController.SmartRefresh = True
        DataController.DataSource = HospListDataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.IncSearch = True
        OptionsBehavior.IncSearchItem = HospListGridDBTVTN
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = GridTableViewStyleSheetDevExpress
        object HospListGridDBTVTN: TcxGridDBColumn
          Caption = #1058#1072#1073'. '#1085#1086#1084'.'
          Width = 62
          DataBinding.FieldName = 'TN'
        end
        object HospListGridDBTVFAMILIA: TcxGridDBColumn
          Caption = #1060#1072#1084#1110#1083#1110#1103
          Width = 79
          DataBinding.FieldName = 'FAMILIA'
        end
        object HospListGridDBTVDATE_BEG: TcxGridDBColumn
          Caption = #1047
          Width = 62
          DataBinding.FieldName = 'DATE_BEG'
        end
        object HospListGridDBTVDATE_END: TcxGridDBColumn
          Caption = #1055#1086
          Width = 63
          DataBinding.FieldName = 'DATE_END'
        end
        object HospListGridDBTVSERIA: TcxGridDBColumn
          Caption = #1057#1077#1088#1110#1103
          Width = 62
          DataBinding.FieldName = 'SERIA'
        end
        object HospListGridDBTVNOMER: TcxGridDBColumn
          Caption = #1053#1086#1084#1077#1088
          Width = 55
          DataBinding.FieldName = 'NOMER'
        end
        object HospListGridDBTVPERCENT: TcxGridDBColumn
          Caption = #1055#1088#1086#1094#1077#1085#1090
          SortOrder = soAscending
          Width = 90
          DataBinding.FieldName = 'PERCENT'
        end
      end
      object HospListGridLevel1: TcxGridLevel
        GridView = HospListGridDBTV
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 528
    Width = 712
    Height = 39
    Align = alBottom
    TabOrder = 2
    object Label5: TLabel
      Left = 8
      Top = 16
      Width = 101
      Height = 13
      Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1083#1080#1089#1090#1110#1074':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object NumHosps: TLabel
      Left = 120
      Top = 16
      Width = 61
      Height = 13
      Caption = 'NumHosps'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 824
      Top = 16
      Width = 101
      Height = 13
      Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1083#1080#1089#1090#1110#1074':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object NumHospReestrLabel: TLabel
      Left = 928
      Top = 16
      Width = 8
      Height = 13
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 64
    Top = 176
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 14154746
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14154746
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14154746
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14154746
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 14154746
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 14811135
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 8404992
      TextColor = clWhite
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11055248
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14211272
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11055248
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 7897176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 524288
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = 524288
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4194368
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11055248
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 7897176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11055248
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7897176
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = 7897176
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 7897176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor]
      Color = 15400917
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor]
      Color = 14811135
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle2
      Styles.ContentEven = cxStyle3
      Styles.ContentOdd = cxStyle4
      Styles.Inactive = cxStyle10
      Styles.IncSearch = cxStyle11
      Styles.Selection = cxStyle14
      Styles.FilterBox = cxStyle5
      Styles.Footer = cxStyle6
      Styles.Group = cxStyle7
      Styles.GroupByBox = cxStyle8
      Styles.Header = cxStyle9
      Styles.Indicator = cxStyle12
      Styles.NewItemRowInfoText = cxStyle27
      Styles.Preview = cxStyle13
      BuiltIn = True
    end
    object GridTableViewStyleSheetEggplant: TcxGridTableViewStyleSheet
      Caption = 'Eggplant'
      Styles.Background = cxStyle26
      Styles.Content = cxStyle15
      Styles.ContentEven = cxStyle16
      Styles.ContentOdd = cxStyle17
      Styles.Inactive = cxStyle22
      Styles.Selection = cxStyle25
      Styles.Footer = cxStyle18
      Styles.Group = cxStyle19
      Styles.GroupByBox = cxStyle20
      Styles.Header = cxStyle21
      Styles.Indicator = cxStyle23
      Styles.Preview = cxStyle24
      BuiltIn = True
    end
  end
  object HospListDataSource: TDataSource
    DataSet = HospListQuery
    Left = 40
    Top = 176
  end
  object HospListQuery: TIBQuery
    Database = Main.ChermetDatabase
    Transaction = Main.DefaultTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM GET_HOSP_FOR_REESTR(:ID_DEP,:ID_TYPE)')
    Left = 8
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_DEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_TYPE'
        ParamType = ptUnknown
      end>
    object HospListQueryDATE_BEG: TDateField
      FieldName = 'DATE_BEG'
      Origin = 'GET_HOSP_FOR_REESTR.DATE_BEG'
    end
    object HospListQueryDATE_END: TDateField
      FieldName = 'DATE_END'
      Origin = 'GET_HOSP_FOR_REESTR.DATE_END'
    end
    object HospListQuerySERIA: TIBStringField
      FieldName = 'SERIA'
      Origin = 'GET_HOSP_FOR_REESTR.SERIA'
      Size = 10
    end
    object HospListQueryNOMER: TIBStringField
      FieldName = 'NOMER'
      Origin = 'GET_HOSP_FOR_REESTR.NOMER'
      Size = 10
    end
    object HospListQueryFAMILIA: TIBStringField
      FieldName = 'FAMILIA'
      Origin = 'GET_HOSP_FOR_REESTR.FAMILIA'
      Size = 200
    end
    object HospListQueryTN: TIntegerField
      FieldName = 'TN'
      Origin = 'GET_HOSP_FOR_REESTR.TN'
    end
    object HospListQueryID_HOSP: TIntegerField
      FieldName = 'ID_HOSP'
      Origin = 'GET_HOSP_FOR_REESTR.ID_HOSP'
    end
    object HospListQueryID_PCARD: TIntegerField
      FieldName = 'ID_PCARD'
      Origin = 'GET_HOSP_FOR_REESTR.ID_PCARD'
    end
    object HospListQueryPERCENT: TIBBCDField
      FieldName = 'PERCENT'
      Origin = 'GET_HOSP_FOR_REESTR.PERCENT'
      Precision = 18
      Size = 2
    end
  end
  object AddHospToReestrProc: TIBStoredProc
    Database = Main.ChermetDatabase
    Transaction = Main.DefaultTransaction
    StoredProcName = 'HOSP_REESTR_DATA_INSERT'
    Left = 8
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_REESTR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_HOSP'
        ParamType = ptInput
      end>
  end
  object ListSource: TDataSource
    DataSet = ListQuery
    Left = 480
    Top = 72
  end
  object ListQuery: TIBQuery
    Database = Main.ChermetDatabase
    Transaction = Main.DefaultTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM GET_HOSP_IN_REESTR(:ID_REESTR)')
    Left = 480
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_REESTR'
        ParamType = ptUnknown
      end>
    object ListQueryID_HOSP: TIntegerField
      FieldName = 'ID_HOSP'
      Origin = 'GET_HOSP_IN_REESTR.ID_HOSP'
    end
    object ListQueryDATE_BEG: TDateField
      FieldName = 'DATE_BEG'
      Origin = 'GET_HOSP_IN_REESTR.DATE_BEG'
    end
    object ListQueryDATE_END: TDateField
      FieldName = 'DATE_END'
      Origin = 'GET_HOSP_IN_REESTR.DATE_END'
    end
    object ListQuerySERIA: TIBStringField
      FieldName = 'SERIA'
      Origin = 'GET_HOSP_IN_REESTR.SERIA'
      Size = 10
    end
    object ListQueryNOMER: TIBStringField
      FieldName = 'NOMER'
      Origin = 'GET_HOSP_IN_REESTR.NOMER'
      Size = 10
    end
    object ListQueryFAMILIA: TIBStringField
      FieldName = 'FAMILIA'
      Origin = 'GET_HOSP_IN_REESTR.FAMILIA'
      Size = 200
    end
    object ListQueryTN: TIntegerField
      FieldName = 'TN'
      Origin = 'GET_HOSP_IN_REESTR.TN'
    end
    object ListQueryPERCENT: TIBBCDField
      FieldName = 'PERCENT'
      Origin = 'GET_HOSP_IN_REESTR.PERCENT'
      Precision = 18
      Size = 2
    end
  end
  object DelHospFromReestrProc: TIBStoredProc
    Database = Main.ChermetDatabase
    Transaction = Main.DefaultTransaction
    StoredProcName = 'HOSP_REESTR_DATA_DELETE'
    Left = 480
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_REESTR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_HOSP'
        ParamType = ptInput
      end>
  end
  object PopupMenu: TPopupMenu
    Alignment = paCenter
    Left = 8
    Top = 152
    object AddAllItem: TMenuItem
      Caption = #1044#1086#1076#1072#1090#1080' '#1091#1089#1110
      OnClick = AddAllItemClick
    end
    object RemoveAllItem: TMenuItem
      Caption = #1042#1080#1083#1091#1095#1080#1090#1080' '#1091#1089#1110
      OnClick = RemoveAllItemClick
    end
  end
end
