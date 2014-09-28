object frmSetFilter: TfrmSetFilter
  Left = 326
  Top = 185
  BorderStyle = bsDialog
  ClientHeight = 75
  ClientWidth = 248
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 248
    Height = 37
    Align = alClient
    TabOrder = 0
    object ComboBox_Month: TcxComboBox
      Left = 61
      Top = 8
      Width = 110
      Height = 21
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownRows = 12
      Properties.MaskKind = emkRegExpr
      Style.Color = clInfoBk
      TabOrder = 0
      OnKeyDown = ComboBox_MonthKeyDown
    end
    object Label_PeriodBeg: TcxLabel
      Left = 8
      Top = 8
      Width = 49
      Height = 17
      TabStop = False
      AutoSize = False
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      TabOrder = 2
      Caption = #1053#1072' '#1076#1072#1090#1091
    end
    object ComboBox_Year: TcxComboBox
      Left = 169
      Top = 8
      Width = 73
      Height = 21
      Properties.DropDownListStyle = lsFixedList
      Properties.MaskKind = emkRegExpr
      Properties.MaxLength = 0
      Style.Color = clInfoBk
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 37
    Width = 248
    Height = 38
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      248
      38)
    object Button_OK: TcxButton
      Left = 82
      Top = 7
      Width = 75
      Height = 25
      Action = act_OK
      Anchors = [akTop, akRight]
      Default = True
      TabOrder = 0
    end
    object Button_Cancel: TcxButton
      Left = 165
      Top = 7
      Width = 75
      Height = 25
      Action = act_Cancel
      Anchors = [akTop, akRight]
      TabOrder = 1
    end
  end
  object ActionList1: TActionList
    Left = 24
    Top = 40
    object act_OK: TAction
      Caption = 'act_OK'
      ShortCut = 13
      OnExecute = act_OKExecute
    end
    object act_Cancel: TAction
      Caption = 'act_Cancel'
      ShortCut = 27
      OnExecute = act_CancelExecute
    end
  end
end
