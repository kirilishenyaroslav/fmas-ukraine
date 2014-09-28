object frmStudInf: TfrmStudInf
  Left = 603
  Top = 254
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmStudInf'
  ClientHeight = 361
  ClientWidth = 433
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox_1: TcxGroupBox
    Left = 8
    Top = 72
    Width = 417
    Height = 113
    Alignment = alTopLeft
    TabOrder = 1
    TabStop = False
    object Faculty_Label: TLabel
      Left = 49
      Top = 17
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = 'Faculty_Label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Spec_Label: TLabel
      Left = 58
      Top = 51
      Width = 57
      Height = 13
      Alignment = taRightJustify
      Caption = 'Spec_Label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Group_Label: TLabel
      Left = 54
      Top = 83
      Width = 61
      Height = 13
      Alignment = taRightJustify
      Caption = 'Group_Label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Faculty_Edit: TcxButtonEdit
      Left = 124
      Top = 16
      Width = 285
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
      Properties.OnButtonClick = Faculty_EditPropertiesButtonClick
      Style.Color = 16311512
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonTransparency = ebtNone
      TabOrder = 0
      OnKeyPress = Faculty_EditKeyPress
    end
    object Spec_Edit: TcxButtonEdit
      Left = 124
      Top = 48
      Width = 285
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
      Properties.OnButtonClick = Faculty_EditPropertiesButtonClick
      Style.Color = 16311512
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonTransparency = ebtNone
      TabOrder = 1
      OnKeyPress = Spec_EditKeyPress
    end
    object Group_Edit: TcxButtonEdit
      Left = 124
      Top = 80
      Width = 93
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
      Properties.OnButtonClick = Faculty_EditPropertiesButtonClick
      Style.Color = 16311512
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonTransparency = ebtNone
      TabOrder = 2
      OnKeyPress = Group_EditKeyPress
    end
  end
  object GroupBox_2: TcxGroupBox
    Left = 8
    Top = 184
    Width = 417
    Height = 137
    Alignment = alTopLeft
    TabOrder = 2
    TabStop = False
    object FormStud_Label: TLabel
      Left = 40
      Top = 15
      Width = 77
      Height = 13
      Alignment = taRightJustify
      Caption = 'FormStud_Label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object CategoryStudy_Label: TLabel
      Left = 16
      Top = 47
      Width = 101
      Height = 13
      Alignment = taRightJustify
      Caption = 'CategoryStudy_Label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Nazional_Edit_Label: TLabel
      Left = 20
      Top = 79
      Width = 97
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nazional_Edit_Label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Kurs_Label: TLabel
      Left = 64
      Top = 111
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Kurs_Label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Term_stud_label: TLabel
      Left = 195
      Top = 111
      Width = 78
      Height = 13
      Alignment = taRightJustify
      Caption = 'Term_stud_label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object FormStud_Edit: TcxButtonEdit
      Left = 124
      Top = 12
      Width = 285
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
      Properties.OnButtonClick = FormStud_EditPropertiesButtonClick
      Style.Color = 16311512
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonTransparency = ebtNone
      TabOrder = 0
      OnKeyPress = FormStud_EditKeyPress
    end
    object CategoryStudy_Edit: TcxButtonEdit
      Left = 124
      Top = 44
      Width = 285
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
      Properties.OnButtonClick = CategoryStudy_EditPropertiesButtonClick
      Style.Color = 16311512
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonTransparency = ebtNone
      TabOrder = 1
      OnKeyPress = CategoryStudy_EditKeyPress
    end
    object Nazional_Edit: TcxButtonEdit
      Left = 124
      Top = 76
      Width = 165
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
      Properties.OnButtonClick = Nazional_EditPropertiesButtonClick
      Style.Color = 16311512
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonTransparency = ebtNone
      TabOrder = 2
      OnKeyPress = Nazional_EditKeyPress
    end
    object Kurs_ComboBox: TcxComboBox
      Left = 125
      Top = 107
      Width = 57
      Height = 21
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8')
      Properties.ReadOnly = False
      Properties.ValidateOnEnter = False
      Properties.OnChange = Kurs_ComboBoxPropertiesChange
      Style.Color = 16311512
      TabOrder = 3
      OnKeyPress = Kurs_ComboBoxKeyPress
    end
    object term_stud_ComboBox: TcxComboBox
      Left = 288
      Top = 107
      Width = 97
      Height = 21
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.ReadOnly = False
      Properties.ValidateOnEnter = False
      Properties.OnChange = term_stud_ComboBoxPropertiesChange
      Properties.OnCloseUp = term_stud_ComboBoxPropertiesCloseUp
      Style.Color = 16311512
      TabOrder = 4
      OnKeyPress = term_stud_ComboBoxKeyPress
    end
  end
  object GroupBox_3: TcxGroupBox
    Left = 8
    Top = 0
    Width = 417
    Height = 73
    Alignment = alTopLeft
    TabOrder = 0
    TabStop = False
    object Summa_Label: TLabel
      Left = 258
      Top = 47
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = 'Summa_Label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Date_Beg_Label: TLabel
      Left = 11
      Top = 15
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Caption = 'Date_Beg_Label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Date_End_Label: TLabel
      Left = 11
      Top = 47
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Caption = 'Date_End_Label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Summa_Edit: TcxCurrencyEdit
      Left = 328
      Top = 44
      Width = 81
      Height = 21
      BeepOnEnter = False
      EditValue = 0c
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '0.00;'
      Style.BorderStyle = ebsThick
      Style.Color = clInfoBk
      TabOrder = 2
      OnKeyPress = Summa_EditKeyPress
    end
    object Date_Beg_DateEdit: TcxDateEdit
      Left = 96
      Top = 12
      Width = 97
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.DateButtons = [btnToday]
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.OnChange = Date_Beg_DateEditPropertiesChange
      Style.Color = clInfoBk
      TabOrder = 0
      OnKeyPress = Date_Beg_DateEditKeyPress
      EditValue = 0d
    end
    object Date_End_DateEdit: TcxDateEdit
      Left = 96
      Top = 44
      Width = 97
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.DateButtons = [btnToday]
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.OnChange = Date_End_DateEditPropertiesChange
      Style.Color = clInfoBk
      TabOrder = 1
      OnKeyPress = Date_End_DateEditKeyPress
      EditValue = 0d
    end
    object AddFromPreyskurant_Btn: TcxButton
      Left = 256
      Top = 12
      Width = 153
      Height = 25
      Caption = 'AddFromPreyskurant_Btn'
      TabOrder = 3
      OnClick = AddFromPreyskurant_BtnClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF008E5D59008E5D5900FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF008E5D5900FFC48B008453510084535100FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
        59008E5D59008E5D59008E5D59008E5D59008E5D590073424100FF00FF00FF00
        FF00FF00FF0092625A0092625A00FEE0C000FEDDBC00FED9B500FFD4AA00FFCC
        9D00FFC79200FFC48B00FFC48B00FFC48B00FFC48B0073424100FF00FF00FF00
        FF00FF00FF0092625A0092625A00FEE1C500FEDDBC00FFD9B400FFD5AC00FFD1
        A500FFCE9D00FECA9700FFC79000FFC48B00FFC48B0073424100FF00FF00FF00
        FF00FF00FF0092625A0098665D00FEE5CB0000008200FFE0C0009F675A009F67
        5A009F675A009F675A009F675A009F675A00FFC48B0073424100FF00FF00FF00
        FF00A66F5B00FFF7D100A06C5F00FEE7D100FEE9D300FEE9D300FEE9D300FEE9
        D300FEE2C500FED8B200FECFA000FEC99300FEC9930073424100FF00FF00FF00
        FF00A66F5B00E7DCDE00A7746300FEEBD90000008200FEEAD5009F675A009F67
        5A009F675A009F675A009F675A009F675A00FECE9F0073424100FF00FF00FF00
        FF00A66F5B00D1D0E900B17D6700FEEFE000FEF3E600FEF3E600FEF3E600FEF3
        E600FEEDD900FEE3C900FFDCB800FED4AB00FFD5AC0073424100FF00FF00C587
        6300E5C5B100FFFFFF00BB836900FEF3E70000008200FFF7EF009F675A009F67
        5A009E665A009E6659009A6457009F675A00F6D5B40072414100FF00FF00C587
        6300F6E6DD00FFFFFF00C48B6C00FEF7EE00FEFAF700FEFAF700FEFBF800FEF8
        F300FEF0E300FEE7D000FEE1C200FEE1C200E2C9AD006D3F3E00FF00FF00E1A5
        7700FEFBFA00FEFEFE00CC937000FEF8F400FEFEFC00FEFBF800FEF8F300FEF6
        ED00FEF2E600FEEDDC00FEE9D400BBA99600C7B19900673C3B00FF00FF00E1A5
        7700FFFFFF00FFFFFF00D59C7400FEFBFA00FEFEFE00FEFEFE00FEFBFA00FEFA
        F400FEF6EE00FEFAF600A0675B00A0675B00A0675B009D655900E1A67700E1A5
        7700EDD1C100F7EFE900DCA17500FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
        FE00FEFEFE00FEFAF600A7726000FFDD9A00FFDD9A00C1836C00FF00FF00FF00
        FF00CB865E00CE8A6300DCA17500FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFC
        FB00FEFAF600FBF7F300AA746200FFDD9A00C1836C00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00E1A57700D1926D00D1926D00D1926D00D1926D00D192
        6D00D1926D00D1926D00AA746200C1836C00FF00FF00FF00FF00}
      UseSystemPaint = False
    end
  end
  object OkButton: TcxButton
    Left = 247
    Top = 330
    Width = 85
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 3
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 339
    Top = 330
    Width = 85
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 4
    OnClick = CancelButtonClick
  end
  object DataSet_inf: TpFIBDataSet
    Database = DM_Contracts.DB
    Transaction = DM_Contracts.ReadTransaction
    Left = 8
    Top = 328
    poSQLINT64ToBCD = True
  end
  object DataSet_term_stud: TpFIBDataSet
    Database = DM_Contracts.DB
    Transaction = DM_Contracts.ReadTransaction
    Left = 48
    Top = 328
    poSQLINT64ToBCD = True
  end
  object ActionList1: TActionList
    Left = 88
    Top = 328
    object Act_help: TAction
      Caption = 'Act_help'
      ShortCut = 112
      OnExecute = Act_helpExecute
    end
  end
  object DataSet_help: TpFIBDataSet
    Database = DM_Contracts.DB
    Transaction = DM_Contracts.ReadTransaction
    Left = 136
    Top = 328
    poSQLINT64ToBCD = True
  end
end
