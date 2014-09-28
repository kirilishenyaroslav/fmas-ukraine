object FCtrlStudVacation: TFCtrlStudVacation
  Left = 735
  Top = 108
  BorderStyle = bsDialog
  Caption = 'ActionYes'
  ClientHeight = 166
  ClientWidth = 546
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BoxMan: TcxGroupBox
    Left = 0
    Top = 0
    Width = 546
    Height = 44
    Align = alTop
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
  object BoxDates: TcxGroupBox
    Left = 0
    Top = 44
    Width = 545
    Height = 69
    Align = alCustom
    Alignment = alTopLeft
    Caption = 'BoxDates'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    TabStop = False
    object DateBegLabel: TcxLabel
      Left = 48
      Top = 15
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
      Left = 159
      Top = 14
      Width = 97
      Height = 24
      ImeMode = imHanguel
      Properties.DateButtons = [btnToday]
      Properties.InputKind = ikMask
      Properties.MaxDate = 55153.000000000000000000
      Properties.MinDate = 36526.000000000000000000
      TabOrder = 0
      EditValue = 38353d
    end
    object EditDateEnd: TcxDateEdit
      Left = 261
      Top = 14
      Width = 97
      Height = 24
      Properties.DateButtons = [btnToday]
      Properties.InputKind = ikMask
      Properties.MaxDate = 55153.000000000000000000
      Properties.MinDate = 36526.000000000000000000
      TabOrder = 1
      EditValue = 38353d
    end
    object DateEndLabel: TcxLabel
      Left = 360
      Top = 16
      Width = 89
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
    end
    object EditPrikaz: TcxButtonEdit
      Left = 136
      Top = 37
      Width = 409
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
          Visible = False
        end>
      Properties.MaskKind = emkRegExpr
      Properties.ReadOnly = False
      Style.Color = clWindow
      TabOrder = 4
    end
    object LabelPrikaz: TcxLabel
      Left = 0
      Top = 39
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
      TabOrder = 5
      Caption = 'LabelPrikaz'
    end
  end
  object YesBtn: TcxButton
    Left = 368
    Top = 116
    Width = 81
    Height = 25
    Caption = 'ActionYes'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = YesBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 456
    Top = 116
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
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 146
    Width = 546
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
    Top = 116
    object ActionYes: TAction
      Caption = 'ActionYes'
      ShortCut = 121
      SecondaryShortCuts.Strings = (
        'Ctrl+End')
      OnExecute = YesBtnClick
    end
    object ActionEnter: TAction
      Caption = 'ActionEnter'
      ShortCut = 13
      OnExecute = ActionEnterExecute
    end
    object ActionF9: TAction
      Caption = 'ActionF9'
      ShortCut = 120
      OnExecute = ActionF9Execute
    end
  end
end
