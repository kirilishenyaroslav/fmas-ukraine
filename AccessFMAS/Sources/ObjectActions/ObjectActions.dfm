object FormObjectActions: TFormObjectActions
  Left = 192
  Top = 211
  Width = 967
  Height = 598
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1086#1073#39#1108#1082#1090#1072#1084#1080' '#1090#1072' '#1076#1110#1103#1084#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Splitter1: TSplitter
    Left = 697
    Top = 38
    Width = 2
    Height = 506
  end
  object ActionRolePanel: TPanel
    Left = 699
    Top = 38
    Width = 260
    Height = 506
    Align = alClient
    TabOrder = 1
    object Splitter2: TSplitter
      Left = 1
      Top = 240
      Width = 258
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 258
      Height = 239
      Align = alTop
      Caption = 'Panel5'
      TabOrder = 0
      object cxGrid1: TcxGrid
        Left = 1
        Top = 57
        Width = 256
        Height = 181
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object cxGrid1DBTableView1: TcxGridDBTableView
          DataController.DataSource = DataSourceActions
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderAutoHeight = True
          Styles.ContentOdd = cxStyle1
          object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
            Caption = #1044#1110#1111', '#1103#1082#1110' '#1076#1086#1089#1090#1091#1087#1085#1110' '#1076#1083#1103' '#1086#1073#39#1108#1082#1090#1072
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            SortOrder = soDescending
            Width = 105
            DataBinding.FieldName = 'NAME'
          end
          object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
            Caption = #1050#1086#1084#1077#1085#1090#1072#1088
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 135
            DataBinding.FieldName = 'FULL_NAME'
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
      object Panel9: TPanel
        Left = 1
        Top = 1
        Width = 256
        Height = 24
        Align = alTop
        BevelOuter = bvNone
        Caption = #1056#1077#1108#1089#1090#1088' '#1076#1110#1081', '#1103#1082#1110' '#1076#1086#1089#1090#1091#1087#1085#1110' '#1076#1083#1103' '#1086#1073#39#1108#1082#1090#1072
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
      end
      object Panel11: TPanel
        Left = 1
        Top = 25
        Width = 256
        Height = 32
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object SpeedButton2: TSpeedButton
          Left = 2
          Top = 2
          Width = 135
          Height = 31
          Caption = #1044#1086#1076#1072#1090#1080' '#1076#1110#1102
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            76060000424D7606000000000000360400002800000018000000180000000100
            08000000000040020000120B0000120B0000000100000000000000000000FFFF
            FF003D389A007D7AB8003830A000463DA2004C358000FF00FF00998F9000875B
            5700A478740093676200986B6600976A650089605C00936863007D5854008E62
            5A008C60590095685D0091655B00986C5F009D706000A1746200A6796400CE9D
            88006B5C5500E0BFAE00E0C1B100E0C1B200B49B8F00594D4700AF826800AA7E
            6600B89D8E00AD9588007F6E6500DCA88700CDAD9900DFBDA900BB8D6D00B487
            6A00B3978500C1926F00C7997200C3967100C99B7300B1B0AF00C2AA8A00F4DB
            BA00C2AF9500C6B59E00EDC38600EEC68D00C7A67600EEC89000EEC99500EECB
            9800F0CD9C00EFCD9C00F0CF9F00F3D3A300FEDDAC00F0D0A300D0B58F00F0D2
            A600FFE0B200F1D4A900F2D6AD00F3D7B000F3DAB600C2AE9100FFF6E900DBD3
            C800FBF3E700FCF5EB00D5B78700F1D19D00F2D2A000FEDFAF00FCDDAE00FFE0
            B100F3D8AC00F3D9AF00F4DCB500F5DEBB00F6E1BF00F5E1C000F6E3C400CCBC
            A200F8E8CE00EADBC300F9EBD400C6BBA900FAEDD800FAEFDD00FCF4E700D4CD
            C200EFCE9700E2C38F00F0CF9800DDBF8C00F0D09A00F1D3A100F2D5A300F2D6
            A700F4DBB000F5DFB900F6E4C400F7E6C900FBF2E200C9C3B900FCF6EB00CAC5
            BC00FDF8EF00CAC6BF00C7BEAD00C8C0B100F0E8D800C9C2B500CDC6B900FDFA
            F300CAC8C300FEFCF700CAC9C600FEFDFA0000660000B2E0B200B1DFB1000D9C
            18000B9516000EA41B000EA31B000EA11B000C8B16000FA61D000FA51C000F9E
            1C0017AB28001AAD2C001EB333001B952C0024B53B0028BA4100279F3D0030BF
            4C002CAF470032C1500035C655003AC75B0035B153003CC95F003ECA600042C5
            660047D26E0042C266004CD8760052DC7F0055DD81005BE48C0060EA9300B2F0
            FF00297FF9002275FF00247AFF002473F2001A67FF001B64F9001C64F2001862
            FF001154FF00145BFF001559F9001052FF00184ED900194BCD000945FF000B40
            EC000D41E6003363FF003868FF003B6BFF003F6FFF004473FF00426EF7000339
            FF00043BFF00053CFF000741FF00093EF9001144FF001547FF001648FF00194B
            FF001B4CFF002152FF002253FF002455FF002859FF002A5BFF002B5CFF002C5D
            FF00315BF200365FF1003A63F200022EEC000337FF00073AFF00083BFF000A3C
            FF000D36D3001042FF00113DF2001236C0001A45F200203FD9000225DF000521
            C6000D29D3000B23B3001E3CD9000821CD001E32C5002239CD000218C6000717
            AD000818AD001123C0000310B3000411B3000513AD000713A7000C18B300101F
            BA000811AD000E16AD000308A000070DA7000E12A4001C209F0000009A000306
            A0000508A00012129F001F20A6000A0A2900272788008F8FD300B7B7D400EFEF
            F900ECECED00F4F4F400BFBFBF00A3A3A300575757003A3A3A0007120A0A0A0A
            0A0A0A0A0A0A0A0A0A7E0A0A0C07070707070709585755545369674D64646464
            7E7E62640C0707070707071258566B546A5269684E4D667E867E63650F070707
            070707125A3C3A393837353534347E8D8C7E364C0E070707070707115E5C5A6D
            6C566B54537E92948F7E7E7E7E070707070707146E4443413F3C3B397E999C98
            938F8B89897E7E070707071370606E5F5E5C5A7E9BA09E9A97918E8B8784847E
            0707071579314646454443407E9B9F9D9A95918E8A8887827E0707167D7B7972
            4B4A7675747E969F9D7E7E7E7E8685877E070717011C1B1B2727262A77307E90
            9E7E3659107E7E85817E0718011D42514F3E3D2A716F777E8D7E5D5B0D07077E
            837E0721011DA1A1A15150227A3247477E7E30740F0707077E7E0720011D7F7F
            7FA1A1232F7C7A73717E6F780B0707077E7E0729011D7F7F7F804924FC330802
            E1DBEF030D070707077E0728011D48484861081EFBF8EEB2A6A3A2D506070707
            077E0728011D1D1D1D1F1A1EF9F4CDBCB1D2A7A4ECF0F2F20707072B01010101
            01FDFEFFF5DDCFD8E2AFE7E6D9ACA3A5F207072D01010101010101FAF6D6C0E5
            BDABAEE0B9B0ADA9A8F2072C011D1D1D1D1D1D1D04C9C5F1C6BFE4D4D1CEBAB0
            AAF2072E011D1D1D1D1D1D1D05CAB3E3DECBEAC5C2BED0CEBBF2072E01010101
            01010101F7DFB6B4D7E8EDB3C8C4C1D3CFF2072E252525252525252519F3F2B7
            B6B4E9CCB5B3C7C3DAF207070707070707070707070707F2F2F2ECEBB8B7B5DC
            F007070707070707070707070707070707070707F2F2F2F00707}
          ParentFont = False
          OnClick = SpeedButton2Click
        end
        object SpeedButton4: TSpeedButton
          Left = 137
          Top = 3
          Width = 136
          Height = 30
          Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '#1076#1110#1102
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            0E050000424D0E05000000000000CE0200002800000018000000180000000100
            08000000000040020000120B0000120B0000A6000000A600000000000000FFFF
            FF00FF00FF00C5303000C73A3A00CA414100CB444400CC464600CC474700CE4B
            4B00CE4C4C00CF4E4E00CF4F4F00CF515100D1565600D1595900D35C5C00D460
            6000D4626200D5656500D7676700D76A6A00D86C6C00D86D6D00D9727200DA75
            7500DA767600DC787800DD7F7F00DE818100E0878700E18A8A00E18C8C00E18E
            8E00E3939300E3969600E59A9A007BFAFF007DFAFF007DFAFE007EFBFF0073EE
            F60074EFF70079F7FF0079F6FC0078F4FB007BF8FF007BF8FE0074F3FE0077F6
            FF0078F6FF006FEFFE006DEAF6006AE3EF0072F0FE0073F2FE0059CFE10063E1
            F4005DD4E5005ED5E6005DD4E3005FD7E60069EAFC006AEAFC006CEBFE006CED
            FE0069E6F80057CFE50064E5FC0066E7FC0067E7FC0049BCD5005EE0FC0060E2
            FC0032B8DA004ABDD70052CEEB005ADDFB005BDDFB005CDEFB003DADCC0047C0
            E00051D4FA0053D7FB0054D7FB0054D8FB0052D1F30057D9FB0059DAFB00349F
            BF0044C4ED0044C1EA004CCFFA004ED1FA0049C6EB004FD3FA004ECCF2002497
            C1002B98C1002E9EC50034A7D10033A1C60041C6F80042C7F80041C4F40043C7
            F80044C9F80047CBFA0048CCFA0049CCFA0048CBF8004ACEFA0000A7E7002B9A
            C70036B5E9003BC0F7003DC1F8003EC2F80040C4F8003EBFF0001B81B0002DAC
            E6002BA3DA002A9ECF0032B4EF0032B2ED0036BBF70036B8F30038BDF70039BD
            F7000178B4000176B2000177B2000176B1000175B0000174AF000173AD000172
            AC000170AA000276B1000275B0000377B100087BB200116D9D00249CD7002DAB
            E7002DAAE600006FAB00006EAA000068A3000173AF0001669F00096DA4000C79
            B4000C74AD000C699A000C6798000F7BB4001680BA001A88C20000629C000562
            99000967A000095F910001538B00035A92000202020202020202028902020202
            0202020202020202020202020202020202028C968B8602020202020202020202
            0202020202020202028C7C895A629B8989890202020202020202020202020202
            8C7E90A46F4F332D3A599C8989020202020202020202028C7E7E9EA16A573F2E
            2828282C3D8F89898988020202028C7E7E7EA29A76524431282828282828273C
            78960202028C807E7E7EA59F735C483628282828282D4B7B908902028C6C6775
            817E997C036B58402628282829507A7E8702028C56545D6D69728D7E03665346
            2B28283563797E9288028C3945494D555B8D7C0304745D49302F38717F7E7E91
            84028C323741464C8D7C7E0305816D4E4247646E6974808D02028C28262B438D
            85989D03077D686065514E035F6D778D02028C28283B8D8D85978A030A038E61
            34333E03035E8D0202028C283D8D8D8D8D8294030C03704A282531030A030202
            02028C3D8D8D8D8D8D839503090B030328282A03210F030202028C8D8D8D8D8D
            8DA3A093030D0B06030303031F221403020202028D8D8D8D8D8D8D8203080C0C
            0E1115191C20231A0302020202020202028D8D8D8D030B0B0C0F12161A1D2024
            190302020202020202020202020203030A0A0F13171B1E1A0302020202020202
            0202020202020202030303031318120302020202020202020202020202020202
            02020203100C0302020202020202020202020202020202020202020305030202
            0202020202020202020202020202020202020203030202020202020202020202
            020202020202020202020203020202020202}
          ParentFont = False
          OnClick = SpeedButton4Click
        end
      end
    end
    object Panel6: TPanel
      Left = 1
      Top = 243
      Width = 258
      Height = 262
      Align = alClient
      Caption = 'Panel6'
      TabOrder = 1
      object cxGrid2: TcxGrid
        Left = 1
        Top = 53
        Width = 256
        Height = 208
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object cxGridDBTableView1: TcxGridDBTableView
          DataController.DataSource = rolesDataSource
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderAutoHeight = True
          Styles.ContentOdd = cxStyle1
          object cxGridDBColumn1: TcxGridDBColumn
            Caption = #1043#1088#1091#1087#1080' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110#1074
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            SortOrder = soAscending
            Width = 120
            DataBinding.FieldName = 'NAME'
          end
          object cxGridDBColumn2: TcxGridDBColumn
            Caption = #1050#1086#1084#1077#1085#1090#1072#1088
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 134
            DataBinding.FieldName = 'FULL_NAME'
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
      object Panel10: TPanel
        Left = 1
        Top = 1
        Width = 256
        Height = 24
        Align = alTop
        BevelOuter = bvNone
        Caption = #1056#1077#1108#1089#1090#1088' '#1075#1088#1091#1087', '#1103#1082#1080#1084' '#1076#1086#1079#1074#1086#1083#1077#1085#1110' '#1076#1110#1111
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
      end
      object Panel12: TPanel
        Left = 1
        Top = 25
        Width = 256
        Height = 28
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object SpeedButton3: TSpeedButton
          Left = 136
          Top = 0
          Width = 129
          Height = 27
          Caption = #1047#1072#1073#1086#1088#1086#1085#1080#1090#1080
          Flat = True
          Glyph.Data = {
            76060000424D7606000000000000360400002800000018000000180000000100
            0800000000004002000000000000000000000001000000010000FF00FF00044D
            7300034E7400044F75000751770007557B0005537D0004547D0088452400C14F
            1700C8521E00C54B2700C64C2700CE552500C85B2A00D4552900D95B3200D55B
            3B00E05C3800E45D3B00E85F4000E85F4400EB624800EF6E4E00F1614900F660
            4900F2644A00F5634D00F5654E00F8694F00F76A5200F7705700F8735900F679
            5900F97B5E00FA7E5C00F87F6E00D98D6A00DD8B7300EC846A00FA826100FB86
            6200FD866000FB896600FC896600FC8A6800FB8C680000009A000A5881001663
            8800006092000062950007669800096A9C00096D9F00167C9F00277396000A6E
            A1001373A200167DA100167FA4001B79A7001D73B100637EA900012AF200002C
            F600002CF8000733F6000031FE000431FE000134FF000C3CFF00123BF100103B
            F400143EF400103DFB00196FDE001E7BD2001743F6001B46F6001C47F6001D48
            F6001342FF001A47F8001847FF00174AFD001A48F9001D4BFF001A4CFF001D50
            FF00224DF100224CF400204BF800214CF800214EFC002550F4002D59F4002655
            FA002355FF002659FF002E5BF9002C5FFF00325DF1001F76E3001E7FED002678
            E200207AE600297FE200217EE8003B66F3003664FA00386BFF004071FA004274
            FF00497AFC001780A5001886AC001888AF002281AE002582AF002583B0002985
            B1002C88B3002E89B400328DB7003694DA003799DE003BA0DE001D83EC002B85
            EB002E8BEF002C91EC00379DE8002E8AF000308EF3003294F7003395F8003497
            F8003498F900379CFA00399FF900399EFD003AA1E6003DA4F3003AA0FB003CA2
            FB003EA4FB0039A0FC003FA5FC006DADCB0070AFCC0042AAF20046ADF20041A7
            FB0042A9FB0044ABFB0046ADFB0042A9FD0046ADFC0048AFFD0048B1F7004AB2
            F90049B0FD004DB4FE0090959E00A9ABAB00A7B1BD00D1998A00D7999800F096
            8100FA9A8800FAA39300F6BDB100FCCAC300F7DDD900FDDFDC00EDEDED00FEE3
            E000FCE7E400F1F1F100FEFDFD00000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000002F2F0000000000002F2F000000000000000000000000002F5549
            2F000000002F42442F0000000000000000000000002F5358492F00002F414441
            2F000000000000000000000000002F5058492F2F4244412F0000000808080808
            080808080800002F51594B4444412F00000008091218181E1F221D1818080800
            2F58524B432F00000000080A12181F292D22AA24181811082F5D5853522F0000
            0000080D15222D2D290EB1AD0E15262F64645D5D59512F000000080F172C2C2C
            0EABB4B10EA92F6E6F642F2F5F595F2F00000010212D2C290EAFB4B1252F7070
            662F00002F5F635D2F00000B0B2C290EACB0B3AE252F726D2F000000002F5F59
            2F000000000B27A8A6A4A5A70E0B2F2F0000000000002F2F00000000003F7473
            3B373B3B000000000000000000000000000000007580686C6C6A4C6775000000
            0000000000000000000000074D868888898886816A7400000000000000000000
            00000007838D909090908988826B75000000000000000000000033033E909A9A
            9A9A9090898675000000000000000000000033037D9AA39F9F9AA39090897400
            000000000000000000003303847E0497A3A39A9A908D75000000000000000000
            000036390703038EA3A3A39A9A9075000000000000000000000076763A3607A0
            A3A3A39A9A75000000000000000000000000007C9576317F97A0A3A38F750000
            00000000000000000000007895967C3831303030750000000000000000000000
            0000000000767A793D3333000000000000000000000000000000}
          OnClick = SpeedButton3Click
        end
        object SpeedButton1: TSpeedButton
          Left = 2
          Top = 0
          Width = 135
          Height = 27
          Caption = #1044#1086#1079#1074#1086#1083#1080#1090#1080
          Flat = True
          Glyph.Data = {
            76060000424D7606000000000000360400002800000018000000180000000100
            0800000000004002000000000000000000000001000000010000FF00FF000571
            0A0008750D00044D7300034E7400044F75000751770007557B0005537D000454
            7D008745240088452400C14F1700C8521E00C54B2700C64C2700CE552500C85B
            2A00D4552900D95B3200E05C3800E45D3B00E85F4000D96F4900EF6E4E00F062
            4800F2644A00F5634D00F8694F00F76A5200F7705700F8735900F6795900F97B
            5E00FA7E5C0024B53B0029B942002ABA44002EBD4A002FBF4C0033C1500034C2
            520035C3540037C5570039C659003BC85C003CC95E003FCC630040CC650045D0
            6B0046D16C0049D472004BD675004ED8790050D97B0051DA7E00D98D6A00D88D
            7200EC846A00FA826100FB866200FD866000FB896600FC886600FC8A6800FB8C
            68000A58810016638800006092000062950007669800096A9C00096D9F00167C
            9F00277396000A6EA1001373A200167DA100167FA4001B79A7001D73B100637E
            A900196FDE001E7BD2001F76E3001E7FED002678E200207AE600297FE200217E
            E8001780A5001886AC001888AF002281AE002582AF002583B0002985B1002C88
            B3002E89B400328DB70055DD810056DF850058E087003694DA003799DE003BA0
            DE001D83EC002B85EB002E8BEF002C91EC00379DE8002E8AF000308EF3003294
            F7003395F8003497F8003498F900379CFA00399FF900399EFD003AA1E6003DA4
            F3003AA0FB003CA2FB003EA4FB0039A0FC003FA5FC006DADCB0070AFCC0042AA
            F20046ADF20041A7FB0042A9FB0044ABFB0046ADFB0042A9FD0046ADFC0048AF
            FD0048B1F7004AB2F90049B0FD004DB4FE0090959E00A9ABAB00A7B1BD00D199
            8A00D7999800F9908000FA9A8800F9A68E00FAA39300FAA69A00F6BDB100FDDA
            D500F7DDD900FDDFDC00EDEDED00FEE3E000FDEEEC00F1F1F100FEFDFD000000
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
            0000000000000000000202020200000000000000000000000000000000000000
            0002242302000000000000000000000000000000000000000002262402000000
            0000000000000000000000000000000000022926020000000000000B0B0B0B0B
            0B0B0B0B0B00000000022D290200000000000B0C1419191D1E211C9302020202
            02022F2D0202020202020B0D14191E3F4021949702666537353331302D292926
            24020B10162140403F119D9902666665653533313030292926020B121840403F
            1196A09E0201010101023733020101010201001320403F3F119BA09E3895390B
            00026537020000000000000E0E3F3D11989C9F9A113F170A0002666502000000
            00000000000E3A92908E8F91110E0E0000026666020000000000000000515B5A
            4D494D4D000000000002666602000000000000005C6A5559595752545C000000
            000202020200000000000009537072727372706B575B00000000000000000000
            000000096D777A7A7A7A73726C585C00000000000000000000004505507A8484
            84847A7A73705C0000000000000000000000450567848D8989848D7A7A735B00
            0000000000000000000045056E6806818D8D84847A775C000000000000000000
            0000484B090505788D8D8D84847A5C00000000000000000000005D5D4C48098A
            8D8D8D8A845C00000000000000000000000000637F5D4369818A8D8D795C0000
            00000000000000000000005F7F80634A434242425C0000000000000000000000
            00000000005D61604F4545000000000000000000000000000000}
          OnClick = SpeedButton1Click
        end
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 544
    Width = 959
    Height = 20
    Panels = <>
    SimplePanel = True
  end
  object TreeObjects: TTreeView
    Left = 16
    Top = 416
    Width = 49
    Height = 33
    HideSelection = False
    Images = DMMain.TreeObjectImageList
    Indent = 19
    ReadOnly = True
    TabOrder = 2
    Visible = False
  end
  object TreeObjectPanel: TPanel
    Left = 0
    Top = 38
    Width = 697
    Height = 506
    Align = alLeft
    Caption = 'TreeObjectPanel'
    TabOrder = 3
    object Splitter3: TSplitter
      Left = 1
      Top = 355
      Width = 695
      Height = 3
      Cursor = crVSplit
      Align = alBottom
    end
    object ObjectTreeList: TcxDBTreeList
      Left = 1
      Top = 25
      Width = 695
      Height = 327
      Align = alClient
      Bands = <
        item
          Caption.Text = 'Band1'
          Width = 565
        end>
      BufferedPaint = False
      DataController.DataSource = TreeDataSource
      DataController.ParentField = 'ID_PARENT'
      DataController.KeyField = 'ID_OBJECT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      OptionsBehavior.CellHints = True
      OptionsBehavior.ExpandOnIncSearch = True
      OptionsBehavior.IncSearch = True
      OptionsData.CancelOnExit = False
      OptionsData.Editing = False
      OptionsData.Deleting = False
      OptionsData.CheckHasChildren = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.ExtPaintStyle = True
      OptionsView.GridLines = tlglBoth
      OptionsView.HeaderSingleLine = True
      OptionsView.Indicator = True
      OptionsView.TreeLineStyle = tllsSolid
      ParentFont = False
      RootValue = -1
      TabOrder = 0
      OnExpanded = ObjectTreeListExpanded
      OnKeyDown = ObjectTreeListKeyDown
      object cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        Caption.Text = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        DataBinding.FieldName = 'NAME'
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
        SortOrder = soAscending
        Width = 292
      end
      object cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        Caption.Text = #1050#1086#1084#1077#1085#1090#1072#1088
        DataBinding.FieldName = 'FULL_NAME'
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        Width = 204
      end
      object ObjectTreeListcxDBTreeListColumn1: TcxDBTreeListColumn
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        Caption.Text = #1057#1080#1089#1090#1077#1084#1072
        DataBinding.FieldName = 'SHORT_NAME'
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
        Width = 182
      end
      object ObjectTreeListcxDBTreeListColumn2: TcxDBTreeListColumn
        DataBinding.FieldName = 'ID_PARENT'
        Position.ColIndex = 3
        Position.RowIndex = 0
        Position.BandIndex = 0
        Visible = False
        Width = 59
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 695
      Height = 24
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = #1054#1073#39#1108#1082#1090#1080'    '
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      object Systems: TcxLookupComboBox
        Left = 60
        Top = 0
        Width = 150
        Height = 24
        ParentShowHint = False
        Properties.DropDownWidth = 180
        Properties.KeyFieldNames = 'ID_SYSTEM'
        Properties.ListColumns = <
          item
            Caption = #1057#1080#1089#1090#1077#1084#1072
            Width = 180
            FieldName = 'SHORT_NAME'
          end>
        Properties.ListSource = SysDataSource
        Properties.OnChange = SystemsPropertiesChange
        Properties.OnCloseUp = SystemsPropertiesCloseUp
        EditValue = 0
        ShowHint = True
        TabOrder = 0
      end
      object cxLabelGroup: TcxLabel
        Left = 239
        Top = 3
        Width = 53
        Height = 20
        TabOrder = 1
        Caption = #1043#1088#1091#1087#1080
      end
    end
    object CurPathPanel: TPanel
      Left = 1
      Top = 358
      Width = 695
      Height = 147
      Align = alBottom
      Caption = 'CurPathPanel'
      Constraints.MaxHeight = 147
      TabOrder = 2
      object cxDBTreeList1: TcxDBTreeList
        Left = 1
        Top = 25
        Width = 693
        Height = 296
        Styles.ContentOdd = cxStyle1
        Align = alTop
        Bands = <
          item
            Caption.Text = 'Band1'
            Width = 709
          end>
        BufferedPaint = False
        DataController.DataSource = CurDataSource
        DataController.ParentField = 'ID_PARENT'
        DataController.KeyField = 'ID_OBJECT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        OptionsBehavior.IncSearch = True
        OptionsData.CancelOnExit = False
        OptionsData.Editing = False
        OptionsData.Deleting = False
        OptionsData.CheckHasChildren = False
        OptionsSelection.CellSelect = False
        OptionsView.ExtPaintStyle = True
        OptionsView.GridLines = tlglBoth
        OptionsView.HeaderSingleLine = True
        OptionsView.Indicator = True
        OptionsView.TreeLineStyle = tllsSolid
        ParentFont = False
        RootValue = -1
        TabOrder = 0
        object cxDBTreeListColumn1: TcxDBTreeListColumn
          Caption.AlignHorz = taCenter
          Caption.AlignVert = vaCenter
          Caption.Text = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
          DataBinding.FieldName = 'NAME'
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
          Width = 169
        end
        object cxDBTreeListColumn2: TcxDBTreeListColumn
          Caption.AlignHorz = taCenter
          Caption.AlignVert = vaCenter
          Caption.Text = #1050#1086#1084#1077#1085#1090#1072#1088
          DataBinding.FieldName = 'FULL_NAME'
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
          SortOrder = soDescending
          Width = 322
        end
        object cxDBTreeListColumn3: TcxDBTreeListColumn
          Caption.AlignHorz = taCenter
          Caption.AlignVert = vaCenter
          Caption.Text = #1057#1080#1089#1090#1077#1084#1072
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
          Width = 218
        end
      end
      object Panel8: TPanel
        Left = 1
        Top = 1
        Width = 693
        Height = 24
        Align = alTop
        BevelOuter = bvNone
        Caption = #1055#1086#1090#1086#1095#1085#1072' '#1088#1086#1073#1086#1095#1072' '#1075#1110#1083#1082#1072' '#1076#1077#1088#1077#1074#1072
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
      end
    end
    object BarDockLocate: TdxBarDockControl
      Left = 1
      Top = 352
      Width = 695
      Height = 3
      Align = dalBottom
      BarManager = BarManager
    end
    object Groups: TcxLookupComboBox
      Left = 290
      Top = 3
      Width = 150
      Height = 21
      HelpType = htKeyword
      ParentFont = False
      ParentShowHint = False
      Properties.Alignment.Vert = taVCenter
      Properties.DropDownWidth = 570
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID_ROLE'
      Properties.ListColumns = <
        item
          Caption = 'f_n'
          MinWidth = 0
          Width = 0
          FieldName = 'f_n'
        end
        item
          Caption = #1043#1088#1091#1087#1072
          Width = 200
          FieldName = 'NAME'
        end
        item
          Caption = #1055#1086#1074#1085#1072' '#1085#1072#1079#1074#1072
          Width = 370
          FieldName = 'FULL_NAME'
        end
        item
          MinWidth = 0
          Width = 0
          FieldName = 'ID_ROLE'
        end>
      Properties.ListSource = GroupDataSource
      Properties.OnChange = GroupsPropertiesChange
      EditValue = -1
      ShowHint = True
      Style.Edges = [bLeft, bTop, bRight, bBottom]
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
    end
    object Users: TcxLookupComboBox
      Left = 543
      Top = 3
      Width = 150
      Height = 21
      ParentFont = False
      ParentShowHint = False
      Properties.DropDownWidth = 400
      Properties.KeyFieldNames = 'ID_USER'
      Properties.ListColumns = <
        item
          MinWidth = 0
          Width = 0
          FieldName = 'f_u'
        end
        item
          Caption = #1030#1084#39#1103
          Width = 120
          FieldName = 'NAME'
        end
        item
          Caption = #1055'.'#1030'.'#1041'.'
          Width = 280
          FieldName = 'FULL_NAME'
        end>
      Properties.ListSource = UserDataSource
      Properties.OnChange = UsersPropertiesChange
      EditValue = -1
      ShowHint = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
    end
    object cxLabelUser: TcxLabel
      Left = 445
      Top = 3
      Width = 101
      Height = 20
      TabOrder = 6
      Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110
    end
    object TextEditGroup: TcxTextEdit
      Left = 290
      Top = 3
      Width = 133
      Height = 21
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 7
      OnClick = TextEditGroupClick
    end
    object TextEditUser: TcxTextEdit
      Left = 543
      Top = 3
      Width = 133
      Height = 21
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 8
      OnClick = TextEditUserClick
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 959
    Height = 38
    AutoSize = True
    ButtonHeight = 36
    ButtonWidth = 64
    Caption = 'ToolBar1'
    Ctl3D = False
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Images = DMMain.SmallImages
    ParentFont = False
    ShowCaptions = True
    TabOrder = 4
    object ToolButton2: TToolButton
      Left = 0
      Top = 0
      Caption = #1044#1086#1076#1072#1090#1080
      ImageIndex = 1
      OnClick = ToolButton2Click
    end
    object ToolButton3: TToolButton
      Left = 64
      Top = 0
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      ImageIndex = 2
      OnClick = ToolButton3Click
    end
    object ToolButton1: TToolButton
      Left = 128
      Top = 0
      Caption = #1047#1084#1110#1085#1080#1090#1080
      ImageIndex = 5
      OnClick = ToolButton1Click
    end
    object ToolButton4: TToolButton
      Left = 192
      Top = 0
      Caption = #1054#1085#1086#1074#1080#1090#1080
      ImageIndex = 10
      OnClick = ToolButton4Click
    end
    object ToolButtonPrint: TToolButton
      Left = 256
      Top = 0
      Caption = #1044#1088#1091#1082
      ImageIndex = 9
      OnClick = ToolButtonPrintClick
    end
    object ToolButton6: TToolButton
      Left = 320
      Top = 0
      Width = 145
      Caption = 'ToolButton6'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object ToolButton5: TToolButton
      Left = 465
      Top = 0
      Caption = #1047#1072#1082#1088#1080#1090#1080
      ImageIndex = 6
      OnClick = ToolButton5Click
    end
  end
  object ActionList: TActionList
    Left = 16
    Top = 224
    object Add: TAction
      Category = 'Object'
      Caption = #1044#1086#1076#1072#1090#1080
    end
    object Edit: TAction
      Category = 'Object'
      Caption = #1047#1084#1110#1085#1080#1090#1080
    end
    object Del: TAction
      Category = 'Object'
      Caption = #1042#1080#1083#1091#1095#1080#1090#1080
    end
    object AddInObj: TAction
      Category = 'Action'
      Caption = '+ '#1074' '#1086#1073'`'#1077#1082#1090
    end
    object DelFromObj: TAction
      Category = 'Action'
      Caption = '- '#1079' '#1086#1073'`'#1077#1082#1090#1091
    end
    object AddRole: TAction
      Category = 'Role'
      Caption = ' '#1044#1086#1079#1074#1086#1083#1080#1090#1080
    end
    object DelRole: TAction
      Category = 'Role'
      Caption = ' '#1047#1072#1073#1086#1088#1086#1085#1080#1090#1080
    end
    object Print: TAction
      Caption = 'Print'
      ShortCut = 16464
      SecondaryShortCuts.Strings = (
        'F6')
      OnExecute = PrintExecute
    end
  end
  object DataSourceActions: TDataSource
    DataSet = queryActions
    Left = 48
    Top = 288
  end
  object TreeDataSource: TDataSource
    DataSet = treeFIBDataSet
    Left = 48
    Top = 256
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 40
    Top = 81
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14872561
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16445924
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15850688
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16711164
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clSilver
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle31: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle32: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle33: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle34: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle35: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14872561
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle36: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle37: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle38: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle39: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle40: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle41: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle42: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object TreeListStyleSheetDevExpress: TcxTreeListStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle16
      Styles.Content = cxStyle20
      Styles.Inactive = cxStyle24
      Styles.Selection = cxStyle28
      Styles.BandBackground = cxStyle17
      Styles.BandHeader = cxStyle18
      Styles.ColumnHeader = cxStyle19
      Styles.ContentEven = cxStyle21
      Styles.ContentOdd = cxStyle22
      Styles.Footer = cxStyle23
      Styles.IncSearch = cxStyle25
      Styles.Indicator = cxStyle26
      Styles.Preview = cxStyle27
      BuiltIn = True
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
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
  object treeFIBDataSet: TpFIBDataSet
    Database = DMMain.WorkDatabase
    Transaction = DMMain.FReadTransaction
    SelectSQL.Strings = (
      '')
    Left = 16
    Top = 257
    poSQLINT64ToBCD = True
  end
  object queryActions: TpFIBDataSet
    Database = DMMain.WorkDatabase
    Transaction = DMMain.FReadTransaction
    DataSource = TreeDataSource
    Left = 16
    Top = 289
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
    object queryActionsID_ACTION: TFIBIntegerField
      FieldName = 'ID_ACTION'
    end
    object queryActionsNAME: TFIBStringField
      FieldName = 'NAME'
      EmptyStrToNull = True
    end
    object queryActionsFULL_NAME: TFIBStringField
      FieldName = 'FULL_NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object queryActionsID_OBJECT: TFIBIntegerField
      FieldName = 'ID_OBJECT'
    end
  end
  object CurDataSet: TpFIBDataSet
    Database = DMMain.WorkDatabase
    Transaction = DMMain.FReadTransaction
    DataSource = TreeDataSource
    Left = 16
    Top = 321
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object CurDataSource: TDataSource
    DataSet = CurDataSet
    Left = 48
    Top = 321
  end
  object rolesDataSet: TpFIBDataSet
    Database = DMMain.WorkDatabase
    Transaction = DMMain.FReadTransaction
    DataSource = DataSourceActions
    Left = 16
    Top = 353
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object rolesDataSource: TDataSource
    DataSet = rolesDataSet
    Left = 48
    Top = 353
  end
  object SystemDataSet: TpFIBDataSet
    Database = DMMain.WorkDatabase
    Transaction = DMMain.FReadTransaction
    AutoUpdateOptions.KeyFields = 'ID_SYSTEM'
    Left = 16
    Top = 177
    poSQLINT64ToBCD = True
  end
  object SysDataSource: TDataSource
    DataSet = SystemDataSet
    Left = 48
    Top = 177
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 40
    Top = 110
  end
  object BarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = False
    Left = 288
    Top = 182
    DockControlHeights = (
      0
      0
      0
      0)
  end
  object GroupDataSet: TpFIBDataSet
    Database = DMMain.WorkDatabase
    Transaction = DMMain.FReadTransaction
    Left = 16
    Top = 384
    poSQLINT64ToBCD = True
  end
  object GroupDataSource: TDataSource
    DataSet = GroupDataSet
    Left = 48
    Top = 384
  end
  object UserDataSet: TpFIBDataSet
    Database = DMMain.WorkDatabase
    Transaction = DMMain.FReadTransaction
    Left = 16
    Top = 416
    poSQLINT64ToBCD = True
  end
  object UserDataSource: TDataSource
    DataSet = UserDataSet
    Left = 48
    Top = 416
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'DataSourcePrint'
    CloseDataSource = False
    DataSource = DataSourcePrint
    Left = 192
    Top = 104
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 40009.613214155100000000
    ReportOptions.LastChange = 40011.416340057900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReport1GetValue
    Left = 160
    Top = 104
    Datasets = <
      item
        DataSet = frxDBDataset2
        DataSetName = 'DataSourceActions'
      end
      item
        DataSet = frxDBDataset1
        DataSetName = 'DataSourcePrint'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 5.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Height = 34.015770000000000000
        ParentFont = False
        Top = 16.000000000000000000
        Width = 718.110700000000000000
        object Memo11: TfrxMemoView
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          HAlign = haCenter
          Memo.Strings = (
            '[REP_TITLE]')
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 168.000000000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'DataSourcePrint'
        RowCount = 0
        Stretched = True
        object Memo10: TfrxMemoView
          Top = 0.000000000000028422
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = clSilver
        end
        object Memo3: TfrxMemoView
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            ' [DataSourceMain."NAME"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 207.874150000000000000
          Width = 510.236550000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            ' [DataSourceMain."FULL_NAME"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 308.000000000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baRight
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
        end
      end
      object DetailData1: TfrxDetailData
        Height = 18.897650000000000000
        Top = 208.000000000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset2
        DataSetName = 'DataSourceActions'
        RowCount = 0
        Stretched = True
        object Memo4: TfrxMemoView
          Left = 94.488250000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDataset2
          DataSetName = 'DataSourceActions'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            ' [DataSourceDetail."NAME"]')
        end
        object Memo5: TfrxMemoView
          Left = 302.362400000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDataset2
          DataSetName = 'DataSourceActions'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            ' [DataSourceDetail."FULL_NAME"]')
        end
        object Line1: TfrxLineView
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 37.795300000000000000
        Top = 72.000000000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            ' [Name1]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 94.488250000000000000
          Top = 18.897650000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            ' [Name2]')
        end
        object Memo8: TfrxMemoView
          Left = 207.874150000000000000
          Width = 510.236550000000000000
          Height = 18.897650000000000000
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            ' [Full_Name1]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 302.362400000000000000
          Top = 18.897650000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            ' [Full_Name2]')
        end
        object Line3: TfrxLineView
          Top = 37.795300000000000000
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Line4: TfrxLineView
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line6: TfrxLineView
          Left = 718.110236220471900000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line7: TfrxLineView
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
      end
      object Footer1: TfrxFooter
        Top = 248.000000000000000000
        Width = 718.110700000000000000
        object Line2: TfrxLineView
          Width = 94.488250000000000000
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'DataSourceActions'
    CloseDataSource = False
    DataSource = DataSourcePrintAction
    Left = 224
    Top = 104
  end
  object DataSourcePrint: TDataSource
    DataSet = DataSetPrint
    Left = 192
    Top = 168
  end
  object DataSetPrint: TpFIBDataSet
    Database = DMMain.WorkDatabase
    Transaction = DMMain.FReadTransaction
    SelectSQL.Strings = (
      '')
    Left = 192
    Top = 136
    poSQLINT64ToBCD = True
  end
  object DataSetPrintAction: TpFIBDataSet
    Database = DMMain.WorkDatabase
    Transaction = DMMain.FReadTransaction
    SelectSQL.Strings = (
      'select actions.*, objects_actions.id_object'
      'from actions, objects_actions'
      'where actions.id_action=objects_actions.id_action'
      'and objects_actions.id_object=?out_id_obj')
    DataSource = DataSourcePrint
    Left = 224
    Top = 136
    poSQLINT64ToBCD = True
  end
  object DataSourcePrintAction: TDataSource
    DataSet = DataSetPrintAction
    Left = 224
    Top = 168
  end
  object RxMemoryData1: TRxMemoryData
    FieldDefs = <
      item
        Name = 'RxMemoryData_ID_PARENT_OBJ'
        DataType = ftInteger
      end>
    Left = 312
    Top = 104
  end
  object frxDBDataset3: TfrxDBDataset
    UserName = 'DataSourcePrintRole'
    CloseDataSource = False
    DataSource = DataSourcePrintRole
    Left = 256
    Top = 104
  end
  object DataSetPrintRole: TpFIBDataSet
    Database = DMMain.WorkDatabase
    Transaction = DMMain.FReadTransaction
    SelectSQL.Strings = (
      'select actions.*, objects_actions.id_object'
      'from actions, objects_actions'
      'where actions.id_action=objects_actions.id_action'
      'and objects_actions.id_object=?out_id_obj')
    DataSource = DataSourcePrintAction
    Left = 256
    Top = 136
    poSQLINT64ToBCD = True
  end
  object DataSourcePrintRole: TDataSource
    DataSet = DataSetPrintRole
    Left = 256
    Top = 168
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 160
    Top = 136
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    OpenAfterExport = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'#174
    Subject = 'FastReport'#174' PDF export'
    Background = False
    Creator = 'FastReport'#174' (http://www.fast-report.com)'
    HTMLTags = True
    Left = 160
    Top = 168
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    Left = 160
    Top = 200
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    OpenAfterExport = True
    FixedWidth = True
    Background = False
    Left = 160
    Top = 232
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    OpenAfterExport = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 160
    Top = 264
  end
end
