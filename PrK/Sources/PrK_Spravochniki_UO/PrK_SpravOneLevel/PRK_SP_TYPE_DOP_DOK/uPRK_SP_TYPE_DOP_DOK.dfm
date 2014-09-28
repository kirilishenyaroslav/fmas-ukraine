inherited FormPRK_SP_TYPE_DOP_DOK: TFormPRK_SP_TYPE_DOP_DOK
  Width = 522
  Height = 362
  Caption = 'FormPRK_SP_TYPE_DOP_DOK'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxStatusBar1: TdxStatusBar
    Top = 308
    Width = 514
  end
  inherited cxGridPrKSpravOneLevel: TcxGrid
    Width = 514
    Height = 268
    inherited cxGridPrKSpravOneLevelDBTableView1: TcxGridDBTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      inherited colNAME: TcxGridDBColumn
        Width = 129
      end
      inherited colSHORT_NAME: TcxGridDBColumn
        Visible = False
        Width = 54
      end
      object colNAME_VEDOM_TYPE: TcxGridDBColumn [2]
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 118
        DataBinding.FieldName = 'SHORT_NAME_VEDOM_TYPE'
      end
      object colNAME_PREDM: TcxGridDBColumn [3]
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 132
        DataBinding.FieldName = 'SHORT_NAME_PREDM'
      end
      object colIS_OCENKA: TcxGridDBColumn [4]
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.NullStyle = nssInactive
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 50
        DataBinding.FieldName = 'IS_OCENKA'
      end
      object colIS_NO_ROZPISKA: TcxGridDBColumn [5]
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Width = 43
        DataBinding.FieldName = 'IS_NO_ROZPISKA'
      end
      inherited colKOD: TcxGridDBColumn
        Width = 40
      end
    end
  end
  inherited dxBarManager1: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Top = 72
    DockControlHeights = (
      0
      0
      40
      0)
  end
end
