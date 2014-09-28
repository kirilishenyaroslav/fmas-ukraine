object FormPrt: TFormPrt
  Left = 211
  Top = 428
  BorderStyle = bsSingle
  Caption = 'FormPrt'
  ClientHeight = 104
  ClientWidth = 785
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 75
    Width = 785
    Height = 29
    Align = alBottom
    TabOrder = 0
    object ButtonYes: TcxButton
      Left = 592
      Top = 1
      Width = 75
      Height = 25
      Action = ActionYes
      TabOrder = 0
    end
    object ButtonCancel: TcxButton
      Left = 672
      Top = 1
      Width = 75
      Height = 25
      Action = ActionCancel
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 785
    Height = 75
    Align = alClient
    TabOrder = 1
    object LabelPogod: TcxLabel
      Left = -8
      Top = 6
      Width = 113
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 0
    end
    object ButtonEditPogod: TcxButtonEdit
      Left = 108
      Top = 5
      Width = 346
      Height = 21
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = ButtonEditPogodPropertiesButtonClick
      Style.Color = clWindow
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
    end
    object ButtonEditZatver: TcxButtonEdit
      Left = 108
      Top = 28
      Width = 346
      Height = 21
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = ButtonEditZatverPropertiesButtonClick
      Style.Color = clWindow
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
    object LabelZarver: TcxLabel
      Left = -9
      Top = 29
      Width = 113
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 3
    end
    object EditPogod: TcxLabel
      Left = 460
      Top = 5
      Width = 321
      Height = 21
      AutoSize = False
      ParentColor = False
      ParentFont = False
      Style.Color = clWindow
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
      Caption = ''
    end
    object EditZatver: TcxLabel
      Left = 460
      Top = 28
      Width = 321
      Height = 21
      AutoSize = False
      ParentColor = False
      ParentFont = False
      Style.Color = clWindow
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
      Caption = ''
    end
    object EditZavBuh: TcxLabel
      Left = 460
      Top = 51
      Width = 321
      Height = 21
      AutoSize = False
      ParentColor = False
      ParentFont = False
      Style.Color = clWindow
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 6
      Caption = ''
    end
  end
  object ButtonEditZavBuh: TcxButtonEdit
    Left = 108
    Top = 51
    Width = 346
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = ButtonEditZavBuhPropertiesButtonClick
    Style.Color = clWindow
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
  end
  object LabelZavBuh: TcxLabel
    Left = -8
    Top = 53
    Width = 113
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    TabOrder = 3
  end
  object ActionList: TActionList
    Left = 19
    Top = 18
    object ActionYes: TAction
      Caption = 'ActionYes'
      ShortCut = 13
      OnExecute = ActionYesExecute
    end
    object ActionCancel: TAction
      Caption = 'ActionCancel'
      ShortCut = 27
      OnExecute = ActionCancelExecute
    end
  end
end
