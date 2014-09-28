object dt_Type_Doc_Form_Add1: Tdt_Type_Doc_Form_Add1
  Left = 371
  Top = 263
  BorderStyle = bsDialog
  Caption = 'Додавання типу документів'
  ClientHeight = 87
  ClientWidth = 354
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 109
    Height = 13
    Caption = 'Назва типу продукції:'
  end
  object Name_Type_Doc: TEdit
    Left = 8
    Top = 24
    Width = 337
    Height = 21
    Color = clInfoBk
    TabOrder = 0
  end
  object Button1: TButton
    Left = 192
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Прийняти'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 272
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Відмінити'
    TabOrder = 2
    OnClick = Button2Click
  end
end
