object dt_Cost_Product_Form_Add: Tdt_Cost_Product_Form_Add
  Left = 328
  Top = 343
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1074#1072#1085#1085#1103' '#1079#1072#1087#1080#1089#1091
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Shape2: TShape
    Left = 256
    Top = 8
    Width = 225
    Height = 137
    Brush.Style = bsClear
    Pen.Color = 12937777
  end
  object Shape1: TShape
    Left = 8
    Top = 8
    Width = 241
    Height = 137
    Brush.Style = bsClear
    Pen.Color = 12937777
  end
  object Label1: TLabel
    Left = 16
    Top = 19
    Width = 84
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1087#1088#1086#1076#1091#1082#1094#1110#1111':'
  end
  object Label3: TLabel
    Left = 16
    Top = 59
    Width = 112
    Height = 13
    Caption = #1050#1072#1090#1077#1075#1086#1088#1110#1103' '#1089#1087#1086#1078#1080#1074#1072#1095#1110#1074':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 98
    Width = 130
    Height = 13
    Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1086#1076#1080#1085#1080#1094#1100' '#1074#1080#1084#1110#1088#1091':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 264
    Top = 19
    Width = 36
    Height = 13
    Caption = #1058#1072#1088#1080#1092':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 264
    Top = 59
    Width = 27
    Height = 13
    Caption = #1055#1044#1042':'
  end
  object Label2: TLabel
    Left = 264
    Top = 98
    Width = 72
    Height = 13
    Caption = #1058#1072#1088#1080#1092' '#1079' '#1055#1044#1042':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 385
    Top = 59
    Width = 84
    Height = 13
    Caption = #1050#1086#1077#1092#1110#1094#1110#1108#1085#1090' '#1055#1044#1042':'
  end
  object Shape3: TShape
    Left = 8
    Top = 152
    Width = 473
    Height = 49
    Brush.Style = bsClear
    Pen.Color = 12937777
  end
  object Label8: TLabel
    Left = 16
    Top = 160
    Width = 71
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091':'
  end
  object Label9: TLabel
    Left = 144
    Top = 160
    Width = 87
    Height = 13
    Caption = #1044#1072#1090#1072' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103':'
  end
  object Name_Cat_Cust: TcxButtonEdit
    Left = 16
    Top = 72
    Width = 225
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = Name_Cat_CustPropertiesButtonClick
    Style.Color = 16247513
    TabOrder = 1
  end
  object Name_Unit_Meas: TcxTextEdit
    Left = 146
    Top = 112
    Width = 95
    Height = 21
    TabStop = False
    Properties.ReadOnly = True
    TabOrder = 3
  end
  object ApplyButton: TcxButton
    Left = 326
    Top = 208
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 10
    OnClick = ApplyButtonClick
  end
  object CancelButton: TcxButton
    Left = 406
    Top = 208
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 11
    OnClick = CancelButtonClick
  end
  object qnt_unit_meas: TcxComboBox
    Left = 16
    Top = 112
    Width = 129
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      '1'
      '10')
    Properties.ReadOnly = False
    Properties.UseLeftAlignmentOnEditing = False
    Style.Color = 16247513
    TabOrder = 2
    Text = '10'
  end
  object Name_Product: TcxTextEdit
    Left = 16
    Top = 32
    Width = 225
    Height = 21
    TabStop = False
    Properties.ReadOnly = True
    Style.Color = clMoneyGreen
    TabOrder = 0
  end
  object TotalEdit: TcxCurrencyEdit
    Left = 264
    Top = 112
    Width = 209
    Height = 21
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DecimalPlaces = 6
    Properties.DisplayFormat = ',0.000000;-,0.000000'
    Properties.Nullable = False
    Properties.UseLeftAlignmentOnEditing = False
    Style.Color = 16247513
    TabOrder = 7
    OnKeyPress = TotalEditKeyPress
  end
  object Cost_nds: TcxCurrencyEdit
    Left = 264
    Top = 72
    Width = 113
    Height = 21
    TabStop = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DecimalPlaces = 6
    Properties.DisplayFormat = ',0.000000;-,0.000000'
    Properties.Nullable = False
    Properties.ReadOnly = True
    Properties.UseLeftAlignmentOnEditing = False
    Style.Color = clMoneyGreen
    TabOrder = 5
  end
  object Cost: TcxCurrencyEdit
    Left = 264
    Top = 32
    Width = 209
    Height = 21
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DecimalPlaces = 6
    Properties.DisplayFormat = ',0.000000;-,0.000000'
    Properties.Nullable = False
    Properties.UseLeftAlignmentOnEditing = False
    Style.Color = 16247513
    TabOrder = 4
    OnKeyPress = costKeyPress
  end
  object NDS_Edit: TcxCurrencyEdit
    Left = 384
    Top = 72
    Width = 89
    Height = 21
    TabStop = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DisplayFormat = ',0.00;-,0.00'
    Properties.Nullable = False
    Properties.ReadOnly = True
    Properties.UseLeftAlignmentOnEditing = False
    Style.Color = clMoneyGreen
    TabOrder = 6
  end
  object DateBegEdit: TcxDateEdit
    Left = 16
    Top = 173
    Width = 121
    Height = 21
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.Color = 16247513
    TabOrder = 8
    OnKeyPress = DateBegEditKeyPress
  end
  object DateEndEdit: TcxDateEdit
    Left = 144
    Top = 173
    Width = 121
    Height = 21
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.Color = 16247513
    TabOrder = 9
    OnKeyPress = DateEndEditKeyPress
  end
  object ActionList1: TActionList
    Left = 176
    object ActionExit: TAction
      Caption = 'ActionExit'
      ShortCut = 27
      OnExecute = ActionExitExecute
    end
  end
  object Query: TpFIBQuery
    Database = sp_Product_Form.Database
    Transaction = sp_Product_Form.ReadTransaction
    Left = 208
  end
end
