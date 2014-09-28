object TaxInvoicesFilterForm: TTaxInvoicesFilterForm
  Left = 461
  Top = 466
  BorderStyle = bsDialog
  Caption = #1060#1110#1083#1100#1090#1088
  ClientHeight = 179
  ClientWidth = 409
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 409
    Height = 65
    Align = alTop
    TabOrder = 0
    object PeriodReestrCheckBox: TcxCheckBox
      Left = 8
      Top = 8
      Width = 185
      Height = 21
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
    object MonthList: TcxComboBox
      Left = 32
      Top = 32
      Width = 129
      Height = 21
      TabOrder = 1
      Text = 'MonthList'
    end
    object YearSpinEdit: TcxSpinEdit
      Left = 160
      Top = 32
      Width = 97
      Height = 21
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 409
    Height = 72
    Align = alTop
    TabOrder = 1
    object TypeReestrCheckBox: TcxCheckBox
      Left = 8
      Top = 8
      Width = 193
      Height = 21
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
    object TypeReestrButtonEdit: TcxButtonEdit
      Left = 32
      Top = 32
      Width = 353
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      TabOrder = 1
      Text = 'TypeReestrButtonEdit'
    end
  end
  object OkButton: TcxButton
    Left = 224
    Top = 144
    Width = 75
    Height = 25
    Caption = #1054#1050
    Default = True
    TabOrder = 2
  end
  object CancelButton: TcxButton
    Left = 312
    Top = 144
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 3
    OnClick = CancelButtonClick
  end
end
