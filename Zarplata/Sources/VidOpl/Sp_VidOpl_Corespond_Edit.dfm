object FCorespondEdit: TFCorespondEdit
  Left = 258
  Top = 317
  BorderStyle = bsDialog
  Caption = 'FCorespondEdit'
  ClientHeight = 106
  ClientWidth = 609
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
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 609
    Height = 78
    Align = alTop
    Shape = bsBottomLine
  end
  object LabelNameVidOpl: TcxLabel
    Left = 0
    Top = 2
    Width = 609
    Height = 23
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 0
  end
  object EditVoName: TcxMaskEdit
    Left = 0
    Top = 24
    Width = 609
    Height = 24
    ParentFont = False
    Properties.ReadOnly = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 1
    Text = 'EditVoName'
  end
  object CorespondComboBox: TcxLookupComboBox
    Left = 184
    Top = 49
    Width = 425
    Height = 24
    ParentFont = False
    Properties.KeyFieldNames = 'ID_VOPL_PROP'
    Properties.ListColumns = <
      item
        FieldName = 'NAME_VOPL_PROP'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DSource
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
  end
  object LabelCorespond: TcxLabel
    Left = 0
    Top = 52
    Width = 177
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 3
  end
  object YesBtn: TcxButton
    Left = 376
    Top = 82
    Width = 75
    Height = 22
    Caption = 'YesBtn'
    TabOrder = 4
    OnClick = YesBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 472
    Top = 82
    Width = 75
    Height = 22
    Cancel = True
    Caption = 'CancelBtn'
    ModalResult = 2
    TabOrder = 5
    LookAndFeel.Kind = lfFlat
  end
  object DB: TpFIBDatabase
    DefaultTransaction = RTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 8
    Top = 72
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    Left = 40
    Top = 72
    poSQLINT64ToBCD = True
  end
  object RTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 72
    Top = 72
  end
  object DSource: TDataSource
    DataSet = DSet
    Left = 104
    Top = 72
  end
end
