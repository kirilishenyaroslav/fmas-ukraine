object ScriptForm: TScriptForm
  Left = 186
  Top = 149
  BorderStyle = bsDialog
  Caption = 'Параметры скрипта'
  ClientHeight = 481
  ClientWidth = 632
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 256
    Width = 43
    Height = 13
    Caption = 'Скрипт'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 568
    Top = 467
    Width = 62
    Height = 13
    Caption = '(c) Qizz 2003'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSilver
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 16
    Top = 464
    Width = 42
    Height = 13
    Caption = 'ver 1.3.5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSilver
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object GenBox: TCheckBox
    Left = 24
    Top = 24
    Width = 153
    Height = 17
    Caption = 'Генератор'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    State = cbChecked
    TabOrder = 10
  end
  object GenEdit: TEdit
    Left = 200
    Top = 22
    Width = 273
    Height = 21
    MaxLength = 31
    TabOrder = 0
  end
  object InsertBox: TCheckBox
    Left = 24
    Top = 72
    Width = 169
    Height = 17
    Caption = 'Процедура добавления'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    State = cbChecked
    TabOrder = 11
  end
  object InsertEdit: TEdit
    Left = 200
    Top = 70
    Width = 273
    Height = 21
    MaxLength = 31
    TabOrder = 1
  end
  object UpdateBox: TCheckBox
    Left = 24
    Top = 136
    Width = 169
    Height = 17
    Caption = 'Процедура изменения'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    State = cbChecked
    TabOrder = 12
  end
  object UpdateEdit: TEdit
    Left = 200
    Top = 134
    Width = 273
    Height = 21
    MaxLength = 31
    TabOrder = 3
  end
  object DeleteBox: TCheckBox
    Left = 24
    Top = 168
    Width = 169
    Height = 17
    Caption = 'Процедура удаления'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    State = cbChecked
    TabOrder = 13
  end
  object DeleteEdit: TEdit
    Left = 200
    Top = 166
    Width = 273
    Height = 21
    MaxLength = 31
    TabOrder = 4
  end
  object SelectBox: TCheckBox
    Left = 24
    Top = 200
    Width = 169
    Height = 17
    Caption = 'Процедура выборки'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    State = cbChecked
    TabOrder = 14
  end
  object SelectEdit: TEdit
    Left = 200
    Top = 198
    Width = 273
    Height = 21
    MaxLength = 31
    TabOrder = 5
  end
  object ScriptMemo: TMemo
    Left = 24
    Top = 272
    Width = 585
    Height = 161
    Lines.Strings = (
      '')
    OEMConvert = True
    TabOrder = 6
  end
  object OkButton: TBitBtn
    Left = 358
    Top = 440
    Width = 97
    Height = 25
    Caption = 'Создать'
    Default = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = OkButtonClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000C40E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777777772222277777777722222222277777722222222222777722222222222
      22777222227F22222277222227FFF222222722227F7FF222222722222222FF22
      222722222222FF222227222222222FF22227722222222FF22277722222222222
      2277772222222222277777722222222277777777722222777777}
  end
  object CancelButton: TBitBtn
    Left = 478
    Top = 440
    Width = 97
    Height = 25
    Cancel = True
    Caption = 'Отмена'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 8
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777770777777777707770907777777779777999077777770777799997777770
      9777779990777709777777799907709977777777999009977777777779999977
      7777777770999077777777770999990777777700999779907777709999777799
      0777799997777779907779997777777779777777777777777777}
  end
  object DescBox: TCheckBox
    Left = 24
    Top = 232
    Width = 97
    Height = 17
    Caption = 'Описания'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    State = cbChecked
    TabOrder = 15
  end
  object CopyButton: TBitBtn
    Left = 64
    Top = 440
    Width = 113
    Height = 25
    Caption = 'В буфер!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = CopyButtonClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777000000000
      0007770FFFFFFFFFFF07770FFFFFFFFFFF07707F777777777F07770FFFFFFFFF
      FF07707F777777777F07770FFFFFFFFFFF07707F777777777F07770FFFFFFFFF
      FF07707F777777777F07770FFFFFFFFFFF07707F777777777F07770FFFFFFFFF
      FF07707F777777777F07770FFFFFFFFFFF077788888888888877}
  end
  object GetIdBox: TCheckBox
    Left = 96
    Top = 104
    Width = 377
    Height = 17
    Caption = 'Возвращать идентификатор добавленной записи'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    State = cbChecked
    TabOrder = 2
  end
end
