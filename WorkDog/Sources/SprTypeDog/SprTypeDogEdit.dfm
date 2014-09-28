object frmTypeDogEdit: TfrmTypeDogEdit
  Left = 331
  Top = 94
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1085#1085#1103
  ClientHeight = 464
  ClientWidth = 473
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 473
    Height = 423
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      DesignSize = (
        465
        395)
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 81
        Height = 13
        Caption = #1058#1080#1087' '#1076#1086#1075#1086#1074#1086#1088#1091
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 8
        Top = 48
        Width = 103
        Height = 13
        Caption = #1057#1082#1086#1088#1086#1095#1077#1085#1072' '#1085#1072#1079#1074#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 8
        Top = 88
        Width = 77
        Height = 13
        Caption = #1055#1086#1074#1085#1072' '#1085#1072#1079#1074#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 112
        Top = 8
        Width = 66
        Height = 13
        Caption = #1040#1082#1090#1080#1074#1085#1110#1089#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TextEdit_Name: TcxTextEdit
        Left = 8
        Top = 101
        Width = 453
        Height = 21
        Anchors = [akLeft, akTop, akRight, akBottom]
        ParentFont = False
        Properties.MaxLength = 255
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 3
      end
      object TextEdit_Short_Name: TcxTextEdit
        Left = 8
        Top = 61
        Width = 453
        Height = 21
        Anchors = [akLeft, akTop, akRight, akBottom]
        ParentFont = False
        Properties.MaxLength = 25
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 2
      end
      object cxComboBox_active: TcxComboBox
        Left = 112
        Top = 21
        Width = 121
        Height = 21
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          #1053#1072#1084' '#1089#1087#1083#1072#1095#1091#1102#1090#1100
          #1052#1080' '#1089#1087#1083#1072#1095#1091#1108#1084#1086)
        Properties.ReadOnly = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 1
      end
      object cxMaskEdit_dog: TcxMaskEdit
        Left = 8
        Top = 21
        Width = 81
        Height = 21
        ParentFont = False
        Properties.MaxLength = 5
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 0
        OnKeyPress = cxMaskEdit_dogKeyPress
      end
      object GroupBox4: TGroupBox
        Left = 8
        Top = 128
        Width = 453
        Height = 145
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 4
        DesignSize = (
          453
          145)
        object Label14: TLabel
          Left = 8
          Top = 52
          Width = 59
          Height = 13
          Caption = #1050#1086#1084#1077#1085#1090#1072#1088
        end
        object Label9: TLabel
          Left = 8
          Top = 8
          Width = 82
          Height = 13
          Caption = #1053#1072#1079#1074#1072' '#1087#1072#1082#1077#1090#1091
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object cxMemo_comment: TcxMemo
          Left = 8
          Top = 67
          Width = 437
          Height = 73
          Anchors = [akLeft, akTop, akRight, akBottom]
          Enabled = False
          Style.Color = clMoneyGreen
          TabOrder = 0
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 8
          Top = 24
          Width = 437
          Height = 21
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = clMoneyGreen
          DropDownRows = 20
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'id_shablon'
          ListField = 'name_shablon'
          ListSource = DataSource
          ParentFont = False
          TabOrder = 1
          OnClick = DBLookupComboBox1Click
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      DesignSize = (
        465
        395)
      object Label5: TLabel
        Left = 8
        Top = 344
        Width = 112
        Height = 13
        Caption = #1055#1110#1076#1089#1090#1072#1074#1072' '#1076#1086#1075#1086#1074#1086#1088#1091
      end
      object Label18: TLabel
        Left = 8
        Top = 0
        Width = 40
        Height = 13
        Caption = #1053#1086#1084#1077#1088
      end
      object Label19: TLabel
        Left = 104
        Top = 0
        Width = 31
        Height = 13
        Caption = #1044#1072#1090#1072
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 224
        Width = 451
        Height = 117
        Anchors = [akLeft, akTop, akRight]
        Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        DesignSize = (
          451
          117)
        object Label8: TLabel
          Left = 136
          Top = 48
          Width = 142
          Height = 13
          Caption = #1056#1086#1079#1088#1072#1093#1091#1085#1082#1086#1074#1080#1081' '#1088#1072#1093#1091#1085#1086#1082
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 8
          Top = 47
          Width = 32
          Height = 13
          Caption = #1052#1060#1054
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 9
          Top = 79
          Width = 102
          Height = 13
          Caption = #1042#1110#1076#1076#1110#1083#1077#1085#1085#1103' '#1073#1072#1085#1082#1091
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 8
          Top = 16
          Width = 88
          Height = 13
          Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object cxButtonEdit_kontrag: TcxButtonEdit
          Left = 8
          Top = 28
          Width = 435
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnButtonClick = cxButtonEdit_kontragPropertiesButtonClick
          Style.Color = clMoneyGreen
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 0
        end
        object cxTextEdit_schet: TcxTextEdit
          Left = 136
          Top = 60
          Width = 307
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.ReadOnly = True
          Style.Color = clMoneyGreen
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 1
        end
        object cxTextEdit_mfo_kontr: TcxTextEdit
          Left = 8
          Top = 60
          Width = 121
          Height = 21
          TabStop = False
          ParentFont = False
          Properties.ReadOnly = True
          Style.Color = clMoneyGreen
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 2
        end
        object cxTextEdit_bank_kontr: TcxTextEdit
          Left = 8
          Top = 92
          Width = 435
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.ReadOnly = True
          Style.Color = clMoneyGreen
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 3
        end
        object cxButton_del_kontr: TcxButton
          Left = 264
          Top = 8
          Width = 73
          Height = 17
          Caption = #1054#1095#1080#1089#1090#1080#1090#1080
          Enabled = False
          TabOrder = 4
          OnClick = cxButton_del_kontrClick
        end
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 104
        Width = 451
        Height = 118
        Anchors = [akLeft, akTop, akRight]
        Caption = #1056#1072#1093#1091#1085#1086#1082
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        DesignSize = (
          451
          118)
        object Label6: TLabel
          Left = 9
          Top = 48
          Width = 32
          Height = 13
          Caption = #1052#1060#1054
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 159
          Top = 46
          Width = 142
          Height = 13
          Caption = #1056#1086#1079#1088#1072#1093#1091#1085#1082#1086#1074#1080#1081' '#1088#1072#1093#1091#1085#1086#1082
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 9
          Top = 78
          Width = 102
          Height = 13
          Caption = #1042#1110#1076#1076#1110#1083#1077#1085#1085#1103' '#1073#1072#1085#1082#1091
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 8
          Top = 16
          Width = 88
          Height = 13
          Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object cxButtonEdit_schet: TcxButtonEdit
          Left = 8
          Top = 28
          Width = 435
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnButtonClick = cxButtonEdit_PropertiesButtonClick
          Style.Color = clMoneyGreen
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 0
        end
        object cxTextEdit_mfo_un: TcxTextEdit
          Left = 8
          Top = 59
          Width = 121
          Height = 21
          TabStop = False
          ParentFont = False
          Properties.ReadOnly = True
          Style.Color = clMoneyGreen
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 1
        end
        object cxTextEdit_rsch_un: TcxTextEdit
          Left = 160
          Top = 59
          Width = 283
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.ReadOnly = True
          Style.Color = clMoneyGreen
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 2
        end
        object cxTextEdit_bank_un: TcxTextEdit
          Left = 8
          Top = 91
          Width = 435
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.ReadOnly = True
          Style.Color = clMoneyGreen
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 3
        end
        object cxButton_rsch: TcxButton
          Left = 264
          Top = 8
          Width = 179
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = #1054#1095#1080#1089#1090#1080#1090#1080
          Enabled = False
          TabOrder = 4
          OnClick = cxButton_rschClick
        end
      end
      object GroupBox5: TGroupBox
        Left = 8
        Top = 35
        Width = 451
        Height = 62
        Anchors = [akLeft, akTop, akRight]
        Caption = #1047#1074#39#1103#1079#1072#1090#1080' '#1090#1080#1087' '#1076#1086#1075#1086#1074#1086#1088#1091' '#1079' '#1082#1086#1088#1077#1089#1087#1086#1085#1076#1091#1102#1095#1080#1084' '#1088#1072#1093#1091#1085#1082#1086#1084
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        DesignSize = (
          451
          62)
        object Label16: TLabel
          Left = 216
          Top = 22
          Width = 23
          Height = 13
          Caption = #1050#1086#1076
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 8
          Top = 22
          Width = 38
          Height = 13
          Caption = #1053#1072#1079#1074#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object cxButtonEdit_bl_sch: TcxButtonEdit
          Left = 216
          Top = 36
          Width = 227
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnButtonClick = cxButtonEdit_bl_schPropertiesButtonClick
          Style.Color = clMoneyGreen
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 0
        end
        object cxTextEdit_bl_sch: TcxTextEdit
          Left = 8
          Top = 36
          Width = 201
          Height = 21
          TabStop = False
          ParentFont = False
          Properties.ReadOnly = True
          Style.Color = clMoneyGreen
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 1
        end
        object cxButton_bl: TcxButton
          Left = 264
          Top = 16
          Width = 179
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = #1054#1095#1080#1089#1090#1080#1090#1080
          Enabled = False
          TabOrder = 2
          OnClick = cxButton_blClick
        end
      end
      object cxTextEdit_Num: TcxTextEdit
        Left = 8
        Top = 12
        Width = 81
        Height = 21
        ParentFont = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 0
      end
      object cxDateEdit_date: TcxDateEdit
        Left = 104
        Top = 12
        Width = 105
        Height = 21
        ParentFont = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 1
      end
      object cxMemo_def_note: TcxMemo
        Left = 7
        Top = 360
        Width = 450
        Height = 35
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Properties.MaxLength = 160
        Properties.ScrollBars = ssVertical
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 5
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 2
      DesignSize = (
        465
        395)
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 462
        Height = 48
        Align = alNone
        Anchors = [akLeft, akTop, akRight]
        ButtonHeight = 44
        ButtonWidth = 31
        Caption = 'ToolBar1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Images = frmTypeDog.LargeImages
        ParentFont = False
        ShowCaptions = True
        TabOrder = 0
      end
      object cxGrid1: TcxGrid
        Left = 0
        Top = 48
        Width = 462
        Height = 287
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        LookAndFeel.Kind = lfFlat
        object cxGrid1DBTableView1: TcxGridDBTableView
          DataController.DataSource = DataSource_group_doc
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OnCustomDrawCell = cxGrid1DBTableView1CustomDrawCell
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          Styles.StyleSheet = cxGridTableViewStyleSheet1
          object nomer_group: TcxGridDBColumn
            Caption = #1053#1086#1084#1077#1088' '#1075#1088#1091#1087#1080
            PropertiesClassName = 'TcxCalcEditProperties'
            SortOrder = soAscending
            Width = 123
            DataBinding.FieldName = 'nomer_grup'
          end
          object name_group_doc: TcxGridDBColumn
            Caption = #1043#1088#1091#1087#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1110#1074
            Width = 337
            DataBinding.FieldName = 'name_group'
          end
          object flag_del: TcxGridDBColumn
            Visible = False
            DataBinding.FieldName = 'flag_del'
          end
          object id_group_doc: TcxGridDBColumn
            Caption = 'id_group_doc'
            Visible = False
            DataBinding.FieldName = 'id_group'
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 8
        Width = 458
        Height = 34
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvNone
        TabOrder = 2
        DesignSize = (
          458
          34)
        object ToolButtonAdd: TSpeedButton
          Left = 8
          Top = 0
          Width = 185
          Height = 33
          Action = add
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            36090000424D3609000000000000360000002800000018000000180000000100
            2000000000000009000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF0094635A00A5636B00A5636B00A5636B00A5636B00A5636B00A563
            6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
            6B00A5636B00A5636B00A5636B00A5636B00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0094635A00EFD6B500F7DEB500F7D6AD00F7D6A500F7CE9C00EFCE
            9400EFC69400EFC68C00EFC68400EFC68400EFC68400EFC68400EFC68400EFC6
            8400EFC68400EFC68400EFBD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0094635A00EFD6BD00F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE
            9C00EFC69400EFC68C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD7B00EFBD
            7B00EFBD7B00EFBD7B00E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0094635A00EFD6C600F7E7C600F7DEBD00F7D6B500F7D6AD00EFCE
            A500EFCE9C00EFC69400EFC68C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD
            7B00EFBD7B00EFBD7B00E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0094635A00EFDEC600F7E7C600F7DEBD00F7DEB500F7D6B500F7D6
            AD00EFCEA500EFCE9C00EFC69400EFC68C00EFC68C00EFBD8400EFBD7B00EFBD
            7B00EFBD7B00EFBD7B00E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0094636300F7DECE00FFE7CE00F7E7C600F7DEBD00F7DEB500F7D6
            B500EFCEA500DEBD9400D6B58C00D6B58400DEB58400E7BD8400EFBD8400EFBD
            7B00EFBD7B00EFBD7B00E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0094636300F7E7D600FFEFD600F7E7CE00F7DEC600F7DEBD00F7DE
            BD00DEC6A500BDA58400AD947300A58C6B00BD9C7300DEB58400EFC68C00EFBD
            8400EFBD7B00EFBD7B00E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF009C6B6300F7E7DE00FFEFDE00F7E7D600F7E7CE00F7E7C600F7DE
            BD00004A0000004A0000004A0000004A0000A58C6B00D6B58400EFC68C00EFC6
            8C00EFBD8400EFBD7B00E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF009C6B6300F7EFE700FFF7E700FFEFDE00F7E7CE00E7D6BD00DECE
            B500004A00000894100000940800004A0000A58C6B00C6AD8400D6B58400DEB5
            8400E7BD8400EFBD8400E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00A5736300F7EFEF00FFF7EF00FFEFE700E7DECE00C6B5A500AD9C
            8C00004A0000089C1800089C1000004A000094846B00A58C6B00A58C6B00BD9C
            7300DEB58400EFC68C00E7BD84009C6B6300FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00A5736B00FFF7F700FFFFF700FFF7EF00004A0000004A0000004A
            0000004A000010A5210008A51800004A0000004A0000004A0000004A0000A58C
            6B00D6B58400EFC68C00EFBD84009C6B6300FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00AD7B6B00FFF7F700FFFFFF00FFFFF700004A000021C6420021C6
            420018BD390018B5310010AD290010A5210008A51800089C1000004A0000AD94
            7300D6B58C00EFCE9400EFC68C00A5736300FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00B57B6B00FFF7F700FFFFFF00FFFFFF00004A000029D6520029CE
            4A0021C6420018BD390018B5310010B5290010AD210010A52100004A0000BDA5
            8400DEBD9400EFCE9C00EFC69400A5736300FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00B5846B00FFF7F700FFFFFF00FFFFFF00004A0000004A0000004A
            0000004A000021CE4A0021C64200004A0000004A0000004A0000004A0000E7C6
            A500EFCEA500F7CEA500EFCE9C009C736300FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00BD846B00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
            F700004A000029D65A0029CE5200004A0000AD9C8C00DECEB500F7DEBD00F7DE
            B500F7D6AD00EFD6A500CEB594008C6B6300FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00C68C6B00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00004A000031DE630031DE5A00004A0000C6B5A500E7D6BD00F7DEC600F7DE
            BD00E7CEAD00C6B59400A5947B0084636300FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00C68C7300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00004A0000004A0000004A0000004A0000E7DECE00F7E7CE00FFEFD600E7D6
            BD00BDAD9C00A59C8C00A5948400846B6300FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00CE947300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFF7F700FFF7EF00FFF7E700EFD6C6009C635A009C63
            5A0094635A0094635A0094635A009C6B5A00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00CE947300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFFFEF00DEC6B5009C635A00DEA5
            6B00DE9C4A00E7943900EF8C2100A56B6B00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00D69C7300FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700DEC6BD009C635A00EFB5
            7300EFAD5200F7A53100A56B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00D69C7300FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEC6C6009C635A00EFB5
            7300EFA55200A56B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00D69C7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE009C635A00EFB5
            7300A56B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00D6947300E7C6AD00E7C6B500E7C6B500E7C6B500E7C6B500E7C6
            AD00DEBDAD00DEBDAD00DEBDAD00D6B5AD00D6B5AD00C69C94009C635A00A56B
            6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentFont = False
        end
        object ToolButton_del: TSpeedButton
          Left = 264
          Top = 0
          Width = 177
          Height = 33
          Action = del
          Anchors = [akLeft, akTop, akRight]
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            36090000424D3609000000000000360000002800000018000000180000000100
            2000000000000009000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF000000B5000000B500FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF000000B5000000B5000000B500FF00FF00FF00FF00FF00
            FF000000B5000000B5000000B500FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF000000B5000000B5000000B500FF00FF00FF00FF00FF00FF00FF00
            FF000000B5000000B5000000B5000000B500FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
            B5000000B5000000B5000000B500FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF000000B5000000B5000000B5000000B5000000B500FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000B5000000
            B5000000B5000000B500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF000000B5000000B5000000B5000000B5000000B500FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000B5000000B5000000
            B5000000B500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF000000F7000000B5000000B5000000B5000000B500FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF000000B5000000B5000000B5000000
            B500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF000000B5000000B5000000B5000000
            B500FF00FF00FF00FF000000B5000000B5000000B5000000B5000000B500FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000B5000000B5000000
            B5000000B5000000B5000000B5000000B5000000B5000000B500FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000B5000000
            B5000000F7000000B5000000F7000000B5000000B500FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
            B5000000B5000000B5000000F7000000B500FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000B5000000
            B5000000F7000000B5000000B5000000F7000000F700FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000B5000000B5000000
            F7000000B5000000F7000000F7000000F7000000B5000000F700FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF000000F7000000F7000000F7000000
            B5000000F700FF00FF00FF00FF000000F7000000F7000000F7000000F700FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF000000F7000000F7000000B5000000F7000000
            F700FF00FF00FF00FF00FF00FF00FF00FF000000F7000000F7000000F7000000
            F700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF000000F7000000F7000000F7000000F7000000F700FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000F7000000
            F7000000F700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF000000F7000000F7000000F7000000F7000000F700FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
            F7000000F7000000F700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF000000F7000000F7000000F7000000F7000000F700FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF000000F700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
            F7000000F7000000F7000000F7000000F700FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
            F7000000F7000000F7000000F700FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
            F7000000F7000000F700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentFont = False
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 423
    Width = 473
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      473
      41)
    object cxButton1: TcxButton
      Left = 328
      Top = 8
      Width = 141
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Cancel = True
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = cxButton1Click
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000C40E0000C40E0000000100000000000000000000FFFF
        FF00C8D0D4000000FF0000008400848484000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020404050202020202020404020202020204040405
        0202020204040502020202020204040405020204040402020202020202020404
        0405040404020202020202020202020404040404020202020202020202020202
        0403040502020202020202020202020404040404050202020202020202020404
        0402040404050202020202020204040402020204040405020202020204040402
        0202020204040402020202020404020202020202020404020202020202020202
        0202020202020202020202020202020202020202020202020202}
      UseSystemPaint = False
    end
    object cxButton2: TcxButton
      Left = 168
      Top = 8
      Width = 137
      Height = 25
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = cxButton2Click
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000C40E0000C40E0000000100000000000000000000FFFF
        FF0000FF000000840000C8D0D40084848400FFFFFF0000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000040404040404
        0404040404040404040404040404040404040404040404040404040404040404
        0404040404040404040404040404040400040404040404040404040404040400
        0300040404040404040404040404000302030004040404040404040404000202
        0202030004040404040404040002020505020203000404040404040405020504
        0405020203000404040404040405040404040502020300040404040404040404
        0404040502020300040404040404040404040404050202000404040404040404
        0404040404050200040404040404040404040404040405040404040404040404
        0404040404040404040404040404040404040404040404040404}
      UseSystemPaint = False
    end
  end
  object pFIBDataSet_type_dog_cust: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select pub_sp_customer.name_customer, pub_sp_customer.id_custome' +
        'r'
      'from pub_sp_customer'
      'where pub_sp_customer.id_customer=:param_cust'
      ''
      ''
      '')
    Left = 164
    Top = 272
    poSQLINT64ToBCD = True
  end
  object pFIBStoredProc_dog_edit: TpFIBStoredProc
    Left = 196
    Top = 272
  end
  object pFIBDataSet_tip_dog: TpFIBDataSet
    SelectSQL.Strings = (
      'select *'
      'from PUB_SP_TIP_DOG_INFO(:d_id_tip_dog)')
    Left = 132
    Top = 272
    poSQLINT64ToBCD = True
  end
  object pFIBDataSet_acc: TpFIBDataSet
    SelectSQL.Strings = (
      'select pub_sys_data.id_department, pub_sp_cust_rate_acc.*'
      'from pub_sys_data, pub_sp_cust_rate_acc'
      
        'where pub_sys_data.id_department=pub_sp_cust_rate_acc.id_custome' +
        'r'
      'and pub_sp_cust_rate_acc.id_rate_account=:param_acc')
    Left = 100
    Top = 272
    poSQLINT64ToBCD = True
  end
  object DataSource: TDataSource
    DataSet = pFIBDataSet_shablon
    Left = 228
    Top = 272
  end
  object pFIBDataSet_shablon: TpFIBDataSet
    SelectSQL.Strings = (
      'select *'
      'from dog_ini_shablon'
      '')
    Left = 268
    Top = 272
    poSQLINT64ToBCD = True
  end
  object RxMemoryData_tip_dog: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'id_group'
        DataType = ftVariant
      end
      item
        Name = 'name_group'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'flag_del'
        DataType = ftInteger
      end
      item
        Name = 'nomer_grup'
        DataType = ftString
        Size = 10
      end>
    Left = 136
    Top = 136
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 92
    Top = 136
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clInfoBk
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle2
      Styles.Content = cxStyle3
      Styles.ContentEven = cxStyle4
      Styles.ContentOdd = cxStyle5
      Styles.Inactive = cxStyle11
      Styles.IncSearch = cxStyle12
      Styles.Selection = cxStyle15
      Styles.FilterBox = cxStyle6
      Styles.Footer = cxStyle7
      Styles.Group = cxStyle8
      Styles.GroupByBox = cxStyle9
      Styles.Header = cxStyle10
      Styles.Indicator = cxStyle13
      Styles.Preview = cxStyle14
      BuiltIn = True
    end
  end
  object DataSource_group_doc: TDataSource
    DataSet = RxMemoryData_tip_dog
    Left = 180
    Top = 136
  end
  object pFIBDataSet_group_doc: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT  dog_dt_group_doc.n_group_doc,'
      '        dog_dt_group_doc.name_group_doc,'
      '        dog_group_tip_dog.value_group,'
      '        dog_dt_group_doc.id_group_doc'
      'FROM    dog_group_tip_dog, pub_sp_tip_dog, dog_dt_group_doc'
      'WHERE   pub_sp_tip_dog.id_tip_dog = dog_group_tip_dog.id_tip_dog'
      
        'AND     dog_dt_group_doc.id_group_doc = dog_group_tip_dog.id_gro' +
        'up_doc'
      'AND     pub_sp_tip_dog.id_tip_dog =:param_tip_dog'
      'AND     dog_group_tip_dog.value_group=1')
    Left = 68
    Top = 272
    poSQLINT64ToBCD = True
  end
  object cxStyleRepository2: TcxStyleRepository
    Left = 56
    Top = 136
    object cxStyle27: TcxStyle
      AssignedValues = [svColor]
      Color = clMoneyGreen
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor]
      Color = clBtnFace
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle31: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clMoneyGreen
      TextColor = clBlack
    end
    object cxStyle32: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clMoneyGreen
      TextColor = clBlack
    end
    object cxStyle33: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14084566
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
      AssignedValues = [svColor]
      Color = clSilver
    end
    object cxStyle36: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clYellow
      TextColor = clBlack
    end
    object cxStyle37: TcxStyle
      AssignedValues = [svColor]
      Color = clBtnFace
    end
    object cxStyle38: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clSilver
    end
    object cxStyle39: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGradientInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle40: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle41: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle42: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle43: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle44: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle45: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle46: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle47: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle48: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle49: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle50: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle51: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle52: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle53: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle54: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle55: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle56: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle57: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle58: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle59: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle60: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle61: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle62: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle63: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle64: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle65: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle66: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle67: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle68: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object TreeListStyleSheetDevExpress: TcxTreeListStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle27
      Styles.Content = cxStyle31
      Styles.Inactive = cxStyle35
      Styles.Selection = cxStyle39
      Styles.BandBackground = cxStyle28
      Styles.BandHeader = cxStyle29
      Styles.ColumnHeader = cxStyle30
      Styles.ContentEven = cxStyle32
      Styles.ContentOdd = cxStyle33
      Styles.Footer = cxStyle34
      Styles.IncSearch = cxStyle36
      Styles.Indicator = cxStyle37
      Styles.Preview = cxStyle38
      BuiltIn = True
    end
    object cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle27
      Styles.Content = cxStyle31
      Styles.ContentEven = cxStyle32
      Styles.ContentOdd = cxStyle33
      Styles.Inactive = cxStyle35
      Styles.IncSearch = cxStyle36
      Styles.Selection = cxStyle39
      Styles.FilterBox = cxStyle30
      Styles.Footer = cxStyle34
      Styles.Group = cxStyle40
      Styles.GroupByBox = cxStyle30
      Styles.Header = cxStyle30
      Styles.Indicator = cxStyle37
      Styles.Preview = cxStyle38
      BuiltIn = True
    end
  end
  object Timer1: TTimer
    Interval = 10000
    Left = 212
    Top = 136
  end
  object pFIBTransaction_edit: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 20
    Top = 272
  end
  object ActionList: TActionList
    Left = 244
    Top = 136
    object add: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      ShortCut = 45
      OnExecute = addExecute
    end
    object del: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      Enabled = False
      ShortCut = 46
      OnExecute = delExecute
    end
  end
end
