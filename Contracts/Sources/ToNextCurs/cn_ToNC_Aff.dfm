object frmToNC_Aff: TfrmToNC_Aff
  Left = 418
  Top = 194
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmToNC_Aff'
  ClientHeight = 386
  ClientWidth = 446
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Fio_Label: TLabel
    Left = 14
    Top = 1
    Width = 46
    Height = 13
    Caption = 'Fio_Label'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Num_Dog_Label: TLabel
    Left = 323
    Top = 1
    Width = 80
    Height = 13
    Caption = 'Num_Dog_Label'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object NewPeriod_Label: TLabel
    Left = 122
    Top = 44
    Width = 84
    Height = 13
    Alignment = taRightJustify
    Caption = 'NewPeriod_Label'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object ExitBtn: TcxButton
    Left = 8
    Top = 352
    Width = 97
    Height = 25
    Caption = 'Exit'
    TabOrder = 0
    OnClick = ExitBtnClick
  end
  object Admit_All_Btn: TcxButton
    Left = 120
    Top = 352
    Width = 97
    Height = 25
    Caption = 'Admit All'
    TabOrder = 1
    OnClick = Admit_All_BtnClick
  end
  object AdmitBtn: TcxButton
    Left = 232
    Top = 352
    Width = 97
    Height = 25
    Caption = 'Admit'
    TabOrder = 2
    OnClick = AdmitBtnClick
  end
  object AcceptBtn: TcxButton
    Left = 344
    Top = 352
    Width = 97
    Height = 25
    Caption = 'Accept'
    TabOrder = 3
    OnClick = AcceptBtnClick
  end
  object GroupBox_1: TcxGroupBox
    Left = 13
    Top = 72
    Width = 417
    Height = 113
    Alignment = alTopLeft
    TabOrder = 4
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
      Properties.OnButtonClick = Spec_EditPropertiesButtonClick
      Style.Color = 16311512
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonTransparency = ebtNone
      TabOrder = 1
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
      Properties.OnButtonClick = Group_EditPropertiesButtonClick
      Style.Color = 16311512
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonTransparency = ebtNone
      TabOrder = 2
    end
  end
  object GroupBox_2: TcxGroupBox
    Left = 13
    Top = 191
    Width = 417
    Height = 137
    Alignment = alTopLeft
    TabOrder = 5
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
    object FormStud_Edit: TcxButtonEdit
      Left = 124
      Top = 12
      Width = 261
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
    end
    object CategoryStudy_Edit: TcxButtonEdit
      Left = 124
      Top = 44
      Width = 261
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
    end
    object CursComboBox: TcxCurrencyEdit
      Left = 124
      Top = 107
      Width = 42
      Height = 21
      BeepOnEnter = False
      EditValue = 0
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '0'
      Properties.ReadOnly = True
      Style.BorderStyle = ebsUltraFlat
      Style.Color = 16311512
      TabOrder = 3
    end
  end
  object Fio_Edit: TcxTextEdit
    Left = 13
    Top = 14
    Width = 300
    Height = 21
    BeepOnEnter = False
    ParentFont = False
    Properties.ReadOnly = True
    Style.Color = 16311512
    TabOrder = 6
  end
  object Num_Dog_Edit: TcxTextEdit
    Left = 322
    Top = 14
    Width = 105
    Height = 21
    BeepOnEnter = False
    ParentFont = False
    Properties.ReadOnly = True
    Style.Color = 16311512
    TabOrder = 7
  end
  object DateBegEdit: TcxDateEdit
    Left = 208
    Top = 40
    Width = 105
    Height = 21
    Properties.ReadOnly = False
    Style.Color = clInfoBk
    TabOrder = 8
  end
  object DateEndEdit: TcxDateEdit
    Left = 322
    Top = 40
    Width = 105
    Height = 21
    Properties.ReadOnly = False
    Style.Color = clInfoBk
    TabOrder = 9
  end
end
