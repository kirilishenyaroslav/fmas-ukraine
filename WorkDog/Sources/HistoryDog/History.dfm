object frmHistory: TfrmHistory
  Left = 276
  Top = 196
  Width = 623
  Height = 293
  Caption = #1048#1089#1090#1086#1088#1080#1103' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 49
    Width = 615
    Height = 210
    Align = alClient
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = cxGridTableViewStyleSheet1
      object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1079#1084#1110#1085#1080
        Options.Filtering = False
        Width = 142
        DataBinding.FieldName = 'time_edit'
      end
      object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
        Caption = #1055#1030#1041' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1072
        Options.Filtering = False
        Width = 156
        DataBinding.FieldName = 'full_name'
      end
      object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
        Caption = 'IP-'#1072#1076#1088#1077#1089' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1072
        Options.Filtering = False
        Width = 161
        DataBinding.FieldName = 'ip_comp'
      end
      object cxGrid1DBTableView1DBColumn4: TcxGridDBColumn
        Caption = #1052#1077#1088#1077#1078#1077#1074#1077' '#1110#1084#39#1103' '#1082#1086#1084#1087#39#1102#1090#1077#1088#1072
        Options.Filtering = False
        SortOrder = soAscending
        Width = 148
        DataBinding.FieldName = 'name_comp'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 615
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object ToolButton_view: TSpeedButton
      Left = 8
      Top = 8
      Width = 425
      Height = 33
      Caption = #1055#1077#1088#1077#1075#1083#1103#1076' '#1110#1089#1090#1086#1088#1110#1110#1111' '#1076#1086#1075#1086#1074#1086#1088#1091
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000540B0000540B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF849C786F985C6F995B6A94
        565F844C7C976EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF849C7871A75971A75974AC5B
        7BA86679A66476A361719D5C5F864A52813B557E427C976EFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF849C7871A75978B15D78
        B05E7EB36374AC5B7FAB6A7CA86779A66476A36167935352823A54863E55883F
        56843F7C976EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF849C7871A7597BB2
        607AB25E7AB25E7AB15F7EB26474AC5B82AE6D7FAB6A7CA86779A6646B975752
        823A55883F578A41598C425B8E445A8D407C976EFF00FFFF00FFFF00FF8DB47C
        82B9687FB6647CB3617CB3617BB2607BB2607FB46474AC5B84B16F82AE6D7FAB
        6A7DA9676C995952833A578A41598C425B8E445D90465E9247609449609347FF
        00FFFF00FF8FB57D87BC6B81B8667EB5637DB4627CB3617CB36180B56574AC5B
        87B47286B27083AF6D80AC6A709C5C54843B598C425B8E445D90465E92476094
        4962964A609347FF00FFFF00FF90B57F87BE6D82BA687FB6657EB5637DB4637D
        B4627FB66674AC5B87B77389B57386B27083AF6D739F5F54853C5B8E445D9046
        5E924760944962964A64984C609347FF00FFFF00FF91B88089C07085BC6B81B8
        677FB6647EB5647EB56381B56774AC5B8ABA7688B87389B57386B27075A26156
        863E5D9046C8DCBF90B87E62964A64984C669A4E609347FF00FFFF00FF93B882
        8BC27287BE6D83BA6980B7667FB6657FB66482B66974AC5B8EBE798BBB768AB8
        7489B57378A5645888405E9247FFFFFFFFFFFFFFFFFF90B87E679C4F609347FF
        00FFFF00FF94B9838DC4748ABE7085BC6B82B96780B7667FB66583B76A74AC5B
        91C17C8EBE798DBB778AB8747BA767588840609449FFFFFF64984C86B073F0F5
        EE90B87E609347FF00FFFF00FF96BB858EC6768BC27286BD6D83BA6981B86780
        B76684B86A74AC5B94C47F91C17C90BE7A8BBB777EAA6A58884062964AFFFFFF
        679B4F689D5090B87EF0F5ED609347FF00FFFF00FF97BC8693C7798BC37388BF
        6F84BB6B81B86781B86784B86B74AC5B97C78294C47F91C17C8EBE7A81AD6C58
        884065994DFFFFFF689D50699E516BA053E8F0E4609347FF00FFFF00FF97BC87
        92C87A8EC5758AC17186BD6D83BA6981B86785B96C74AC5B98C88397C78294C4
        7F91C17D84B06F588840679B4FFFFFFF699E516BA0536DA255FAFCFA609347FF
        00FFFF00FF9ABD8994CA7C8FC5778BC27287BE6E84BB6A82B96886BA6C74AC5B
        98C88398C88397C78294C47F87B372588840689D50FFFFFF6BA0536DA2556FA4
        57FFFFFF609347FF00FFFF00FF99BE8997CB7E91C7798DC4748BC07087BC6C82
        B96886BA6C74AC5B98C88398C88398C88397C78289B674588840699E51FFFFFF
        6DA2556FA45790B87EEEF4EB609347FF00FFFF00FF9ABF8A96CC7F94C87B8EC4
        768CC07286BD6D83BA6986BA6D74AC5B98C88398C88398C88398C8838BB87658
        88406BA053C8DCBFFFFFFFFFFFFFEDF4EA90B87E609347FF00FFFF00FF9BBF8B
        99CD8194CA7C90C7778AC2728ABF6F84BB6B86BA6D74AC5B98C88398C88398C8
        8398C8838BB8765888406DA2556FA45771A65973A85A75AA5C77AC5E609347FF
        00FFFF00FF9DC08C9ACE8297CB7E91C7798DC47489C07085BC6C85BB6D74AC5B
        98C88398C88398C88398C8838BB9755888406FA45771A65973A85A75AA5C78AD
        5F7AAF61609347FF00FFFF00FF9DC08C9BCF8398CC8093C97B8EC4768CC07287
        BE6D87BB6F93B88291AE858DA6858BA48387A77B84AB7258884071A65973A85A
        76AB5D78AD5F7AAF617CB263609347FF00FFFF00FF9DC08C9ED08499CD8196CA
        7D90C6788DC3758AB4788695867E798A7A72899E98A8A59FB07A72897E788981
        8E827FA56F76AB5D78AD5F7AAF617CB2637DB464609347FF00FFFF00FF9DC08C
        9FD0869ACE829ACC8393B6859FA4A1AEA7BAD7D3DEE8E7EAE8E7EAE9E8EBE8E7
        EAE8E7EAE8E7EAD7D3DEADA7BB9CA09D84A7767CB2637DB4647EB565609347FF
        00FFFF00FF9FC18DA1CF8B97B28D9EA1A2BDB8C7D7D3DEE8E7EAE8E7EAE2E0E5
        BDB8C79FA4A19FA4A1BDB8C7E1DFE4E8E7EAE8E7EAD7D3DEBEB9C89C9E9F84A3
        797EB565609347FF00FFFF00FFFF00FFBDB8C7B7B3BFB7B3BFD7D3DEE8E7EAEA
        E9ECB7B3BFBDB8C7FF00FFFF00FFFF00FFFF00FFBDB8C7B7B3BFE9E8EBE8E7EA
        BDB8C7B7B3BFB7B3BFBDB8C7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFBDB8C7B7B3BFBDB8C7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFBDB8C7B7B3BFBDB8C7FF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentFont = False
      OnClick = ToolButton_viewClick
    end
    object ToolButton_del: TSpeedButton
      Left = 448
      Top = 8
      Width = 153
      Height = 33
      Caption = #1042#1080#1093#1110#1076
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B4E1E
        1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4B
        8C4B4B914B4B4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4B89
        4B4B9C4B4CB64B4CBD4B4C9F4B4C4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B
        4B9A4D4EAF4E4FC14E4FC04D4EBF4C4DBF4C4D9F4B4C4E1E1F994B4B824B4B82
        4B4B824B4B824B4B824B4B824B4B824B4B824B4BFF00FFFF00FFFF00FFFF00FF
        FF00FF824B4BC55455C95455C75354C65253C55152C45051C24F50A04C4D4E1E
        1FFE8B8CFC9293FB9A9CFAA3A4F8AAABF7B1B1F7B5B6F7B5B6824B4BFF00FFFF
        00FFFF00FFFF00FFFF00FF824B4BCE5859CC5758CB5657CA5556C95455C75354
        C65253A34E4F4E1E1F3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5
        B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BD15B5CD05A5BCF595ACE
        5859CC5758CB5657CA5556A550504E1E1F3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C
        1EBC4C1EBC4CF7B5B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BD55E
        5FD55E5FD45D5ED35C5DD15B5CD05A5BCF595AA651524E1E1F3F9E4C1EBC4C1E
        BC4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5B6824B4BFF00FFFF00FFFF00FFFF00FF
        FF00FF824B4BDA6364D96263D86062D75F60D55E5FD45D5ED35C5DA953544E1E
        1F3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5B6824B4BFF00FFFF
        00FFFF00FFFF00FFFF00FF824B4BDE6667DD6566DC6465DA6364D96263D86062
        D75F60AB55554E1E1F3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5
        B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BE2696AE16869E06768DE
        6667E06D6EE69091DC6465AC56574E1E1F58A55B1EBC4C1EBC4C1EBC4C1EBC4C
        1EBC4C1EBC4CF7B5B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BE76D
        6EE66C6DE56B6CE36A6BEEA6A7FFFFFFEB9C9CAF58594E1E1FEECEAFB7EBAA5E
        D3775ED37745CA6745CA6745CA67F7B5B6824B4BFF00FFFF00FFFF00FFFF00FF
        FF00FF824B4BEB7072EA6F70E96E6FE76D6EF2A9AAFFFFFFEB9596B15A5A4E1E
        1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3D9F6BDD9F6BDF7B5B6824B4BFF00FFFF
        00FFFF00FFFF00FFFF00FF824B4BEF7475EE7374ED7273EB7072EA6F70EF9091
        E76D6EB25B5C4E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5
        B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BF37778F37778F27677F0
        7576EF7475EE7374ED7273B55D5D4E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3
        FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BF87B
        7DF77A7BF6797AF47879F37778F27677F07576B75F5F4E1E1FEECEAFFFFFD3FF
        FFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00FFFF00FFFF00FF
        FF00FF824B4BFC7F80FB7E7FFA7D7EF87B7DF77A7BF6797AF47879B860624E1E
        1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF
        00FFFF00FFFF00FFFF00FF824B4BFF8182FF8182FE8081FC7F80FC7F80FB7E7F
        FA7D7EBB63634E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5
        B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BFF8182FF8182FF8182FF
        8182FF8182FE8081FE8081BD65654E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3
        FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BF77E
        7FFF8182FF8182FF8182FF8182FF8182FF8182BF66664E1E1FEECEAFFFFFD3FF
        FFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00FFFF00FFFF00FF
        FF00FF824B4B824B4BAF5E5FD56F70FF8182FF8182FF8182FF8182BF66664E1E
        1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4B915152B66263EE7A7B
        FF8182BF66664E1E1F914B4B824B4B824B4B824B4B824B4B824B4B824B4B824B
        4B824B4BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF824B4B824B4B9855559F58584E1E1FFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B4E1E1FFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentFont = False
      OnClick = ToolButton_delClick
    end
  end
  object cxStyleRepository2: TcxStyleRepository
    Left = 112
    Top = 112
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
  object pFIBDataSet: TpFIBDataSet
    SelectSQL.Strings = (
      'select * from dog_dt_history_info(:id_dog)')
    Left = 80
    Top = 112
    poSQLINT64ToBCD = True
  end
  object DataSource: TDataSource
    DataSet = pFIBDataSet
    Left = 144
    Top = 112
  end
  object pFIBDatabase: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 112
  end
  object pFIBTransactionRead: TpFIBTransaction
    TimeoutAction = TACommit
    Left = 48
    Top = 112
  end
end
