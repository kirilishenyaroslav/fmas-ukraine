inherited FormPRK_SP_FOB_PROT: TFormPRK_SP_FOB_PROT
  Left = 286
  Top = 194
  Caption = 'FormPRK_SP_FOB_PROT'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGridPrKSpravOneLevel: TcxGrid
    inherited cxGridPrKSpravOneLevelDBTableView1: TcxGridDBTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      inherited colNAME: TcxGridDBColumn
        Width = 133
      end
      inherited colSHORT_NAME: TcxGridDBColumn
        Width = 127
      end
      inherited colKOD: TcxGridDBColumn
        Width = 42
      end
      object colVINIT_PADEG: TcxGridDBColumn [3]
        Width = 124
        DataBinding.FieldName = 'VINIT_PADEG'
      end
      object colRODIT_PADEG: TcxGridDBColumn [4]
        Width = 122
        DataBinding.FieldName = 'RODIT_PADEG'
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
