object fmAddRaspAvance: TfmAddRaspAvance
  Left = 328
  Top = 250
  Width = 438
  Height = 182
  Caption = 'fmAddRaspAvance'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 4
    Top = 3
    Width = 410
    Height = 84
  end
  object cxMRUEdit: TcxMRUEdit
    Left = 120
    Top = 8
    Width = 281
    Height = 21
    Properties.OnButtonClick = cxMRUEditPropertiesButtonClick
    Style.Color = 16776176
    TabOrder = 3
  end
  object cxTextEditNumber: TcxTextEdit
    Left = 120
    Top = 32
    Width = 81
    Height = 21
    Properties.MaxLength = 5
    Style.Color = 16776176
    TabOrder = 5
  end
  object cxTextEditSumma: TcxTextEdit
    Left = 280
    Top = 32
    Width = 121
    Height = 21
    Style.Color = 16776176
    TabOrder = 0
    OnKeyPress = cxTextEditSummaKeyPress
  end
  object GroupBox1: TGroupBox
    Left = 160
    Top = 88
    Width = 254
    Height = 52
    Caption = 'GroupBox1'
    TabOrder = 1
    object cxButtonClose: TcxButton
      Left = 153
      Top = 19
      Width = 93
      Height = 25
      Action = ActionClose
      Cancel = True
      TabOrder = 1
    end
    object cxButton1: TcxButton
      Left = 23
      Top = 19
      Width = 122
      Height = 25
      Action = ActionAdd
      Default = True
      TabOrder = 0
    end
  end
  object cxLabel1: TcxLabel
    Left = 32
    Top = 8
    Width = 51
    Height = 17
    TabOrder = 2
  end
  object cxLabel2: TcxLabel
    Left = 32
    Top = 32
    Width = 51
    Height = 17
    TabOrder = 4
  end
  object cxLabel3: TcxLabel
    Left = 224
    Top = 32
    Width = 51
    Height = 17
    TabOrder = 6
  end
  object cxButtonEdit1: TcxButtonEdit
    Left = 200
    Top = 59
    Width = 201
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
    Style.Color = 16776176
    TabOrder = 7
    Visible = False
  end
  object cxCheckBox1: TcxCheckBox
    Left = 8
    Top = 58
    Width = 185
    Height = 21
    Properties.DisplayUnchecked = 'False'
    TabOrder = 8
    OnClick = cxCheckBox1Click
  end
  object ActionList1: TActionList
    Left = 104
    Top = 104
    object ActionAdd: TAction
      Caption = 'ActionAdd'
      ShortCut = 13
      OnExecute = ActionAddExecute
    end
    object ActionClose: TAction
      Caption = 'ActionClose'
      ShortCut = 27
      OnExecute = ActionCloseExecute
    end
  end
  object pFIBTransaction1: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 48
    Top = 104
  end
  object pFIBDatabase1: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'password=masterkey'
      'user_name=SYSDBA')
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 104
  end
end
