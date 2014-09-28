object Registration_Form_First_Add: TRegistration_Form_First_Add
  Left = 696
  Top = 292
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103': '
  ClientHeight = 332
  ClientWidth = 580
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox6: TcxGroupBox
    Left = 280
    Top = 96
    Width = 297
    Height = 97
    Alignment = alTopLeft
    Caption = #1054#1073#1091#1095#1077#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    TabStop = False
    object KursLabel: TLabel
      Left = 8
      Top = 56
      Width = 24
      Height = 13
      Caption = #1050#1091#1088#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object Label10: TLabel
      Left = 8
      Top = 16
      Width = 80
      Height = 13
      Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object GroupLabel: TLabel
      Left = 62
      Top = 56
      Width = 35
      Height = 13
      Caption = #1043#1088#1091#1087#1087#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object Podrazdel_Label: TLabel
      Left = 77
      Top = 32
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object SpecLabel: TLabel
      Left = 131
      Top = 56
      Width = 78
      Height = 13
      Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object ClearButton: TSpeedButton
      Left = 272
      Top = 72
      Width = 20
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
      ParentShowHint = False
      ShowHint = True
      OnClick = ClearButtonClick
    end
    object Kurs_ComboBox: TcxComboBox
      Left = 8
      Top = 72
      Width = 49
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownRows = 6
      Properties.Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6')
      Properties.ReadOnly = False
      Properties.ValidateOnEnter = False
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 1
      Visible = False
      OnKeyDown = Kurs_ComboBoxKeyDown
      OnKeyPress = Kurs_ComboBoxKeyPress
    end
    object Faculty_ButtonEdit: TcxButtonEdit
      Left = 10
      Top = 30
      Width = 55
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
        end>
      Properties.OnButtonClick = Faculty_ButtonEditPropertiesButtonClick
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonTransparency = ebtNone
      TabOrder = 0
      OnExit = Faculty_ButtonEditExit
      OnKeyPress = Faculty_ButtonEditKeyPress
    end
    object Spec_ComboBox: TcxComboBox
      Left = 130
      Top = 72
      Width = 138
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownRows = 6
      Properties.ReadOnly = False
      Properties.ValidateOnEnter = False
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 3
      Visible = False
      OnKeyDown = Spec_ComboBoxKeyDown
      OnKeyPress = Spec_ComboBoxKeyPress
    end
    object Group_ComboBox: TcxComboBox
      Left = 61
      Top = 72
      Width = 65
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownRows = 6
      Properties.ReadOnly = False
      Properties.ValidateOnEnter = False
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 2
      Visible = False
      OnKeyDown = Group_ComboBoxKeyDown
      OnKeyPress = Group_ComboBoxKeyPress
    end
  end
  object cxGroupBox7: TcxGroupBox
    Left = 0
    Top = 136
    Width = 281
    Height = 57
    Alignment = alTopLeft
    TabOrder = 1
    TabStop = False
    object Propiska_CheckBox: TcxCheckBox
      Left = 8
      Top = 20
      Width = 97
      Height = 21
      ParentColor = False
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = 'C '#1087#1088#1086#1087#1080#1089#1082#1086#1081
      State = cbsChecked
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clBtnFace
      TabOrder = 0
      OnKeyPress = Propiska_CheckBoxKeyPress
    end
    object Propusk_CheckBox: TcxCheckBox
      Left = 112
      Top = 20
      Width = 161
      Height = 21
      ParentColor = False
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1087#1088#1086#1087#1091#1089#1082
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clBtnFace
      TabOrder = 1
      OnKeyPress = Propusk_CheckBoxKeyPress
    end
  end
  object OkButton: TcxButton
    Left = 376
    Top = 301
    Width = 97
    Height = 26
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 7
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 480
    Top = 301
    Width = 97
    Height = 26
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 8
    OnClick = CancelButtonClick
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 192
    Width = 281
    Height = 97
    Alignment = alTopLeft
    Caption = #1055#1088#1086#1078#1080#1074#1072#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    TabStop = False
    object Label16: TLabel
      Left = 6
      Top = 18
      Width = 34
      Height = 13
      Caption = #1053#1086#1084#1077#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label18: TLabel
      Left = 78
      Top = 18
      Width = 44
      Height = 13
      Caption = #1050#1086#1084#1085#1072#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label19: TLabel
      Left = 150
      Top = 18
      Width = 19
      Height = 13
      Caption = #1058#1080#1087
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object ShortName_Build_Label: TLabel
      Left = 8
      Top = 64
      Width = 263
      Height = 25
      AutoSize = False
      Caption = #1082#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object TypeEdit: TcxButtonEdit
      Left = 6
      Top = 30
      Width = 65
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
        end>
      Properties.OnButtonClick = TypeEditPropertiesButtonClick
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonTransparency = ebtNone
      TabOrder = 0
      OnExit = TypeEditExit
      OnKeyPress = TypeEditKeyPress
    end
    object Nomer_Komnat_Edit: TcxTextEdit
      Left = 78
      Top = 30
      Width = 65
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.MaxLength = 20
      Properties.ReadOnly = False
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 1
      OnExit = Nomer_Komnat_EditExit
      OnKeyPress = Nomer_Komnat_EditKeyPress
    end
    object Type_Room_ComboBox: TcxComboBox
      Left = 150
      Top = 30
      Width = 121
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.ReadOnly = False
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 2
      OnKeyPress = Type_Room_ComboBoxKeyPress
    end
  end
  object cxGroupBox4: TcxGroupBox
    Left = 280
    Top = 192
    Width = 297
    Height = 97
    Alignment = alTopLeft
    Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    TabStop = False
    object Label22: TLabel
      Left = 6
      Top = 18
      Width = 19
      Height = 13
      Caption = #1050#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Full_Cat_Label: TLabel
      Left = 12
      Top = 60
      Width = 271
      Height = 23
      AutoSize = False
      Caption = #1082#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
    end
    object Label20: TLabel
      Left = 114
      Top = 18
      Width = 7
      Height = 13
      Caption = 'C'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label21: TLabel
      Left = 204
      Top = 18
      Width = 14
      Height = 13
      Caption = #1055#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Category_ButtonEdit: TcxButtonEdit
      Left = 6
      Top = 30
      Width = 81
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
        end>
      Properties.MaxLength = 6
      Properties.OnButtonClick = Category_ButtonEditPropertiesButtonClick
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = False
      TabOrder = 0
      OnExit = Category_ButtonEditExit
      OnKeyPress = Category_ButtonEditKeyPress
    end
    object Build_Beg_DateEdit: TcxDateEdit
      Left = 114
      Top = 30
      Width = 81
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.ShowTime = False
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 1
      OnKeyPress = Build_Beg_DateEditKeyPress
    end
    object Build_End_DateEdit: TcxDateEdit
      Left = 204
      Top = 30
      Width = 81
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.ShowTime = False
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 2
      OnKeyPress = Build_End_DateEditKeyPress
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 280
    Top = 0
    Width = 153
    Height = 97
    Alignment = alTopLeft
    Caption = #1044#1086#1075#1086#1074#1086#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TabStop = False
    object Label7: TLabel
      Left = 8
      Top = 56
      Width = 76
      Height = 13
      Caption = #1044#1072#1090#1072' '#1076#1086#1075#1086#1074#1086#1088#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label6: TLabel
      Left = 8
      Top = 16
      Width = 84
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Nomer_Dogovora: TcxTextEdit
      Left = 8
      Top = 32
      Width = 129
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.AutoSelect = False
      Properties.MaxLength = 20
      Properties.ReadOnly = False
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 0
      OnKeyPress = Nomer_DogovoraKeyPress
    end
    object Dogovor_DateEdit: TcxDateEdit
      Left = 8
      Top = 72
      Width = 89
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.ReadOnly = False
      Properties.ShowTime = False
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 1
      OnKeyPress = DateBorn_EditKeyPress
      EditValue = 0d
    end
  end
  object cxGroupBox5: TcxGroupBox
    Left = 432
    Top = 0
    Width = 145
    Height = 97
    Alignment = alTopLeft
    Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    TabStop = False
    object Label8: TLabel
      Left = 22
      Top = 16
      Width = 54
      Height = 13
      Caption = #1058#1072#1073'.'#1085#1086#1084#1077#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label9: TLabel
      Left = 22
      Top = 56
      Width = 92
      Height = 13
      Caption = #1053#1072#1083#1086#1075#1086#1074#1099#1081' '#1085#1086#1084#1077#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Tabel_Edit: TcxTextEdit
      Left = 22
      Top = 32
      Width = 111
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.MaxLength = 10
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 0
      OnKeyPress = Tabel_EditKeyPress
    end
    object Nalog_Edit: TcxCurrencyEdit
      Left = 24
      Top = 72
      Width = 105
      Height = 21
      Properties.DisplayFormat = '0'
      Style.Color = clInfoBk
      TabOrder = 1
      OnKeyPress = Nalog_EditKeyPress
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 0
    Width = 281
    Height = 145
    Alignment = alTopLeft
    Caption = #1060#1048#1054
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TabStop = False
    object Label1: TLabel
      Left = 5
      Top = 16
      Width = 49
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 5
      Top = 56
      Width = 22
      Height = 13
      Caption = #1048#1084#1103
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 5
      Top = 96
      Width = 47
      Height = 13
      Caption = #1054#1090#1095#1077#1089#1090#1074#1086
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 189
      Top = 16
      Width = 79
      Height = 13
      Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label13: TLabel
      Left = 189
      Top = 56
      Width = 20
      Height = 13
      Caption = #1055#1086#1083
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object EditFizLizo_Btn: TSpeedButton
      Left = 160
      Top = 31
      Width = 23
      Height = 22
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
    object Name_Edit: TcxTextEdit
      Left = 5
      Top = 72
      Width = 152
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 20
      Properties.ReadOnly = False
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 0
      OnExit = Name_EditExit
      OnKeyPress = Name_EditKeyPress
    end
    object Otch_Edit: TcxTextEdit
      Left = 5
      Top = 112
      Width = 152
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 29
      Properties.ReadOnly = False
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 1
      OnExit = Otch_EditExit
      OnKeyPress = Otch_EditKeyPress
    end
    object Inostranez_CheckBox: TcxCheckBox
      Left = 185
      Top = 112
      Width = 88
      Height = 21
      ParentColor = False
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1048#1085#1086#1089#1090#1088#1072#1085#1077#1094
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clBtnFace
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = False
      Style.Shadow = False
      TabOrder = 4
      OnKeyPress = Inostranez_CheckBoxKeyPress
    end
    object Pol_ComboBox: TcxComboBox
      Left = 189
      Top = 72
      Width = 89
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownRows = 2
      Properties.Items.Strings = (
        #1084
        #1078)
      Properties.ReadOnly = False
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 3
      OnKeyPress = Pol_ComboBoxKeyPress
    end
    object DateBorn_Edit: TcxDateEdit
      Left = 189
      Top = 32
      Width = 89
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.ReadOnly = False
      Properties.ShowTime = False
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 2
      OnKeyPress = DateBorn_EditKeyPress
      EditValue = 0d
    end
  end
  object Familia_Edit: TcxButtonEdit
    Left = 5
    Top = 32
    Width = 152
    Height = 21
    AutoSize = False
    BeepOnEnter = False
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = False
    Properties.OnButtonClick = Familia_EditPropertiesButtonClick
    Style.Color = clInfoBk
    Style.LookAndFeel.NativeStyle = False
    Style.ButtonTransparency = ebtNone
    TabOrder = 9
    OnKeyPress = Familia_EditKeyPress
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 120
    Top = 88
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
      Color = clMoneyGreen
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
  end
  object ActionList1: TActionList
    Left = 158
    Top = 86
    object ApplyAction: TAction
      Caption = 'Apply'
      ShortCut = 121
      OnExecute = ApplyActionExecute
    end
    object Apostrof: TAction
      Caption = 'Apostrof'
      ShortCut = 16606
      OnExecute = ApostrofExecute
    end
  end
end
