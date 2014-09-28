object fmMain: TfmMain
  Left = 264
  Top = 158
  Width = 820
  Height = 498
  Caption = 'IBScript Executer'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  Menu = mnuMain
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShortCut = FormShortCut
  PixelsPerInch = 96
  TextHeight = 13
  object stbMain: TStatusBar
    Left = 0
    Top = 411
    Width = 804
    Height = 29
    Panels = <>
    SimplePanel = True
  end
  object lvwOutput: TListView
    Left = 0
    Top = 0
    Width = 804
    Height = 411
    Align = alClient
    Columns = <
      item
        Caption = #8470
        MinWidth = 50
      end
      item
        AutoSize = True
        Caption = 'File Name'
        MinWidth = 150
      end
      item
        Caption = 'Status'
        MaxWidth = 200
        MinWidth = 40
        Width = 100
      end>
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    GridLines = True
    ReadOnly = True
    ParentFont = False
    TabOrder = 1
    ViewStyle = vsReport
  end
  object mnuMain: TMainMenu
    Left = 24
    Top = 32
    object mnuTest: TMenuItem
      Caption = 'Test'
      object mnuStart: TMenuItem
        Caption = 'Start'
        Enabled = False
        ShortCut = 120
        OnClick = mnuStartClick
      end
      object mnuCreateTestList: TMenuItem
        Caption = 'Create Test List'
        ShortCut = 113
        OnClick = mnuCreateTestListClick
      end
    end
    object mnuOptions: TMenuItem
      Caption = 'Options'
      OnClick = mnuOptionsClick
    end
    object mnuExit: TMenuItem
      Caption = 'Exit'
      OnClick = mnuExitClick
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '*.ini'
    Filter = 'INI - Files (*.ini)|*.ini'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 87
    Top = 32
  end
end
