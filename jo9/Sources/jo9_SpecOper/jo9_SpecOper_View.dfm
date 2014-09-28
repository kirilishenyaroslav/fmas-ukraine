object jo9_SpecOper_View_Form: Tjo9_SpecOper_View_Form
  Left = 188
  Top = 183
  Width = 793
  Height = 482
  Caption = #1055#1077#1088#1077#1075#1083#1103#1076' '#1087#1088#1086#1074#1086#1076#1086#1082' '#1076#1086#1082#1091#1084#1077#1085#1090#1091' ('#1057#1087#1077#1094#1110#1072#1083#1100#1085#1110' '#1086#1087#1077#1088#1072#1094#1110#1111')'
  Color = clBtnFace
  Constraints.MinHeight = 271
  Constraints.MinWidth = 482
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
  object ResGrid: TcxGrid
    Left = 0
    Top = 0
    Width = 785
    Height = 316
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = cxcbsNone
    TabOrder = 0
    object ResTableView: TcxGridBandedTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = Summa_Column
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnCustomDrawCell = ResTableViewCustomDrawCell
      OnFocusedRecordChanged = ResTableViewFocusedRecordChanged
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = cxGridBandedTableViewStyleSheet1
      Bands = <
        item
          Caption = #1044#1077#1073#1077#1090
          Width = 355
        end
        item
          Caption = #1050#1088#1077#1076#1080#1090
          Width = 355
        end
        item
          Caption = #1057#1091#1084#1072
          Width = 75
        end>
      object DB_RegNum_Column: TcxGridBandedColumn
        Caption = #1044#1086#1075#1086#1074#1110#1088
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
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnButtonClick = DB_RegNum_ColumnPropertiesButtonClick
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object DB_Sch_Column: TcxGridBandedColumn
        Caption = #1056#1072#1093'.'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Focusing = False
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object DB_S_Column: TcxGridBandedColumn
        Caption = #1050#1086#1096#1090'.'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Focusing = False
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object DB_R_Column: TcxGridBandedColumn
        Caption = #1056#1086#1079#1076'.'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Focusing = False
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object DB_St_Column: TcxGridBandedColumn
        Caption = #1057#1090#1072#1090#1090#1103
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Focusing = False
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object DB_Kekv_Column: TcxGridBandedColumn
        Caption = #1050#1045#1050#1042
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Focusing = False
        Position.BandIndex = 0
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object KR_RegNum_Column: TcxGridBandedColumn
        Caption = #1044#1086#1075#1086#1074#1110#1088
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
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnButtonClick = KR_RegNum_ColumnPropertiesButtonClick
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object KR_Sch_Column: TcxGridBandedColumn
        Caption = #1056#1072#1093'.'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Focusing = False
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object KR_S_Column: TcxGridBandedColumn
        Caption = #1050#1086#1096#1090'.'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Focusing = False
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object KR_R_Column: TcxGridBandedColumn
        Caption = #1056#1086#1079#1076'.'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Focusing = False
        Position.BandIndex = 1
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object KR_St_Column: TcxGridBandedColumn
        Caption = #1057#1090#1072#1090#1090#1103
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Focusing = False
        Position.BandIndex = 1
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object KR_Kekv_Column: TcxGridBandedColumn
        Caption = #1050#1045#1050#1042
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Focusing = False
        Position.BandIndex = 1
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object Summa_Column: TcxGridBandedColumn
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = ',0.00;-,0.00'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Focusing = False
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
        IsCaptionAssigned = True
      end
      object DB_Sch_Name_Column: TcxGridBandedColumn
        Visible = False
        Options.Focusing = False
        Position.BandIndex = 0
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
      object DB_S_Name_Column: TcxGridBandedColumn
        Visible = False
        Options.Focusing = False
        Position.BandIndex = 0
        Position.ColIndex = 7
        Position.RowIndex = 0
      end
      object DB_R_Name_Column: TcxGridBandedColumn
        Visible = False
        Options.Focusing = False
        Position.BandIndex = 0
        Position.ColIndex = 8
        Position.RowIndex = 0
      end
      object DB_St_Name_Column: TcxGridBandedColumn
        Visible = False
        Options.Focusing = False
        Position.BandIndex = 0
        Position.ColIndex = 9
        Position.RowIndex = 0
      end
      object DB_Kekv_Name_Column: TcxGridBandedColumn
        Visible = False
        Options.Focusing = False
        Position.BandIndex = 0
        Position.ColIndex = 10
        Position.RowIndex = 0
      end
      object KR_Sch_Name_Column: TcxGridBandedColumn
        Visible = False
        Options.Focusing = False
        Position.BandIndex = 0
        Position.ColIndex = 11
        Position.RowIndex = 0
      end
      object KR_S_Name_Column: TcxGridBandedColumn
        Visible = False
        Options.Focusing = False
        Position.BandIndex = 0
        Position.ColIndex = 12
        Position.RowIndex = 0
      end
      object KR_R_Name_Column: TcxGridBandedColumn
        Visible = False
        Options.Focusing = False
        Position.BandIndex = 0
        Position.ColIndex = 13
        Position.RowIndex = 0
      end
      object KR_St_Name_Column: TcxGridBandedColumn
        Visible = False
        Options.Focusing = False
        Position.BandIndex = 0
        Position.ColIndex = 14
        Position.RowIndex = 0
      end
      object KR_Kekv_Name_Column: TcxGridBandedColumn
        Visible = False
        Options.Focusing = False
        Position.BandIndex = 0
        Position.ColIndex = 15
        Position.RowIndex = 0
      end
      object DB_Name_Shablon_Column: TcxGridBandedColumn
        Visible = False
        Options.Focusing = False
        Position.BandIndex = 0
        Position.ColIndex = 16
        Position.RowIndex = 0
      end
      object KR_Name_Shablon_Column: TcxGridBandedColumn
        Visible = False
        Options.Focusing = False
        Position.BandIndex = 0
        Position.ColIndex = 17
        Position.RowIndex = 0
      end
      object DB_id_Dog_Column: TcxGridBandedColumn
        Visible = False
        Options.Focusing = False
        Position.BandIndex = 0
        Position.ColIndex = 18
        Position.RowIndex = 0
      end
      object KR_id_Dog_Column: TcxGridBandedColumn
        Visible = False
        Options.Focusing = False
        Position.BandIndex = 0
        Position.ColIndex = 19
        Position.RowIndex = 0
      end
    end
    object ResGridLevel: TcxGridLevel
      GridView = ResTableView
    end
  end
  object Panel: TPanel
    Left = 0
    Top = 316
    Width = 785
    Height = 132
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      785
      132)
    object DbShape: TShape
      Left = 2
      Top = 1
      Width = 390
      Height = 96
      Brush.Color = 16247513
    end
    object Label8: TLabel
      Left = 32
      Top = 75
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
    object Label17: TLabel
      Left = 26
      Top = 60
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
    object Label16: TLabel
      Left = 27
      Top = 45
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
    object Label15: TLabel
      Left = 10
      Top = 29
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
    object S_Label: TLabel
      Left = 67
      Top = 29
      Width = 320
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
    object R_Label: TLabel
      Left = 67
      Top = 45
      Width = 320
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
    object St_Label: TLabel
      Left = 67
      Top = 61
      Width = 320
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
    object Kekv_Label: TLabel
      Left = 67
      Top = 75
      Width = 320
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
    object Label7: TLabel
      Left = 19
      Top = 7
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
      Left = 67
      Top = 7
      Width = 320
      Height = 13
      AutoSize = False
      Caption = 'Sch_Label'
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object KrShape: TShape
      Left = 393
      Top = 1
      Width = 390
      Height = 96
      Brush.Color = 16247513
    end
    object Label1: TLabel
      Left = 408
      Top = 7
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
    object Sch_Label2: TLabel
      Left = 456
      Top = 7
      Width = 320
      Height = 13
      AutoSize = False
      Caption = 'Sch_Label'
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object Label3: TLabel
      Left = 399
      Top = 29
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
    object S_Label2: TLabel
      Left = 456
      Top = 29
      Width = 320
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
    object Label5: TLabel
      Left = 416
      Top = 45
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
    object R_Label2: TLabel
      Left = 456
      Top = 45
      Width = 320
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
    object Label9: TLabel
      Left = 415
      Top = 60
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
    object St_Label2: TLabel
      Left = 456
      Top = 61
      Width = 320
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
    object Label11: TLabel
      Left = 421
      Top = 75
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
    object Kekv_Label2: TLabel
      Left = 456
      Top = 75
      Width = 320
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
    object CancelButton: TcxButton
      Left = 42
      Top = 101
      Width = 699
      Height = 28
      Anchors = [akLeft, akTop, akRight]
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = CancelButtonClick
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 442
    Top = 376
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
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
    object cxStyle43: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle44: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle45: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle46: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle47: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle48: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle49: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle50: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle51: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle52: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle53: TcxStyle
      AssignedValues = [svColor]
      Color = 8453888
    end
    object cxStyle54: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle55: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16777088
      TextColor = clBlue
    end
    object cxStyle56: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxGridBandedTableViewStyleSheet1: TcxGridBandedTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle43
      Styles.Content = cxStyle44
      Styles.ContentEven = cxStyle45
      Styles.ContentOdd = cxStyle46
      Styles.Inactive = cxStyle52
      Styles.IncSearch = cxStyle53
      Styles.Selection = cxStyle56
      Styles.FilterBox = cxStyle47
      Styles.Footer = cxStyle48
      Styles.Group = cxStyle49
      Styles.GroupByBox = cxStyle50
      Styles.Header = cxStyle51
      Styles.Indicator = cxStyle54
      Styles.Preview = cxStyle55
      Styles.BandHeader = cxStyle1
      BuiltIn = True
    end
  end
end
