object frmReestr_DissDog: TfrmReestr_DissDog
  Left = 483
  Top = 290
  Width = 347
  Height = 219
  Caption = 'frmReestr_DissDog'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox: TcxGroupBox
    Left = 3
    Top = 8
    Width = 332
    Height = 140
    Alignment = alTopLeft
    TabOrder = 0
    TabStop = False
    object OrderNum_Label: TLabel
      Left = 236
      Top = 14
      Width = 80
      Height = 13
      Caption = 'OrderNum_Label'
    end
    object Comments_Label: TLabel
      Left = 8
      Top = 95
      Width = 81
      Height = 13
      Caption = 'Comments_Label'
    end
    object DateDiss_Label: TLabel
      Left = 10
      Top = 14
      Width = 75
      Height = 13
      Caption = 'DateDiss_Label'
    end
    object OrderDate_Label: TLabel
      Left = 130
      Top = 14
      Width = 81
      Height = 13
      Caption = 'OrderDate_Label'
    end
    object TypeDiss_Label: TLabel
      Left = 8
      Top = 56
      Width = 81
      Height = 13
      Caption = 'Comments_Label'
    end
    object OrderNum_Edit: TcxTextEdit
      Left = 236
      Top = 32
      Width = 90
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.ReadOnly = False
      Style.Color = 16311512
      TabOrder = 2
    end
    object Comments_Edit: TcxTextEdit
      Left = 7
      Top = 109
      Width = 320
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.ReadOnly = False
      Style.Color = 16311512
      TabOrder = 4
    end
    object DateDiss: TcxDateEdit
      Left = 8
      Top = 32
      Width = 97
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.DateButtons = []
      Properties.ReadOnly = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = 16311512
      Style.ButtonTransparency = ebtInactive
      TabOrder = 0
    end
    object OrderDate: TcxDateEdit
      Left = 128
      Top = 32
      Width = 97
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.DateButtons = []
      Properties.ReadOnly = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = 16311512
      Style.ButtonTransparency = ebtInactive
      TabOrder = 1
    end
    object TypeDiss_Edit: TcxButtonEdit
      Left = 7
      Top = 71
      Width = 319
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
      Properties.OnButtonClick = TypeDiss_EditPropertiesButtonClick
      Style.Color = 16311512
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonStyle = btsDefault
      Style.ButtonTransparency = ebtInactive
      TabOrder = 3
    end
  end
  object OkButton: TcxButton
    Left = 152
    Top = 154
    Width = 92
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 250
    Top = 154
    Width = 85
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
end
