inherited FormPRK_SP_SROK_OB: TFormPRK_SP_SROK_OB
  Caption = 'FormPRK_SP_SROK_OB'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGridPrKSpravOneLevel: TcxGrid
    inherited cxGridPrKSpravOneLevelDBTableView1: TcxGridDBTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      inherited colNAME: TcxGridDBColumn
        Width = 156
      end
      inherited colSHORT_NAME: TcxGridDBColumn
        Width = 132
      end
      object colYEARS_KOLVO: TcxGridDBColumn [2]
        Width = 96
        DataBinding.FieldName = 'YEARS_KOLVO'
      end
      object colMONTHES_KOLVO: TcxGridDBColumn [3]
        Width = 99
        DataBinding.FieldName = 'MONTHES_KOLVO'
      end
      inherited colKOD: TcxGridDBColumn
        Width = 65
      end
    end
  end
  inherited dxBarManager1: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockControlHeights = (
      0
      0
      40
      0)
  end
end
