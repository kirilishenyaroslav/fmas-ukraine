object FormZSpr_Viplata_Control: TFormZSpr_Viplata_Control
  Left = 417
  Top = 287
  AutoSize = True
  BorderStyle = bsDialog
  Caption = 'FormZSpr_Viplata_Control'
  ClientHeight = 209
  ClientWidth = 553
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object IdentificationBox: TcxGroupBox
    Left = 0
    Top = 0
    Width = 553
    Height = 209
    Alignment = alTopLeft
    Caption = 'IdentificationBox'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Bevel1: TBevel
      Left = 8
      Top = 46
      Width = 537
      Height = 3
      Style = bsRaised
    end
    object MaskEditShortName: TcxMaskEdit
      Left = 328
      Top = 16
      Width = 217
      Height = 24
      Properties.MaskKind = emkRegExpr
      Properties.MaxLength = 0
      TabOrder = 0
      OnKeyPress = MaskEditShortNameKeyPress
    end
    object MaskEditFullName: TcxMaskEdit
      Left = 8
      Top = 80
      Width = 537
      Height = 24
      Properties.MaskKind = emkRegExpr
      Properties.MaxLength = 0
      TabOrder = 1
      OnKeyPress = MaskEditFullNameKeyPress
    end
    object LabelFullName: TcxLabel
      Left = 8
      Top = 56
      Width = 537
      Height = 24
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
    object LabelShortName: TcxLabel
      Left = 8
      Top = 16
      Width = 318
      Height = 22
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
    end
    object cxLabel1: TcxLabel
      Left = 8
      Top = 117
      Width = 537
      Height = 24
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
      Caption = #1056#1077#1108#1089#1090#1088#1072#1094#1110#1081#1085#1110' '#1072#1090#1088#1080#1073#1091#1090#1080
    end
    object cxButtonEdit1: TcxButtonEdit
      Left = 8
      Top = 141
      Width = 537
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      TabOrder = 5
    end
    object YesBtn: TcxButton
      Left = 168
      Top = 176
      Width = 81
      Height = 25
      Action = Action1
      TabOrder = 6
      LookAndFeel.Kind = lfFlat
    end
    object CancelBtn: TcxButton
      Left = 304
      Top = 176
      Width = 81
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 7
      OnClick = CancelBtnClick
      LookAndFeel.Kind = lfFlat
    end
  end
  object ActionList1: TActionList
    Left = 472
    Top = 120
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 121
      OnExecute = Action1Execute
    end
  end
end
