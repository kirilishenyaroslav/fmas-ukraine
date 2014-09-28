object frm_Contracts_Payer_AE: Tfrm_Contracts_Payer_AE
  Left = 578
  Top = 328
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frm_Contracts_Payer_AE'
  ClientHeight = 241
  ClientWidth = 488
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object OkButton: TcxButton
    Left = 302
    Top = 211
    Width = 87
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 394
    Top = 211
    Width = 85
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  object Frame_GroupBox: TcxGroupBox
    Left = 8
    Top = 0
    Width = 473
    Height = 201
    Alignment = alTopLeft
    TabOrder = 0
    TabStop = False
    object Percent_Label: TLabel
      Left = 52
      Top = 121
      Width = 69
      Height = 13
      Alignment = taRightJustify
      Caption = 'Percent_Label'
    end
    object Periodichnost_Label: TLabel
      Left = 16
      Top = 160
      Width = 96
      Height = 13
      Caption = 'Periodichnost_Label'
    end
    object Type_Payer_GroupBox: TcxGroupBox
      Left = 8
      Top = 8
      Width = 463
      Height = 97
      Alignment = alTopLeft
      Caption = 'Type_Payer_GroupBox'
      TabOrder = 0
      TabStop = False
      object Payer_Label: TLabel
        Left = 136
        Top = 8
        Width = 59
        Height = 13
        Caption = 'Payer_Label'
      end
      object MFO_Label: TLabel
        Left = 8
        Top = 57
        Width = 55
        Height = 13
        Caption = 'MFO_Label'
      end
      object RasSchet_Label: TLabel
        Left = 136
        Top = 57
        Width = 79
        Height = 13
        Caption = 'RasSchet_Label'
      end
      object EditFizLizo_Btn: TSpeedButton
        Left = 426
        Top = 18
        Width = 31
        Height = 28
        Flat = True
        Glyph.Data = {
          76060000424D7606000000000000360400002800000018000000180000000100
          0800000000004002000000000000000000000001000000010000FF00FF00021F
          2D00001A3000001C3400001F380000203B0000223E000F283D0035353C00562C
          1200593436006E3326006833280079352B00603535006A363500623939006438
          3800693E3E0000204000012542000127450002294A00022C4E0007334A000435
          4D00002D52000131560003315B0006335A0003335C0002355D0007385F002133
          41002434420025364400373C40000238620006396600023D6700083B64000438
          6A00053A6D00183B6A0001377700093E70000746670001426D00034B6E000144
          72000C4473000D4879001F5B780023567200265D7900585554006B4040008C2C
          0500972E0200982F03009F3103009E330600A4320400AB350700AA340900B538
          0E00BB3A1300BC3A1400B13D1C00893D3700CB390F00C0391300C13D1900C93E
          1800BA411400BC481C008F442800A7413600D3411E00DA412300D8492400D355
          2D00DD532800DA562900D85A3500EA472E00E3492C00E3562E00ED592D00F248
          3400F74B3700F84F3300F84A3800E1533700F4503900F2573B00C66C3D008F53
          51009D5956009C606000A3656400AC747300B67D7D00F8574000F8634400F46A
          4400FA6F4C00FC6D4C00FB704D00FF704E00FF754F00FF745100FF795900CE8B
          6600CA8C6A00CE957300000081000000890000028E0000039700000796000006
          A100000AA2000007B5000259890001588C000E4E99000C499C00005E9200315C
          8B000662900004659600005EAD000644B4000E4DB2001B66A6000375AC000060
          B1000572BC000A78BF001F70B1001E70BB003568A10041729F00000FCF000949
          C2000D50CF00105BC6000E52D4000D56D5000B59D400155FD300165DDC001669
          C000237ED4001766E200196EE7001A70EA001B74EE001D7DEB001F7FED001C75
          F0001D7DF4001A76F800008AC9000095D3002C8EDD001F81F900268BEF002186
          FA002187FF00248AFA00268CFA00238AFC00268EFF00288FFA00288FFE002D95
          F0002890FA002B95FA002D97FA002E9AFB002B98FF002D99FD00329DF700319D
          FB00309EFD0007B6ED0032A0FE0034A3FF0035A7FF0039B0FF0018C4EF000ED0
          FE0030D5EF002BE6FF00BA818100C1838100C6999C00E7B79800C69EA000CB9F
          A100D1A4A400D8A4A400DCB7B700DCB8B700DDB8B800E2B5B500E5BABA00E5CB
          BA00F2E9E100FFEDED00FFF2F200FFFFF800FFFFFF0000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00D7D70000000000000000000000000000000000000000000000D70118000000
          0000000000000000000000000000000000000183832E18000000000000000000
          000000000000000000000030887C221100000000000000000000003B40414242
          4247462480226164380000000000000000003B3C49555A5C5C675B4D2265CFC4
          633800000000000000003A3E4E555A5E686D4B4845C6D3CE6663120000000000
          00003A3F4E55676A6F5772715045C8D3CE6663120000000000003A414F676A6A
          6A4BD2D1535D0DC8D3CD66631200000000000040566A6A6D5073D6D1516D440B
          C9D3CC6663380000000000504A696D5860D6D6C7537054390CC9D3CCC4640F00
          00000000003C4C08818E8F3751584A50000ACAD4D06234A50000000000077F96
          959291852B090000000011CAC535BBC1890000001393A39E9E9C9B98952C0000
          0000000E36C0C38A787500027FAAAAAAA9A7A29E9B861A0000000000A4C28B7A
          7B750216A0AEB2B2AFAAAAAA9E971C000000000000847A907974022DB6B6B6B2
          B9B4B4A9AA9C29000000000000007578740013269A8DB1BCB6B4B4B4A9A22600
          00000000000000000000131B160587BCBCB8B6B4AAA01C000000000000000000
          0000132F311A8CBFBCBCB9B4B69900000000000000000000000031317C2F288C
          A6B8BCBCA82600000000000000000000000000137C802F16182632331C020000
          000000000000000000000000052F3126261C1816050000000000000000000000
          0000000000003113151331000000000000000000000000000000}
        ParentShowHint = False
        ShowHint = True
        OnClick = EditFizLizo_BtnClick
      end
      object Osoba_Label: TLabel
        Left = 262
        Top = 57
        Width = 63
        Height = 13
        Caption = 'Osoba_Label'
      end
      object SpeedButton1: TSpeedButton
        Left = 437
        Top = 71
        Width = 21
        Height = 20
        Flat = True
        Glyph.Data = {
          C6020000424DC602000000000000C60100002800000010000000100000000100
          08000000000000010000120B0000120B0000640000006400000000000000FFFF
          FF00FF00FF000086000000830000007B0000005E0000005C0000005800000054
          00000182020000650100005D010004880700068C0900048A0B00035A06000796
          0D0006630900046D0A00068E0F000CA015000C9D150008690E000B891300096D
          110011AA1D000D8217000E78180001500A001CB62F0013872300179928001890
          290021C239001C9A31001C982F0036E554002AD149002BCE49002CD44D000E91
          2D0035E05D0025AC460047F779001DA657000B63440012805B002D919700185F
          69003EABEE0045B4F70048B7FA00196DA3003DAAF400258BD80039A4F4003BA7
          F80040ACFE0041ADFA00025291000354950004579A00065B9F00197ACC001F81
          D4002581CE00319CF700359EF2003CA6FF000458A000065BAA00075CA9000962
          B4001676CA001E80D500268BE5002687DD002889E3002C8FEB002D95EF0038A1
          FF0038A3FF000C67C4000B64BB000F69BF002184E300278CEB000F6AC900126E
          D300116CCF001B6DC4002380E100136FDC001160C0001573E7001574E0001776
          E6001877EA00166AD40002020202020202626002020202020202020202020202
          615F5D5958020202020202020202024A4C57565A535449480202020202020237
          32334D364B5547463E3D020202021D43385B344D3B3941403F3C0202022E311D
          63425E4E3A44454550020202122B1E1E1E1D1D355C4F525102020219232C251E
          292F1E1E1D1D020202020224212A22150304142D300202020202020210201A0A
          050F0C0C02020202020202021F260D070C130202020202020202021C280E0902
          02020202020202020202172711080202020202020202020202021B1606020202
          02020202020202020202180B0202020202020202020202020202020202020202
          02020202020202020202}
        OnClick = SpeedButton1Click
      end
      object FizPayer_RadioButton: TcxRadioButton
        Left = 8
        Top = 16
        Width = 113
        Height = 17
        Caption = 'FizPayer_RadioButton'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = FizPayer_RadioButtonClick
        OnKeyPress = FizPayer_RadioButtonKeyPress
      end
      object YurPayer_RadioButton: TcxRadioButton
        Left = 8
        Top = 34
        Width = 113
        Height = 17
        Caption = 'YurPayer_RadioButton'
        TabOrder = 1
        TabStop = True
        OnClick = YurPayer_RadioButtonClick
        OnKeyPress = YurPayer_RadioButtonKeyPress
      end
      object Payer_Edit: TcxButtonEdit
        Left = 134
        Top = 22
        Width = 287
        Height = 21
        AutoSize = False
        BeepOnEnter = False
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = Payer_EditPropertiesButtonClick
        Style.Color = 16311512
        Style.LookAndFeel.NativeStyle = False
        Style.ButtonTransparency = ebtNone
        TabOrder = 2
        OnKeyPress = Payer_EditKeyPress
      end
      object MFO_Edit: TcxTextEdit
        Left = 7
        Top = 71
        Width = 121
        Height = 21
        BeepOnEnter = False
        ParentFont = False
        Properties.ReadOnly = True
        Style.Color = 16311512
        TabOrder = 3
      end
      object RasSchet_Edit: TcxTextEdit
        Left = 135
        Top = 71
        Width = 121
        Height = 21
        BeepOnEnter = False
        ParentFont = False
        Properties.ReadOnly = True
        Style.Color = 16311512
        TabOrder = 4
      end
      object LookupComboBox: TcxLookupComboBox
        Left = 261
        Top = 71
        Width = 172
        Height = 21
        Properties.GridMode = True
        Properties.KeyFieldNames = 'ID_CUST_MEN'
        Properties.ListColumns = <
          item
            FieldName = 'FIO'
          end>
        Properties.ListOptions.ColumnSorting = False
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.RowSelect = False
        Properties.ListOptions.ShowHeader = False
        Style.Color = 16311512
        Style.ButtonTransparency = ebtAlways
        Style.PopupBorderStyle = epbsDefault
        TabOrder = 5
      end
    end
    object PercentEdit: TcxCurrencyEdit
      Left = 126
      Top = 118
      Width = 53
      Height = 21
      BeepOnEnter = False
      EditValue = 0c
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 4
      Properties.DisplayFormat = '0.0000;'
      Style.Color = clInfoBk
      TabOrder = 1
      OnKeyPress = PercentEditKeyPress
    end
    object pLabel: TcxLabel
      Left = 178
      Top = 120
      Width = 69
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
      Caption = '%'
    end
    object Periodichnost_Edit: TcxButtonEdit
      Left = 126
      Top = 156
      Width = 287
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = Periodichnost_EditPropertiesButtonClick
      Style.Color = 16311512
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonTransparency = ebtNone
      TabOrder = 3
      OnKeyPress = Periodichnost_EditKeyPress
    end
  end
end
