inherited FormPrK_SP_PREDM_u: TFormPrK_SP_PREDM_u
  Caption = 'FormPrK_SP_PREDM_u'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGridPrKSpravOneLevel: TcxGrid
    inherited cxGridPrKSpravOneLevelDBTableView1: TcxGridDBTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
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
