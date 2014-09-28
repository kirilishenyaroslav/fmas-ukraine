object fmBankSchMainForm: TfmBankSchMainForm
  Left = 179
  Top = 63
  BorderStyle = bsDialog
  Caption = 'fmBankSchMainForm'
  ClientHeight = 566
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 177
    Align = alTop
    TabOrder = 1
    DesignSize = (
      792
      177)
    object SpeedButton1: TSpeedButton
      Left = 472
      Top = 112
      Width = 137
      Height = 22
      Action = ActionRefresh
      Flat = True
      Glyph.Data = {
        7A040000424D7A040000000000005A0300002800000010000000120000000100
        08000000000020010000C20E0000C20E0000C9000000C900000000000000FFFF
        FF009E707000A07272009E717000B08580009D706A00A77A7400875D5600F8AD
        A100AC7E7600AB7D7500AC7F7700AA7E7600B1847C00B1857D00B1857E00AF84
        7D00AE857E00AA837C00B3887F00B0857D00FFCAC000B3938C00B39690009773
        6B00C4A7A0009C736800C5938200B48A7C00CAACA100C0A49800BC9F9000BB9F
        9000C3AEA200C29C8400C9AA9700FCDAC600FCDBC700FCDCC800BF927400FFD4
        B600FED6BC00FEDAC100C6AA9800D1B4A100FFDDC600FCDBC400FEDFCA00C79A
        7A00FDCFAD00FED7B900FAD3B600FED7BA00FAD5BA00D2B5A000FFDEC600FDE1
        CC00F6CFB000D09E7300F1CDAE00DBBDA300F1DCCA00FFECDB00E7C29D00F5CE
        A800FCD8B600DCC9B600FEEBD800FFFCF900D4975200FFD7AC00E2C4A400E1C3
        A300E2C5A500E6C9A900E8CBAC00FEE7CD00FFE8D000FFEAD300DECCB800FAD5
        A700FDD8AD00FDDDB700DDC1A100DCC0A000E1C6A500DEC3A300E2C6A600FFEE
        D900F8D4A600FFDCAF00F6DAB100F7E6CD00F6D6A200F4E2C300FFF4E000FFFB
        F400FFFCF700FBF4E600F4E1B600F0DEB600FFF6E200FFF2D400FFF9EA00F9F1
        DA00FFFAEC00F0E5C400ECE8D600D5CD9800EBE9DC00D9D29D00D7D1A100E9E3
        AF00F5F3DF00E3E1B900FEFEF800FFFFFD00FFFFFE00E4E6BE00A3A87D00F2F7
        E500C5D59F00EDF3DF00ECEFE500EFF1EA00AFC79100EFF5E900DCEBCE00AAD0
        8D00C0DEAA00E2EFD800AAD48F00A5CC8B00ABCF9200A9D38F009CCC8100C2E3
        B200CDE6C000B3DCA300AAD89900E9F4E500E6F7E100EFF8EC00F4FAF200FBFE
        FA0068B454009CCE91005FB54F004AB0390053B4430048AD3A0049B13C0051B1
        43009AD192005DB95300AFDEAA002FA826003AAA35005FC059005FB45B00269D
        230036AD33008AD38800009D0000009A00000099000000980000009500000094
        00000093000000910000019D01000DA10B0018A519001DA41C00F8FCF800029B
        05000D9F110012A4140021AA250063BB640010A016002FA333008FCF910049B9
        5100C4EBCC00F6FDFA00F7FFFC00F3FBF800F4FAF800F6FDFB00FAFEFD00F9FE
        FD00F9FFFE00F4FBFB00FAFFFF00FBFFFF00F6FAFA00C8D0D400FFFFFF00C7C7
        C7C7C7C7C7C7C7C7C7C7C7C7C7C7C719140E0E0E0F0F10151213051D08C7C717
        3E2F2526362A29343A3C413206C7C7186C6777734F64715352515E4203C7C720
        6E60889B8697B792705B5A3304C7C7217C6A87A5B1A7A4AAA16D473502C7C71F
        7D618CA9A7B6937E9D945C3804C7C71A7F628BACADAF996B5FA06F2E07C7C71E
        9079806372694D443F5D652B0BC7C737C68EA37B45829596987A4E390DC7C72D
        BE75B8B98368B5AAAB8159300CC7C73DBB018D9EAE9FA2A6A884662711C7C749
        BFB001BAB4A8A9B3B28516090AC7C74AC4B0B0018F9C9A8A89781C281BC7C74B
        C2B0B0B0910101747624463122C7C74CC5C4C4C4C0C1C3BDBC2C3B43C7C7C740
        5658585848495455572350C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7}
    end
    object cxGroupBox1: TcxGroupBox
      Left = 8
      Top = 3
      Width = 777
      Height = 105
      Alignment = alTopLeft
      Anchors = [akLeft, akTop, akRight]
      Caption = #1041#1072#1083'. '#1089#1095#1077#1090
      TabOrder = 0
      object cxTextEdit1: TcxTextEdit
        Left = 16
        Top = 32
        Width = 217
        Height = 21
        ParentColor = True
        Properties.ReadOnly = True
        TabOrder = 0
      end
      object cxTextEdit2: TcxTextEdit
        Left = 16
        Top = 72
        Width = 353
        Height = 21
        TabStop = False
        ParentColor = True
        Properties.ReadOnly = True
        TabOrder = 1
      end
    end
    object cxGroupBox2: TcxGroupBox
      Left = 408
      Top = 3
      Width = 377
      Height = 105
      Alignment = alTopLeft
      Anchors = [akTop, akRight]
      Caption = #1056#1072#1089#1095'. '#1089#1095#1077#1090
      TabOrder = 1
      Visible = False
      object cxTextEdit3: TcxTextEdit
        Left = 16
        Top = 32
        Width = 201
        Height = 21
        Properties.ReadOnly = True
        TabOrder = 0
      end
      object cxTextEdit4: TcxTextEdit
        Left = 16
        Top = 72
        Width = 105
        Height = 21
        TabStop = False
        ParentColor = True
        Properties.ReadOnly = True
        TabOrder = 1
      end
      object cxTextEdit5: TcxTextEdit
        Left = 128
        Top = 72
        Width = 241
        Height = 21
        TabStop = False
        ParentColor = True
        Properties.ReadOnly = True
        TabOrder = 2
      end
    end
    object cxLabel1: TcxLabel
      Left = 0
      Top = 136
      Width = 791
      Height = 38
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Style.BorderStyle = ebsSingle
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Times New Roman'
      Style.Font.Style = [fsBold]
      Style.Shadow = False
      TabOrder = 2
    end
    object cxRadioButton1: TcxRadioButton
      Left = 184
      Top = 12
      Width = 185
      Height = 17
      Caption = 'cxRadioButton1'
      TabOrder = 3
      Visible = False
      OnClick = cxRadioButton1Click
    end
    object cxRadioButton2: TcxRadioButton
      Left = 576
      Top = 13
      Width = 137
      Height = 17
      Caption = 'fgfggfgfgf'
      Checked = True
      TabOrder = 4
      TabStop = True
      Visible = False
      OnClick = cxRadioButton2Click
    end
    object cxDateEdit1: TcxDateEdit
      Left = 344
      Top = 112
      Width = 121
      Height = 21
      TabOrder = 5
    end
    object cxLabel2: TcxLabel
      Left = 8
      Top = 114
      Width = 329
      Height = 17
      AutoSize = False
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 6
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 177
    Width = 792
    Height = 351
    Align = alClient
    BevelKind = bkFlat
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object cxGrid1DBBandedTableView1: TcxGridDBBandedTableView
      OnDblClick = cxGrid1DBBandedTableView1DblClick
      OnKeyDown = cxGrid1DBBandedTableView1KeyDown
      DataController.DataSource = DataSource1
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnCustomDrawCell = cxGrid1DBBandedTableView1CustomDrawCell
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyleYellow
      Styles.Content = cxStyleYellow
      Styles.ContentEven = cxStyleYellow
      Styles.ContentOdd = cxStyleYellow
      Styles.Inactive = cxStyle4
      Styles.IncSearch = cxStyle14
      Styles.Selection = cxStyle17
      Styles.FilterBox = cxStyleBorder
      Styles.Footer = cxStyleBorder
      Styles.Group = cxStyleYellow
      Styles.GroupByBox = cxStyleYellow
      Styles.Header = cxStyleBorder
      Styles.Indicator = cxStyleYellow
      Styles.NewItemRowInfoText = cxStyleYellow
      Styles.Preview = cxStyleYellow
      Styles.BandBackground = cxStyleBorder
      Styles.BandHeader = cxStyleBorder
      Bands = <
        item
          Width = 356
        end>
      object cxGrid1DBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn
        Width = 141
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'KOD_RAS'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn
        Width = 76
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'MFO'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn7: TcxGridDBBandedColumn
        Width = 139
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'NAME_MFO'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBBandedTableView1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 528
    Width = 792
    Height = 38
    Align = alBottom
    TabOrder = 2
    object cxButton1: TcxButton
      Left = 616
      Top = 6
      Width = 145
      Height = 25
      Action = ActionClose
      TabOrder = 0
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF009C3100009C310000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FFEFA500FFEFA5005A3118005A31
        1800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FFEFA500FFEFA500FFE78C00FFE7
        8C0031313100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF633100FFEFA500FFEFA500FFE78C00FFE7
        8C00FFC65A00313131009C3100009C310000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF31FF00FF633100FFEFA500FFEFA500FFE78C00FFE7
        8C00FFC65A00FF9C0000FF9C63009C310000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF633100FFEFA500FFEFA500000000000808
        0800FFC65A00FF9C0000FF9C63009C310000FF00FF00FF00FF00FF00FF00FF00
        FF0008080800FF00FF00FF00FF00FF633100FFEFA500FFEFA500FFDE8400FFDE
        8400FFC65A00FF9C0000FF9C63009C310000FF00FF00FF00FF00FF00FF00FF00
        FF0000000000FF00FF00FF00FF00FF633100F7FFFF00FFDE8400FFDE8400FFDE
        8400FFC65A00FF9C0000FF9C63009C310000FF00FF00FF00FF0000000000FFFF
        CE00FFFFBD00FFC65A00FFA51000FF9C0000F7FFFF00FFEFA500FFDE8400FFDE
        8400FFC65A00FF9C0000FF9C63009C310000FF00FF00FF00FF00FF00FF000000
        000000000000000000000000000008080800F7FFFF00FFFFFF00FFDE8400FFDE
        8400FFC65A00FF9C0000FF9C63009C310000FF00FF00FF00FF00FF00FF00FF00
        FF0000000000FF00FF00FF00FF00FF633100F7FFFF00FFFFFF00FFDE8400FFDE
        8400FFC65A00FF9C0000FF9C63009C310000FF00FF00FF00FF00FF00FF00FF00
        FF0000000000FF00FF00FF31FF00FF633100C65A0000FFFFFF00FFDE8400FFDE
        8400FFC65A00FF9C0000FF9C00009C310000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF633100FFD67300C65A0000C65A0000CE63
        6300FFC65A00FF9C0000FF9C00009C310000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF633100FFD67300FFD67300FFD67300C65A
        0000CE636300FF9C0000FF9C00009C310000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF633100FFDE8400FFDE8400FFDE8400FFDE
        8400C65A0000C65A0000C65A00009C310000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF633100FF633100FF633100FF633100FF63
        3100FF633100FF633100FF633100FF633100FF00FF00FF00FF00}
      UseSystemPaint = False
    end
    object cxButton2: TcxButton
      Left = 144
      Top = 6
      Width = 121
      Height = 25
      Action = ActionDelete
      TabOrder = 1
      Visible = False
      Glyph.Data = {
        82010000424D820100000000000092000000280000000E0000000F0000000100
        080000000000F0000000C20E0000C20E0000170000001700000000000000FFFF
        FF008C5A5A009C6B6B00B58C8C009C6B6300C68C7B00F7DECE00FFE7D600F7DE
        C600EFDECE00F7E7D600FFD6A500F7DEBD00F7E7CE00FFF7E700F7EFDE00FFFF
        F700C8D0D4000000FF00000084006C6CFF00FFFFFF0012120402020202020202
        02020202000012120410070909090909090A1002000012120410070909090909
        090A100200001212040F0C0C0C0C0C0C0C0C0E0200001213040F090909090909
        0D0E0E02000012131410070909090909130A0A020000121213140C0C0C0C0C14
        130C0A050000121215140909090914130D0E0A03000012120413140909141309
        090B0A03000012120411131414130C0C0C0C0A03000012120411131313080808
        0404040300001212041314131401111104010612000012131314010113140101
        0406121200001313040404040413140404121212000012121212121212121313
        121212120000}
      UseSystemPaint = False
    end
    object cxButton3: TcxButton
      Left = 344
      Top = 6
      Width = 249
      Height = 25
      Action = ActionAdd
      TabOrder = 2
      Glyph.Data = {
        AE010000424DAE01000000000000AE000000280000000F000000100000000100
        08000000000000010000C30E0000C30E00001E0000001E00000000000000FFFF
        FF008C5A5A009C6B6B00BD848400B58C8C00BDADAD00D6C6C600EFDEDE009C6B
        6300A57B7300C68C7B00F7DECE00FFE7D600F7DEC600EFDECE00FFF7EF00F7E7
        D600FFD6A500EFB56B00F7DEBD00F7E7CE00FFF7E700F7EFDE00FFFFF7004C80
        4C0052AE570069CA8000C8D0D400FFFFFF001C1C1C1C05020202020202020202
        1C001C1C1C1C051617171717171715021C001C1C1C1C05170C0E0E0E0E0F0F02
        1C001C1C1C1C05161212121212120F021C000502020205100E0E0E0E14150F09
        1C00051617170510150E0E0E0E110F031C0005170C0E0518121212191919190A
        1C000516121205180D0D11191A1A190A1C0005100E0E0501011919191A1A1919
        19000510150E050101191A1A1A1A1A1A190005181212050101191B1B1B1A1A1A
        190005180D0D0505051919191B1A19191900050101011818080706191B1A191C
        1C00050101011818050505191919191C1C0005010101010105130B1C1C1C1C1C
        1C0005050505050505041C1C1C1C1C1C1C00}
      UseSystemPaint = False
    end
  end
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'password=masterkey'
      'user_name=SYSDBA')
    DefaultTransaction = TransactionRead
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 336
    Top = 280
  end
  object DataSetTemp: TpFIBDataSet
    Database = Database
    Transaction = TransactionRead
    Left = 376
    Top = 280
    poSQLINT64ToBCD = True
  end
  object TransactionRead: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 416
    Top = 280
  end
  object StyleRepository: TcxStyleRepository
    Left = 72
    Top = 152
    object cxStyle4: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
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
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyleYellow: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15204351
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyleFontBlack: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyleMalin: TcxStyle
      AssignedValues = [svColor]
      Color = 4194368
    end
    object cxStyleBorder: TcxStyle
      AssignedValues = [svColor]
      Color = clInactiveBorder
    end
    object cxStylemalinYellow: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 4194368
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15204351
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyleGrid: TcxStyle
      AssignedValues = [svColor]
      Color = 10485760
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle4
      Styles.Content = cxStyle5
      Styles.ContentEven = cxStyle6
      Styles.ContentOdd = cxStyle7
      Styles.Inactive = cxStyle13
      Styles.IncSearch = cxStyle14
      Styles.Selection = cxStyle17
      Styles.FilterBox = cxStyle8
      Styles.Footer = cxStyle9
      Styles.Group = cxStyle10
      Styles.GroupByBox = cxStyle11
      Styles.Header = cxStyle12
      Styles.Indicator = cxStyle15
      Styles.Preview = cxStyle16
      BuiltIn = True
    end
  end
  object DataSetData: TpFIBDataSet
    Database = Database
    Transaction = TransactionRead
    SelectSQL.Strings = (
      'SELECT * FROM BANK_SELECT_RASCH_SCH('#39'01.01.2005'#39', '#39'01.01.2005'#39')')
    Left = 384
    Top = 440
    poSQLINT64ToBCD = True
    object DataSetDataID_RAS_SCH: TFIBBCDField
      FieldName = 'ID_RAS_SCH'
      Size = 0
      RoundByScale = True
    end
    object DataSetDataID_SCH: TFIBBCDField
      FieldName = 'ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object DataSetDataKOD_SCH: TFIBStringField
      FieldName = 'KOD_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetDataTITLE_SCH: TFIBStringField
      FieldName = 'TITLE_SCH'
      Size = 180
      EmptyStrToNull = True
    end
    object DataSetDataKOD_RAS: TFIBStringField
      FieldName = 'KOD_RAS'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetDataBLOKED: TFIBStringField
      FieldName = 'BLOKED'
      Size = 10
      EmptyStrToNull = True
    end
    object DataSetDataOPEN_SCH: TFIBDateField
      FieldName = 'OPEN_SCH'
    end
    object DataSetDataMFO: TFIBStringField
      FieldName = 'MFO'
      Size = 16
      EmptyStrToNull = True
    end
    object DataSetDataNAME_MFO: TFIBStringField
      FieldName = 'NAME_MFO'
      Size = 80
      EmptyStrToNull = True
    end
    object DataSetDataNAME_TYPE_ACCOUNT: TFIBStringField
      FieldName = 'NAME_TYPE_ACCOUNT'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetDataWHO_BLOCKED: TFIBStringField
      FieldName = 'WHO_BLOCKED'
      Size = 62
      EmptyStrToNull = True
    end
    object DataSetDataWHO_CLOSED: TFIBStringField
      FieldName = 'WHO_CLOSED'
      Size = 62
      EmptyStrToNull = True
    end
    object DataSetDataDATE_RAS_BEG: TFIBDateField
      FieldName = 'DATE_RAS_BEG'
    end
    object DataSetDataDATE_RAS_END: TFIBDateField
      FieldName = 'DATE_RAS_END'
    end
    object DataSetDataMONTH_OPEN: TFIBStringField
      FieldName = 'MONTH_OPEN'
      EmptyStrToNull = True
    end
    object DataSetDataID_SVYAZKA: TFIBBCDField
      FieldName = 'ID_SVYAZKA'
      Size = 0
      RoundByScale = True
    end
  end
  object DataSource1: TDataSource
    DataSet = DataSetData
    Left = 424
    Top = 440
  end
  object Timer1: TTimer
    Interval = 800
    OnTimer = Timer1Timer
    Left = 584
    Top = 200
  end
  object ActionList1: TActionList
    Left = 544
    Top = 280
    object ActionClose: TAction
      Caption = 'ActionClose'
      ShortCut = 27
      OnExecute = ActionCloseExecute
    end
    object ActionAdd: TAction
      Caption = 'ActionAdd'
      ShortCut = 121
      OnExecute = ActionAddExecute
    end
    object ActionDelete: TAction
      Caption = 'ActionDelete'
      OnExecute = ActionDeleteExecute
    end
    object ActionTake: TAction
      Caption = 'ActionTake'
      OnExecute = ActionTakeExecute
    end
    object ActionRefresh: TAction
      ShortCut = 116
      OnExecute = ActionRefreshExecute
    end
  end
  object TransactionWrite: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 64
    Top = 280
  end
  object DataSetWrite: TpFIBDataSet
    Database = Database
    Transaction = TransactionRead
    Left = 112
    Top = 288
    poSQLINT64ToBCD = True
  end
end
