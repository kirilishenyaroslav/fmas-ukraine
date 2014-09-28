object FAllSort: TFAllSort
  Left = 218
  Top = 182
  BorderStyle = bsDialog
  Caption = 'FAllSort'
  ClientHeight = 126
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 393
    Height = 101
    Shape = bsFrame
  end
  object YesBtn: TcxButton
    Left = 216
    Top = 104
    Width = 73
    Height = 21
    Action = ActionYes
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 296
    Top = 104
    Width = 73
    Height = 21
    Action = ActionCancel
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
  end
  object RadioGroupOrder: TcxRadioGroup
    Left = 4
    Top = 63
    Width = 385
    Height = 33
    ItemIndex = 0
    Properties.Columns = 2
    Properties.Items = <
      item
      end
      item
      end>
    TabOrder = 2
  end
  object GroupBank: TcxGroupBox
    Left = 4
    Top = 23
    Width = 385
    Height = 41
    Alignment = alTopLeft
    Caption = 'GroupBank'
    TabOrder = 3
    object BankEdit: TcxButtonEdit
      Left = 8
      Top = 16
      Width = 369
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = BankEditPropertiesButtonClick
      TabOrder = 0
    end
  end
  object MonthesList: TcxComboBox
    Left = 109
    Top = 4
    Width = 172
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      'January'
      'February')
    TabOrder = 4
  end
  object YearSpinEdit: TcxSpinEdit
    Left = 278
    Top = 4
    Width = 71
    Height = 21
    Properties.Alignment.Horz = taRightJustify
    Properties.CanEdit = False
    Properties.MaxValue = 2100.000000000000000000
    Properties.MinValue = 1995.000000000000000000
    TabOrder = 5
    Value = 2000
  end
  object LabelPeriod: TcxLabel
    Left = 8
    Top = 6
    Width = 104
    Height = 17
    AutoSize = False
    TabOrder = 6
  end
  object ActionList: TActionList
    Left = 16
    Top = 64
    object ActionYes: TAction
      Caption = 'ActionYes'
      ShortCut = 121
      OnExecute = ActionYesExecute
    end
    object ActionCancel: TAction
      Caption = 'ActionCancel'
      ShortCut = 27
      OnExecute = ActionCancelExecute
    end
  end
end
