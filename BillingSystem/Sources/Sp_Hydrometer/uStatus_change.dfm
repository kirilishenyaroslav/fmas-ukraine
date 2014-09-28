object frmStatus_change: TfrmStatus_change
  Left = 690
  Top = 400
  Width = 282
  Height = 166
  Caption = #1047#1084#1110#1085#1072' '#1089#1090#1072#1090#1091#1089#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel1: TcxLabel
    Left = 8
    Top = 22
    Width = 42
    Height = 17
    TabOrder = 0
    Caption = #1057#1090#1072#1090#1091#1089
  end
  object Button_OK: TcxButton
    Left = 57
    Top = 90
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = Button_OKClick
  end
  object Button_cancel: TcxButton
    Left = 145
    Top = 90
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = Button_cancelClick
  end
  object lblDate: TcxLabel
    Left = 10
    Top = 50
    Width = 51
    Height = 17
    TabOrder = 3
    Caption = #1047' '#1076#1072#1090#1080
  end
  object DateSet: TcxDateEdit
    Left = 56
    Top = 48
    Width = 145
    Height = 21
    TabOrder = 4
  end
  object StateBox: TcxLookupComboBox
    Left = 56
    Top = 21
    Width = 193
    Height = 21
    BeepOnEnter = False
    ParentFont = False
    Properties.AutoSelect = False
    Properties.IncrementalFiltering = False
    Properties.KeyFieldNames = 'Id_Hydrometer_Status'
    Properties.ListColumns = <
      item
        FieldName = 'Name_Hydrometer_Status'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = StateDS
    Properties.OnInitPopup = StateBoxPropertiesInitPopup
    EditValue = ''
    TabOrder = 5
  end
  object StateSet: TpFIBDataSet
    Database = dmHydrometer_DM.DB
    Transaction = dmHydrometer_DM.ReadTransaction
    UpdateTransaction = dmHydrometer_DM.WriteTransaction
    Left = 192
    Top = 24
    poSQLINT64ToBCD = True
  end
  object StateDS: TDataSource
    DataSet = StateSet
    Left = 232
    Top = 24
  end
end
