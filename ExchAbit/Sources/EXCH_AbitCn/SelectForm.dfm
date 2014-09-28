object Select_Form: TSelect_Form
  Left = 567
  Top = 125
  BorderStyle = bsDialog
  ClientHeight = 71
  ClientWidth = 599
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
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 48
    Height = 16
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SearchPanel: TPanel
    Left = 0
    Top = 32
    Width = 599
    Height = 39
    Align = alBottom
    TabOrder = 0
    object SelectBtn: TcxButton
      Left = 510
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = SelectBtnClick
    end
    object cxLookupComboBoxSpec: TcxLookupComboBox
      Left = 16
      Top = 8
      Width = 481
      Height = 22
      TabStop = False
      AutoSize = False
      Properties.AutoSelect = False
      Properties.KeyFieldNames = 'RES'
      Properties.ListColumns = <
        item
          Caption = 'NAME'
          Sorting = False
          FieldName = 'NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = DSCnOnMS
      TabOrder = 1
    end
  end
  object SPCnOnMS: TADOStoredProc
    Parameters = <>
    Left = 112
  end
  object DSCnOnMS: TDataSource
    DataSet = SPCnOnMS
    Left = 145
    Top = 2
  end
end
