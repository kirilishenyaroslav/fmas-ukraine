object FormPRK_DT_ABIT: TFormPRK_DT_ABIT
  Left = 292
  Top = 159
  Width = 657
  Height = 473
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'FormPRK_DT_ABIT'
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
  object PageControlAbit: TPageControl
    Left = 0
    Top = 48
    Width = 649
    Height = 343
    ActivePage = TabSheetVstup
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    MultiLine = True
    ParentFont = False
    TabOrder = 1
    OnChange = PageControlAbitChange
    OnChanging = PageControlAbitChanging
    object TabSheetVstup: TTabSheet
      Caption = 'TabSheetVstup'
      inline TFrameVstup1: TFrameVstup
        Left = 0
        Top = 0
        Width = 641
        Height = 297
        Align = alClient
        TabOrder = 0
        inherited cxLabelDergZakaz: TcxLabel
          TabOrder = 15
        end
        inherited cxLabelSrokOb: TcxLabel
          TabOrder = 16
        end
        inherited cxLookupComboBoxDergZakaz: TcxLookupComboBox
          ParentFont = False
          Style.StyleController = cxEditStyleControllerAbit
          TabOrder = 11
        end
        inherited cxLookupComboBoxKurs: TcxLookupComboBox
          ParentFont = False
          Style.StyleController = cxEditStyleControllerAbit
          TabOrder = 4
        end
        inherited cxLookupComboBoxSrokOb: TcxLookupComboBox
          ParentFont = False
          Style.StyleController = cxEditStyleControllerAbit
          TabOrder = 13
        end
        inherited cxLookupComboBoxTypeDepart: TcxLookupComboBox
          ParentFont = False
          Style.StyleController = cxEditStyleControllerAbit
        end
        inherited cxLookupComboBoxKatStud: TcxLookupComboBox
          ParentFont = False
          Style.StyleController = cxEditStyleControllerAbit
          TabOrder = 5
        end
        inherited cxLookupComboBoxFacul: TcxLookupComboBox
          ParentFont = False
          Style.StyleController = cxEditStyleControllerAbit
          TabOrder = 3
        end
        inherited cxLookupComboBoxSpec: TcxLookupComboBox
          ParentFont = False
          Style.StyleController = cxEditStyleControllerAbit
          TabOrder = 1
        end
        inherited cxLookupComboBoxFormStudy: TcxLookupComboBox
          ParentFont = False
          Style.StyleController = cxEditStyleControllerAbit
          TabOrder = 2
        end
        inherited cxLabelNpk: TcxLabel
          TabOrder = 17
        end
        inherited cxLabelVid_Dii: TcxLabel
          TabOrder = 6
        end
        inherited cxLookupComboBoxVid_Dii: TcxLookupComboBox
          ParentFont = False
          Style.StyleController = cxEditStyleControllerAbit
          TabOrder = 10
        end
        inherited cxLookupComboBoxNpk: TcxLookupComboBox
          ParentFont = False
          Style.StyleController = cxEditStyleControllerAbit
          TabOrder = 7
        end
        inherited cxButtonEditPotok: TcxButtonEdit
          Style.StyleController = cxEditStyleControllerAbit
          TabOrder = 8
        end
        inherited cxTextEditNomerDela: TcxTextEdit
          TabOrder = 9
        end
      end
    end
    object TabSheetDocEducation: TTabSheet
      Caption = 'TabSheetDocEducation'
      ImageIndex = 1
      object dxBarDockControlDocEducation: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 641
        Height = 36
        Align = dalTop
        BarManager = dxBarManageDT_ABIT
      end
      inline TFrameDocEducation1: TFrameDocEducation
        Left = 0
        Top = 36
        Width = 641
        Height = 125
        Align = alTop
        TabOrder = 1
        inherited cxGridPrKDocEducation: TcxGrid
          Height = 76
          inherited cxGridPrKDocEducationDBTableView1: TcxGridDBTableView
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            Styles.Background = cxStyleBackGround_Content
            Styles.Content = cxStyleBackGround_Content
            Styles.Inactive = cxStyleInactive
            Styles.Selection = cxStyleSelection
            Styles.Header = cxStyleHeader
          end
        end
        inherited cxGroupBoxDocEducation: TcxGroupBox
          Top = 76
          inherited cxDBTextEditUCHZ: TcxDBTextEdit
            ParentFont = False
            Style.StyleController = cxEditStyleControllerAbit
          end
          inherited cxDBTextEditAdressUchz: TcxDBTextEdit
            ParentFont = False
            Style.StyleController = cxEditStyleControllerAbit
          end
          inherited cxDBTextEditOTR_SPEC: TcxDBTextEdit
            ParentFont = False
            Style.StyleController = cxEditStyleControllerAbit
          end
        end
      end
      object cxGroupBoxDopDoc: TcxGroupBox
        Left = 0
        Top = 169
        Width = 641
        Height = 128
        Align = alClient
        Alignment = alTopLeft
        Caption = 'cxGroupBoxDopDoc'
        TabOrder = 3
        inline TFrameDopDoc1: TFrameDopDoc
          Left = 2
          Top = 51
          Width = 637
          Height = 75
          Align = alClient
          TabOrder = 1
          inherited cxGridPrKDopDoc: TcxGrid
            Width = 637
            Height = 75
            inherited cxGridPrKDopDocDBTableView1: TcxGridDBTableView
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              Styles.Background = cxStyleBackGround_Content
              Styles.Content = cxStyleBackGround_Content
              Styles.Inactive = cxStyleInactive
              Styles.Selection = cxStyleSelection
              Styles.Header = cxStyleHeader
            end
          end
        end
        object dxBarDockControlDopDoc: TdxBarDockControl
          Left = 2
          Top = 15
          Width = 637
          Height = 36
          Align = dalTop
          BarManager = dxBarManageDT_ABIT
        end
      end
      object cxSplitterNapr: TcxSplitter
        Left = 0
        Top = 161
        Width = 641
        Height = 8
        AlignSplitter = salTop
        Control = TFrameDocEducation1
      end
    end
    object TabSheetSertifikat: TTabSheet
      Caption = 'TabSheetSertifikat'
      ImageIndex = 8
      object Panel1: TPanel
        Left = 0
        Top = 36
        Width = 641
        Height = 261
        Align = alClient
        TabOrder = 0
        inline TFrameSertifikat1: TFrameSertifikat
          Left = 1
          Top = 1
          Width = 639
          Height = 259
          Align = alClient
          TabOrder = 0
          inherited cxGridSertifikat: TcxGrid
            Width = 410
            Height = 259
            inherited cxGridSertifikatDBVCertifikat: TcxGridDBTableView
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              Styles.Background = cxStyleBackGround_Content
              Styles.Content = cxStyleBackGround_Content
              Styles.Inactive = cxStyleInactive
              Styles.Selection = cxStyleSelection
              Styles.Header = cxStyleHeader
            end
          end
          inherited cxGridMarks: TcxGrid
            Left = 410
            Height = 259
            inherited cxGridViewMarks: TcxGridDBTableView
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              OptionsSelection.HideFocusRect = False
              Styles.Background = cxStyleBackGround_Content
              Styles.Content = cxStyleBackGround_Content
              Styles.Selection = cxStyleSelection
              Styles.Header = cxStyleHeader
              inherited cxGridViewMarks_PREDMET: TcxGridDBColumn
                Properties.AutoSelect = False
                MinWidth = 190
                Options.HorzSizing = False
                Options.Sorting = False
              end
              inherited cxGridViewMarks_OCENKA: TcxGridDBColumn
                Properties.ReadOnly = False
                Properties.OnValidate = TFrameSertifikat1cxGridViewMarks_OCENKAPropertiesValidate
              end
            end
          end
          inherited DSetSertifikat: TpFIBDataSet
            Database = DataBasePrK_ABIT
            Transaction = TransactionReadPrK_ABIT
            SelectSQL.Strings = (
              'select * from PRK_DT_SERTIFIKAT_SEL(5739265)')
          end
          inherited DSetMarks: TpFIBDataSet
            Database = DataBasePrK_ABIT
            Transaction = TransactionReadPrK_ABIT
          end
          inherited RxMemoryDataOcenka: TRxMemoryData
            FieldDefs = <
              item
                Name = 'ID_SP_PREDM_SERT'
                DataType = ftInteger
              end
              item
                Name = 'NAME_PREDM'
                DataType = ftString
                Size = 100
              end
              item
                Name = 'OCENKA'
                DataType = ftString
                Size = 20
              end>
          end
          inherited IdHTTP1: TIdHTTP
            Left = 328
          end
        end
      end
      object dxBarDockControlCertifikat: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 641
        Height = 36
        Align = dalTop
        BarManager = dxBarManageDT_ABIT
      end
    end
    object TabSheetOcenki: TTabSheet
      Caption = 'TabSheetOcenki'
      ImageIndex = 2
      OnShow = TabSheetOcenkiShow
      inline TFrameOcenki1: TFrameOcenki
        Left = 0
        Top = 0
        Width = 321
        Height = 297
        Align = alLeft
        TabOrder = 0
        inherited cxGroupBoxOcenki: TcxGroupBox
          Width = 321
          Height = 297
          inherited cxGridPrKOcenki: TcxGrid
            Width = 317
            Height = 175
            inherited cxGridPrKOcenkiDBTableView1: TcxGridDBTableView
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              Styles.Background = cxStyleSkyBlue
              Styles.Content = cxStyleSkyBlue
              Styles.Inactive = cxStyleInactive
              Styles.Selection = cxStyleSelection
              Styles.Header = cxStyleHeader
              inherited colNAME: TcxGridDBColumn
                SortOrder = soAscending
              end
            end
          end
          inherited cxGroupBoxSredniyBal: TcxGroupBox
            Top = 190
            Width = 317
            inherited cxPopupEditSeredniyBal: TcxPopupEdit
              TabOrder = 0
            end
            inherited cxGroupBoxCalcSrBal: TcxGroupBox
              TabOrder = 2
            end
          end
        end
      end
      object cxGroupBoxInLang: TcxGroupBox
        Left = 321
        Top = 0
        Width = 320
        Height = 297
        Align = alClient
        Alignment = alTopLeft
        Caption = 'cxGroupBoxInLang'
        TabOrder = 1
        inline TFrameInLang1: TFrameInLang
          Left = 2
          Top = 51
          Width = 316
          Height = 244
          Align = alClient
          TabOrder = 1
          inherited cxGridPrKInLang: TcxGrid
            Width = 316
            Height = 244
            inherited cxGridPrKInLangDBTableView1: TcxGridDBTableView
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              Styles.Background = cxStyleBackGround_Content
              Styles.Content = cxStyleBackGround_Content
              Styles.Inactive = cxStyleInactive
              Styles.Selection = cxStyleSelection
              Styles.Header = cxStyleHeader
              inherited colNAME_IN_LANG: TcxGridDBColumn
                SortOrder = soAscending
              end
            end
          end
        end
        object dxBarDockControlInLang: TdxBarDockControl
          Left = 2
          Top = 15
          Width = 316
          Height = 36
          Align = dalTop
          BarManager = dxBarManageDT_ABIT
        end
      end
    end
    object TabSheetPerevagi: TTabSheet
      Caption = 'TabSheetPerevagi'
      ImageIndex = 4
      OnShow = TabSheetPerevagiShow
      inline TFramePerevagi1: TFramePerevagi
        Left = 0
        Top = 0
        Width = 641
        Height = 297
        Align = alClient
        TabOrder = 0
        inherited cxGroupBoxPerevagi: TcxGroupBox
          Width = 641
          Height = 297
          inherited cxGridPrKSelectionPreim: TcxGrid
            Left = 386
            Height = 285
            inherited cxGridPrKSelectionPreimDBTableView1: TcxGridDBTableView
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              Styles.Background = cxStyleBackGround_Content
              Styles.Content = cxStyleBackGround_Content
              Styles.Inactive = cxStyleInactive
              Styles.Selection = cxStyleSelection
              Styles.Header = cxStyleHeader
            end
          end
          inherited cxGridPrKSpravOneLevel: TcxGrid
            Width = 376
            Height = 285
            inherited cxGridPrKSpravOneLevelDBTableView1: TcxGridDBTableView
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              Styles.Background = cxStyleBackGround_Content
              Styles.Content = cxStyleBackGround_Content
              Styles.Inactive = cxStyleInactive
              Styles.Selection = cxStyleSelection
              Styles.Header = cxStyleHeader
            end
            inherited cxGridPrKSpravOneLevelDBTableView2: TcxGridDBTableView
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              Styles.Background = cxStyleBackGround_Content
              Styles.Content = cxStyleSkyBlue
              Styles.Inactive = cxStyleInactive
              Styles.Selection = cxStyleSelection
              Styles.Header = cxStyleHeader
            end
          end
          inherited cxSplitterSelectionPreim: TcxSplitter
            Left = 378
            Height = 285
          end
        end
      end
    end
    object TabSheetDopolnVedomosti: TTabSheet
      Caption = 'TabSheetDopolnVedomosti'
      ImageIndex = 7
      OnShow = TabSheetDopolnVedomostiShow
      inline TFrameDopolnVedomosti1: TFrameDopolnVedomosti
        Left = 0
        Top = 0
        Width = 641
        Height = 297
        Align = alClient
        TabOrder = 0
        inherited cxButtonEditCel_Zamovnik: TcxButtonEdit
          Style.StyleController = cxEditStyleControllerAbit
        end
        inherited cxButtonEditUkr_Lang: TcxButtonEdit
          Style.StyleController = cxEditStyleControllerAbit
        end
        inherited cxButtonEditGurtog: TcxButtonEdit
          Style.StyleController = cxEditStyleControllerAbit
        end
        inherited cxButtonEditCn_National: TcxButtonEdit
          Style.StyleController = cxEditStyleControllerAbit
        end
        inherited cxButtonEditVID_DOG: TcxButtonEdit
          Style.StyleController = cxEditStyleControllerAbit
        end
      end
    end
    object TabSheetWorkStaj: TTabSheet
      Caption = 'TabSheetWorkStaj'
      ImageIndex = 5
      inline TFrameWorkStaj1: TFrameWorkStaj
        Left = 0
        Top = 0
        Width = 641
        Height = 297
        Align = alClient
        TabOrder = 0
        inherited cxGroupBoxCalcWorkStaj: TcxGroupBox
          Left = 339
          Height = 297
          inherited cxGridCalcStaj: TcxGrid
            Height = 222
            inherited cxGridCalcStajTableView1: TcxGridTableView
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              Styles.Background = cxStyleSkyBlue
              Styles.Content = cxStyleSkyBlue
              Styles.Inactive = cxStyleInactive
              Styles.Selection = cxStyleSelection
              Styles.Header = cxStyleHeader
            end
          end
          inherited cxGroupBoxButton: TcxGroupBox
            Top = 237
          end
        end
        inherited cxSplitterCalcWorkStaj: TcxSplitter
          Left = 331
          Height = 297
        end
        inherited WorkStaj: TActionList
          Top = 192
        end
      end
    end
    object TabSheetParents: TTabSheet
      Caption = 'TabSheetParents'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ImageIndex = 6
      ParentFont = False
      inline TFrameParents1: TFrameParents
        Left = 0
        Top = 0
        Width = 641
        Height = 302
        Align = alClient
        TabOrder = 0
        inherited cxGroupBoxOtec: TcxGroupBox
          Height = 302
        end
        inherited cxGroupBoxMother: TcxGroupBox
          Width = 328
          Height = 302
        end
      end
    end
    object TabSheetFioAbit: TTabSheet
      Caption = 'TabSheetFioAbit'
      ImageIndex = 3
      inline TFrameFioAbit1: TFrameFioAbit
        Left = 0
        Top = 0
        Width = 641
        Height = 302
        Align = alClient
        TabOrder = 0
        inherited cxButtonEditFioAbit: TcxButtonEdit
          Style.StyleController = cxEditStyleControllerAbit
        end
      end
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Width = 649
    Height = 48
    Align = alTop
    Alignment = alTopLeft
    LookAndFeel.Kind = lfUltraFlat
    TabOrder = 0
    TabStop = False
    DesignSize = (
      649
      48)
    object cxLabelFioAbit: TcxLabel
      Left = 199
      Top = 16
      Width = 444
      Height = 24
      TabStop = False
      Anchors = [akTop, akRight]
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Caption = 'cxLabelFioAbit'
    end
    object cxLabelInfo: TcxLabel
      Left = 8
      Top = 16
      Width = 185
      Height = 24
      TabStop = False
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clHotLight
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 391
    Width = 649
    Height = 48
    Align = alBottom
    Alignment = alTopLeft
    LookAndFeel.Kind = lfUltraFlat
    TabOrder = 6
    TabStop = False
    DesignSize = (
      649
      48)
    object cxButtonCansel: TcxButton
      Left = 536
      Top = 13
      Width = 97
      Height = 27
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
      TabOrder = 3
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
    object cxButtonOK: TcxButton
      Left = 342
      Top = 13
      Width = 97
      Height = 27
      Cursor = crHandPoint
      Action = ActionSave
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
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF7F2B287F2B287F2B287F2B28A18283A18283A18283A18283
        A18283A18283A18283A18283A18283A18283A182837F2B287F2B287F2B287F2B
        28FF00FFFF00FFFF00FFFF00FF7F2B28B04E4CC24A4ABA4A49B441418B5959E2
        D9D9C9BDBDC4AFADE2CFCCF3EBE7F3EDEAE5DEDEDAE0DEDAE0DEB165647A1817
        822121A53939AD44457F2B28FF00FFFF00FFFF00FF7F2B28B4514FC24A4AC24E
        4EBB45468B3C3DE2D9D9791617791617AC4E4CF4E7E3FFFFFCFAF6F2EFF6F3EF
        F6F3B16564791515822020A93A3AB448487F2B28FF00FFFF00FFFF00FF7F2B28
        B2504EC24A4AC04D4DB844448C4040E2D9D9791617791617B25350E3D5D3FAF8
        F4FEF8F4FCFFFBFCFFFFB16564791515822020A73A3AB247477F2B28FF00FFFF
        00FFFF00FF7F2B28B2504EC24A4AC04D4DB743438F4141E2D9D9791617791617
        B25350CFC0BFEBEAE7FAF4F2FFFFFFFCFFFFB16564791515822020A73A3AB247
        477F2B28FF00FFFF00FFFF00FF7F2B28B2504EC24A4AC04D4DB74343914241E2
        D9D9791617791617B25350B0A09FD4D4D1EEE7E3FFFFFFFCFFFFB16564781414
        832020A73A3AB247477F2B28FF00FFFF00FFFF00FF7F2B28B2504EC24A4AC04D
        4DB54242934343E2D9D9791617791617B253508C8382A7AFADD3D4D0FCFFFFFC
        FFFFB16564741111801E1EA63939B247477F2B28FF00FFFF00FFFF00FF7F2B28
        B2504EC24A4ABF4C4CB744449C4141E2D9D9E2D9D9E2D9D9E2D9D9E2D9D9E2D9
        D9E2D9D9E2D9D9E2D9D9B16564831C1C8C2727AB3D3DB246477F2B28FF00FFFF
        00FFFF00FF7F2B28B2514EC24A4ABF4B4BBD4A49B74646BF5B5BCE7777D07B7B
        CC7475CE6E6FCB6C6CC76868C46868C05A5AB64443B44141B64343BD4949B145
        467F2B28FF00FFFF00FFFF00FF7F2B28C24A4AC24A4AB24443B74B49BC5151BB
        504FBB4D4CBB4D4DBB4D4DBB4D4DBB4D4CBB4D4CBA4C4BBB504FC05857C15B5A
        C15757C14E4EB044457F2B28FF00FFFF00FFFF00FF7F2B28C24A4AC24A4ACA8C
        8ACA8C8ACB8F8CCC908ECC908ECC908ECC908ECC908ECC908ECC908FCC908FCC
        908FCC908ECC918FCB908EC05555C24A4A7F2B28FF00FFFF00FFFF00FF7F2B28
        C24A4AC24A4AD7B4B1FEFCFCFEFCFCFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFE
        FEFFFEFEFFFEFEFFFEFEFEFCFCFCFBFBDDB7B6B54B4BC24A4A7F2B28FF00FFFF
        00FFFF00FF7F2B28C24A4AC24A4AD9B8B6FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEDDB7B7B44948C24A
        4A7F2B28FF00FFFF00FFFF00FF7F2B28C24A4AC24A4AD9B6B4FEFEFEFEFEFEBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFEFEFEFEFEFE
        DDB7B6B44948C24A4A7F2B28FF00FFFF00FFFF00FF7F2B28C24A4AC24A4AD9B6
        B4FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEDDB7B6B44948C24A4A7F2B28FF00FFFF00FFFF00FF7F2B28
        C24A4AC24A4AD9B6B4FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEDDB7B6B44948C24A4A7F2B28FF00FFFF
        00FFFF00FF7F2B28C24A4AC24A4AD9B6B4FEFEFEFEFEFEBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFEFEFEFEFEFEDDB7B6B44948C24A
        4A7F2B28FF00FFFF00FFFF00FF7F2B28C24A4AC24A4AD9B6B4FEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        DDB7B6B44948C24A4A7F2B28FF00FFFF00FFFF00FF7F2B28C24A4AC24A4AD9B6
        B4FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEDDB7B6B44948C24A4A7F2B28FF00FFFF00FFFF00FF7F2B28
        C24A4AC24A4AD9B7B5FEFEFEFEFEFEBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFFEFEFEFEFEFEDDB7B6B54A4AC24A4A7F2B28FF00FFFF
        00FFFF00FF7F2B28C24A4AC24A4AD3B1AFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEDDB8B6C24A4AC24A
        4A7F2B28FF00FFFF00FFFF00FFFF00FF7F2B287F2B28C1A09EFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        E0BAB77F2B287F2B28FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      UseSystemPaint = False
    end
    object cxButtonDelAbit: TcxButton
      Left = 15
      Top = 13
      Width = 152
      Height = 27
      Cursor = crHandPoint
      Action = ActionDelAbit
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
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00000084000000840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0000008400000084000000840084848400FF00FF00FF00FF00FF00FF00FF00
        FF00000084000000840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000008400000084000000840084848400FF00FF00FF00FF000000
        84000000840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000008400000084000000840084848400000084000000
        840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00000084000000840000008400000084000000
        8400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00000084000000FF00000084008484
        8400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00000084000000840000008400000084000000
        840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00000084000000840000008400FF00FF00000084000000
        84000000840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00000084000000840000008400FF00FF00FF00FF00FF00FF000000
        8400000084000000840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00000084000000840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00000084000000840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object cxButtonPrint: TcxButton
      Left = 442
      Top = 13
      Width = 92
      Height = 27
      Cursor = crHandPoint
      Action = ActionPrintAbit
      Anchors = [akTop, akRight]
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
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6C6A6A6C
        6A6A6C6A6AFF00FFFF00FFFF00FFFF00FF6C6A6A6C6A6AFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF6C6A6AB0ADAD9692938E8A8B6C6A6A6C6A6A817E7F6C6A6ADDDCDCD0CFCF6C
        6A6A6C6A6A6C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF6C6A6AD5D4D4C6C4C4A19F9FA19F9FA19F9F8381825C5B5BBCBC
        BCCECECECFCFCFD1D1D1D3D3D3CAC9C96C6A6A6C6A6A6C6A6AFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF6C6A6AD8D7D7E0DEDEC0BFBFA19F9FA19F9FA19F9F
        6260600000000000001616165D5D5DA9A9A9CACACACACACACACACACACACAC1C0
        C06C6A6A6C6A6A6C6A6AFF00FFFF00FF6C6A6AD3D3D3D4D3D3CFCFCF8C8A8A81
        7F7F817F7F817F7F6C6A6A1414140808080000000000000000001616165D5D5D
        A9A9A9CACACACACACAB7B6B6B7B6B66C6A6AFF00FF6C6A6ACACACACACACAC6C6
        C68E8C8CB8B5B5B6B4B4A19F9FA19F9F9F9D9D9997979390918280805250502B
        2A2A080808000000000000161616646464817E7F6C6A6AFF00FFFF00FF6C6A6A
        CACACAC5C5C58E8C8CD7D4D4F7F6F6F6F4F4F2F0F0E0DEDECAC7C7B6B5B5A5A3
        A3A19F9FA19F9F9E9A9C9390916865662322230303031919199997976C6A6AFF
        00FFFF00FF6C6A6AC5C5C58E8C8CE7E6E6F7F6F6F7F6F6F6F4F4F2F0F0EEEDED
        EAEAEAE7E6E6E3E2E2D4D3D3C2C1C1AFADADA19F9FA19F9F9997978280806C6A
        6A9F9D9D6C6A6AFF00FFFF00FF6C6A6A8E8C8CEFEEEEF7F6F6F7F6F6F7F6F6F6
        F4F4D5D3D4867B7E958B8EC1BFBFDDDCDCE0E0E0DCDCDCD8D8D8D1D1D1C2C1C1
        B2B0B0A19F9F9C99996C6A6A6C6A6AFF00FFFF00FF6C6A6ACECBCCF7F6F6F7F6
        F6F7F6F6F7F6F6CFCBCCAFACADADABAB9E989883797B75696B898081ABA5A6C7
        C6C6D5D5D5D1D1D1CECECEC9C7C7BBBABAA6A4A46C6A6AFF00FFFF00FFFF00FF
        6C6A6A6C6A6ACECBCCEDEBEBAFA4A56B5D5F766A6C83787A9C9697ACAAAAB2B0
        B0ABA7A9989192817778847A7D938C8EBFBFBFCBCBCBCACACAC0C0C06C6A6AFF
        00FFFF00FFFF00FFFF00FFFF00FF6C6A6A6C6A6ABD8281AF8A737D5E51665456
        6554576D5E626D5E62898081A09A9CAFACADB2B0B0A49FA0CAC9CACBCBCBB7B6
        B66C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FF
        D4ABFFD0A1FFCB98D5A57BA1785C7B665F6050536656596F62658E8687CECCCC
        CFCFCFA5A4A46C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFBD8281FFD9B2FFD4A9FFCFA0FFCA97FFC68EFFC186FFBF81FFC084BD
        82816C6A6A6C6A6A6C6A6A6C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFBD8281FFDDBAFFD8B1FFD3A7FFCE9EFFCA96FFC5
        8CFFC084FFC084BD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FFE5CBFFE1C2FFDCB8FFD7AF
        FFD3A6FFCE9DFFC995FFC48BBD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FFEAD4FF
        E5CAFFE0C0FFDAB7FFD7ADFFD1A5FFCC9CFFC792BD8281FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFBD8281FFEEDCFFE9D1FFE3C9FFE0BFFFDAB6FFD5ACFFD0A3F7C297BD8281FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFBD8281FFF7EEFFF2E3FFEDDAFFE7D0FFE3C7FFDEBDFFD9B4FFD4
        ABBD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFBD8281FFFAF3FFFAF3FFF6EDFFF0E2FFEBD9FFE7CF
        FFE2C5FFDDBCF2C7A9BD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281BD8281BD8281BD8281FF
        F4EBFFF0E1FFEBD7FFE6CEFBDCC0BD8281FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFBD8281BD8281BD8281BD8281BD8281FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      UseSystemPaint = False
    end
  end
  object FormStorageAbit: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 69
    Top = 369
  end
  object StyleRepositoryAbit: TcxStyleRepository
    Left = 39
    Top = 369
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
    object cxStyleSkyBlue: TcxStyle
      AssignedValues = [svColor]
      Color = 16776176
    end
  end
  object cxEditStyleControllerAbit: TcxEditStyleController
    Style.Color = clInfoBk
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Left = 10
    Top = 369
  end
  object DataBasePrK_ABIT: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251'
      'password=masterke'
      'user_name=sysdba')
    DefaultTransaction = TransactionReadPrK_ABIT
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 99
    Top = 370
  end
  object TransactionReadPrK_ABIT: TpFIBTransaction
    DefaultDatabase = DataBasePrK_ABIT
    TimeoutAction = TACommit
    Left = 128
    Top = 370
  end
  object TransactionWritePrK_ABIT: TpFIBTransaction
    DefaultDatabase = DataBasePrK_ABIT
    TimeoutAction = TARollback
    Left = 157
    Top = 370
  end
  object StoredProcPrK_ABIT: TpFIBStoredProc
    Database = DataBasePrK_ABIT
    Transaction = TransactionWritePrK_ABIT
    Left = 246
    Top = 371
  end
  object DataSetPrK_ABIT: TpFIBDataSet
    Database = DataBasePrK_ABIT
    Transaction = TransactionReadPrK_ABIT
    Left = 218
    Top = 371
    poSQLINT64ToBCD = True
  end
  object DataSourcePrK_ABIT: TDataSource
    DataSet = DataSetPrK_ABIT
    Left = 189
    Top = 370
  end
  object ActionListVuzLicense: TActionList
    Images = ImageListVuzLicense
    Left = 307
    Top = 371
    object ActionADDDE: TAction
      Caption = 'ActionADD'
      Hint = #1053#1072#1087#1080#1089#1072#1090#1100' '#1074' inicCaption'
      ImageIndex = 1
      ShortCut = 45
      OnExecute = ActionADDDEExecute
    end
    object ActionChangeDE: TAction
      Caption = 'ActionChange'
      Hint = #1053#1072#1087#1080#1089#1072#1090#1100' '#1074' inicCaption'
      ImageIndex = 4
      ShortCut = 113
      OnExecute = ActionChangeDEExecute
    end
    object ActionDELDE: TAction
      Caption = 'ActionDEL'
      Hint = #1053#1072#1087#1080#1089#1072#1090#1100' '#1074' inicCaption'
      ImageIndex = 3
      ShortCut = 46
      OnExecute = ActionDELDEExecute
    end
    object ActionViewDE: TAction
      Caption = 'ActionView'
      Hint = #1053#1072#1087#1080#1089#1072#1090#1100' '#1074' inicCaption'
      ImageIndex = 10
      ShortCut = 114
      OnExecute = ActionViewDEExecute
    end
    object ActionObnov: TAction
      Caption = 'ActionObnov'
      Enabled = False
      Hint = #1053#1072#1087#1080#1089#1072#1090#1100' '#1074' inicCaption'
      ImageIndex = 7
      ShortCut = 116
      Visible = False
    end
    object ActionVibrat: TAction
      Caption = 'ActionVibrat'
      Enabled = False
      Hint = #1053#1072#1087#1080#1089#1072#1090#1100' '#1074' inicCaption'
      ImageIndex = 0
      ShortCut = 13
      Visible = False
    end
    object ActionOtmena: TAction
      Caption = 'ActionOtmena'
      Enabled = False
      Hint = #1053#1072#1087#1080#1089#1072#1090#1100' '#1074' inicCaption'
      ImageIndex = 5
      ShortCut = 27
      Visible = False
    end
    object ActionAddDD: TAction
      Caption = 'ActionAddDD'
      ImageIndex = 1
      ShortCut = 16429
      OnExecute = ActionAddDDExecute
    end
    object ActionChangeDD: TAction
      Caption = 'ActionChangeDD'
      ImageIndex = 4
      ShortCut = 16497
      OnExecute = ActionChangeDDExecute
    end
    object ActionDelDD: TAction
      Caption = 'ActionDelDD'
      ImageIndex = 3
      ShortCut = 16430
      OnExecute = ActionDelDDExecute
    end
    object ActionViewDD: TAction
      Caption = 'ActionViewDD'
      ImageIndex = 10
      ShortCut = 16498
      OnExecute = ActionViewDDExecute
    end
    object ActionAddIL: TAction
      Caption = 'ActionAddIL'
      ImageIndex = 1
      ShortCut = 8237
      OnExecute = ActionAddILExecute
    end
    object ActionChangeIL: TAction
      Caption = 'ActionChangeIL'
      ImageIndex = 4
      ShortCut = 8305
      OnExecute = ActionChangeILExecute
    end
    object ActionDelIL: TAction
      Caption = 'ActionDelIL'
      ImageIndex = 3
      ShortCut = 8238
      OnExecute = ActionDelILExecute
    end
    object ActionViewIL: TAction
      Caption = 'ActionViewIL'
      ImageIndex = 10
      ShortCut = 8306
      OnExecute = ActionViewILExecute
    end
  end
  object ImageListVuzLicense: TImageList
    Left = 278
    Top = 371
    Bitmap = {
      494C01010C000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
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
      0000000000000000000000000000824B4B004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000EFEFEF00E0E0
      E000D8D8D800D8D8D800E0E0E000F0F0F000FCFCFC0000000000000000000000
      000000000000000000000000000000000000000000000000000092635D00A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900000000000000000039393900393939003939
      3900393939003939390039393900393939003939390039393900393939003939
      3900000000000000000000000000000000000000000000000000000000000000
      0000824B4B00824B4B00A64B4B00A94D4D004E1E1F0000000000000000000000
      00000000000000000000000000000000000000000000F8F8F8004C4C4C005454
      54006363630060606000555555004D4D4D006969690087878700AAAAAA00CFCF
      CF00EFEFEF00FBFBFB00FEFEFE0000000000000000000000000093655F00FEDD
      B800FFDAB500FED8AF00FED7AB00FED4A600FED3A400FECF9E00FECF9D00FECE
      9900FECC9700FECB96009F6F6000000000003939390080808000808080008080
      8000808080008080800084848400848484008484840084848400848484003939
      3900393939000000000000000000000000000000000000000000824B4B00824B
      4B00B64F5000C24F5000C54D4E00B24D4E004E1E1F00824B4B00824B4B00824B
      4B00824B4B00824B4B00824B4B000000000000000000DADADA00B4B4B400C7C7
      C700D5D5D500E8E8E800FAFAFA00FFFFFF00FFFFFF00F2F2F200B0B0B0005F5F
      5F00505050005D5D5D008080800000000000000000000000000093655F00FEE0
      BD00FEDDBA00FEDAB200FED8B000FED5AA00FED4A700FED1A30000810000FFCE
      9C00FECE9900FECC97009F6F6000000000003939390039393900393939003939
      3900393939003939390039393900393939003939390039393900393939003939
      3900393939003939390000000000000000000000000000000000824B4B00D458
      5900CB555600C9545500C9525300B74F52004E1E1F00FE8B8C00FB9A9C00F8AA
      AB00F7B5B600F7B5B600824B4B000000000000000000C1C1C100B5B5B500C8C8
      C8003C3C3C0088888800F2F2F200E9E9E900E9E9E900E9E9E900FDFDFD00FDFD
      FD00FCFCFC00FDFDFD007B7B7B0000000000000000000000000093656000FEE3
      C600D5812700D5812700D5812700D5812700FED8AF0032772500648E43005484
      3700FECF9E00FECE9A009F6F60000000000039393900C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C5C5C500C5C5C500C5C5C500C5C5C500C5C5C5008484
      8400393939003939390000000000000000000000000000000000824B4B00D75C
      5D00D05A5B00CF595A00CF575800BD5356004E1E1F0023B54A0013C1480016BD
      48000CBC4100F7B5B600824B4B000000000000000000D8D8D800A9A9A9006767
      67001010100047474700D6D6D600FDFDFD00F5F5F500E9E9E900E8E8E800FAFA
      FA00E4E4E400F4F4F400A7A7A70000000000000000000000000095666000FFE5
      CB00FFE5C700FEE0C000FEE0BC00FEDCB600FFDAB200F6D3A700FFD5AA000081
      000000810000FECF9D009F6F60000000000039393900C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000FF000000FF00000000FF000000FF00C5C5C5008484
      8400848484003939390039393900000000000000000000000000824B4B00DD63
      6400D75F6000D55E5F00D55C5D00C2575A004E1E1F002AB44D001CBF4C001EBC
      4C0013BC4500F7B5B600824B4B000000000000000000DDDDDD009B9B9B000A0A
      0B007E7E7E00D8D8D800010101007A7A7A00FBFBFB00F5F5F500E7E7E700E7E7
      E700F4F4F400E0E0E000B9B9B9000000000000000000000000009E6E6400FEEB
      D400FEE9D000FEE5CA00FEE3C600FEE0BF00FFDEBC00FEDAB500FED9B100FED7
      AB00FED4A900FED1A3009F6F60000000000039393900C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C5C5C500C5C5C500C5C5C500C5C5C500C5C5C5008484
      8400848484008484840039393900000000000000000000000000824B4B00E368
      6900DD656600DA636400DE666700C6595B004E1E1F0026B1490016BC48001BBB
      490010BB4300F7B5B600824B4B000000000000000000D5D5D500B8B8B800ADAD
      BC0078787800252525003D3D3D0027272700B6B6B600F9F9F900F0F0F000DFDF
      DF00EAEAEA00C8C8C800C6C6C600000000000000000000000000A3726600FFED
      D800FEEAD400FFE7CE00FEE6CB00FEE2C400FEE1C000FFDDB80000810000FED9
      AF00FED7AB00FED4A6009F6F6000000000000000000039393900393939003939
      390039393900393939003939390039393900393939003939390039393900C5C5
      C500848484008484840039393900000000000000000000000000824B4B00EB6D
      6E00E2676800E67E7F00FAD3D400CC6E70004E1E1F00A5D8970050D16F0042C9
      66002DC75800F7B5B600824B4B000000000000000000D1D1D100B8B8B800BBBB
      CE00DADADA002727270050505000BFBFBF0023232300B8B8B800E7E7E700DCDC
      DC00E5E5E500AEAEAE00CFCFCF00000000000000000000000000AC796900FFF2
      E200D5812700D5812700D5812700D5812700FFE5C900327A290064934C005489
      3E00FEDAB500FED7AD00A0706300000000000000000000000000B58C8C00FFFF
      FF00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00FFFFFF009C6B
      6B00C5C5C5008484840039393900000000000000000000000000824B4B00F273
      7400E96C6D00EB818200FCD1D300CF6E70004E1E1F00FFF2CC00FFFFD700FFFF
      D400E6FCC700F7B5B600824B4B000000000000000000CDCDCD0001010100BABA
      CD00E1E1E100E8E8E800959595007A7A7A00080808001C1C1C007E7E7E00DDDD
      DD00D3D3D30099999900D5D5D500000000000000000000000000B17E6B00FFF2
      E600FFF0E200FFEEDC00FFEBD800FEE9D100FEE7CC00F6E0C000FEE2C2000081
      000000810000FED9B100A0726400000000000000000000000000B58C8C00FFFF
      FF00FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFFFF7009C6B
      6B00393939003939390000000000000000000000000000000000824B4B00F878
      7900F0757600EE727300F0737400D16566004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD700F7B5B600824B4B000000000000000000CCCCCC00C5C5C500C8C8
      DE00EFEFEF00FEFEFE00FEFEFE007B7B7B0006060600E4E4E400D9D9D9004646
      4600BABABA0091919100D5D5D500000000000000000000000000BB846E00FEF7
      EE00FEF6EB00FEF2E500FFF0E100FFEDD900FEEBD700FEE9CF00FEE6CC00FEE3
      C500FEE1C100FEDDBB00896A6300000000000000000000000000B58C8C00FFFF
      FF00FFF7EF00F7E7CE00F7DEC600F7E7CE00F7DEC600F7E7CE00FFFFF7009C6B
      6B00000000000000000000000000000000000000000000000000824B4B00FE7F
      8000F77A7B00F6797A00F7777900D76B6B004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD500F7B5B600824B4B000000000000000000CFCFCF00C2C2C200C4C4
      DA00E8E8E800F7F7F700FAFAFA00F1F1F1001A1A1A0024242400878787004242
      42008787870089898900CDCDCD00000000000000000000000000C0896F00FFF8
      F200FFF7EE00FFF4E700FEF3E600FFEFDE00FFEDDA00FFEAD40000810000FEE5
      C900FFE3C600FEE1BF008067620000000000000000000000000000000000B58C
      8C00FFFFF700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFFF
      FF009C6B6B000000000000000000000000000000000000000000824B4B00FF83
      8400FC7F8000FB7E7F00FE7F8000DA6E6F004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD500F7B5B600824B4B000000000000000000D5D5D500BABABA00B2B2
      C600D2D2D200E3E3E300F4F4F400F4F4F400F4F4F400181818002F2F2F005151
      51004C4C4C004D4D4D00C5C5C500000000000000000000000000CB917300FFFB
      F800D5812700D5812700D5812700D5812700FEF2E300327D2E0064995600548F
      4700FFE7CF00FFE5C7009868590000000000000000000000000000000000B58C
      8C00FFFFF700FFFFF700FFE7D600FFE7D600FFE7D600FFE7D600FFE7D600FFFF
      FF009C6B6B000000000000000000000000000000000000000000824B4B00FF88
      8900FF828300FF818200FF828300E07374004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD500F7B5B600824B4B000000000000000000E2E2E200A5A5A500A4A4
      B700C1C1C100CDCDCD00D8D8D800E8E8E800EDEDED00EAEAEA00242424007575
      75003D3D3D0009090900D6D6D600000000000000000000000000CF967400FFFE
      FB00FFFBF800FEFAF300FFF8F000FFF4EB00FEF3E700F7EEDA00FFEFDE000081
      000000810000FFE7CB00A5686B00000000000000000000000000000000000000
      0000B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009C6B6B0000000000000000000000000000000000824B4B00824B
      4B00E2757600FE818200FF868700E57677004E1E1F00FAEBC500FCFBD100FCFB
      CF00FCFBD100F7B5B600824B4B000000000000000000F4F4F4003B3B3B00B8B8
      B800C7C7C700D5D5D500E1E1E100E4E4E400E5E5E500E6E6E600C3C3C3009383
      73009F8D81003B2F260000000000000000000000000000000000D4987500FFFF
      FF00FFFEFE00FFFCFA00FFFBF700FFF8F200FFF7EF00FEF4E900FFF3E600FFF0
      E000FFEFDD00FEEBD50084696400000000000000000000000000000000000000
      000000000000B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C
      8C00B58C8C009C6B6B0000000000000000000000000000000000000000000000
      0000824B4B009C565700CB6C6D00CF6E6E004E1E1F00824B4B00824B4B00824B
      4B00824B4B00824B4B00824B4B000000000000000000FCFCFC009E9E9E00A5A5
      A500ADADAD00B7B7B700C2C2C200CBCBCB00D1D1D100D7D7D700D0D0D000D4C6
      BC0093847900FCFCFC0000000000000000000000000000000000D4987500FFFF
      FF00FFFFFF00FFFEFB00FEFEFB00FFFBF400FFF8F300FFF7EE00FFF4EA00FEF2
      E500FEF0E100FFEDDA0084696400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000824B4B00824B4B004E1E1F0000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FEFEFE000000
      000000000000FEFEFE00FDFDFD00F6F6F600E0E0E000D1D1D100CDCDCD00B3A4
      9600FCFCFC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C3100009C3100000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EF42
      0000AD2900009C310000C8D0D400C8D0D400C8D0D400C8D0D40000000000EF42
      0000AD290000AD29000073290000732900000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7EFDE00F7DECE00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00F7EFDE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFEFA500FFEFA5005A3118005A311800000000000000
      000000000000000000000000000000000000FF9C1800FFF7E70000000000EF42
      0000AD2900009C310000C8D0D400C8D0D400C8D0D400C8D0D400FF9C1800FFF7
      E700AD290000AD29000073290000732900000000000097736B00B3887F00B184
      7C00B1847C00B1847C00B1857D00B1857D00B1857E00B0857D00AE857E00AA83
      7C00B0858000B48A7C00875D56000000000000000000F7EFDE00F7DECE00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00F7EFDE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFEFA500FFEFA500FFE78C00FFE78C00313131000000
      000000000000000000000000000000000000FF9C1800FFF7E70000000000EF42
      0000AD2900009C310000C8D0D400C8D0D400C8D0D400C8D0D400FF9C1800FFF7
      E700AD290000AD290000732900007329000000000000B3938C00F1DCCA00FCDB
      C400FCDAC600FCDBC700FAD5BA00FED6BC00FFD4B600FAD3B600F6CFB000F1CD
      AE00F5CEA800FDCFAD009D706A000000000000000000FFF7E700FFD6A500FFD6
      A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500F7E7CE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFEFA500FFEFA500FFE78C00FFE78C00FFC65A003131
      31009C3100009C3100000000000000000000FF9C1800FF9C180000000000EF42
      0000AD2900009C310000C8D0D400C8D0D400C8D0D400C8D0D400000000000000
      0000AD290000AD290000732900007329000000000000B3969000ECE8D600FFF2
      D400E4E6BE00E3E1B900FFEAD300F4E1B600E9E3AF00FDDDB700FDD8AD00FAD5
      A700F6D6A200FCD8B600A07272000000000000000000FFF7E700F7DEC600F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEBD00F7E7CE00F7E7CE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      0000FF31FF00FF633100FFEFA500FFEFA500FFE78C00FFE78C00FFC65A00FF9C
      0000FF9C63009C3100000000000000000000FF9C1800FF9C180000000000EF42
      0000AD2900009C310000C8D0D400C8D0D400C8D0D400C8D0D400000000000000
      0000AD290000AD290000732900007329000000000000BB9F9000ECEFE500FFFA
      EC00A9D38F00009A0000029B050000980000009D000000930000269D2300D5CD
      9800FFD7AC00FED7BA009E7070000000000000000000F7EFDE00F7DECE00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00EFDECE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFEFA500FFEFA5000000000008080800FFC65A00FF9C
      0000FF9C63009C3100000000000000000000FF9C18000000000000000000EF42
      0000AD290000AD2900007329000073290000FF9C1800FF9C1800000000000000
      0000AD290000AD290000732900007329000000000000C0A49800EFF1EA00FFFB
      F400AAD89900009400000098000010A016009CCE9100AFC791002FA826005FB5
      4F00F6DAB100FFDEC6009E7170000000000000000000FFF7E70045454500FFD6
      A50045454500FFD6A5001F1F1F00FFD6A500FFD6A500FFD6A500EFDECE009C6B
      6300000000000000000000000000000000000000000000000000080808000000
      000000000000FF633100FFEFA500FFEFA500FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C3100000000000000000000FF9C180000000000F7FFFF00EF42
      0000AD2900009C3100007329000073290000FF9C1800F7FFFF00000000000000
      0000AD290000AD290000732900007329000000000000C4A7A000EFF5E900FFFC
      F700B3DCA300019D01000DA10B001DA41C0051B14300F0E5C400F4E2C3005FB4
      5B00D9D29D00FFDDC600A77A74000000000000000000FFFFEF00F7DEC600FFDE
      C600F7DEC6001F1F1F001F1F1F00F7DEC600F7DEBD00F7E7CE00EFDECE009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100F7FFFF00FFDE8400FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C3100000000000000000000FF9C180000000000F7FFFF00EF42
      0000AD2900009C31000073290000FFC65A00FF9C1800F7FFFF00000000000000
      0000AD290000AD290000732900007329000000000000CAACA100F4FAF200F2F7
      E500DCEBCE00FBF4E600F5F3DF00F9F1DA00FEE7CD00FEEBD800FFECDB00F7E6
      CD00F0DEB600FEDAC100AB7D75000000000000000000FFFFEF00F7E7CE00FFDE
      C6001F1F1F001F1F1F001F1F1F00F7DEC600F7DEC600F7E7D600EFDECE009C6B
      6B000000000000000000000000000000000000000000FFFFCE00FFFFBD00FFC6
      5A00FFA51000FF9C0000F7FFFF00FFEFA500FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C3100000000000000000000FFA53900FFA53900F7FFFF00EF42
      0000AD2900009C31000073290000FFC65A00FF9C1800F7FFFF00000000000000
      0000AD290000AD2900008C3921008C39210000000000D2B5A000F6FAFA00E6F7
      E1008AD38800EDF3DF00FFFCF900C0DEAA004AB0390053B4430049B13C00C5D5
      9F00FFE8D000FDE1CC00AA7E76000000000000000000FFFFF700FFD6A5001F1F
      1F008484840000FFFF001F1F1F00FFD6A500FFD6A500FFD6A500EFDECE009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      00000000000008080800F7FFFF00FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C3100000000000000000000C8D0D400FFA53900FFA53900EF42
      0000EF420000AD290000732900008C392100FFA53900FF9C1800000000000000
      0000AD2900008C3921008C392100C8D0D40000000000D1B4A100F4FAF800FFFF
      FD008FCF910049B95100E2EFD800FFF9EA0063BB64000093000000910000AAD0
      8D00FFEED900FEDFCA00AC7F77000000000000000000FFFFF700FFE7D6001F1F
      1F00C6C6C60000FFFF001F1F1F00FFE7D6000000000000000000000000009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100F7FFFF00FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C3100000000000000000000C8D0D400C8D0D400FFA53900FFF7
      E700EF420000AD290000732900008C392100FFA53900FFF7E700000000000000
      00008C3921008C392100C8D0D400C8D0D40000000000DBBDA300F6FDFA00FFFF
      FF00E9F4E5003AAA350018A519005FC0590036AD33000099000000950000AAD4
      8F00FFF6E200FCDCC800AF847D000000000000000000FFFFFF001F1F1F008484
      840000FFFF001F1F1F00FFFFF700FFFFF70000000000FFFFFF00C68C7B00C8D0
      D400000000000000000000000000000000000000000000000000000000000000
      0000FF31FF00FF633100C65A0000FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C00009C3100000000000000000000C8D0D400C8D0D400FFA53900FFA5
      3900EF420000EF4200008C3921008C392100FFA53900FFA53900000000000000
      00008C392100C8D0D400C8D0D400C8D0D40000000000E1C3A300F6FDFB00F8FC
      F800FFFFFF00C4EBCC0021AA2500009500000094000012A414000D9F1100A5CC
      8B00FFCAC000F8ADA100AC7E760000000000000000004545450084848400C6C6
      C60000FFFF001F1F1F00FFFFFF00FFFFFF0000000000C68C7B00C8D0D400C8D0
      D400000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFD67300C65A0000C65A0000CE636300FFC65A00FF9C
      0000FF9C00009C3100000000000000000000C8D0D400C8D0D400FFA53900FFA5
      3900EF420000EF4200008C3921008C392100FFA53900FFA53900000000000000
      00008C392100C8D0D400C8D0D400C8D0D40000000000E6C9A900F9FFFE00F8FC
      F800F8FCF800F8FCF800FBFEFA00FFFFFF00FFFFFF00FEFEF800FFFFFE00C9AA
      9700D4975200C79A7A00C3AEA20000000000000000001F1F1F001F1F1F0000FF
      FF001F1F1F0000000000000000000000000000000000C8D0D400C8D0D400C8D0
      D400000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFD67300FFD67300FFD67300C65A0000CE636300FF9C
      0000FF9C00009C3100000000000000000000C8D0D400C8D0D400C8D0D400FFA5
      3900FF9C1800EF4200008C392100C8D0D400C8D0D400FFA53900000000000000
      00008C392100C8D0D400C8D0D400C8D0D40000000000E8CBAC00FBFFFF00FAFF
      FF00FAFFFF00FAFFFF00FAFEFD00F9FEFD00F4FBFB00F3FBF800F7FFFC00C6AA
      9800D09E7300DCC9B60000000000000000001F1F1F0000008400000084001F1F
      1F00C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0
      D400000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFDE8400FFDE8400FFDE8400FFDE8400C65A0000C65A
      0000C65A00009C3100000000000000000000C8D0D400C8D0D400C8D0D400FFA5
      3900F7FFFF00EF4200008C392100C8D0D400C8D0D400FFA53900F7FFFF000000
      00008C392100C8D0D400C8D0D400C8D0D40000000000E7C29D00E1C6A500E2C6
      A600E2C6A600E2C6A600E2C4A400E1C3A300DDC1A100DCC0A000DEC3A300C29C
      8400DECCB800000000000000000000000000C8D0D4001F1F1F001F1F1F001F1F
      1F00C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0
      D400000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FF633100FF633100FF633100FF633100FF633100FF63
      3100FF633100FF6331000000000000000000C8D0D400C8D0D400C8D0D400FFCE
      6300FFCE6300FFA53900FFA53900C8D0D400C8D0D400FFCE6300FFA53900FFA5
      39008C392100C8D0D400C8D0D400C8D0D4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B58C8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B58C8C00FFFFE700F7EFDE00FFFFDE00F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00F7E7CE008C5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B58C8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600EFDE
      CE00EFDECE008C5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00F7EFDE008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B58C8C00FFFFE700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500EFDECE008C5A5A0000000000000000000000000000000000000084000000
      8400848484000000000000000000000000000000000000000000000000000000
      840000008400000000000000000000000000000000000000000000000000B58C
      8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00F7EFDE008C5A5A00000000000000000000000000000000000000
      0000000000000000000000848300000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C008C5A5A008C5A5A008C5A
      5A00B58C8C00FFF7EF00F7DEC600F7DEC600F7DEC600F7DEC600F7DEBD00F7E7
      CE00EFDECE009C6B630000000000000000000000000000000000000084000000
      8400000084008484840000000000000000000000000000000000000084000000
      840084848400000000000000000000000000000000000000000000000000B58C
      8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500F7E7CE008C5A5A00000000000000000000000000000000000000
      0000000000000084830000FFFE00008483000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00FFF7E700F7EFDE00F7EF
      DE00B58C8C00FFF7EF00F7E7CE00F7DEC600F7DEC600F7DEC600F7DEC600F7E7
      D600EFDECE009C6B6B0000000000000000000000000000000000000000000000
      8400000084000000840084848400000000000000000000008400000084000000
      84000000000000000000000000000000000000000000000000000000FF00B58C
      8C00FFF7E700F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00F7E7CE008C5A5A00000000000000000000000000000000000000
      000000FFFE0000FFFE0000FFFE0000FFFE000084830000000000000000000000
      000000000000000000000000000000000000B58C8C00F7EFDE00F7DECE00F7DE
      C600B58C8C00FFFFF700FFD6A500FFD6A500FFD6A5004C804C004C804C004C80
      4C004C804C00A57B730000000000000000000000000000000000000000000000
      0000000084000000840000008400848484000000840000008400000084000000
      00000000000000000000000000000000000000000000000000000000FF000000
      8400F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC6000000
      FF00EFDECE00EFDECE008C5A5A000000000000000000000000000000000000FF
      FE0000FFFE00848484008484840000FFFE0000FFFE0000848300000000000000
      000000000000000000000000000000000000B58C8C00FFF7E700FFD6A500FFD6
      A500B58C8C00FFFFF700FFE7D600FFE7D600F7E7D6004C804C0052AE570052AE
      57004C804C00A57B730000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF0000008400FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500000084000000
      FF00FFD6A500EFDECE009C6B63000000000000000000000000008484840000FF
      FE008484840000000000000000008484840000FFFE0000FFFE00008483000000
      000000000000000000000000000000000000B58C8C00FFF7EF00F7DEC600F7DE
      C600B58C8C00FFFFFF00FFFFFF004C804C004C804C004C804C0052AE570052AE
      57004C804C004C804C004C804C00000000000000000000000000000000000000
      00000000000000000000000084000000FF000000840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000006C6C
      FF0000008400F7DEC600F7DEC600F7DEC600F7DEC600000084000000FF00F7DE
      BD00F7E7CE00EFDECE009C6B6B00000000000000000000000000000000008484
      8400000000000000000000000000000000008484840000FFFE0000FFFE000084
      830000000000000000000000000000000000B58C8C00FFF7EF00F7E7CE00F7DE
      C600B58C8C00FFFFFF00FFFFFF004C804C0052AE570052AE570052AE570052AE
      570052AE570052AE57004C804C00000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400848484000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C000000FF0000008400F7DEC600F7DEC600000084000000FF00F7DEC600F7DE
      C600F7E7D600EFDECE009C6B6B00000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFE0000FF
      FE0000848300000000000000000000000000B58C8C00FFFFF700FFD6A500FFD6
      A500B58C8C00FFFFFF00FFFFFF004C804C0069CA800069CA800069CA800052AE
      570052AE570052AE57004C804C00000000000000000000000000000000000000
      0000000084000000840000008400000000000000840000008400000084008484
      840000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFF7000000FF0000008400000084000000FF00FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE009C6B6B00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FE0000FFFE00000000000000000000000000B58C8C00FFFFF700FFE7D600FFE7
      D600B58C8C00B58C8C00B58C8C004C804C004C804C004C804C0069CA800052AE
      57004C804C004C804C004C804C00000000000000000000000000000000000000
      8400000084000000840000000000000000000000000000008400000084000000
      840084848400000000000000000000000000000000000000000000000000B58C
      8C00FFFFF7000000FF000000FF000000FF00FFE7D600FFE7D600FFE7D600B58C
      8C00B58C8C00B58C8C009C6B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000FFFE00000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFF700EFDEDE00D6C6C600BDADAD004C804C0069CA800052AE
      57004C804C000000000000000000000000000000000000000000000084000000
      8400000084000000000000000000000000000000000000000000000084000000
      840000008400000000000000000000000000000000000000000000000000B58C
      8C000000FF00000084000000FF0000008400FFFFFF00FFFFF700FFFFF700B58C
      8C00FFFFFF00C68C7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFF700B58C8C00B58C8C00B58C8C004C804C004C804C004C80
      4C004C804C000000000000000000000000000000000000000000000084000000
      8400000000000000000000000000000000000000000000000000000000000000
      84000000840000000000000000000000000000000000000000000000FF000000
      FF0000008400FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF00B58C
      8C00C68C7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B58C8C00EFB56B00C68C7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C000000FF0000008400B58C8C00B58C
      8C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00BD8484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFE7FC07FC001800FF07F8001C001
      0007C0018001C0010003C0018001C0010003C0018001C0010001C0018001C001
      0001C0018001C0018001C0018001C001C001C0018001C001C003C0018001C001
      C00FC0018001C001E007C0018001C001E007C0018001C001F003C0018003C001
      F803F0018003C001FFFFFC7F9807FFFF800FFCFFE020FFFF800FFC3F20008001
      800FFC1F20008001800FF80320308001800FF00320308001800FF80360308001
      800FD80340308001800FD80340308001800F000300308001800F800300308001
      80EFD80300308001808FD00300308001808FF80300308001878FF80300308003
      000FF80300108007000FF8030000FFFFFFFFF003FFFFFFFFFFFFF003FFFFE001
      FFFFF003FFFFE001FDFFF003C7E7E001F8FF0003C3C7E001F07F0003E18FC001
      E03F0003F01FC001C01F0003F83FE001C60F0001FC3FE001EF070001F81FE001
      FF830001F10FE001FFC30001E387E001FFE30007C7C7E003FFF70007CFE7C007
      FFFF007FFFFF800FFFFF00FFFFFFFF9F00000000000000000000000000000000
      000000000000}
  end
  object dxBarManageDT_ABIT: TdxBarManager
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
        Caption = 'CustDocEducation'
        DockControl = dxBarDockControlDocEducation
        DockedDockControl = dxBarDockControlDocEducation
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 209
        FloatTop = 209
        FloatClientWidth = 84
        FloatClientHeight = 144
        ItemLinks = <
          item
            Item = dxBarLargeButtonAdd
            Visible = True
          end
          item
            Item = dxBarLargeButtonChange
            Visible = True
          end
          item
            Item = dxBarLargeButtonDel
            Visible = True
          end
          item
            Item = dxBarLargeButtonView
            Visible = True
          end
          item
            Item = dxBarLargeButtonVibrat
            Visible = True
          end
          item
            Item = dxBarLargeButtonObnov
            Visible = True
          end
          item
            Item = dxBarLargeButtonOtmena
            Visible = True
          end>
        MultiLine = True
        Name = 'CustDocEducation'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        RotateWhenVertical = False
        Row = 0
        ShowMark = False
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = 'CusDopDoc'
        DockControl = dxBarDockControlDopDoc
        DockedDockControl = dxBarDockControlDopDoc
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 276
        FloatTop = 213
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = dxBarLargeButtonAddDD
            Visible = True
          end
          item
            Item = dxBarLargeButtonChangeDD
            Visible = True
          end
          item
            Item = dxBarLargeButtonDelDD
            Visible = True
          end
          item
            Item = dxBarLargeButtonViewDD
            Visible = True
          end>
        Name = 'CusDopDoc'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        RotateWhenVertical = False
        Row = 0
        ShowMark = False
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = 'CustInLang'
        DockControl = dxBarDockControlInLang
        DockedDockControl = dxBarDockControlInLang
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 276
        FloatTop = 213
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = dxBarLargeButtonAddIL
            Visible = True
          end
          item
            Item = dxBarLargeButtonChangeIL
            Visible = True
          end
          item
            Item = dxBarLargeButtonDelIL
            Visible = True
          end
          item
            Item = dxBarLargeButtonViewIL
            Visible = True
          end>
        Name = 'CustInLang'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = 'CustCertifikat'
        DockControl = dxBarDockControlCertifikat
        DockedDockControl = dxBarDockControlCertifikat
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 486
        FloatTop = 291
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = BBAddSertifikat
            Visible = True
          end
          item
            Item = BBEditSertifikat
            Visible = True
          end
          item
            Item = BBDelSertifikat
            Visible = True
          end
          item
            Item = BBViewSertifikat
            Visible = True
          end
          item
            Item = BBCheckSertifikat
            Visible = True
          end>
        Name = 'CustCertifikat'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
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
    HotImages = ImageListVuzLicense
    Images = ImageListVuzLicense
    LargeImages = ImageListVuzLicense
    NotDocking = [dsNone]
    PopupMenuLinks = <>
    Style = bmsOffice11
    UseSystemFont = True
    Left = 337
    Top = 371
    DockControlHeights = (
      0
      0
      0
      0)
    object dxBarLargeButtonAdd: TdxBarLargeButton
      Action = ActionADDDE
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButtonChange: TdxBarLargeButton
      Action = ActionChangeDE
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButtonDel: TdxBarLargeButton
      Action = ActionDELDE
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButtonVibrat: TdxBarLargeButton
      Action = ActionVibrat
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButtonObnov: TdxBarLargeButton
      Action = ActionObnov
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButtonOtmena: TdxBarLargeButton
      Action = ActionOtmena
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButtonView: TdxBarLargeButton
      Action = ActionViewDE
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButtonAddDD: TdxBarLargeButton
      Action = ActionAddDD
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButtonChangeDD: TdxBarLargeButton
      Action = ActionChangeDD
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButtonDelDD: TdxBarLargeButton
      Action = ActionDelDD
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButtonViewDD: TdxBarLargeButton
      Action = ActionViewDD
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButtonAddIL: TdxBarLargeButton
      Action = ActionAddIL
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButtonChangeIL: TdxBarLargeButton
      Action = ActionChangeIL
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButtonDelIL: TdxBarLargeButton
      Action = ActionDelIL
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButtonViewIL: TdxBarLargeButton
      Action = ActionViewIL
      Category = 0
    end
    object BBAddSertifikat: TdxBarLargeButton
      Caption = 'AddSertifikat'
      Category = 0
      Hint = 'AddSertifikat'
      Visible = ivAlways
      ImageIndex = 1
      ShortCut = 45
      OnClick = BBAddSertifikatClick
      AutoGrayScale = False
    end
    object BBEditSertifikat: TdxBarLargeButton
      Caption = 'EditSertifikat'
      Category = 0
      Hint = 'EditSertifikat'
      Visible = ivAlways
      ImageIndex = 4
      ShortCut = 113
      OnClick = BBEditSertifikatClick
      AutoGrayScale = False
    end
    object BBDelSertifikat: TdxBarLargeButton
      Caption = 'DelSertifikat'
      Category = 0
      Hint = 'DelSertifikat'
      Visible = ivAlways
      ImageIndex = 2
      ShortCut = 46
      OnClick = BBDelSertifikatClick
      AutoGrayScale = False
    end
    object BBViewSertifikat: TdxBarLargeButton
      Caption = 'ViewSertifikat'
      Category = 0
      Hint = 'ViewSertifikat'
      Visible = ivAlways
      ImageIndex = 10
      ShortCut = 114
      OnClick = BBViewSertifikatClick
      AutoGrayScale = False
    end
    object BBCheckSertifikat: TdxBarLargeButton
      Caption = 'CheckSertifikat'
      Category = 0
      Hint = 'CheckSertifikat'
      Visible = ivAlways
      ImageIndex = 11
      OnClick = BBCheckSertifikatClick
      AutoGrayScale = False
    end
  end
  object DataSetFizlAbit: TpFIBDataSet
    Left = 369
    Top = 370
    poSQLINT64ToBCD = True
  end
  object ActionListAbitSave: TActionList
    Left = 272
    Top = 402
    object ActionSave: TAction
      Caption = 'ActionSave'
      ImageIndex = 0
      ShortCut = 16467
      OnExecute = ActionSaveExecute
    end
    object ActionExit: TAction
      Caption = 'ActionExit'
      ImageIndex = 1
      OnExecute = ActionExitExecute
    end
    object ActionDelAbit: TAction
      Caption = 'ActionDelAbit'
      OnExecute = ActionDelAbitExecute
    end
    object ActionPrintAbit: TAction
      Caption = 'ActionPrintAbit'
      ShortCut = 16464
      OnExecute = ActionPrintAbitExecute
    end
    object ActionAdminInfo: TAction
      Caption = 'ActionAdminInfo'
      SecondaryShortCuts.Strings = (
        'Ctrl+Shift+Alt+F10')
      OnExecute = ActionAdminInfoExecute
    end
  end
  object StoredProcFizlAbitOcen: TpFIBStoredProc
    Database = DataBasePrK_ABIT
    Transaction = TransactionWritePrK_ABIT
    Left = 520
    Top = 8
  end
  object DataSetConsts: TpFIBDataSet
    Left = 616
    Top = 360
    poSQLINT64ToBCD = True
  end
end
