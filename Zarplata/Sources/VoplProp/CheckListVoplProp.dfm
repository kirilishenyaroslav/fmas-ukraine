object FCheckList: TFCheckList
  Left = 269
  Top = 144
  BorderStyle = bsDialog
  Caption = 'FCheckList'
  ClientHeight = 250
  ClientWidth = 570
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
  object CheckListBox: TcxCheckListBox
    Left = 0
    Top = 25
    Width = 570
    Height = 192
    EditValue = 0
    Align = alClient
    Columns = 0
    Items = <>
    ParentFont = False
    ScrollWidth = 0
    Style.Color = 16247513
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
    TabWidth = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 570
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object CheckAllBtn: TcxButton
      Left = 360
      Top = 0
      Width = 105
      Height = 25
      Caption = 'CheckAllBtn'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = CheckAllBtnClick
      LookAndFeel.Kind = lfFlat
    end
    object UnCheckAllBtn: TcxButton
      Left = 464
      Top = 0
      Width = 105
      Height = 25
      Caption = 'UnCheckAllBtn'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = UnCheckAllBtnClick
      LookAndFeel.Kind = lfFlat
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 217
    Width = 570
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object YesBtn: TcxButton
      Left = 416
      Top = 5
      Width = 73
      Height = 25
      Action = Action1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
    end
    object CancelBtn: TcxButton
      Left = 488
      Top = 5
      Width = 73
      Height = 25
      Caption = 'CancelBtn'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = CancelBtnClick
      LookAndFeel.Kind = lfFlat
    end
  end
  object ActionList1: TActionList
    Left = 288
    Top = 216
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 121
      OnExecute = Action1Execute
    end
  end
end
