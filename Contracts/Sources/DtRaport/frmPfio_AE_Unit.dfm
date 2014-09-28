object frmPfio_AE: TfrmPfio_AE
  Left = 544
  Top = 339
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmPfio_AE'
  ClientHeight = 162
  ClientWidth = 307
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object OKButton: TcxButton
    Left = 119
    Top = 129
    Width = 91
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 0
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 215
    Top = 129
    Width = 91
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object GroupBox: TGroupBox
    Left = 0
    Top = 0
    Width = 307
    Height = 121
    Align = alTop
    TabOrder = 2
    DesignSize = (
      307
      121)
    object SummaLabel: TLabel
      Left = 195
      Top = 93
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = #1057#1091#1084#1084#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object NameFac_Label: TLabel
      Left = 8
      Top = 40
      Width = 3
      Height = 13
    end
    object NameGroup_Label: TLabel
      Left = 8
      Top = 56
      Width = 3
      Height = 13
    end
    object Kurs_Label: TLabel
      Left = 8
      Top = 72
      Width = 3
      Height = 13
    end
    object PFio_Edit: TcxButtonEdit
      Left = 8
      Top = 16
      Width = 288
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
      Properties.OnButtonClick = TypeDocum_EditPropertiesButtonClick
      Style.Color = 16311512
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonTransparency = ebtNone
      TabOrder = 0
      OnKeyPress = PFio_EditKeyPress
    end
    object SummaEdit: TcxCurrencyEdit
      Left = 235
      Top = 90
      Width = 59
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      BeepOnEnter = False
      EditValue = 0c
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '0.00;'
      Properties.ReadOnly = True
      Style.Color = 16311512
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clDefault
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 1
      OnKeyPress = SummaEditKeyPress
    end
  end
end
