inherited FormPRK_SP_OCENKA: TFormPRK_SP_OCENKA
  Caption = 'FormPRK_SP_OCENKA'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGridPrKSpravOneLevel: TcxGrid
    inherited cxGridPrKSpravOneLevelDBTableView1: TcxGridDBTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      inherited colNAME: TcxGridDBColumn
        Width = 162
      end
      inherited colSHORT_NAME: TcxGridDBColumn
        Width = 130
      end
      object colOCENKA_NUM: TcxGridDBColumn [3]
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 63
        DataBinding.FieldName = 'OCENKA_NUM'
      end
      object colIS_SPIVBESIDA: TcxGridDBColumn [4]
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.DisplayUnchecked = 'False'
        Properties.NullStyle = nssInactive
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 70
        DataBinding.FieldName = 'IS_SPIVBESIDA'
      end
      object colIS_ZALIK: TcxGridDBColumn [5]
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.DisplayUnchecked = 'False'
        Properties.NullStyle = nssInactive
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 61
        DataBinding.FieldName = 'IS_ZALIK'
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
