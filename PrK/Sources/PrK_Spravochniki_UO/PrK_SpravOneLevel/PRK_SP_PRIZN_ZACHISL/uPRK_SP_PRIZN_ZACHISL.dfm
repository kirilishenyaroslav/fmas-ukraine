inherited FormPRK_SP_PRIZN_ZACHISL: TFormPRK_SP_PRIZN_ZACHISL
  Caption = 'FormPRK_SP_PRIZN_ZACHISL'
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
