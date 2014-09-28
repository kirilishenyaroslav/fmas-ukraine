object frmTableSelect: TfrmTableSelect
  Left = 0
  Top = 0
  Width = 640
  Height = 115
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  ParentFont = False
  TabOrder = 0
  OnResize = FrameResize
  object OptionPageControl: TPageControl
    Left = 0
    Top = 0
    Width = 640
    Height = 76
    ActivePage = OneManPage
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object DepartmentsPage: TTabSheet
      Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083
      object SortLabel: TLabel
        Left = 376
        Top = 31
        Width = 74
        Height = 13
        Caption = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object DepartmentEdit: TEdit
        Left = 3
        Top = 4
        Width = 566
        Height = 21
        ReadOnly = True
        TabOrder = 0
        Text = #1042#1080#1073#1077#1088#1110#1090#1100' '#1087#1110#1076#1088#1086#1079#1076#1110#1083' ----->'
      end
      object DepartmentButton: TBitBtn
        Left = 568
        Top = 4
        Width = 20
        Height = 21
        Hint = #1053#1072#1090#1080#1089#1085#1110#1090#1100', '#1097#1086#1073' '#1074#1080#1073#1088#1072#1090#1080' '#1087#1110#1076#1088#1086#1079#1076#1110#1083
        Caption = '...'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = DepartmentButtonClick
      end
      object IncludingBox: TCheckBox
        Left = 3
        Top = 28
        Width = 209
        Height = 17
        Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083' '#1079' '#1091#1089#1110#1084#1072' '#1087#1110#1076#1083#1077#1075#1083#1080#1084#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
    object GroupPage: TTabSheet
      Caption = #1043#1088#1091#1087#1072' '#1087#1110#1076#1088#1086#1079#1076#1110#1083#1110#1074
      ImageIndex = 2
      object SortLabel2: TLabel
        Left = 376
        Top = 31
        Width = 74
        Height = 13
        Caption = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object GroupEdit: TEdit
        Left = 3
        Top = 4
        Width = 566
        Height = 21
        ReadOnly = True
        TabOrder = 0
        Text = #1042#1080#1073#1077#1088#1110#1090#1100' '#1075#1088#1091#1087#1091' '#1087#1110#1076#1088#1086#1079#1076#1110#1083#1110#1074' ----->'
      end
      object GroupButton: TBitBtn
        Left = 568
        Top = 4
        Width = 20
        Height = 21
        Hint = #1053#1072#1090#1080#1089#1085#1110#1090#1100', '#1097#1086#1073' '#1074#1080#1073#1088#1072#1090#1080' '#1087#1110#1076#1088#1086#1079#1076#1110#1083
        Caption = '...'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = GroupButtonClick
      end
    end
    object OneManPage: TTabSheet
      Caption = #1054#1082#1088#1077#1084#1080#1081' '#1087#1088#1072#1094#1110#1074#1085#1080#1082
      ImageIndex = 1
      object SortLabel3: TLabel
        Left = 376
        Top = 31
        Width = 74
        Height = 13
        Caption = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object FIOEdit: TEdit
        Left = 8
        Top = 4
        Width = 566
        Height = 21
        ReadOnly = True
        TabOrder = 0
        Text = #1042#1080#1073#1077#1088#1110#1090#1100' '#1086#1089#1086#1073#1080#1089#1090#1091' '#1082#1072#1088#1090#1082#1091' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1072' ------>'
      end
      object PCardButton: TBitBtn
        Left = 576
        Top = 0
        Width = 41
        Height = 29
        TabOrder = 1
        OnClick = PCardButtonClick
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000230B0000230B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFD5BFB169473169473169473169473169473169
          4731694731694731694731694731694731694731694731694731694731694731
          694731694731694731694731694731FF00FFFF00FFD5BFB1F6F1EFF4EEECF2EC
          E8F0E9E5EEE6E2EDE4DFEBE1DCEADED9E8DBD6E6D9D2E4D6CFE2D3CCE0D1C8DE
          CEC5DCCBC2DBC9BFDBC9BFDBC9BFDBC9BFDBC9BF694731FF00FFFF00FFD5BFB1
          F8F4F2F6F1EFF4EEECF2ECE8F0E9E5EEE6E2EDE4DFEBE1DCEADED9E8DBD6E6D9
          D2E4D6CFE2D3CCE0D1C8DECEC5DCCBC2DBC9BFDBC9BFDBC9BFDBC9BF694731FF
          00FFFF00FFD5BFB1FAF6F6CDDDC96AA66437823032802C32812B32802B327E2B
          337C2B398C34B3C1A4E6D9D2E4D6CFE2D3CCE0D1C8DECEC5DCCBC2DBC9BFDBC9
          BFDBC9BF694731FF00FFFF00FFD5BFB1B2D7AE3E8C323E842B43932F3E9C2D3B
          A02C3C9F2C40992D458F303680242178186DA464E6D9D2A1745CA1745CA1745C
          A1745CA1745CA1745CDBC9BF694731FF00FFFF00FFD5BFB19ACD973389224491
          303C9F2C34A9272BA2222EA52337A6293F9B2D478C30257A18428A3DE8DBD6E6
          D9D2E4D6CFE2D3CCE0D1C8DECEC5DCCBC2DBC9BF694731FF00FFFF00FFD5BFB1
          B3D9B14A983B41982E36A7292AA323379735329D2E2DA7233AA32B40912C217C
          196BA264EADED9A1745CA1745CA1745CA1745CA1745CA1745CDCCBC2694731FF
          00FFFF00FFD5BFB1E1F0E075B66C3C9C2D2DA2233490348ABC936DAC732E9929
          36A129388E296BA064CDD4C1ECE2DEEBE0DBE9DDD7E7DAD4E4D6CFE2D3CCE0D1
          C8DECEC5694731FF00FFFF00FFD5BFB1FFFFFFC4E3C251AD4A29942C4E8E8070
          A6BC5E98A23A87592684236EA566DBDDD1EFE8E3EDE5E0A1745CA1745CA1745C
          A1745CA1745CA1745CE1D2CA694731FF00FFFF00FFD5BFB1FFFFFFFFFFFFC3E1
          D45CA6B5549ECC539ED14E9ACC4990B275A09ED5DCD3F3EDEAF1EAE7EFE8E3ED
          E5E0ECE2DEEBE0DBE9DDD7E7DAD4E5D7D1E3D5CD694731FF00FFFF00FFD5BFB1
          FFFFFFFFFFFF98C6E35EA9DC5BA8DC5AA7DB56A3D8509ED35490B8CAD3D9F5F0
          EDF3EDEAF1EAE7EFE8E3EDE5E0ECE2DEEBE0DBE9DDD7E7DAD4E5D7D1694731FF
          00FFFF00FFD5BFB1FFFFFFC9E4F171B6DF61AEE162AFE360ADE15CA9DD57A4D9
          4F99CC8DACBEF7F2F1F5F0EDF3EDEAF1EAE7EFE8E3EDE5E0ECE2DEEBE0DBE9DD
          D7E7DAD4694731FF00FFFF00FFD5BFB1FFFFFFAEDDEC5BB2DC65B2E46AB6E966
          B3E661AEE15BA8DC54A1D65292B1F9F5F4F7F2F1F5F0EDF3EDEAF1EAE7EFE8E3
          EDE5E0ECE2DEEBE0DBE9DDD7694731FF00FFFF00FFD5BFB1FFFFFFAEDDEC53A7
          D056A0CE60A9D865AFE063AFE15CA8DC529ED23688ADFCF9F9FAF6F6F7F2F1F7
          A073F7A073F7A073F7A073F7A073F7A073EBE0DB694731FF00FFFF00FFD5BFB1
          FFFFFFCDEAF45BAED3529DC9569CCA559CCA569FCF509AC93A87B46DA7C1FDFC
          FCFCF9F9FAF6F6F8F4F2F6F1EFF4EEECF2ECE8F0E9E5EEE6E2EDE4DF694731FF
          00FFFF00FFD5BFB1FFFFFFFFFFFF79C6E15AACDA60A9D7559CCA4B91BE4086B2
          2D7CA5C0D9E3FFFFFFFDFCFCFCF9F9F7A073F7A073F7A073F7A073F7A073F7A0
          73EEE6E2694731FF00FFFF00FFD5BFB1FFFFFFFFFFFFFFFFFF80CAE45AB0DE52
          A1CF4693BF4990B6A9CBD9FFFFFFFFFFFFFFFFFFFDFCFCFCF9F9FAF6F6F8F4F2
          F6F1EFF4EEECF2ECE8F0E9E5694731FF00FFFF00FFD5BFB1FFFFFFFFFFFFFFFF
          FFEDF8FB7EC7E15CACD05BA9CDA6CEE0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
          FCFCFCF9F9FAF6F6F8F4F2F6F1EFF4EEECF2ECE8694731FF00FFFF00FFD5BFB1
          D5BFB1D5BFB1D5BFB1D5BFB1D5BFB1D5BFB1D5BFB1D5BFB1D5BFB1D5BFB1D5BF
          B1D5BFB1D5BFB1D5BFB1D5BFB1D5BFB1D5BFB1D5BFB1D5BFB1D5BFB1D5BFB1FF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
    end
  end
  object YearPanel: TPanel
    Left = 0
    Top = 76
    Width = 640
    Height = 39
    Align = alClient
    TabOrder = 1
    object YearCaptionLabel: TLabel
      Left = 8
      Top = 6
      Width = 23
      Height = 13
      Caption = #1056#1110#1082':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object MonthCaptionLabel: TLabel
      Left = 160
      Top = 6
      Width = 46
      Height = 13
      Caption = #1052#1110#1089#1103#1094#1100':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object WorkersCaptionLabel: TLabel
      Left = 8
      Top = 24
      Width = 76
      Height = 13
      Caption = #1055#1088#1072#1094#1110#1074#1085#1080#1082#1110#1074':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object PeopleLabel: TLabel
      Left = 86
      Top = 24
      Width = 13
      Height = 13
      Caption = '---'
    end
    object SignLabel: TLabel
      Left = 233
      Top = 24
      Width = 13
      Height = 13
      Caption = '---'
    end
    object YearEdit: TSpinEdit
      Left = 32
      Top = 1
      Width = 73
      Height = 22
      MaxValue = 2050
      MinValue = 2000
      TabOrder = 0
      Value = 2005
    end
    object MonthBox: TComboBox
      Left = 208
      Top = 2
      Width = 145
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
      TabOrder = 1
      Text = '01 - '#1089#1110#1095#1077#1085#1100
      OnChange = MonthBoxChange
      Items.Strings = (
        '01 - '#1089#1110#1095#1077#1085#1100
        '02 - '#1083#1102#1090#1080#1081
        '03 - '#1073#1077#1088#1077#1079#1077#1085#1100
        '04 - '#1082#1074#1110#1090#1077#1085#1100
        '05 - '#1090#1088#1072#1074#1077#1085#1100
        '06 - '#1095#1077#1088#1074#1077#1085#1100
        '07 - '#1083#1080#1087#1077#1085#1100
        '08 - '#1089#1077#1088#1087#1077#1085#1100
        '09 - '#1074#1077#1088#1077#1089#1077#1085#1100
        '10 - '#1078#1086#1074#1090#1077#1085#1100
        '11 - '#1083#1080#1089#1090#1086#1087#1072#1076
        '12 - '#1075#1088#1091#1076#1077#1085#1100)
    end
    object AcceptButton: TBitBtn
      Left = 360
      Top = 1
      Width = 137
      Height = 25
      Caption = #1054#1058#1056#1048#1052#1040#1058#1048' '#1044#1040#1053#1030
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = AcceptButtonClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object TableTypeBox: TComboBox
      Left = 504
      Top = 3
      Width = 129
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 3
      Text = #1047' '#1091#1089#1110#1084#1072' '#1079#1084#1110#1085#1072#1084#1080
      Items.Strings = (
        #1047' '#1091#1089#1110#1084#1072' '#1079#1084#1110#1085#1072#1084#1080
        #1055#1110#1076#1087#1080#1089#1072#1085#1080#1081)
    end
  end
  object SortBox: TComboBox
    Left = 463
    Top = 51
    Width = 169
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 2
    Text = #1079#1072' '#1090#1072#1073#1077#1083#1100#1085#1080#1084' '#1085#1086#1084#1077#1088#1086#1084
    Items.Strings = (
      #1079#1072' '#1090#1072#1073#1077#1083#1100#1085#1080#1084' '#1085#1086#1084#1077#1088#1086#1084
      #1079#1072' '#1055#1030#1041
      #1079#1075#1110#1076#1085#1086' '#1089#1091#1073#1086#1088#1076#1080#1085#1072#1094#1110#1111)
  end
  object SignQuery: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT Id_Table_Group FROM Dt_Table_Group_Insert('
      ':Kind, :Id, :Signer_Login, :Signer_FIO, :Year, :Month)')
    Left = 480
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Kind'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Signer_Login'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Signer_FIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Year'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Month'
        ParamType = ptUnknown
      end>
  end
  object SignInfo: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM Table_Find_Group(:Kind, :Id, :Year, :Month)')
    Left = 344
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Kind'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Year'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Month'
        ParamType = ptUnknown
      end>
  end
end
