object dt_Plan_Add_Form1: Tdt_Plan_Add_Form1
  Left = 515
  Top = 278
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1074#1072#1085#1085#1103' '#1087#1083#1072#1085#1091
  ClientHeight = 377
  ClientWidth = 397
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 6
    Top = 8
    Width = 385
    Height = 329
    Shape = bsFrame
    Style = bsRaised
  end
  object Label1: TLabel
    Left = 14
    Top = 168
    Width = 67
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1087#1083#1072#1085#1091':'
  end
  object Label2: TLabel
    Left = 14
    Top = 240
    Width = 71
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091':'
  end
  object Label3: TLabel
    Left = 206
    Top = 240
    Width = 87
    Height = 13
    Caption = #1044#1072#1090#1072' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103':'
  end
  object Label4: TLabel
    Left = 14
    Top = 288
    Width = 191
    Height = 13
    Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083' '#1044#1042#1055' "'#1059#1082#1088#1087#1088#1086#1084#1074#1086#1076#1095#1086#1088#1084#1077#1090'":'
  end
  object Label5: TLabel
    Left = 14
    Top = 104
    Width = 111
    Height = 13
    Caption = #1055#1110#1076#1087#1086#1088#1103#1076#1082#1086#1074#1072#1085' '#1087#1083#1072#1085#1091':'
  end
  object Label6: TLabel
    Left = 14
    Top = 64
    Width = 54
    Height = 13
    Caption = #1058#1080#1087' '#1087#1083#1072#1085#1091':'
  end
  object Name_Department: TcxButtonEdit
    Left = 14
    Top = 304
    Width = 369
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = Name_DepartmentPropertiesButtonClick
    Style.StyleController = dm.EditStyleController1
    TabOrder = 6
  end
  object PlanKindRadioGroup: TcxRadioGroup
    Left = 14
    Top = 16
    Width = 369
    Height = 41
    Properties.Columns = 2
    Properties.Items = <
      item
        Caption = #1088#1110#1095#1085#1080#1081
      end
      item
        Caption = #1087#1110#1076#1087#1086#1088#1103#1076#1082#1086#1074#1072#1085#1085#1080#1081
      end>
    TabOrder = 0
    OnClick = PlanKindRadioGroupClick
    Caption = #1042#1080#1076' '#1087#1083#1072#1085#1091
  end
  object LinkToPlanMemo: TcxMemo
    Left = 14
    Top = 120
    Width = 369
    Height = 49
    Properties.ReadOnly = True
    Style.StyleController = dm.EditStyleController1
    TabOrder = 2
  end
  object Name_Plan: TcxMemo
    Left = 14
    Top = 184
    Width = 369
    Height = 49
    Style.StyleController = dm.EditStyleController1
    TabOrder = 3
    OnKeyPress = Name_PlanKeyPress
  end
  object Date_Beg: TcxDateEdit
    Left = 14
    Top = 256
    Width = 185
    Height = 21
    Properties.InputKind = ikStandard
    Properties.OnCloseUp = Date_BegCloseUp
    Style.StyleController = dm.EditStyleController1
    TabOrder = 4
    OnClick = Date_BegChange
    OnKeyPress = Date_BegKeyPress
    EditValue = 0d
  end
  object Date_End: TcxDateEdit
    Left = 206
    Top = 256
    Width = 177
    Height = 21
    Properties.OnCloseUp = Date_EndCloseUp
    Style.StyleController = dm.EditStyleController1
    TabOrder = 5
    OnClick = Date_EndChange
    OnKeyPress = Date_EndKeyPress
    EditValue = 0d
  end
  object Button1: TcxButton
    Left = 236
    Top = 344
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 7
    OnClick = Button1Click
  end
  object Button2: TcxButton
    Left = 316
    Top = 344
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 8
    OnClick = Button2Click
  end
  object Name_Plan_Type: TcxButtonEdit
    Left = 14
    Top = 80
    Width = 369
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = Name_Plan_TypePropertiesButtonClick
    Style.StyleController = dm.EditStyleController1
    TabOrder = 1
  end
  object ActionList1: TActionList
    Left = 22
    Top = 336
    object ActionExit: TAction
      Caption = 'ActionExit'
      ShortCut = 27
      OnExecute = ActionExitExecute
    end
  end
end
