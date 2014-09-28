inherited FormPRK_SP_GOD_NABORA: TFormPRK_SP_GOD_NABORA
  Caption = 'FormPRK_SP_GOD_NABORA'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGridPrKSpravOneLevel: TcxGrid
    inherited cxGridPrKSpravOneLevelDBTableView1: TcxGridDBTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      inherited colNAME: TcxGridDBColumn
        Width = 167
      end
      inherited colSHORT_NAME: TcxGridDBColumn
        Width = 133
      end
      inherited colKOD: TcxGridDBColumn
        Width = 54
      end
      object colDATE_BEGIN: TcxGridDBColumn [3]
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 98
        DataBinding.FieldName = 'DATE_BEGIN'
      end
      object colDATE_END: TcxGridDBColumn [4]
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 96
        DataBinding.FieldName = 'DATE_END'
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
