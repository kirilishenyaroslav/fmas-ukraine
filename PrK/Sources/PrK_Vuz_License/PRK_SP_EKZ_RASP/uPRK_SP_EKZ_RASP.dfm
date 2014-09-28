inherited FormPRK_SP_EKZ_RASP: TFormPRK_SP_EKZ_RASP
  Left = 257
  Top = 245
  Height = 470
  Caption = 'FormPRK_SP_EKZ_RASP'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGridPrKVuzLicense: TcxGrid
    TabOrder = 2
    inherited cxGridPrKVuzLicenseDBTableView1: TcxGridDBTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
    end
  end
  inherited dxStatusBarVL: TdxStatusBar
    Top = 423
  end
  inherited cxGroupBoxPlanNabora: TcxGroupBox
    Top = 36
    Width = 399
    Height = 387
    TabOrder = 5
    inherited cxGridPrKPlanNabora: TcxGrid
      Width = 395
      Height = 230
      inherited cxGridPrKPlanNaboraDBTableView1: TcxGridDBTableView
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        inherited colSHORT_NAME_FAK: TcxGridDBColumn
          Width = 108
        end
        inherited colNAME_CN_FACUL_SPEC: TcxGridDBColumn
          Width = 106
        end
        inherited colSHORT_NAME_CN_KAT_STUD: TcxGridDBColumn
          Width = 90
        end
        inherited colSHORT_NAME_CN_FORM_STUD: TcxGridDBColumn
          Width = 89
        end
      end
    end
    inherited cxGroupBoxPlanNaborDopData: TcxGroupBox
      Top = 245
      Width = 395
    end
  end
  inherited cxGroupBoxPlanSelNabor: TcxGroupBox
    Left = 407
    Top = 36
    Width = 251
    Height = 387
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 247
      Height = 165
    end
    inherited cxGridPrKCelPlanNabora: TcxGrid
      Top = 180
      Width = 247
      Height = 205
      inherited cxGridPrKCelPlanNaboraDBTableView1: TcxGridDBTableView
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        inherited colSHORT_NAME_CEL_ZAMOV: TcxGridDBColumn
          Visible = False
          Width = 151
        end
        inherited colPLAN_VALUE: TcxGridDBColumn
          Visible = False
          Width = 94
        end
        object colNAME_PREDM: TcxGridDBColumn
          Width = 147
          DataBinding.FieldName = 'SHORT_NAME_PREDM'
        end
        object colEKZ_DATE: TcxGridDBColumn
          Width = 98
          DataBinding.FieldName = 'EKZ_DATE'
        end
      end
    end
    object cxLookupComboBoxPotok: TcxLookupComboBox
      Left = 11
      Top = 232
      Width = 174
      Height = 21
      TabStop = False
      AutoSize = False
      Properties.GridMode = True
      Properties.KeyFieldNames = 'ID_SP_POTOK'
      Properties.ListColumns = <
        item
          FieldName = 'SHORT_NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = DataSourcePotok
      Properties.OnChange = cxLookupComboBoxPotokPropertiesChange
      Style.Color = clInfoBk
      TabOrder = 2
      Visible = False
    end
    object cxLabelPotok: TcxLabel
      Left = 12
      Top = 214
      Width = 94
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.Transparent = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
      Visible = False
    end
  end
  inherited cxSplitter1: TcxSplitter
    Left = 399
    Top = 36
    Height = 387
  end
  inherited ActionListVuzLicense: TActionList
    inherited ActionAddCelPN: TAction
      Enabled = False
      Visible = False
    end
    inherited ActionChangeCelPN: TAction
      Enabled = False
      Visible = False
    end
    inherited ActionViewCelPN: TAction
      Enabled = False
      Visible = False
    end
    object ActionAddEkzRasp: TAction
      Caption = 'ActionAddEkzRasp'
      ImageIndex = 1
      ShortCut = 16429
      OnExecute = ActionAddEkzRaspExecute
    end
    object ActionChangeEkzRasp: TAction
      Caption = 'ActionChangeEkzRasp'
      ImageIndex = 4
      ShortCut = 113
      OnExecute = ActionChangeEkzRaspExecute
    end
  end
  inherited dxBarManagerVuzLicense: TdxBarManager
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = 'Custom 1'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 209
        FloatTop = 209
        FloatClientWidth = 84
        FloatClientHeight = 144
        ItemLinks = <
          item
            Item = dxBarLargeButtonAdd
            Visible = True
          end
          item
            Item = dxBarLargeButtonChange
            Visible = True
          end
          item
            Item = dxBarLargeButtonDel
            Visible = True
          end
          item
            Item = dxBarLargeButtonView
            Visible = True
          end
          item
            Item = dxBarLargeButtonVibrat
            Visible = True
          end
          item
            Item = dxBarLargeButtonObnov
            Visible = True
          end
          item
            Item = dxBarLargeButtonOtmena
            Visible = True
          end>
        Name = 'Custom 1'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = 'PlanSelNabor'
        DockControl = dxBarDockControl1
        DockedDockControl = dxBarDockControl1
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 276
        FloatTop = 213
        FloatClientWidth = 111
        FloatClientHeight = 144
        ItemLinks = <
          item
            Item = dxBarLargeButton1
            Visible = True
          end
          item
            Item = dxBarLargeButton2
            Visible = True
          end
          item
            Item = dxBarLargeButton4
            Visible = True
          end
          item
            Item = dxBarControlContainerItem1
            Visible = True
          end
          item
            Item = dxBarControlContainerItemPotok
            Visible = True
          end
          item
            Item = dxBarLargeButtonAddEkzRasp
            Visible = True
          end
          item
            Item = dxBarLargeButtonChangeEkzRasp
            Visible = True
          end
          item
            Item = dxBarLargeButton3
            Visible = True
          end>
        MultiLine = True
        Name = 'PlanSelNabor'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        ShowMark = False
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 419
    Top = 313
    DockControlHeights = (
      0
      0
      36
      0)
    object dxBarControlContainerItemPotok: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = cxLookupComboBoxPotok
    end
    object dxBarLargeButtonChangeEkzRasp: TdxBarLargeButton
      Action = ActionChangeEkzRasp
      Category = 0
      AutoGrayScale = False
    end
    object dxBarControlContainerItem1: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = cxLabelPotok
    end
    object dxBarLargeButtonAddEkzRasp: TdxBarLargeButton
      Action = ActionAddEkzRasp
      Category = 0
      AutoGrayScale = False
    end
  end
  inherited DataSourceCelPlanNabora: TDataSource
    Left = 484
    Top = 313
  end
  inherited DataSetCelPlanNabora: TpFIBDataSet
    Left = 452
    Top = 313
  end
  object DataSetPotok: TpFIBDataSet
    Database = DataBasePrKVuzLicense
    Transaction = TransactionReadPrKVuzLicense
    Left = 420
    Top = 271
    poSQLINT64ToBCD = True
  end
  object DataSourcePotok: TDataSource
    DataSet = DataSetPotok
    Left = 475
    Top = 271
  end
end
