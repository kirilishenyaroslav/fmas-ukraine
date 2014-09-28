object PaymentCountForm: TPaymentCountForm
  Left = 431
  Top = 357
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'PaymentCountForm'
  ClientHeight = 215
  ClientWidth = 375
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
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 375
    Height = 215
    ActivePage = ParamInputPage
    Align = alClient
    TabOrder = 0
    object ParamInputPage: TTabSheet
      Caption = 'ParamInputPage'
      object NextBtn: TcxButton
        Left = 112
        Top = 136
        Width = 89
        Height = 25
        Caption = 'NextBtn'
        TabOrder = 0
      end
      object CancelBtn: TcxButton
        Left = 232
        Top = 136
        Width = 91
        Height = 25
        Caption = 'CancelBtn'
        TabOrder = 1
      end
      object ManSelectBox: TGroupBox
        Left = 8
        Top = 8
        Width = 313
        Height = 105
        Caption = 'ManSelectBox'
        TabOrder = 2
        object ManEdit: TcxButtonEdit
          Left = 24
          Top = 72
          Width = 281
          Height = 21
          Enabled = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          TabOrder = 0
        end
        object AllPeopleBtn: TRadioButton
          Left = 8
          Top = 24
          Width = 153
          Height = 17
          Caption = 'AllPeopleBtn'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          TabStop = True
        end
        object ManSelBtn: TRadioButton
          Left = 8
          Top = 72
          Width = 17
          Height = 17
          Caption = 'ManSelBtn'
          TabOrder = 2
        end
      end
    end
    object CountProcessPage: TTabSheet
      Caption = 'CountProcessPage'
      ImageIndex = 1
      object CountProgressBar: TcxProgressBar
        Left = 8
        Top = 120
        Width = 329
        Height = 21
        Properties.Transparent = True
        TabOrder = 0
      end
      object StartBtn: TcxButton
        Left = 128
        Top = 152
        Width = 75
        Height = 25
        Caption = 'StartBtn'
        TabOrder = 1
      end
      object StatusGroupBox: TGroupBox
        Left = 8
        Top = 16
        Width = 329
        Height = 73
        Caption = 'StatusGroupBox'
        TabOrder = 2
        object FamiliaCaption: TLabel
          Left = 8
          Top = 17
          Width = 105
          Height = 16
          Caption = 'FamiliaCaption'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object TnLabel: TLabel
          Left = 8
          Top = 40
          Width = 58
          Height = 16
          Caption = 'TnLabel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ManDBLabel: TcxDBLabel
          Left = 120
          Top = 16
          Width = 98
          Height = 20
          DataBinding.DataField = 'OUT_FAMILIA'
          DataBinding.DataSource = PeopleDataSource
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -13
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 0
          Visible = False
        end
        object TnDbLabel: TcxDBLabel
          Left = 120
          Top = 40
          Width = 86
          Height = 20
          DataBinding.DataField = 'OUT_TN'
          DataBinding.DataSource = PeopleDataSource
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -13
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 1
          Visible = False
        end
      end
    end
  end
  object cxEditRepository1: TcxEditRepository
    Left = 240
    Top = 71
    object MonthBoxRepository: TcxEditRepositoryComboBoxItem
      Properties.Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9'
        '10'
        '11'
        '12')
      Properties.ReadOnly = True
    end
  end
  object PeopleDataSet: TpFIBDataSet
    SelectSQL.Strings = (
      'select z.FAMILIA as OUT_FAMILIA,z.TN AS OUT_TN,'
      'Z.ID_MAN'
      'from Z_SPISOK_FOR_COUNT Z'
      'ORDER BY Z.TN')
    Left = 264
    Top = 71
    poSQLINT64ToBCD = True
    object PeopleDataSetOUT_FAMILIA: TFIBStringField
      FieldName = 'OUT_FAMILIA'
      Size = 255
      EmptyStrToNull = True
    end
    object PeopleDataSetOUT_TN: TFIBIntegerField
      FieldName = 'OUT_TN'
    end
    object PeopleDataSetID_MAN: TFIBIntegerField
      FieldName = 'ID_MAN'
    end
  end
  object ConvertQuery: TpFIBDataSet
    SelectSQL.Strings = (
      'select kod_setup'
      'from z_convert_date_to_kod(:Date_In)')
    Left = 264
    Top = 39
    poSQLINT64ToBCD = True
    object ConvertQueryKOD_SETUP: TFIBIntegerField
      FieldName = 'KOD_SETUP'
    end
  end
  object PeopleDataSource: TDataSource
    DataSet = PeopleDataSet
    Left = 296
    Top = 39
  end
  object GetCurPeriod: TpFIBQuery
    SQL.Strings = (
      'SELECT YEAR_SET,MONTH_SET'
      'FROM   Z_SETUP')
    Left = 232
    Top = 39
  end
  object GetGroupQuery: TpFIBQuery
    SQL.Strings = (
      'SELECT  ID_GROUP_ACCOUNT'
      'FROM Z_GET_NEW_GROUP_ACCOUNT')
    Left = 200
    Top = 39
  end
  object GetMonthBoundsQuery: TpFIBQuery
    SQL.Strings = (
      'SELECT  MONTH_BEG,MONTH_END '
      'FROM GET_MONTH_BOUNDS(:YEAR,:MONTH)')
    Left = 232
    Top = 8
  end
  object ClearTmpProc: TpFIBStoredProc
    Left = 208
    Top = 71
  end
  object UVProc: TpFIBStoredProc
    Left = 176
    Top = 71
  end
end
