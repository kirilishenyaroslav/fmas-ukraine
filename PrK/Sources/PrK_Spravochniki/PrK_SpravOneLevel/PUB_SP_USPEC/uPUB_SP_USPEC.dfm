inherited FormPUB_SP_USPEC: TFormPUB_SP_USPEC
  Caption = 'FormPUB_SP_USPEC'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGridPrKSpravOneLevel: TcxGrid
    inherited cxGridPrKSpravOneLevelDBTableView1: TcxGridDBTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      inherited colNAME: TcxGridDBColumn
        Width = 199
      end
      inherited colSHORT_NAME: TcxGridDBColumn
        Width = 148
      end
      inherited colKOD: TcxGridDBColumn
        Width = 74
      end
      object colMIN_PERELIK_SPEC_NAME: TcxGridDBColumn
        Caption = 'MIN_PERELIK_SPEC_NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 165
        DataBinding.FieldName = 'FIO'
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
