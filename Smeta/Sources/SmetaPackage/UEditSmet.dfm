object frmEditSmet: TfrmEditSmet
  Left = 338
  Top = 308
  BorderStyle = bsDialog
  Caption = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1087#1086' '#1073#1102#1076#1078#1077#1090#1091
  ClientHeight = 216
  ClientWidth = 546
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCanResize = FormCanResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Bevel1: TBevel
    Left = 7
    Top = 6
    Width = 530
    Height = 107
  end
  object Label1: TLabel
    Left = 60
    Top = 24
    Width = 129
    Height = 19
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1050#1086#1076' '#1073#1102#1076#1078#1077#1090#1072
  end
  object Label2: TLabel
    Left = 24
    Top = 57
    Width = 162
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1073#1102#1076#1078#1077#1090#1072
  end
  object Label3: TLabel
    Left = 60
    Top = 122
    Width = 129
    Height = 19
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083
  end
  object Button1: TButton
    Left = 373
    Top = 184
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 453
    Top = 184
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 5
    OnClick = Button2Click
  end
  object EdKod: TEdit
    Left = 192
    Top = 24
    Width = 306
    Height = 24
    Color = clInfoBk
    TabOrder = 0
  end
  object EdTitle: TEdit
    Left = 191
    Top = 56
    Width = 333
    Height = 24
    Color = clInfoBk
    TabOrder = 2
  end
  object chbEnabled: TCheckBox
    Left = 184
    Top = 88
    Width = 233
    Height = 17
    Caption = #1063#1080' '#1072#1082#1090#1080#1074#1085#1080#1081' '#1073#1102#1076#1078#1077#1090'?'
    Checked = True
    Color = clInactiveBorder
    ParentColor = False
    State = cbChecked
    TabOrder = 3
  end
  object EmptyNomerButton: TcxButton
    Left = 500
    Top = 23
    Width = 23
    Height = 26
    Caption = #8470
    TabOrder = 1
    OnClick = EmptyNomerButtonClick
  end
  object EditDepartment: TcxButtonEdit
    Left = 192
    Top = 120
    Width = 332
    Height = 24
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
    Style.BorderStyle = ebs3D
    TabOrder = 6
  end
  object is_with_nds: TCheckBox
    Left = 183
    Top = 152
    Width = 233
    Height = 17
    Caption = #1063#1080' '#1074#1080#1076#1110#1083#1103#1108#1090#1100#1089#1103' '#1055#1044#1042'?'
    Color = clInactiveBorder
    ParentColor = False
    TabOrder = 7
  end
  object ActionList1: TActionList
    Left = 136
    Top = 184
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 16397
      OnExecute = Button1Click
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 13
      OnExecute = Button1Click
    end
    object Action3: TAction
      Caption = 'Action3'
      ShortCut = 27
      OnExecute = Button2Click
    end
  end
  object LocalUseDb: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 18
    Top = 186
  end
  object LocalUseReadTransaction: TpFIBTransaction
    DefaultDatabase = LocalUseDb
    TimeoutAction = TARollback
    Left = 48
    Top = 187
  end
  object LocalUseWriteTransaction: TpFIBTransaction
    DefaultDatabase = LocalUseDb
    TimeoutAction = TARollback
    Left = 69
    Top = 185
  end
end
