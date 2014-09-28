object jo9_docs_add_Form: Tjo9_docs_add_Form
  Left = 396
  Top = 271
  Width = 770
  Height = 450
  Caption = 'jo9_docs_add_Form'
  Color = 16247513
  Constraints.MinHeight = 450
  Constraints.MinWidth = 650
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MainPanel: TPanel
    Left = 0
    Top = 0
    Width = 762
    Height = 418
    Align = alClient
    TabOrder = 0
    OnResize = MainPanelResize
    DesignSize = (
      762
      418)
    object Bevel1: TBevel
      Left = 5
      Top = 5
      Width = 340
      Height = 108
      Shape = bsFrame
    end
    object Label6: TLabel
      Left = 12
      Top = 10
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
      Left = 13
      Top = 66
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
      Left = 150
      Top = 9
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
    object DogPanel: TPanel
      Left = 5
      Top = 114
      Width = 340
      Height = 223
      Anchors = [akLeft, akTop, akBottom]
      BevelOuter = bvNone
      TabOrder = 3
      object dxBarDockControl1: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 340
        Height = 26
        Align = dalTop
        BarManager = BarManager
        Color = 15451300
        ParentColor = False
        UseOwnColor = True
      end
      object Grid: TcxGrid
        Left = 0
        Top = 26
        Width = 340
        Height = 197
        Align = alClient
        TabOrder = 1
        object TableView: TcxGridTableView
          OnKeyDown = TableViewKeyDown
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = Name_Customer_Column
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = Summa_Column
            end>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OnFocusedRecordChanged = TableViewFocusedRecordChanged
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
          Styles.StyleSheet = GridTableViewStyleSheet
          object Name_Customer_Column: TcxGridColumn
            Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            SortOrder = soAscending
            Width = 213
          end
          object id_Dog_Column: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            Options.Focusing = False
          end
          object Kod_Dog_Column: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Focusing = False
          end
          object Tip_Dog_Column: TcxGridColumn
            Caption = #1058#1080#1087' '#1076#1086#1075#1086#1074#1086#1088#1091
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Focusing = False
            Width = 92
          end
          object Reg_Num_Column: TcxGridColumn
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
            Properties.OnButtonClick = Reg_Num_ColumnPropertiesButtonClick
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 68
          end
          object Summa_Column: TcxGridColumn
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
          object Name_Shablon_Column: TcxGridColumn
            Visible = False
          end
          object IDD_Column: TcxGridColumn
            Caption = #1055#1086#1088#1103#1076#1082#1086#1074#1099#1081' '#1085#1086#1084#1077#1088' '#1089#1090#1088#1086#1082#1080
            Visible = False
          end
          object id_Customer_Column: TcxGridColumn
            Visible = False
          end
        end
        object GridLevel: TcxGridLevel
          GridView = TableView
        end
      end
    end
    object NumDoc: TcxTextEdit
      Left = 12
      Top = 23
      Width = 130
      Height = 21
      Properties.MaxLength = 120
      Properties.ReadOnly = False
      Style.Color = 16247513
      TabOrder = 0
      OnKeyPress = NumDocKeyPress
    end
    object DateDoc: TcxDateEdit
      Left = 12
      Top = 79
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
      Left = 147
      Top = 22
      Width = 190
      Height = 78
      Properties.MaxLength = 255
      Properties.ReadOnly = False
      Properties.ScrollBars = ssVertical
      Style.Color = 16247513
      TabOrder = 2
      OnKeyPress = NoteMemoKeyPress
    end
    object Panel1: TPanel
      Left = 1
      Top = 343
      Width = 760
      Height = 74
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 4
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
      object CancelButton: TcxButton
        Left = 676
        Top = 26
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
        TabOrder = 0
        OnClick = CancelButtonClick
      end
      object InfoMemo: TcxMemo
        Left = 4
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
        TabOrder = 1
      end
      object ApplyButton: TcxButton
        Left = 594
        Top = 26
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1055#1088#1080#1081#1085#1103#1090#1080
        TabOrder = 2
        OnClick = ApplyButtonClick
      end
      object PrintButton: TcxButton
        Left = 418
        Top = 26
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080
        TabOrder = 3
        OnClick = PrintButtonClick
      end
    end
    object InfoPanel: TPanel
      Left = 352
      Top = 5
      Width = 406
      Height = 108
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 5
      object St_Label: TLabel
        Left = 70
        Top = 77
        Width = 316
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
      end
      object R_Label: TLabel
        Left = 70
        Top = 61
        Width = 316
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
      end
      object S_Label: TLabel
        Left = 70
        Top = 45
        Width = 315
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
      end
      object Sch1_Label: TLabel
        Left = 70
        Top = 7
        Width = 315
        Height = 13
        AutoSize = False
        Caption = 'Sch1_Label'
        ParentShowHint = False
        ShowHint = True
      end
      object Label4: TLabel
        Left = 3
        Top = 7
        Width = 62
        Height = 13
        Caption = #1056#1072#1093#1091#1085#1086#1082' '#1044#1073':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 13
        Top = 45
        Width = 53
        Height = 13
        Caption = #1050#1086#1096#1090#1086#1088#1080#1089':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 30
        Top = 61
        Width = 36
        Height = 13
        Caption = #1056#1086#1079#1076#1110#1083':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 29
        Top = 76
        Width = 37
        Height = 13
        Caption = #1057#1090#1072#1090#1090#1103':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 6
        Top = 23
        Width = 60
        Height = 13
        Caption = #1056#1072#1093#1091#1085#1086#1082' '#1050#1088':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Sch2_Label: TLabel
        Left = 70
        Top = 23
        Width = 315
        Height = 13
        AutoSize = False
        Caption = 'Sch2_Label'
        ParentShowHint = False
        ShowHint = True
      end
      object Label8: TLabel
        Left = 35
        Top = 91
        Width = 31
        Height = 13
        Caption = #1050#1045#1050#1042':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Kekv_Label: TLabel
        Left = 70
        Top = 91
        Width = 316
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
      end
    end
    object ProvPanel: TPanel
      Left = 352
      Top = 114
      Width = 405
      Height = 223
      Anchors = [akLeft, akTop, akBottom]
      BevelOuter = bvNone
      TabOrder = 6
      object dxBarDockControl2: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 405
        Height = 26
        Align = dalTop
        BarManager = BarManager
        Color = 15451300
        ParentColor = False
        UseOwnColor = True
      end
      object ProvGrid: TcxGrid
        Left = 0
        Top = 26
        Width = 405
        Height = 86
        Align = alClient
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        OnEnter = ProvGridEnter
        OnExit = ProvGridEnter
        object ProvTableView: TcxGridTableView
          OnKeyDown = ProvTableViewKeyDown
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = Num_Sch1_Column
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = Prov_Summa_Column
            end>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OnCustomDrawCell = ProvTableViewCustomDrawCell
          OnFocusedRecordChanged = ProvTableViewFocusedRecordChanged
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
          Styles.StyleSheet = GridTableViewStyleSheet
          object id_Prov_Column: TcxGridColumn
            Visible = False
            Options.Focusing = False
          end
          object id_Sch1_Column: TcxGridColumn
            Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Focusing = False
            Width = 147
          end
          object id_Sch2_Column: TcxGridColumn
            Visible = False
            Options.Focusing = False
          end
          object Num_Sch1_Column: TcxGridColumn
            Caption = #1056#1072#1093#1091#1085#1086#1082' '#1044#1073
            OnGetProperties = Num_Sch1_ColumnGetProperties
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 64
          end
          object Num_Sch2_Column: TcxGridColumn
            Caption = #1056#1072#1093#1091#1085#1086#1082' '#1050#1088
            OnGetProperties = Num_Sch2_ColumnGetProperties
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 60
          end
          object Name_Sch1_Column: TcxGridColumn
            Caption = #1058#1080#1087' '#1076#1086#1075#1086#1074#1086#1088#1072
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Focusing = False
            Width = 92
          end
          object Name_Sch2_Column: TcxGridColumn
            Caption = #1056#1077#1108#1089#1090#1088'. '#8470
            PropertiesClassName = 'TcxHyperLinkEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Focusing = False
            Width = 78
          end
          object id_S_Column: TcxGridColumn
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
          object id_R_Column: TcxGridColumn
            Visible = False
            Options.Focusing = False
          end
          object id_St_Column: TcxGridColumn
            Visible = False
            Options.Focusing = False
          end
          object Kod_S_Column: TcxGridColumn
            Caption = #1050#1086#1096#1090#1086#1088#1080#1089
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.ReadOnly = True
            Properties.OnButtonClick = Kod_S_ColumnPropertiesButtonClick
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 51
          end
          object Kod_R_Column: TcxGridColumn
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
            Width = 53
          end
          object Kod_St_Column: TcxGridColumn
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
            Width = 51
          end
          object kod_Kekv_Column: TcxGridColumn
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
            Properties.OnButtonClick = kod_Kekv_ColumnPropertiesButtonClick
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 47
          end
          object Name_S_Column: TcxGridColumn
            Visible = False
            Options.Focusing = False
          end
          object Name_R_Column: TcxGridColumn
            Visible = False
            Options.Focusing = False
          end
          object Name_St_Column: TcxGridColumn
            Visible = False
            Options.Focusing = False
          end
          object Prov_Summa_Column: TcxGridColumn
            Caption = #1057#1091#1084#1072
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.Nullable = False
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnEditValueChanged = Prov_Summa_ColumnPropertiesEditValueChanged
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 57
          end
          object State_Prov_Column: TcxGridColumn
            Visible = False
            Options.Focusing = False
          end
          object id_Kekv_Column: TcxGridColumn
            Visible = False
            Options.Focusing = False
          end
          object Name_Kekv_Column: TcxGridColumn
            Visible = False
            Options.Focusing = False
          end
        end
        object ProvGridLevel: TcxGridLevel
          GridView = ProvTableView
        end
      end
      object SecGrid: TcxGrid
        Left = 0
        Top = 120
        Width = 405
        Height = 103
        Align = alBottom
        TabOrder = 2
        OnEnter = ProvGridEnter
        OnExit = ProvGridEnter
        object SecTableView: TcxGridTableView
          OnKeyDown = ProvTableViewKeyDown
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = Num_Sch1_Column1
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = Prov_Summa_Column1
            end>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OnCustomDrawCell = ProvTableViewCustomDrawCell
          OnFocusedRecordChanged = ProvTableViewFocusedRecordChanged
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
          OptionsView.Header = False
          OptionsView.HeaderAutoHeight = True
          Styles.StyleSheet = GridTableViewStyleSheet
          object id_Prov_Column1: TcxGridColumn
            Visible = False
            Options.Focusing = False
          end
          object id_Sch1_Column1: TcxGridColumn
            Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Focusing = False
            Width = 147
          end
          object id_Sch2_Column1: TcxGridColumn
            Visible = False
            Options.Focusing = False
          end
          object Num_Sch1_Column1: TcxGridColumn
            Caption = #1056#1072#1093#1091#1085#1086#1082' '#1044#1073
            PropertiesClassName = 'TcxPopupEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Properties.PopupControl = SchGrid
            Properties.PopupWidth = 380
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Focusing = False
            Width = 64
          end
          object Num_Sch2_Column1: TcxGridColumn
            Caption = #1056#1072#1093#1091#1085#1086#1082' '#1050#1088
            PropertiesClassName = 'TcxPopupEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Properties.PopupControl = SchGrid
            Properties.PopupWidth = 380
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Focusing = False
            Width = 60
          end
          object Name_Sch1_Column1: TcxGridColumn
            Caption = #1058#1080#1087' '#1076#1086#1075#1086#1074#1086#1088#1072
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Focusing = False
            Width = 92
          end
          object Name_Sch2_Column1: TcxGridColumn
            Caption = #1056#1077#1108#1089#1090#1088'. '#8470
            PropertiesClassName = 'TcxHyperLinkEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Focusing = False
            Width = 78
          end
          object id_S_Column1: TcxGridColumn
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
          object id_R_Column1: TcxGridColumn
            Visible = False
            Options.Focusing = False
          end
          object id_St_Column1: TcxGridColumn
            Visible = False
            Options.Focusing = False
          end
          object Kod_S_Column1: TcxGridColumn
            Caption = #1050#1086#1096#1090#1086#1088#1080#1089
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.ReadOnly = True
            Properties.OnButtonClick = Kod_S_ColumnPropertiesButtonClick
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 51
          end
          object Kod_R_Column1: TcxGridColumn
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
            Width = 53
          end
          object Kod_St_Column1: TcxGridColumn
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
            Width = 51
          end
          object kod_Kekv_Column1: TcxGridColumn
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
            Properties.OnButtonClick = kod_Kekv_ColumnPropertiesButtonClick
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 47
          end
          object Name_S_Column1: TcxGridColumn
            Visible = False
            Options.Focusing = False
          end
          object Name_R_Column1: TcxGridColumn
            Visible = False
            Options.Focusing = False
          end
          object Name_St_Column1: TcxGridColumn
            Visible = False
            Options.Focusing = False
          end
          object Prov_Summa_Column1: TcxGridColumn
            Caption = #1057#1091#1084#1072
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.Nullable = False
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnEditValueChanged = Prov_Summa_ColumnPropertiesEditValueChanged
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 57
          end
          object State_Prov_Column1: TcxGridColumn
            Visible = False
            Options.Focusing = False
          end
          object id_Kekv_Column1: TcxGridColumn
            Visible = False
            Options.Focusing = False
          end
          object Name_Kekv_Column1: TcxGridColumn
            Visible = False
            Options.Focusing = False
          end
        end
        object SecGridLevel: TcxGridLevel
          GridView = SecTableView
        end
      end
      object SecSplitter: TcxSplitter
        Left = 0
        Top = 112
        Width = 405
        Height = 8
        HotZoneClassName = 'TcxMediaPlayer9Style'
        HotZone.SizePercent = 49
        AlignSplitter = salBottom
        AutoSnap = True
        ResizeUpdate = True
        Control = SecGrid
      end
    end
    object SchGrid: TcxGrid
      Left = -112
      Top = 264
      Width = 380
      Height = 145
      TabOrder = 7
      Visible = False
      object SchTableView: TcxGridTableView
        OnDblClick = SchTableViewDblClick
        OnKeyPress = SchTableViewKeyPress
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
        Styles.StyleSheet = GridTableViewStyleSheet
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
    Left = 573
    Top = 21
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
    object GridTableViewStyleSheet: TcxGridTableViewStyleSheet
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
    object GridBandedTableViewStyleSheet: TcxGridBandedTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle15
      Styles.Content = cxStyle16
      Styles.ContentEven = cxStyle17
      Styles.ContentOdd = cxStyle18
      Styles.Inactive = cxStyle24
      Styles.IncSearch = cxStyle25
      Styles.Selection = cxStyle28
      Styles.FilterBox = cxStyle19
      Styles.Footer = cxStyle20
      Styles.Group = cxStyle21
      Styles.GroupByBox = cxStyle22
      Styles.Header = cxStyle23
      Styles.Indicator = cxStyle26
      Styles.Preview = cxStyle27
      Styles.BandBackground = cxStyle15
      Styles.BandHeader = cxStyle23
      BuiltIn = True
    end
  end
  object BarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'ToolBar'
        DockControl = dxBarDockControl1
        DockedDockControl = dxBarDockControl1
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 276
        FloatTop = 213
        FloatClientWidth = 23
        FloatClientHeight = 88
        ItemLinks = <
          item
            Item = AddDogButton
            Visible = True
          end
          item
            Item = EditDogButton
            Visible = True
          end
          item
            Item = CloneButton
            Visible = True
          end
          item
            Item = DelDogButton
            Visible = True
          end>
        Name = 'ToolBar'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'ProvBar'
        DockControl = dxBarDockControl2
        DockedDockControl = dxBarDockControl2
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 358
        FloatTop = 253
        FloatClientWidth = 54
        FloatClientHeight = 44
        ItemLinks = <
          item
            Item = Add_Prov_Button
            Visible = True
          end
          item
            Item = AddSecondButton
            Visible = True
          end
          item
            Item = EditProvButton
            Visible = True
          end
          item
            Item = Del_Prov_Button
            Visible = True
          end>
        Name = 'ProvBar'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = False
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
    UseSystemFont = True
    Left = 709
    Top = 23
    DockControlHeights = (
      0
      0
      0
      0)
    object AddDogButton: TdxBarButton
      Caption = #1044#1086#1076#1072#1090#1080
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080' (Ins)'
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
      OnClick = AddDogButtonClick
    end
    object CloneButton: TdxBarButton
      Caption = #1050#1083#1086#1085#1091#1074#1072#1090#1080' '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1080
      Category = 0
      Hint = #1050#1083#1086#1085#1091#1074#1072#1090#1080' '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1080' (Ctrl+Ins)'
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FF200377
        171368B78183B78183B78183B78183B78183B78183B78183B78183B78183B781
        83B78183B78183FF00FF20037F2115C41C29A3202072F7E3C5F6DFBCF5DBB4F3
        D7ABF3D3A2F1CF9AF0CF97F0CF98F0CF98F5D49AB78183FF00FF200381A43EFB
        0220D52336B01F1F71F5DFC2F4DBBAF2D7B2F1D4A9F1D0A2EECC99EECC97EECC
        97F3D199B78183FF00FFFF00FF2003778A8CD0021FD32334AF1F1F71F5DFC3F3
        DBBBF2D7B2F1D4ABF0D0A3EECC9AEECC97F3D199B78183FF00FFFF00FFFF00FF
        19186CA4B0F2021FD12334AF1F1F71F5DFC2F4DBB9F2D7B2F1D4AAF0D0A1EFCD
        99F3D198B78183FF00FFFF00FFFF00FFCEB2AA202276A2ACEF021FD12334AC1F
        1F71F5DFC2F4DBBBF1D7B2F1D3AAF0D0A1F3D29BB78183FF00FFFF00FFFF00FF
        D3B7AFFFFFFD1F2175A2ACEE021FD02333AC1F1F71F5DFC2F4DBBAF2D7B1F0D4
        A9F5D5A3B78183FF00FFFF00FFFF00FFD7BBB2FFFFFFFEF9F51F2175A2ACEE02
        1FD02332AD1F1F71F5DEC2F4DBBAF2D8B2F6D9ACB78183FF00FFFF00FFFF00FF
        DABEB3FFFFFFFFFEFDFDF8F41F2175A1ACEE0111A01F479F1F6FB9F6DEC1F4DB
        B9F8DDB4B78183FF00FFFF00FFFF00FFDEC1B5FFFFFFFFFFFFFFFEFDFEF9F41F
        21751F5EB000C5FE1F9BCE1F8DBEF7E1C2F0DAB7B78183FF00FFFF00FFFF00FF
        E2C5B52091C5FFFFFF2091C5FFFEFDFDF9F41F94D81F9CD11FCAFA208FC1E6D9
        C4C6BCA9B78183FF00FFFF00FFFF00FFE5C7B72091C52091C52091C5FFFFFFFF
        FEFDFDF8F32090C31E8DC0C6A194B59489B08F81B78183FF00FFFF00FFFF00FF
        1D8ABC20C3FC00BDFF20BBF42091C5FFFFFFFFFEFCFFFEF9E3CFC9BF8C76E8B2
        70ECA54AC58768FF00FFFF00FF2071C51E8BBD2091C500ADEE2096CB2091C520
        91C5FFFFFFFFFFFFE4D4D2C89A7FFAC577CD9377FF00FFFF00FFFF00FFFF00FF
        EACAB62090C420B6EF1F90C4FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEC7977CCF9B
        86FF00FFFF00FFFF00FFFF00FFFF00FFE9C6B1EBCCB81D8ABCEBCCB8EBCBB8EA
        CBB8EACBB8EACCB9DABBB0B8857AFF00FFFF00FFFF00FFFF00FF}
      OnClick = CloneButtonClick
    end
    object DelDogButton: TdxBarButton
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080' (Del)'
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
      OnClick = DelDogButtonClick
    end
    object dxBarButton1: TdxBarButton
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Category = 0
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
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
    end
    object Add_Prov_Button: TdxBarButton
      Caption = #1044#1086#1076#1072#1090#1080' '#1087#1088#1086#1074#1086#1076#1082#1091
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080' '#1087#1088#1086#1074#1086#1076#1082#1091' (Ins)'
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
      OnClick = Add_Prov_ButtonClick
    end
    object Del_Prov_Button: TdxBarButton
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '#1087#1088#1086#1074#1086#1076#1082#1091
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1087#1088#1086#1074#1086#1076#1082#1091' (Del)'
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
      OnClick = Del_Prov_ButtonClick
    end
    object EditProvButton: TdxBarButton
      Caption = #1047#1084#1110#1085#1080#1090#1080
      Category = 0
      Hint = #1047#1084#1110#1085#1080#1090#1080' (F4)'
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
      OnClick = EditProvButtonClick
    end
    object AddSecondButton: TdxBarButton
      Caption = #1044#1086#1076#1072#1090#1080' '#1110#1085#1096#1110' '#1087#1088#1086#1074#1086#1076#1082#1080
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080' '#1110#1085#1096#1110' '#1087#1088#1086#1074#1086#1076#1082#1080' (Ins)'
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
      OnClick = AddSecondButtonClick
    end
    object EditDogButton: TdxBarButton
      Caption = #1047#1084#1110#1085#1080#1090#1080' '#1076#1086#1075#1086#1074#1110#1088
      Category = 0
      Hint = #1047#1084#1110#1085#1080#1090#1080' '#1076#1086#1075#1086#1074#1110#1088' (F4)'
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
      OnClick = EditDogButtonClick
    end
  end
  object DataSet: TpFIBDataSet
    Left = 605
    Top = 23
    poSQLINT64ToBCD = True
  end
  object ActionList: TActionList
    Left = 637
    Top = 23
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 121
      OnExecute = Action2Execute
    end
  end
  object StoredProc: TpFIBStoredProc
    Left = 677
    Top = 23
  end
  object Timer: TTimer
    Enabled = False
    Interval = 10
    OnTimer = TimerTimer
    Left = 216
    Top = 104
  end
  object FlashTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = FlashTimerTimer
    Left = 248
    Top = 104
  end
  object WQuery: TpFIBQuery
    Left = 605
    Top = 54
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38532.598963576400000000
    ReportOptions.LastChange = 39021.359475729200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo4OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ' Memo4.Color  := clNone;'
      ' Memo4.HAlign := haLeft;'
      ''
      
        ' if (<DBDataset."State"> = '#39'NameCust'#39') or (<DBDataset."State"> =' +
        ' '#39'NameTypeDog'#39') then begin'
      '  Memo4.Width      := 1043;'
      '  Memo4.Font.Style := fsBold;'
      '  Memo4.Color      := clNone;'
      ''
      
        '  if <DBDataset."State"> = '#39'NameTypeDog'#39' then Memo4.HAlign := ha' +
        'Center;'
      ' end'
      ' else if <DBDataset."State"> = '#39'NameCustBad'#39' then begin'
      '  Memo4.Width      := 1043;'
      '  Memo4.Font.Style := fsBold;'
      '  Memo4.Color      := $00847AFC;'
      ' end'
      
        ' else if <DBDataset."State"> = '#39'BadDoc'#39' then Memo4.Color := $008' +
        '47AFC'
      
        ' else if <DBDataset."State"> = '#39'Summs'#39'  then Memo4.Color := $00E' +
        'AEAEA;'
      'end;'
      ''
      'procedure Memo76OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        ' TfrxMemoView(Sender).Visible := (<DBDataset."State"> <> '#39'NameCu' +
        'st'#39')'
      
        ' and (<DBDataset."State"> <> '#39'NameCustBad'#39') and (<DBDataset."Sta' +
        'te"> <> '#39'NameTypeDog'#39');'
      ''
      
        ' if <DBDataset."State"> = '#39'Summs'#39' then TfrxMemoView(Sender).Colo' +
        'r := $00EAEAEA'
      
        ' else if <DBDataset."State"> = '#39'BadDoc'#39' then TfrxMemoView(Sender' +
        ').Color := $00847AFC'
      ' else TfrxMemoView(Sender).Color := clNone;'
      'end;'
      ''
      'procedure PageHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '   if not <HeaderOnNewPage> then TfrxPageHeader(Sender).Visible ' +
        ':= False;'
      'end;'
      ''
      'procedure Memo9OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ' Memo76OnBeforePrint(Sender);'
      ''
      
        ' if <DBDataset."In_Sch"> = '#39#39' then TfrxMemoView(Sender).Text := ' +
        #39#39';'
      'end;'
      ''
      'procedure Memo15OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ' Memo76OnBeforePrint(Sender);'
      ''
      
        ' if (<DBDataset."Db_Sch_Db"> = '#39#39') and (<DBDataset."Db_Sch_Kr"> ' +
        '= '#39#39') then TfrxMemoView(Sender).Text := '#39#39';'
      'end;'
      ''
      'procedure Memo24OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ' Memo76OnBeforePrint(Sender);'
      ''
      
        ' if (<DBDataset."Kr_Sch_Db"> = '#39#39') and (<DBDataset."Kr_Sch_Kr"> ' +
        '= '#39#39') then TfrxMemoView(Sender).Text := '#39#39';'
      'end;'
      ''
      'procedure Memo33OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ' Memo76OnBeforePrint(Sender);'
      ''
      
        ' if <DBDataset."Out_Sch"> = '#39#39' then TfrxMemoView(Sender).Text :=' +
        ' '#39#39';'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = ReportGetValue
    Left = 573
    Top = 54
    Datasets = <
      item
        DataSetName = 'DBDataset'
      end
      item
        DataSetName = 'JODataset'
      end
      item
        DataSetName = 'SecDataset'
      end>
    Variables = <
      item
        Name = ' JO9_Vars'
        Value = Null
      end
      item
        Name = 'HeaderOnNewPage'
        Value = Null
      end>
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
        Height = 124.724490000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo1: TfrxMemoView
          Top = 7.559060000000000000
          Width = 1046.929810000000000000
          Height = 64.252010000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[Jo9Title]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Top = 71.811070000000000000
          Width = 1050.709340000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[Period]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo114: TfrxMemoView
          Align = baLeft
          Top = 7.559060000000000000
          Width = 238.110390000000000000
          Height = 83.149660000000000000
          Memo.Strings = (
            '[Visa]')
          VAlign = vaCenter
        end
        object Memo132: TfrxMemoView
          Align = baWidth
          Top = 105.826840000000000000
          Width = 1046.929810000000000000
          Height = 15.118120000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Filter]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 423.307360000000000000
        Width = 1046.929810000000000000
        DataSetName = 'DBDataset'
        RowCount = 0
        Stretched = True
        object Memo4: TfrxMemoView
          Width = 41.574803150000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo4OnBeforePrint'
          StretchMode = smMaxHeight
          DataSetName = 'DBDataset'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."CustNum"][DBDataset."RegNum"]')
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 41.574830000000000000
          Width = 45.354330710000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo76OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'Date_Ost'
          DataSetName = 'DBDataset'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset."Date_Ost"]')
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 86.929190000000000000
          Width = 45.354330710000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo76OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'Date_move'
          DataSetName = 'DBDataset'
          DisplayFormat.Kind = fkDateTime
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset."Date_move"]')
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 132.283550000000000000
          Width = 41.574803150000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo76OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'In_Db'
          DataSetName = 'DBDataset'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."In_Db"]')
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 173.637910000000000000
          Width = 41.574803150000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo76OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'In_Kr'
          DataSetName = 'DBDataset'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."In_Kr"]')
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 249.228510000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo9OnBeforePrint'
          StretchMode = smMaxHeight
          DataSetName = 'DBDataset'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            
              '[DBDataset."In_S"]/[DBDataset."In_R"]/[DBDataset."In_St"]/[DBDat' +
              'aset."In_KEKV"]')
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 332.598640000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo76OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'Db_Doc'
          DataSetName = 'DBDataset'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset."Db_Doc"]')
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 370.393940000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo76OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'Db_Date'
          DataSetName = 'DBDataset'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset."Db_Date"]')
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 411.968770000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo15OnBeforePrint'
          StretchMode = smMaxHeight
          DataSetName = 'DBDataset'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset."Db_Sch_Db"]~[DBDataset."Db_Sch_Kr"]')
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 464.882190000000000000
          Width = 41.574803150000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo76OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'Db_Sum'
          DataSetName = 'DBDataset'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."Db_Sum"]')
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 506.456656300000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo15OnBeforePrint'
          StretchMode = smMaxHeight
          DataSetName = 'DBDataset'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            
              '[DBDataset."Db_S"]/[DBDataset."Db_R"]/[DBDataset."Db_St"]/[DBDat' +
              'aset."Db_KEKV"]')
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 589.606265040000000000
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo76OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'Kr_Doc'
          DataSetName = 'DBDataset'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset."Kr_Doc"]')
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 627.401538190000000000
          Width = 41.574803150000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo76OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'Kr_Date'
          DataSetName = 'DBDataset'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset."Kr_Date"]')
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 668.976336460000000000
          Width = 52.913390710000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo24OnBeforePrint'
          StretchMode = smMaxHeight
          DataSetName = 'DBDataset'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset."Kr_Sch_Db"]~[DBDataset."Kr_Sch_Kr"]')
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 721.889697870000000000
          Width = 41.574803150000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo76OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'Kr_Sum'
          DataSetName = 'DBDataset'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."Kr_Sum"]')
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 763.464501020000000000
          Width = 79.370078740000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo24OnBeforePrint'
          StretchMode = smMaxHeight
          DataSetName = 'DBDataset'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            
              '[DBDataset."Kr_S"]/[DBDataset."Kr_R"]/[DBDataset."Kr_St"]/[DBDat' +
              'aset."Kr_KEKV"]')
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 846.614720000000000000
          Width = 41.574803150000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo76OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'Out_Db'
          DataSetName = 'DBDataset'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."Out_Db"]')
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 888.188820160000000000
          Width = 41.574803150000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo76OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'Out_Kr'
          DataSetName = 'DBDataset'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."Out_Kr"]')
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 963.779517800000000000
          Width = 79.370078740000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo33OnBeforePrint'
          StretchMode = smMaxHeight
          DataSetName = 'DBDataset'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            
              '[DBDataset."Out_S"]/[DBDataset."Out_R"]/[DBDataset."Out_St"]/[DB' +
              'Dataset."Out_KEKV"]')
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 215.212559370000000000
          Width = 34.015740710000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo76OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'In_Sch'
          DataSetName = 'DBDataset'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset."In_Sch"]')
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 929.763520790000000000
          Width = 34.015748030000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo76OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'Out_Sch'
          DataSetName = 'DBDataset'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset."Out_Sch"]')
          VAlign = vaCenter
        end
        object Memo139: TfrxMemoView
          Left = 328.819110000000000000
          Width = 3.779530000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo76OnBeforePrint'
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo141: TfrxMemoView
          Left = 585.826735040000000000
          Width = 3.779527560000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo76OnBeforePrint'
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo143: TfrxMemoView
          Left = 842.835190000000000000
          Width = 3.779527560000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo76OnBeforePrint'
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
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
        Top = 733.228820000000000000
        Width = 1046.929810000000000000
        object Memo39: TfrxMemoView
          Left = 959.899832530000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
        end
      end
      object PageHeader1: TfrxPageHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 124.724490000000000000
        ParentFont = False
        Top = 166.299320000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'PageHeader1OnBeforePrint'
        PrintOnFirstPage = False
        object Memo133: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 68.031540000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[Jo9Title]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo134: TfrxMemoView
          Top = 68.031540000000000000
          Width = 1058.268400000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[Period]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo136: TfrxMemoView
          Align = baLeft
          Width = 238.110390000000000000
          Height = 90.708720000000000000
          Memo.Strings = (
            '[Visa]')
          VAlign = vaCenter
        end
        object Memo137: TfrxMemoView
          Align = baWidth
          Top = 98.267780000000000000
          Width = 1046.929810000000000000
          Height = 15.118120000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Filter]')
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
        Height = 41.574830000000000000
        ParentFont = False
        Top = 668.976810000000000000
        Width = 1046.929810000000000000
        KeepChild = True
        Stretched = True
        object Memo10: TfrxMemoView
          Left = 37.795300000000000000
          Top = 22.677180000000000000
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
        object Memo11: TfrxMemoView
          Left = 245.669450000000000000
          Top = 22.677180000000000000
          Width = 1092.284170000000000000
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
      object ColumnHeader1: TfrxColumnHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 49.133890000000000000
        ParentFont = False
        Top = 313.700990000000000000
        Width = 1046.929810000000000000
        object Memo40: TfrxMemoView
          Width = 41.574830000000000000
          Height = 37.795300000000000000
          Color = 12829635
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1077#1108#1089#1090#1088'.'
            #1085#1086#1084#1077#1088)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 41.574830000000000000
          Width = 45.354360000000000000
          Height = 37.795300000000000000
          Color = 12829635
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1074#1080#1085#1080#1082'.'
            #1079#1072#1073#1086#1088#1075#1086#1074)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 132.283550000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          Color = 12829635
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1072#1083#1100#1076#1086' '#1074#1093#1110#1076#1085#1077)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 132.283550000000000000
          Top = 18.897650000000000000
          Width = 41.574803149606300000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 173.637910000000000000
          Top = 18.897650000000000000
          Width = 41.574803150000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 249.228510000000000000
          Top = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1096'/'#1056#1079'/'#1057#1090'/'#1050#1045#1050#1042)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 86.929190000000000000
          Width = 45.354360000000000000
          Height = 37.795300000000000000
          Color = 12829635
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1089#1090#1072#1085'. '#1088#1091#1093' '#1082#1086#1096#1090#1110#1074)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 332.598640000000000000
          Width = 253.228317170000000000
          Height = 18.897650000000000000
          Color = 12829635
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090' '#1088#1072#1093#1091#1085#1082#1110#1074)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Left = 332.598640000000000000
          Top = 18.897650000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1082'-'#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Left = 370.393940000000000000
          Top = 18.897650000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo52: TfrxMemoView
          Left = 411.968770000000000000
          Top = 18.897650000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1072#1093'.'#1044#1073'-'#1050#1088)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 506.456656300000000000
          Top = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1096'/'#1056#1079'/'#1057#1090'/'#1050#1045#1050#1042)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Left = 464.882190000000000000
          Top = 18.897650000000000000
          Width = 41.574803150000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          Left = 589.606265040000000000
          Width = 253.228317170000000000
          Height = 18.897650000000000000
          Color = 12829635
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090' '#1088#1072#1093#1091#1085#1082#1110#1074)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Left = 589.606265040000000000
          Top = 18.897650000000000000
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1082'-'#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo62: TfrxMemoView
          Left = 627.401538190000000000
          Top = 18.897650000000000000
          Width = 41.574803150000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          Left = 668.976336460000000000
          Top = 18.897650000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1072#1093'.'#1044#1073'-'#1050#1088)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Left = 763.464501020000000000
          Top = 18.897650000000000000
          Width = 79.370078740000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1096'/'#1056#1079'/'#1057#1090'/'#1050#1045#1050#1042)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo69: TfrxMemoView
          Left = 721.889697870000000000
          Top = 18.897650000000000000
          Width = 41.574803150000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo70: TfrxMemoView
          Left = 846.614109760000000000
          Width = 196.535396460000000000
          Height = 18.897650000000000000
          Color = 12829635
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1072#1083#1100#1076#1086' '#1074#1080#1093#1110#1076#1085#1077)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 963.779344490000000000
          Top = 18.897650000000000000
          Width = 79.370071420000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1096'/'#1056#1079'/'#1057#1090'/'#1050#1045#1050#1042)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 846.614720000000000000
          Top = 18.897650000000000000
          Width = 41.574803150000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo76: TfrxMemoView
          Left = 888.188820160000000000
          Top = 18.897650000000000000
          Width = 41.574803150000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo77: TfrxMemoView
          Top = 37.795300000000000000
          Width = 41.574830000000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '1')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          Left = 41.574830000000000000
          Top = 37.795300000000000000
          Width = 45.354360000000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '2')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo79: TfrxMemoView
          Left = 86.929190000000000000
          Top = 37.795300000000000000
          Width = 45.354360000000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '3')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo80: TfrxMemoView
          Left = 132.283550000000000000
          Top = 37.795300000000000000
          Width = 41.574803149606300000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '4')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo81: TfrxMemoView
          Left = 173.637910000000000000
          Top = 37.795300000000000000
          Width = 41.574803150000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '5')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo82: TfrxMemoView
          Left = 249.228510000000000000
          Top = 37.795300000000000000
          Width = 79.370130000000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '7')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo86: TfrxMemoView
          Left = 332.598640000000000000
          Top = 37.795300000000000000
          Width = 37.795300000000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '11')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo87: TfrxMemoView
          Left = 370.393940000000000000
          Top = 37.795300000000000000
          Width = 41.574830000000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '12')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo88: TfrxMemoView
          Left = 411.968770000000000000
          Top = 37.795300000000000000
          Width = 52.913420000000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '13')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo90: TfrxMemoView
          Left = 464.882190000000000000
          Top = 37.795300000000000000
          Width = 41.574803150000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '15')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo91: TfrxMemoView
          Left = 506.456656300000000000
          Top = 37.795300000000000000
          Width = 79.370130000000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '16')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo95: TfrxMemoView
          Left = 589.606265040000000000
          Top = 37.795300000000000000
          Width = 37.795275590000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '20')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo96: TfrxMemoView
          Left = 627.401538190000000000
          Top = 37.795300000000000000
          Width = 41.574803150000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '21')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo97: TfrxMemoView
          Left = 668.976336460000000000
          Top = 37.795300000000000000
          Width = 52.913420000000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '22')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo99: TfrxMemoView
          Left = 721.889697870000000000
          Top = 37.795300000000000000
          Width = 41.574803150000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '24')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo100: TfrxMemoView
          Left = 763.464501020000000000
          Top = 37.795300000000000000
          Width = 79.370078740000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '25')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo104: TfrxMemoView
          Left = 846.614720000000000000
          Top = 37.795300000000000000
          Width = 41.574803150000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '29')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo105: TfrxMemoView
          Left = 888.188820160000000000
          Top = 37.795300000000000000
          Width = 41.574803150000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '30')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo106: TfrxMemoView
          Left = 963.779344490000000000
          Top = 37.795300000000000000
          Width = 79.370078740000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '32')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo110: TfrxMemoView
          Left = 215.212740000000000000
          Top = 18.897650000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1072#1093'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo111: TfrxMemoView
          Left = 215.212740000000000000
          Top = 37.795300000000000000
          Width = 34.015770000000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '6')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo112: TfrxMemoView
          Left = 929.763520790000000000
          Top = 18.897650000000000000
          Width = 34.015748030000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1072#1093'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo113: TfrxMemoView
          Left = 929.763520790000000000
          Top = 37.795300000000000000
          Width = 34.015735830000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '31')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo138: TfrxMemoView
          Left = 328.819110000000000000
          Width = 3.779530000000000000
          Height = 49.133890000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo140: TfrxMemoView
          Left = 585.826735040000000000
          Width = 3.779527560000000000
          Height = 49.133890000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo142: TfrxMemoView
          Left = 842.834579760000000000
          Width = 3.779527560000000000
          Height = 49.133890000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
      end
      object Footer2: TfrxFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 143.622140000000000000
        ParentFont = False
        Top = 464.882190000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Subreport2: TfrxSubreport
          Top = 124.724490000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Page = Report.Page3
        end
        object Subreport1: TfrxSubreport
          Top = 15.118120000000000000
          Width = 94.488250000000000000
          Height = 56.692913390000000000
          Page = Report.Page2
        end
      end
    end
    object Page2: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData2: TfrxMasterData
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 109.606370000000000000
        Width = 1046.929810000000000000
        DataSetName = 'JODataset'
        RowCount = 0
        Stretched = True
        object Memo125: TfrxMemoView
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataField = 'Num_Sch'
          DataSetName = 'JODataset'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[JODataset."Num_Sch"]')
          VAlign = vaCenter
        end
        object Memo126: TfrxMemoView
          Left = 98.267780000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'In_Db'
          DataSetName = 'JODataset'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[JODataset."In_Db"]')
          VAlign = vaCenter
        end
        object Memo127: TfrxMemoView
          Left = 192.756030000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'In_Kr'
          DataSetName = 'JODataset'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[JODataset."In_Kr"]')
          VAlign = vaCenter
        end
        object Memo128: TfrxMemoView
          Left = 287.244280000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'Cur_Db'
          DataSetName = 'JODataset'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[JODataset."Cur_Db"]')
          VAlign = vaCenter
        end
        object Memo129: TfrxMemoView
          Left = 381.732530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'Cur_Kr'
          DataSetName = 'JODataset'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[JODataset."Cur_Kr"]')
          VAlign = vaCenter
        end
        object Memo130: TfrxMemoView
          Left = 476.220780000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'Out_Db'
          DataSetName = 'JODataset'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[JODataset."Out_Db"]')
          VAlign = vaCenter
        end
        object Memo131: TfrxMemoView
          Left = 570.709030000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'Out_Kr'
          DataSetName = 'JODataset'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[JODataset."Out_Kr"]')
          VAlign = vaCenter
        end
      end
      object Header1: TfrxHeader
        Height = 68.031540000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo115: TfrxMemoView
          Left = 98.267780000000000000
          Top = 30.236240000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Color = 12829635
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1072#1083#1100#1076#1086' '#1074#1093#1110#1076#1085#1077)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo116: TfrxMemoView
          Left = 98.267780000000000000
          Top = 49.133890000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Color = 12829635
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo117: TfrxMemoView
          Left = 192.756030000000000000
          Top = 49.133890000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Color = 12829635
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo118: TfrxMemoView
          Left = 287.244280000000000000
          Top = 30.236240000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Color = 12829635
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1091#1093' '#1082#1086#1096#1090#1110#1074)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo119: TfrxMemoView
          Left = 287.244280000000000000
          Top = 49.133890000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Color = 12829635
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo120: TfrxMemoView
          Left = 381.732530000000000000
          Top = 49.133890000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Color = 12829635
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo121: TfrxMemoView
          Left = 476.220780000000000000
          Top = 30.236240000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Color = 12829635
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1072#1083#1100#1076#1086' '#1074#1080#1093#1110#1076#1085#1077)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo122: TfrxMemoView
          Left = 476.220780000000000000
          Top = 49.133890000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Color = 12829635
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo123: TfrxMemoView
          Left = 570.709030000000000000
          Top = 49.133890000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Color = 12829635
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo124: TfrxMemoView
          Top = 30.236240000000000000
          Width = 98.267780000000000000
          Height = 37.795300000000000000
          Color = 12829635
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1086#1084#1077#1088' '#1088#1072#1093#1091#1085#1082#1091)
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
    object Page3: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object Header2: TfrxHeader
        Height = 68.031540000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo146: TfrxMemoView
          Left = 98.267780000000000000
          Top = 30.236240000000000000
          Width = 98.267780000000000000
          Height = 37.795300000000000000
          Color = 12829635
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1072#1093#1091#1085#1086#1082' '#1050#1088)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo147: TfrxMemoView
          Left = 362.834880000000000000
          Top = 30.236240000000000000
          Width = 83.149606300000000000
          Height = 37.795300000000000000
          Color = 12829635
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1090#1072#1090#1090#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo148: TfrxMemoView
          Left = 529.134200000000000000
          Top = 30.236240000000000000
          Width = 136.063080000000000000
          Height = 37.795300000000000000
          Color = 12829635
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo149: TfrxMemoView
          Left = 196.535560000000000000
          Top = 30.236240000000000000
          Width = 83.149606300000000000
          Height = 37.795300000000000000
          Color = 12829635
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1086#1096#1090#1086#1088#1080#1089)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo152: TfrxMemoView
          Left = 279.685220000000000000
          Top = 30.236240000000000000
          Width = 83.149606300000000000
          Height = 37.795300000000000000
          Color = 12829635
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1086#1079#1076#1110#1083)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo155: TfrxMemoView
          Top = 30.236240000000000000
          Width = 98.267780000000000000
          Height = 37.795300000000000000
          Color = 12829635
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1072#1093#1091#1085#1086#1082' '#1044#1073)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo150: TfrxMemoView
          Left = 445.984540000000000000
          Top = 30.236240000000000000
          Width = 83.149606300000000000
          Height = 37.795300000000000000
          Color = 12829635
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1045#1050#1042)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo160: TfrxMemoView
          Top = 7.559060000000000000
          Width = 665.197280000000000000
          Height = 22.677180000000000000
          Color = 12829635
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1085#1096#1110' '#1087#1088#1086#1074#1086#1076#1082#1080)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData3: TfrxMasterData
        Height = 18.897650000000000000
        Top = 109.606370000000000000
        Width = 1046.929810000000000000
        DataSetName = 'SecDataset'
        RowCount = 0
        Stretched = True
        object Memo151: TfrxMemoView
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataField = 'DBSch'
          DataSetName = 'SecDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SecDataset."DBSch"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo153: TfrxMemoView
          Left = 98.267780000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataField = 'KrSch'
          DataSetName = 'SecDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SecDataset."KrSch"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo154: TfrxMemoView
          Left = 196.535560000000000000
          Width = 83.149606299212600000
          Height = 18.897650000000000000
          DataField = 'S'
          DataSetName = 'SecDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SecDataset."S"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo156: TfrxMemoView
          Left = 279.685220000000000000
          Width = 83.149606300000000000
          Height = 18.897650000000000000
          DataField = 'R'
          DataSetName = 'SecDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SecDataset."R"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo157: TfrxMemoView
          Left = 362.834880000000000000
          Width = 83.149606300000000000
          Height = 18.897650000000000000
          DataField = 'St'
          DataSetName = 'SecDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SecDataset."St"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo158: TfrxMemoView
          Left = 445.984540000000000000
          Width = 83.149606300000000000
          Height = 18.897650000000000000
          DataField = 'KEKV'
          DataSetName = 'SecDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SecDataset."KEKV"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo159: TfrxMemoView
          Left = 529.134200000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          DataField = 'Summa'
          DataSetName = 'SecDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SecDataset."Summa"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary2: TfrxReportSummary
        Height = 22.677180000000000000
        Top = 188.976500000000000000
        Width = 1046.929810000000000000
      end
    end
  end
  object PMemoryData: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'id_Dog'
        DataType = ftVariant
      end
      item
        Name = 'Reg_num'
        DataType = ftVariant
      end
      item
        Name = 'Name_Cust'
        DataType = ftVariant
      end
      item
        Name = 'DSumma'
        DataType = ftVariant
      end
      item
        Name = 'Db_Sch'
        DataType = ftVariant
      end
      item
        Name = 'Kr_Sch'
        DataType = ftVariant
      end
      item
        Name = 'S'
        DataType = ftVariant
      end
      item
        Name = 'R'
        DataType = ftVariant
      end
      item
        Name = 'St'
        DataType = ftVariant
      end
      item
        Name = 'Kekv'
        DataType = ftVariant
      end
      item
        Name = 'Summa'
        DataType = ftVariant
      end>
    Left = 681
    Top = 53
  end
  object PDataset: TfrxDBDataset
    UserName = 'PDataset'
    CloseDataSource = False
    DataSet = PMemoryData
    Left = 680
    Top = 85
  end
  object EditRepository: TcxEditRepository
    Left = 512
    Top = 45
    object cxEditRepository1PopupItem1: TcxEditRepositoryPopupItem
      Properties.PopupControl = SchGrid
      Properties.PopupWidth = 380
      Properties.OnCloseUp = cxEditRepository1PopupItem1PropertiesCloseUp
      Properties.OnPopup = cxEditRepository1PopupItem1PropertiesPopup
    end
    object cxEditRepository1ButtonItem1: TcxEditRepositoryButtonItem
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = cxEditRepository1ButtonItem1PropertiesButtonClick
    end
  end
end
