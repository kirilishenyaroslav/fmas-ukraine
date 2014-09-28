object FormTshSign: TFormTshSign
  Left = 148
  Top = 198
  BorderStyle = bsDialog
  Caption = #1044#1088#1091#1082' '#1090#1072#1073#1077#1083#1103
  ClientHeight = 142
  ClientWidth = 815
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 815
    Height = 104
    Align = alClient
    TabOrder = 0
    object EditResponsible: TcxButtonEdit
      Left = 180
      Top = 4
      Width = 290
      Height = 21
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = EditResponsiblePropertiesButtonClick
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = False
      TabOrder = 0
    end
    object EditHead: TcxButtonEdit
      Left = 180
      Top = 27
      Width = 290
      Height = 21
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = EditHeadPropertiesButtonClick
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
    object EditPersonnel: TcxButtonEdit
      Left = 180
      Top = 52
      Width = 290
      Height = 21
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = EditPersonnelPropertiesButtonClick
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
    end
    object cxLabel1: TcxLabel
      Left = 0
      Top = 30
      Width = 180
      Height = 17
      Style.Edges = [bLeft, bTop, bRight, bBottom]
      TabOrder = 7
      Caption = #1050#1077#1088#1110#1074#1085#1080#1082' '#1089#1090#1088#1091#1082#1090#1091#1088#1085#1086#1075#1086' '#1087#1110#1076#1088#1086#1079#1076#1110#1083#1091':'
    end
    object cxLabel2: TcxLabel
      Left = 64
      Top = 6
      Width = 115
      Height = 17
      Style.Edges = [bLeft, bTop, bRight, bBottom]
      TabOrder = 8
      Caption = #1042#1110#1076#1087#1086#1074#1110#1076#1072#1083#1100#1085#1072' '#1086#1089#1086#1073#1072':'
    end
    object cxLabel3: TcxLabel
      Left = 28
      Top = 56
      Width = 151
      Height = 17
      Style.Edges = [bLeft, bTop, bRight, bBottom]
      TabOrder = 9
      Caption = #1055#1088#1072#1094#1110#1074#1085#1080#1082' '#1082#1072#1076#1088#1086#1074#1086#1111' '#1089#1083#1091#1078#1073#1080':'
    end
    object EditResponsiblePost: TcxTextEdit
      Left = 473
      Top = 4
      Width = 335
      Height = 21
      TabOrder = 1
    end
    object EditHeadPost: TcxTextEdit
      Left = 473
      Top = 27
      Width = 335
      Height = 21
      TabOrder = 3
    end
    object EditPersonnelPost: TcxTextEdit
      Left = 473
      Top = 51
      Width = 335
      Height = 21
      TabOrder = 5
    end
    object EditDatePrint: TcxDateEdit
      Left = 687
      Top = 76
      Width = 121
      Height = 21
      TabOrder = 6
    end
    object cxLabel4: TcxLabel
      Left = 622
      Top = 78
      Width = 68
      Height = 17
      Style.Edges = [bLeft, bTop, bRight, bBottom]
      TabOrder = 10
      Caption = #1044#1072#1090#1072' '#1076#1088#1091#1082#1091':'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 104
    Width = 815
    Height = 38
    Align = alBottom
    TabOrder = 1
    object ButtonYes: TcxButton
      Left = 723
      Top = 6
      Width = 75
      Height = 25
      Action = ActionCancel
      TabOrder = 1
    end
    object ButtonCancel: TcxButton
      Left = 644
      Top = 6
      Width = 75
      Height = 25
      Action = ActionYes
      TabOrder = 0
    end
  end
  object ActionList: TActionList
    Left = 28
    Top = 16
    object ActionYes: TAction
      Caption = #1044#1088#1091#1082
      ShortCut = 13
      OnExecute = ActionYesExecute
    end
    object ActionCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1072
      ShortCut = 27
      OnExecute = ActionCancelExecute
    end
  end
end
