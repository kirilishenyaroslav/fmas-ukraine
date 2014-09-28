object jo9_SpecOper_Form: Tjo9_SpecOper_Form
  Left = 234
  Top = 149
  Width = 770
  Height = 528
  Caption = #1057#1087#1077#1094#1110#1072#1083#1100#1085#1110' '#1086#1087#1077#1088#1072#1094#1110#1111
  Color = clBtnFace
  Constraints.MinHeight = 463
  Constraints.MinWidth = 682
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MainPanel: TPanel
    Left = 0
    Top = 0
    Width = 762
    Height = 501
    Align = alClient
    TabOrder = 0
    DesignSize = (
      762
      501)
    object Shape2: TShape
      Left = 383
      Top = 90
      Width = 376
      Height = 28
    end
    object Shape1: TShape
      Left = 4
      Top = 89
      Width = 374
      Height = 29
    end
    object DbDescrLabel: TLabel
      Left = 73
      Top = 103
      Width = 226
      Height = 13
      Caption = #1047#1072' '#1088#1072#1093#1091#1085#1086#1082' '#1103#1082#1080#1093' '#1073#1102#1076#1078#1077#1090#1110#1074' '#1087#1086#1085#1077#1089#1077#1085#1086' '#1074#1080#1090#1088#1072#1090#1080
      Transparent = True
    end
    object KrDescrLabel: TLabel
      Left = 489
      Top = 103
      Width = 164
      Height = 13
      Caption = #1059' '#1076#1086#1093#1086#1076' '#1095#1086#1075#1086' '#1085#1072#1076#1093#1086#1076#1103#1090#1100' '#1086#1087#1077#1088#1072#1094#1110#1111
      Transparent = True
    end
    object KrNameLabel: TLabel
      Left = 546
      Top = 89
      Width = 57
      Height = 19
      Caption = #1050#1088#1077#1076#1080#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object DbNameLabel: TLabel
      Left = 127
      Top = 89
      Width = 116
      Height = 19
      Caption = #1044#1077#1073#1077#1090' '#1046#1054' "9'#1073'"'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10423055
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Panel2: TPanel
      Left = 1
      Top = 426
      Width = 760
      Height = 74
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      DesignSize = (
        760
        74)
      object Label3: TLabel
        Left = 5
        Top = 2
        Width = 134
        Height = 13
        Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1084':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ApplyButton: TcxButton
        Left = 632
        Top = 10
        Width = 113
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1055#1088#1080#1081#1085#1103#1090#1080
        TabOrder = 1
        OnClick = ApplyButtonClick
      end
      object CancelButton: TcxButton
        Left = 632
        Top = 39
        Width = 113
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
        TabOrder = 2
        OnClick = CancelButtonClick
        UseSystemPaint = False
      end
      object InfoMemo: TcxMemo
        Left = 2
        Top = 15
        Width = 405
        Height = 56
        TabStop = False
        ParentFont = False
        Properties.MaxLength = 200
        Properties.ReadOnly = True
        Properties.ScrollBars = ssVertical
        Style.Color = 14281696
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clRed
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 3
      end
      object ViewButton: TcxButton
        Left = 502
        Top = 19
        Width = 123
        Height = 35
        Anchors = [akTop, akRight]
        Caption = #1055#1077#1088#1077#1075#1083#1103#1076' (Ctrl+P)'
        TabOrder = 0
        OnClick = ViewButtonClick
        Glyph.Data = {
          62060000424D6206000000000000220400002800000018000000180000000100
          08000000000040020000120B0000120B0000FB000000FB00000000000000FFFF
          FF0083829000FF00FF00908790009387910095848B00A8909000D6C4C400EDE5
          E500D3CCCC00F0EBEB00F6F4F4008D6362008C626100BC9C9B00865D5B00855D
          5B00AC878500B9979500B2939100A38F8E00BEA8A70091818000875B57009A6C
          6800A4787400A3787400DACFCE007A555100986B6600976A6500956964009468
          63008F6560008D635F0077545000C0ACAA00855E5900AE857F00B28B8600AD87
          8200A9847F008E625A008C605900AF898200B28C8500B8918A00A77D7500B58B
          8300E4D4D10095685D0091655B00BA938A00B18D8400BF9B920094807B00AA7D
          7100B48F8500C19B9000B9978E00986C5F00BF9D93009D706000C29C8E00A174
          6200A6796400B6968700C8A59500C7A49400BEA09300CDB4A800A96A4700AC78
          5A00AF826800AA7E6600C7A59300A48B7D00D3B9AA00DCA88700C7A79400A964
          3500B98B6C00B4876A00CCAF9B00C1926F00BC8F6D00D1AE9300C7997200C396
          7100E4D9D000A7724200C99B7300CB660000C9650000C7640000C6660700A772
          3E00AF794400EDB37C00EFBB8700D7B18A00D6B28D008F7A6600928E8A00BF84
          4400D3C0AC00D8C6B200AC753400B97F3A00F3C48D00F3C79300F2C79600F2C9
          9800DDC6AB00D9953C00D5923B00B1793100DF993E00DE983E00DB963D00D794
          3C00D6933C00D4913B00D3913B00C8893800F1C99300FE980000FA960000F3CD
          9600E2C9A600E8D1B100DDCEB800DFD0BB00FBF1E200EECD9700EECE9900F1D1
          9C00F7D6A300F4D3A100F1D19F00F5D6A400D5BA9000F7D9A900D8BE9400EFD3
          A500F6D9AB00FFE2B500FEE1B400F3D8AC00F3D9AE00E3CBA400F4DCB500EBD4
          AE00F5DEBB00F6E1BF00F5E1C000F6E3C400F9EBD400FAEDD800F9EEDC00FCF4
          E700EFCE9700F0CF9800EBCB9500E3C49000EFD09C00D5BA8D00F1D3A100F2D5
          A300D6BD9300F2D6A700DCC49B00F4DBB000F5DFB900F0DBB600F5E0BD00F6E4
          C400F7E6C900FAEACF00F8E9CE00ECDFC900F5E9D500FBF2E200FCF6EB00FAF5
          EC00FADEAA00F8DEAA00FAE4B400F9E4B800F9E6BC00ECDBB600FDFAF300FEFC
          F700FAE9BB00FBEBBC00F1E2B500EFE1B800FCEFC500EDE5CC00FBF0C700EFE8
          CF00FEF3C800F1EBD200FFF4C200FCF3CA00F1EBD000FFFEF900FCF5CD00FFFA
          D100FFFDD500FFFDD700FBF9DB00FFFFD900FFFFDB00FFFFDC00FFFFDE00FFFF
          E300FFFFF400FFFFFC0075775100009900000097000000CBFE0000C8FA009AA0
          A30056C0FF006A90A70059656C004FB5FC0054BBFF0059BBFF001A76BB002076
          B70051B5FC0053B4FA0053B4F90056A2D8001C7AC4001C75BB002174B5003788
          CF005599D6006A9BC6002D97FB002E97FC002D95F900FEFEFE00FAFAFA00F4F4
          F400EEEEEE00032C1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1B20030302E4680318
          9D9C9A9896ABA889A3A3A3A3A3A3A2A4220304EEF1E1032C9D9BAE98AD95ABA9
          8CA688878787A4A51905E8F5E2ED032CB47676767676777778737A747A797C65
          06EFF4E7EC03032B9F9EB4B2B1B0AF9997ACAA8EA7906615E9F6E7EB03030334
          B776767677787B7D6D625B616C754DF0F6E7EA0303030333B8A186A0B6B56A36
          2F373E3C3038E3F2E6E503030303033DC07676777969394ECED4D4CB8443070A
          F30303030303033FCFC1C0B95A2A32CFD5D5D5D5D1C545352403030303030341
          015D5D5F514601DAD5D5D5D6D08F82311D03030303030342015D7F804985D9D6
          D5D5D5D6CD709144110303030303034B015DDFE017C9D6D5D5D5D5D5BD648A50
          0D0303030303034A015DDDDE67C7D7D5D5D5D6C87163BB4C0E03030303030353
          015DDDDEDC6BD8D5D6D3C68D7E8BC4401003030303030352015D9394573AD2CA
          BE926F81B3DA72272603030303030356015D5D5D604854CCBA6F6EBCDB092E25
          230303030303035501010101F70B0F3B83C2C3BF471216FA2103030303030359
          0101010101F70C0813282D29141CF9F81F03030303030358015D5D5D5D5D5D5D
          5E5F5F5F5F5F5EF71E0303030303035C015D5D5D5D5D5D5D5D5D5D5D5D5D5D01
          1E0303030303035C010101010101010101010101010101011E0303030303035C
          4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F030303030303030303030303030303
          0303030303030303030303030303030303030303030303030303030303030303
          030303030303}
        UseSystemPaint = False
      end
      object PrintButton: TcxButton
        Left = 418
        Top = 26
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080
        TabOrder = 4
        OnClick = PrintButtonClick
      end
    end
    object DocGroupBox: TcxGroupBox
      Left = 3
      Top = -1
      Width = 376
      Height = 90
      Alignment = alTopLeft
      TabOrder = 1
      object Label6: TLabel
        Left = 6
        Top = 8
        Width = 111
        Height = 13
        Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 7
        Top = 50
        Width = 102
        Height = 13
        Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 144
        Top = 8
        Width = 58
        Height = 13
        Caption = #1055#1110#1076#1089#1090#1072#1074#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object NumDoc: TcxTextEdit
        Left = 6
        Top = 21
        Width = 130
        Height = 21
        Properties.MaxLength = 20
        Properties.ReadOnly = False
        Style.Color = 16247513
        TabOrder = 0
        OnKeyPress = NumDocKeyPress
      end
      object DateDoc: TcxDateEdit
        Left = 6
        Top = 63
        Width = 130
        Height = 21
        Properties.SaveTime = False
        Properties.ShowTime = False
        Style.Color = 16247513
        Style.ButtonStyle = btsUltraFlat
        Style.ButtonTransparency = ebtHideUnselected
        TabOrder = 1
        OnKeyPress = DateDocKeyPress
      end
      object NoteMemo: TcxMemo
        Left = 141
        Top = 21
        Width = 229
        Height = 63
        Properties.MaxLength = 200
        Properties.ReadOnly = False
        Properties.ScrollBars = ssVertical
        Style.Color = 16247513
        TabOrder = 2
        OnKeyPress = NoteMemoKeyPress
      end
    end
    object DbPanel: TPanel
      Left = 3
      Top = 118
      Width = 375
      Height = 299
      Anchors = [akLeft, akTop, akBottom]
      BevelOuter = bvNone
      TabOrder = 2
      object Splitter_Db: TcxSplitter
        Left = 0
        Top = 145
        Width = 375
        Height = 8
        HotZoneClassName = 'TcxMediaPlayer9Style'
        HotZone.SizePercent = 60
        AlignSplitter = salBottom
        AutoSnap = True
        ResizeUpdate = True
        Control = BottomPanel_Db
      end
      object Grid_Db: TcxGrid
        Left = 0
        Top = 22
        Width = 375
        Height = 123
        Align = alClient
        TabOrder = 1
        object TableView_Db: TcxGridTableView
          OnKeyDown = TableView_DbKeyDown
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = Name_Customer_Column_Db
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = Summa_Column_Db
            end>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OnFocusedRecordChanged = TableView_DbFocusedRecordChanged
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsSelection.HideFocusRect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderAutoHeight = True
          Styles.StyleSheet = N_StyleSheet
          object Name_Customer_Column_Db: TcxGridColumn
            Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Width = 213
          end
          object id_Dog_Column_Db: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            Options.Focusing = False
          end
          object Kod_Dog_Column_Db: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Focusing = False
          end
          object Tip_Dog_Column_Db: TcxGridColumn
            Caption = #1058#1080#1087' '#1076#1086#1075#1086#1074#1086#1088#1091
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Focusing = False
            Width = 92
          end
          object Reg_Num_Column_Db: TcxGridColumn
            Caption = #1056#1077#1108#1089#1090#1088'. '#8470
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Properties.Buttons = <
              item
                Default = True
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000120B0000120B00000000000000000000FF00FF4A667C
                  BE9596FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FF6B9CC31E89E84B7AA3C89693FF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4BB4FE51B5FF
                  2089E94B7AA2C69592FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF51B7FE51B3FF1D87E64E7AA0CA9792FF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  51B7FE4EB2FF1F89E64E7BA2B99497FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF52B8FE4BB1FF2787D95F6A76FF
                  00FFB0857FC09F94C09F96BC988EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF55BDFFB5D6EDBF9D92BB9B8CE7DAC2FFFFE3FFFFE5FDFADAD8C3
                  B3B58D85FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCEA795FD
                  EEBEFFFFD8FFFFDAFFFFDBFFFFE6FFFFFBEADDDCAE837FFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFC1A091FBDCA8FEF7D0FFFFDBFFFFE3FFFFF8FFFF
                  FDFFFFFDC6A99CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1A091FEE3ACF1
                  C491FCF2CAFFFFDDFFFFE4FFFFF7FFFFF7FFFFE9EEE5CBB9948CFF00FFFF00FF
                  FF00FFFF00FFFF00FFC2A191FFE6AEEEB581F7DCAEFEFDD8FFFFDFFFFFE3FFFF
                  E4FFFFE0F3ECD2BB968EFF00FFFF00FFFF00FFFF00FFFF00FFBC978CFBE7B7F4
                  C791F2C994F8E5B9FEFCD8FFFFDDFFFFDCFFFFE0E2D2BAB68E86FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFD9C3A9FFFEE5F7DCB8F2C994F5D4A5FAE8BDFDF4
                  C9FDFBD6B69089FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB58D85E8
                  DEDDFFFEF2F9D8A3F4C48CF9D49FFDEAB8D0B49FB89086FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFAD827FC9AA9EEFE0B7EFDFB2E7CEACB890
                  86B89086FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFBA968ABB988CB79188FF00FFFF00FFFF00FFFF00FF}
                Kind = bkGlyph
              end>
            Properties.ReadOnly = True
            Properties.OnButtonClick = Reg_Num_Column_DbPropertiesButtonClick
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 68
          end
          object Summa_Column_Db: TcxGridColumn
            Caption = #1057#1091#1084#1072
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.UseLeftAlignmentOnEditing = False
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 73
          end
          object Name_Shablon_Column_Db: TcxGridColumn
            Visible = False
          end
          object IDD_Column_Db: TcxGridColumn
            Caption = #1055#1086#1088#1103#1076#1082#1086#1074#1099#1081' '#1085#1086#1084#1077#1088' '#1089#1090#1088#1086#1082#1080
            Visible = False
          end
          object id_Customer_Column_Db: TcxGridColumn
            Visible = False
          end
        end
        object Grid_DbLevel: TcxGridLevel
          GridView = TableView_Db
        end
      end
      object DogDockControl_Db: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 375
        Height = 22
        Align = dalTop
        BarManager = BarManager
      end
      object BottomPanel_Db: TPanel
        Left = 0
        Top = 153
        Width = 375
        Height = 146
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 3
        object ProvGrid_Db: TcxGrid
          Left = 0
          Top = 22
          Width = 375
          Height = 124
          Align = alClient
          TabOrder = 0
          OnEnter = ProvGrid_DbEnter
          OnExit = ProvGrid_DbExit
          object ProvTableView_Db: TcxGridTableView
            OnKeyDown = ProvTableView_DbKeyDown
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skCount
                Column = Num_Sch_Column_Db
              end
              item
                Format = ',0.00;-,0.00'
                Kind = skSum
                Column = Prov_Summa_Column_Db
              end>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OnFocusedRecordChanged = ProvTableView_DbFocusedRecordChanged
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsSelection.HideFocusRect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.HeaderAutoHeight = True
            Styles.StyleSheet = N_StyleSheet
            object id_Prov_Column_Db: TcxGridColumn
              Visible = False
              Options.Focusing = False
            end
            object id_Sch_Column_Db: TcxGridColumn
              Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
              Visible = False
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Focusing = False
              Width = 147
            end
            object Num_Sch_Column_Db: TcxGridColumn
              Caption = #1056#1072#1093' '#1044#1073
              PropertiesClassName = 'TcxPopupEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Properties.PopupControl = SchGrid
              Properties.PopupWidth = 380
              Properties.OnCloseUp = Num_Sch_Column_DbPropertiesCloseUp
              Properties.OnPopup = Num_Sch_Column_DbPropertiesPopup
              FooterAlignmentHorz = taRightJustify
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Focusing = False
              Width = 56
            end
            object Name_Sch_Column_Db: TcxGridColumn
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              FooterAlignmentHorz = taRightJustify
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Focusing = False
              Width = 92
              IsCaptionAssigned = True
            end
            object id_S_Column_Db: TcxGridColumn
              Caption = #1057#1091#1084#1084#1072
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;-,0.00'
              Visible = False
              FooterAlignmentHorz = taRightJustify
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Focusing = False
              Width = 77
            end
            object id_R_Column_Db: TcxGridColumn
              Visible = False
              Options.Focusing = False
            end
            object id_St_Column_Db: TcxGridColumn
              Visible = False
              Options.Focusing = False
            end
            object Kod_S_Column_Db: TcxGridColumn
              Caption = #1050#1086#1096#1090
              PropertiesClassName = 'TcxButtonEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Properties.Buttons = <
                item
                  Default = True
                  Kind = bkEllipsis
                end>
              Properties.ReadOnly = True
              Properties.OnButtonClick = Kod_S_Column_DbPropertiesButtonClick
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              SortOrder = soDescending
              Width = 56
            end
            object Kod_R_Column_Db: TcxGridColumn
              Caption = #1056#1086#1079#1076#1110#1083
              PropertiesClassName = 'TcxButtonEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Properties.Buttons = <
                item
                  Default = True
                  Kind = bkEllipsis
                end>
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.Focusing = False
              Width = 56
            end
            object Kod_St_Column_Db: TcxGridColumn
              Caption = #1057#1090#1072#1090#1090#1103
              PropertiesClassName = 'TcxButtonEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Properties.Buttons = <
                item
                  Default = True
                  Kind = bkEllipsis
                end>
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.Focusing = False
              Width = 56
            end
            object kod_Kekv_Column_Db: TcxGridColumn
              Caption = #1050#1045#1050#1042
              PropertiesClassName = 'TcxButtonEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Properties.Buttons = <
                item
                  Default = True
                  Kind = bkEllipsis
                end>
              Properties.ReadOnly = True
              Properties.OnButtonClick = kod_Kekv_Column_DbPropertiesButtonClick
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 56
            end
            object Name_S_Column_Db: TcxGridColumn
              Visible = False
              Options.Focusing = False
            end
            object Name_R_Column_Db: TcxGridColumn
              Visible = False
              Options.Focusing = False
            end
            object Name_St_Column_Db: TcxGridColumn
              Visible = False
              Options.Focusing = False
            end
            object Prov_Summa_Column_Db: TcxGridColumn
              Caption = #1057#1091#1084#1072
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.Alignment.Vert = taVCenter
              Properties.DisplayFormat = ',0.00;-,0.00'
              Properties.Nullable = False
              Properties.UseLeftAlignmentOnEditing = False
              Properties.OnEditValueChanged = Prov_Summa_Column_DbPropertiesEditValueChanged
              FooterAlignmentHorz = taRightJustify
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 85
            end
            object State_Prov_Column_Db: TcxGridColumn
              Visible = False
              Options.Focusing = False
            end
            object id_Kekv_Column_Db: TcxGridColumn
              Visible = False
              Options.Focusing = False
            end
            object Name_Kekv_Column_Db: TcxGridColumn
              Visible = False
              Options.Focusing = False
            end
          end
          object ProvGrid_DbLevel: TcxGridLevel
            GridView = ProvTableView_Db
          end
        end
        object ProvDockControl_Db: TdxBarDockControl
          Left = 0
          Top = 0
          Width = 375
          Height = 22
          Align = dalTop
          BarManager = BarManager
        end
      end
    end
    object KrPanel: TPanel
      Left = 383
      Top = 118
      Width = 375
      Height = 299
      Anchors = [akLeft, akTop, akBottom]
      BevelOuter = bvNone
      TabOrder = 3
      object Splitter_Kr: TcxSplitter
        Left = 0
        Top = 145
        Width = 375
        Height = 8
        HotZoneClassName = 'TcxMediaPlayer9Style'
        HotZone.SizePercent = 61
        AlignSplitter = salBottom
        AutoSnap = True
        ResizeUpdate = True
        Control = BottomPanel_Kr
      end
      object Grid_Kr: TcxGrid
        Left = 0
        Top = 22
        Width = 375
        Height = 123
        Align = alClient
        TabOrder = 1
        object TableView_Kr: TcxGridTableView
          OnKeyDown = TableView_KrKeyDown
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = Name_Customer_Column_Kr
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = Summa_Column_Kr
            end>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OnFocusedRecordChanged = TableView_KrFocusedRecordChanged
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsSelection.HideFocusRect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderAutoHeight = True
          Styles.StyleSheet = N_StyleSheet
          object Name_Customer_Column_Kr: TcxGridColumn
            Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Width = 213
          end
          object id_Dog_Column_Kr: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            Options.Focusing = False
          end
          object Kod_Dog_Column_Kr: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Focusing = False
          end
          object Tip_Dog_Column_Kr: TcxGridColumn
            Caption = #1058#1080#1087' '#1076#1086#1075#1086#1074#1086#1088#1091
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Focusing = False
            Width = 92
          end
          object Reg_Num_Column_Kr: TcxGridColumn
            Caption = #1056#1077#1108#1089#1090#1088'. '#8470
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Properties.Buttons = <
              item
                Default = True
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000120B0000120B00000000000000000000FF00FF4A667C
                  BE9596FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FF6B9CC31E89E84B7AA3C89693FF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4BB4FE51B5FF
                  2089E94B7AA2C69592FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF51B7FE51B3FF1D87E64E7AA0CA9792FF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  51B7FE4EB2FF1F89E64E7BA2B99497FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF52B8FE4BB1FF2787D95F6A76FF
                  00FFB0857FC09F94C09F96BC988EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF55BDFFB5D6EDBF9D92BB9B8CE7DAC2FFFFE3FFFFE5FDFADAD8C3
                  B3B58D85FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCEA795FD
                  EEBEFFFFD8FFFFDAFFFFDBFFFFE6FFFFFBEADDDCAE837FFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFC1A091FBDCA8FEF7D0FFFFDBFFFFE3FFFFF8FFFF
                  FDFFFFFDC6A99CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1A091FEE3ACF1
                  C491FCF2CAFFFFDDFFFFE4FFFFF7FFFFF7FFFFE9EEE5CBB9948CFF00FFFF00FF
                  FF00FFFF00FFFF00FFC2A191FFE6AEEEB581F7DCAEFEFDD8FFFFDFFFFFE3FFFF
                  E4FFFFE0F3ECD2BB968EFF00FFFF00FFFF00FFFF00FFFF00FFBC978CFBE7B7F4
                  C791F2C994F8E5B9FEFCD8FFFFDDFFFFDCFFFFE0E2D2BAB68E86FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFD9C3A9FFFEE5F7DCB8F2C994F5D4A5FAE8BDFDF4
                  C9FDFBD6B69089FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB58D85E8
                  DEDDFFFEF2F9D8A3F4C48CF9D49FFDEAB8D0B49FB89086FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFAD827FC9AA9EEFE0B7EFDFB2E7CEACB890
                  86B89086FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFBA968ABB988CB79188FF00FFFF00FFFF00FFFF00FF}
                Kind = bkGlyph
              end>
            Properties.ReadOnly = True
            Properties.OnButtonClick = Reg_Num_Column_KrPropertiesButtonClick
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 68
          end
          object Summa_Column_Kr: TcxGridColumn
            Caption = #1057#1091#1084#1072
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.UseLeftAlignmentOnEditing = False
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 73
          end
          object Name_Shablon_Column_Kr: TcxGridColumn
            Visible = False
          end
          object IDD_Column_Kr: TcxGridColumn
            Caption = #1055#1086#1088#1103#1076#1082#1086#1074#1099#1081' '#1085#1086#1084#1077#1088' '#1089#1090#1088#1086#1082#1080
            Visible = False
          end
          object id_Customer_Column_Kr: TcxGridColumn
            Visible = False
          end
          object is_Active_ColumnKr: TcxGridColumn
            Visible = False
          end
          object Need_Out_Doc_ColumnKr: TcxGridColumn
            Visible = False
          end
        end
        object Grid_KrLevel: TcxGridLevel
          GridView = TableView_Kr
        end
      end
      object DogDockControl_Kr: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 375
        Height = 22
        Align = dalTop
        BarManager = BarManager
      end
      object BottomPanel_Kr: TPanel
        Left = 0
        Top = 153
        Width = 375
        Height = 146
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 3
        object ProvGrid_Kr: TcxGrid
          Left = 0
          Top = 22
          Width = 375
          Height = 124
          Align = alClient
          TabOrder = 0
          OnEnter = ProvGrid_KrEnter
          OnExit = ProvGrid_KrExit
          object ProvTableView_Kr: TcxGridTableView
            OnKeyDown = ProvTableView_KrKeyDown
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skCount
                Column = Num_Sch_Column_Kr
              end
              item
                Format = ',0.00;-,0.00'
                Kind = skSum
                Column = Prov_Summa_Column_Kr
              end>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OnFocusedRecordChanged = ProvTableView_DbFocusedRecordChanged
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsSelection.HideFocusRect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.HeaderAutoHeight = True
            Styles.StyleSheet = N_StyleSheet
            object id_Prov_Column_Kr: TcxGridColumn
              Visible = False
              Options.Focusing = False
            end
            object id_Sch_Column_Kr: TcxGridColumn
              Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
              Visible = False
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Focusing = False
              Width = 147
            end
            object Num_Sch_Column_Kr: TcxGridColumn
              Caption = #1056#1072#1093' '#1050#1088
              PropertiesClassName = 'TcxPopupEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Properties.PopupControl = SchGrid
              Properties.PopupWidth = 380
              Properties.OnCloseUp = Num_Sch_Column_KrPropertiesCloseUp
              Properties.OnPopup = Num_Sch_Column_KrPropertiesPopup
              FooterAlignmentHorz = taRightJustify
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Focusing = False
              Width = 56
            end
            object Name_Sch_Column_Kr: TcxGridColumn
              Caption = #1058#1080#1087' '#1076#1086#1075#1086#1074#1086#1088#1072
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              FooterAlignmentHorz = taRightJustify
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Focusing = False
              Width = 92
            end
            object id_S_Column_Kr: TcxGridColumn
              Caption = #1057#1091#1084#1084#1072
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;-,0.00'
              Visible = False
              FooterAlignmentHorz = taRightJustify
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Focusing = False
              Width = 77
            end
            object id_R_Column_Kr: TcxGridColumn
              Visible = False
              Options.Focusing = False
            end
            object id_St_Column_Kr: TcxGridColumn
              Visible = False
              Options.Focusing = False
            end
            object Kod_S_Column_Kr: TcxGridColumn
              Caption = #1050#1086#1096#1090
              PropertiesClassName = 'TcxButtonEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Properties.Buttons = <
                item
                  Default = True
                  Kind = bkEllipsis
                end>
              Properties.ReadOnly = True
              Properties.OnButtonClick = Kod_S_Column_KrPropertiesButtonClick
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 56
            end
            object Kod_R_Column_Kr: TcxGridColumn
              Caption = #1056#1086#1079#1076#1110#1083
              PropertiesClassName = 'TcxButtonEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Properties.Buttons = <
                item
                  Default = True
                  Kind = bkEllipsis
                end>
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.Focusing = False
              Width = 56
            end
            object Kod_St_Column_Kr: TcxGridColumn
              Caption = #1057#1090#1072#1090#1090#1103
              PropertiesClassName = 'TcxButtonEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Properties.Buttons = <
                item
                  Default = True
                  Kind = bkEllipsis
                end>
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.Focusing = False
              Width = 56
            end
            object kod_Kekv_Column_Kr: TcxGridColumn
              Caption = #1050#1045#1050#1042
              PropertiesClassName = 'TcxButtonEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Properties.Buttons = <
                item
                  Default = True
                  Kind = bkEllipsis
                end>
              Properties.ReadOnly = True
              Properties.OnButtonClick = kod_Kekv_Column_KrPropertiesButtonClick
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 56
            end
            object Name_S_Column_Kr: TcxGridColumn
              Visible = False
              Options.Focusing = False
            end
            object Name_R_Column_Kr: TcxGridColumn
              Visible = False
              Options.Focusing = False
            end
            object Name_St_Column_Kr: TcxGridColumn
              Visible = False
              Options.Focusing = False
            end
            object Prov_Summa_Column_Kr: TcxGridColumn
              Caption = #1057#1091#1084#1072
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.Alignment.Vert = taVCenter
              Properties.DisplayFormat = ',0.00;-,0.00'
              Properties.Nullable = False
              Properties.UseLeftAlignmentOnEditing = False
              Properties.OnEditValueChanged = Prov_Summa_Column_KrPropertiesEditValueChanged
              FooterAlignmentHorz = taRightJustify
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 88
            end
            object State_Prov_Column_Kr: TcxGridColumn
              Visible = False
              Options.Focusing = False
            end
            object id_Kekv_Column_Kr: TcxGridColumn
              Visible = False
              Options.Focusing = False
            end
            object Name_Kekv_Column_Kr: TcxGridColumn
              Visible = False
              Options.Focusing = False
            end
          end
          object ProvGrid_KrLevel: TcxGridLevel
            GridView = ProvTableView_Kr
          end
        end
        object ProvDockControl_Kr: TdxBarDockControl
          Left = 0
          Top = 0
          Width = 375
          Height = 22
          Align = dalTop
          BarManager = BarManager
        end
      end
    end
    object InfoPanel: TPanel
      Left = 383
      Top = 5
      Width = 376
      Height = 84
      BevelOuter = bvNone
      TabOrder = 4
      object Shape: TShape
        Left = 0
        Top = 0
        Width = 376
        Height = 84
        Align = alClient
        Brush.Color = 16247513
      end
      object St_Label: TLabel
        Left = 70
        Top = 53
        Width = 299
        Height = 13
        AutoSize = False
        Caption = 'St_Label'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Transparent = True
      end
      object R_Label: TLabel
        Left = 70
        Top = 37
        Width = 299
        Height = 13
        AutoSize = False
        Caption = 'R_Label'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Transparent = True
      end
      object S_Label: TLabel
        Left = 70
        Top = 21
        Width = 299
        Height = 13
        AutoSize = False
        Caption = 'S_Label'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Transparent = True
      end
      object Label15: TLabel
        Left = 13
        Top = 21
        Width = 53
        Height = 13
        Caption = #1050#1086#1096#1090#1086#1088#1080#1089':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label16: TLabel
        Left = 30
        Top = 37
        Width = 36
        Height = 13
        Caption = #1056#1086#1079#1076#1110#1083':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label17: TLabel
        Left = 29
        Top = 52
        Width = 37
        Height = 13
        Caption = #1057#1090#1072#1090#1090#1103':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label7: TLabel
        Left = 22
        Top = 3
        Width = 44
        Height = 13
        Caption = #1056#1072#1093#1091#1085#1086#1082':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Sch_Label: TLabel
        Left = 70
        Top = 3
        Width = 299
        Height = 13
        AutoSize = False
        Caption = 'Sch_Label'
        ParentShowHint = False
        ShowHint = True
        Transparent = True
      end
      object Label8: TLabel
        Left = 35
        Top = 67
        Width = 31
        Height = 13
        Caption = #1050#1045#1050#1042':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Kekv_Label: TLabel
        Left = 70
        Top = 67
        Width = 299
        Height = 13
        AutoSize = False
        Caption = 'Kekv_Label'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Transparent = True
      end
    end
    object SchGrid: TcxGrid
      Left = 518
      Top = 208
      Width = 380
      Height = 145
      TabOrder = 5
      Visible = False
      object SchTableView: TcxGridTableView
        OnDblClick = SchTableViewDblClick
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            Column = Num_Sch_Column2
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = N_StyleSheet
        object id_Sch_Column2: TcxGridColumn
          Visible = False
        end
        object Num_Sch_Column2: TcxGridColumn
          Caption = #1053#1086#1084#1077#1088' '#1088#1072#1093#1091#1085#1082#1072
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 90
        end
        object Name_Sch_Column2: TcxGridColumn
          Caption = #1053#1072#1079#1074#1072' '#1088#1072#1093#1091#1085#1082#1072
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 285
        end
      end
      object SchGridLevel: TcxGridLevel
        GridView = SchTableView
      end
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 317
    Top = 440
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
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
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor]
      Color = 8453888
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16777088
      TextColor = clBlue
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor]
      Color = 8453888
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16777088
      TextColor = clBlue
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor]
      Color = clMoneyGreen
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clMoneyGreen
      TextColor = clBlack
    end
    object cxStyle31: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clMoneyGreen
      TextColor = clBlack
    end
    object cxStyle32: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14084566
      TextColor = clBlack
    end
    object cxStyle33: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle34: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle35: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle36: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle37: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle38: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
    object cxStyle39: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clYellow
      TextColor = clBlack
    end
    object cxStyle40: TcxStyle
      AssignedValues = [svColor]
      Color = clBtnFace
    end
    object cxStyle41: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clSilver
    end
    object cxStyle42: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clHighlight
      TextColor = clWhite
    end
    object N_StyleSheet: TcxGridTableViewStyleSheet
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
      Styles.Preview = cxStyle13
      BuiltIn = True
    end
    object Cor_StyleSheet: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle29
      Styles.Content = cxStyle30
      Styles.ContentEven = cxStyle31
      Styles.ContentOdd = cxStyle32
      Styles.Inactive = cxStyle38
      Styles.IncSearch = cxStyle39
      Styles.Selection = cxStyle42
      Styles.FilterBox = cxStyle33
      Styles.Footer = cxStyle34
      Styles.Group = cxStyle35
      Styles.GroupByBox = cxStyle36
      Styles.Header = cxStyle37
      Styles.Indicator = cxStyle40
      Styles.Preview = cxStyle41
      BuiltIn = True
    end
  end
  object BarManager: TdxBarManager
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
        Caption = 'DbProvToolBar'
        DockControl = ProvDockControl_Db
        DockedDockControl = ProvDockControl_Db
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 276
        FloatTop = 213
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = AddProvButton_Db
            Visible = True
          end
          item
            Item = EditProvButton_Db
            Visible = True
          end
          item
            Item = DelProvButton_Db
            Visible = True
          end>
        Name = 'DbProvToolBar'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = False
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = 'DbDogToolBar'
        DockControl = DogDockControl_Db
        DockedDockControl = DogDockControl_Db
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 276
        FloatTop = 213
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = AddDogButton_Db
            Visible = True
          end
          item
            Item = EditDogButton_Db
            Visible = True
          end
          item
            Item = DelDogButton_Db
            Visible = True
          end>
        Name = 'DbDogToolBar'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = False
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = 'KrProvToolBar'
        DockControl = ProvDockControl_Kr
        DockedDockControl = ProvDockControl_Kr
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 276
        FloatTop = 213
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = AddProvButton_Kr
            Visible = True
          end
          item
            Item = EditProvButton_Kr
            Visible = True
          end
          item
            Item = DelProvButton_Kr
            Visible = True
          end>
        Name = 'KrProvToolBar'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = False
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = 'KrDogToolBar'
        DockControl = DogDockControl_Kr
        DockedDockControl = DogDockControl_Kr
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 276
        FloatTop = 213
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = AddDogButton_Kr
            Visible = True
          end
          item
            Item = EditDogButton_Kr
            Visible = True
          end
          item
            Item = DelDogButton_Kr
            Visible = True
          end>
        Name = 'KrDogToolBar'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = False
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    Style = bmsOffice11
    UseSystemFont = True
    Left = 352
    Top = 440
    DockControlHeights = (
      0
      0
      0
      0)
    object AddDogButton_Db: TdxBarButton
      Caption = #1044#1086#1076#1072#1090#1080' '
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080' '#1076#1086#1075#1086#1074#1086#1088
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769FF00FFFF00FFFF00FFB79184FEE9C7F4DAB5F3D5AAF2D0A0EF
        CB96EFC68BEDC182EBC17FEBC180EBC180F2C782A46769FF00FFFF00FFFF00FF
        B79187FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
        7FEFC481A46769FF00FFFF00FFFF00FFB7938AFEEFDAF6E0C6F2DABCECD0AEDD
        C19CD7B78FDBB88BE5BD89E9BD82E9BD7FEFC481A46769FF00FFFF00FFFF00FF
        BA978FFFF4E5F7E5CFF4E0C5E1CAADBCA589A89275B99E7BDBB88AEBC28AEABF
        81EFC480A46769FF00FFFF00FFFF00FFC09E95FFFBF0F2E4D7E4D2C0004B0000
        4B00004B00A28C72C4A883DBB78AE5BD87EFC583A46769FF00FFFF00FFFF00FF
        C6A49AFFFFFCE7DED5C1B6A9004B000D9A1A004B0097856EA28C71B99E7AD9B8
        88F2C98CA46769FF00FFFF00FFFF00FFCBA99EFFFFFF004B00004B00004B0016
        AC2D004B00004B00004B00A89275D7B88FF3CE97A46769FF00FFFF00FFFF00FF
        CFAC9FFFFFFF004B0031DA602BD05423C2441AB43413A525004B00BDA589DEC1
        9AF6D3A0A46769FF00FFFF00FFFF00FFD4B0A1FFFFFF004B00004B00004B002E
        D55A004B00004B00004B00E1C9AAEED3ADEBCFA4A46769FF00FFFF00FFFF00FF
        D9B5A1FFFFFFFFFFFFFFFFFF004B0034DE65004B00C1B5A8E6D6C1FBEACEDECE
        B4B6AA93A46769FF00FFFF00FFFF00FFDDB7A4FFFFFFFFFFFFFFFFFF004B0000
        4B00004B00E9E1D5E7D3C4B68A7BA17B6F9C7667A46769FF00FFFF00FFFF00FF
        E2BCA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAAD735BE19E
        55E68F31B56D4DFF00FFFF00FFFF00FFE6BFA7FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFDCC7C5B88265F8B55CBF7A5CFF00FFFF00FFFF00FFFF00FF
        E4BCA4FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0B77F62C183
        6CFF00FFFF00FFFF00FFFF00FFFF00FFE8C4ADEBCBB7EBCBB7EACBB7EACAB6EA
        CAB6EACAB6EACAB6E3C2B1A56B5FFF00FFFF00FFFF00FFFF00FF}
      OnClick = AddDogButton_DbClick
    end
    object DelDogButton_Db: TdxBarButton
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1076#1086#1075#1086#1074#1086#1088' '
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E0000
        6EFF00FFFF00FFFF00FFFF00FFFF00FF00006E001DE80010DC00006EFF00FFFF
        00FFFF00FFFF00FF00006E0004E20008E700006EFF00FFFF00FFFF00FFFF00FF
        00006E001AE2001FEB0010D900006EFF00FFFF00FF00006E0005DF0009EB0003
        DB00006EFF00FFFF00FFFF00FFFF00FFFF00FF00006E001ADF0020EB0013DC00
        006E00006E0005E2000BEB0004DA00006EFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00006E001BDF0022EB0012E60008EA0009EB0004DF00006EFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E001BE300
        16EB0011EB000ADF00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00006E0021E7001EEB001AEB0017DF00006EFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E062DE30430EB00
        20E2001EE20027EB0019DF00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00006E0C35E40E3CEB052BDC00006E00006E001FDC002AEB001CDF0000
        6EFF00FFFF00FFFF00FFFF00FFFF00FF00006E1442E41645EB092ED900006EFF
        00FFFF00FF00006E0020D9012CEB001FE200006EFF00FFFF00FFFF00FFFF00FF
        00006E1C4BE71037DB00006EFF00FFFF00FFFF00FFFF00FF00006E0022DC0027
        E400006EFF00FFFF00FFFF00FFFF00FFFF00FF00006E00006EFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = DelDogButton_DbClick
    end
    object AddDogButton_Kr: TdxBarButton
      Caption = #1044#1086#1076#1072#1090#1080' '
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080' '#1076#1086#1075#1086#1074#1086#1088
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769FF00FFFF00FFFF00FFB79184FEE9C7F4DAB5F3D5AAF2D0A0EF
        CB96EFC68BEDC182EBC17FEBC180EBC180F2C782A46769FF00FFFF00FFFF00FF
        B79187FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
        7FEFC481A46769FF00FFFF00FFFF00FFB7938AFEEFDAF6E0C6F2DABCECD0AEDD
        C19CD7B78FDBB88BE5BD89E9BD82E9BD7FEFC481A46769FF00FFFF00FFFF00FF
        BA978FFFF4E5F7E5CFF4E0C5E1CAADBCA589A89275B99E7BDBB88AEBC28AEABF
        81EFC480A46769FF00FFFF00FFFF00FFC09E95FFFBF0F2E4D7E4D2C0004B0000
        4B00004B00A28C72C4A883DBB78AE5BD87EFC583A46769FF00FFFF00FFFF00FF
        C6A49AFFFFFCE7DED5C1B6A9004B000D9A1A004B0097856EA28C71B99E7AD9B8
        88F2C98CA46769FF00FFFF00FFFF00FFCBA99EFFFFFF004B00004B00004B0016
        AC2D004B00004B00004B00A89275D7B88FF3CE97A46769FF00FFFF00FFFF00FF
        CFAC9FFFFFFF004B0031DA602BD05423C2441AB43413A525004B00BDA589DEC1
        9AF6D3A0A46769FF00FFFF00FFFF00FFD4B0A1FFFFFF004B00004B00004B002E
        D55A004B00004B00004B00E1C9AAEED3ADEBCFA4A46769FF00FFFF00FFFF00FF
        D9B5A1FFFFFFFFFFFFFFFFFF004B0034DE65004B00C1B5A8E6D6C1FBEACEDECE
        B4B6AA93A46769FF00FFFF00FFFF00FFDDB7A4FFFFFFFFFFFFFFFFFF004B0000
        4B00004B00E9E1D5E7D3C4B68A7BA17B6F9C7667A46769FF00FFFF00FFFF00FF
        E2BCA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAAD735BE19E
        55E68F31B56D4DFF00FFFF00FFFF00FFE6BFA7FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFDCC7C5B88265F8B55CBF7A5CFF00FFFF00FFFF00FFFF00FF
        E4BCA4FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0B77F62C183
        6CFF00FFFF00FFFF00FFFF00FFFF00FFE8C4ADEBCBB7EBCBB7EACBB7EACAB6EA
        CAB6EACAB6EACAB6E3C2B1A56B5FFF00FFFF00FFFF00FFFF00FF}
      OnClick = AddDogButton_KrClick
    end
    object DelDogButton_Kr: TdxBarButton
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1076#1086#1075#1086#1074#1086#1088
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E0000
        6EFF00FFFF00FFFF00FFFF00FFFF00FF00006E001DE80010DC00006EFF00FFFF
        00FFFF00FFFF00FF00006E0004E20008E700006EFF00FFFF00FFFF00FFFF00FF
        00006E001AE2001FEB0010D900006EFF00FFFF00FF00006E0005DF0009EB0003
        DB00006EFF00FFFF00FFFF00FFFF00FFFF00FF00006E001ADF0020EB0013DC00
        006E00006E0005E2000BEB0004DA00006EFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00006E001BDF0022EB0012E60008EA0009EB0004DF00006EFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E001BE300
        16EB0011EB000ADF00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00006E0021E7001EEB001AEB0017DF00006EFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E062DE30430EB00
        20E2001EE20027EB0019DF00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00006E0C35E40E3CEB052BDC00006E00006E001FDC002AEB001CDF0000
        6EFF00FFFF00FFFF00FFFF00FFFF00FF00006E1442E41645EB092ED900006EFF
        00FFFF00FF00006E0020D9012CEB001FE200006EFF00FFFF00FFFF00FFFF00FF
        00006E1C4BE71037DB00006EFF00FFFF00FFFF00FFFF00FF00006E0022DC0027
        E400006EFF00FFFF00FFFF00FFFF00FFFF00FF00006E00006EFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = DelDogButton_KrClick
    end
    object AddProvButton_Db: TdxBarButton
      Caption = #1044#1086#1076#1072#1090#1080' '#1087#1088#1086#1074#1086#1076#1082#1091
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080' '#1087#1088#1086#1074#1086#1076#1082#1091
      Visible = ivAlways
      Glyph.Data = {
        36030000424D360300000000000036000000280000000F000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFA46769
        A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769FF00FF000000FF00FFB79184FEE9C7F4DAB5F3D5AAF2D0A0EFCB96EF
        C68BEDC182EBC17FEBC180EBC180F2C782A46769FF00FF000000FF00FFB79187
        FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD7FEFC4
        81A46769FF00FF000000FF00FFB7938AFEEFDAF6E0C6F2DABCECD0AEDDC19CD7
        B78FDBB88BE5BD89E9BD82E9BD7FEFC481A46769FF00FF000000FF00FFBA978F
        FFF4E5F7E5CFF4E0C5E1CAADBCA589A89275B99E7BDBB88AEBC28AEABF81EFC4
        80A46769FF00FF000000FF00FFC09E95FFFBF0F2E4D7E4D2C080000080000080
        0000A28C72C4A883DBB78AE5BD87EFC583A46769FF00FF000000FF00FFC6A49A
        FFFFFCE7DED5C1B6A9800000F7E5CF80000097856EA28C71B99E7AD9B888F2C9
        8CA46769FF00FF000000FF00FFCBA99EFFFFFF800000800000800000F7E5CF80
        0000800000800000A89275D7B88FF3CE97A46769FF00FF000000FF00FFCFAC9F
        FFFFFF800000F7E5CFF7E5CFF7E5CFF7E5CFF7E5CF800000BDA589DEC19AF6D3
        A0A46769FF00FF000000FF00FFD4B0A1FFFFFF800000800000800000F7E5CF80
        0000800000800000E1C9AAEED3ADEBCFA4A46769FF00FF000000FF00FFD9B5A1
        FFFFFFFFFFFFFFFFFF800000F7E5CF800000C1B5A8E6D6C1FBEACEDECEB4B6AA
        93A46769FF00FF000000FF00FFDDB7A4FFFFFFFFFFFFFFFFFF80000080000080
        0000E9E1D5E7D3C4B68A7BA17B6F9C7667A46769FF00FF000000FF00FFE2BCA5
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAAD735BE19E55E68F
        31B56D4DFF00FF000000FF00FFE6BFA7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFDCC7C5B88265F8B55CBF7A5CFF00FFFF00FF000000FF00FFE4BCA4
        FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0B77F62C1836CFF00
        FFFF00FFFF00FF000000FF00FFE8C4ADEBCBB7EBCBB7EACBB7EACAB6EACAB6EA
        CAB6EACAB6E3C2B1A56B5FFF00FFFF00FFFF00FFFF00FF000000}
      OnClick = AddProvButton_DbClick
    end
    object EditProvButton_Db: TdxBarButton
      Caption = #1047#1084#1110#1085#1080#1090#1080' '#1087#1088#1086#1074#1086#1076#1082#1091
      Category = 0
      Hint = #1047#1084#1110#1085#1080#1090#1080' '#1087#1088#1086#1074#1086#1076#1082#1091
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFA46769A46769A46769A46769A46769A46769A46769A4
        6769A46769A46769A46769A46769A46769FF00FFFF00FFFF00FFA46769FCEACE
        F0D8BADCC1A0C4AA89BFA480CFAF82DCB581E2B87EE7BC7EE9BD7FEFC481A467
        69FF00FFFF00FFFF00FFA0675BFEEFDAF6E0C6302D2D212527374546998468AD
        926FC2A074DCB27AE7BC7EEFC481A46769FF00FFFF00FFFF00FFA0675BFFF4E5
        F7E5CF9C8F800D46630362920B3B544B4741917B5EB5976CD1AB74E9BF7DA467
        69FF00FFFF00FFFF00FFA7756BFFFBF0F8EADCEEDDCA22576C165E82745D657D
        52545E3F39867258A78C66CEAA73A06567FF00FFFF00FFFF00FFA7756BFFFFFC
        FAF0E6F8EADA8F9F9D62555DDD908CB879798E57575B3D377D6B519A815D925C
        5EFF00FFFF00FFFF00FFBC8268FFFFFFFEF7F2FAEFE6F0E5D56B5D62E9A4A1CF
        9090B27575875353583C357A6950815354FF00FFFF00FFFF00FFBC8268FFFFFF
        FFFEFCFCF6F0FAEFE6EBDCCE8C5E5DE2A1A1CE8F8FB476768652525C3F38764C
        4EFF00FFFF00FFFF00FFD1926DFFFFFFFFFFFFFFFEFCFEF7F0FAEFE5E1CEC087
        5958E1A1A1CC8E8EB07474865151633B3CFF00FFFF00FFFF00FFD1926DFFFFFF
        FFFFFFFFFFFFFFFEFCFCF7F0FAEFE5D7C1B58A5B5BE6A6A6CA8B8BB675757E44
        423E4145FF00FFFF00FFDA9D75FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFCF6EFFC
        F3E6CFB5AA976666EFAAA98C6D731E799F0C98BD0C98BDFF00FFDA9D75FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BA955F569E5D582D84A706BB
        F0008EDE000F95000081E7AB79FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFDCC7C5A56B5FD1914F068FC10393DE0320BA0318B2010B99E7AB79FBF4F0
        FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A56B5FC1836CFF00FF0263
        BF2F45ED1031D3010A95E7AB79D1926DD1926DD1926DD1926DD1926DD1926DD1
        926DD1926DA56B5FFF00FFFF00FFFF00FF2732D00C19B4FF00FF}
      OnClick = EditProvButton_DbClick
    end
    object DelProvButton_Db: TdxBarButton
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1087#1088#1086#1074#1086#1076#1082#1091
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E0000
        6EFF00FFFF00FFFF00FFFF00FFFF00FF00006E001DE80010DC00006EFF00FFFF
        00FFFF00FFFF00FF00006E0004E20008E700006EFF00FFFF00FFFF00FFFF00FF
        00006E001AE2001FEB0010D900006EFF00FFFF00FF00006E0005DF0009EB0003
        DB00006EFF00FFFF00FFFF00FFFF00FFFF00FF00006E001ADF0020EB0013DC00
        006E00006E0005E2000BEB0004DA00006EFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00006E001BDF0022EB0012E60008EA0009EB0004DF00006EFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E001BE300
        16EB0011EB000ADF00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00006E0021E7001EEB001AEB0017DF00006EFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E062DE30430EB00
        20E2001EE20027EB0019DF00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00006E0C35E40E3CEB052BDC00006E00006E001FDC002AEB001CDF0000
        6EFF00FFFF00FFFF00FFFF00FFFF00FF00006E1442E41645EB092ED900006EFF
        00FFFF00FF00006E0020D9012CEB001FE200006EFF00FFFF00FFFF00FFFF00FF
        00006E1C4BE71037DB00006EFF00FFFF00FFFF00FFFF00FF00006E0022DC0027
        E400006EFF00FFFF00FFFF00FFFF00FFFF00FF00006E00006EFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = DelProvButton_DbClick
    end
    object AddProvButton_Kr: TdxBarButton
      Caption = #1044#1086#1076#1072#1090#1080' '
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080' '#1087#1088#1086#1074#1086#1076#1082#1091
      Visible = ivAlways
      Glyph.Data = {
        36030000424D360300000000000036000000280000000F000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFA46769
        A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769FF00FF000000FF00FFB79184FEE9C7F4DAB5F3D5AAF2D0A0EFCB96EF
        C68BEDC182EBC17FEBC180EBC180F2C782A46769FF00FF000000FF00FFB79187
        FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD7FEFC4
        81A46769FF00FF000000FF00FFB7938AFEEFDAF6E0C6F2DABCECD0AEDDC19CD7
        B78FDBB88BE5BD89E9BD82E9BD7FEFC481A46769FF00FF000000FF00FFBA978F
        FFF4E5F7E5CFF4E0C5E1CAADBCA589A89275B99E7BDBB88AEBC28AEABF81EFC4
        80A46769FF00FF000000FF00FFC09E95FFFBF0F2E4D7E4D2C080000080000080
        0000A28C72C4A883DBB78AE5BD87EFC583A46769FF00FF000000FF00FFC6A49A
        FFFFFCE7DED5C1B6A9800000F7E5CF80000097856EA28C71B99E7AD9B888F2C9
        8CA46769FF00FF000000FF00FFCBA99EFFFFFF800000800000800000F7E5CF80
        0000800000800000A89275D7B88FF3CE97A46769FF00FF000000FF00FFCFAC9F
        FFFFFF800000F7E5CFF7E5CFF7E5CFF7E5CFF7E5CF800000BDA589DEC19AF6D3
        A0A46769FF00FF000000FF00FFD4B0A1FFFFFF800000800000800000F7E5CF80
        0000800000800000E1C9AAEED3ADEBCFA4A46769FF00FF000000FF00FFD9B5A1
        FFFFFFFFFFFFFFFFFF800000F7E5CF800000C1B5A8E6D6C1FBEACEDECEB4B6AA
        93A46769FF00FF000000FF00FFDDB7A4FFFFFFFFFFFFFFFFFF80000080000080
        0000E9E1D5E7D3C4B68A7BA17B6F9C7667A46769FF00FF000000FF00FFE2BCA5
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAAD735BE19E55E68F
        31B56D4DFF00FF000000FF00FFE6BFA7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFDCC7C5B88265F8B55CBF7A5CFF00FFFF00FF000000FF00FFE4BCA4
        FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0B77F62C1836CFF00
        FFFF00FFFF00FF000000FF00FFE8C4ADEBCBB7EBCBB7EACBB7EACAB6EACAB6EA
        CAB6EACAB6E3C2B1A56B5FFF00FFFF00FFFF00FFFF00FF000000}
      OnClick = AddProvButton_KrClick
    end
    object EditProvButton_Kr: TdxBarButton
      Caption = #1047#1084#1110#1085#1080#1090#1080' '
      Category = 0
      Hint = #1047#1084#1110#1085#1080#1090#1080' '#1087#1088#1086#1074#1086#1076#1082#1091
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFA46769A46769A46769A46769A46769A46769A46769A4
        6769A46769A46769A46769A46769A46769FF00FFFF00FFFF00FFA46769FCEACE
        F0D8BADCC1A0C4AA89BFA480CFAF82DCB581E2B87EE7BC7EE9BD7FEFC481A467
        69FF00FFFF00FFFF00FFA0675BFEEFDAF6E0C6302D2D212527374546998468AD
        926FC2A074DCB27AE7BC7EEFC481A46769FF00FFFF00FFFF00FFA0675BFFF4E5
        F7E5CF9C8F800D46630362920B3B544B4741917B5EB5976CD1AB74E9BF7DA467
        69FF00FFFF00FFFF00FFA7756BFFFBF0F8EADCEEDDCA22576C165E82745D657D
        52545E3F39867258A78C66CEAA73A06567FF00FFFF00FFFF00FFA7756BFFFFFC
        FAF0E6F8EADA8F9F9D62555DDD908CB879798E57575B3D377D6B519A815D925C
        5EFF00FFFF00FFFF00FFBC8268FFFFFFFEF7F2FAEFE6F0E5D56B5D62E9A4A1CF
        9090B27575875353583C357A6950815354FF00FFFF00FFFF00FFBC8268FFFFFF
        FFFEFCFCF6F0FAEFE6EBDCCE8C5E5DE2A1A1CE8F8FB476768652525C3F38764C
        4EFF00FFFF00FFFF00FFD1926DFFFFFFFFFFFFFFFEFCFEF7F0FAEFE5E1CEC087
        5958E1A1A1CC8E8EB07474865151633B3CFF00FFFF00FFFF00FFD1926DFFFFFF
        FFFFFFFFFFFFFFFEFCFCF7F0FAEFE5D7C1B58A5B5BE6A6A6CA8B8BB675757E44
        423E4145FF00FFFF00FFDA9D75FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFCF6EFFC
        F3E6CFB5AA976666EFAAA98C6D731E799F0C98BD0C98BDFF00FFDA9D75FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BA955F569E5D582D84A706BB
        F0008EDE000F95000081E7AB79FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFDCC7C5A56B5FD1914F068FC10393DE0320BA0318B2010B99E7AB79FBF4F0
        FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A56B5FC1836CFF00FF0263
        BF2F45ED1031D3010A95E7AB79D1926DD1926DD1926DD1926DD1926DD1926DD1
        926DD1926DA56B5FFF00FFFF00FFFF00FF2732D00C19B4FF00FF}
      OnClick = EditProvButton_KrClick
    end
    object DelProvButton_Kr: TdxBarButton
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1087#1088#1086#1074#1086#1076#1082#1091
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E0000
        6EFF00FFFF00FFFF00FFFF00FFFF00FF00006E001DE80010DC00006EFF00FFFF
        00FFFF00FFFF00FF00006E0004E20008E700006EFF00FFFF00FFFF00FFFF00FF
        00006E001AE2001FEB0010D900006EFF00FFFF00FF00006E0005DF0009EB0003
        DB00006EFF00FFFF00FFFF00FFFF00FFFF00FF00006E001ADF0020EB0013DC00
        006E00006E0005E2000BEB0004DA00006EFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00006E001BDF0022EB0012E60008EA0009EB0004DF00006EFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E001BE300
        16EB0011EB000ADF00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00006E0021E7001EEB001AEB0017DF00006EFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E062DE30430EB00
        20E2001EE20027EB0019DF00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00006E0C35E40E3CEB052BDC00006E00006E001FDC002AEB001CDF0000
        6EFF00FFFF00FFFF00FFFF00FFFF00FF00006E1442E41645EB092ED900006EFF
        00FFFF00FF00006E0020D9012CEB001FE200006EFF00FFFF00FFFF00FFFF00FF
        00006E1C4BE71037DB00006EFF00FFFF00FFFF00FFFF00FF00006E0022DC0027
        E400006EFF00FFFF00FFFF00FFFF00FFFF00FF00006E00006EFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = DelProvButton_KrClick
    end
    object EditDogButton_Db: TdxBarButton
      Caption = #1047#1084#1110#1085#1080#1090#1080' '#1076#1086#1075#1086#1074#1110#1088
      Category = 0
      Hint = #1047#1084#1110#1085#1080#1090#1080' '#1076#1086#1075#1086#1074#1110#1088
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFA46769A46769A46769A46769A46769A46769A46769A4
        6769A46769A46769A46769A46769A46769FF00FFFF00FFFF00FFA46769FCEACE
        F0D8BADCC1A0C4AA89BFA480CFAF82DCB581E2B87EE7BC7EE9BD7FEFC481A467
        69FF00FFFF00FFFF00FFA0675BFEEFDAF6E0C6302D2D212527374546998468AD
        926FC2A074DCB27AE7BC7EEFC481A46769FF00FFFF00FFFF00FFA0675BFFF4E5
        F7E5CF9C8F800D46630362920B3B544B4741917B5EB5976CD1AB74E9BF7DA467
        69FF00FFFF00FFFF00FFA7756BFFFBF0F8EADCEEDDCA22576C165E82745D657D
        52545E3F39867258A78C66CEAA73A06567FF00FFFF00FFFF00FFA7756BFFFFFC
        FAF0E6F8EADA8F9F9D62555DDD908CB879798E57575B3D377D6B519A815D925C
        5EFF00FFFF00FFFF00FFBC8268FFFFFFFEF7F2FAEFE6F0E5D56B5D62E9A4A1CF
        9090B27575875353583C357A6950815354FF00FFFF00FFFF00FFBC8268FFFFFF
        FFFEFCFCF6F0FAEFE6EBDCCE8C5E5DE2A1A1CE8F8FB476768652525C3F38764C
        4EFF00FFFF00FFFF00FFD1926DFFFFFFFFFFFFFFFEFCFEF7F0FAEFE5E1CEC087
        5958E1A1A1CC8E8EB07474865151633B3CFF00FFFF00FFFF00FFD1926DFFFFFF
        FFFFFFFFFFFFFFFEFCFCF7F0FAEFE5D7C1B58A5B5BE6A6A6CA8B8BB675757E44
        423E4145FF00FFFF00FFDA9D75FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFCF6EFFC
        F3E6CFB5AA976666EFAAA98C6D731E799F0C98BD0C98BDFF00FFDA9D75FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BA955F569E5D582D84A706BB
        F0008EDE000F95000081E7AB79FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFDCC7C5A56B5FD1914F068FC10393DE0320BA0318B2010B99E7AB79FBF4F0
        FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A56B5FC1836CFF00FF0263
        BF2F45ED1031D3010A95E7AB79D1926DD1926DD1926DD1926DD1926DD1926DD1
        926DD1926DA56B5FFF00FFFF00FFFF00FF2732D00C19B4FF00FF}
      OnClick = EditDogButton_DbClick
    end
    object EditDogButton_Kr: TdxBarButton
      Caption = #1047#1084#1110#1085#1080#1090#1080' '#1076#1086#1075#1086#1074#1110#1088
      Category = 0
      Hint = #1047#1084#1110#1085#1080#1090#1080' '#1076#1086#1075#1086#1074#1110#1088
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFA46769A46769A46769A46769A46769A46769A46769A4
        6769A46769A46769A46769A46769A46769FF00FFFF00FFFF00FFA46769FCEACE
        F0D8BADCC1A0C4AA89BFA480CFAF82DCB581E2B87EE7BC7EE9BD7FEFC481A467
        69FF00FFFF00FFFF00FFA0675BFEEFDAF6E0C6302D2D212527374546998468AD
        926FC2A074DCB27AE7BC7EEFC481A46769FF00FFFF00FFFF00FFA0675BFFF4E5
        F7E5CF9C8F800D46630362920B3B544B4741917B5EB5976CD1AB74E9BF7DA467
        69FF00FFFF00FFFF00FFA7756BFFFBF0F8EADCEEDDCA22576C165E82745D657D
        52545E3F39867258A78C66CEAA73A06567FF00FFFF00FFFF00FFA7756BFFFFFC
        FAF0E6F8EADA8F9F9D62555DDD908CB879798E57575B3D377D6B519A815D925C
        5EFF00FFFF00FFFF00FFBC8268FFFFFFFEF7F2FAEFE6F0E5D56B5D62E9A4A1CF
        9090B27575875353583C357A6950815354FF00FFFF00FFFF00FFBC8268FFFFFF
        FFFEFCFCF6F0FAEFE6EBDCCE8C5E5DE2A1A1CE8F8FB476768652525C3F38764C
        4EFF00FFFF00FFFF00FFD1926DFFFFFFFFFFFFFFFEFCFEF7F0FAEFE5E1CEC087
        5958E1A1A1CC8E8EB07474865151633B3CFF00FFFF00FFFF00FFD1926DFFFFFF
        FFFFFFFFFFFFFFFEFCFCF7F0FAEFE5D7C1B58A5B5BE6A6A6CA8B8BB675757E44
        423E4145FF00FFFF00FFDA9D75FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFCF6EFFC
        F3E6CFB5AA976666EFAAA98C6D731E799F0C98BD0C98BDFF00FFDA9D75FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BA955F569E5D582D84A706BB
        F0008EDE000F95000081E7AB79FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFDCC7C5A56B5FD1914F068FC10393DE0320BA0318B2010B99E7AB79FBF4F0
        FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A56B5FC1836CFF00FF0263
        BF2F45ED1031D3010A95E7AB79D1926DD1926DD1926DD1926DD1926DD1926DD1
        926DD1926DA56B5FFF00FFFF00FFFF00FF2732D00C19B4FF00FF}
      OnClick = EditDogButton_KrClick
    end
  end
  object Database: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = WriteTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 107
    Top = 428
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 139
    Top = 428
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 171
    Top = 428
  end
  object DataSet: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 107
    Top = 460
    poSQLINT64ToBCD = True
  end
  object Timer: TTimer
    Enabled = False
    Interval = 10
    OnTimer = TimerTimer
    Left = 248
    Top = 440
  end
  object FlashTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = FlashTimerTimer
    Left = 280
    Top = 440
  end
  object StoredProc: TpFIBStoredProc
    Database = Database
    Transaction = WriteTransaction
    Left = 139
    Top = 460
  end
  object ActionList1: TActionList
    Left = 211
    Top = 436
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 16464
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 121
      OnExecute = Action2Execute
    end
  end
  object PDataset: TfrxDBDataset
    UserName = 'PDataset'
    CloseDataSource = False
    DataSet = PMemoryData
    Left = 456
    Top = 421
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39070.468759583300000000
    ReportOptions.LastChange = 39255.613477280100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = ReportGetValue
    Left = 429
    Top = 422
    Datasets = <
      item
        DataSet = PDataset
        DataSetName = 'PDataset'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 151.181200000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Top = 56.692949999999990000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1055#1110#1076#1089#1090#1072#1074#1072':')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 113.385900000000000000
          Top = 56.692949999999990000
          Width = 604.724800000000000000
          Height = 94.488250000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Note]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Top = 3.779530000000001000
          Width = 1046.929810000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1082#1091#1084#1077#1085#1090' '#8470' [Num_Doc]  '#1074#1110#1076'  [Date_Doc]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 317.480520000000000000
        Width = 1046.929810000000000000
        DataSet = PDataset
        DataSetName = 'PDataset'
        RowCount = 0
        Stretched = True
        object Memo8: TfrxMemoView
          Left = 207.874150000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'Db_Sch'
          DataSet = PDataset
          DataSetName = 'PDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[PDataset."Db_Sch"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 260.787570000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = PDataset
          DataSetName = 'PDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[PDataset."Db_S"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 313.700990000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = PDataset
          DataSetName = 'PDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[PDataset."Db_R"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 366.614410000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = PDataset
          DataSetName = 'PDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[PDataset."Db_St"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 419.527830000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = PDataset
          DataSetName = 'PDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[PDataset."Db_Kekv"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 944.882500000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'Summa'
          DataSet = PDataset
          DataSetName = 'PDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[PDataset."Summa"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = PDataset
          DataSetName = 'PDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[PDataset."DB_Name_Cust"] ([PDataset."Db_Reg_Num"])')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 680.315400000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = PDataset
          DataSetName = 'PDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[PDataset."Kr_Sch"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 733.228820000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = PDataset
          DataSetName = 'PDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[PDataset."Kr_S"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 786.142240000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = PDataset
          DataSetName = 'PDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[PDataset."Kr_R"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 839.055660000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = PDataset
          DataSetName = 'PDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[PDataset."Kr_St"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 891.969080000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = PDataset
          DataSetName = 'PDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[PDataset."Kr_Kekv"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 472.441250000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = PDataset
          DataSetName = 'PDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[PDataset."KR_Name_Cust"] ([PDataset."Kr_Reg_Num"])')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 117.165430000000000000
        ParentFont = False
        Top = 396.850650000000000000
        Width = 1046.929810000000000000
        object Memo21: TfrxMemoView
          Top = 7.559059999999988000
          Width = 207.874150000000000000
          Height = 52.913420000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HideZeros = True
          Memo.Strings = (
            #1055#1088#1086#1074#1086#1076#1086#1082': [Total_Count]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 944.882500000000000000
          Width = 102.047310000000000000
          Height = 52.913420000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            #1047#1072#1075#1072#1083#1100#1085#1072' '#1089#1091#1084#1072': [Total_Summa]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 11.338590000000000000
          Top = 90.708720000000140000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1042#1080#1082#1086#1085#1072#1074#1077#1094#1100)
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 139.842610000000000000
          Top = 90.708719999999970000
          Width = 903.307670000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            ' [Author] ')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 22.677180000000000000
        ParentFont = False
        Top = 536.693260000000000000
        Width = 1046.929810000000000000
        object Memo25: TfrxMemoView
          Left = 971.339210000000000000
          Top = 3.779530000000022000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 64.252010000000000000
        ParentFont = False
        Top = 192.756030000000000000
        Width = 1046.929810000000000000
        object Memo7: TfrxMemoView
          Left = 944.882500000000000000
          Width = 102.047310000000000000
          Height = 60.472480000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 419.527830000000000000
          Top = 34.015770000000010000
          Width = 52.913420000000000000
          Height = 26.456710000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1045#1050#1042)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 366.614410000000000000
          Top = 34.015770000000010000
          Width = 52.913420000000000000
          Height = 26.456710000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1090#1072#1090#1090#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 313.700990000000000000
          Top = 34.015770000000010000
          Width = 52.913420000000000000
          Height = 26.456710000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1086#1079#1076#1110#1083)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 260.787570000000000000
          Top = 34.015770000000010000
          Width = 52.913420000000000000
          Height = 26.456710000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1041#1102#1076#1078#1077#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Width = 472.441250000000000000
          Height = 34.015770000000010000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 472.441250000000000000
          Width = 472.441250000000000000
          Height = 34.015770000000010000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 207.874150000000000000
          Top = 34.015770000000010000
          Width = 52.913420000000000000
          Height = 26.456710000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1072#1093#1091#1085#1086#1082)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Top = 34.015770000000010000
          Width = 207.874150000000000000
          Height = 26.456710000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090' / '#1044#1086#1075#1086#1074#1110#1088)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 891.969080000000000000
          Top = 34.015770000000010000
          Width = 52.913420000000000000
          Height = 26.456710000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1045#1050#1042)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 839.055660000000000000
          Top = 34.015770000000010000
          Width = 52.913420000000000000
          Height = 26.456710000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1090#1072#1090#1090#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 786.142240000000000000
          Top = 34.015770000000010000
          Width = 52.913420000000000000
          Height = 26.456710000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1086#1079#1076#1110#1083)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 733.228820000000000000
          Top = 34.015770000000010000
          Width = 52.913420000000000000
          Height = 26.456710000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1041#1102#1076#1078#1077#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 680.315400000000000000
          Top = 34.015770000000010000
          Width = 52.913420000000000000
          Height = 26.456710000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1072#1093#1091#1085#1086#1082)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 472.441250000000000000
          Top = 34.015770000000010000
          Width = 207.874150000000000000
          Height = 26.456710000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090' / '#1044#1086#1075#1086#1074#1110#1088)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 419.527830000000000000
          Top = 60.472479999999940000
          Width = 52.913420000000000000
          Height = 3.779530000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 366.614410000000000000
          Top = 60.472479999999940000
          Width = 52.913420000000000000
          Height = 3.779530000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 313.700990000000000000
          Top = 60.472479999999940000
          Width = 52.913420000000000000
          Height = 3.779530000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 260.787570000000000000
          Top = 60.472479999999940000
          Width = 52.913420000000000000
          Height = 3.779530000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 207.874150000000000000
          Top = 60.472479999999940000
          Width = 52.913420000000000000
          Height = 3.779530000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Top = 60.472479999999940000
          Width = 207.874150000000000000
          Height = 3.779530000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 891.969080000000000000
          Top = 60.472479999999940000
          Width = 52.913420000000000000
          Height = 3.779530000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 839.055660000000000000
          Top = 60.472479999999940000
          Width = 52.913420000000000000
          Height = 3.779530000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 786.142240000000000000
          Top = 60.472479999999940000
          Width = 52.913420000000000000
          Height = 3.779530000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 733.228820000000000000
          Top = 60.472479999999940000
          Width = 52.913420000000000000
          Height = 3.779530000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 680.315400000000000000
          Top = 60.472479999999940000
          Width = 52.913420000000000000
          Height = 3.779530000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 472.441250000000000000
          Top = 60.472479999999940000
          Width = 207.874150000000000000
          Height = 3.779530000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 944.882500000000000000
          Top = 60.472479999999990000
          Width = 102.047310000000000000
          Height = 3.779530000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object PMemoryData: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'Db_Name_Cust'
        DataType = ftVariant
      end
      item
        Name = 'Db_Reg_Num'
        DataType = ftVariant
      end
      item
        Name = 'Db_Sch'
        DataType = ftVariant
      end
      item
        Name = 'DB_S'
        DataType = ftVariant
      end
      item
        Name = 'Db_R'
        DataType = ftVariant
      end
      item
        Name = 'Db_St'
        DataType = ftVariant
      end
      item
        Name = 'Db_Kekv'
        DataType = ftVariant
      end
      item
        Name = 'Kr_Name_Cust'
        DataType = ftVariant
      end
      item
        Name = 'Kr_Reg_Num'
        DataType = ftVariant
      end
      item
        Name = 'Kr_Sch'
        DataType = ftVariant
      end
      item
        Name = 'Kr_S'
        DataType = ftVariant
      end
      item
        Name = 'Kr_R'
        DataType = ftVariant
      end
      item
        Name = 'Kr_St'
        DataType = ftVariant
      end
      item
        Name = 'Kr_Kekv'
        DataType = ftVariant
      end
      item
        Name = 'Summa'
        DataType = ftVariant
      end>
    Left = 489
    Top = 421
  end
end
