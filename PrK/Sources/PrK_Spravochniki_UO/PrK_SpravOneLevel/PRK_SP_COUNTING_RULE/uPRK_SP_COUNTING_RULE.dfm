inherited FormPRK_SP_COUNTING_RULE: TFormPRK_SP_COUNTING_RULE
  Width = 519
  Height = 322
  Caption = 'FormPRK_SP_COUNTING_RULE'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxStatusBar1: TdxStatusBar
    Top = 275
    Width = 511
  end
  inherited cxGridPrKSpravOneLevel: TcxGrid
    Width = 511
    Height = 235
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
