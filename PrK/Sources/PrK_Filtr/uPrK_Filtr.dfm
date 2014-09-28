object FormPrK_Filtr: TFormPrK_Filtr
  Left = 343
  Top = 124
  Width = 544
  Height = 462
  Caption = 'FormPrK_Filtr'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBoxKategory: TcxGroupBox
    Left = 0
    Top = 0
    Width = 281
    Height = 282
    Align = alLeft
    Alignment = alTopLeft
    Caption = 'cxGroupBoxKategory'
    TabOrder = 0
    object cxGridPrK: TcxGrid
      Left = 2
      Top = 15
      Width = 277
      Height = 265
      Align = alClient
      TabOrder = 0
      object cxGridPrKDBTableView1: TcxGridDBTableView
        DataController.DataSource = DataSourcePrK
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.Background = cxStyleBackGround_Content
        Styles.Content = cxStyleBackGround_Content
        Styles.Inactive = cxStyleInactive
        Styles.Selection = cxStyleSelection
        Styles.Header = cxStyleHeader
        object colNpp: TcxGridDBColumn
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 43
          DataBinding.FieldName = 'Npp'
        end
        object colShort_name: TcxGridDBColumn
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 232
          DataBinding.FieldName = 'SHORT_NAME'
        end
      end
      object cxGridPrKLevel1: TcxGridLevel
        GridView = cxGridPrKDBTableView1
      end
    end
  end
  object cxGroupBoxSelectedKategory: TcxGroupBox
    Left = 289
    Top = 0
    Width = 247
    Height = 282
    Align = alClient
    Alignment = alTopLeft
    Caption = 'cxGroupBoxSelectedKategory'
    TabOrder = 2
    object cxGridPrKSectedKat: TcxGrid
      Left = 2
      Top = 15
      Width = 243
      Height = 265
      Align = alClient
      TabOrder = 0
      object cxGridPrKSectedKatDBTableView1: TcxGridDBTableView
        DataController.DataSource = DataSourceSelectedKat
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsData.DeletingConfirmation = False
        OptionsSelection.CellSelect = False
        OptionsSelection.MultiSelect = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.Background = cxStyleBackGround_Content
        Styles.Content = cxStyleBackGround_Content
        Styles.Inactive = cxStyleInactive
        Styles.Selection = cxStyleSelection
        Styles.Header = cxStyleHeader
        object colNPPSelectedKat: TcxGridDBColumn
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 39
          DataBinding.FieldName = 'NPP'
        end
        object colSHOW_TEXT: TcxGridDBColumn
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 202
          DataBinding.FieldName = 'SHOW_TEXT'
        end
        object colSQL_TEXT: TcxGridDBColumn
          Visible = False
          HeaderAlignmentVert = vaCenter
          Width = 37
          DataBinding.FieldName = 'SQL_TEXT'
        end
      end
      object cxGridPrKSectedKatLevel1: TcxGridLevel
        GridView = cxGridPrKSectedKatDBTableView1
      end
    end
  end
  object cxSplitterKateg: TcxSplitter
    Left = 281
    Top = 0
    Width = 8
    Height = 282
    Control = cxGroupBoxKategory
  end
  object cxGroupBoxComponent: TcxGroupBox
    Left = 0
    Top = 282
    Width = 536
    Height = 105
    Align = alBottom
    Alignment = alTopLeft
    TabOrder = 3
    object cxGroupBoxComboBox: TcxGroupBox
      Tag = 2
      Left = 65
      Top = 15
      Width = 64
      Height = 88
      Align = alLeft
      Alignment = alTopLeft
      Caption = 'cxGroupBoxComboBox'
      TabOrder = 1
      Visible = False
      object cxLookupComboBoxFiltr: TcxLookupComboBox
        Left = 4
        Top = 36
        Width = 240
        Height = 21
        AutoSize = False
        ParentFont = False
        Properties.GridMode = True
        Properties.ListColumns = <
          item
            FieldName = 'SHORT_NAME'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = DataSourceComboBox
        Style.StyleController = cxEditStyleControllerPrK
        TabOrder = 0
      end
    end
    object cxGroupBoxTextBox: TcxGroupBox
      Tag = 1
      Left = 2
      Top = 15
      Width = 63
      Height = 88
      Align = alLeft
      Alignment = alTopLeft
      Caption = 'cxGroupBoxTextBox'
      TabOrder = 0
      Visible = False
      object cxTextEditFiltr: TcxTextEdit
        Left = 4
        Top = 36
        Width = 240
        Height = 21
        ParentFont = False
        Properties.MaxLength = 100
        Style.StyleController = cxEditStyleControllerPrK
        TabOrder = 0
      end
    end
    object cxGroupBoxDate: TcxGroupBox
      Tag = 3
      Left = 129
      Top = 15
      Width = 64
      Height = 88
      Align = alLeft
      Alignment = alTopLeft
      Caption = 'cxGroupBoxDate'
      TabOrder = 2
      Visible = False
      object cxDateEditDate: TcxDateEdit
        Left = 4
        Top = 36
        Width = 141
        Height = 21
        ParentFont = False
        Style.StyleController = cxEditStyleControllerPrK
        TabOrder = 0
      end
    end
    object cxGroupBoxIntTextBox: TcxGroupBox
      Tag = 4
      Left = 193
      Top = 15
      Width = 64
      Height = 88
      Align = alLeft
      Alignment = alTopLeft
      Caption = 'cxGroupBoxTextBox'
      TabOrder = 3
      Visible = False
      object cxTextEditIntFiltr: TcxTextEdit
        Left = 4
        Top = 36
        Width = 240
        Height = 21
        ParentFont = False
        Properties.MaxLength = 8
        Style.StyleController = cxEditStyleControllerPrK
        TabOrder = 0
        OnKeyPress = cxTextEditIntFiltrKeyPress
      end
    end
    object cxGroupBoxNum5_2MaskEdit: TcxGroupBox
      Tag = 5
      Left = 257
      Top = 15
      Width = 64
      Height = 88
      Align = alLeft
      Alignment = alTopLeft
      Caption = 'cxGroupBoxNum5_2MaskEdit'
      TabOrder = 4
      Visible = False
      object cxMaskEditNum5_2: TcxMaskEdit
        Left = 5
        Top = 36
        Width = 240
        Height = 21
        ParentFont = False
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = 
          '([0-9] | [0-9][,.] | [0-9][,.][0-9] | 1[0-1] | 1[0-1][,.] | 1[0-' +
          '1][,.][0-9] | 12)'
        Properties.MaxLength = 0
        Style.StyleController = cxEditStyleControllerPrK
        TabOrder = 0
      end
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 387
    Width = 536
    Height = 48
    Align = alBottom
    Alignment = alTopLeft
    LookAndFeel.Kind = lfUltraFlat
    TabOrder = 1
    DesignSize = (
      536
      48)
    object cxButtonCansel: TcxButton
      Left = 431
      Top = 13
      Width = 97
      Height = 30
      Cursor = crHandPoint
      Action = ActionExit
      Anchors = [akTop, akRight]
      DragCursor = crHandPoint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Glyph.Data = {
        3E040000424D3E04000000000000FE0100002800000018000000180000000100
        08000000000040020000120B0000120B0000720000007200000000000000FFFF
        FF00FF00FF0069333400CD676800CC666700CF696A00CE686900D06A6B00D26C
        6D00D16B6C00C6666700D46E6F00D36D6E00D6707100D56F7000D7717200D973
        7400D8727300D26F7000DB757600DA747500DD777800DC767700DF797A00DE78
        7900E17B7C00E07A7B00E37D7E00E27C7D00C0696A00E57F8000E47E7F00E781
        8200E6808100E9838400E8828300EB858600EA848500ED878800EC868700B366
        6700EF898A00EE888900B4676800F18B8C00F08A8B00B6696A00F48E8F00F38D
        8E00F28C8D00B0666700F6909100F58F9000E7878800B96C6D00F8929300F791
        9200BB6E6F00FB959600FA949500F9939400FD979800FC969700BE717200AF68
        6900FF999A00FE989900C0737400F9969700C3767700F2939400DF898A00C87B
        7C00C67C7D00C0797A00FEA2A300A76C6D00FDA8A900F3A6A700FCAFB000ECA6
        A700F0AAAB00FBB6B700FABCBD00F5BBBC00F2B9BA00F9C5C600B86B6B00AE66
        6600BD707000C2757500C5787800C77A7A00A7666600CA7D7D00CD808000CC7F
        7F00A3666600A0666600B3737300AD7070009A666600F0B0B000F9C2C200F2D9
        C000FFFFDD00E2F8CC00C7F0BC0073B8760059B2670079DD900060D6810033CB
        6700020202020202020202020266030202020202020202020202020202020202
        02026666625E0302020202020202020202020202020202666663330B05290302
        020202020202020202020202026666411E060704042903596666666666666666
        020202020266130F0C0D090A082C034C4E505354685757660202020202661112
        100E0F0C0D2F036E71717171717157660202020202661714151112100E58036E
        71717171717157660202020202661818191617141537036E7171717171715766
        0202020202661C1D1A1B1819163A036E7171717171715766020202020266221F
        201C1D1A1B5A036E71717171717157660202020202662324212236512040036D
        7171717171715766020202020266272825265601674403696C6F6F7070705766
        0202020202662E2A2B275501525B03696A6A6A6A6B6B57660202020202663132
        2D2E2A4F274603696A6A6A6A6A6A57660202020202663434353031322D5C0369
        6A6A6A6A6A6A57660202020202663C3D38393435305D03696A6A6A6A6A6A5766
        0202020202663E3F3B3C3D38394903696A6A6A6A6A6A57660202020202664242
        433E3E3F3B5F03696A6A6A6A6A6A576602020202026642424242424343610369
        6A6A6A6A6A6A5766020202020266454242424242426003696A6A6A6A6A6A5766
        020202020266664B48424242426003696A6A6A6A6A6A57660202020202020266
        664D4A474260035E666666666666666602020202020202020202666665640302
        0202020202020202020202020202020202020202026603020202020202020202
        0202}
      UseSystemPaint = False
    end
    object cxButtonFiltr: TcxButton
      Left = 294
      Top = 13
      Width = 133
      Height = 30
      Cursor = crHandPoint
      Action = ActionFiltr
      Anchors = [akTop, akRight]
      DragCursor = crHandPoint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Glyph.Data = {
        82040000424D8204000000000000420200002800000018000000180000000100
        08000000000040020000120B0000120B0000830000008300000000000000FFFF
        FF00FF00FF00FC00FC0076037600FF78FF00FA95FA00FF7E0000E2AB6F00C47B
        0000DAAB1F00E0B73B00E0B83B00E3C15200E3C15300E6C65B00E5C65B00E7C9
        6600EDD78A00EFDC9800F6E9BD00F8F2D4001491100000830100008200000081
        0000007700000076000000730000006F00000066000000620000005E00000058
        0000004F0000004E0000004B0000005A0100018603000169020002880500038B
        0700015D04000381080002600500025E050003760800048E0A0003600600055E
        080005900D0006920F0004640A000796130005670D000786120009981600076A
        0F000C7315000A9A19000A9A1A000C9D1D000A8C1B000DA021000EA324001080
        1E00148823001CA92F0019932B000FA4280010A528001C9A310011A72C0011A7
        2D0013AB30001E9E340020A539002FD8500015AD3500189D33001DA5390023AC
        40002FD851002FD7510028B5450028B4450032A54B0016B0390018B23D0028CC
        4F0027B5480033CC580019B641001AB641001CB8450034CC59001BB845001DBB
        49001FBF4D002EBB550021C2500023C5530026C9560028CC59002ACF5B002DD3
        5E002FD7620031D9640034DD670036E16A003BE76F003EEB730041EF760045F6
        7B0047F87E0049FB80004BFE820045F67F0045F6800081FFFE007FFAF80054E6
        F70000D7F40000CCE90000C9E30000C4E00000B1CA0000A6BD000A4A52000D5A
        64000D5862000202020202020202020202020202020202020202020202020202
        020202020202020224242424020202020202020202020202020202020202022D
        59765219240202020202020202020202020202020202022D59764D1924020202
        0202020202020202020202020202022D59765319240202020202020202020202
        020202020202022D59755319240202020202020202020202020202020202022D
        59764D19240202020202020202020202020202020202022D5663431622020202
        02020202020202020202020202022D4F655D493C2B2302020202020202020202
        02020202022D506964584638291A23020202020202020202020202022D516D68
        6257403528191B2302020202020202020202022D55706C67614E3F332619191B
        230202020202020202022D54736F6B665E4A3D32171919191B23020202020202
        022D5474726E6A655C483B2F18191919191B2302020202022D4B5F4B47413936
        34302A252121201E1E1C1D230202022D2424211F272E373E777B7E7F805A4C4B
        423A242424022D211B19090909093C454E787C7D7C8271747474745F3124022D
        2C090F0D0B0A09454E60777A7A7A815B4B4405242402020202081312110C0924
        242424777A812424240505040202020202081514120E09020202020279020202
        0605030404020202020801151310070202020202020202060603030304040202
        0202080808080202020202020202020206060304040202020202020202020202
        0202020202020202020605040202020202020202020202020202020202020202
        020205020202}
      UseSystemPaint = False
    end
    object cxButtonSelectKat: TcxButton
      Left = 15
      Top = 11
      Width = 152
      Height = 30
      Cursor = crHandPoint
      Action = ActionSelectKateg
      DragCursor = crHandPoint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0136020136020136020136020136
        02013602013602013602FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF034A0401360203860903990B
        039F0C03A10C03A10C039F0C03980B038109013602013602FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF034A04034A04038F0A03
        A40C03A40C039F0C039F0C039F0C039F0C039F0C039F0C03A40C03A40C03880A
        013602013602FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF06690C0469
        0C06A51304A30F039E0C039E0C039E0C039E0C039E0C039E0C039E0C039E0C03
        9E0C039E0C03A40C039D0C025B05013602FF00FFFF00FFFF00FFFF00FFFF00FF
        06690C0569100AAB1F08A51906A014049F0F049F0F049F0F039E0C039E0C039E
        0C039E0C039E0C039E0C039E0C039E0C039F0C039F0C025705013602FF00FFFF
        00FFFF00FFFF00FF06690C0EAB2A0CA7250AA41F049F0F049F0F049F0F049F0F
        0DA61E2BB53BEBF8EEFFFFFF8ED996039E0C039E0C039E0C039E0C03A10C0399
        0B013602FF00FFFF00FFFF00FF06690C0F952B11B0340EA92B0EA92B0DA7260E
        A92809A41C13AA2810A72375D182FFFFFFFFFFFFFFFFFF8BD992039E0C039E0C
        039E0C039E0C03A50C037A08013602FF00FFFF00FF06690C16B44113AC3711AA
        3216AC3916AF3D16AF3E18AD3716AB2F13AA292CB540C7EECEFCFEFCFFFFFFFF
        FFFF8BD992039E0C039E0C039E0C039F0C039E0C013602FF00FF039E0C118F31
        1AB64A16AF3E16AF3E16AF3E13AC351CB0401DB03B1AAF3517AC2F13AB2A29B5
        3DABE5B4E5F7E7FFFFFFFFFFFF8BD992039E0C039E0C039E0C03A50C026B0701
        3602039E0C19A9471CB44E19B14719B14719B14728B64E25B44721B2411EB03C
        1BAF3517AC3014AB2B2BB5406DCF7DFFFFFFFFFFFFFFFFFF4EC45A039E0C039E
        0C03A10C03880A013602039E0C20B25122B6551CB24E1CB24EA7E5BBC2EDD0C1
        EDCEC0EBCCBFEBCABDEAC9BCEAC6BBEAC5B8E9C1D8F3DCFFFFFFFFFFFFFFFFFF
        FFFFFF4EC25A039E0C039E0C03990B013602039E0C2EBA5E31BC631FB4521FB4
        52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF039E0C039E0C039F0C013602039E0C3EC06C
        47C57524B65624B656F0FBF4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF0FBF3D9F3DEFFFFFFFFFFFFFFFFFFFFFFFFC6EDCB039E0C039E0C039E0C01
        3602039E0C47C27267D08E34BC6434BC644CC67860CE875ECB835CCB8059CA7D
        56C97753C77346C26442C15F89DA9CFFFFFFFFFFFFFFFFFFB7E9BF16AA28039E
        0C039F0C03930B013602039E0C40BB6683D9A452C97D38BF6838BF6837BF6736
        BF6434BC5F30BB5B2DBA562AB7502DB852AAE5BAFFFFFFFFFFFFFFFFFF99E0A6
        13AA280FA723039E0D03A30C037F09013602039E0C2BAA4888DCA986DAA535BD
        6538BF6838BF6838BF6836BD6434BC6031BB5C44C26BD8F3E0FFFFFFFFFFFFFF
        FFFF95DDA50CA7250AA52008A31905A01104A50E026006013602FF00FF039E0C
        6BD091ADE6C46ED3932BBA5C38BF6838BF6838BF6836BD6534BC608CDCA7FFFF
        FFFFFFFFFFFFFF98E0AB11AA320FA92C0CA7250AA41D07A518059911013602FF
        00FFFF00FF039E0C37B5579DE2B8B5E9C967CF8C38BF6838BF6838BF6838BF68
        36BD655FCC84FFFFFFFFFFFF70D18E16AD3F13AD3911AB310EA7280CA6230AAC
        1F046B0C013602FF00FFFF00FFFF00FF039E0C5AC980B7EACABBEBCE73D49638
        BF6838BF6838BF6838BF6837BD6635BC6232BC5D2FBA5918B04415AD3D12AB35
        10A92E0FAF2C098E1C034A04FF00FFFF00FFFF00FFFF00FF039E0C189F2A67CF
        8CBAEACCCAEFD897E0B25DCC863ABF6929B85A22B5541FB4521FB45221B55324
        B65222B54C19B04114B23A0E9D2906680D034A04FF00FFFF00FFFF00FFFF00FF
        FF00FF039E0C189F2959C97EA3E3BCCAEFD8C1EDD1A0E2B87FD8A068D08E5CCB
        8458CA8158CA814FC77A38C06722BA5010982F06680D06690CFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF039E0C039E0C35B5536CD1919AE1B6B1E9C6
        B5E9C9ABE6C19DE2B788DAA76CD3934AC9792AB4570F842706680D06680DFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF039E0C03
        9E0C28AC4141BB6351C57755C77D4EC5773EBB6528A749138B2906680D06690C
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF039E0C039E0C039E0C039E0C039E0C039E0C039E0C03
        9E0CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      UseSystemPaint = False
    end
  end
  object DataBasePrK: TpFIBDatabase
    DefaultTransaction = TransactionReadPrK
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 19
    Top = 216
  end
  object TransactionReadPrK: TpFIBTransaction
    DefaultDatabase = DataBasePrK
    TimeoutAction = TARollback
    Left = 48
    Top = 216
  end
  object TransactionWritePrK: TpFIBTransaction
    DefaultDatabase = DataBasePrK
    TimeoutAction = TARollback
    Left = 77
    Top = 216
  end
  object DataSourcePrK: TDataSource
    DataSet = DataSetPrK
    Left = 17
    Top = 242
  end
  object DataSetPrK: TpFIBDataSet
    Database = DataBasePrK
    Transaction = TransactionReadPrK
    AfterScroll = DataSetPrKAfterScroll
    Left = 46
    Top = 243
    poSQLINT64ToBCD = True
  end
  object StoredProcPrK: TpFIBStoredProc
    Database = DataBasePrK
    Transaction = TransactionWritePrK
    Left = 77
    Top = 243
  end
  object cxEditStyleControllerPrK: TcxEditStyleController
    Style.Color = clInfoBk
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Left = 162
    Top = 225
  end
  object StyleRepositoryPrK: TcxStyleRepository
    Left = 75
    Top = 169
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
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
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyleHeader: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyleInactive: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyleBackGround_Content: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyleSelection: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
  end
  object DataSetComboBox: TpFIBDataSet
    Left = 140
    Top = 258
    poSQLINT64ToBCD = True
  end
  object DataSourceComboBox: TDataSource
    DataSet = DataSetComboBox
    Left = 172
    Top = 257
  end
  object ActionListPrKFiltr: TActionList
    Left = 199
    Top = 397
    object ActionFiltr: TAction
      Caption = 'ActionFiltr'
      ImageIndex = 0
      ShortCut = 119
      OnExecute = ActionFiltrExecute
    end
    object ActionExit: TAction
      Caption = 'ActionExit'
      ImageIndex = 1
      OnExecute = ActionExitExecute
    end
    object ActionSelectKateg: TAction
      Caption = 'ActionSelectKat'
      ShortCut = 13
      OnExecute = ActionSelectKategExecute
    end
  end
  object RxMemoryDataSelectedKat: TRxMemoryData
    FieldDefs = <
      item
        Name = 'NPP'
        DataType = ftInteger
      end
      item
        Name = 'SHOW_TEXT'
        DataType = ftString
        Size = 130
      end
      item
        Name = 'SQL_TEXT'
        DataType = ftString
        Size = 130
      end>
    Left = 345
    Top = 120
  end
  object DataSourceSelectedKat: TDataSource
    DataSet = RxMemoryDataSelectedKat
    Left = 377
    Top = 120
  end
  object RxMemoryDataSqlTextForFiltr: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Npp'
        DataType = ftInteger
      end
      item
        Name = 'SQL_TEXT'
        DataType = ftVariant
      end>
    Left = 344
    Top = 378
  end
  object DataSetNaborID_DT_ABIT: TpFIBDataSet
    Database = DataBasePrK
    Transaction = TransactionReadPrK
    AfterScroll = DataSetPrKAfterScroll
    Left = 374
    Top = 379
    poSQLINT64ToBCD = True
  end
end
