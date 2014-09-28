object Registration_Form: TRegistration_Form
  Left = 424
  Top = 266
  Width = 511
  Height = 348
  BorderIcons = [biSystemMenu]
  Caption = 'Registration_Form'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object FIO_Label: TLabel
    Left = 8
    Top = 8
    Width = 43
    Height = 13
    Caption = #1060'.'#1048'.'#1054'.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Fac_Label: TLabel
    Left = 8
    Top = 38
    Width = 65
    Height = 13
    Caption = #1060#1072#1082#1091#1083#1100#1090#1077#1090':  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Kurs_Label: TLabel
    Left = 298
    Top = 38
    Width = 33
    Height = 13
    Caption = #1050#1091#1088#1089':  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DataRog_Label: TLabel
    Left = 296
    Top = 8
    Width = 88
    Height = 13
    Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103':  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object FIOCOMBO_Label: TLabel
    Left = 56
    Top = 8
    Width = 3
    Height = 13
    Transparent = True
  end
  object cxPageControl1: TcxPageControl
    Left = 6
    Top = 72
    Width = 475
    Height = 201
    ActivePage = cxTabSheet1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    HotTrack = True
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = True
    ParentFont = False
    ParentShowHint = False
    ShowFrame = True
    ShowHint = False
    TabOrder = 0
    TabWidth = 82
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    object cxTabSheet1: TcxTabSheet
      Caption = #1055#1088#1086#1078#1080#1074#1072#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 0
      ParentFont = False
      object cxGroupBox1: TcxGroupBox
        Left = 8
        Top = 6
        Width = 455
        Height = 157
        Alignment = alTopLeft
        TabOrder = 0
        object Full_Build_Label: TLabel
          Left = 16
          Top = 134
          Width = 113
          Height = 13
          Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
          Transparent = True
        end
        object cxGrid2: TcxGrid
          Left = 16
          Top = 16
          Width = 425
          Height = 117
          TabOrder = 0
          LookAndFeel.Kind = lfUltraFlat
          object cxGridTableView_of_Live: TcxGridTableView
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OnFocusedRecordChanged = cxGridTableView_of_LiveFocusedRecordChanged
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnMoving = False
            OptionsCustomize.ColumnSorting = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            Styles.Background = cxStyle2
            Styles.Content = cxStyle2
            Styles.Inactive = cxStyle4
            Styles.Selection = cxStyle3
            Styles.Header = cxStyle1
            object cxGridColumn3: TcxGridColumn
              Caption = #1054#1073#1097'.'
              FooterAlignmentHorz = taRightJustify
              HeaderAlignmentHorz = taCenter
              Options.Sorting = False
              Width = 35
            end
            object cxGridColumn0: TcxGridColumn
              Caption = #1050#1086#1084#1085#1072#1090#1072
              HeaderAlignmentHorz = taCenter
              Options.Sorting = False
              Width = 53
            end
            object cxGridColumn1: TcxGridColumn
              Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Options.Sorting = False
              Width = 68
            end
            object cxGridColumn2: TcxGridColumn
              Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Options.Sorting = False
              Width = 68
            end
            object cxGridColumn4: TcxGridColumn
              Caption = 'Kod_Build'
              Visible = False
              Width = 54
            end
            object cxGridColumn5: TcxGridColumn
              Caption = 'N_Room'
              Visible = False
              Width = 33
            end
            object cxGridColumn6: TcxGridColumn
              Caption = 'Type_Room'
              Visible = False
              Width = 28
            end
            object cxGridColumn7: TcxGridColumn
              Caption = 'Short_Name_Build'
              Visible = False
              Width = 37
            end
            object flag4: TcxGridColumn
              Visible = False
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = cxGridTableView_of_Live
          end
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      object cxGroupBox4: TcxGroupBox
        Left = 8
        Top = 6
        Width = 455
        Height = 157
        Alignment = alTopLeft
        TabOrder = 0
        object Full_Cat_Label: TLabel
          Left = 16
          Top = 134
          Width = 113
          Height = 13
          Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
          Transparent = True
        end
        object cxGrid1: TcxGrid
          Left = 16
          Top = 16
          Width = 425
          Height = 117
          TabOrder = 0
          LookAndFeel.Kind = lfUltraFlat
          object cxGridTableView1: TcxGridTableView
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OnFocusedRecordChanged = cxGridTableView1FocusedRecordChanged
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnMoving = False
            OptionsCustomize.ColumnSorting = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            Styles.Background = cxStyle2
            Styles.Content = cxStyle2
            Styles.Inactive = cxStyle4
            Styles.Selection = cxStyle3
            Styles.Header = cxStyle1
            object cxGridTableView1Column1: TcxGridColumn
              Caption = #1050#1086#1076' '#1082#1072#1090#1077#1075#1086#1088#1080#1080
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
              Options.Sorting = False
              Width = 127
            end
            object cxGridTableView1Column2: TcxGridColumn
              Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
              PropertiesClassName = 'TcxDateEditProperties'
              HeaderAlignmentHorz = taCenter
              Options.Sorting = False
              Width = 148
            end
            object cxGridTableView1Column3: TcxGridColumn
              Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
              HeaderAlignmentHorz = taCenter
              Options.Sorting = False
              Width = 148
            end
            object cxGridTableView1Column4: TcxGridColumn
              Caption = 'Kategoriya'
              Visible = False
            end
            object cxGridTableView1Column7: TcxGridColumn
              Caption = 'SHORT_NAME_CATEGORY'
              Visible = False
            end
            object flag3: TcxGridColumn
              Visible = False
            end
            object cxGridTableView1Column5: TcxGridColumn
              Caption = #1057#1091#1084#1072' '#1079#1072' '#1087#1077#1088#1110#1086#1076
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = '0.00'
              HeaderAlignmentHorz = taCenter
              Options.Sorting = False
            end
          end
          object cxGridLevel2: TcxGridLevel
            GridView = cxGridTableView1
          end
        end
      end
    end
    object cxTabSheet4: TcxTabSheet
      Caption = #1057#1091#1073#1089#1080#1076#1080#1080
      ImageIndex = 2
      object cxGroupBox5: TcxGroupBox
        Left = 8
        Top = 6
        Width = 455
        Height = 157
        Alignment = alTopLeft
        TabOrder = 0
        object Sub_Type_Label: TLabel
          Left = 16
          Top = 134
          Width = 113
          Height = 13
          Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object cxGrid3: TcxGrid
          Left = 16
          Top = 16
          Width = 425
          Height = 117
          TabOrder = 0
          LookAndFeel.Kind = lfUltraFlat
          object cxGridTableView2: TcxGridTableView
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OnFocusedRecordChanged = cxGridTableView2FocusedRecordChanged
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnMoving = False
            OptionsCustomize.ColumnSorting = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            Styles.Background = cxStyle2
            Styles.Content = cxStyle2
            Styles.Inactive = cxStyle4
            Styles.Selection = cxStyle3
            Styles.Header = cxStyle1
            object cxGridTableView2Column1: TcxGridColumn
              Caption = #1053#1072#1095#1072#1083#1086
              HeaderAlignmentHorz = taCenter
              Options.Sorting = False
              Width = 78
            end
            object cxGridTableView2Column2: TcxGridColumn
              Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077
              HeaderAlignmentHorz = taCenter
              Options.Sorting = False
              Width = 82
            end
            object cxGridTableView2Column3: TcxGridColumn
              Caption = #1057#1091#1084#1084#1072
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = '0.00;'
              HeaderAlignmentHorz = taCenter
              Options.Sorting = False
              Width = 64
            end
            object cxGridTableView2Column4: TcxGridColumn
              Caption = #1050#1086#1083'-'#1074#1086' '#1084#1077#1089'.'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taRightJustify
              FooterAlignmentHorz = taRightJustify
              HeaderAlignmentHorz = taCenter
              Options.Sorting = False
              Width = 86
            end
            object cxGridTableView2Column5: TcxGridColumn
              Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
              HeaderAlignmentHorz = taCenter
              Options.Sorting = False
              Width = 113
            end
            object cxGridTableView2Column6: TcxGridColumn
              Caption = 'ID_SUBSIDY'
              Visible = False
              Width = 34
            end
            object cxGridTableView2Column7: TcxGridColumn
              Caption = 'id_state'
              Visible = False
              Width = 35
            end
            object cxGridTableView2Column8: TcxGridColumn
              Caption = 'Comment'
              Visible = False
              Width = 32
            end
            object cxGridTableView2Column9: TcxGridColumn
              Caption = 'full name'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              Width = 36
            end
            object cxGridTableView2Column10: TcxGridColumn
              Caption = 'short_name'
              Visible = False
              Width = 38
            end
            object flag2: TcxGridColumn
              Visible = False
            end
          end
          object cxGridLevel3: TcxGridLevel
            GridView = cxGridTableView2
          end
        end
      end
    end
    object cxTabSheet5: TcxTabSheet
      Caption = #1051#1100#1075#1086#1090#1099
      ImageIndex = 4
      object cxGroupBox6: TcxGroupBox
        Left = 8
        Top = 6
        Width = 455
        Height = 157
        Alignment = alTopLeft
        TabOrder = 0
        object Lgot_Full_Label: TLabel
          Left = 16
          Top = 134
          Width = 113
          Height = 13
          Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object cxGrid4: TcxGrid
          Left = 16
          Top = 16
          Width = 425
          Height = 117
          TabOrder = 0
          LookAndFeel.Kind = lfUltraFlat
          object cxGridTableView3: TcxGridTableView
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OnFocusedRecordChanged = cxGridTableView3FocusedRecordChanged
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnMoving = False
            OptionsCustomize.ColumnSorting = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            Styles.Background = cxStyle2
            Styles.Content = cxStyle2
            Styles.Inactive = cxStyle4
            Styles.Selection = cxStyle3
            Styles.Header = cxStyle1
            object cxGridTableView3Column1: TcxGridColumn
              Caption = #1050#1086#1076' '#1083#1100#1075#1086#1090#1099
              HeaderAlignmentHorz = taCenter
              Options.Sorting = False
              Width = 127
            end
            object cxGridColumn8: TcxGridColumn
              Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
              HeaderAlignmentHorz = taCenter
              Options.Sorting = False
              Width = 126
            end
            object cxGridColumn9: TcxGridColumn
              Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
              HeaderAlignmentHorz = taCenter
              Options.Sorting = False
              Width = 123
            end
            object cxGridColumn13: TcxGridColumn
              Caption = 'ID_LG'
              Visible = False
              Width = 34
            end
            object cxGridColumn16: TcxGridColumn
              Caption = 'full name'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              Width = 36
            end
            object flag: TcxGridColumn
              Visible = False
            end
          end
          object cxGridLevel4: TcxGridLevel
            GridView = cxGridTableView3
          end
        end
      end
    end
    object cxTabSheet6: TcxTabSheet
      Caption = #1042#1093'. '#1086#1089#1090#1072#1090#1086#1082
      ImageIndex = 5
      object cxGroupBox11: TcxGroupBox
        Left = 8
        Top = 6
        Width = 455
        Height = 157
        Alignment = alTopLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Image1: TImage
          Left = 308
          Top = 124
          Width = 29
          Height = 27
          Picture.Data = {
            07544269746D6170F6060000424DF60600000000000036000000280000001800
            0000180000000100180000000000C0060000C40E0000C40E0000000000000000
            0001FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FF0A77130A7713097311076D0F07680D06
            630B045E09045C0A045C0A045C0A045C0A045C0A045C0A045C0A045C0A045C0A
            045C0A045B0A045207045207FF00FFFF00FFFF00FF0E8E1D0D851A1091230E8E
            1F0C8A1B0A8618098213077E10067D0F067D0F067D0F067D0F067D0F067D0F06
            7D0F067D0F067D0F067E0F067E0F05690C044D07045207FF00FFFF00FF0E8E1D
            1CB43F1DBE4319BB3A16B93313B82E11B6270DB5210AB51B09B41909B41909B4
            1909B41909B41909B41909B41909B41909B41909B71A08AC1806690B045207FF
            00FFFF00FF149F2A23BF5022C04C1DBD431ABC3D17BB3715BA3111B82A0EB624
            0BB51E09B41909B41909B41909B41A09B41A09B41A09B41A09B41A09B71A09B7
            1A067E0F045B0AFF00FFFF00FF16A52E28BF5725C05322BD4B1EBC441BBA3E19
            B93815B73212B62B0FB5240CB31F09B21A09B21909B21909B21909B21909B219
            09B21909B41A09B419067E0F045C0AFF00FFFF00FF18AB332EC1622CC15F28BE
            5524BD4F22BC491CBB4119B93A17B83414B72F11B5290EB4220BB31D09B21909
            B21909B21909B21909B21909B41A09B419067D0F045C0AFF00FFFF00FF19AD35
            37C46D36C56D30C2612BBF5863D082FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF09B21809B21909B21909B41A09B419067D0F045C0AFF
            00FFFF00FF19AD3441C87542C9783BC66F33C3652DC25D88DCA2FFFFFFE2F6E7
            1CBB4119B93A17B83413B62EE0F5E3FFFFFF0AB21B09B21909B21909B41A09B4
            19067D0F045C0AFF00FFFF00FF19AD344FCC8050CD8246C9793BC77135C4682D
            C05D89DCA3FFFFFFC6EED11DBB421AB93B17B83757CB6B55CB670FB5240AB21E
            09B21A09B41909B419067D0F045C0AFF00FFFF00FF19AD3462D28D63D28F4FCC
            803CC7733CC77333C5692DC161ABE6BEFFFFFFA9E5B91FBB451CBA3F19B93815
            B73213B62D10B4270DB3200AB51B09B419067D0F045C0AFF00FFFF00FF19AD34
            73D79A74D79C5BCF8841C87541C87538C56F30C3692DC161C9EFD5FFFFFF87DB
            9E20BC481DBB421AB93B17B83714B72F11B6290EB6240BB51C067E0F045D09FF
            00FFFF00FF19AD347ED9A280DBA462D28D46C97945C9783BC77134C36B30C369
            ADE7C2FFFFFFFFFFFF62D08221BC4B1EBC441BBA3E18B93715B73212B82C0EB6
            2409831406630CFF00FFFF00FF19AD3485DBA687DDAA68D39149CA7B47C97A3C
            C77334C36B8FDEAEFFFFFFFFFFFFADE7C128BF5825BE5323BC4C1FBB471CBA3F
            19B93A16BA3413B82E0B8819076B0EFF00FFFF00FF19AD3489DDAA8CDEAD6DD4
            954DCB7E4DCB7E41C87536C56DFFFFFFFFFFFFCBF0D930C3692CC26229C05B26
            BF5523BF4F20BC491DBB421ABC3D17BB370E8D1E097311FF00FFFF00FF19AD34
            8CDDAB91DFB173D79A52CD8256CE854BCB7CE6F8EDFFFFFFFFFFFF34C56D34C3
            6B32C36BCAF0D8FFFFFF28BF5825BE5122BD4B1FBE461CBB411093220A7A14FF
            00FFFF00FF19AD348FDEAE98E1B57DD9A158CE8663D28EBFECD1FFFFFFFFFFFF
            76D79C3CC7733AC57036C56DFFFFFFE4F7EC2EC16229C05B26BF5523BF4F20BC
            491398280C8217FF00FFFF00FF19AD3492DFB09EE3BA8BDDAA5BCF88AAE6C1FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5F7EC32C36B2EC164
            2AC15D27C05825BE51169E2E0D8919FF00FFFF00FF19AD3491DFAEA3E4BD9EE3
            B873D79A6DD49566D2905DD08A58CE8651CC804BCB7C51CC8046C9793CC77336
            C56D34C36B32C36B2EC3662CC26129C05B17A2320E911CFF00FFFF00FF19AD35
            89DDAAA0E4BBA9E6C0A3E4BD9DE3B898E1B58EDEAD85DBA679D89E6DD49561D1
            8C51CC8043C9773AC57034C36B32C36B30C36930C4692DC2641AA9380F991FFF
            00FFFF00FF1AAE347CD9A293E0B3A0E4BBA6E5BFA6E5BFA3E4BD9DE3B893E0B3
            89DDAA7BD9A06AD49459CF8848CA7D3CC87435C67033C56E31C46C33C56E31C5
            6D1DAD3D11A021FF00FFFF00FF1AAE342ABD5A7BD9A088DCA891DFAE92DFB092
            DFB08DDDAC87DCA87DD9A171D59863D28E54CD8245C9783BC77134C56D32C36B
            30C36931C46C2CBF5F14AA2B11A021FF00FFFF00FFFF00FF19AD3419AD3419AD
            3519AD3419AD3419AD3419AD3419AD3419AD3419AD3419AD3419AD3419AD3419
            AD3419AD341BAD3619AD3519AD3513A82713A827FF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FF}
          Transparent = True
        end
        object cxGrid5: TcxGrid
          Left = 18
          Top = 18
          Width = 421
          Height = 103
          TabOrder = 0
          LookAndFeel.Kind = lfUltraFlat
          object cxGrid1DBTableView1: TcxGridDBTableView
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
          end
          object cxGrid1TableView1: TcxGridTableView
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnMoving = False
            OptionsCustomize.ColumnSorting = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            OptionsView.HeaderAutoHeight = True
            Styles.Background = cxStyle2
            Styles.Content = cxStyle2
            Styles.Inactive = cxStyle4
            Styles.Selection = cxStyle3
            Styles.Header = cxStyle1
            object IstFinance: TcxGridColumn
              Caption = #1048#1089#1090#1086#1095#1085#1080#1082#1080' '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 233
            end
            object Summa: TcxGridColumn
              Caption = #1057#1091#1084#1084#1072
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = '0.00;'
              FooterAlignmentHorz = taRightJustify
              HeaderAlignmentHorz = taCenter
              Width = 94
            end
            object id_smeta: TcxGridColumn
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
            end
            object id_razdel: TcxGridColumn
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
            end
            object id_stat: TcxGridColumn
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
            end
            object id_kekv: TcxGridColumn
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
            end
          end
          object cxGrid1Level1: TcxGridLevel
            GridView = cxGrid1TableView1
          end
        end
        object Sum_Result: TcxCurrencyEdit
          Left = 342
          Top = 126
          Width = 97
          Height = 21
          TabStop = False
          BeepOnEnter = False
          EditValue = 0c
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = '0.00;'
          Properties.ReadOnly = True
          Style.BorderStyle = ebsUltraFlat
          Style.Color = clBtnFace
          Style.Edges = [bLeft, bRight]
          Style.TransparentBorder = False
          TabOrder = 1
        end
      end
    end
  end
  object CancelButton: TcxButton
    Left = 402
    Top = 280
    Width = 85
    Height = 25
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 516
    Top = 65530
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = clInfoBk
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor]
      Color = 12937777
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
  end
end
