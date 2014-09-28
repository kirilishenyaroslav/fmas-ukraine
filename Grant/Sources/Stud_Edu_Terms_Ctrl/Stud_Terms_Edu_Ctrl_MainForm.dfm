object FCtrlEduStudTerms: TFCtrlEduStudTerms
  Left = 631
  Top = 474
  BorderStyle = bsDialog
  Caption = 'FCtrlEduStudTerms'
  ClientHeight = 170
  ClientWidth = 554
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
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object YesBtn: TcxButton
    Left = 368
    Top = 119
    Width = 81
    Height = 25
    Action = ActionYes
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 456
    Top = 119
    Width = 81
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = CancelBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object BoxMan: TcxGroupBox
    Left = 0
    Top = -3
    Width = 553
    Height = 44
    Alignment = alTopLeft
    Caption = 'BoxMan'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    TabStop = False
    object LabelMan: TcxLabel
      Left = 0
      Top = 15
      Width = 137
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Caption = 'LabelMan'
    end
    object EditMan: TcxButtonEdit
      Left = 136
      Top = 13
      Width = 409
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
          Visible = False
        end>
      Properties.MaskKind = emkRegExpr
      Properties.ReadOnly = True
      Style.Color = clWindow
      TabOrder = 0
    end
  end
  object BoxDatesSum: TcxGroupBox
    Left = 0
    Top = 40
    Width = 553
    Height = 73
    Alignment = alTopLeft
    Caption = 'BoxMain'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    TabStop = False
    object DateBegLabel: TcxLabel
      Left = 93
      Top = 16
      Width = 105
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
    object EditDateBeg: TcxDateEdit
      Left = 207
      Top = 14
      Width = 97
      Height = 24
      ImeMode = imHanguel
      Properties.DateButtons = [btnToday]
      Properties.InputKind = ikMask
      Properties.MaxDate = 55153.000000000000000000
      Properties.MinDate = 36526.000000000000000000
      TabOrder = 0
      EditValue = 38384d
    end
    object EditDateEnd: TcxDateEdit
      Left = 309
      Top = 14
      Width = 97
      Height = 24
      Properties.DateButtons = [btnToday]
      Properties.InputKind = ikMask
      Properties.MaxDate = 55153.000000000000000000
      Properties.MinDate = 36526.000000000000000000
      TabOrder = 1
      EditValue = 38384d
    end
    object DateEndLabel: TcxLabel
      Left = 415
      Top = 15
      Width = 86
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
    end
    object PrikazMaskEdit: TcxMaskEdit
      Left = 112
      Top = 40
      Width = 433
      Height = 24
      Properties.MaskKind = emkRegExprEx
      Properties.MaxLength = 0
      TabOrder = 4
    end
    object PrikazLabel: TcxLabel
      Left = 5
      Top = 40
      Width = 105
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
      Caption = #1053#1072#1082#1072#1079
    end
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 150
    Width = 554
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Width = 170
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Width = 170
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
      end>
    PaintStyle = stpsOffice11
    LookAndFeel.Kind = lfStandard
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object Actions: TActionList
    Left = 40
    Top = 120
    object ActionYes: TAction
      Caption = 'ActionYes'
      ShortCut = 121
      SecondaryShortCuts.Strings = (
        'Ctrl+End')
      OnExecute = ActionYesExecute
    end
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 120
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 13
      OnExecute = Action2Execute
    end
  end
end
