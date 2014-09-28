inherited FormPRK_SP_OCENKA: TFormPRK_SP_OCENKA
  Left = 123
  Top = 192
  Width = 767
  Caption = 'FormPRK_SP_OCENKA'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxStatusBar1: TdxStatusBar
    Width = 759
  end
  inherited cxGridPrKSpravOneLevel: TcxGrid
    Width = 759
    inherited cxGridPrKSpravOneLevelDBTableView1: TcxGridDBTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      inherited colNAME: TcxGridDBColumn
        SortOrder = soAscending
        Width = 196
      end
      inherited colSHORT_NAME: TcxGridDBColumn
        Width = 141
      end
      inherited colKOD: TcxGridDBColumn
        Width = 55
      end
      object colOCENKA_NUM: TcxGridDBColumn [3]
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 96
        DataBinding.FieldName = 'OCENKA_NUM'
      end
      object colIS_NEGATIVE: TcxGridDBColumn [4]
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.NullStyle = nssInactive
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 118
        DataBinding.FieldName = 'IS_NEGATIVE'
      end
      object colIS_SPIVBESIDA: TcxGridDBColumn [5]
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.DisplayUnchecked = 'False'
        Properties.NullStyle = nssInactive
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 82
        DataBinding.FieldName = 'IS_SPIVBESIDA'
      end
      object colIS_ZALIK: TcxGridDBColumn [6]
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.DisplayUnchecked = 'False'
        Properties.NullStyle = nssInactive
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 73
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
