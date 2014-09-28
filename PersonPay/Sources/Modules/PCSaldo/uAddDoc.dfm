object AddDocForm: TAddDocForm
  Left = 351
  Top = 230
  Width = 728
  Height = 484
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 712
    Height = 34
    Align = alTop
    TabOrder = 0
    object lbl10: TLabel
      Left = 12
      Top = 9
      Width = 49
      Height = 13
      Caption = #1056#1072#1093#1091#1085#1086#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl20: TLabel
      Left = 224
      Top = 12
      Width = 48
      Height = 13
      Caption = #1044#1086#1075#1086#1074#1110#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxNameKrSch: TcxButtonEdit
      Left = 63
      Top = 6
      Width = 132
      Height = 21
      BeepOnEnter = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxNameKrSchPropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object cxDogEdit: TcxButtonEdit
      Left = 282
      Top = 9
      Width = 423
      Height = 21
      BeepOnEnter = False
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxDogEditPropertiesButtonClick
      TabOrder = 1
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 405
    Width = 712
    Height = 41
    Align = alBottom
    TabOrder = 3
    object OkButton: TcxButton
      Left = 267
      Top = 9
      Width = 130
      Height = 25
      Action = actOk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        2000000000000008000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000066000000660000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF006565650065656500FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00006600001EB231001FB1330000660000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00656565009A9A9A009A9A9A0065656500FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000066000031C24F0022B738001AB02D0021B4370000660000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0065656500ABABAB009E9E9E00979797009C9C9C0065656500FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000066000047D36D003BCB5E0025A83B00006600001BA92E001DB132000066
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0065656500BFBFBF00B5B5B500989898006565650094949400999999006565
        6500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000066
        00004FD6790053DE7F0031B54D0000660000FF00FF0000660000179D27001EAE
        310000660000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF006565
        6500C4C4C400CACACA00A5A5A50065656500FF00FF00656565008C8C8C009898
        980065656500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000066000041C5630000660000FF00FF00FF00FF00FF00FF00FF00FF000066
        000019AA2B0000660000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0065656500B5B5B50065656500FF00FF00FF00FF00FF00FF00FF00FF006565
        65009393930065656500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000660000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0000660000149D210000660000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0065656500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00656565008A8A8A0065656500FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000066000000660000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF006565650065656500FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000066000000660000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF006565650065656500FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      NumGlyphs = 2
      UseSystemPaint = False
    end
    object CancelButton: TcxButton
      Left = 409
      Top = 7
      Width = 130
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
      OnClick = CancelButtonClick
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00009A00009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A0000
        9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
        00009A174AFD103BF400009AFF00FFFF00FFFF00FFFF00FF00009A002CF80030
        FC00009AFF00FFFF00FFFF00FFFF00FF6B6B6BA8A8A8A0A0A06B6B6BFF00FFFF
        00FFFF00FFFF00FF6B6B6B9A9A9A9C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FF
        00009A1A47F81A4CFF123BF100009AFF00FFFF00FF00009A012DF60132FF002A
        F300009AFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7AAAAAA9F9F9F6B6B6BFF
        00FFFF00FF6B6B6B9999999E9E9E9797976B6B6BFF00FFFF00FFFF00FFFF00FF
        FF00FF00009A1C47F61B4DFF143EF400009A00009A002DF80134FF032BF20000
        9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ABABABA2A2A26B
        6B6B6B6B6B9A9A9A9E9E9E9898986B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00009A1D48F61D50FF103DFB0431FE0132FF002CF600009AFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ACACACA3
        A3A39F9F9F9E9E9E9999996B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00009A1A48F91342FF0C3CFF0733F600009AFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7A7
        A7A7A3A3A39C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00009A214EFC1D4BFF1847FF1743F600009AFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BACACACAC
        ACACA9A9A9A4A4A46B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00009A2E5BF92C5FFF224DF8204BF82355FF1B46F600009AFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB1B1B1B3B3B3AB
        ABABAAAAAAAFAFAFA6A6A66B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00009A3664FA386BFF2D59F400009A00009A224CF42558FF1D49F60000
        9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB6B6B6B9B9B9AEAEAE6B
        6B6B6B6B6BA9A9A9B0B0B0A7A7A76B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
        00009A4071FA4274FF325DF100009AFF00FFFF00FF00009A224DF1275AFF204C
        F800009AFF00FFFF00FFFF00FFFF00FF6B6B6BBBBBBBBEBEBEAFAFAF6B6B6BFF
        00FFFF00FF6B6B6BA7A7A7B1B1B1AAAAAA6B6B6BFF00FFFF00FFFF00FFFF00FF
        00009A497AFC3B66F300009AFF00FFFF00FFFF00FFFF00FF00009A2550F42655
        FA00009AFF00FFFF00FFFF00FFFF00FF6B6B6BC0C0C0B5B5B56B6B6BFF00FFFF
        00FFFF00FFFF00FF6B6B6BAAAAAAAEAEAE6B6B6BFF00FFFF00FFFF00FFFF00FF
        FF00FF00009A00009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A0000
        9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
      UseSystemPaint = False
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 65
    Width = 712
    Height = 340
    Align = alClient
    TabOrder = 2
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = ds
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          FieldName = 'DB_SUMMA'
          Column = cxgrdbclmnDB_Sum
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          FieldName = 'KR_SUMMA'
          Column = cxgrdbclmnKR_Sum
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = cxGrid1DBTableView1FocusedRecordChanged
      OptionsSelection.CellSelect = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle13
      Styles.Content = cxStyle13
      Styles.Header = cxStyle2
      object cxgrdbclmnSmeta: TcxGridDBColumn
        Caption = #1050#1086#1096#1090#1086#1088#1080#1089
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'SM_KOD'
      end
      object cxgrdbclmnRz: TcxGridDBColumn
        Caption = #1056#1086#1079#1076#1110#1083
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'RZ_KOD'
      end
      object cxgrdbclmnSt: TcxGridDBColumn
        Caption = #1057#1090#1072#1090#1090#1103
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'ST_KOD'
      end
      object cxgrdbclmnKEKV: TcxGridDBColumn
        Caption = #1050#1045#1050#1042
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'KEKV_KOD'
      end
      object cxgrdbclmnDB_Sum: TcxGridDBColumn
        Caption = #1044#1077#1073#1077#1090#1086#1074#1072' '#1089#1091#1084#1072
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'DB_SUMMA'
      end
      object cxgrdbclmnKR_Sum: TcxGridDBColumn
        Caption = #1050#1088#1077#1076#1080#1090#1086#1074#1072' '#1089#1091#1084#1072
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'KR_SUMMA'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 34
    Width = 712
    Height = 31
    Align = alTop
    TabOrder = 1
    object lbl1: TLabel
      Left = 140
      Top = 8
      Width = 45
      Height = 13
      Caption = #1042#1072#1083#1102#1090#1072
      Visible = False
    end
    object lbl2: TLabel
      Left = 275
      Top = 8
      Width = 29
      Height = 13
      Caption = #1050#1091#1088#1089
      Visible = False
    end
    object Label1: TLabel
      Left = 436
      Top = 8
      Width = 91
      Height = 13
      Caption = #1044#1086#1076#1072#1090#1080' '#1089#1091#1084#1091' '#1091' '
      Visible = False
    end
    object AddBut: TcxButton
      Left = 1
      Top = 2
      Width = 39
      Height = 24
      Hint = 'Ins'
      Action = actIns
      TabOrder = 0
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        B78183B78183B78183B78183B78183B78183B78183B78183B78183B78183B781
        83B78183B78183FF00FFFF00FFFF00FFC7A79CFEEED4F7E3C5F6DFBCF5DBB4F3
        D7ABF3D3A2F1CF9AF0CF97F0CF98F0CF98F5D49AB78183FF00FFFF00FFFF00FF
        C7A79EFDEFD9F6E3CBF5DFC2F4DBBAF2D7B2F1D4A9F1D0A2EECC99EECC97EECC
        97F3D199B78183FF00FFFF00FFFF00FFC7A9A1FEF3E3F8E7D3F5E3CBF5DFC3F3
        DBBBF2D7B2F1D4ABF0D0A3EECC9AEECC97F3D199B78183FF00FFFF00FFFF00FF
        C9ACA5FFF7EBF9EBDAF7E7D2F6E3CAF5DFC2F4DBB9F2D7B2F1D4AAF0D0A1EFCD
        99F3D198B78183FF00FFFF00FFFF00FFCEB2AAFFFCF4FAEFE4F8EADAF7E7D3F5
        E2CBF5DFC2F4DBBBF1D7B2F1D3AAF0D0A1F3D29BB78183FF00FFFF00FFFF00FF
        D3B7AFFFFFFDFBF4ECFAEFE3F9EBDAF7E7D2F5E3C9F5DFC2F4DBBAF2D7B1F0D4
        A9F5D5A3B78183FF00FFFF00FFFF00FFD7BBB2FFFFFFFEF9F5FBF3ECFAEFE2F9
        EADAF8E7D2F5E3CAF5DEC2F4DBBAF2D8B2F6D9ACB78183FF00FFFF00FFFF00FF
        DABEB3FFFFFFFFFEFDFDF8F4FBF3ECF9EFE3F8EADAF7E7D2F6E2CAF6DEC1F4DB
        B9F8DDB4B78183FF00FFFF00FFFF00FFDEC1B5FFFFFFFFFFFFFFFEFDFEF9F4FB
        F3EBFAEFE2F9EBD9F8E6D1F6E2C8F7E1C2F0DAB7B78183FF00FFFF00FFFF00FF
        E2C5B5FFFFFFFFFFFFFFFFFFFFFEFDFDF9F4FBF3EBFAEEE2FAEDDCFCEFD9E6D9
        C4C6BCA9B78183FF00FFFF00FFFF00FFE5C7B7FFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFDFDF8F3FDF6ECF1E1D5C6A194B59489B08F81B78183FF00FFFF00FFFF00FF
        E9CBB8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFFFEF9E3CFC9BF8C76E8B2
        70ECA54AC58768FF00FFFF00FFFF00FFECCDBAFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFE4D4D2C89A7FFAC577CD9377FF00FFFF00FFFF00FFFF00FF
        EACAB6FCF7F4FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEC7977CCF9B
        86FF00FFFF00FFFF00FFFF00FFFF00FFE9C6B1EBCCB8EBCCB8EBCCB8EBCBB8EA
        CBB8EACBB8EACCB9DABBB0B8857AFF00FFFF00FFFF00FFFF00FF}
      UseSystemPaint = False
    end
    object UpdBut: TcxButton
      Left = 44
      Top = 2
      Width = 39
      Height = 24
      Hint = 'F2'
      Action = actEdit
      TabOrder = 1
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFB78183B78183B78183B78183B78183B78183B78183B7
        8183B78183B78183B78183B78183B78183FF00FFFF00FFFF00FFB78183FDEFD9
        F4E1C9E4CFB4D1BCA0CDB798DAC09AE4C599E9C896EDCB96EECC97F3D199B781
        83FF00FFFF00FFFF00FFB48176FEF3E3F8E7D3494645373C3E516061AE9C82BF
        A889D0B48DE4C393EDCB96F3D199B78183FF00FFFF00FFFF00FFB48176FFF7EB
        F9EBDAB0A5981B617D097CA818556F66625BA79479C5AC86DCBD8DEECD95B781
        83FF00FFFF00FFFF00FFBA8E85FFFCF4FAEFE4F2E5D638728629799A8D787F95
        6D6F7959539D8B73BAA380D9BC8CB47F81FF00FFFF00FFFF00FFBA8E85FFFFFD
        FBF4ECFAEFE3A5B3B17C7078E5A6A3C89292A4727276575195856CAF9978A877
        79FF00FFFF00FFFF00FFCB9A82FFFFFFFEF9F5FBF3ECF4EBDF85787CEEB7B5DA
        A6A6C38E8E9E6E6E73564F93836B996E6FFF00FFFF00FFFF00FFCB9A82FFFFFF
        FFFEFDFDF8F4FBF3ECF0E4D9A37978E9B5B5D9A5A5C48F8F9D6D6D7759528F67
        69FF00FFFF00FFFF00FFDCA887FFFFFFFFFFFFFFFEFDFEF9F4FBF3EBE8D9CE9E
        7473E8B5B5D8A4A4C18D8D9D6C6C7D5556FF00FFFF00FFFF00FFDCA887FFFFFF
        FFFFFFFFFFFFFFFEFDFDF9F4FBF3EBE0CFC5A17676ECB9B9D6A2A2C68E8E965F
        5D585C60FF00FFFF00FFE3B18EFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDF8F3FD
        F6ECDAC5BCAC8080F3BCBBA3878C3392B319ADCC19ADCCFF00FFE3B18EFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFFFEF9E3CFC9AA7A71B27873469CBA0FCA
        F400A4E6021EAA000099EDBD92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFE4D4D2B8857ADCA76A10A5CF04A8E60936C9092CC30318AEEDBD92FCF7F4
        FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEB8857ACF9B86FF00FF077D
        CD4860F1204ADD0416AAEDBD92DCA887DCA887DCA887DCA887DCA887DCA887DC
        A887DCA887B8857AFF00FFFF00FFFF00FF3E4BDB192DC4FF00FF}
      UseSystemPaint = False
    end
    object DelBut: TcxButton
      Left = 85
      Top = 2
      Width = 39
      Height = 24
      Hint = 'Del'
      Action = actDel
      TabOrder = 2
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF0732DE0732DEFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FF0732DE
        0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732
        DE0732DEFF00FFFF00FFFF00FF0732DE0732DD0732DE0732DEFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FF
        0534ED0732DF0732DE0732DEFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DDFF
        00FF0732DD0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0732DD0633E60633E60633E90732DCFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0633E307
        32E30534EFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0732DD0534ED0533E90434EF0434F5FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0434F40534EF0533EBFF
        00FFFF00FF0434F40335F8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0335FC0534EF0434F8FF00FFFF00FFFF00FFFF00FF0335FC0335FBFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FCFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0335FB0335FBFF00FFFF00FFFF00FFFF00FF0335FB
        0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0335FBFF00FFFF00FF0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      UseSystemPaint = False
    end
    object cxVal: TcxButtonEdit
      Left = 190
      Top = 4
      Width = 76
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxValPropertiesButtonClick
      TabOrder = 3
      Visible = False
    end
    object cxKurs: TcxCurrencyEdit
      Left = 309
      Top = 4
      Width = 121
      Height = 21
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Properties.DecimalPlaces = 8
      Properties.DisplayFormat = ',0.0000;-,0.0000'
      TabOrder = 4
      Visible = False
    end
    object CxDebet: TcxRadioButton
      Left = 536
      Top = 7
      Width = 73
      Height = 17
      Caption = #1076#1077#1073#1077#1090#1110
      TabOrder = 5
    end
    object cxKredit: TcxRadioButton
      Left = 624
      Top = 7
      Width = 73
      Height = 17
      Caption = #1082#1088#1077#1076#1080#1090#1110
      TabOrder = 6
    end
  end
  object cxGrid2: TcxGrid
    Left = 368
    Top = 99
    Width = 250
    Height = 200
    TabOrder = 4
    Visible = False
    object cxGrid2DBTableView1: TcxGridDBTableView
      DataController.DataSource = ds
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          FieldName = 'DB_SUMMA'
          Column = cxgrdbclmnDB_SUMMA
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          FieldName = 'DB_SUMMA_VAL'
          Column = cxgrdbclmnDB_SUMMA_VAL
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          FieldName = 'KR_SUMMA'
          Column = cxgrdbclmnKR_SUMMA
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          FieldName = 'KR_SUMMA_VAL'
          Column = cxgrdbclmnKR_SUMMA_VAL
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          FieldName = 'DB_SUMMA'
          Column = cxgrdbclmnDB_SUMMA
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          FieldName = 'KR_SUMMA'
          Column = cxgrdbclmnKR_SUMMA
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      OptionsView.GroupFooters = gfAlwaysVisible
      Styles.Background = cxStyle13
      Styles.Content = cxStyle13
      Styles.Header = cxStyle2
      object cxgrdbclmnSM_KOD: TcxGridDBColumn
        Caption = #1041#1102#1076#1078#1077#1090
        Options.Editing = False
        Options.Filtering = False
        Width = 58
        DataBinding.FieldName = 'SM_KOD'
      end
      object cxgrdbclmnRZ_KOD: TcxGridDBColumn
        Caption = #1056#1086#1079#1076#1110#1083
        Options.Editing = False
        Options.Filtering = False
        Width = 54
        DataBinding.FieldName = 'RZ_KOD'
      end
      object cxgrdbclmnST_KOD: TcxGridDBColumn
        Caption = #1057#1090#1072#1090#1090#1103
        Options.Editing = False
        Options.Filtering = False
        Width = 56
        DataBinding.FieldName = 'ST_KOD'
      end
      object cxgrdbclmnKEKV_KOD: TcxGridDBColumn
        Caption = #1050#1045#1050#1042
        Options.Editing = False
        Options.Filtering = False
        Width = 46
        DataBinding.FieldName = 'KEKV_KOD'
      end
      object cxgrdbclmnDB_SUMMA: TcxGridDBColumn
        Caption = #1044#1073'. '#1089#1091#1084#1072
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'DB_SUMMA'
      end
      object cxgrdbclmnDB_SUMMA_VAL: TcxGridDBColumn
        Caption = #1044#1073'. '#1089#1091#1084#1072' ('#1074#1072#1083'.)'
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'DB_SUMMA_VAL'
      end
      object cxgrdbclmnKR_SUMMA: TcxGridDBColumn
        Caption = #1050#1088'. '#1089#1091#1084#1072
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'KR_SUMMA'
      end
      object cxgrdbclmnKR_SUMMA_VAL: TcxGridDBColumn
        Caption = #1050#1088'. '#1089#1091#1084#1072' ('#1074#1072#1083'.)'
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'KR_SUMMA_VAL'
      end
      object cxgrdbclmnCODE_VAL: TcxGridDBColumn
        Caption = #1042#1072#1083#1102#1090#1072
        Visible = False
        GroupIndex = 0
        Options.Editing = False
        Options.Filtering = False
        SortOrder = soAscending
        DataBinding.FieldName = 'CODE_VAL'
      end
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = cxGrid2DBTableView1
    end
  end
  object SaldoDS: TpFIBDataSet
    Database = SaldoDB
    Transaction = SaldoTr
    SelectSQL.Strings = (
      
        'Select * from PC_TMP_SALDO_DOG_ADD_SELECT(:id_ses, :date_reg, :i' +
        'd_reg)')
    Left = 37
    Top = 99
    poSQLINT64ToBCD = True
    object SaldoDSID: TFIBBCDField
      FieldName = 'ID'
      Size = 0
      RoundByScale = True
    end
    object SaldoDSID_DOG: TFIBBCDField
      FieldName = 'ID_DOG'
      Size = 0
      RoundByScale = True
    end
    object SaldoDSKOD_DOG: TFIBBCDField
      FieldName = 'KOD_DOG'
      Size = 0
      RoundByScale = True
    end
    object SaldoDSID_SM: TFIBBCDField
      FieldName = 'ID_SM'
      Size = 0
      RoundByScale = True
    end
    object SaldoDSID_RZ: TFIBBCDField
      FieldName = 'ID_RZ'
      Size = 0
      RoundByScale = True
    end
    object SaldoDSID_ST: TFIBBCDField
      FieldName = 'ID_ST'
      Size = 0
      RoundByScale = True
    end
    object SaldoDSID_KEKV: TFIBBCDField
      FieldName = 'ID_KEKV'
      Size = 0
      RoundByScale = True
    end
    object SaldoDSDB_SUMMA: TFIBBCDField
      FieldName = 'DB_SUMMA'
      Size = 2
      RoundByScale = True
    end
    object SaldoDSKR_SUMMA: TFIBBCDField
      FieldName = 'KR_SUMMA'
      Size = 2
      RoundByScale = True
    end
    object SaldoDSSM_TITLE: TFIBStringField
      FieldName = 'SM_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object SaldoDSSM_KOD: TFIBIntegerField
      FieldName = 'SM_KOD'
    end
    object SaldoDSRZ_TITLE: TFIBStringField
      FieldName = 'RZ_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object SaldoDSRZ_KOD: TFIBIntegerField
      FieldName = 'RZ_KOD'
    end
    object SaldoDSST_TITLE: TFIBStringField
      FieldName = 'ST_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object SaldoDSST_KOD: TFIBIntegerField
      FieldName = 'ST_KOD'
    end
    object SaldoDSKEKV_TITLE: TFIBStringField
      FieldName = 'KEKV_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object SaldoDSKEKV_KOD: TFIBIntegerField
      FieldName = 'KEKV_KOD'
    end
    object SaldoDSFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 150
      EmptyStrToNull = True
    end
    object SaldoDSDB_SUMMA_VAL: TFIBBCDField
      FieldName = 'DB_SUMMA_VAL'
      OnGetText = SaldoDSDB_SUMMA_VALGetText
      Size = 2
      RoundByScale = True
    end
    object SaldoDSKR_SUMMA_VAL: TFIBBCDField
      FieldName = 'KR_SUMMA_VAL'
      OnGetText = SaldoDSKR_SUMMA_VALGetText
      Size = 2
      RoundByScale = True
    end
    object SaldoDSID_VALUTE: TFIBBCDField
      FieldName = 'ID_VALUTE'
      Size = 0
      RoundByScale = True
    end
    object SaldoDSCODE_VAL: TFIBStringField
      FieldName = 'CODE_VAL'
      Size = 5
      EmptyStrToNull = True
    end
    object SaldoDSSYMBOL: TFIBStringField
      FieldName = 'SYMBOL'
      Size = 3
      EmptyStrToNull = True
    end
  end
  object SaldoDB: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    DefaultTransaction = SaldoTr
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 6
    Top = 99
  end
  object SaldoStoredProc: TpFIBStoredProc
    Database = SaldoDB
    Transaction = SaldoTr
    Left = 100
    Top = 101
  end
  object SaldoTr: TpFIBTransaction
    DefaultDatabase = SaldoDB
    TimeoutAction = TARollback
    Left = 70
    Top = 100
  end
  object ds: TDataSource
    DataSet = SaldoDS
    Left = 7
    Top = 128
  end
  object StyleRepository: TcxStyleRepository
    Left = 633
    Top = 123
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
    object cxStyle7: TcxStyle
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
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
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
  end
  object WriteTr: TpFIBTransaction
    DefaultDatabase = SaldoDB
    TimeoutAction = TARollback
    Left = 146
    Top = 100
  end
  object actlst1: TActionList
    Left = 21
    Top = 199
    object actOk: TAction
      Caption = #1047#1073#1077#1088#1110#1075#1090#1080
      ShortCut = 13
      OnExecute = actOkExecute
    end
    object actIns: TAction
      ShortCut = 45
      OnExecute = actInsExecute
    end
    object actEdit: TAction
      ShortCut = 113
      OnExecute = actEditExecute
    end
    object actDel: TAction
      ShortCut = 46
      OnExecute = actDelExecute
    end
  end
  object ds_val: TpFIBDataSet
    Database = SaldoDB
    Transaction = SaldoTr
    SelectSQL.Strings = (
      
        'Select * from pub_sp_valute where id_valute in(select distinct i' +
        'd_valute from pub_dt_valute_kurs)  order by valute_title')
    Left = 52
    Top = 160
    poSQLINT64ToBCD = True
    object ds_valCODE_VALUTE: TFIBStringField
      FieldName = 'CODE_VALUTE'
      Size = 4
      EmptyStrToNull = True
    end
    object ds_valVALUTE_TITLE: TFIBStringField
      FieldName = 'VALUTE_TITLE'
      Size = 100
      EmptyStrToNull = True
    end
    object ds_valID_VALUTE: TFIBBCDField
      FieldName = 'ID_VALUTE'
      Size = 0
      RoundByScale = True
    end
    object ds_valSPECIAL_SIGN: TFIBStringField
      FieldName = 'SPECIAL_SIGN'
      Size = 4
      EmptyStrToNull = True
    end
  end
  object ds_kurs: TpFIBDataSet
    Database = SaldoDB
    Transaction = SaldoTr
    Left = 52
    Top = 202
    poSQLINT64ToBCD = True
  end
end
