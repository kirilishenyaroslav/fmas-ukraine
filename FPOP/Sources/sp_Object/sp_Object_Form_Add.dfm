object sp_Object_Form_Add1: Tsp_Object_Form_Add1
  Left = 353
  Top = 213
  BorderStyle = bsDialog
  Caption = 'sp_Object_Form_Add1'
  ClientHeight = 242
  ClientWidth = 376
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
  DesignSize = (
    376
    242)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 10
    Width = 361
    Height = 194
    Anchors = [akLeft, akTop, akBottom]
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 74
      Height = 13
      Caption = #1053#1072#1079#1074#1072' '#1086#1073#39#1108#1082#1090#1091':'
    end
    object Label4: TLabel
      Left = 8
      Top = 128
      Width = 191
      Height = 13
      Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083' '#1044#1042#1055' "'#1059#1082#1088#1087#1088#1086#1084#1074#1086#1076#1095#1086#1088#1084#1077#1090'":'
    end
    object Name_Department: TcxButtonEdit
      Left = 8
      Top = 144
      Width = 345
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = Name_DepartmentPropertiesButtonClick
      Style.StyleController = dm.EditStyleController1
      TabOrder = 0
    end
    object ForPlanCheckBox: TcxCheckBox
      Left = 5
      Top = 168
      Width = 161
      Height = 21
      Properties.DisplayChecked = 'true'
      Properties.DisplayUnchecked = 'false'
      Properties.ValueChecked = 1
      Properties.ValueUnchecked = 0
      Properties.Caption = #1042#1093#1086#1076#1080#1090#1100' '#1076#1086' '#1089#1082#1083#1072#1076#1091' '#1087#1083#1072#1085#1110#1074
      TabOrder = 1
    end
  end
  object Edit1: TcxTextEdit
    Left = 16
    Top = 32
    Width = 345
    Height = 21
    Style.StyleController = dm.EditStyleController1
    TabOrder = 1
  end
  object LevelRadioGroup: TcxRadioGroup
    Left = 192
    Top = 56
    Width = 169
    Height = 73
    Properties.Items = <
      item
        Caption = #1044#1086#1076#1072#1090#1080' '#1085#1072' '#1090#1086#1084#1091' '#1078' '#1088#1110#1074#1085#1110
      end
      item
        Caption = #1044#1086#1076#1072#1090#1080' '#1085#1072' '#1088#1110#1074#1077#1085#1100' '#1085#1080#1078#1095#1077
      end>
    Properties.OnChange = LevelRadioGroupPropertiesChange
    TabOrder = 2
    Caption = ''
  end
  object KindRadioGroup: TcxRadioGroup
    Left = 16
    Top = 56
    Width = 169
    Height = 73
    Properties.Items = <
      item
        Caption = #1044#1086#1076#1072#1090#1080' '#1090#1080#1087' '#1086#1073#39#1108#1082#1090#1110#1074
      end
      item
        Caption = #1044#1086#1076#1072#1090#1080' '#1086#1073#39#1108#1082#1090
      end>
    Properties.OnChange = KindRadioGroupPropertiesChange
    TabOrder = 3
    Caption = ''
  end
  object OK_Btn: TcxButton
    Left = 216
    Top = 211
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 4
    OnClick = OK_BtnClick
  end
  object Cancel_Btn: TcxButton
    Left = 296
    Top = 211
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 5
    OnClick = BitBtn2Click
  end
  object Query: TpFIBQuery
    Database = dm.DataBase
    Transaction = dm.ReadTransaction
    Left = 112
    Top = 216
  end
  object ActionList: TActionList
    Left = 80
    Top = 216
    object ActionExit: TAction
      Caption = 'ActionExit'
      ShortCut = 27
      OnExecute = ActionExitExecute
    end
  end
end
